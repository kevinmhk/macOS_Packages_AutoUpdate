#!/usr/bin/env bats

load 'test_helper.bash'

@test "install script should create plist and load with launchctl" {
  run ./src/scripts/install.sh
  assert_success
  assert_output --partial "launchctl load"
  assert [ -f "$HOME/Library/LaunchAgents/com.user.autoupdate.plist" ]
}