#!/bin/bash
clear
timesDir="./_Internal/_Times/"
chromeProfile="Profile 6"
browserTabs=(
	"https://www.gmail.com"
	"https://calendar.google.com"
	"https://docs.google.com/spreadsheets/d/10VhxG1HsDgMlLmta7_6Y2C936Jg6hCJhSVMKRgQVfXk/edit#gid=0&range=A108"
	"https://basecamp.com/1968633/"
	"https://trello.com/gravityworks"
)
apps=(
	"Slack"
	"Spotify"
)


# Open Browser
open -n -a /Applications/Google\ Chrome.app --args --profile-directory="${chromeProfile}" --new-window --start-fullscreen --start-maximized --enable-fullscreen-app-list

# Loop through array of urls to open
for i in "${browserTabs[@]}"
do
   : 
   open -n -a /Applications/Google\ Chrome.app --args $i
done

# Wait for a moment
/bin/sleep 1

# Make Browser Full Screen
/usr/bin/osascript -e "tell application \"Google Chrome\""  -e "activate" -e "tell application \"System Events\"" -e "keystroke \"f\" using {control down, command down}" -e "end tell" -e "end tell"

# Loop through array of apps to open
for i in "${apps[@]}"
do
   : 
   open -a $i
done


startDate=$(date)
endDate=$(date -j -v+4d)
weekDayNum=$(date +'%u') # 1 is Monday
month=$(date +'%m')
year=$(date +'%Y')

# # If today is NOT Monday
if [ $weekDayNum -gt 1 ];
then
	# Get the date for the last Monday
	startDate=$(date -j -v-$(($weekDayNum-1))d)
	endDate=$(date -j -v+$((5-$weekDayNum))d)
fi

weekStartMonth=$(date -j  -f "%a %b %d %T %Z %Y"  "${startDate}" +'%m')
weekStartDay=$(date -j  -f "%a %b %d %T %Z %Y"  "${startDate}" +'%d')
weekEndMonth=$(date -j  -f "%a %b %d %T %Z %Y"  "${endDate}" +'%m')
weekEndDay=$(date -j  -f "%a %b %d %T %Z %Y"  "${endDate}" +'%d')

# # Check if Year Directory Exists
[ -d "$timesDir$year" ] || mkdir $timesDir$year

# # Check if Month Directory Exists
[ -d "$timesDir$year'/'$month" ] || mkdir $timesDir$year'/'$month

filePath=$timesDir$year"/"$month"/"$weekStartMonth"."$weekStartDay"-"$weekEndMonth"."$weekEndDay".rtf"

# # Create file if it doesn't exist
[ -f "$filePath" ] || cp $timesDir"template.rtf" $filePath
open $filePath

osascript -e 'display notification "Everything is ready to go" with title "Get To Work"'