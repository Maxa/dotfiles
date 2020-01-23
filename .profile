# .profile
# settings for login shells

export EVENT_NOEPOLL="1"
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export OOO_FORCE_DESKTOP="gnome"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export PATH="$PATH:/usr/local/bin:$HOME/bin"

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
