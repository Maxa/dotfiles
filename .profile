# .profile
# settings for login shells

export PATH="${PATH}:$HOME/bin:$HOME/.local/bin"

# start X or tmux in special ttys

if [[ "$TERM" = linux ]]; then
	case $(tty) in
		/dev/tty1) startx &>/tmp/Xorg.log; logout ;;
		/dev/tty2|/dev/tty3)
		tmux has -t console >/dev/null 2>&1 || tmux source .tmux.console >/dev/null 2>&1
		tmux has -t console >/dev/null 2>&1 || tmux -f .tmux.console start >/dev/null 2>&1
		tmux at -d -t console
		logout ;;
	esac
fi
