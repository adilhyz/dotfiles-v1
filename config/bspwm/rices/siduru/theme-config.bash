## ┏━┓╻╺┳┓╻ ╻┏━┓╻ ╻  ╺┳╸╻ ╻┏━╸┏┳┓┏━╸
## ┗━┓┃ ┃┃┃ ┃┣┳┛┃ ┃   ┃ ┣━┫┣╸ ┃┃┃┣╸ 
## ┗━┛╹╺┻┛┗━┛╹┗╸┗━┛   ╹ ╹ ╹┗━╸╹ ╹┗━╸ by adilhyz
## original theme

# (Dina-Hawu) colorscheme
bg="#e4ddd0"        # Warna latar belakang dibuat lebih netral, dengan nuansa krem keabu-abuan
fg="#0e1220"        # Foreground tetap kontras agar tidak pucat

black="#f3e9dc"
blacklight="#aaa39a"
red="#6e1c2b"
green="#337073"
yellow="#677921"
blue="#3d6a99"
magenta="#db9fcc"
cyan="#a7aafb"
white="#181e1c"
blackb="#f3e9dc"
redb="#6e1c2b"
greenb="#337073"
yellowb="#677921"
blueb="#3d6a99"
magentab="#db9fcc"
cyanb="#a7aafb"
whiteb="#aaa39a"

accent_color="#eac6a9"
arch_icon="#0A9CF5"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TP="2"
BP="34"
LP="2"
RP="2"
WG="6"
NORMAL_BC="${greenb}"		# Normal border color
ACTIVE_BC="${greenb}"		# Active border color
FOCUSED_BC="${magentab}"	# Focused border color
PRESEL_BC="${magentab}"		# Indicator color

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
P_TERM_OPACITY="0.8"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(237, 40)'
dunst_origin='bottom-right'
dunst_transparency='22'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="${black}"
dunst_separator_color="$blue"
dunst_fg="$cyan"
dunst_icon_theme="Nordzy-cyan-dark--light_panel"
dunst_icon_position="right"
dunst_icon_size="50"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

#Stalone
stalonetray_bg="${black}"
stalonetray_vertical="true"
stalonetray_geometry="1x1-295+700"
stalonetray_gravity="SE"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$accent_color"
jg_sel_fg="$fg"
jg_sep="$white"

# Rofi menu font and colors
rofi_font="IDroid 8"
rofi_font_weight="bold"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="${fg}"
rofi_fg_alt="${rofi_fg}E0"
rofi_selected="${magenta}"
rofi_selected_window="${blue}"
rofi_highlight="$fg"
rofi_active="${greenb}"
rofi_urgent="${redb}"
rofi_urgent_window="#e57569"
rofi_window_format=" {c}  [{w}]  {t}"
rofi_on="#ff927a"
rofi_off="#e57569"
rofi_background_window="$rofi_background"
rofi_background_alt_window="$rofi_background_alt"
rofi_text_window="$rofi_fg"
rofi_border_window="$rofi_background_window"
rofi_image="siduru"
rofi_main_alt="${bg}E0"

# Screenlocker
sl_bg="${fg:1}"
sl_fg="${bg:1}"
sl_ring="${yellow:1}"
sl_wrong="${red:1}"
sl_date="${bg:1}"
sl_verify="${magentab:1}"

# Cava color
cava_fg="cyan"

# Gtk theme
xfile="$HOME/.config/bspwm/src/config/xsettingsd"
gtk2="$HOME/.gtkrc-2.0"
gtk3="$HOME/.config/gtk-3.0/settings.ini"
gtk_font="Noto Sans 9"
gtk_theme="Adapta-Eta"
gtk_icons="Nordzy-cyan-dark--light_panel"
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
