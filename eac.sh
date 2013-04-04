#!/bin/bash
if ! source "lib-bash-leo.sh" ; then
	echo 'lib-bash-leo.sh is missing in PATH!'
	exit 1
fi

if ! umount /mnt/cdrom &> /dev/null ; then
	# No error, just make sure it was not already mounted.
fi

if ! mount /mnt/cdrom ; do
	notify-send --urgency=critical --category=device.error 'Starting Exact Audio copy failed!' 'You have to insert a data CDROM before starting EAC!'
done

WINEARCH=win32 wine ./.wine/drive_c/Program\ Files/Exact\ Audio\ Copy/EAC.exe

umount /mnt/cdrom
