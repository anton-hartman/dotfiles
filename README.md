# Repo to Manage my Dotfiles

- My dotfiles are tracked using a "bare" git repo. View [this](https://www.atlassian.com/git/tutorials/dotfiles) tutorial to see how this works.
- The repo must be setup with `~` as its working directory.

## Windows Terminal

> [!NOTE]
> Ignore this section if you are not using WSL and windows terminal.

A Windows-native symbolic link must be created to configure windows terminal. Since Windows Terminal is a Windows application, it cannot resolve standard Linux symlinks created with `ln -s` inside WSL.

To create the symlink you must run these commands in a PowerShell window with Administrator privileges.

```sh
# 1. Define paths
$linkPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$targetPath = "\\wsl.localhost\Ubuntu-24.04\home\anton\.config\windows-terminal\settings.json"

# 2. Remove the auto-generated file and create the link immediately
Remove-Item -Path $linkPath -Force -ErrorAction SilentlyContinue;
New-Item -ItemType SymbolicLink -Path $linkPath -Value $targetPath
```
