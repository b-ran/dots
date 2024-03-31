while true; do
    result=$(
        rofi -dmenu \
            -kb-custom-1 "Control-r" \
            -kb-custom-2 "Alt-r" \
            -theme-str 'entry { placeholder: " Search | Ctrl+R remove entry | Alt+R del all"; }' \
            -config ~/.config/rofi/themes/single-wide.rasi < <(cliphist list)
    )

    case "$?" in
        1)
            exit
            ;;
        0)
            case "$result" in
                "")
                    continue
                    ;;
                *)
                    cliphist decode <<<"$result" | wl-copy
                    exit
                    ;;
            esac
            ;;
        10)
            cliphist delete <<<"$result"
            ;;
        11)
            cliphist wipe
            ;;
    esac
done