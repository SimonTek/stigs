#!/bin/bash
#Created by Matthew M. Conley / SimonTek

#Group ID: V-38474
#Group Title: SRG-OS-000030
#Version: RHEL-06-000508
#Severity: low
#Description: The ability to lock graphical desktop sessions manually allows users to easily secure their accounts should they need to depart from their workstations temporarily.
#Rule Title: The system must allow locking of graphical desktop sessions.
#Version: RHEL-06-000508

#Check Content: Verify the keybindings for the Gnome screensaver:
# gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gnome_settings_daemon/keybindings/screensaver
#If no output is visible, this is a finding.

#Fix Text: Run the following command to set the Gnome desktop keybinding for locking the screen:
# gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --type string --set /apps/gnome_settings_daemon/keybindings/screensaver "<Control><Alt>l"
#Another keyboard sequence may be substituted for "<Control><Alt>l", which is the default for the Gnome desktop.
if gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gnome_settings_daemon/keybindings/screensaver|grep -q '<Control><Alt>l'; then 
	echo "This machine is RHEL-06-000508 Compliant" >> /var/log/Stig
	echo "This machine is RHEL-06-000508 Compliant"
else
	echo "This machine isn't RHEL-06-000508 Compliant " >> /var/log/Stig
	echo "This machine isn't RHEL-06-000508 Compliant "
	gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --type string --set /apps/gnome_settings_daemon/keybindings/screensaver "<Control><Alt>l"
fi

