#!/bin/bash
#
# clean.sh - MacOS system cleanup

clean_facet() {
  local LABEL="$1"
  shift
  printf "%s... " "$LABEL"
  local START=$(date +%s.%N)
  "$@"
  local END=$(date +%s.%N)
  local RUNTIME=$(echo "$END - $START" | bc)
  printf "%.4fs\n" "$RUNTIME"
}

## Clear memory and storage cache
clean_facet "Clear memory and storage cache" sudo purge

## Delete the trash
clean_facet "Delete the trash" rm -rf ~/.Trash/*

## Delete DNS cache
clean_facet "Delete DNS cache" sudo dscacheutil -flushcache

## Restart DNS service
clean_facet "Restart DNS service" sudo killall -HUP mDNSResponder

## Delete user log files
clean_facet "Delete user log files" sudo rm -rf ~/Library/Logs/*

## Delete user cache
clean_facet "Delete user cache" rm -rf ~/Library/Caches/*

## Delete system cache
clean_facet "Delete system cache" sudo rm -rf /Library/Caches/*

## Delete xcode build data
clean_facet "Delete xcode build data" rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Third party

## Delete homebrew cache
command -v brew >/dev/null && clean_facet "Delete homebrew cache" brew cleanup

## Delete npm cache
command -v npm >/dev/null && clean_facet "Delete npm cache" npm cache verify

## Delete yarn cache
command -v yarn >/dev/null && clean_facet "Delete yarn cache" yarn cache clean

## Delete pnpm cache
command -v pnpm >/dev/null && clean_facet "Delete pnpm cache" pnpm store prune

## Delete bun cache
command -v bun >/dev/null && clean_facet "Delete bun cache" bun pm cache rm

## Delete composer cache
command -v composer >/dev/null && clean_facet "Delete composer cache" composer clear-cache

## Delete conda cache
command -v conda >/dev/null && clean_facet "Delete conda cache" conda clean --all

## Delete ruby cache
command -v gem >/dev/null && clean_facet "Delete ruby cache" gem cleanup

## Delete go cache
command -v go >/dev/null && clean_facet "Delete go cache" go clean -modcache

## Delete global cargo cache
command -v cargo-cache >/dev/null && clean_facet "Delete global cargo cache" cargo-cache -a

## Delete cocoapod cache
command -v pod >/dev/null && clean_facet "Delete cocoapod cache" pod cache clean --all

## Delete Gradle cache
clean_facet "Delete Gradle cache" rm -rf ~/.gradle/caches/*

## Delete Android build cache
clean_facet "Delete Android build cache" rm -rf ~/.android/build-cache/*
clean_facet "Delete Android cache" rm -rf ~/.android/cache/*

## Delete Flutter cache
command -v flutter >/dev/null && clean_facet "Delete Flutter cache" flutter clean

## Delete Swift package manager cache
clean_facet "Delete Swift package manager cache" rm -rf ~/Library/Developer/Xcode/Archives/*

## Delete Kotlin cache
clean_facet "Delete Kotlin cache" rm -rf ~/.konan/cache/*

## Delete Python virtual environments cache
clean_facet "Delete Python virtual environments cache" rm -rf ~/.virtualenvs/*
clean_facet "Delete Python venv cache" rm -rf ~/.venv/*

## Excluded
#
### Delete system logs
# sudo rm -rf /private/var/log/*
#
### Reboot system
# sudo shutdown -r now
