#!/usr/bin/env bash
#  ╔═╗╦╦  ╦  ╦╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ╚═╗║║  ╚╗╔╝║╠═╣  ╠╦╝║║  ║╣ 
#  ╚═╝╩╩═╝ ╚╝ ╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for Silvia
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 36
	bspc config bottom_padding 2
	bspc config normal_border_color "#d3869b"
	bspc config active_border_color "#d3869b"
	bspc config focused_border_color "#fbf1c7"
	bspc config presel_feedback_color "#b8bb26"
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Gruvbox) Color scheme for Silvia Rice
# Default colors
[colors.primary]
background = "#282828"
foreground = "#fbf1c7"
# Cursor colors
[colors.cursor]
cursor = "#fbf1c7"
text = "#282828"
# Normal colors
[colors.normal]
black = "#a89984"
blue = "#458588"
cyan = "#689d6a"
green = "#98971a"
magenta = "#b16286"
red = "#cc241d"
white = "#ebdbb2"
yellow = "#d79921"
# Bright colors
[colors.bright]
black = "#a89984"
blue = "#83a598"
cyan = "#8ec07c"
green = "#b8bb26"
magenta = "#d3869b"
red = "#fb4934"
white = "#ebdbb2"
yellow = "#fabd2f"
EOF
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/inactive-opacity = .*/inactive-opacity = 1.0;/g" \
		-e "s/active-opacity = .*/active-opacity = 1.0;/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/method = .*/method = \"none\"/g" \
		-e "s/background = .*/background = false/g" \
		-e "s/background-frame = .*/background-frame = false/g" \
		-e "s/background-fixed = .*/background-fixed = false/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#3C3836\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-6+45/" \
		-e "s/grow_gravity .*/grow_gravity NE/" \
		-e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#282828\"/g" \
		-e "s/separator_color = .*/separator_color = \"#d3869b\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#d3869b'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#282828"
			foreground = "#fbf1c7"

			[urgency_normal]
			timeout = 6
			background = "#282828"
			foreground = "#fbf1c7"

			[urgency_critical]
			timeout = 0
			background = "#282828"
			foreground = "#fbf1c7"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Silvia rice
\$bg: #282828;
\$bg-alt: #2E2E2E;
\$fg: #fbf1c7;
\$black: #a89984;
\$lightblack: #262831;
\$red: #fb4934;
\$blue: #83a598;
\$cyan: #8ec07c;
\$magenta: #d3869b;
\$green: #b8bb26;
\$yellow: #fabd2f;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Silvia
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #282828/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #fbf1c7/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #2E2E2E/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #fbf1c7/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #a89984/'
}

# Appearance
set_appearance() {
	XFILE="$BDIR/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Gruvbox\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Nordzy-pink-dark\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"phinger-cursors\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Gruvbox\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Nordzy-pink-dark\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"phinger-cursors\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Gruvbox/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Nordzy-pink-dark/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=phinger-cursors/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=phinger-cursors/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"scientifica 12";/' \
		-e 's/\(background: \).*/\1#282828;/' \
		-e 's/\(background-alt: \).*/\1#282828E0;/' \
		-e 's/\(foreground: \).*/\1#fbf1c7;/' \
		-e 's/\(selected: \).*/\1#d79921;/' \
		-e 's/[^/]*-rofi/si-rofi/'

	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#282828E6;/' \
		-e 's/\(main-fg: \).*/\1#fbf1c7;/' \
		-e 's/\(select-bg: \).*/\1#d79921;/' \
		-e 's/\(select-fg: \).*/\1#282828;/'
}

# Set color cava
set_cava() {
	sed -i "$HOME/.config/cava/config" \
		-e "s/foreground = .*/foreground = magenta/g"
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q cata-bar -c ${rice_dir}/config.ini &
	done

}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_stalonetray_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
set_cava
set_appearance