local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		indicator = {
			icon = "│",
			style = "icon",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "EXPLORADOR DE ARCHIVOS",
				text_align = "center",
				separator = true,
				highlight = "Directory",
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "mousemoveevent" },
		},
	},
	highlights = {
		fill = {
			ctermbg = 7,
			ctermfg = 0,
		},
	},
})
