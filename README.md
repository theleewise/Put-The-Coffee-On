# Put The Coffee On #

This is a simple shell script to automate some of the tasks I do everday I sit down to work.

1.	Open Google Chrome using work profile
2.	Open a list of sites e.g. Gmail, Google Calendar, Basecamp, Trello
3.	Open a list of apps e.g. Slack & Spotify
4.	Open this week's time tracking document

## Open Browser & Sites ##

The script will attempt to open a specific profile in Google Chrome. This can be set on the variable 'chromeProfile'.

To find the profile for your use, open Chrome and go to chrome://version/ Then find 'Profile Path' and it will be at the end. It will be a number unless it is your default profile.

The list of urls to open is a simple array (browserTabs) that you can add to or remove from without any additional changes to the code.

## Open Applications ##

The list of applications to open, other than Chrome, is a simple array (apps) that you can add to or remove from without any additional changes to the code.

## Time Tracking Document ##

The script will open the current weeks time tracking document OR create a new one if it's a new week. If it's a new month and / or year it will also create the coresponding directory. The desired directory and file structure is 
/YYYY/MM/

And the file name follows this pattern: the month the week starts on + "." + the date the week starts on + "-" + the month the week ends on + "." + the date the week ends on + file extension.

*Example*
01.01-01.04.rtf

*Note*
The directory containing the time documents needs to reside in or under the directory with the script. From there the specific path can be changed in the script (timesDir).