#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#export http_proxy="http://127.0.0.1:7890/"
#export HTTP_PROXY="http://127.0.0.1:7890/"
#export https_proxy=$http_proxy
#export HTTPS_PROXY=$http_proxy
#export ftp_proxy=$http_proxy
#export FTP_PROXY=$http_proxy
#export rsync_proxy=$http_proxy
#export RSYNC_PROXY=$http_proxy
#export SOCKS_PROXY="socks5://127.0.0.1:7891/"
#export socks_proxy=$SOCKS_PROXY
#export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
#export all_proxy=$SOCKS_PROXY

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

