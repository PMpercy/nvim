

require("core")
require("plugins")
-- require "plugins.plugConfigs.plugins"
-- require "plugins.plugConfigs.colorscheme"
require("plugins.plugConfigs.cmp")
require("plugins.plugConfigs.navic")
require("plugins.plugConfigs.lsp-inlayhints")
require("plugins.plugConfigs.lsp")
require("plugins.plugConfigs.telescope")
require("plugins.plugConfigs.treesitter")
require("plugins.plugConfigs.autopairs")
require("plugins.plugConfigs.comment")
require("plugins.plugConfigs.gitsigns")
require("plugins.plugConfigs.nvim-tree")
require("plugins.plugConfigs.lualine")
require("plugins.plugConfigs.toggleterm")
require("plugins.plugConfigs.impatient")
require("plugins.plugConfigs.indentline")
require("plugins.plugConfigs.alpha")
require("plugins.plugConfigs.whichkey")
require("plugins.plugConfigs.zen-mode")
require("plugins.plugConfigs.todo-comments")
require("plugins.plugConfigs.symbol-outline")
require("plugins.plugConfigs.ts-context")
require("plugins.plugConfigs.functions")
require("plugins.plugConfigs.illuminate")
require("plugins.plugConfigs.winbar")
require("plugins.plugConfigs.bufferline")
require("plugins.plugConfigs.colorizer")
require("plugins.plugConfigs.fidget")
require("plugins.plugConfigs.markdown-preview")
require("plugins.plugConfigs.trouble")
require("plugins.plugConfigs.harpoon")

require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
        on_attach = ...,
    },
})
