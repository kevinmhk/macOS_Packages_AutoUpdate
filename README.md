# macOS Packages AutoUpdate

This project provides a set of shell scripts to automate the process of keeping macOS packages up-to-date. It handles Homebrew and global npm packages.

## Installation

To install the auto-update service, which runs daily at 2 PM, execute the following command in your terminal:

```bash
./src/scripts/install.sh
```

## Usage

Although the script is designed to run automatically after installation, you can manually trigger an update at any time by running:

```bash
./src/scripts/update.sh
```

Logs are stored in `~/macOSPackagesAutoUpdate.log`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
