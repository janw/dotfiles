
if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    if command -v starship >/dev/null
        starship init fish | source
    end
end
