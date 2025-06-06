#!/bin/bash
#
# clean.sh - MacOS system cleanup

## Clear memory and storage cache
sudo purge

## Delete the trash
rm -rf ~/.Trash/*

## Delete DNS cache
sudo dscacheutil -flushcache

## Restart DNS service
sudo killall -HUP mDNSResponder

## Delete user log files
sudo rm -rf ~/Library/Logs/*

## Delete user cache
rm -rf ~/Library/Caches/*

## Delete system cache
sudo rm -rf /Library/Caches/*

## Delete xcode build data
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Third party

## Delete homebrew cache
command -v brew >/dev/null && brew cleanup

## Delete npm cache
command -v npm >/dev/null && npm cache verify

## Delete yarn cache
command -v yarn >/dev/null && yarn cache clean

## Delete pnpm cache
command -v pnpm >/dev/null && pnpm store prune

## Delete bun cache
command -v bun >/dev/null && bun pm cache rm

## Delete composer cache
command -v composer >/dev/null && composer clear-cache

## Delete conda cache
command -v conda >/dev/null && conda clean --all

## Delete ruby cache
command -v gem >/dev/null && gem cleanup

## Delete go cache
command -v go >/dev/null && go clean -modcache

## Delete global cargo cache
command -v cargo-cache >/dev/null && cargo-cache -a

## Delete cocoapod cache
command -v pod >/dev/null && pod cache clean --all

## Delete Gradle cache
rm -rf ~/.gradle/caches/*

## Delete Android build cache
rm -rf ~/.android/build-cache/*
rm -rf ~/.android/cache/*

## Delete Flutter cache
command -v flutter >/dev/null && flutter clean

## Delete Swift package manager cache
rm -rf ~/Library/Developer/Xcode/Archives/*

## Delete Kotlin cache
rm -rf ~/.konan/cache/*

## Delete Python virtual environments cache
rm -rf ~/.virtualenvs/*
rm -rf ~/.venv/*

## Excluded
#
### Delete system logs
# sudo rm -rf /private/var/log/*
#
### Reboot system
# sudo shutdown -r now
