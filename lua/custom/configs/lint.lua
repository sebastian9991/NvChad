--Notice: To use this we need a .eslintr.js file in our project director
--generate: npm init @eslint/config
require('lint').linter_by_ft = {
  javascript = {'eslint'}, 
  typescript = {'eslint'},
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function ()
    require("lint").try_lint()
  end,
})
