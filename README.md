# macOS Packages AutoUpdate

This project provides a set of shell scripts to automate the process of keeping macOS packages up-to-date. It handles Homebrew, global npm packages, uv-managed tools, and chezmoi-managed dotfiles (when chezmoi is installed).

## Installation

To install the auto-update service, execute the following command in your terminal. The service will run automatically each day at 2 PM and also every time you log in.

```bash
./src/scripts/install.sh
```

## Usage

Although the script is designed to run automatically after installation, you can manually trigger an update at any time by running:

```bash
./src/scripts/update.sh
```

During scheduled runs, the script executes in a non-interactive `launchd` shell. To keep npm behavior consistent with your interactive shell, it attempts to load NVM from `$HOME/.nvm` and use your default Node version before running global npm checks and updates. If NVM is not available, it falls back to the `npm` found in `PATH`.

If `uv` is available on your system, the update script will run `uv tool upgrade --all` to keep installed tools up to date.
If `chezmoi` is available on your system, the update script will also execute `chezmoi update` so your dotfiles stay in sync alongside package updates.

## Logging

The update script appends operational logs to:

- `~/macOSPackagesAutoUpdate.log`

When run as a LaunchAgent, `launchd` also captures process-level stdout/stderr to:

- `/tmp/com.user.autoupdate.out`
- `/tmp/com.user.autoupdate.err`

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
