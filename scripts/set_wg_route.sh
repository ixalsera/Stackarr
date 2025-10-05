#! /bin/sh
WIREGUARDIP=$(nslookup wireguard | grep "Address" | awk 'NR==2{print $2}')
echo "Removing default route..."
ip route del default && echo "Default route removed."
echo "Adding new default route via Wireguard IP: $WIREGUARDIP"
ip route add default via "$WIREGUARDIP" && echo "New default route added."
echo "Routing table updated."