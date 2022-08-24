# ~/.dotfiles 
Link files with `GNU stow`
### For Mac
```
brew install stow 
```
#### Run stow
```
cd ~/.dotfiles
```
```
stow .
```

Link VSCode settings
```
ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

```
