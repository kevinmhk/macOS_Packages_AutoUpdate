# Gemini Context: macOS Packages AutoUpdate

## Project Overview

This project contains a set of shell scripts designed to automate the process of keeping macOS packages up-to-date. It consists of two main scripts:

*   `src/scripts/update.sh`: This script updates Homebrew and global npm packages. It logs its operations to `~/macOSPackagesAutoUpdate.log`.
*   `src/scripts/install.sh`: This script installs the `update.sh` script as a background service using `launchd`. It creates a `.plist` file in `~/Library/LaunchAgents/` and loads it with `launchctl`, scheduling the update to run daily at 2 PM.

The project uses `bats` for unit testing, with mock versions of `brew`, `npm`, and `launchctl` to ensure the scripts behave as expected without affecting the live system.

The presence of `.specify` and `.gemini` directories indicates a sophisticated, spec-driven development workflow, likely managed by an AI agent. This process involves detailed feature specifications, planning, and task breakdown before implementation.

## Building and Running

### Testing

The project uses `bats` for testing. To run the tests, execute the following command from the project root:

```bash
bats tests/unit
```

### Installation

To install the auto-update service, run the following command:

```bash
./src/scripts/install.sh
```

### Manual Update

To trigger an update manually, you can run the update script directly:

```bash
./src/scripts/update.sh
```

## Development Conventions

*   **Spec-Driven Development**: The project follows a structured development process where new features are first defined in a detailed specification file (`spec.md`).
*   **Testing**: All scripts are tested using the `bats` testing framework.
*   **Language**: The core logic is written in `bash`.
*   **AI-Driven Workflow**: The `.gemini` and `.specify` directories, along with their contents, suggest that an AI agent is used to manage the development lifecycle, from specification to task execution.
