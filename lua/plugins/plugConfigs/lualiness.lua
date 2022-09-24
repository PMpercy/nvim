local status_line, lualine = pcall(require, "lualine")
if not status_line then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = require("material.colors")
local icons = require("core.ui.icons")

local filename = {
	"filename",
}


local diagnostics = {

	"diagnostics",
	sources = { "nvim_diagnostic", "coc" },
	symbols = {
		error = icons.diagnostics.Error,
		warn = icons.diagnostics.Warning,
		hint = icons.diagnostics.Hint,
		info = icons.diagnostics.Information,
	},
	colored = true,
	update_in_insert = true,
	-- padding = 0
}

local branch = {
	"branch",
	icon = icons.git.Octoface,
	icons_enabled = true,
}
local diff = {
	"diff",
	colored = true,
	symbols = {
		added = icons.git.Add,
		modified = icons.git.Mod,
		removed = icons.git.Remove,
	},
	-- cond = hide_in_width
}

local mode = {
	-- "mode",
	-- fmt = function (str)
	--   return str:sub(1,1)
	-- end,
	padding = 0,
	-- color = {bg = colors.bg_alt},
	-- mode component
	function()
		-- return "▊"
		return "  "
		-- return "  "
	end,
	color = function()
		-- auto change color according to neovims mode
		return { bg = colors.bg_alt }
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local ico_rigth = {
	function()
		return ""
		--return ''
	end,
	color = { fg = colors.bg_alt },
	padding = 0,
}
local ico_left = {
	function()
		return ""
	end,
	color = { fg = colors.a },
	padding = 0,
}

-- Languaje server

lualine.setup({
	options = {
		icons_enabled = true,
		-- theme = 'auto',
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { mode, ico_rigth },
		lualine_b = { filename, diagnostics },
		lualine_c = { branch, diff },
		lualine_x = {},
		lualine_y = { filetype },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
