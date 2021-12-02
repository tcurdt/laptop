#!/bin/sh
# https://gist.github.com/1623487
set -e

# Default to On My Mac
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Disable window animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# No Dashboard
# defaults write com.apple.dashboard mcx-disabled -boolean true

# Turn on dashboard-as-space
#defaults write com.apple.dashboard enabled-state 2

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# keyboard
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 0

# typing
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# 3 finger drag
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true


# Trackpad: map bottom right corner to right-click
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 && \
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 && \
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true


# Finder

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder
# defaults write com.apple.finder ShowPathbar -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Enable copy in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool YES

# finder files
chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable ext change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true



# Dock

# Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true







# Safari

# Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write -g WebKitDeveloperExtras -bool true

# Disable webkit homepage
# defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true



# Chrome

# disable print preview
# defaults write com.google.Chrome DisablePrintPreview -boolean true



# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen 1


# Hiding the morons file locations
# chflags hidden ~/Creative\ Cloud\ Files
# chflags hidden ~/Pictures/VueScan