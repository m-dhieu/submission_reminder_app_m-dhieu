#!/bin/bash

# Ensure the script runs in interactive mode
shopt -s expand_aliases  # Enable alias expansion
source ~/.bashrc          # Source .bashrc to load any aliases or functions

# Create a prompt to request for the user's name which will be used in the creation of the submission_reminder_{yourName} directory.
echo "Hello! Please enter your name:"
read userName
directory="submission_reminder_$userName"
mkdir -p "$directory"

echo "Hello $userName 😊"
echo "Welcome to the reminder application!"
echo "submission_reminder_$userName directory created!"
echo "This directory contains all the necessary subdirectories and files including the startup.sh file, to set up the reminder application."
echo "The reminder application will help you avoid last-minute stress effortlessly by sending alerts prior to all your assignment deadlines!"
echo "Setting up your app environment..."

# Create subdirectories in the submission_reminder_yourName directory, and the neceessary files with sample content in their respective directories.
mkdir -p "$directory/app" "$directory/modules" "$directory/assets" "$directory/config"

touch "$directory/app/reminder.sh" "$directory/modules/functions.sh" "$directory/assets/submissions.txt" "$directory/config/config.env" "$directory/startup.sh"

echo "Almost there..."
echo "Subdirectories and files created!"

# Populate reminder.sh and functions.sh files with source code, config.env file with sample environment variables, and submissions.txt file with sample student records in the format: student, assignment, submission status.
cat <<EOL > "$directory/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL

cat <<EOL > "$directory/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOL

cat <<EOL > "$directory/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

cat <<EOL > "$directory/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Monica, SQL Queries, submitted
Bradley, Shell Navigation,not submitted
Sunday, Computer Vision,submitted
Anna, Shell Navigation, not submitted
Udochukwu, Frontend Web-development, submitted
Bruce, Python Basics, not submitted
Mike, Shell Navigation, not submitted
Nzengele, Shell Navigation, not submitted
EOL

echo "Continuing set up..."
echo "Files populated."

# Give the startup.sh file execution permissions as it contains logic that starts up the reminder app when executed.
cat <<EOL > "$directory/startup.sh"
#!/bin/bash
# Source the contents of the config.env file and execute the reminder.sh file.
source ./config/config.env

echo "Starting Submission Reminder Application..."
bash ./app/reminder.sh
EOL

chmod +x "$directory/startup.sh"

echo "App environment set up complete! 🚀"
echo "You can now run your application using: $directory/startup.sh."
echo "Feel free to explore the app features, and reach out for help or any clarification. Stay connected!"
echo "Enjoy using it, $userName."
printf "\U1F389\U1F483\U1F57A\n"
