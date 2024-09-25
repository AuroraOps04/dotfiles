set -gx http_proxy http://localhost:7890
set -gx https_proxy $http_proxy
set -gx ALL_PROXY "socks5://localhost:7891"
# TODO: FIX IT 
# if test -n $SSH_CONNECTION 
#   set -gx EDITOR vim
# else
#   set -gx EDITOR nvim
# end
set -gx EDITOR nvim
set -gx GOPROXY https://goproxy.io,direct
set -gx GOBIN  ~/.local/bin
set -gx GOPATH  ~/Repos/gopath
set -gx PATH $PATH $GOBIN 
set -gx fish_escape_delay_ms 32
set -gx fish_greeting 

 set -gx polybar_path /home/aurora/.config/polybar

