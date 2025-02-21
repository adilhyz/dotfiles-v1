##  ┏┓┏━┓┏┓╻   ┳╸╻ ╻┏━╸┏┳┓┏━╸
##   ┃┣━┫┃┗┫   ┃ ┣━┫┣╸ ┃┃┃┣╸ 
## ┗━┛╹ ╹╹ ╹   ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## original by z0mbi3

# (CyberPunk) colorscheme
bg="#070219"
fg="#c0caf5"

black="#626483"
blacklight="#262831"
red="#fb007a"
green="#a6e22e"
yellow="#f3e430"
blue="#19bffe"
magenta="#6800d2"
cyan="#43fbff"
white="#d5ddee"
blackb="#626483"
redb="#fb007a"
greenb="#a6e22e"
yellowb="#f3e430"
blueb="#58AFC2"
magentab="#472575"
cyanb="#926BCA"
whiteb="#d5ddee"

accent_color="#09021f"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TP="-2"
BP="-2"
LP="-2"
RP="-2"
WG="12"
NORMAL_BC="#4C3A6D"		# Normal border color
ACTIVE_BC="#4C3A6D"		# Active border color
FOCUSED_BC="$magenta"	# Focused border color
PRESEL_BC="#070219"		# Indicator color

# Terminal font & size
term_font_size="9"
term_font_name="JetBrainsMono Nerd Font"

# Fade true|false	# Shadows true|false	# Corner radius		# Shadow color			# Animations true|false
#P_FADE="true"		P_SHADOWS="true"		P_CORNER_R="6"		SHADOW_C="#000000"		ANIMATIONS="true"
# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="true"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="0"			# Corner radius (0 = disabled)
P_BLUR="true"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="0.96"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(8, 43)'
dunst_origin='top-right'
dunst_transparency='8'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='1'
dunst_frame_color="${magenta}"
dunst_separator_color="#fb007a"
dunst_fg="#f9f9f9"
dunst_icon_theme="ePapirus-Dark"
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
stalonetray_geometry="1x1-113+57"
stalonetray_gravity="NE"

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
rofi_highlight="#BE00CD"
rofi_active="#4C3A6D"
rofi_urgent="#fb007a"
rofi_urgent_window="#f4155a"
rofi_window_format="{c}  {w}  {t}"
rofi_on="#8df202"
rofi_off="#f4155a"
rofi_background_window="$rofi_background"
rofi_background_alt_window="$rofi_background_alt"
rofi_text_window="$rofi_fg"
rofi_border_window="$rofi_background_window"
rofi_image="jan"
rofi_main_alt="${bg}BF"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${fg:1}"
sl_ring="${red:1}"
sl_wrong="${red:1}"
sl_date="${blueb:1}"
sl_verify="${green:1}"

# Cava color
cava_fg="magenta"

# Gtk theme
xfile="$HOME/.config/bspwm/src/config/xsettingsd"
gtk2="$HOME/.gtkrc-2.0"
gtk3="$HOME/.config/gtk-3.0/settings.ini"
gtk_font="Noto Sans 9"
gtk_theme="Cyberpunk"
gtk_icons="Win11-Dark"
gtk_cursor="capitaine-cursors"

# Wallpaper engine
# Available engines:
# - Theme	(Set a random wallpaper from rice directory)
# - CustomDir	(Set a random wallpaper from the directory you specified)
# - CustomImage	(Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
ENGINE="CustomAnimated"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall-1.mp4"
