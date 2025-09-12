#!/usr/bin/env bash

load '/opt/homebrew/lib/bats-support/load.bash'
load '/opt/homebrew/lib/bats-assert/load.bash'

assert_file_contains() {
  local file=$1
  local string=$2
  grep -q "$string" "$file"
}

setup() {
  # Mock brew, npm and launchctl commands
  mkdir -p /tmp/test_brew
  mkdir -p /tmp/test_npm
  mkdir -p /tmp/test_launchctl
  export PATH="/tmp/test_brew:/tmp/test_npm:/tmp/test_launchctl:$PATH"
  printf '#!/bin/bash
echo "brew $@"' > /tmp/test_brew/brew
  printf '#!/bin/bash
echo "npm $@"' > /tmp/test_npm/npm
  printf '#!/bin/bash
echo "launchctl $@"' > /tmp/test_launchctl/launchctl
  chmod +x /tmp/test_brew/brew
  chmod +x /tmp/test_npm/npm
  chmod +x /tmp/test_launchctl/launchctl
}

teardown() {
  rm -rf /tmp/test_brew
  rm -rf /tmp/test_npm
  rm -rf /tmp/test_launchctl
}