## ┏━┓╻╻  ╻ ╻╻┏━┓   ┳╸╻ ╻┏━╸┏┳┓┏━╸
## ┗━┓┃┃  ┃┏┛┃┣━┫   ┃ ┣━┫┣╸ ┃┃┃┣╸ 
## ┗━┛╹┗━╸┗┛ ╹╹ ╹   ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## original by z0mbi3

# (Gruvbox) colorscheme
bg="#282828"
fg="#fbf1c7"

black="#a89984"
blacklight="#262831"
red="#cc241d"
green="#98971a"
yellow="#d79921"
blue="#458588"
magenta="#b16286"
cyan="#689d6a"
white="#ebdbb2"
blackb="#a89984"
redb="#fb4934"
greenb="#b8bb26"
yellowb="#fabd2f"
blueb="#83a598"
magentab="#d3869b"
cyanb="#8ec07c"
whiteb="#ebdbb2"

accent_color="#2E2E2E"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TP="2"
BP="2"
LP="2"
RP="2"
WG="6"
NORMAL_BC="${magentab}"		# Normal border color
ACTIVE_BC="${magentab}"		# Active border color
FOCUSED_BC="${fg}"	# Focused border color
PRESEL_BC="${greenb}"		# Indicator color

# Terminal font & size
term_font_size="9"
term_font_name="JetBrainsMono Nerd Font"

# Fade true|false	# Shadows true|false	# Corner radius		# Shadow color			# Animations true|false
#P_FADE="true"		P_SHADOWS="true"		P_CORNER_R="6"		SHADOW_C="#000000"		ANIMATIONS="true"
# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="false"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="6"			# Corner radius (0 = disabled)
P_BLUR="true"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="1.0"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(8, 42)'
dunst_origin='top-right'
dunst_transparency='0'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="${bg}"
dunst_separator_color="${magentab}"
dunst_fg="${magentab}"
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
stalonetray_geometry="1x1-7+37"
stalonetray_gravity="NE"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$accent_color"
jg_sel_fg="$fg"
jg_sep="$black"

# Rofi menu font and colors
rofi_font="scientifica 12"
rofi_font_weight="bold"
rofi_background="$bg"
rofi_bg_alt="${accent_color}"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_fg_alt="${rofi_fg}E0"
rofi_selected="${greenb}F0"
rofi_selected_window="${magenta}"
rofi_highlight="${yellow}"
rofi_active="${greenb}"
rofi_urgent="${redb}"
rofi_urgent_window="#928374"
rofi_window_format="󰇙  {c}   {w} 󰇙 {t}"
rofi_on="${green}"
rofi_off="${cyan}"
rofi_background_window="$rofi_background"
rofi_background_alt_window="$rofi_background_alt"
rofi_text_window="$rofi_fg"
rofi_border_window="$rofi_background_window"
rofi_image="silvia"
rofi_main_alt="${bg}E6"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${fg:1}"
sl_ring="${yellow:1}"
sl_wrong="${red:1}"
sl_date="${fg:1}"
sl_verify="${green:1}"

# Cava color
cava_fg="magenta"

# Gtk theme
xfile="$HOME/.config/bspwm/src/config/xsettingsd"
gtk2="$HOME/.gtkrc-2.0"
gtk3="$HOME/.config/gtk-3.0/settings.ini"
gtk_font="Noto Sans 9"
gtk_theme="Gruvbox"
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
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall-2.mp4"
