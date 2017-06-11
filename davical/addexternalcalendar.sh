#!/bin/bash

# Setup the variables below and run it where davical.example.nl is accessible, to add external calendars to that user's collection.

USERNAME=piet
CALENDAR=https://davical.example.nl/calendar/caldav.php/$USERNAME/
REMOTE=https://example.com/ical?cal=dfg6dgf6dgf79dgf75dgf597
CALNAME="Example"

curl --basic --user $USERNAME -X BIND -H 'Content-Type: text/xml;charset="UTF-8"' --url $CALENDAR -d "<?xml version='1.0' encoding='utf-8'?><bind xmlns='DAV:'><segment>$CALNAME</segment><href>$REMOTE</href></bind>"