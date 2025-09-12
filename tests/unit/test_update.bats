#!/usr/bin/env bats

load 'test_helper.bash'

@test "update script should call brew and npm update" {
  export LOG_FILE=$(mktemp)
  run ./src/scripts/update.sh
  assert_success
  assert_file_contains "$LOG_FILE" "brew update"
  assert_file_contains "$LOG_FILE" "brew upgrade"
  assert_file_contains "$LOG_FILE" "npm update -g"
  rm "$LOG_FILE"
}