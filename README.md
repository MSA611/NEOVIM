# NEOVIM

![Neovim](NEOVIM.png)

### For Linux And MacOS

```
git clone https://github.com/MSA611/NEOVIM ~/.config/nvim --depth 1 && nvim

```

### For Windows

- If You Are Command Propmt (Make Sure You Have Git Installed)

```
git clone https://github.com/MSA611/NEOVIM  %USERPROFILE%\AppData\Local\nvim --depth 1 && nvim
```

- For PowerShell aka pwsh you can use the following command

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
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

# Flatpak (linux)
rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim
```

### Uninstallation Process For Windows

```
# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data


# Windows PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

### Neovim Configuration - Keymap Documentation

This document provides a comprehensive overview of all keymaps configured in this Neovim setup.

## General Keymaps

| Mode | Keymap       | Action                | Description                                           |
| ---- | ------------ | --------------------- | ----------------------------------------------------- |
| n,v  | `<leader>cf` | Format file/selection | Format current file or visual selection using conform |
| n    | `<C-t>`      | Toggle terminal       | Open floating terminal in current file directory      |
| t    | `<C-t>`      | Toggle terminal       | Close floating terminal                               |
| n,v  | `y`          | Yank to clipboard     | Copy to system clipboard                              |
| i    | `jj`         | Escape                | Exit insert mode                                      |
| n    | `gco`        | Add comment below     | Add comment below current line                        |
| n    | `gcO`        | Add comment above     | Add comment above current line                        |

## Navigation Keymaps

| Mode | Keymap   | Action     | Description                                    |
| ---- | -------- | ---------- | ---------------------------------------------- |
| n,x  | `j`      | Smart down | Move down (gj for wrapped lines, j for normal) |
| n,x  | `<Down>` | Smart down | Move down (gj for wrapped lines, j for normal) |
| n,x  | `k`      | Smart up   | Move up (gk for wrapped lines, k for normal)   |
| n,x  | `<Up>`   | Smart up   | Move up (gk for wrapped lines, k for normal)   |

## Window Navigation

| Mode | Keymap  | Action             | Description                 |
| ---- | ------- | ------------------ | --------------------------- |
| n    | `<C-h>` | Go to left window  | Move cursor to left window  |
| n    | `<C-j>` | Go to lower window | Move cursor to lower window |
| n    | `<C-k>` | Go to upper window | Move cursor to upper window |
| n    | `<C-l>` | Go to right window | Move cursor to right window |

## Window Resizing

| Mode | Keymap      | Action          | Description                 |
| ---- | ----------- | --------------- | --------------------------- |
| n    | `<C-Up>`    | Increase height | Increase window height by 2 |
| n    | `<C-Down>`  | Decrease height | Decrease window height by 2 |
| n    | `<C-Left>`  | Decrease width  | Decrease window width by 2  |
| n    | `<C-Right>` | Increase width  | Increase window width by 2  |

## Line Movement

| Mode | Keymap  | Action              | Description                          |
| ---- | ------- | ------------------- | ------------------------------------ |
| n    | `<A-j>` | Move line down      | Move current line down               |
| n    | `<A-k>` | Move line up        | Move current line up                 |
| i    | `<A-j>` | Move line down      | Move current line down (insert mode) |
| i    | `<A-k>` | Move line up        | Move current line up (insert mode)   |
| v    | `<A-j>` | Move selection down | Move selected lines down             |
| v    | `<A-k>` | Move selection up   | Move selected lines up               |

## Buffer Management

| Mode | Keymap       | Action                 | Description                |
| ---- | ------------ | ---------------------- | -------------------------- |
| n    | `<S-h>`      | Previous buffer        | Switch to previous buffer  |
| n    | `<S-l>`      | Next buffer            | Switch to next buffer      |
| n    | `[b`         | Previous buffer        | Switch to previous buffer  |
| n    | `]b`         | Next buffer            | Switch to next buffer      |
| n    | `[B`         | Move buffer prev       | Move buffer to previous position |
| n    | `]B`         | Move buffer next       | Move buffer to next position |
| n    | `<leader>bb` | Switch to other buffer | Switch to last used buffer |
| n    | `<leader>\`` | Switch to other buffer | Switch to last used buffer |
| n    | `<leader>bd` | Delete buffer          | Delete current buffer      |
| n    | `<leader>bp` | Toggle pin             | Pin/unpin current buffer   |
| n    | `<leader>bP` | Delete non-pinned      | Delete all non-pinned buffers |
| n    | `<leader>br` | Delete buffers right   | Delete buffers to the right |
| n    | `<leader>bl` | Delete buffers left    | Delete buffers to the left |

