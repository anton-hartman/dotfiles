# AGENTS.md — dotfiles

## Deployment

All configs are managed with **GNU Stow** using the `--dotfiles` flag. The `dot-` prefix convention transforms names:
- `dot-config/foo` → `~/.config/foo`
- `dot-local/foo` → `~/.local/foo`
- `dot-zshrc` → `~/.zshrc`

```sh
stow --dotfiles nvim
stow --dotfiles -d . -t ~ aerospace bash devbox ghostty lazygit nvim sh-common timewarrior tmux zsh
```

Root `.stow-global-ignore` skips `*.swp` and `.DS_Store`.

## Shell

Both `zsh` and `bash` source `sh-common/dot-config/sh-common/common.sh` as their shared core. That file sets `EDITOR=nvim`, sources `aliases.sh`, and calls `devbox global shellenv --init-hook`.

**Shell-specific config** lives in the respective rc files: zsh handles `compinit`, FZF/Zoxide init, Android SDK paths; bash adds completions for Devbox, tmux, FZF, TimeWarrior, Zoxide.

## Devbox (package management)

All CLI tools are declared in `devbox/dot-local/share/devbox/global/default/devbox.json`. Key packages: neovim, tmux, lazygit, ripgrep, fzf, fd, zoxide, bat, starship, stow, opencode. Activation is automatic via the shell hook in `common.sh`.

## Neovim

**LazyVim** framework. Init at `nvim/dot-config/nvim/init.lua` → `require("config.lazy")`.

- User plugins: `lua/plugins/*.lua` (12 files)
  - Colorscheme override: catppuccin-macchiato (in `core.lua`)
  - Key plugins: vim-tmux-navigator (`<C-h/j/k/l>`), smart-splits (`<A-h/j/k/l>` resize), nvim-spider (smarter `w/e/b`), render-markdown, diffview, blink.cmp with super-tab preset
- Keymaps: `lua/config/keymaps.lua`
- Lua formatting: `stylua.toml` (spaces, 2-wide, 120 cols)

### Keybinding coordination

Three layers are carefully coordinated to avoid conflicts:

| Layer | Modifier | Purpose |
|---|---|---|
| AeroSpace (WM) | Alt | window focus/move/workspace — uses noop mode to release Alt for apps |
| vim-tmux-navigator | Ctrl | seamless tmux pane ↔ Neovim split navigation |
| smart-splits.nvim | Alt | resize panes inside Neovim |

## Tmux

- Prefix: `` ` `` (backtick)
- Status bar at top, mouse enabled, vi keys, 1M-line history
- `tmux.conf` sources `tmux.reset.conf` first to clean keybinding slate
- TPM plugins managed under `plugins/` (gitignored in root `.gitignore`)
- Continuum auto-restore enabled; `@resurrect-strategy-nvim 'session'`

## AeroSpace

- macOS tiling WM, config at `aerospace/dot-config/aerospace/aerospace.toml`
- Default layout: `accordion` (not tiles), zero gaps
- Alt-based keybindings
- **noop mode** (`Alt+space` to enter, `Alt+;` for service mode) captures Alt so Neovim gets it
- Floating: Bitwarden, Finder

## Window Manager Notes

This setup runs on macOS with **AeroSpace** as the tiling WM. There is no `yabai`, `chunkwm`, `amethyst`, or `hammerspoon` config in this repo.

## Ghostty

Minimal terminal config (6 lines): Catppuccin Macchiato theme, `macos-option-as-alt = true` (enables Alt for AeroSpace/Neovim).

## Windows Terminal

WSL-only. Requires a Windows-native symlink (PowerShell Admin) — documented in `README.md`. Not relevant on macOS.

## Conventions

- **Catppuccin everywhere**: Macchiato for AeroSpace/Ghostty/nvim, Mocha for Windows Terminal, Catppuccin-tmux plugin
- **No Makefiles, no CI, no tests**: pure config repo; deployment is manual `stow` commands
- **LazyGit** config remaps commit movement from default `C-j/k` to `C-n/p` to avoid vim-tmux-navigator conflicts
