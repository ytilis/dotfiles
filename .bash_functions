# Navigation shortcut
function cl() {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && \
  # use your preferred ls command
  ls -la --color=auto
}

# Standardized function to set env vars
function setenv() {
  export "$1=$2";
}

# Source optional file shorthand
function sourceIf() {
  local -r file="$1"
  shift
  test -f "$file" && source "$file" "$@"
}

# sshuttle helpers
#########################

# set default SSH server:
#   user@hostname or a host in ~/.ssh/config
TNL_SERVER=skynet

# tunnel all traffic including DNS
alias tnl="sshuttle --dns -vr $TNL_SERVER 0/0"

# returns a list of IP addresses from given domain(s).
#
# Examples:
#  dns2ip google.com
#  dns2ip netflix.com movies.netflix.com
#
function dns2ip() {
  dig +short $* | sed "/[^0-9\.]/d" # use sed to remove non-IPv4 line e.g. alias
}

# tunnel specified domain(s) only.
#
# Examples:
#  tnlonly google.com
#  tnlonly netflix.com movies.netflix.com
#
function tnlonly() {
  sshuttle -vr $TNL_SERVER `dns2ip $*`;
}

# tunnel all traffic including DNS, except the specified domain(s).
#
# Examples:
#  tnlbut youku.com
#  tnlbut youku.com weibo.com
#
function tnlbut() {
  sshuttle --dns -vr $TNL_SERVER `dns2ip $* | sed "s/^/-x/"` 0/0; # use sed to append '-x' prefix
}

# vpn to a ssh server.
#
# Examples:
#  vpnto my_office_server      # host in ~/.ssh/config
#  vpnto user@123.123.123.123
#
function vpnto() {
  sshuttle -HNvr $1;
}
