function FixColor(color) 
	--use a default color when none is provided
	color = color or "tokyonight-night"
	local blank = " "
	vim.cmd('colorscheme'..blank..color)
	-- make the window transparent
	vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
	vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
end
FixColor()
