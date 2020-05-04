# sshuttle helpers

# set default SSH server:
#   user@hostname or a host in ~/.ssh/config
set TNL_SERVER skynet

# tunnel all traffic including DNS
alias tnl="sshuttle --dns -vr $TNL_SERVER 0/0"

# returns a list of IP addresses from given domain(s).
#
# Examples:
#  dns2ip google.com
#  dns2ip netflix.com movies.netflix.com
#
function dns2ip
  dig +short $argv | sed "/[^0-9\.]/d" # use sed to remove non-IPv4 line e.g. alias
end

# tunnel specified domain(s) only.
#
# Examples:
#  tnlonly google.com
#  tnlonly netflix.com movies.netflix.com
#
function tnlonly
  sshuttle -vr $TNL_SERVER (dns2ip $argv);
end

# tunnel all traffic including DNS, except the specified domain(s).
#
# Examples:
#  tnlbut youku.com
#  tnlbut youku.com weibo.com
#
function tnlbut
  sshuttle --dns -vr $TNL_SERVER (dns2ip $argv | sed "s/^/-x/") 0/0; # use sed to append '-x' prefix
end

# vpn to a ssh server.
#
# Examples:
#  vpnto my_office_server      # host in ~/.ssh/config
#  vpnto user@123.123.123.123
#
function vpnto
  sshuttle -HNvr $1;
end
