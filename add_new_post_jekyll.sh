#!/bin/bash

#Read user input. If is empty we will ask again.
while [ -z "$filename" ]
do	echo -n 'Filename: '
	read -r filename
	[ -z "$filename" ] && echo 'Please try again.'
done

while [ -z "$category" ]
do	echo -n 'Categories: '
	read -r category
	[ -z "$category" ] && echo 'Please try again.'
done

#Filename option.
edit_filename=$(echo -e "-"$filename | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
date=$(date +"%Y-%m-%d")

#Saving file name with our option.
save=$(echo "$date$edit_filename.markdown")

#Options for the adding content.
title=$(echo -e $filename)
title="${title^}"
category=$(echo $category | tr '[:upper:]' '[:lower:]' )

#We will add our options into the file and then saving it with the latest changes.
touch $save
cat > $save << EOL
---
layout: post
title : "$title"
date  : $date
categories:
   - $category
---
EOL

#Color option for customize output.
GREEN='\033[0;32m'
NC='\033[0m'
#Print the final version on the screen.
echo " /_->Output<-_\ "
echo -e "${GREEN}Filename is: ${NC}$save"
echo -e "${GREEN}File content:${NC}"
cat  << EOL
---
layout: post
title : "$title"
date  : $date
categories:
   - $category
---
EOL
