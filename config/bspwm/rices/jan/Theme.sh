#!/usr/bin/env bash
#   ╦╔═╗╔╗╔  ╦═╗╦╔═╗╔═╗ - modified by me
#   ║╠═╣║║║  ╠╦╝║║  ║╣ 	
#  ╚╝╩ ╩╝╚╝  ╩╚═╩╚═╝╚═╝ - original zombi3
## This file will configure the options
## and launch the bars corresponding to each theme.

## Theme
BDIR="$HOME/.config/bspwm"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Set bspwm configuration for Jan
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding -2
		bspc config bottom_padding -2
		bspc config normal_border_color "#4C3A6D"
		bspc config active_border_color "#4C3A6D"
		bspc config focused_border_color "#785DA5"
		bspc config presel_feedback_color "#070219"
		bspc config left_padding -2
		bspc config right_padding -2
		bspc config window_gap 12
}

# Reload terminal colors
set_term_config() {
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
		-e "s/size: .*/size: 10/g"
		
		cat > "$HOME"/.config/alacritty/colors.yml <<- _EOF_
				# Colors (CyberPunk) Jan Rice
				colors:
				  primary:
				    background: '#070219'
				    foreground: '#c0caf5'

				  normal:
				    black:   '#626483'
				    red:     '#fb007a'
				    green:   '#a6e22e'
				    yellow:  '#f3e430'
				    blue:    '#58AFC2'
				    magenta: '#583794'
				    cyan:    '#926BCA'
				    white:   '#d9d9d9'

				  bright:
				    black:   '#626483'
				    red:     '#fb007a'
				    green:   '#a6e22e'
				    yellow:  '#f3e430'
				    blue:    '#58AFC2'
				    magenta: '#472575'
				    cyan:    '#926BCA'
				    white:   '#f1f1f1'
   
				  cursor:
				    cursor: '#fb007a'
				    text:	'#070219'
_EOF_
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/normal = .*/normal =  { fade = true; shadow = false; }/g" \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 0/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"96:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"96:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 8/g" \
		-e "s/frame_color = .*/frame_color = \"#6800d2\"/g" \
		-e "s/frame_width = .*/frame_width = \"1\"/g" \
		-e "s/separator_color = .*/separator_color = \"#fb007a\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#f9f9f9'/g" \
		-e "s/origin = .*/origin = top-right/g" \
		-e "s/offset = .*/offset = 10x56/g" \
		-e "s/icon_position = .*/icon_position = left/g" \
		-e "s/max_icon_size = .*/max_icon_size = 50/g" \
		-e "s/corner_radius = .*/corner_radius = 0/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#070219"
				foreground = "#c0caf5"

				[urgency_normal]
				timeout = 6
				background = "#070219"
				foreground = "#c0caf5"

				[urgency_critical]
				timeout = 0
				background = "#070219"
				foreground = "#c0caf5"
_EOF_
}

# Appearance
set_appearance() {
	XFILE="$PATH_BSPWM/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$HOME/.config/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"Cyberpunk\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"Win11-Dark\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"phinger-cursors\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"Noto Sans 9\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"Cyberpunk\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"Win11-Dark\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"phinger-cursors\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=Noto Sans 9/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=Cyberpunk/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Win11-Dark/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=phinger-cursors/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=phinger-cursors/g" "$HOME"/.icons/default/index.theme
	fi	
}


# Launch the bar
launch_bars() {
		polybar -q main -c ${rice_dir}/config.ini &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
set_appearance
launch_bars
