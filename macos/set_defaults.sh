echo 'Setting defaults'

sudo -v

# Keep-alive: update existing `sudo` time stamp until '.osx' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable sound effects on boot
sudo nvram StartupMute=%01

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Set the icon size of Dock items to 64 pixels
defaults write com.apple.dock tilesize -int 64

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

echo 'Done. Some of these changes might require a logout/restart to take effect.'