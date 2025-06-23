return {

  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup {
      received_problems_path = '$(HOME)/CP/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)',
      template_file = '$(HOME)/CP/template.$(FEXT)',
      testcases_use_single_file = true,
    }
    vim.keymap.set('n', '<space>cpr', '<cmd>CompetiTest receive problem<CR>')
    vim.keymap.set('n', '<space>cat', '<cmd>CompetiTest add testcase<CR>')
    vim.keymap.set('n', '<space>cet', '<cmd>CompetiTest edit testcase<CR>')
    vim.keymap.set('n', '<space>cr', '<cmd>CompetiTest run<CR>')
  end,
}
