#!/usr/bin/env bash
## ┏━┓╻╺┳┓╻ ╻┏━┓╻ ╻   ┏━┓╻┏━╸┏━╸
## ┗━┓┃ ┃┃┃ ┃┣┳┛┃ ┃   ┣┳┛┃┃  ┣╸ 
## ┗━┛╹╺┻┛┗━┛╹┗╸┗━┛   ╹┗╸╹┗━╸┗━╸ by adilhyz
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for siduru
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 2
	bspc config bottom_padding 33
	bspc config normal_border_color "#337073"
	bspc config active_border_color "#337073"
	bspc config focused_border_color "#db9fcc"
	bspc config presel_feedback_color "#db9fcc"
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
	cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# Colors (Dina-Hawu color scheme) Siduru Rice
# Default colors
[colors.primary]
background = "#dcd5b8"
foreground = "#0c0e1a"
# Cursor colors
[colors.cursor]
cursor = "#bed5e5"
text = "#bed5e5"
# Normal colors
[colors.normal]
black = "#f3e9dc"
blue = "#3d6a99"
cyan = "#a7aafb"
green = "#337073"
magenta = "#db9fcc"
red = "#3e111a"
white = "#181e1c"
yellow = "#9a5652"
# Bright colors
[colors.bright]
black = "#f3e9dc"
blue = "#3d6a99"
cyan = "#a7aafb"
green = "#337073"
magenta = "#db9fcc"
red = "#3e111a"
white = "#aaa39a"
yellow = "#9a5652"
EOF
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = false; }/g" \
		-e "s/inactive-opacity = .*/inactive-opacity = 1;/g" \
		-e "s/active-opacity = .*/active-opacity = 1;/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/method = .*/method = \"none\"/g" \
		-e "s/background = .*/background = true/g" \
		-e "s/background-frame = .*/background-frame = true/g" \
		-e "s/background-fixed = .*/background-fixed = true/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"90:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"90:class_g = 'FloaTerm'\"/g" \
		-e "s/\".*:class_g = 'Updating'\"/\"90:class_g = 'Updating'\"/g" \
		-e "s/\".*:class_g = 'MusicPlayer'\"/\"90:class_g = 'MusicPlayer'\"/g" \
		-e "s/\".*:class_g = 'Sysfetch'\"/\"90:class_g = 'Sysfetch'\"/g" \
		-e "s/\".*:class_g = 'scratch'\"/\"90:class_g = 'scratch'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#dcd5b8\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-295+700/" \
		-e "s/grow_gravity .*/grow_gravity SE/" \
		-e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 22/g" \
		-e "s/frame_color = .*/frame_color = \"#dcd5b8\"/g" \
		-e "s/separator_color = .*/separator_color = \"#3e111a\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#337073'/g" \
		-e "s/origin = .*/origin = bottom-right/g" \
		-e "s/offset = .*/offset = 237x40/g" \
		-e "s/icon_position = .*/icon_position = right/g" \
		-e "s/max_icon_size = .*/max_icon_size = 50/g" \
		-e "s/corner_radius = .*/corner_radius = 0/g"

	
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 3
		background = "#dcd5b8"
		foreground = "#0c0e1a"

		[urgency_normal]
		timeout = 6
		background = "#dcd5b8"
		foreground = "#0c0e1a"

		[urgency_critical]
		timeout = 0
		background = "#dcd5b8"
		foreground = "#0c0e1a"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Siduru rice
\$bg: #dcd5b8;
\$bg-alt: #eac6a9;
\$fg: #0c0e1a;
\$black: #181e1c;
\$lightblack: #aaa39a;
\$red: #3e111a;
\$blue: #3d6a99;
\$cyan: #a7aafb;
\$magenta: #db9fcc;
\$green: #337073;
\$yellow: #9a5652;
\$archicon: #0A9CF5;
EOF
}

# Set jgmenu colors for Siduru
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #dcd5b8/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #0c0e1a/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #eac6a9/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #0c0e1a/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #181e1c/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e 's/\(background: \).*/\1#dcd5b8;/' \
		-e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
		-e 's/\(background-alt: \).*/\1#dcd5b8E0;/' \
		-e 's/\(foreground: \).*/\1#0c0e1a;/' \
		-e 's/\(selected: \).*/\1#db9fcc;/' \
		-e 's/[^/]*-rofi/sd-rofi/'

	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#dcd5b8E0;/' \
		-e 's/\(main-fg: \).*/\1#0c0e1a;/' \
		-e 's/\(select-bg: \).*/\1#db9fcc;/' \
		-e 's/\(select-fg: \).*/\1#dcd5b8;/'
}

# Set color cava #bak-e "78s/gradient_color_1 = .*/gradient_color_1 = '#3d6a99'/g"
set_cava() {
	sed -i "$HOME/.config/cava/config" \
		-e "s/foreground = .*/foreground = 'cyan'/g"
}

# Appearance
set_appearance() {
	XFILE="$BDIR/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Adapta-Eta\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Nordzy-cyan-dark--light_panel\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"phinger-cursors\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Adapta-Eta\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Nordzy-cyan-dark--light_panel\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"phinger-cursors\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Adapta-Eta/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Nordzy-cyan-dark--light_panel/g" ${GTK3FILE}
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
		(MONITOR=$mon polybar -q siduru-bar -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q siduru-bar2 -c ${rice_dir}/config.ini)&
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