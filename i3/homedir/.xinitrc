
# screen setup
xrandr --output DP-0 --left-of HDMI-0 --auto
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx&
export _JAVA_AWT_WM_NONREPARENTING=1
exec $1
exec i3
# wmname LG3D
# exec dwm
