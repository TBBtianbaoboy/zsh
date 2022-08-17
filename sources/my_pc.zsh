## Golang
export GOPATH="$HOME/go"
export GOBINPATH="$HOME/go/bin"
export GOPROXY=https://goproxy.io,direct
export GO111MODULE=on
## k8s
export KUBECONFIG=/etc/kubernetes/admin.conf
## minikube
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24
## grpc config
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=/usr/local/lib
## node
export PATH=$PATH:/usr/local/node/bin
## grpc
export PATH=$PATH:/home/aico/go/bin

## private env
alias nla='v ~/github/note/linux/all.sh'
alias nlv='v ~/github/note/linux/nvim.sh'
alias nlc='v ~/github/note/linux/command.sh'
alias nlk='v ~/github/note/linux/kernel.sh'
alias nlt='cd ~/github/note/tools'
alias np='v ~/github/note/passwd/note.sh'
alias n='v ~/github/note/personal/note.md'
## redis client
alias redis='sudo /snap/bin/redis-desktop-manager.rdm'

source /home/aico/.config/broot/launcher/bash/br
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aico/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aico/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aico/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aico/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
