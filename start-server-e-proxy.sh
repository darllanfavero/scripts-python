#!/bin/bash
set -e

# Update /etc/hosts and start license server
echo "127.0.0.1 lic.cryptolive.one" >> /etc/hosts
echo "127.0.0.1 lic.bitmaster.cc" >> /etc/hosts
(cd /opt/o11/license && python server.py &)

# Start proxy
(cd /opt/proxy && python proxy.py --host=0.0.0.0 &)

# Start o11 server
exec $@