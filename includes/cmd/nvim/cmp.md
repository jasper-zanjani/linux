**cmp** is used for code completion.

```lua
local cmp = require'cmp'

cmp.setup({
    snippet = { ... },
    sources = { ... },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
})
```

```lua
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
         vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources =  {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' , keyword_length = 5 },
  },
})
```

[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) is a completion engine. 

The plugin's **setup** method takes a table object that defines various configuration parameters.

- **sources** defines ["source plugins"](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources) that actually provide completions. 
Sources can take various settings that affect completion:

    - **keyword\_length** changes how many letters are required before producing a completion from the buffer

- **mapping** defines keymappings

- **snippet** take settings that change depending on the snippets plugin


