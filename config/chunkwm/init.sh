#!/bin/bash

chunkc core::plugin_dir /usr/local/opt/chunkwm/share/chunkwm/plugins
chunkc core::hotload 1

chunkc set global_desktop_mode           bsp

chunkc set global_desktop_offset_top     0
chunkc set global_desktop_offset_bottom  0
chunkc set global_desktop_offset_left    0
chunkc set global_desktop_offset_right   0
chunkc set global_desktop_offset_gap     0

chunkc set desktop_padding_step_size     10.0
chunkc set desktop_gap_step_size         5.0

chunkc set bsp_spawn_left                1
chunkc set bsp_optimal_ratio             1.618
chunkc set bsp_split_mode                optimal
chunkc set bsp_split_ratio               0.5

chunkc set window_focus_cycle            monitor
chunkc set mouse_follows_focus           1
chunkc set window_float_next             0
chunkc set window_float_center           1
chunkc set window_region_locked          1

chunkc set mouse_modifier                fn
chunkc set mouse_follows_focus           0

chunkc set preselect_border_color        0xffd75f5f
chunkc set preselect_border_width        0
chunkc set preselect_border_radius       0

chunkc set window_float_center           1

chunkc core::load tiling.so
chunkc core::unload ffm.so

#
# NOTE: shell commands require escaped quotes
#       to pass value containing a whitespace.
#

chunkc tiling::rule --owner Spotify --role AXWindow --subrole AXDialog --state tile
chunkc tiling::rule --owner Finder --state float
chunkc tiling::rule --owner Messages --state float
chunkc tiling::rule --owner Finder --name Copy --state float
chunkc tiling::rule --owner \"App Store\" --state float
chunkc tiling::rule --owner \"Virtual Machine Library\" --state float
chunkc tiling::rule --owner \"^Activity Monitor.*\" --state float
chunkc tiling::rule --owner \"Evernote\" --state float -except \"Main Window\"
chunkc tiling::rule --owner \"Logitech Gaming Software\" --state float
chunkc tiling::rule --owner \"Telegram\" --state float
chunkc tiling::rule --owner \"Viber\" --state float
chunkc tiling::rule --owner \"Tip of the Day\" --state float
chunkc tiling::rule --owner \"Create New Branch\" --state float
