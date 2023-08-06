#!/usr/bin/env bash
#  ╔═╗╔═╗╔╦╗╔═╗╦  ╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╝╠═╣║║║║╣ ║  ╠═╣  ╠╦╝║║  ║╣  
#  ╩  ╩ ╩╩ ╩╚═╝╩═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme 
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for Pamela
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 0
		bspc config bottom_padding 2
		bspc config normal_border_color "#C574DD"
		bspc config active_border_color "#C574DD"
		bspc config focused_border_color "#8897F4"
		bspc config presel_feedback_color "#FF4971"
		bspc config left_padding 2
		bspc config right_padding 2
		bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
		-e "s/size: .*/size: 10/g"
		
		cat > "$HOME"/.config/alacritty/colors.yml <<- _EOF_
				# Colors (Elenapan) Pamela Rice
				colors:
				  primary:
				    background: '#1D1F28'
				    foreground: '#FDFDFD'

				  normal:
				    black:   '#3D4C5F'
				    red:     '#F37F97'
				    green:   '#5ADECD'
				    yellow:  '#F2A272'
				    blue:    '#8897F4'
				    magenta: '#C574DD'
				    cyan:    '#79E6F3'
				    white:   '#FDFDFD'

				  bright:
				    black:   '#56687E'
				    red:     '#FF4971'
				    green:   '#18E3C8'
				    yellow:  '#FF8037'
				    blue:    '#556FFF'
				    magenta: '#B043D1'
				    cyan:    '#3FDCEE'
				    white:   '#BEBEC1'
    
				  cursor:
				    cursor: '#FF4971'
				    text:	'#1D1F28'
_EOF_
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 6/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g" \
			-e "s/\".*:class_g = 'Updating'\"/\"100:class_g = 'Updating'\"/g" \
			-e "s/\".*:class_g = 'MusicPlayer'\"/\"100:class_g = 'MusicPlayer'\"/g" \
			-e "s/\".*:class_g = 'Sysfetch'\"/\"100:class_g = 'Sysfetch'\"/g" \
			-e "s/\".*:class_g = 'scratch'\"/\"90:class_g = 'scratch'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 9/g" \
		-e "s/frame_color = .*/frame_color = \"#2f354b\"/g" \
		-e "s/frame_width = .*/frame_width = \"2\"/g" \
		-e "s/separator_color = .*/separator_color = \"#8897F4\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#79E6F3'/g" \
		-e "s/origin = .*/origin = top-right/g" \
		-e "s/offset = .*/offset = 8x45/g" \
		-e "s/icon_position = .*/icon_position = left/g" \
		-e "s/max_icon_size = .*/max_icon_size = 50/g" \
		-e "s/corner_radius = .*/corner_radius = 6/g"

		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#1D1F28BA"
				foreground = "#FDFDFD"

				[urgency_normal]
				timeout = 6
				background = "#1D1F28BA"
				foreground = "#FDFDFD"

				[urgency_critical]
				timeout = 0
				background = "#1D1F28BA"
				foreground = "#FDFDFD"
_EOF_
}

# Appearance
set_appearance() {
	XFILE="$PATH_BSPWM/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Arc-Darkest-Plum\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"ePapirus-Dark\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"phinger-cursors\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Arc-Darkest-Plum\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"ePapirus-Dark\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"phinger-cursors\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Arc-Darkest-Plum/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=ePapirus-Dark/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=phinger-cursors/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=phinger-cursors/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Launch the bar
launch_bars() {
		eww -c ${rice_dir}/widgets daemon &
		polybar -q pam1 -c ${rice_dir}/config.ini &
		polybar -q pam2 -c ${rice_dir}/config.ini &
		polybar -q pam3 -c ${rice_dir}/config.ini &
		polybar -q pam4 -c ${rice_dir}/config.ini &
		polybar -q pam5 -c ${rice_dir}/config.ini &
		polybar -q pam6 -c ${rice_dir}/config.ini &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
set_appearance
launch_bars
