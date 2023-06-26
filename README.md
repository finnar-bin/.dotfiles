# .dotfiles

Personal linux dotfile configs

### Config files for the following packages:

- bash
- zsh (ohmyzsh must be installed)
- alacritty
- starship (must install starship)
- Volta (node version manager)
- husky config (vscode, codium npx error fix)
- VSCodium settings

### Usage

**Optional**:
Install the required software using the provided script.

```bash
    ./scripts/pre_install.sh
```

1. Create a custom alias in your `.bashrc` or `.zshrc`. This works simply creates an alias for `git` that targets only the `.dotfiles` folder:

```bash
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

2. Avoid recursion problems by making sure that the source repository ignores the folder where the files will be cloned:

```bash
echo ".dotfiles" >> .gitignore
```

3. Clone the repository into a bare repository:

```bash
git clone --bare <git-url> $HOME/.dotfiles
```

4. Make sure that the alias in your `.bashrc` or `.zshrc` in step 1 still exists, if not, readd it.

5. Checkout the content from the bare repository to `$HOME`, this puts all the dotfiles in the designated folders:

```bash
dotfile checkout
```

6. The above command might give you errors:

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

7. This is caused if the `$HOME` folder might already contain the files from the repo. To fix the issue, create a backup of the files flagged if important, or simply delete it. Then rerun the command again:

```bash
dotfile checkout
```

8. Only track the files that you've specifically added by running the command below:

```bash
dotfile config --local status.showUntrackedFiles no
```

9. All done! Now you can simply add, commit and push any changes:

```bash
dotfile status
dotfile add .bashrc
dotfile commit -m "Added .bashrc"
dotfile push
```

#### Refences

1: [Store dotfiles in git](https://www.atlassian.com/git/tutorials/dotfiles)
