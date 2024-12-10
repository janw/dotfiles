set localdir (dirname (status --current-filename))

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    if test "$ASCIINEMA_REC" = "1"
        set -gx STARSHIP_CONFIG ~/.config/starship-minimal.toml
    end

    if command -v starship >/dev/null
        starship init fish | source
    end
    if command -v direnv >/dev/null
        direnv hook fish | source
    end
end

for file in $localdir/local.d/*.fish
    source $file
end
