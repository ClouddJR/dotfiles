echo 'Setting defaults'

sudo -v

# Keep-alive: update existing `sudo` time stamp until '.osx' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable sound effects on boot
sudo nvram SystemAudioVolume=" "