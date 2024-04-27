local registers = require("registers")

function registers.register_keymap(options)
    return registers._handle_callback_options(options, function(register, _)
        if registers._window == nil then
            vim.api.nvim_err_writeln("registers window isn't open, can't move cursor")
            return
        end

        if register == "j" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Down>", true, true, true), "n", true)

        elseif register == "k" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Up>", true, true, true), "n", true)
        end
    end)
end

registers.setup({
    show = "0123456789:*+\"-/_=#.",
    show_empty=false,
    show_register_types =false,
    window={
        border="rounded",
        transparency=0,
    },
    bind_keys = {
        registers = registers.register_keymap(),
    }
})



vim.keymap.set("n", "<leader>rl", "<CMD>Registers<cr>") 




