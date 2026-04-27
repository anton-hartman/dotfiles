# Repo to Manage my Dotfiles

My dotfiles are tracked using GNU Stow. Use stow with `--dotfiles` flag.

## To Do

- Change tmux cursor based on normal or insert mode
- Make function for sourcing files and tools that displays warning if not present
  in shell setup, instead of erroring.

## Installation Instructions

1. Install devbox and activate `devbox global`.

   ```sh
   curl -fsSL https://get.jetify.com/devbox | bash
   ```

2. Use stow with `--dotfiles` flag.
3. Install tmux package manager (TPM).
4. Install a nerd font.

## Windows Terminal

> [!NOTE]
> Ignore this section if you are not using WSL and windows terminal.

A Windows-native symbolic link must be created to configure windows terminal.
Since Windows Terminal is a Windows application, it cannot resolve standard
Linux symlinks created with `ln -s` inside WSL.

To create the symlink you must run these commands in a PowerShell window with
Administrator privileges.

```sh
# 1. Define paths
$linkPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$targetPath = "\\wsl.localhost\Ubuntu-24.04\home\anton\.config\windows-terminal\settings.json"

# 2. Remove the auto-generated file and create the link immediately
Remove-Item -Path $linkPath -Force -ErrorAction SilentlyContinue;
New-Item -ItemType SymbolicLink -Path $linkPath -Value $targetPath
```
