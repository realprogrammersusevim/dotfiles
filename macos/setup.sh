#!/usr/bin/env bash

# Inspiration from https://github.com/mathiasbynens/dotfiles

osascript -e 'tell application "System Settings" to quit'

sudo -v

# General UI

sudo scutil --set ComputerName "0x6a6f6e617468616e"
sudo scutil --set HostName "0x6a6f6e617468616e"
sudo scutil --set LocalHostName "0x6a6f6e617468616e"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6a6f6e617468616e"

sudo nvram SystemAudioVolume=" "

# AppleHighlightColor can be set to any color by getting the RGB values, dividing each by 255 and putting them in R G B
defaults write NSGlobalDomain AppleHighlightColor -string "0.15686275 0.20392157 0.34117647"

defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Input

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Keyboard control everywhere
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Sound

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80
defaults write com.apple.BluetoothAudioAgent "Stream - Flush Ring on Packet Drop (editable)" 0
defaults write com.apple.BluetoothAudioAgent "Stream - Max Outstanding Packets (editable)" 16
defaults write com.apple.BluetoothAudioAgent "Stream Resume Delay" "0.75"

defaults write bluetoothaudiod "Enable AAC codec" -bool true
defaults write bluetoothaudiod "AAC Bitrate" -int 320
defaults write bluetoothaudiod "AAC max packet size" -int 644

sudo pkill bluetoothd

# Finder

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Kill affected applications

for app in "Activity Monitor" "cfprefsd" "Dock" "Finder" "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
