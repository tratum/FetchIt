## Option 11 is now working but further troubleshooting is required.

function Center-Text {
    param (
        [string]$text
    )
    $padding = ([Console]::WindowWidth - $text.Length - 2) / 2
    return (" " * [math]::Max(0, [math]::Floor($padding))) + $text
}

Write-Host ""
Write-Host ""
Write-Host (Center-Text "╔════════════════════════════════════════════╗") -ForegroundColor Red
Write-Host (Center-Text "║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║") -ForegroundColor Yellow
Write-Host (Center-Text "║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║") -ForegroundColor Magenta
Write-Host (Center-Text "║║║║║║║║║║║║║║║║║ FetchIt ║║║║║║║║║║║║║║║║║║║║") -ForegroundColor Green
Write-Host (Center-Text "║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║") -ForegroundColor Gray
Write-Host (Center-Text "║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║") -ForegroundColor Cyan
Write-Host (Center-Text "║                     ➤  Developed by Tratum ║") -ForegroundColor White
Write-Host (Center-Text "╚════════════════════════════════════════════╝") -ForegroundColor Red
Write-Host ""
Write-Host (Center-Text "      ✦ Thank you for using FetchIt! ✦       ") -ForegroundColor White
Write-Host ""

$choice = Read-Host @"
$(Center-Text "Select an Application to download:")
$(Center-Text "-------------------------------------------------------")
$(Center-Text "| 1. Visual Studio Code        9. Microsoft Teams   |")
$(Center-Text "| 2. VLC Media Player          10. Slack            |")
$(Center-Text "| 3. IntelliJ IDE              11. Git              |")
$(Center-Text "| 4. Google Chrome             12. GitHub Desktop   |")
$(Center-Text "| 5. Brave Browser             13. Docker           |")
$(Center-Text "| 6. Firefox Browser           14. Postman          |")
$(Center-Text "| 7. Zoom                      15. Visual Studio    |")
$(Center-Text "| 8. Notepad++                 16. WinRAR           |")
$(Center-Text "-------------------------------------------------------")
Write-Host ""
$(Center-Text "Enter your choice (1 to 16):")
"@

