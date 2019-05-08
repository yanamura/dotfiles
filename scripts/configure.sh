#!/usr/bin/env bash


## track pad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

## dock
defaults write com.apple.dock show-recents -bool false

## Xcode
defaults write com.apple.dt.Xcode DVTTextShowInvisibleCharacters 1
