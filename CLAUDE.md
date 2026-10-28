# CLAUDE.md

## Repository

This repository holds config files for several apps. It is not a coding project. There is no build, test, or lint step.

- `nvim/` – Neovim config (Neovim 0.12+, uses native `vim.pack`)
- `tmux/tmux.conf` – tmux config
- `wezterm/wezterm.lua` – WezTerm config (a stray `wezterm.lua` also exists at the repo root in git; the `wezterm/` folder is untracked)

Each app dir links to the place the app expects, with `ln -s ~/dotfiles/nvim ~/.config/nvim`. See `README.md`.

## Conventions

- Commit messages: Conventional Commits, title only. No body. No footer.
- Talk to the user in simple, short sentences (close to ASD-STE100): one idea per sentence, active voice, common words.

