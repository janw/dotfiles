## Fish port of
## https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/dotenv/dotenv.plugin.zsh
status --is-interactive || exit

# Filename of the dotenv file to look for
set -g _fish_dotenv_file .env

# Path to the file containing allowed paths
set -g _fish_dotenv_allowlist "$__fish_config_dir/cache/dotenv-allowed.list"
set -g _fish_dotenv_blocklist "$__fish_config_dir/cache/dotenv-blocked.list"

# make sure there is an (dis-)allowed file
mkdir -p "$__fish_config_dir/cache"
touch "$_fish_dotenv_allowlist"
touch "$_fish_dotenv_blocklist"

set -g _fish_dotenv_confirm_msg "dotenv: Found '$_fish_dotenv_file' file. Source it? ([N]o/[y]es/[a]lways/n[e]ver) "

## Functions
function _gen_fish_dotenv_file
    set env_file $argv[1]
    test -r $env_file || echo "dotenv: Cannot read file '$env_file'." >&2

    while read -l line
        set trimmed_line (string replace -r '^\s*export\s+' '' -- $line)
        if ! string match -q --regex -- '^\s*[a-zA-Z0-9_]+=' "$trimmed_line"
            continue
        end

        set kv (string split -m 1 = -- $trimmed_line)
        set key $kv[1]
        set val $kv[2]
        echo "set -gx $key \"$val\";"
    end <$env_file
end


function _fish_dotenv_hook --on-variable PWD
    [ -f "$_fish_dotenv_file" ] || return
    set -f dirpath "$PWD"

    if command grep -Fx -q "$dirpath" "$_fish_dotenv_blocklist" &>/dev/null
        echo "dotenv: Not sourcing." >&2
        return
    end

    # Check if .env file is allowed or ask for confirmation
    if ! command grep -Fx -q "$dirpath" "$_fish_dotenv_allowlist" &>/dev/null
        read -n 1 -f confirmation --prompt-str=$_fish_dotenv_confirm_msg
        switch "$confirmation"
            case y Y
                # Noop
            case a A
                echo "dotenv: Adding to allowlist" >&2
                echo "$dirpath" >>"$_fish_dotenv_allowlist"
            case e E
                echo "dotenv: Adding to blocklist" >&2
                echo "$dirpath" >>"$_fish_dotenv_blocklist"
                return
            case '*'
                echo "dotenv: Not sourcing." >&2
                return
        end
    end

    echo "dotenv: Sourcing '$_fish_dotenv_file'" >&2
    set -l dotenv_content (_gen_fish_dotenv_file $_fish_dotenv_file)

    # Check generated syntax
    if ! fish --private -n -c "$dotenv_content"
        echo "dotenv: Error sourcing '$_fish_dotenv_file' file" >&2
        return 1
    end

    source (echo $dotenv_content|psub)

end

_fish_dotenv_hook
