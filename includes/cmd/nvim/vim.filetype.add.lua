-- Incorporating autodetection of jrnl files
vim.filetype.add({
  -- Use 'pattern' for paths (if your file is always in a specific folder)
  pattern = {
    ['.*jrnl'] = 'markdown', -- Matches any file named 'guide' inside a 'docs' folder
  }
})
