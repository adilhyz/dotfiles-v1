#!/usr/bin/env bash
## ┏━╸┏━┓┏━┓┏━┓╺┳╸┏━┓┏━╸┏━╸╻┏━┓   ┏━┓╻┏━╸┏━╸
## ┣╸ ┗━┓┃ ┃┗━┓ ┃ ┣┳┛┣╸ ┣╸ ┃┗━┓   ┣┳┛┃┃  ┣╸ 
## ┗━╸┗━┛┗━┛┗━┛ ╹ ╹┗╸┗━╸╹  ╹┗━┛   ╹┗╸╹┗━╸┗━╸ by adilhyz
## This file will configure the options
## and launch the bars corresponding to each theme.

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice

# Terminate or reload existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Vars config for Esostrefis Rice
# Bspwm border  # Top pad  # Bottom pad   # Normal border color # Active border color  # Focused border color  # Presel border colos  # Left pad   # Right pad  # Window gap
BORDER_WIDTH="0"  TP="2"   BP="46"        NORMAL_BC="#9bced7"   ACTIVE_BC="#9bced7"    FOCUSED_BC="#c3a5e6"   	PRESEL_BC="#c3a5e6"    LP="2"       RP="2"       WG="6"

# Fade true|false	# Shadows true|false	# Corner radius		# Shadow color			# Animations true|false
P_FADE="true"		P_SHADOWS="true"		P_CORNER_R="6"		SHADOW_C="#000000"		ANIMATIONS="true"

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration
set_bspwm_config() {
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

# Reload terminal colors
set_alacritty_config() {
cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# Colors (Rose-Pine Moon) Esostrefis Rice

# Default colors
[colors.primary]
background = "#232136"
foreground = "#e0def4"

# Cursor colors
[colors.cursor]
cursor = "#c3a5e6"
text = "#232136"

# Normal colors
[colors.normal]
black = "#393552"
blue = "#34738e"
cyan = "#eabbb9"
green = "#9bced7"
magenta = "#c3a5e6"
red = "#ea6f91"
white = "#faebd7"
yellow = "#f1ca93"

# Bright colors
[colors.bright]
black = "#393552"
blue = "#34738e"
cyan = "#ebbcba"
green = "#9bced7"
magenta = "#c3a5e6"
red = "#ea6f91"
white = "#e0def4"
yellow = "#f1ca93"
EOF

}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## (Rose-Pine Moon) Color scheme for Cristina Rice


# The basic colors
foreground              #e0def4
background              #232136
selection_foreground    #232136
selection_background    #eabbb9

# Cursor colors
cursor                  #c3a5e6
cursor_text_color       #232136

# URL underline color when hovering with mouse
url_color               #34738e

# Kitty window border colors
active_border_color     #c3a5e6
inactive_border_color   #6e6a86
bell_border_color       #f1ca93

# Tab bar colors
active_tab_foreground   #232136
active_tab_background   #c3a5e6
inactive_tab_foreground #e0def4
inactive_tab_background #393552
tab_bar_background      #232136

# The 16 terminal colors

# black
color0 #393552
color8 #6e6a86

# red
color1 #ea6f91
color9 #ea6f91

# green
color2  #9bced7
color10 #9bced7

# yellow
color3  #f1ca93
color11 #f1ca93

# blue
color4  #34738e
color12 #34738e

# magenta
color5  #c3a5e6
color13 #c3a5e6

# cyan
color6  #eabbb9
color14 #ebbcba

# white
color7  #faebd7
color15 #e0def4
EOF

killall -USR1 kitty
}