switch($choice) {
    1 {
        Write-Output "You have selected Visual Studio Code"
        $vscodepath = "C:\Program Files\Microsoft VS Code\Code.exe"
        if (Test-Path $vscodepath) {
            Write-Host "Visual Studio Code is already installed with version $((Get-Item $vscodepath).VersionInfo.FileVersion)."
        }
        else {
            Write-Host "Visual Studio Code is not installed. Installing..."
            $installpath = "$env:TEMP\vscode_installer.exe"
            Invoke-WebRequest -Uri "https://update.code.visualstudio.com/latest/win32-x64/stable" -OutFile $installpath
            Start-Process -FilePath $installpath -ArgumentList "/silent", "/mergetask=!runcode" -Wait
            Remove-Item -Path $installpath
            if (Test-Path $vscodepath) {
                Write-Host "Visual Studio Code has been succesfully installed with version $(get-vsCodeVersion)"
            } 
            else {
                Write-Host "Failed to Install Visual Studio Code."    
            }
        }   
    }
    2 {
        Write-Output "You have selected VLC Media Player"
        $vlcpath = "C:\Program Files\VideoLAN\VLC\vlc.exe"
        if (Test-Path $vlcpath) {
            Write-Host "VLC Media Player is already installed with version $((Get-Item $vlcpath).VersionInfo.FileVersion)."
        } else {
            Write-Host "VLC Media Player is not installed. Installing..."
            $installpath = "$env:TEMP\vlc_installer.exe"
            Invoke-WebRequest -Uri "https://get.videolan.org/vlc/last/win64/vlc-3.0.16-win64.exe" -OutFile $installpath
            Start-Process -FilePath $installpath -ArgumentList "/S" -Wait
            Remove-Item -Path $installpath
            if (Test-Path $vlcpath) {
                Write-Host "VLC Media Player has been successfully installed with version $((Get-Item $vlcpath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install VLC Media Player."
            }
        }
    }
    3 {
        Write-Output "You have selected IntelliJ IDE"
        $intellijpath = "C:\Program Files\JetBrains\IntelliJ IDEA\bin\idea64.exe"
        if (Test-Path $intellijpath) {
            Write-Host "IntelliJ IDEA is already installed with version $((Get-Item $intellijpath).VersionInfo.FileVersion)."
        } else {
            Write-Host "IntelliJ IDEA is not installed. Installing..."
            $installpath = "$env:TEMP\intellij_installer.exe"
            Invoke-WebRequest -Uri "https://download.jetbrains.com/idea/ideaIC-latest.exe" -OutFile $installpath
            Start-Process -FilePath $installpath -ArgumentList "/S" -Wait
            Remove-Item -Path $installpath
            if (Test-Path $intellijpath) {
                Write-Host "IntelliJ IDEA has been successfully installed with version $((Get-Item $intellijpath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install IntelliJ IDEA."
            }
        }
    }
    4 {
        Write-Output "You have selected Google Chrome"
        $chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
        if (Test-Path $chromePath) {
            Write-Host "Google Chrome is already installed with version $((Get-Item $chromePath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Google Chrome is not installed. Installing..."
            $installPath = "$env:TEMP\chrome_installer.exe"
            Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/silent" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $chromePath) {
                Write-Host "Google Chrome has been successfully installed with version $((Get-Item $chromePath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Google Chrome."
            }
        }
    }
    5 {
        Write-Output "You have selected Brave Browser"
        $bravePath = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
        if (Test-Path $bravePath) {
            Write-Host "Brave Browser is already installed with version $((Get-Item $bravePath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Brave Browser is not installed. Installing..."
            $installPath = "$env:TEMP\brave_installer.exe"
            Invoke-WebRequest -Uri "https://laptop-updates.brave.com/latest/win64/BraveBrowserSetup.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/silent" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $bravePath) {
                Write-Host "Brave Browser has been successfully installed with version $((Get-Item $bravePath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Brave Browser."
            }
        }
    }
    6 {
        Write-Output "You have selected Firefox Browser"
        $firefoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"
        if (Test-Path $firefoxPath) {
            Write-Host "Firefox Browser is already installed with version $((Get-Item $firefoxPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Firefox Browser is not installed. Installing..."
            $installPath = "$env:TEMP\firefox_installer.exe"
            Invoke-WebRequest -Uri "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/S" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $firefoxPath) {
                Write-Host "Firefox Browser has been successfully installed with version $((Get-Item $firefoxPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Firefox Browser."
            }
        }
    }
    7 {
        Write-Output "You have selected Zoom"
        $zoomPath = "C:\Users\$env:USERNAME\AppData\Roaming\Zoom\bin\Zoom.exe"
        if (Test-Path $zoomPath) {
            Write-Host "Zoom is already installed with version $((Get-Item $zoomPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Zoom is not installed. Installing..."
            $installPath = "$env:TEMP\zoom_installer.exe"
            Invoke-WebRequest -Uri "https://zoom.us/client/latest/ZoomInstaller.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/silent" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $zoomPath) {
                Write-Host "Zoom has been successfully installed with version $((Get-Item $zoomPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Zoom."
            }
        }
    }
    8 {
        Write-Output "You have selected Notepad++"
        $notepadPath = "C:\Program Files\Notepad++\notepad++.exe"    
        if (Test-Path $notepadPath) {
            Write-Host "Notepad++ is already installed with version $((Get-Item $notepadPath).VersionInfo.FileVersion)."
        }
        else {
            Write-Host "Notepad++ is not installed. Installing..."
            $installPath = "$env:TEMP\npp_installer.exe"        
            $releaseInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/notepad-plus-plus/notepad-plus-plus/releases/latest"
            $installerUrl = $releaseInfo.assets | Where-Object { $_.name -like "*Installer.exe" } | Select-Object -ExpandProperty browser_download_url
            Invoke-WebRequest -Uri $installerUrl -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/S" -Wait
            Remove-Item -Path $installPath        
            if (Test-Path $notepadPath) {
                Write-Host "Notepad++ has been successfully installed with version $((Get-Item $notepadPath).VersionInfo.FileVersion)."
            }
            else {
                Write-Host "Failed to install Notepad++."
            }
        }
    }
    9 {
        Write-Output "You have selected Microsoft Teams"
        $teamsPath = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\Teams\current\Teams.exe"
        if (Test-Path $teamsPath) {
            Write-Host "Microsoft Teams is already installed with version $((Get-Item $teamsPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Microsoft Teams is not installed. Installing..."
            $installPath = "$env:TEMP\teams_installer.exe"
            Invoke-WebRequest -Uri "https://aka.ms/teamsclient" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/silent" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $teamsPath) {
                Write-Host "Microsoft Teams has been successfully installed with version $((Get-Item $teamsPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Microsoft Teams."
            }
        }
    }
    10 {
        Write-Output "You have selected Slack"
        $slackPath = "C:\Users\$env:USERNAME\AppData\Local\slack\Slack.exe"
        if (Test-Path $slackPath) {
            Write-Host "Slack is already installed with version $((Get-Item $slackPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Slack is not installed. Installing..."
            $installPath = "$env:TEMP\slack_installer.exe"
            Invoke-WebRequest -Uri "https://downloads.slack-edge.com/releases_x64/SlackSetup.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/silent" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $slackPath) {
                Write-Host "Slack has been successfully installed with version $((Get-Item $slackPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Slack."
            }
        }
    }
    11 {
        Write-Output "You have selected Git"
        $gitPath = "C:\Program Files\Git\bin\git.exe"
        if (Test-Path $gitPath) {
            Write-Host "Git is already installed with version $((Get-Item $gitPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Git is not installed. Installing..." 
            $installPath = "$env:TEMP\git_installer.exe"
            Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.47.0.windows.2/Git-2.47.0.2-64-bit.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -Wait
            Remove-Item -Path $installPath -Force
            if (Test-Path $gitPath) {
                Write-Host "Git has been successfully installed with version $((Get-Item $gitPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Git. Please check the installation file or permissions."
            }
        }
    }    
    12 {
        Write-Output "You have selected GitHub Desktop"
        $githubDesktopPath = "C:\Users\$env:USERNAME\AppData\Local\GitHubDesktop\app-*/GitHubDesktop.exe"
        if (Test-Path $githubDesktopPath) {
            Write-Host "GitHub Desktop is already installed with version $((Get-Item $githubDesktopPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "GitHub Desktop is not installed. Installing..."
            $installPath = "$env:TEMP\githubdesktop_installer.exe"
            Invoke-WebRequest -Uri "https://central.github.com/deployments/desktop/desktop/latest/win32" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/VERYSILENT", "/NORESTART" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $githubDesktopPath) {
                Write-Host "GitHub Desktop has been successfully installed with version $((Get-Item $githubDesktopPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install GitHub Desktop."
            }
        }
    }
    13 {
        Write-Output "You have selected Docker"
        $dockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
        if (Test-Path $dockerPath) {
            Write-Host "Docker is already installed with version $((Get-Item $dockerPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Docker is not installed. Installing..."
            $installPath = "$env:TEMP\docker_installer.exe"
            Invoke-WebRequest -Uri "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/quiet" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $dockerPath) {
                Write-Host "Docker has been successfully installed with version $((Get-Item $dockerPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Docker."
            }
        }
    }
    14 {
        Write-Output "You have selected Postman"
        $postmanPath = "C:\Users\$env:USERNAME\AppData\Local\Postman\Postman.exe"
        if (Test-Path $postmanPath) {
            Write-Host "Postman is already installed with version $((Get-Item $postmanPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Postman is not installed. Installing..."
            $installPath = "$env:TEMP\postman_installer.exe"
            Invoke-WebRequest -Uri "https://dl.pstmn.io/download/latest/win64" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/silent" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $postmanPath) {
                Write-Host "Postman has been successfully installed with version $((Get-Item $postmanPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install Postman."
            }
        }
    }
    15 {
        Write-Output "You have selected Visual Studio"
        $vsPath = "C:\Program Files\Microsoft Visual Studio\Installer\vs_installer.exe"
        if (Test-Path $vsPath) {
            Write-Host "Visual Studio is already installed with version $((Get-Item $vsPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "Visual Studio is not installed. Installing..."
            $installPath = "$env:TEMP\vs_installer.exe"
            Invoke-WebRequest -Uri "https://aka.ms/vs/16/release/vs_community.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "--quiet", "--wait" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $vsPath) {
                Write-Host "Visual Studio has been successfully installed."
            } else {
                Write-Host "Failed to install Visual Studio."
            }
        }
    }
    16 {
        Write-Output "You have selected WinRAR"
        $winrarPath = "C:\Program Files\WinRAR\WinRAR.exe"
        if (Test-Path $winrarPath) {
            Write-Host "WinRAR is already installed with version $((Get-Item $winrarPath).VersionInfo.FileVersion)."
        } else {
            Write-Host "WinRAR is not installed. Installing..."
            $installPath = "$env:TEMP\winrar_installer.exe"
            Invoke-WebRequest -Uri "https://www.rarlab.com/rar/winrar-x64-602.exe" -OutFile $installPath
            Start-Process -FilePath $installPath -ArgumentList "/S" -Wait
            Remove-Item -Path $installPath
            if (Test-Path $winrarPath) {
                Write-Host "WinRAR has been successfully installed with version $((Get-Item $winrarPath).VersionInfo.FileVersion)."
            } else {
                Write-Host "Failed to install WinRAR."
            }
        }
    }
    default {
        Write-Output "Invalid selection. Please enter only Numerals like 1, 2, or 3."
    }
}