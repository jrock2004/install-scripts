# Installer Scripts
Scripts that is used to setup a new computer. For now all that is supported is
Linux OS.

## Pre-req
You will need to install the following before using this script

- git
- curl
- wget

You will also want to make sure that your system is up-to-date before running this
## Before Running The Script
Before you run the script there are a few things that you should know

- I have tested this myself on my machines. If this does not work for you,
please open an issue and I will try to help
- You need to edit a few files before you start
  - install.sh - Update the variables if needed
  - scripts/*-based.sh - You may not like the apps I install or you may want
  to add to it

## Running the script
Ok, so you installed all the apps that needed to be installed? Now you will
want to run the following commands:

```
$ chmod +x ./install.sh
$ ./install.sh
```

Sit back and wait for any prompts that come up for you to accept
and or handle

## Coming soon
Here are the list of things I want to add to

- Support for Bash on Windows
- Support for OSX
