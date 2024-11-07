# FetchIt

**FetchIt** is a PowerShell script designed to automate the download and installation of commonly-used applications, providing an efficient way to set up a new environment or quickly install tools on Windows. This tool checks for existing installations, installs the latest versions where needed, and verifies each installation’s success.

## Features

- **Automated Download and Installation**: Choose from a list of popular applications, and FetchIt will handle the rest.
- **Dynamic Version Retrieval**: FetchIt fetches the latest versions of applications, ensuring you always have up-to-date software.
- **Interactive Interface**: An easy-to-navigate console interface guides you through selecting and installing applications.
- **Customizable**: Modify the script to add or remove applications as needed.

## Supported Applications

- Visual Studio Code
- VLC Media Player
- IntelliJ IDEA
- Google Chrome
- Brave Browser
- Firefox Browser
- Zoom
- Notepad++
- Microsoft Teams
- Slack
- Git
- GitHub Desktop
- Docker
- Postman
- Visual Studio
- WinRAR

## Requirements

- **Operating System**: Windows
- **PowerShell**: Version 5.1 or higher
- **Internet Connection**: Required for downloading applications

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/yourusername/fetchit.git
   ```
2. Navigate to the directory:
   ```shell
   cd FetchIt
   ```
3. Run the script in PowerShell as Administrator:
   ```shell
   ./FetchIt.ps1
   ``` 

## Usage
After launching FetchIt, you’ll be presented with a list of applications to choose from.
Enter the number corresponding to the application you’d like to download and install.
The script will check for an existing installation, install the latest version if not found, and confirm the success of each installation.

## Contributing
If you have suggestions for new features or optimizations, feel free to create an issue or submit a pull request. Contributions are welcome and appreciated!

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.