## ┏━┓╻┏┓╻┏━╸  ┳╸╻ ╻┏━╸┏┳┓┏━╸
## ┣━┫┃┃┗┫┃╺┓  ┃ ┣━┫┣╸ ┃┃┃┣╸ 
## ╹ ╹╹╹ ╹┗━┛  ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## original theme

# (Decay) colorscheme
bg="#161a22"
fg="#cadee7"

black="#1e232e"
blacklight="#8d9ba1"
red="#927887"
green="#6E91BA"
yellow="#A393A2"
blue="#D2ACA9"
magenta="#E3C4BA"
cyan="#99A9CC"
white="#edf4f7"
blackb="#626483"
redb="#927887"
greenb="#6E91BA"
yellowb="#A393A2"
blueb="#D2ACA9"
magentab="#E3C4BA"
cyanb="#99A9CC"
whiteb="#cadee7"

accent_color="#262c3a"
arch_icon="#667eb3"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TP="2"
BP="30"
LP="2"
RP="2"
WG="6"
NORMAL_BC="#6E91BA"		# Normal border color
ACTIVE_BC="#6E91BA"		# Active border color
FOCUSED_BC="$magenta"	# Focused border color
PRESEL_BC="$magentab"		# Indicator color

# Terminal font & size
term_font_size="9"
term_font_name="JetBrainsMono Nerd Font"

# Fade true|false	# Shadows true|false	# Corner radius		# Shadow color			# Animations true|false
#P_FADE="true"		P_SHADOWS="true"		P_CORNER_R="6"		SHADOW_C="#000000"		ANIMATIONS="true"
# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="false"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="0"			# Corner radius (0 = disabled)
P_BLUR="true"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="0.96"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(8, 36)'
dunst_origin='bottom-right'
dunst_transparency='0'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="${bg}"
dunst_separator_color="${red}"
dunst_fg="${white}"
dunst_icon_theme="Nordzy-pink-dark"
dunst_icon_position="left"
dunst_icon_size="50"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

#Stalone
stalonetray_bg="$bg"
stalonetray_vertical="true"
stalonetray_geometry="1x1-36+705"
stalonetray_gravity="SE"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$blueb"
jg_sel_fg="$accent_color"
jg_sep="$black"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_font_weight="bold"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_fg_alt="${rofi_fg}E0"
rofi_selected="${red}F0"
rofi_selected_window="${magenta}"
rofi_highlight="${green}"
rofi_active="${green}"
rofi_urgent="${red}"
rofi_urgent_window="${red}"
rofi_window_format="{c}  󰇙  {t}"
rofi_on="#55535c"
rofi_off="${red}"
rofi_background_window="$rofi_background"
rofi_background_alt_window="$rofi_background_alt"
rofi_text_window="$rofi_fg"
rofi_border_window="$rofi_background_window"
rofi_image="aing"
rofi_main_alt="${bg}E0"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${magenta:1}"
sl_ring="${bg:1}"
sl_wrong="${red:1}"
sl_date="${magenta:1}"
sl_verify="${green:1}"

# Cava color
cava_fg="cyan"

# Gtk theme
xfile="$HOME/.config/bspwm/src/config/xsettingsd"
gtk2="$HOME/.gtkrc-2.0"
gtk3="$HOME/.config/gtk-3.0/settings.ini"
gtk_font="Noto Sans 9"
gtk_theme="amarena"
gtk_icons="Nordzy-pink-dark"
gtk_cursor="phinger-cursors"

# Wallpaper engine
# Available engines:
# - Theme	(Set a random wallpaper from rice directory)
# - CustomDir	(Set a random wallpaper from the directory you specified)
# - CustomImage	(Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="/home/sanrei/.config/bspwm/src/assets/animated_wall-2.mp4"
