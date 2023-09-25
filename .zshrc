# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=("af-magic" "jonathan")

# 取消下面一行的注释以使用区分大小写的补全。
CASE_SENSITIVE="true"

# 取消下面一行的注释以使用连字符不敏感的补全。
# Case-sensitive completion must be off.
# _和-可以互换。
# HYPHEN_INSENSITIVE="true"

# 取消下面一行的注释以禁用双周自动更新检查。
# DISABLE_AUTO_UPDATE="true"

# 取消下面一行的注释以自动更新，不提示。
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# 如果粘贴url和其他文本弄乱了，请取消下面一行的注释。
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# 取消注释下一行以在等待完成时显示红点。
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    #----------------------
    #: brief: git alias
    #: how to run: see $ZSH/plugins/git/README.md
	git
    #----------------------
    z
    gitfast
	# docker 
	#     docker-compose
	# golang
	sudo     #自动添加sudo ,两下esc
	extract #万能解压 x 压缩包名
	ripgrep
    kubectl
	zsh-autosuggestions # custom plugin
	zsh-syntax-highlighting # custom plugin
    you-should-use # custom plugin (git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use)
    #----------------------
    #: brief: show all shortcuts
    #: how to run: acs
    aliases
    #----------------------
    #: requirement: dnfi autojump-zsh
    #: brief: cd directory faster
    #: how to run: j jc jo jco
    autojump
    #----------------------
    #: brief: copy CLI command to clipboard
    #: how to run: <c-o>
    copybuffer
    #----------------------
    #: brief: copy file contents to clipboard
    #: how to run: copyfile
    copyfile
    #----------------------
    #: brief: copy file absolutely path to clipboard
    #: how to run: copypath
    copypath
    #----------------------
    #: brief: see follow bindkey
    dircycle
    #----------------------
    #: requirement: dnfi direnv
    #: brief: cd directory auto set different environment
    #: how to run: vim .envrc and direnv allow
    direnv
    #----------------------
    #: brief: open browser in terminal
    #: how to run: some alias in $ZSH/plugins/frontend-search/README.md
    web-search
    #----------------------
    #: brief: gitignore file template
    #: how to run: gi list | gi [templatename] | git [templatename ] >> .gitconfig
    gitignore
    #----------------------
    #: brief: golang alias
    #: how to run: see $ZSH/plugins/golang/README.md
    # golang
    #----------------------
)

# zsh autopair custom plugin
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# you can add your own zsh config file in any directory, add source it in this way.
# [ -f ~/github/zsh/sources/my_pc.zsh ] && source ~/github/zsh/sources/my_pc.zsh
# [ -f ~/github/zsh/sources/vastai_pc.zsh ] && source ~/github/zsh/sources/vastai_pc.zsh 

#: --------------------------------------------- alias
## vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
## dnf
alias dnfi="sudo dnf install -y "
alias dnfr="sudo dnf remove "
alias dnfs="sudo dnf search "
## ls
alias ls='lsd'
alias lsl='ls -lh'
alias lsa='ls -a'
alias lst='ls --tree'
## mkdir
alias mkdir='mkdir -p'
## rm
alias rm='rm -fvi'
alias rmdir='rm -frv'
## mv
alias mv='mv -i'
## clear
alias c='clear;'
## nc scan tcp or udp port
alias nctcp='nc -vz -w10'
alias ncudp='nc -vzu -w10'
## directory stack
alias pd='pushd'
alias dp='popd'
## colour cat
alias cat='bat'
## tldr 
##! please install manually
# alias tldr='tldr -t ocean'
## calcurse for plan
alias calp='calcurse'
## weather reporter
alias wea='curl wttr.in'
## du pro
alias dup='dust'
## df pro
alias dfp='duf'
## copy to clipboard ---- shell command useful
alias pbcopy='xsel --clipboard --input'
## paste from clipboard ---- shell command useful
alias pbpaste='xsel --clipboard --output'
## xdg-open any
alias open='xdg-open'
## kitty view image/directory
alias icat='kitty +kitten icat '
## screen saver
alias lock='xlock -mode random'
## cd
alias cdd='cd ~/Downloads/'
## cmake
alias cmakeb='cmake -H. -Bbuild'
alias cmaker='cmake --build . --target'
##! please install manually
alias docker='sudo docker'
alias dr='docker run -itd'
alias de='docker exec -it'
alias dcp='docker container prune'
alias dip='docker image prune'
alias ds='docker stop'
## private env
alias nla='v ~/github/note/linux/all.sh'
alias nlv='v ~/github/note/linux/nvim.sh'
alias nlc='v ~/github/note/linux/command.sh'
alias nlk='v ~/github/note/linux/kernel.sh'
alias nlt='cd ~/github/note/tools'
alias np='v ~/github/note/passwd/note.sh'
alias n='v ~/github/note/personal/note.md'
## sapt
alias gptc='sgpt --code'
alias gpt='sgpt'
#: --------------------------------------------- end alias

#: --------------------------------------------- export
## man retry to nvim
export MANPAGER='nvim +Man!'
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
## update default editor,don't use nano
export EDITOR=nvim
## clash proxy
# export http_proxy=http://127.0.0.1:7890 && export https_proxy=http://127.0.0.1:7890
# unset http_proxy && unset https_proxy
export PATH=$HOME/.config/nvim/bin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
## openai api key
# export OPENAI_API_KEY=
#: --------------------------------------------- end export


#: --------------------------------------------- function
for i in {0..9}; do bindkey -r "^[$i"; done
## cd cnd ls
function cl { cd $1; ls; }
## cd using dir stack
function cs(){
    cd -$1
    ls
}
## auto extract
function autoe() {
if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar -xvjf $1    ;;
        *.tar.gz)    tar -xvzf $1    ;;
        *.tar.xz)    tar -xvJf $1    ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       rar x $1       ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar -xvf $1     ;;
        *.tbz2)      tar -xvjf $1    ;;
        *.tgz)       tar -xvzf $1    ;;
        *.zip)       unzip -O cp936 $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
fi
}
## auto compress
function autoc() {
if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
        *.tar) shift && tar -cf $FILE $* ;;
        *.tar.bz2) shift && tar -cjf $FILE $* ;;
        *.tar.xz) shift && tar -cJf $FILE $* ;;
        *.tar.gz) shift && tar -czf $FILE $* ;;
        *.tgz) shift && tar -czf $FILE $* ;;
        *.zip) shift && zip $FILE $* ;;
        *.rar) shift && rar $FILE $* ;;
        esac
    else
        echo "usage: q-compress <foo.tar.gz> ./foo ./bar"
    fi
}
## docker list all tag of image
function dlt(){
    wget -q https://registry.hub.docker.com/v1/repositories/$1/tags -O - | \
    jq -r '.[].name'
}
#: --------------------------------------------- end function

#: --------------------------------------------- binkkey
## d list move <c-s> <c-k>
bindkey -M emacs "^S" insert-cycledleft
bindkey -M viins "^S" insert-cycledleft
bindkey -M vicmd "^S" insert-cycledleft
bindkey -M emacs "^K" insert-cycledright
bindkey -M viins "^K" insert-cycledright
bindkey -M vicmd "^K" insert-cycledright
## fast go to last directory
bindkey -s '^V' 'cd ..\n'
#:---------------------------------------------- end bingkey
#
#: --------------------------------------------- cargo
source "$HOME/.cargo/env"
# Shell-GPT integration ZSH v0.1
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh
# Shell-GPT integration ZSH v0.1
