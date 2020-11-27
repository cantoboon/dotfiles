# .bashrc is called on ALL new shells


# Powerline setup: https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup#set-up-powerline-in-wsl-ubuntu
GOPATH=$HOME/go
function _update_ps1() {
        PS1="$($GOPATH/bin/powerline-go -error $? -colorize-hostname -newline)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1"
fi