## Window Management

| Mode | Keymap       | Action           | Description                       |
| ---- | ------------ | ---------------- | --------------------------------- |
| n    | `<leader>-`  | Split horizontal | Split window horizontally (below) |
| n    | `<leader>\|` | Split vertical   | Split window vertically (right)   |
| n    | `<leader>wd` | Delete window    | Close current window              |

## Diagnostics & Quickfix

| Mode | Keymap       | Action              | Description                    |
| ---- | ------------ | ------------------- | ------------------------------ |
| n    | `<leader>cd` | Line diagnostics    | Show diagnostics for current line |
| n    | `]d`         | Next diagnostic     | Go to next diagnostic          |
| n    | `[d`         | Prev diagnostic     | Go to previous diagnostic      |
| n    | `]e`         | Next error          | Go to next error               |
| n    | `[e`         | Prev error          | Go to previous error           |
| n    | `]w`         | Next warning        | Go to next warning             |
| n    | `[w`         | Prev warning        | Go to previous warning         |
| n    | `<leader>xq` | Quickfix list       | Toggle quickfix list           |
| n    | `<leader>xl` | Location list       | Toggle location list           |

## LSP Keymaps

| Mode | Keymap       | Action                | Description                    |
| ---- | ------------ | --------------------- | ------------------------------ |
| n    | `gd`         | Go to definition      | Go to definition               |
| n    | `gD`         | Go to declaration     | Go to declaration              |
| n    | `gr`         | References            | Show references                |
| n    | `gI`         | Go to implementation  | Go to implementation           |
| n    | `gy`         | Go to type definition | Go to type definition          |
| n    | `K`          | Hover                 | Show hover information         |
| n    | `gi`         | Go to implementation  | Go to implementation           |
| n    | `<C-k>`      | Signature help        | Show signature help            |
| n    | `<space>wa`  | Add workspace folder  | Add workspace folder           |
| n    | `<space>wr`  | Remove workspace folder | Remove workspace folder      |
| n    | `<space>wl`  | List workspace folders | List workspace folders       |
| n    | `<space>D`   | Type definition       | Go to type definition          |
| n    | `<space>rn`  | Rename                | Rename symbol                  |
| n,v  | `<space>ca`  | Code action           | Show code actions              |
| n    | `<space>f`   | Format                | Format buffer                  |
| n    | `<leader>cm` | Mason                 | Open Mason                     |

## File & Find Operations (Snacks Picker)

| Mode | Keymap           | Action                | Description                    |
| ---- | ---------------- | --------------------- | ------------------------------ |
| n    | `<leader><space>` | Smart find files     | Smart file finder              |
| n    | `<leader>,`      | Buffers              | Show open buffers              |
| n    | `<leader>/`      | Grep                 | Live grep search               |
| n    | `<leader>:`      | Command history      | Show command history           |
| n    | `<leader>e`      | File explorer        | Open file explorer             |
| n    | `<leader>fb`     | Buffers              | Find buffers                   |
| n    | `<leader>fc`     | Config files         | Find config files              |
| n    | `<leader>ff`     | Find files           | Find files                     |
| n    | `<leader>fg`     | Git files            | Find git files                 |
| n    | `<leader>fp`     | Projects             | Find projects                  |
| n    | `<leader>fr`     | Recent files         | Find recent files              |

## Git Operations

| Mode | Keymap       | Action           | Description                    |
| ---- | ------------ | ---------------- | ------------------------------ |
| n    | `<leader>gb` | Git branches     | Show git branches              |
| n    | `<leader>gl` | Git log          | Show git log                   |
| n    | `<leader>gL` | Git log line     | Show git log for current line  |
| n    | `<leader>gs` | Git status       | Show git status                |
| n    | `<leader>gS` | Git stash        | Show git stash                 |
| n    | `<leader>gd` | Git diff         | Show git diff (hunks)          |
| n    | `<leader>gf` | Git log file     | Show git log for current file  |
| n    | `<leader>gg` | Lazygit          | Open Lazygit                   |
| n    | `<leader>gB` | Git browse       | Browse git repository          |
| n,v  | `<leader>gB` | Git browse       | Browse git repository (visual) |

## Search Operations

