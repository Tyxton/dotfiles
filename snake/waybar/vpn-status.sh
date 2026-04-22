#!/bin/bash

if nmcli connection show --active | grep -q "wg0"; then
	echo "UP"
else
	echo "DOWN"
fi
