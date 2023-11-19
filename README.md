## Steps to bootstrap a new mac machine

#### Some essentials packages to install

- Homebrew - Package manager for Mac OS
- Stow - Symlink farm manager
- Tmux - Terminal multiplexer
- Oh my zsh - Framework for zshell
- powerlevel10k - Theme for oh my zsh

<br />

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into new hidden directory.

```zsh
# Use SSH (if set up)...
git clone git@github.com:bitcode001/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/bitcode001/dotfiles.git ~/.dotfiles
```

3. Create symlinks in the Home directory to the real files in the repo.

```zsh
# Manual: Link each files from the folder to its corresponding preferred directory

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
...

# Auto: Use stow, a symlink farm manager, to automatically symlink these files using single line command
# As this repo is compatible to stow we can auto symlink files like below:
stow -vt ~ bash
stow -vt ~ nvim
...

```

4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```

<br />

---

#### Above were the manual installation and setup steps for syncing the machine

Another way is to first complete the platform dependent steps (installing xcode, commandline tools and setting up homebrew with given brew profile) and then execute the setup script from the repository.

```
./setup.sh
```

<br />

If you get a permission error then you must first make the script executable using:

```
chmod +x setup.sh
```

**Important**
The setup is dependent on the [`stow`](https://www.gnu.org/software/stow/), a symlink farm manager, so we must make sure that it is installed on the system first.
Also if we cover up the dependencies of platform specific tools manually then we can use the same script in different platforms as well.
