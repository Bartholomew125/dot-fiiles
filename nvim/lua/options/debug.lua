local debug_mode_active = false

-- Define keys to be used in debug mode
local debug_keys = {
  r = {function() require("dap").continue() end, "[Debug] run" },
  n = {function() require("dap").step_over() end,"[Debug] next"},
  i = {function() require("dap").step_into() end,"[Debug] into"},
  s = {function() require("dap").step_into() end,"[Debug] into"},
  o = {function() require("dap").step_out() end, "[Debug] out" },
  b = {function() require("dap").toggle_breakpoint() end, "[Debug] breakpoint toggle" },
}

-- Define function signatures
local enable_debug_mode
local disable_debug_mode

-- Definition for enabling debug mode
enable_debug_mode = function()
    if debug_mode_active then return end
    debug_mode_active = true

    -- Create scopes sidebar
    local widgets = require("dap.ui.widgets")
    widgets.sidebar(widgets.scopes).open()
    vim.cmd("wincmd h")
    vim.cmd("wincmd L")
    vim.cmd("wincmd =")
    vim.cmd("wincmd h")

    -- Create a session without continuing
    require("dap").run({ 
        type = "python",
        request = "launch", 
        name = "Debug (manual start)", 
        program = vim.fn.expand("%"),  -- current file
        stopOnEntry = true             -- <-- important: stops at entry
    })

    -- Create debugging keybinds
    for key, value in pairs(debug_keys) do
        local fn, desc = value[1], value[2]
        vim.keymap.set("n", key, fn, { desc = desc })
    end

    -- Override keybind to start debugger with keybind to stop
    vim.keymap.set("n", "<F5>", disable_debug_mode, { desc = "[Debug] Stop debugger" })
    print("Debug mode ON")
end

-- Definition for disabling debug mode
disable_debug_mode = function()
    if not debug_mode_active then return end
    debug_mode_active = false

    -- Terminate the debugger session
    require("dap").terminate()

    -- Close all dap-ui sidebar windows
    vim.cmd("wincmd l")
    vim.cmd("wincmd q")

    -- Remove debugging keybinds
    for key, _ in pairs(debug_keys) do
        vim.keymap.del("n", key)
    end

    -- Override keybind to start debugger with keybind to stop
    vim.keymap.set("n", "<F5>", enable_debug_mode, { desc = "[Debug] Start debugger" })
    print("Debug mode OFF")
end

-- Create keymap to start debugging
vim.keymap.set("n", "<F5>", enable_debug_mode, { desc = "[Debug] Start debugger" })

local dap = require("dap")
dap.listeners.after.event_initialized["debug-mode"] = enable_debug_mode
dap.listeners.before.event_terminated["debug-mode"] = disable_debug_mode 
dap.listeners.before.event_exited["debug-mode"] = disable_debug_mode
