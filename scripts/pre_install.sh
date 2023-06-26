#! /bin/bash

distro=null;

check_distro () {
  PS3="Which distribution are you using? "

  select distro in Ubuntu Archlinux Fedora
  do
    distro=$distro
    break;
  done
}

install_zsh () {
  # Check if zsh is already installed
  if command -v zsh >/dev/null; then
    echo "ZSH is already installed in the system. Skipping installation..."
  else
    echo "Installing zsh..."
    case $distro in
      "Ubuntu")
        apt install zsh
        ;;

      "Archlinux")
        yay -S zsh
        ;;

      "Fedora")
        dnf install zsh
        ;;

      *)
        ;;
    esac
  fi
}

install_oh_my_zsh () {
  # Check if oh-my-zsh is already installed
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My ZSH already is installed in the system. Skipping installation..."
  else
    echo "Installing oh my zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

install_zsh_plugins () {
  syntax_highlighting_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  autosuggestions_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  if [ ! -d "$syntax_highlighting_dir" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  fi

  if [ ! -d "$autosuggestions_dir" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
}

install_volta () {
  # Check if volta is already installed
  if command -v volta >/dev/null; then
    echo "Volta is already installed in the system. Skipping installation..."
  else 
    echo "Installing Volta node manager..."
    curl https://get.volta.sh | bash
    volta install node
  fi
}

check_distro
install_zsh
install_oh_my_zsh
install_zsh_plugins
install_volta