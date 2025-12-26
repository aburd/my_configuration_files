local dap_virtual_text = require("nvim-dap-virtual-text")
local dap, dapui = require("dap"), require("dapui")

-- Dap Virtual Text
dap_virtual_text.setup()

-- Dap UI
dapui.setup()
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- adapters
dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/code/debug/vscode-firefox-debug/dist/adapter.bundle.js'},
}

-- Configurations
dap.configurations.typescript = {
  {
    name = 'Debug with Firefox',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'https://mailer.kintoneapp-local.com:8500',
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox',

    sourceMaps = true,
    sourceMapPathOverrides = {
      ['webpack://_N_E/*'] = '${webRoot}/*',
    }
  }
}
dap.configurations.javascript = dap.configurations.typescript
dap.configurations.typescriptreact = dap.configurations.typescript

-- Keybindings
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Debug: Open REPL' })
