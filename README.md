# macOS Packages AutoUpdate

This project provides a set of shell scripts to automate the process of keeping macOS packages up-to-date. It handles Homebrew and global npm packages.

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

## Logging

Logs are stored in different locations depending on how the script is executed:

- **Automated Service**: When the script is run automatically by the system, standard output is logged to `/tmp/com.user.autoupdate.out` and any errors are logged to `/tmp/com.user.autoupdate.err`.
- **Manual Execution**: When you run the script manually, logs are appended to `~/macOSPackagesAutoUpdate.log`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
