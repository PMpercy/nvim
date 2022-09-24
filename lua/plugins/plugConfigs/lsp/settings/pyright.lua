return {
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
				diagnosticMode = "workspace",
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
}
