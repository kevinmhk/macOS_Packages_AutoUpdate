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

If `uv` is available on your system, the update script will run `uv tool upgrade --all` to keep installed tools up to date.
If `chezmoi` is available on your system, the update script will also execute `chezmoi update` so your dotfiles stay in sync alongside package updates.

## Logging

Logs are stored in different locations depending on how the script is executed:

- **Automated Service**: When the script is run automatically by the system, standard output is logged to `/tmp/com.user.autoupdate.out` and any errors are logged to `/tmp/com.user.autoupdate.err`.
- **Manual Execution**: When you run the script manually, logs are appended to `~/macOSPackagesAutoUpdate.log`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
