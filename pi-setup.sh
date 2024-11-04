#!/bin/bash

echo "
█▀ █▄▄ █▀▀ ▀█▀ █▀█ █▀█ █░░ █▄▀ █ ▀█▀
▄█ █▄█ █▄▄ ░█░ █▄█ █▄█ █▄▄ █░█ █ ░█░
"

# Update and upgrade packages
echo "Updating and upgrading packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install essential programs
echo "Installing essential programs..."
sudo apt-get install -y \
    htop \
    vim \
    raspi-config \
    git \
    curl \
    wget \
    python3 \
    python3-pip

# Config htop
echo "Configuring htop..."

# Check if htop is installed
if ! command -v htop &> /dev/null
then
    echo "ERROR: htop could not be found."
    exit 1
fi

# Create the .config/htop directory if it doesn't exist
mkdir -p ~/.config/htop

cat << EOF > ~/.config/htop/htoprc
# Beware! This file is rewritten by htop when settings are changed in the interface.
# The parser is also very primitive, and not human-friendly.
htop_version=3.2.2
config_reader_min_version=3
fields=0 48 17 18 38 39 40 2 46 47 49 1
hide_kernel_threads=1
hide_userland_threads=0
hide_running_in_container=0
shadow_other_users=0
show_thread_names=0
show_program_path=1
highlight_base_name=0
highlight_deleted_exe=1
shadow_distribution_path_prefix=0
highlight_megabytes=1
highlight_threads=1
highlight_changes=0
highlight_changes_delay_secs=5
find_comm_in_cmdline=1
strip_exe_from_cmdline=1
show_merged_command=0
header_margin=1
screen_tabs=1
detailed_cpu_time=0
cpu_count_from_one=0
show_cpu_usage=1
show_cpu_frequency=0
show_cpu_temperature=0
degree_fahrenheit=0
update_process_names=0
account_guest_in_cpu_meter=0
color_scheme=0
enable_mouse=1
delay=15
hide_function_bar=0
header_layout=three_33_34_33
column_meters_0=AllCPUs Memory Swap
column_meter_modes_0=1 1 1
column_meters_1=Tasks LoadAverage Uptime
column_meter_modes_1=2 2 2
column_meters_2=DateTime Hostname NetworkIO DiskIO
column_meter_modes_2=2 2 2 2
tree_view=1
sort_key=46
tree_sort_key=46
sort_direction=-1
tree_sort_direction=-1
tree_view_always_by_pid=0
all_branches_collapsed=0
screen:Main=PID USER PRIORITY NICE M_VIRT M_RESIDENT M_SHARE STATE PERCENT_CPU PERCENT_MEM TIME Command
.sort_key=PERCENT_CPU
.tree_sort_key=PERCENT_CPU
.tree_view=1
.tree_view_always_by_pid=0
.sort_direction=-1
.tree_sort_direction=-1
.all_branches_collapsed=0
screen:I/O=PID USER IO_PRIORITY IO_RATE IO_READ_RATE IO_WRITE_RATE PERCENT_SWAP_DELAY PERCENT_IO_DELAY Command
.sort_key=IO_RATE
.tree_sort_key=PID
.tree_view=0
.tree_view_always_by_pid=0
.sort_direction=-1
.tree_sort_direction=1
.all_branches_collapsed=0
EOF

echo "htoprc file updated successfully!"

# Config vim
echo "Configuring vim..."

cat << EOF > ~/.vimrc
:set number
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
EOF

echo "vimrc file updated successfully!"


echo "Setup complete!"
echo "Your Raspberry Pi is now ready to use!"