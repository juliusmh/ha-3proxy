#!/bin/sh
set -eu

opts=/data/options.json
listen=$(jq -r .listen "$opts")
port=$(jq -r .port "$opts")
user=$(jq -r .username "$opts")
pass=$(jq -r .password "$opts")

# The add-on runs on the host network, so without credentials it would be
# an open proxy for the whole LAN.
if [ -z "$user" ] || [ -z "$pass" ]; then
	echo "username and password must be set" >&2
	exit 1
fi

# The password is written into 3proxy's config as a quoted string.
case "$pass" in
*[[:space:]\"]*)
	echo "password must not contain spaces or double quotes" >&2
	exit 1
	;;
esac

cfg=/tmp/3proxy.cfg
cat > "$cfg" <<CFG
log
auth strong
users "$user:CL:$pass"
allow $user
socks -p$port -i$listen
CFG

echo "3proxy listening on $listen:$port"
exec 3proxy "$cfg"
