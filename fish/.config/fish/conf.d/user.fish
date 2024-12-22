set -gx http_proxy http://localhost:7890
set -gx https_proxy $http_proxy
# set -gx ALL_PROXY $http_proxy
# TODO: FIX IT 
# if test -n $SSH_CONNECTION 
#   set -gx EDITOR vim
# else
#   set -gx EDITOR nvim
# end
if set -q SSH_CONNECTION;
  set -gx EDITOR vim;
else
  set -gx EDITOR lvim
end
set -gx GOPROXY https://goproxy.io,direct
set -gx GOBIN  ~/.local/bin
set -gx GOPATH  ~/Repos/gopath
set -gx PATH $PATH $GOBIN 
set -gx fish_escape_delay_ms 32
set -gx fish_greeting 

set -gx polybar_path /home/aurora/.config/polybar

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
