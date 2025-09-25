## ┏━╸┏━┓┏━┓┏━┓╺┳╸┏━┓┏━╸┏━╸╻┏━┓   ┳╸╻ ╻┏━╸┏┳┓┏━╸
## ┣╸ ┗━┓┃ ┃┗━┓ ┃ ┣┳┛┣╸ ┣╸ ┃┗━┓   ┃ ┣━┫┣╸ ┃┃┃┣╸ 
## ┗━╸┗━┛┗━┛┗━┛ ╹ ╹┗╸┗━╸╹  ╹┗━┛   ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## original by z0mbi3

# (Rose-Pine Moon) colorscheme
bg="#232136"
fg="#e0def4"

black="#393552"
blacklight="#262831"
red="#ea6f91"
green="#9bced7"
yellow="#f1ca93"
blue="#34738e"
magenta="#c3a5e6"
cyan="#eabbb9"
white="#faebd7"
blackb="#6e6a86"
redb="#ea6f91"
greenb="#9bced7"
yellowb="#f1ca93"
blueb="#34738e"
magentab="#c3a5e6"
cyanb="#ebbcba"
whiteb="#e0def4"

accent_color="#2a2740"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TP="2"
BP="46"
LP="2"
RP="2"
WG="6"
NORMAL_BC="#9bced7"		# Normal border color
ACTIVE_BC="#9bced7"		# Active border color
FOCUSED_BC="$magenta"	# Focused border color
PRESEL_BC="$magenta"		# Indicator color

# Terminal font & size
term_font_size="9"
term_font_name="JetBrainsMono Nerd Font"

# Fade true|false	# Shadows true|false	# Corner radius		# Shadow color			# Animations true|false
#P_FADE="true"		P_SHADOWS="true"		P_CORNER_R="6"		SHADOW_C="#000000"		ANIMATIONS="true"
# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="true"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="6"			# Corner radius (0 = disabled)
P_BLUR="false"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="1.0"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(8, 52)'
dunst_origin='bottom-right'
dunst_transparency='0'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="${magenta}"
dunst_separator_color="${redb}"
dunst_fg="${green}"
dunst_icon_theme="Nordzy-purple-dark"
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
stalonetray_geometry="1x1-50+690"
stalonetray_gravity="SE"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$accent_color"
jg_sel_fg="$fg"
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
rofi_urgent="#ea6f91"
rofi_urgent_window="#ea6f91"
rofi_window_format=" {c}  󰇙  {t}"
rofi_on="${blue}"
rofi_off="${red}"
rofi_background_window="$rofi_background"
rofi_background_alt_window="$rofi_background_alt"
rofi_text_window="$rofi_fg"
rofi_border_window="$rofi_background_window"
rofi_image="esostrefis"
rofi_main_alt="${bg}E6"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${magenta:1}"
sl_ring="${bg:1}"
sl_wrong="${red:1}"
sl_date="${magenta:1}"
sl_verify="${green:1}"

# Cava color
cava_fg="red"

# Gtk theme
xfile="$HOME/.config/bspwm/src/config/xsettingsd"
gtk2="$HOME/.gtkrc-2.0"
gtk3="$HOME/.config/gtk-3.0/settings.ini"
gtk_font="Noto Sans 9"
gtk_theme="Manhattan"
gtk_icons="Nordzy-purple-dark"
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
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall-4.mp4"
