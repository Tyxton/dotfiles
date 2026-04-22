if nmcli connection show --active | grep -q "wg0"; then
	echo " UP"
else
	echo ""
fi
