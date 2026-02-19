return {
    "ej-shafran/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- if you want to enable coloring of ANSI escape codes in
        -- compilation output, add:
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    keys = {
        { mode = "n", "<leader>t", ":Compile<CR>" },
        { mode = "n", "<leader>r", ":Recompile<CR>" },
    },
    config = function()
        vim.g.compile_mode = {
            -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
            -- set this to fix tab completion in command mode:
            input_word_completion = true,

            -- to add ANSI escape code support, add:
            baleia_setup = true,

            -- to make `:Compile` replace special characters (e.g. `%`) in
            -- the command (and behave more like `:!`), add:
            bang_expansion = true,
            default_command = "",
        }
    end,
}
