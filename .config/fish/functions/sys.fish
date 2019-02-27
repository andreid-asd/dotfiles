function sys -a cmd -d "Check for errors and clean pacman"
    switch "$cmd"
        case "wall"
            sxiv "$HOME/work-luke/wallpapers/Future/"
        case "upgrade"
            notify 'System upgrade' 'Running: pacman -Syyuv --noconfirm' && \
            neofetch && \
            sudo pacman -Syyuv --noconfirm && \
            notify 'System upgrade complete'

            # update i3blocks if running 
            if pgrep -f i3blocks > /dev/null
                pkill -SIGRTMIN+11 i3blocks
            end
        case "check"
            echo-head "Failed systemd services..."
            sudo systemctl --failed

            echo-head "Errors in logfiles..."
            sudo journalctl -p 3 -xb --no-pager

            echo-head "Removing orphan packages..."
            sudo pacman -Rns (pacman -Qtdq)

            echo-head "Clear pacman cache..."
            sudo paccache -r && paccache -ruk0
        case "reload"
            source ~/.config/fish/config.fish 
            xrdb ~/.Xresources
        case "lock"
            i3lock -i "$HOME/wall.png" -n -b
    end
end