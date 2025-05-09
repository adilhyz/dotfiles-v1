#!/usr/bin/env bash
#╺┳╸╻ ╻┏━╸┏┳┓┏━╸
# ┃ ┣━┫┣╸ ┃┃┃┣╸ 
# ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## This file will configure the options
## and launch the bars corresponding to each theme.

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice

# Terminate or reload existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash
. "$HOME"/.config/bspwm/rices/"$RICE"/theme-config.bash
. "$HOME"/.config/bspwm/src/WallEngine.bash

## Theme 
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration
apply_bspwm_config() {
	bspc config border_width ${BORDER_WIDTH}
	bspc config top_padding ${TP}
	bspc config bottom_padding ${BP}
	bspc config normal_border_color ${NORMAL_BC}
	bspc config active_border_color ${ACTIVE_BC}
	bspc config focused_border_color ${FOCUSED_BC}
	bspc config presel_feedback_color ${PRESEL_BC}
	bspc config left_padding ${LP}
	bspc config right_padding ${RP}
	bspc config window_gap ${WG}
}

# Terminal colors
apply_term_config() {
	# Alacritty
	sed -i "$HOME"/.config/alacritty/fonts.toml \
		-e "s/size = .*/size = $term_font_size/" \
		-e "s/family = .*/family = \"$term_font_name\"/"

	cat >"$HOME"/.config/alacritty/rice-colors.toml <<-EOF
		# Default colors
		[colors.primary]
		background = "${bg}"
		foreground = "${fg}"

		# Cursor colors
		[colors.cursor]
		cursor = "${fg}"
		text = "${bg}"

		# Normal colors
		[colors.normal]
		black = "${black}"
		red = "${red}"
		green = "${green}"
		yellow = "${yellow}"
		blue = "${blue}"
		magenta = "${magenta}"
		cyan = "${cyan}"
		white = "${white}"

		# Bright colors
		[colors.bright]
		black = "${blackb}"
		red = "${redb}"
		green = "${greenb}"
		yellow = "${yellowb}"
		blue = "${blueb}"
		magenta = "${magentab}"
		cyan = "${cyanb}"
		white = "${whiteb}"
	EOF

	# Kitty
	kitten themes --reload-in=all ${RICE}
}

# Set compositor configuration
apply_picom_config() {
	picom_conf_file="$HOME/.config/bspwm/src/config/picom.conf"
	picom_animations_file="$HOME/.config/bspwm/src/config/picom-animations.conf"

	sed -i "$picom_conf_file" \
		-e "s/shadow-color = .*/shadow-color = \"${SHADOW_C}\"/" \
		-e "s/^corner-radius = .*/corner-radius = ${P_CORNER_R}/" \
		-e "/#-term-opacity-switch/s/.*#-/\t\topacity = $P_TERM_OPACITY;\t#-/" \
		-e "/#-shadow-switch/s/.*#-/\t\tshadow = ${P_SHADOWS};\t#-/" \
		-e "/#-fade-switch/s/.*#-/\t\tfade = ${P_FADE};\t#-/" \
		-e "/#-blur-switch/s/.*#-/\t\tblur-background = ${P_BLUR};\t#-/" \
		-e "/picom-animations/c\\${P_ANIMATIONS}include \"picom-animations.conf\""

	sed -i "$picom_animations_file" \
		-e "/#-dunst-close-preset/s/.*#-/\t\t\tpreset = \"${dunst_close_preset}\";\t#-/" \
		-e "/#-dunst-close-direction/s/.*#-/\t\t\tdirection = \"${dunst_close_direction}\";\t#-/" \
		-e "/#-dunst-open-preset/s/.*#-/\t\t\tpreset = \"${dunst_open_preset}\";\t#-/" \
		-e "/#-dunst-open-direction/s/.*#-/\t\t\tdirection = \"${dunst_open_direction}\";\t#-/"
}

