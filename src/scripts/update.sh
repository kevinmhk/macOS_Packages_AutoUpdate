#!/usr/bin/env bash

LOG_FILE=${LOG_FILE:-~/macOSPackagesAutoUpdate.log}

log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log "Starting package updates..."

if command -v brew &> /dev/null; then
  log "Updating Homebrew formulaes..."
  brew update >> "$LOG_FILE" 2>&1
  log "Checking for outdated Homebrew packages..."
  if [ -z "$(brew outdated)" ]; then
    log "No outdated Homebrew packages to upgrade."
  else
    log "Outdated Homebrew packages found. Upgrading..."
    brew upgrade >> "$LOG_FILE" 2>&1
    log "Homebrew upgrade complete."
  fi
else
  log "Homebrew not found, skipping."
fi

if command -v npm &> /dev/null; then
  log "Checking for outdated global npm packages..."
  if [ -z "$(npm outdated -g)" ]; then
    log "No outdated global npm packages to update."
  else
    log "Outdated global npm packages found. Updating..."
    npm update -g >> "$LOG_FILE" 2>&1
    log "npm update complete."
  fi
else
  log "npm not found, skipping."
fi

log "All package updates complete."