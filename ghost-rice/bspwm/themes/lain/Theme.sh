#!/usr/bin/env bash
##
## LAIN RICE THEME
##
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Karla
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 48
	bspc config bottom_padding 2
	bspc config normal_border_color "#21222c"
	bspc config active_border_color "#353c52"
	bspc config focused_border_color "#353c52"
	bspc config presel_feedback_color "#ff79c6"
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
	cp -f ~/.config/kitty/themes/lain.conf ~/.config/kitty/current_theme.conf
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = false; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 10/g" \
		-e "s/\".*:class_g = 'Kitty'\"/\"90:class_g = 'Kitty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"98:class_g = 'FloaTerm'\"/g"
}

# Set rofi launcher
set_rofi_config() {
    cp -f ~/.config/bspwm/themes/lain/launcher.rasi ~/.config/bspwm/scripts/RiceSelector.rasi
}

# Set p10k theme
set_p10k_config() {
	sed -i "$HOME"/.p10k.zsh \
		-e"s/# typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION/typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION/g" \
		-e "s/POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=.*/POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰮕 󱎦󰫮󱎦󱎦'/g" \
 		-e "s/POWERLEVEL9K_OS_ICON_FOREGROUND=.*/POWERLEVEL9K_OS_ICON_FOREGROUND=147/g" \
		-e "s/POWERLEVEL9K_DIR_FOREGROUND=.*/POWERLEVEL9K_DIR_FOREGROUND=147/g" \
		-e "s/POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=.*/POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=147/g" \
		-e "s/POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=.*/POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=147/g"
}

# Set neofetch conf
set_neofetch() {
	sed -i "$HOME"/.config/neofetch/config.conf \
		-e "s/title=.*/title=\"PRESENT DAY, PRESENT TIME!\"/g" \
		-e 's/image_source=.*/image_source="'${HOME//\//\\/}'\/.config\/neofetch\/lain.png"/g' \
		-e 's/prin \".*${title}/prin \"\\n \\n \\n \\n \\n \\n \\n \\n \\n \\n${title}/g' 
}

# Launch the bar
launch_bars() {
	polybar -q lain-bar -c ${HOME}/.config/bspwm/themes/lain/config.ini &
	polybar -q lain-bar2 -c ${HOME}/.config/bspwm/themes/lain/config.ini &
	polybar -q lain-bar3 -c ${HOME}/.config/bspwm/themes/lain/config.ini &
}

### ---------- Apply Configurations ---------- ###
set_bspwm_config
set_term_config
set_picom_config
set_rofi_config
set_p10k_config
set_neofetch
launch_bars