# Set dunst notification daemon config
apply_dunst_config() {
	dunst_config_file="$HOME/.config/bspwm/src/config/dunstrc"

	sed -i "$dunst_config_file" \
		-e "s/origin = .*/origin = ${dunst_origin}/" \
		-e "s/offset = .*/offset = ${dunst_offset}/" \
		-e "s/transparency = .*/transparency = ${dunst_transparency}/" \
		-e "s/^corner_radius = .*/corner_radius = ${dunst_corner_radius}/" \
		-e "s/frame_width = .*/frame_width = ${dunst_border}/" \
		-e "s/frame_color = .*/frame_color = \"${dunst_frame_color}\"/" \
		-e "s/separator_color = .*/separator_color = \"${dunst_frame_color}\"/" \
		-e "s/separator_color = .*/separator_color = \"${dunst_separator_color}\"/g" \
		-e "s/font = .*/font = ${dunst_font}/" \
		-e "s/foreground='.*'/foreground='${dunst_fg}'/" \
		-e "s/icon_theme = .*/icon_theme = \"${dunst_icon_theme}, Papirus-Dark\"/" \
		-e "s/icon_position = .*/icon_position = ${dunst_icon_position}/g" \
		-e "s/max_icon_size = .*/max_icon_size = ${dunst_icon_size}/g" \

	sed -i '/urgency_low/Q' "$dunst_config_file"
	cat >> "$dunst_config_file" <<- _EOF_
		[urgency_low]
		timeout = 3
		background = "${bg}"
		foreground = "${green}"

		[urgency_normal]
		timeout = 6
		background = "${bg}"
		foreground = "${fg}"

		[urgency_critical]
		timeout = 0
		background = "${bg}"
		foreground = "${red}"
		_EOF_

		dunstctl reload "$dunst_config_file"
}

# Set stalonetray config
apply_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/src/config/stalonetrayrc \
		-e "s/background .*/background \"${stalonetray_bg}\"/" \
		-e "s/vertical .*/vertical $stalonetray_vertical/" \
		-e "s/geometry .*/geometry $stalonetray_geometry/" \
		-e "s/grow_gravity .*/grow_gravity ${stalonetray_gravity}/" \
		-e "s/icon_gravity .*/icon_gravity ${stalonetray_gravity}/"
}

# Set eww colors
apply_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<-EOF
		\$bg: ${bg};
		\$bg-alt: ${accent_color};
		\$fg: ${fg};
		\$black: ${blackb};
		\$lightblack: ${blacklight};
		\$red: ${red};
		\$blue: ${blue};
		\$cyan: ${cyan};
		\$magenta: ${magenta};
		\$green: ${green};
		\$yellow: ${yellow};
		\$archicon: ${arch_icon};
	EOF
}

apply_menu_colors() {
	# Jgmenu
	sed -i "$HOME"/.config/bspwm/src/config/jgmenurc \
		-e "s/color_menu_bg = .*/color_menu_bg = ${jg_bg}/" \
		-e "s/color_norm_fg = .*/color_norm_fg = ${jg_fg}/" \
		-e "s/color_sel_bg = .*/color_sel_bg = ${jg_sel_bg}/" \
		-e "s/color_sel_fg = .*/color_sel_fg = ${jg_sel_fg}/" \
		-e "s/color_sep_fg = .*/color_sep_fg = ${jg_sep}/"

	# Rofi launchers
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<-EOF
		* {
		    font: "${rofi_font}";
		    background: ${rofi_background};
		    bg-alt: ${rofi_bg_alt};
		    background-alt: ${rofi_background_alt};
		    foreground: ${rofi_fg};
		    selected: ${rofi_selected};
		    active: ${rofi_active};
		    urgent: ${rofi_urgent};
		    main-bg: ${rofi_main_alt};
		    main-fg: ${rofi_fg};
		    main-fg-alt: ${rofi_main_alt};
		    select-bg: ${rofi_selected};
		    select-fg: ${rofi_main_alt};
		    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
		} 
	EOF

	# Window recent
	sed -i "$HOME/.config/bspwm/src/rofi-themes/Window.rasi" \
	    -e "17s|\(font:\s*\).*|\1"$rofi_font";|" \
	    -e "s|\(font-weight:\s*\).*|\1$rofi_font_weight;|" \
	    -e "s|\(background:\s*\).*|\1$rofi_background_window;|" \
	    -e "s|\(background-alt:\s*\).*|\1$rofi_background_alt_window;|" \
	    -e "s|\(foreground:\s*\).*|\1$rofi_fg;|" \
	    -e "s|\(selected:\s*\).*|\1$rofi_selected_window;|" \
	    -e "s|\(highlight:\s*\).*|\1$rofi_highlight;|" \
	    -e "s|\(urgent:\s*\).*|\1$rofi_urgent_window;|" \
	    -e "s|\(window-format:\s*\).*|\1$rofi_window_format;|" \
	    -e "25s|\(on:\s*\).*|\1$rofi_on;|" \
	    -e "26s|\(off:\s*\).*|\1$rofi_off;|" \
	    -e "60s|\(background-color:\s*\).*|\1$rofi_background_alt_window;|" \
	    -e "61s|\(text-color:\s*\).*|\1$rofi_fg;|" \
	    -e "67s|\(background-color:\s*\).*|\1$rofi_background_alt_window;|" \
	    -e "68s|\(text-color:\s*\).*|\1$rofi_fg;|" \
	    -e "72s|\(border-color:\s*\).*|\1$rofi_background_alt_window;|" \
	    -e "s|\(background-image:.*rices/\)[^/]*|\1$rofi_image|"

	# Screenlock colors
	sed -i "$HOME"/.config/bspwm/src/ScreenLocker \
		-e "s/bg=.*/bg=${sl_bg}/" \
		-e "s/fg=.*/fg=${sl_fg}/" \
		-e "s/ring=.*/ring=${sl_ring}/" \
		-e "s/wrong=.*/wrong=${sl_wrong}/" \
		-e "s/date=.*/date=${sl_date}/" \
		-e "s/verify=.*/verify=${sl_verify}/"
}

