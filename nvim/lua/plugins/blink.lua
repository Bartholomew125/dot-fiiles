return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = { 
        keymap = { 
            preset = "default",
            ["<TAB>"] = {"select_next", "fallback"},
            ["<S-TAB>"] = {"select_prev", "fallback"},
            ["<ENTER>"] = {"accept", "fallback"},
        }, 
    }, -- The "enter" present uses tab to select snippets and enter to accept.
}
