#!/usr/bin/env bash
#  ╦╔═╗╔═╗╔╗ ╔═╗╦    ╦═╗╦╔═╗╔═╗
#  ║╚═╗╠═╣╠╩╗║╣ ║    ╠╦╝║║  ║╣ 
#  ╩╚═╝╩ ╩╚═╝╚═╝╩═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for Isabel
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 2
	bspc config bottom_padding 42
	bspc config normal_border_color "#b8bfe5"
	bspc config active_border_color "#b8bfe5"
	bspc config focused_border_color "#7560d3"
	bspc config presel_feedback_color "#81ae5f"
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
	sed -i "$HOME"/.config/alacritty/fonts.yml \
	-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
	-e "s/size: .*/size: 10/g"
	
	sed -i "$HOME"/.config/alacritty/rice-colors.yml \
	-e "s/colors: .*/colors: *isabel_onedark/"
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g" \
		-e "s/\".*:class_g = 'Updating'\"/\"100:class_g = 'Updating'\"/g" \
		-e "s/\".*:class_g = 'MusicPlayer'\"/\"100:class_g = 'MusicPlayer'\"/g" \
		-e "s/\".*:class_g = 'Sysfetch'\"/\"100:class_g = 'Sysfetch'\"/g" \
		-e "s/\".*:class_g = 'scratch'\"/\"90:class_g = 'scratch'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#14171C\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-50+690/" \
		-e "s/grow_gravity .*/grow_gravity SE/" \
		-e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
	-e "s/transparency = .*/transparency = 0/g" \
	-e "s/frame_color = .*/frame_color = \"#14171c\"/g" \
	-e "s/separator_color = .*/separator_color = \"#abb2bf\"/g" \
	-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
	-e "s/foreground='.*'/foreground='#7560d3'/g"
	
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 3
		background = "#14171c"
		foreground = "#b8bfe5"

		[urgency_normal]
		timeout = 6
		background = "#14171c"
		foreground = "#b8bfe5"

		[urgency_critical]
		timeout = 0
		background = "#14171c"
		foreground = "#b8bfe5"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Isabel rice
\$bg: #14171c;
\$bg-alt: #181b21;
\$fg: #b8bfe5;
\$black: #5c6370;
\$lightblack: #262831;
\$red: #be5046;
\$blue: #4889be;
\$cyan: #49919a;
\$magenta: #7560d3;
\$green: #81ae5f;
\$yellow: #d19a66;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Isabel
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #14171c/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #b8bfe5/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #181b21/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #b8bfe5/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #5c6370/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e 's/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
		-e 's/\(background: \).*/\1#14171c;/' \
		-e 's/\(background-alt: \).*/\1#14171cE0;/' \
		-e 's/\(foreground: \).*/\1#b8bfe5;/' \
		-e 's/\(selected: \).*/\1#7560d3;/' \
		-e 's/[^/]*-rofi/is-rofi/'
}

# Appearance
set_appearance() {
	XFILE="$BDIR/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Groot\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Nordzy-cyan-dark\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"Bibata-Rainbow-Original\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Groot\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Nordzy-cyan-dark\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"Bibata-Rainbow-Original\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Groot/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Nordzy-cyan-dark/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Bibata-Rainbow-Original/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=Bibata-Rainbow-Original/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q isa-bar -c ${rice_dir}/config.ini &
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
set_appearance