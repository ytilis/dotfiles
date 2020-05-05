# MacOS or Linux
#[[ `uname` == 'Darwin' ]] && MAC_OS=true || MAC_OS=false

# Like the copy command but with a progress bar
abbr --add --global cpv 'rsync -ah --info=progress2'

# Count files, ignoring directories, but not the contents of directories
abbr --add --global count 'find . -type f | wc -l'

# some more ls aliases
abbr --add --global ll 'ls -alF'
abbr --add --global la 'ls -A'
abbr --add --global l 'ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
abbr --add --global alert 'notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#if $MAC_OS; then
#  alias lt='du -sh * | sort -h'
#else
#  alias lt='ls --human-readable --size -1 -S --classify'
#fi

# Simpler mount command
#if $MAC_OS; then
#  abbr --add --global mnt 'mount | grep -E ^/dev | column -t'
#else
#  abbr --add --global mnt "mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
#fi
