# Tools
alias w="webstorm ."
alias cat="bat"
alias fz="fzf --preview 'bat --color=always {}'"

# Code Spelunker
alias cs="/Users/andrewmcdowell/Developer/binaries/cs_1.2.0_Darwin_x86_64/cs"


# Git helpers
alias gst="git status"
alias ga="git add"
alias gph="git push origin HEAD"
alias gp="git push origin"
alias gpl="git pull origin"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias "gc -m"="gcm"
alias gc="git commit"
alias gcl="git clone"

# Git branches
alias gblist="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias gblast="git for-each-ref --count=1 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

# Image enhancement
alias enhance='function ne() { sudo docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`"; }; ne'


# npm helpers
alias nd="npm run dev"
alias nr="npm run"
alias nt="npm run test"
alias nlt="npm run lint"


# Misc
alias video_to_gif='function video_to_gif(){ ffmpeg -i $1 output.gif && gifsicle -O3 output.gif -o output.gif && say "Video is ready!"};video_to_gif'
alias ls="ls -laFhtr"
alias lt='du -sh * | sort -hr'
alias hs='history|grep'
alias cls='clear && printf "\e[3J"'

# GDAL - opens the gdal docker image and mounts the current directory to data and output
alias gdal_docker="docker run -it --rm -v .:/data -v ./output:/output ghcr.io/osgeo/gdal /bin/bash"

# Count files
alias count='echo  "Count: $(ls | wc -l)"'

# What is running on this port? 
wp() {
  if [[ -z $1 ]]; then
  	echo "What is running on this port?"
    echo "Usage: wp <port_number>"
  else
    lsof -i :$1
  fi
}

# Kill the process on this port
kp() {
  if [[ -z $1 ]]; then
    echo "Kill the process on this port"
    echo "Usage: kp <port_number>"
    return 1
  fi
  
  local pids=$(lsof -ti:$1 2>/dev/null)
  
  if [[ -z $pids ]]; then
    echo "No process found running on port $1"
    return 1
  fi
  
  echo "Killing process(es) on port $1: $pids"
  
  # Convert newline-separated PIDs to space-separated and kill them
  echo "$pids" | xargs kill -9
}

# Zip utils
alias zip_list='function __zip_list() { find "$1" -name "$2" -print0 | xargs -0 zip "$3"; }; __zip_list'
alias zip_list_flat='function __zip_list() { local orig_dir=$(pwd); cd "$1" && find . -mindepth 1 -maxdepth 1 -print0 | xargs -0 zip "$orig_dir/$2"; cd "$orig_dir"; }; __zip_list'

# See the unzipped size of a zip file
unzip-look() {
  unzip -l $1 | tail -1 | awk '{print $1/1024/1024/1024" GB"}'
}

# Make folder and cd in
mkcd () {
  \mkdir -p "$1"
  cd "$1"
}