# Set color cava
apply_cava() {
	sed -i "$HOME/.config/cava/config" \
		-e "s/foreground = .*/foreground = ${cava_fg}/g"
}

# Appearance
apply_gtk_appearance() {
	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|g" ${xfile}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"$gtk_icons\"|g" ${xfile}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$gtk_cursor\"|g" ${xfile}
		sed -i -e "s|Gtk/FontName .*|Gtk/FontName \"$gtk_font\"|g" ${xfile}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\""$gtk_font"\"/g" ${gtk2}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"$gtk_theme\"/g" ${gtk2}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$gtk_icons\"/g" ${gtk2}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"$gtk_cursor\"/g" ${gtk2}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name="$gtk_font"/g" ${gtk3}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=$gtk_theme/g" ${gtk3}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$gtk_icons/g" ${gtk3}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$gtk_cursor/g" ${gtk3}
	fi
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=$gtk_cursor/g" "$HOME"/.icons/default/index.theme
	fi
	# Reload daemon and apply gtk theme
	pkill -1 xsettingsd >/dev/null 2>&1 &
	xsetroot -cursor_name left_ptr
	unclutter -idle 3 &
}

# Apply wallpaper engine
apply_wallpaper () {
    if [[ -f /tmp/wall_refresh.pid ]]; then
        kill $(cat /tmp/wall_refresh.pid) 2>/dev/null
        rm -f /tmp/wall_refresh.pid
    fi

	case $ENGINE in
		"Theme")
			feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls ;;

		"CustomDir")
			feh -z --no-fehbg --bg-fill "$CUSTOM_DIR" ;;

		"CustomImage")
			feh --no-fehbg --bg-fill "$CUSTOM_WALL" ;;

		"CustomAnimated")
			AnimatedWall --start "$CUSTOM_ANIMATED" ;;

        "Slideshow")
            (
                while true; do
                    feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls
                    sleep 900  # 900 seconds = 15 minutes
                done
            ) &
            echo $! > /tmp/wall_refresh.pid  ;;

		*)
			feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls ;;
	esac
}

# Launch theme
apply_bar() {
	. "$HOME"/.config/bspwm/rices/"$RICE"/Bar.bash
}

### ---------- Apply Configurations ---------- ###

apply_bspwm_config
apply_term_config
apply_picom_config
apply_dunst_config
apply_stalonetray_config
apply_eww_colors
apply_menu_colors
apply_cava
apply_gtk_appearance
apply_wallpaper
apply_bar