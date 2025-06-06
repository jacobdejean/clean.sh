# Clean.sh - MacOS System Cleanup Script

This shell script performs a cleanup of a macOS system by removing cache files, logs, and temporary data.

## Usage

```bash
./clean.sh
```

## Requirements

- macOS operating system

Third party commands that aren't available are skipped

## Notice

This script is designed to be safe but it is your responsibility to review the code before running it to ensure it won't delete anything you want to keep. Some operations require administrative privileges and there is no way to reverse any of the operations this script performs.

## Optional Operations

The following operations are available by uncommenting them

- System logs deletion
- System reboot

## License

MIT
