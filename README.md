# Machine Setup
This repository is what I use to setup a new machine or a virtual machine with the configuration and apps that I use on a day by day basis

## Supported Systems
- El Capitan and Up
- Ubuntu / Debian based systems
- WSL

## Things to Install
Here is the list of things you will want to install before you clone the repository

### Common
- Curl
- Git
- Wget

### Mac
- iTerm2
- Xcode command line tools

### WSL/Windows
- A better terminal

Not really a requirement but recommended that you have all the updates installed on your machine

## Configuration
If you open up the `install.sh` file, there will be some variables that you can alter to your liking

``` shell
EMAIL="myemail@test.com"
DEVFOLDER="$HOME/Development"
BIN="$HOME/bin"
```

## Running it
So to run this, you will want to clone the repo, edit the config file to match. Then run the following in your terminal:

``` bash
> ./install.sh
```

It will prompt you, what system you want to run this for. Select it and go on.
After its all done, you will have to run the following commands:

``` bash
> tic $HOME/.dotfiles/resources/xterm-256color-italic.terminfo
> tic -a $HOME/.dotfiles/resources/tmux-256color-italic.terminfo
```

Close the terminal and open a new one and run the following command to set theme:

``` bash
> base16_default-dark
```

If you find any issues, please open an issue and let me know. Thanks