# Set compositor configuration
set_picom_config() {
	picom_conf_file="$HOME/.config/bspwm/src/config/picom.conf"
	picom_rules_file="$HOME/.config/bspwm/src/config/picom-rules.conf"

	sed -i "$picom_conf_file" \
		-e "s/shadow = .*/shadow = ${P_SHADOWS};/" \
		-e "s/shadow-color = .*/shadow-color = \"${SHADOW_C}\"/" \
		-e "s/fading = .*/fading = ${P_FADE};/" \
		-e "s/corner-radius = .*/corner-radius = ${P_CORNER_R}/"

	sed -i "$picom_rules_file" \
		-e "95s/	opacity = .*/	opacity = 1;/"

	if [[ "$ANIMATIONS" = "true" ]]; then
		sed -i "$picom_rules_file" \
			-e '/picom-animations/c\@include "picom-animations.conf"'
	else
		sed -i "$picom_rules_file" \
			-e '/picom-animations/c\#@include "picom-animations.conf"'
	fi
}

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#232136\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-50+690/" \
		-e "s/grow_gravity .*/grow_gravity SE/" \
		-e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#232136\"/g" \
		-e "s/separator_color = .*/separator_color = \"#ea6f91\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#9bced7'/g" \
		-e "s/origin = .*/origin = bottom-right/g" \
		-e "s/offset = .*/offset = 8x52/g" \
		-e "s/icon_position = .*/icon_position = left/g" \
		-e "s/max_icon_size = .*/max_icon_size = 50/g" \
		-e "s/corner_radius = .*/corner_radius = 0/g"

	
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 3
		background = "#232136"
		foreground = "#e0def4"

		[urgency_normal]
		timeout = 6
		background = "#232136"
		foreground = "#e0def4"

		[urgency_critical]
		timeout = 0
		background = "#232136"
		foreground = "#e0def4"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Esostrefis rice
\$bg: #232136;
\$bg-alt: #272433;
\$fg: #e0def4;
\$black: #393552;
\$lightblack: #262831;
\$red: #ea6f91;
\$blue: #34738e;
\$cyan: #eabbb9;
\$magenta: #c3a5e6;
\$green: #9bced7;
\$yellow: #f1ca93;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Esostrefis
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #232136/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #e0def4/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #272433/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #e0def4/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #393552/'
}

# Set Rofi launcher config
set_launcher_config () {
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Esostrefis
* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #232136;
    background-alt: #232136E0;
    foreground: #e0def4;
    selected: #c3a5e6;
    active: #9bced7;
    urgent: #ea6f91;
    img-background: url("~/.config/bspwm/rices/esostrefis/rofi.webp", width);
    main-bg: #232136E6;
    main-fg: #e0def4;
    main-fg-alt: #232136E0;
    select-bg: #c3a5e6;
    select-fg: #232136;
}

EOF
sed -i "$HOME/.config/bspwm/src/rofi-themes/Window.rasi" \
    -e '17s|\(font:\s*\).*|\1"Terminess Nerd Font Mono Bold 10";|' \
    -e 's|\(font-weight:\s*\).*|\1bold;|' \
    -e 's|\(background:\s*\).*|\1#232136;|' \
    -e 's|\(background-alt:\s*\).*|\1#232136E0;|' \
    -e 's|\(foreground:\s*\).*|\1#eaeaea;|' \
    -e 's|\(selected:\s*\).*|\1#c3a5e6;|' \
    -e 's|\(highlight:\s*\).*|\1#9bced7;|' \
    -e 's|\(urgent:\s*\).*|\1#ea6f91;|' \
    -e 's|\(window-format:\s*\).*|\1" {c}  󰇙  {t}";|' \
    -e '25s|\(on:\s*\).*|\1#34738e;|' \
    -e '26s|\(off:\s*\).*|\1#ea6f91;|' \
    -e '60s|\(background-color:\s*\).*|\1@selected;|' \
    -e '61s|\(text-color:\s*\).*|\1@background-alt;|' \
    -e '67s|\(background-color:\s*\).*|\1@selected;|' \
    -e '68s|\(text-color:\s*\).*|\1@background-alt;|' \
    -e '72s|\(border-color:\s*\).*|\1@selected;|' \
    -e 's|\(background-image:.*rices/\)[^/]*|\1esostrefis|'
}

# Set color cava
set_cava() {
	sed -i "$HOME/.config/cava/config" \
		-e "s/foreground = .*/foreground = black/g"
}

# Appearance
set_appearance() {
	XFILE="$BDIR/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Manhattan\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Nordzy-purple-dark\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"phinger-cursors\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Manhattan\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Nordzy-purple-dark\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"phinger-cursors\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Manhattan/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Nordzy-purple-dark/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=phinger-cursors/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=phinger-cursors/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Launch the bar and or eww widgets
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q esostrefis-bar -c ${rice_dir}/config.ini &
	done

}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_alacritty_config
set_kitty_config
set_picom_config
set_stalonetray_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
set_cava
set_appearance