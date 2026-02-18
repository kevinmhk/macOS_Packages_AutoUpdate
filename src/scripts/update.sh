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
  npm_outdated_output="$(npm outdated -g 2>&1)"
  npm_outdated_status=$?

  if [ "$npm_outdated_status" -eq 0 ]; then
    log "No outdated global npm packages to update."
  elif [ "$npm_outdated_status" -eq 1 ]; then
    log "Outdated global npm packages found. Updating..."
    log "npm outdated output:"
    printf "%s\n" "$npm_outdated_output" >> "$LOG_FILE"
    if npm update -g >> "$LOG_FILE" 2>&1; then
      log "npm update complete."
    else
      log "npm update encountered an error."
    fi
  else
    log "npm outdated check failed (exit $npm_outdated_status)."
    log "npm outdated output:"
    printf "%s\n" "$npm_outdated_output" >> "$LOG_FILE"
  fi
else
  log "npm not found, skipping."
fi

if command -v uv &> /dev/null; then
  log "Upgrading uv tools..."
  if uv tool upgrade --all >> "$LOG_FILE" 2>&1; then
    log "uv tool upgrade complete."
  else
    log "uv tool upgrade encountered an error."
  fi
else
  log "uv not found, skipping."
fi

if command -v chezmoi &> /dev/null; then
  log "Updating chezmoi-managed dotfiles..."
  if chezmoi update >> "$LOG_FILE" 2>&1; then
    log "chezmoi update complete."
  else
    log "chezmoi update encountered an error."
  fi
else
  log "chezmoi not found, skipping."
fi

log "All package updates complete."