| Mode | Keymap       | Action              | Description                    |
| ---- | ------------ | ------------------- | ------------------------------ |
| n    | `<leader>sb` | Buffer lines        | Search buffer lines            |
| n    | `<leader>sB` | Grep open buffers   | Grep in open buffers           |
| n    | `<leader>sg` | Grep                | Live grep                      |
| n,x  | `<leader>sw` | Word/selection      | Search word or visual selection |
| n    | `<leader>s"` | Registers           | Search registers               |
| n    | `<leader>s/` | Search history      | Search history                 |
| n    | `<leader>sa` | Autocmds            | Search autocmds                |
| n    | `<leader>sc` | Command history     | Search command history         |
| n    | `<leader>sC` | Commands            | Search commands                |
| n    | `<leader>sd` | Diagnostics         | Search diagnostics             |
| n    | `<leader>sD` | Buffer diagnostics  | Search buffer diagnostics      |
| n    | `<leader>sh` | Help pages          | Search help pages              |
| n    | `<leader>sH` | Highlights          | Search highlights              |
| n    | `<leader>si` | Icons               | Search icons                   |
| n    | `<leader>sj` | Jumps               | Search jumps                   |
| n    | `<leader>sk` | Keymaps             | Search keymaps                 |
| n    | `<leader>sl` | Location list       | Search location list           |
| n    | `<leader>sm` | Marks               | Search marks                   |
| n    | `<leader>sM` | Man pages           | Search man pages               |
| n    | `<leader>sp` | Plugin spec         | Search plugin specs            |
| n    | `<leader>sq` | Quickfix list       | Search quickfix list           |
| n    | `<leader>sR` | Resume              | Resume last search             |
| n    | `<leader>sr` | Search and replace  | Search and replace (GrugFar)   |
| n,v  | `<leader>sr` | Search and replace  | Search and replace (visual)    |
| n    | `<leader>ss` | LSP symbols         | Search LSP symbols             |
| n    | `<leader>sS` | LSP workspace symbols | Search LSP workspace symbols |
| n    | `<leader>su` | Undo history        | Search undo history            |

## Flash (Quick Navigation)

| Mode  | Keymap   | Action              | Description                    |
| ----- | -------- | ------------------- | ------------------------------ |
| n,x,o | `s`      | Flash               | Flash jump                     |
| n,o,x | `S`      | Flash treesitter    | Flash treesitter               |
| o     | `r`      | Remote flash        | Remote flash                   |
| o,x   | `R`      | Treesitter search   | Treesitter search              |
| c     | `<c-s>`  | Toggle flash search | Toggle flash search            |

## Surround Operations (Mini.surround)

| Mode | Keymap | Action                | Description                    |
| ---- | ------ | --------------------- | ------------------------------ |
| n,v  | `gsa`  | Add surrounding       | Add surrounding                |
| n    | `gsd`  | Delete surrounding    | Delete surrounding             |
| n    | `gsf`  | Find right surrounding | Find surrounding (to the right) |
| n    | `gsF`  | Find left surrounding | Find surrounding (to the left) |
| n    | `gsh`  | Highlight surrounding | Highlight surrounding          |
| n    | `gsr`  | Replace surrounding   | Replace surrounding            |
| n    | `gsn`  | Update n_lines        | Update `MiniSurround.config.n_lines` |

## UI Toggles

| Mode | Keymap       | Action                | Description                    |
| ---- | ------------ | --------------------- | ------------------------------ |
| n    | `<leader>us` | Toggle spelling       | Toggle spell checking          |
| n    | `<leader>uw` | Toggle wrap           | Toggle line wrapping           |
| n    | `<leader>uL` | Toggle relative number | Toggle relative line numbers  |
| n    | `<leader>ud` | Toggle diagnostics    | Toggle diagnostics             |
| n    | `<leader>ul` | Toggle line number    | Toggle line numbers            |
| n    | `<leader>uc` | Toggle conceallevel   | Toggle conceallevel            |
| n    | `<leader>uT` | Toggle treesitter     | Toggle treesitter              |
| n    | `<leader>ub` | Toggle background     | Toggle dark/light background   |
| n    | `<leader>uh` | Toggle inlay hints    | Toggle inlay hints             |
| n    | `<leader>ug` | Toggle indent         | Toggle indent guides           |
| n    | `<leader>uD` | Toggle dim            | Toggle dim inactive            |
| n    | `<leader>uC` | Colorschemes          | Choose colorscheme             |
| n    | `<leader>un` | Dismiss notifications | Dismiss all notifications      |
| n    | `uz`         | Toggle zen mode       | Toggle zen mode                |
| n    | `uZ`         | Toggle zoom           | Toggle zoom                    |

