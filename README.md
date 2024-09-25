### zsh

#### autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
#### autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
### FONT
=polybar required=
```
[ -d ~/.fonts ] || mkdir ~/.fonts
cp ./fonts/* ~/.fonts/
fc-cache -fv
```
## Links
* [polybar-collection](https://github.com/Murzchnvok/polybar-collectionhttps://github.com/Murzchnvok/polybar-collection)


## Create Link to Home
This repository manage dotfiles by stow.
So you should use stow to create soft link.
eg:
    stow -t ~/ chrome ( chrome is the folder name in project root ) 
