## Steps to bootstrap a new Mac

1. Install Xcode Command Line Tools

```bash
xcode-select --install
```


2. Clone dotfiles repo into new hidden directory

```bash
git clone https://github.com/anmalkin/dotfiles.git ~/.dotfiles
```


3. Install Homebrew, followed by the software listed in the Brewfile.

```bash
# These could also be in an install script.

# Install Homebrew
# Use latest install script from brew.sh

# Then pass in the Brewfile location
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```


4. Create symlinks in the Home directory to the real files in the repo.

```bash
## while in ~/.dotfiles...
stow fish
stow git
stow nvim
stow kitty
## ...etc.
```

5. Install [Rust](https://www.rust-lang.org/tools/install)
