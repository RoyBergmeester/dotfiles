vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/rcarriga/nvim-dap-ui",
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

local active_threads = 0

dap.listeners.before.launch.dapui_config = function()
  active_threads = 0
end

dap.listeners.before.attach.dapui_config = function()
  active_threads = 0
end

dap.listeners.after.event_initialized.dapui_config = function()
  dapui.open()
end

-- vscode-php-debug never sends event_terminated/event_exited. The signal that
-- PHP has finished is the main thread exiting. Count active threads and
-- terminate the session when they all exit.
dap.listeners.before.event_thread.dapui_config = function(_, body)
  if not body then return end
  if body.reason == "started" then
    active_threads = active_threads + 1
  elseif body.reason == "exited" then
    active_threads = active_threads - 1
    if active_threads <= 0 then
      dap.terminate()
    end
  end
end

dap.listeners.after.disconnect.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dl", dap.list_breakpoints, {})
vim.keymap.set("n", "<leader>dc", dap.clear_breakpoints, {})
vim.keymap.set('n', '<F7>', dap.step_into, {})
vim.keymap.set('n', '<F8>', dap.step_over, {})
vim.keymap.set('n', '<F9>', dap.continue, {})
vim.keymap.set('n', '<F10>', dap.step_out, {})

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug (Docker)",
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}

-- https://emojipedia.org/en/stickers/search?q=circle
vim.fn.sign_define('DapBreakpoint',
{
    text = '⚪',
    texthl = 'DapBreakpointSymbol',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})

vim.fn.sign_define('DapStopped',
{
    text = '🔴',
    texthl = 'yellow',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})

vim.fn.sign_define('DapBreakpointRejected',
{
    text = '⭕',
    texthl = 'DapStoppedSymbol',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})
