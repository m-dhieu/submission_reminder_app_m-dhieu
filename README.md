# Submission Reminder Application

This is an application designed to help students plan for deadlines. It sends alerts for all upcoming assignment deadlines prior to the deadlines. It is built on a shell script that automates the creation of folders and files, sourcing code from provided samples to set up the application's directory structure, which simulates a real-world application environment.

## Table of Contents
- [Setup Instructions](#setup-instructions)
- [Usage Instructions](#usage-instructions)
- [Directory Structure](#directory-structure)
- [App Features](#app-features)
- [Customization](#customization)
- [Script Explanation](#script-explanation)
- [Contact Information](#contact-information)

## Setup Instructions

### Step 1: Clone the Repository. Use:
```
git clone [https://github.com/m-dhieu/submission_reminder_app_m-dhieu.git]
```

### Step 2: Navigate to the cloned Repository. Use:
```
cd submission_reminder_app_m-dhieu
```

### Step 3: Run the create_environment script to complete setting up the application environment. Use:
```
bash create_environment.sh
```

## Usage Instructions

**Navigate to the app directory. Use:**
```
cd submission_reminder_{yourName}
```

**Run the startup.sh script to start the reminder application. Use:**
```
bash startup.sh
```

## Directory Structure
```
submission_reminder_{userName}/
├── app/
│   └── reminder.sh                              # Contains source code.
├── modules/
│   └── functions.sh                             # Contains source code.
├── assets/
│   └── submissions.txt                          # Contains student records.
├── config/
│   └── config.env                               # Contains environment variables.
└── startup.sh                                   # Starts the application.
```
## App Features

- **Customizable Alerts: Users can modify alert messages to suit their preferences.**
- **Recurring Reminders: Users can configure the reminders to repeat daily, weekly, or at intervals suited to their preferences.**
- **User-Friendly: The simple application design makes it easy to navigate.**

## Customization

Modify the following files to customize the application:

* **`config/config.env`**:
   For more complex configurations, add environment variables, e.g., SECRET_KEY, for signing in tokens/passwords.

* **`assets/submissions.txt`**:
  Add or modify student records. The file should follow the format:

    ```
    student, assignment, submission status
    Chinemerem, Shell Navigation, not submitted
    Chiagoziem, Git, submitted
    ```
The file should have a minimum of five students added after the fourth student to test the application functionality better.

* **`app/reminder.sh`**:
  Modify the reminder message to your preference.

* **`modules/functions.sh`**:
  Add or modify functions as needed.

## Script Explanation

### User Input
The first `echo` creates a prompt message visible to the user.

`read` obtains input (the user's name).

Subsequent `echo` displays the specified messages.

### Directory Creation
`mkdir -p` creates an app directory using the `submission_reminder_user_name` format.

It also creates the subdirectories.

### File Creation
`touch` creates the necessary files, while `cat <<EOL > "filename"` populates them with structured content directly from the command line.

Note: The file should have a minimum of five students added after the fourth student to test the application functionality better.

### Sourcing and Execution
`source ./path/to/file` sources the contents of the `config.env` file.

`bash ./path/to/file` executes the `reminder.sh` file.

### Setting Execution Rights
`chmod +x "/path/to/file"` assigns execution rights to the `startup.sh` file.

### Emoji Printing
`printf "\Unicode\n"` prints desired emojis.

NOTE:
The displayed emojis and messages are for enhancing user interaction during setup. They are optional and do not affect the application's functionality.

Copying and pasting emojis in the script also prints them.

`mkdir` also creates directories, but `mkdir -p` is convenient as it creates the target directory and any necessary parent directories along the specified path.

'echo -e "text\ntext\ntext\n "> filename` also populates the files. However, it is not as convenient as `cat <<EOL > "filename"` which allows for easy creation of files with structured content (multi-line input) directly from the command line.

The `$` in the script is used for variable expansion and referencing unique variables.

## Contact Information

For any queries or feedback, reach out at:
[m.dhieu@alustudent.com](mailto:m.dhieu@alustudent.com)
