#!/bin/bash

# Define the script you want to run
SCRIPT_PATH="/path/to/your/script.sh"

# Define the start time for the cron job (7:00 PM)
START_TIME="19:00"

# Define the duration of 3 hours in minutes (180 minutes)
DURATION="180"

# Define the cron expression for Tuesdays and Thursdays at 7:00 PM
CRON_SCHEDULE="0 19 * * 2,4"

# Cron job to start the script at 7:00 PM on Tuesday and Thursday
CRON_JOB="($SCRIPT_PATH & sleep $DURATION && kill $!)"

# Add the cron job to the crontab
(crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $CRON_JOB") | crontab -

echo "Cron job has been created to run the script at $START_TIME every Tuesday and Thursday for 3 hours."
