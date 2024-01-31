#!/bin/bash

RED='\033[0;31m' #Red Color 
GREEN='\033[0;32m' #Green Color 
YELLOW='\033[1;33m' #Yellow Color 
NC='\033[0m' # No Color
#------------------------------------------------------------------------------
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
ZSH="$HOME/.oh-my-zsh"
VERSION="1.2.1"
MATAINER="Aico:(https://github.com/TBBtianbaoboy)"
#------------------------------------------------------------------------------
function warming() {
    echo -e "${YELLOW}$1${NC}"
}
function success() {
    echo -e "${GREEN}$1${NC}"
}
function error() {
    echo -e "${RED}$1${NC}"
}

function check_command() {
    if [ -x "$(command -v $1)" ]; then
        success "$1 is exists in $(command -v $1)"
        return 1
    else
        error "$1 is not installed"
        return 0
    fi
}

function check_dir() {
    if [ ! -d $1 ]; then
        return 0
    fi
    return 1
}

function run_command() {
    if ! $1 > /dev/null; then
        error " Run command failed: $1"
        return 0
    else
        return 1
    fi
}
#------------------------------------------------------------------------------
function usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -i, --install              Install oh-my-zsh"
    echo "  -h, --help                 Show help message"
    echo "  -v, --version              Show version"
}
#------------------------------------------------------------------------------ main
function dnf_check() {
    if [ "$1" == "autojump-zsh" ]; then
        check_command "autojump"
    elif [ "$1" == "xlockmore" ]; then
        check_command "xlock"
    else
        check_command "$1"
    fi
    if [ $? -eq 0 ]; then
        run_command "sudo dnf install -y $1"
        if [ $? -eq 1 ]; then
            success "Successfully installed $1 in $(command -v $1)"
        fi
        exit 1
    fi
}
#------------------------------------------------------------------------------
function cargo_check() {
    if [ $1 == "du-dust" ]; then
        check_command "dust"
    else
        check_command $1
    fi
    if [ $? -eq 0 ]; then
        run_command "cargo install $1"
        if [ $? -eq 1 ]; then
            success "Successfully installed $1 in $(command -v $1)"
        fi
    fi
}

#neovim-------all platform
function nvim_install() {
    check_command $1
    if [ $? -eq 0 ]; then
        run_command "sudo curl -o /usr/local/bin/nvim -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
        run_command "sudo chmod +x /usr/local/bin/nvim"
        if [ $? -eq 1 ]; then
            success "Successfully installed $1 in $(command -v $1)"
        fi
    fi
}
#------------------------------------------------------------------------------
function custom_plugin_install() {
    run_command "git clone https://github.com/zsh-users/$1.git $ZSH_CUSTOM/plugins/$1"
    if [ $? -eq 1 ]; then
        success "Successfully install zsh plugin $1 in $ZSH_CUSTOM/plugins"
    else
        error "Failed to install zsh plugin $1 in $ZSH_CUSTOM/plugins"
    fi
}

#------------------------------------------------------------------------------ main
function zsh_env_check_and_install() {
    check_dir $ZSH
    # @Annotation: if zsh is not installed, install it
    if [ $? -eq 0 ]; then
        error "zsh script is not installed, install it now..."
        sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
        if [ $? -eq 1 ]; then
            success "Successfully install zsh script"
        else
            error "Failed to install zsh script"
            exit 1
        fi
    else
        success "zsh script is exists in $ZSH"
    fi
    # @Annotation: install zsh config file
    if [ -f $HOME/.zshrc ]; then
        echo "copy .zshrc to $HOME/.zshrc?(y/n)"
        read -n 1 -p " " input
        if [ $input == "y" ]; then
            cp $HOME/.zshrc $HOME/.zshrc.bak
            run_command "cp .zshrc $HOME/.zshrc"
            if [ $? -eq 1 ]; then
                success "Successfully copying .zshrc config file to $HOME/.zshrc"
            else
                error "Failed copying .zshrc config file to $HOME/.zshrc"
                exit 1
            fi
        fi
        success "Successfully backup $HOME/.zshrc to $HOME/.zshrc.bak"
    else 
        cp .zshrc $HOME/.zshrc
        success "Successfully copying .zshrc config file to $HOME/.zshrc"
    fi
    # @Annotation: install zsh custom plugins
    if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
        custom_plugin_install zsh-autosuggestions
    else
        success "zsh plugin zsh-autosuggestions is already installed in $ZSH_CUSTOM/plugins"
    fi
    if [ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
        custom_plugin_install zsh-syntax-highlighting
    else
        success "zsh plugin zsh-syntax-highlighting is already installed in $ZSH_CUSTOM/plugins"
    fi
    if [ ! -d $HOME/.fzf ];then
        git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
        run_command "$HOME/.fzf/install"
        if [ $? -eq 1 ]; then
            success "Successfully installed fzf"
        else
            error "Failed to install fzf"
        fi
    else
        success "fzf is exists in $HOME/.fzf"
    fi
}

function main() {
    if [ $# -eq 0 ]; then
        usage
        exit 0
    fi
    while [ $# -gt 0 ]; do
        case $1 in
            -h | --help)
                usage
                exit 0
                ;;
            -v | --verbose)
                echo $VERSION $MATAINER
                exit 0
                ;;
            -i | --install)
                dnf_check "zsh" # zsh
                dnf_check "git" # for install oh-my-zsh
                dnf_check "wget" # for install oh-my-zsh
                zsh_env_check_and_install # zsh
                dnf_check "lsd" # ls with syntax highlight
                nvim_install "nvim" # neovim
                dnf_check "autojump-zsh" # for autojump
                dnf_check "direnv" # for .envrc
                dnf_check "calcurse" # calendar
                dnf_check "bat" # cat with syntax highlight
                dnf_check "duf" # disk usage
                dnf_check "xlockmore" # for lock screen
                dnf_check "xsel" # for copy to system clipboard
                dnf_check "cargo" # for install du-dust
                dnf_check "cmake" # for install coc.nvim
                dnf_check "jq" # json query
                dnf_check "navi" # cli cheatsheet
                dnf_check "hexyl" # 十六进制查看器
                # cargo_check "du-dust"
                # dnf_check "kitty"
                ;;
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
        shift
    done
}
main $@
