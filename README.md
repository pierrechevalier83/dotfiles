These are some of my important dotfiles.
They are managed with GNU stow.

* First, clone the repo in your home directory:

```bash
cd ~
git clone git@github.com:pierrechevalier83/dotfiles.git
```
* Then, use stow to create the appropriate symlinks to the dotfiles you're
interested in:

```bash
cd dotfiles
stow compton
stow conky
stow xorg
stow termite
...
```

