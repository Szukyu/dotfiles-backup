ICON_COLOR=0xffff7f17

case $INFO in
  "Cursor")
    ICON_PADDING_RIGHT=2
    ICON_COLOR=0xff22a1f0
    ICON=󰨞
    ;;
  "Calendar")
    ICON=
    ;;
  "Finder")
    ICON_COLOR=0xff40b9ff
    ICON=󰀶
    ;;
  "Safari")
    ICON=󰀹
    ;;
  "Messages")
    ICON=󰍦
    ;;
  "Preview")
    ICON_COLOR=0xff137DF8
    ICON=
    ;;
  "WezTerm")
    ICON=
    ;;
  "System Settings")
    ICON=
    ;;
  "Roblox")
    ICON=
    ;;
  "League of Legends")
    ICON=
    ;;
  "Discord")
    ICON=
    ;;
  *)
    INFO="Unknown"
    ICON_COLOR=0xffff94c6
    ICON=﯂
    ;;
esac

sketchybar --set $NAME \
  icon=$ICON icon.color=$ICON_COLOR \
  label="$INFO"