## Terminal

| Mode | Keymap   | Action          | Description                    |
| ---- | -------- | --------------- | ------------------------------ |
| n    | `<c-/>`  | Toggle terminal | Toggle terminal                |
| n    | `<c-_>`  | Toggle terminal | Toggle terminal (alternative)  |

## Miscellaneous

| Mode | Keymap       | Action                | Description                    |
| ---- | ------------ | --------------------- | ------------------------------ |
| n    | `<leader>l`  | Lazy                  | Open Lazy plugin manager       |
| n    | `<leader>n`  | Notification history  | Show notification history      |
| n    | `<leader>N`  | Neovim news           | Show Neovim news               |
| n    | `<leader>.`  | Scratch buffer        | Toggle scratch buffer          |
| n    | `<leader>S`  | Select scratch buffer | Select scratch buffer          |
| n    | `<leader>cR` | Rename file           | Rename current file            |
| n,t  | `]]`         | Next reference        | Jump to next reference         |
| n,t  | `[[`         | Prev reference        | Jump to previous reference     |

## Which-Key Groups (Leader Key Prefixes)

| Prefix          | Group                | Description                 |
| --------------- | -------------------- | --------------------------- |
| `<leader><tab>` | tabs                 | Tab management commands     |
| `<leader>c`     | code                 | Code-related actions        |
| `<leader>d`     | debug                | Debugging commands          |
| `<leader>dp`    | profiler             | Profiler commands           |
| `<leader>f`     | file/find            | File operations and search  |
| `<leader>g`     | git                  | Git operations              |
| `<leader>gh`    | hunks                | Git hunk operations         |
| `<leader>q`     | quit/session         | Quit and session management |
| `<leader>s`     | search               | Search operations           |
| `<leader>u`     | ui                   | UI toggles and settings     |
| `<leader>x`     | diagnostics/quickfix | Diagnostics and quickfix    |
| `<leader>b`     | buffer               | Buffer management           |
| `<leader>w`     | windows              | Window management           |

## Special Keymaps

| Mode | Keymap         | Action               | Description                                   |
| ---- | -------------- | -------------------- | --------------------------------------------- |
| n    | `<leader>?`    | Show buffer keymaps  | Display which-key for current buffer          |
| n    | `<C-w><space>` | Window hydra mode    | Enter window management mode                  |
| n    | `gx`           | Open with system app | Open file/URL with default system application |

## Navigation Groups

| Prefix | Group    | Description                  |
| ------ | -------- | ---------------------------- |
| `[`    | prev     | Previous navigation commands |
| `]`    | next     | Next navigation commands     |
| `g`    | goto     | Goto commands                |
| `gs`   | surround | Surround operations          |
| `z`    | fold     | Folding operations           |

## Mode Legend

- **n** = Normal mode
- **v** = Visual mode
- **i** = Insert mode
- **t** = Terminal mode
- **x** = Visual block mode
- **o** = Operator-pending mode
- **c** = Command-line mode

## Important Notes

- **Leader key** is set to `SPACE`
- Most keymaps support count prefixes (e.g., `3j` moves 3 lines down)
- Window navigation uses `Ctrl + hjkl` for intuitive movement
- Buffer navigation uses `Shift + hl` for quick switching
- `Alt + jk` for line movement works in all modes
- Terminal toggle works from both normal and terminal modes
- Many additional keymaps are available through which-key groups - press `<leader>` followed by any group prefix to see available options

## Plugin-Specific Keymaps

### NeoTree

NeoTree keymaps are configured within the plugin itself. Open NeoTree and press `?` to see all available keymaps.

### Terminal (ToggleTerm)

- `<C-t>` - Toggle floating terminal in current file's directory
- Works from both normal mode and within the terminal

### Formatting (Conform)

- `<leader>cf` - Format current file or visual selection

## Configuration Files

- To Make Snacks Picker to show hidden files use Alt+h and to show the .gitignore files use Alt+i
- Main keymap configuration: `lua/config/keymaps.lua`
- Which-key configuration: `lua/plugins/whichKey.lua`
- Plugin-specific keymaps are defined in their respective plugin files in `lua/plugins/`
