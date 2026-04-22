#!/bin/bash
VPN_NAME="wg0"

if nmcli connection show --active | grep -q "$VPN_NAME"; then
	nmcli connection down "$VPN_NAME" && notify-send -u normal -a "SYSTEM" "Secure Tunnel" "Tunnel Closed."
else
	nmcli connection up "$VPN_NAME" && notify-send -u normal -a "SYSTEM" "Secure Tunnel" "Secure Connection Established to MSF."
fi
