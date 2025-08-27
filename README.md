# NEOVIM

![NEOVIM DASH](./NEOVIM.png)

### For Linux And MacOS

```
git clone https://github.com/MSA611/NEOVIM ~/.config/nvim --depth 1 && nvim

```

### For Windows

- If You Are Command Propmt (Make Sure You Have Git Installed)

```
git clone https://github.com/MSA611/NEOVIM  %USERPROFILE%\AppData\Local\nvim --depth 1 && nvim
```

-For PowerShell aka pwsh you can use the following command

```
git clone https://github.com/MSA611/NEOVIM  $ENV:USERPROFILE\AppData\Local\nvim && nvim
```

- Please Remove .git File

```
rm -rf ~/.config/nvim/.git
```

### Uninstallation Process For MacOS and Linux

```
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

```
