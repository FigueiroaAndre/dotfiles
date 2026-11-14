# Dotfiles

Configuration files for multiple applications.

## Symlinks

Symbolic links connect the config files in this repo to the locations each app expects.

### How to create symlinks

```bash
# Syntax
ln -s <source> <target>

# Example
ln -s ~/dotfiles/nvim ~/.config/nvim
```

## Docker Sandboxes kit

`sbx/claude-setup/` is a kit for [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) (`sbx`). It adds my Claude Code settings to a new sandbox:

- Vim editor mode
- A status line: `Model (effort) | branch | ctx % (used/size) | 5h % (reset) | 7d % (reset) | $cost`

The status line script lives inside `claude-setup.yaml`. Edit it there.

### How to use the kit

```bash
sbx run claude --kit ~/dotfiles/sbx/claude-setup
```

The kit applies only when sbx creates a sandbox. To add it to an existing sandbox:

```bash
sbx kit add <sandbox-name> ~/dotfiles/sbx/claude-setup
```

To check the kit after a change:

```bash
sbx kit validate ~/dotfiles/sbx/claude-setup
```
