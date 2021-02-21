alias a='alias'
alias ls='ls --color=auto'
alias la='ls -A'
alias lla='ls -lA'
alias l='ls -CF'

NVIM=nvim
NVIM_NIGHTLY=~/.config/sandbox/nvim-nightly/nvim-linux64/bin/nvim
alias vi="$NVIM"
alias vim="$NVIM_NIGHTLY"
alias em='emacs'


alias lg='lazygit'
alias ra='ranger'


alias proxys="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890 && curl ip.sb"
alias proxyu="unset http_proxy https_proxy all_proxy && curl ip.sb"

# pacman
alias spsyu="sudo pacman -Syu"
alias sps="sudo pacman -S "
alias spss="sudo pacman -Ss "
alias spr="sudo pacman -R "


# Search your history
alias h='history | grep'

# Find a file?
alias f="find . | grep"

# Search running processe
alias p="ps aux | grep"

# Search a font
alias fcl="fc-list"
alias fcg="fc-list | grep"

# Search where an alias was defined(eg. falias 'git pull')
alias falias='zsh -ixc : 2>&1 | grep'

# Search using grep
# __grep_file() { grep -iRl $1 ./ }
__grep_file() { grep -iR $1 ./ }
alias g=__grep_file
