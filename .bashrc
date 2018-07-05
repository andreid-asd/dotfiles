export PATH=$PATH:$HOME/.scripts
export EDITOR="nano"
export TERMINAL="st"
export BROWSER="firefox"

stty -ixon

#Allows you to cd into directory merely by typing the directory name.
# shopt -s autocd

#Generic shortcuts:
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsboat"
alias email="neomutt"
alias files="ranger"
alias chat="weechat"
alias audio="ncpamixer"
alias calender="calcurse"

# System Maintainence
alias mw="~/.config/mutt/mutt-wizard.sh"
alias muttwizard="~/.config/mutt/mutt-wizard.sh"

# List programs I've installed
alias progs="(pacman -Qet && pacman -Qm) | sort -u"

# List orphan programs
alias pacman-orphans="pacman -Qdt"

# Remove orphan programs
alias pacman-rm-orphans="sudo pacman -Rns $(pacman -Qtdq)"
alias upgr="notify-send -i ~/.scripts/larbs.png 'Upgrade started' & neofetch && sudo packer -Syyuv --noconfirm && notify-send -i ~/.scripts/larbs.png 'Upgrade complete'."

# Refresh wifi
alias newnet="sudo systemctl restart NetworkManager"

# Le Redditfetch
alias nf="clear && neofetch"

#Install an AUR package manually (for Parabola to get AUR access):
aurinstall() {
    curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;
}
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases
alias gitup="git push origin master"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias rf="source ~/.bashrc"

# Refresh shortcuts manually and reload bashrc
alias ref="shortcuts.sh && source ~/.bashrc"

# Adding color
alias ls='ls -alhN --color=auto --group-directories-first'
alias crep="grep --color=always" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=xterm256" #Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"
alias starwars="telnet towel.blinkenlights.nl"
alias tpbs="clear && figlet -c TPB Search && tpb.sh" # Pirate Bay search

# TeX
alias Txa="cp ~/Documents/LaTeX/article.tex"
alias Txs="cp ~/Documents/LaTeX/beamer.tex"
alias Txh="cp ~/Documents/LaTeX/handout.tex"
alias TC='texclear'

# Audio and Music
alias mute="pamixer -m"
alias unmute="pamixer -u"
alias vu="pamixer --allow-boost -i 5"
alias vd="pamixer --allow-boost -d 5"
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"

source ~/.bash_shortcuts
source ~/.bash_npm
source ~/.bash_git-prompt

##
## nvm
##
export NVM_DIR="$HOME/.nvm"

# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

##
## Start ui after login
##
if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep i3 || startx
fi