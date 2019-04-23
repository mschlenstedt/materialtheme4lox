#!/bin/bash

# Adjust the Material Theme for LMS for a Loxone Look and Feel
# (Green)

# Check for root
if test $UID -ne 0; then
	echo "This script has to be run as root. Exiting."
	exit 1
fi

# Search installation folder
if [ ! -d "/var/lib/squeezeboxserver/cache/InstalledPlugins/Plugins/MaterialSkin/HTML/material/html/lib" ]; then
	echo "Cannot find installation folder of Material Theme. You can enter the full path manually or cancel."
	echo "(enter full path or 'c' for cancel)"
	read folder
	if [[ $folder == "c" ]]; then
		echo "Good bye."
		exit 0
	fi
	if [ ! -e "$folder/HTML/material/html/lib/vuetify.min.css" ]; then
		echo "Cannot find installation folder of Material Theme in $folder. Giving up."
		echo "Good bye."
		exit 0
	fi
else
	folder="/var/lib/squeezeboxserver/cache/InstalledPlugins/Plugins/MaterialSkin/HTML/material/html/lib"
fi
echo "Found Material Theme in $folder"

# Changing files
echo "Backing up $folder/vuetify.min.css to vuetify.min.css.backup"
cp $folder/vuetify.min.css $folder/vuetify.min.css.backup

echo "Backing up $folder/vuetify.min.js to vuetify.min.js.backup"
cp $folder/vuetify.min.js $folder/vuetify.min.js.backup

echo "Changing colors..."
sed -i 's/#1976D2/#82B827/g' $folder/vuetify.min.css
sed -i 's/#1976D2/#82B827/g' $folder/vuetify.min.js
sed -i 's/.theme--dark.v-toolbar{background-color:#212121/.theme--dark.v-toolbar{background-color:#82B827/' $folder/vuetify.min.css

echo "Done. Good bye."
