#!/usr/bin/env bash

LOG_FILE=${LOG_FILE:-~/macOSPackagesAutoUpdate.log}

log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log "Starting package updates..."

if command -v brew &> /dev/null; then
  log "Updating Homebrew..."
  brew update >> "$LOG_FILE" 2>&1
  brew upgrade >> "$LOG_FILE" 2>&1
  log "Homebrew update complete."
else
  log "Homebrew not found, skipping."
fi

if command -v npm &> /dev/null; then
  log "Updating global npm packages..."
  npm update -g >> "$LOG_FILE" 2>&1
  log "npm update complete."
else
  log "npm not found, skipping."
fi

log "All package updates complete."