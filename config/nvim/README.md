<p align="center">
  <img class="center" width="671" height="60" alt="banner" src="https://github.com/user-attachments/assets/5670d451-62f0-4374-b2c1-0dce49472ea9" />
</p>
<p align="center">Nvim dotfiles, With <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a>💤 Plugin</p>


> ## Installation


```bash
git clone https://github.com/adilhyz/nvim ~/.config/nvim && nvim
```


> [!TIP]
> Use Update after Installation


```
:Lazy sync
```

<img width="1366" height="768" alt="preview" src="https://github.com/user-attachments/assets/97c0852d-fe14-4528-be74-7d827b83330c" />

## Keymap


|        Mode        |         Key          |          Description          |
|--------------------|----------------------|-------------------------------|
|     **Normal**     | `<leader>q`          |       Quit Neovim             |
| `n`, `v`, `i`, `c` | `<C-q>`              | Quit from any mode            |
|      `n`, `v`      | `<RightMouse>`       | Open right-click menu         |
|     **Normal**     | `<C-p>`              | Find files (including hidden) |
|    `n`, `i`, `v`   | `<C-S-Up>`           | Duplicate line up             |
|    `n`, `i`, `v`   | `<C-S-Down>`         | Duplicate line down           |
|     **Normal**     | `<A-j>`              | Move line down                |
|     **Normal**     | `<A-k>`              | Move line up                  |
|     **Visual**     | `<A-j>`              | Move selected block down      |
|     **Visual**     | `<A-k>`              | Move selected block up        |
|    `n`, `v`, `i`   | `<C-/>`              | Toggle comment                |
|     **Normal**     | `<C-s>`              | Save file                     |
|     **Normal**     | `<C-a>`              | Select all text               |
| `n`, `v`, `i`, `c` | `<C-c>`              | Copy to clipboard             |
| `n`, `v`, `i`, `c` | `<C-v>`              | Paste from clipboard          |
| `n`, `v`, `i`, `c` | `<C-x>`              | Cut to clipboard              |
|      `n`, `i`      | `<C-z>`              | Undo                          |
|      `n`, `i`      | `<C-y>`              | Redo                          |
|     **Insert**     | `<S-Left>`           | Select text left              |
|     **Insert**     | `<S-Right>`          | Select text right             |
|     **Insert**     | `<S-Up>`             | Select text up                |
|     **Insert**     | `<S-Down>`           | Select text down              |
|     **Insert**     | `<S-Home>`           | Select to line start          |
|     **Insert**     | `<S-End>`            | Select to line end            |
|     **Insert**     | `<S-PageUp>`         | Select one page up            |
|     **Insert**     | `<S-PageDown>`       | Select one page down          |
|     **Normal**     | `<C-h>`              | Replace text (global)         |
|     **Normal**     | `<C-d>`              | Select next occurrence        |
|     **Visual**     | `<Tab>`              | Indent right                  |
|     **Visual**     | `<S-Tab>`            | Indent left                   |
|     **Normal**     | `<leader>sv`         | Split vertically              |
|     **Normal**     | `<leader>sh`         | Split horizontally            |
|     **Normal**     | `<leader>se`         | Equalize split sizes          |
|     **Normal**     | `<leader>sx`         | Close split                   |
|     **Normal**     | `te`                 | Edit in new tab               |
|     **Normal**     | `<leader>tt`         | New tab                       |
|     **Normal**     | `<leader>tq`         | Close tab                     |
|     **Normal**     | `<leader>tn`         | Next tab                      |
|     **Normal**     | `<leader>tp`         | Previous tab                  |
|     **Normal**     | `<leader>e`          | Toggle file explorer          |
|     **Normal**     | `<Tab>`              | Next buffer                   |
|     **Normal**     | `<S-Tab>`            | Previous buffer               |
|     **Normal**     | `<leader>x`          | Close buffer                  |
|     **Normal**     | `<A-p>`              | Pin buffer                    |
|     **Normal**     | `<C-.>`              | Git add all files             |
|     **Normal**     | `<C-,>`              | Git commit                    |
|     **Normal**     | `<C-;>`              | Git push to branch `master`   |
|     **Normal**     | `<leader>o`          | Convert Markdown to PDF       |
|     **Normal**     | `<leader>oq`         | Toggle KNAP auto-preview      |

## Thanks To

- folke (plugin)
- gh0stzk (based)