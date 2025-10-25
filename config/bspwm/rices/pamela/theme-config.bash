## ┏━┓┏━┓┏┳┓┏━╸╻  ┏━┓  ╺┳╸╻ ╻┏━╸┏┳┓┏━╸
## ┣━┛┣━┫┃┃┃┣╸ ┃  ┣━┫   ┃ ┣━┫┣╸ ┃┃┃┣╸ 
## ╹  ╹ ╹╹ ╹┗━╸┗━╸╹ ╹   ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## original by z0mbi3

# (Lovelace) colorscheme from Elenapan
bg="#1D1F28"
fg="#FDFDFD"

black="#2F354B" #282A36
blacklight="#262831"
red="#F37F97"
green="#5ADECD"
yellow="#F2A272"
blue="#8897F4"
magenta="#C574DD"
cyan="#79E6F3"
white="#FDFDFD"
blackb="#414458"
redb="#FF4971"
greenb="#18E3C8"
yellowb="#FF8037"
blueb="#556FFF"
magentab="#B043D1"
cyanb="#3FDCEE"
whiteb="#BEBEC1"

accent_color="#1F222B"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TP="0"
BP="2"
LP="2"
RP="2"
WG="6"
NORMAL_BC="#C574DD"		# Normal border color
ACTIVE_BC="#C574DD"		# Active border color
FOCUSED_BC="#8897F4"	# Focused border color
PRESEL_BC="#FF4971"		# Indicator color

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
P_BLUR="true"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="0.7"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(8, 45)'
dunst_origin='top-right'
dunst_transparency='9'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='2'
dunst_frame_color="${black}"
dunst_separator_color="$blue"
dunst_fg="$cyan"
dunst_icon_theme="ePapirus-Dark"
dunst_icon_position="left"
dunst_icon_size="50"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

#Stalone
stalonetray_bg="${black}"
stalonetray_vertical="true"
stalonetray_geometry="1x1-917+47"
stalonetray_gravity="NE"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$blueb"
jg_sel_fg="$fg"
jg_sep="$blueb"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_font_weight="bold"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="#c0caf5"
rofi_fg_alt="${rofi_fg}E0"
rofi_selected="#6C77BB"
rofi_selected_window="#6C77BB"
rofi_highlight="$fg"
rofi_active="${greenb}"
rofi_urgent="${redb}"
rofi_urgent_window="#8C8C8C"
rofi_window_format="  {c}  󱂬  {t}"
rofi_on="#E57C46"
rofi_off="#8C8C8C"
rofi_background_window="$rofi_background"
rofi_background_alt_window="$rofi_background_alt"
rofi_text_window="$rofi_fg"
rofi_border_window="$rofi_background_window"
rofi_image="pamela"
rofi_main_alt="${bg}BF"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${blue:1}"
sl_ring="${bg:1}"
sl_wrong="${red:1}"
sl_date="${blue:1}"
sl_verify="${green:1}"

# Cava color
cava_fg="cyan"

# Gtk theme
xfile="$HOME/.config/bspwm/src/config/xsettingsd"
gtk2="$HOME/.gtkrc-2.0"
gtk3="$HOME/.config/gtk-3.0/settings.ini"
gtk_font="Noto Sans 9"
gtk_theme="Arc-Darkest-Plum"
gtk_icons="Papirus-Dark"
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
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
