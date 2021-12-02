# Setting up a new macOS laptop

# Old machine

backup the old laptop (SuperDuper/CarbonCopyCloner)
`brew bundle dump` and update repo

## fonts

Ideally all fonts were installed via homebrew. Otherwise check for them.

    system_profiler SPFontsDataType | grep Location

# New machine

## install xcode

    xcode-select --install

## clone the repo

    git clone https://github.com/tcurdt/laptop

## apply defaults

    ./defaults.sh

## install homebrew

    # export HOMEBREW_BREW_GIT_REMOTE="..."
    # export HOMEBREW_CORE_GIT_REMOTE="..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## install most software via homebrew

    brew bundle [--file ./Brewfile]

## copy old machine

    FROM=/Volume/Mirror ./restore.sh

## set backgroound

    osascript -e 'tell application "Finder" to set desktop picture to (POSIX path of (path to home folder)) & "Pictures/Wallpapers/electric-cloud.jpg" as POSIX file'

## hostname

    sudo scutil --set HostName shodan2

## set env

    launchctl load -w ~/Library/LaunchAgents/org.vafer.setenv.openscad.plist


## new ssh key

    ssh-keygen -t rsa -b 4096 -C "tcurdt@vafer.org"
    ssh-add -K ~/.ssh/id_rsa

##

CMD + SHIFT + H and drag the home folder to the sidebar.

