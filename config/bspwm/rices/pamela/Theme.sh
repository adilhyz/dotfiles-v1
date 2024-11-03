#!/usr/bin/env bash
## ┏━┓┏━┓┏┳┓┏━╸╻  ┏━┓   ┏━┓╻┏━╸┏━╸
## ┣━┛┣━┫┃┃┃┣╸ ┃  ┣━┫   ┣┳┛┃┃  ┣╸ 
## ╹  ╹ ╹╹ ╹┗━╸┗━╸╹ ╹   ╹┗╸╹┗━╸┗━╸ by adilhyz
## This file will configure the options
## and launch the bars corresponding to each theme.

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice

# Terminate or reload existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Vars config for Pamela Rice
# Bspwm border  # Top pad  # Bottom pad   # Normal border color # Active border color  # Focused border color  # Presel border colos  # Left pad   # Right pad  # Window gap
BORDER_WIDTH="0"  TP="0"   BP="2"        NORMAL_BC="#C574DD"   ACTIVE_BC="#C574DD"    FOCUSED_BC="#8897F4"   	PRESEL_BC="#FF4971"    LP="2"       RP="2"       WG="6"

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
# Color scheme for Pamela Rice
# Default colors
[colors.primary]
background = "#1D1F28"
foreground = "#FDFDFD"
# Cursor colors
[colors.cursor]
cursor = "#FF4971"
text = "#1D1F28"
# Normal colors
[colors.normal]
black = "#3D4C5F"
blue = "#8897F4"
cyan = "#79E6F3"
green = "#5ADECD"
magenta = "#C574DD"
red = "#F37F97"
white = "#FDFDFD"
yellow = "#F2A272"
# Bright colors
[colors.bright]
black = "#56687E"
blue = "#556FFF"
cyan = "#3FDCEE"
green = "#18E3C8"
magenta = "#B043D1"
red = "#FF4971"
white = "#BEBEC1"
yellow = "#FF8037"
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## Color scheme for Pamela Rice


# The basic colors
foreground              #FDFDFD
background              #1D1F28
selection_foreground    #1D1F28
selection_background    #C574DD

# Cursor colors
cursor                  #FF4971
cursor_text_color       #1D1F28

# URL underline color when hovering with mouse
url_color               #8897F4

# Kitty window border colors
active_border_color     #C574DD
inactive_border_color   #56687E
bell_border_color       #F2A272

# Tab bar colors
active_tab_foreground   #1D1F28
active_tab_background   #C574DD
inactive_tab_foreground #FDFDFD
inactive_tab_background #3D4C5F
tab_bar_background      #1D1F28

# The 16 terminal colors

# black
color0 #3D4C5F
color8 #56687E

# red
color1 #F37F97
color9 #FF4971

# green
color2  #5ADECD
color10 #18E3C8

# yellow
color3  #F2A272
color11 #FF8037

# blue
color4  #8897F4
color12 #556FFF

# magenta
color5  #C574DD
color13 #B043D1

# cyan
color6  #79E6F3
color14 #3FDCEE

# white
color7  #FDFDFD
color15 #BEBEC1
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
    -e "95s/  opacity = .*/ opacity = 0.96;/"

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
		-e "s/background .*/background \"#1D1F28\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-917+43/" \
		-e "s/grow_gravity .*/grow_gravity NE/" \
		-e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 9/g" \
		-e "s/frame_color = .*/frame_color = \"#2f354b\"/g" \
		-e "s/frame_width = .*/frame_width = \"2\"/g" \
		-e "s/separator_color = .*/separator_color = \"#8897F4\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
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
	XFILE="$BDIR/xsettingsd"
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

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Pamela rice
\$bg: #1D1F28;
\$bg-alt: #1F222B;
\$fg: #FDFDFD;
\$black: #56687E;
\$lightblack: #262831;
\$red: #F37F97;
\$blue: #8897F4;
\$cyan: #79E6F3;
\$magenta: #B043D1;
\$green: #90ceaa;
\$yellow: #F2A272;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Pamela
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #1D1F28/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #a5b6cf/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #1F222B/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #a5b6cf/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #56687E/'
}

# Set Rofi launcher config
set_launcher_config () {
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Pamela
* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #1D1F28;
    background-alt: #1D1F28E0;
    foreground: #c0caf5;
    selected: #6C77BB;
    active: #18E3C8;
    urgent: #FF4971;
    img-background: url("~/.config/bspwm/rices/pamela/rofi.webp", width);
    main-bg: #1D1F28BF;
    main-fg: #c0caf5;
    main-fg-alt: #1D1F28BF;
    select-bg: #6C77BB;
    select-fg: #1D1F28;
}
EOF

sed -i "$HOME/.config/bspwm/src/rofi-themes/Window.rasi" \
    -e '17s|\(font:\s*\).*|\1"Terminess Nerd Font Mono Bold 10";|' \
    -e 's|\(font-weight:\s*\).*|\1bold;|' \
    -e 's|\(background:\s*\).*|\1#1D1F28;|' \
    -e 's|\(background-alt:\s*\).*|\1#1D1F28E0;|' \
    -e 's|\(foreground:\s*\).*|\1#c0caf5;|' \
    -e 's|\(selected:\s*\).*|\1#6C77BB;|' \
    -e 's|\(highlight:\s*\).*|\1#FDFDFD;|' \
    -e 's|\(urgent:\s*\).*|\1#8C8C8C;|' \
    -e 's|\(window-format:\s*\).*|\1"  {c}  󱂬  {t}";|' \
    -e '25s|\(on:\s*\).*|\1#E57C46;|' \
    -e '26s|\(off:\s*\).*|\1#8C8C8C;|' \
    -e '60s|\(background-color:\s*\).*|\1@background-alt;|' \
    -e '61s|\(text-color:\s*\).*|\1@foreground;|' \
    -e '67s|\(background-color:\s*\).*|\1@background-alt;|' \
    -e '68s|\(text-color:\s*\).*|\1@foreground;|' \
    -e '72s|\(border-color:\s*\).*|\1@background-alt;|' \
    -e 's|\(background-image:.*rices/\)[^/]*|\1pamela|'
}

# Set color cava
set_cava() {
	sed -i "$HOME/.config/cava/config" \
		-e "s/foreground = .*/foreground = cyan/g"
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -q pam1 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam2 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam3 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam4 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam5 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam6 -c ${rice_dir}/config.ini)&
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