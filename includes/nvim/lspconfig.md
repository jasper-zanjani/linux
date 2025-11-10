[lspconfig](https://github.com/neovim/nvim-lspconfig) provides basic, defuault Neovim LSP client configurations for various LSP servers.

```lua title="rust_analyzer"
require'lspconfig'.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            check = { command = "clippy"; },
            diagnostics = { enable = true; }
        }
    }
}
```
