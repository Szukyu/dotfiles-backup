VOLUME=$INFO

if [[ -z $VOLUME ]]; then
  exit 0
fi

case ${VOLUME} in
  [6-9][0-9] | 100)
    ICON="󰕾"
    ICON_COLOR=0xff58d1fc
    ;;
  [2-5][0-9])
    ICON="󰖀"
    ICON_COLOR=0xfff5a97f
    ;;
  [1-9] | [1][0-9])
    ICON="󰕿"
    ICON_COLOR=0xffa6da95 
    ;;
  0)
    ICON="󰖁"
    ICON_COLOR=0xffed8796
    ;;
esac

sketchybar --set "$NAME" \
  icon="$ICON" \
  label="$VOLUME%" \
  icon.color="$ICON_COLOR"

