--    return {
	--    require("gruvbox").setup({
		--        undercurl = true,
		--        underline = true,
		--        bold = true,
		--        italic = {
			--            strings = true,
			--            comments = true,
			--            operators = false,
			--            folds = true,
			--        },
			--        strikethrough = true,
			--        invert_selection = false,
			--        invert_signs = false,
			--        invert_tabline = false,
			--        invert_intend_guides = false,
			--        inverse = true, -- invert background for search, diffs, statuslines and errors
			--        contrast = "hard", -- can be "hard", "soft" or empty string
			--        palette_overrides = {},
			--        overrides = {},
			--        dim_inactive = false,
			--        transparent_mode = false,
			--    })
			--    vim.o.background = "dark"
			--    color = color or "gruvbox"
			--    local blank = " "
			--    vim.cmd('colorscheme'..blank..color)
			--    -- make the window transparent
			--    vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
			--    vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
			--    }
            return {
                 "catppuccin/nvim", name = "catppuccin", priority = 1000,
                config = function() require("catppuccin").setup({
                    flavour = "mocha", -- latte, frappe, macchiato, mocha
                    background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.1, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):

					--*bold* *underline* *undercurl*
					--*underdouble* *underdotted*
					--*underdashed* *reverse* *italic*
					--*standout* *strikethrough* *altfont*
					--*nocombine*

                comments = {  }, -- Change the style of comments
                conditionals = {"bold"},
                loops = {"bold"},
                functions = {"underline"},
                keywords = {"bold"},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {"bold"},
            },
            color_overrides = {
                --mocha = {
                --    base = "#5C4033",
                --    mantle = "#000000",
                --    crust = "#000000",
                --},
            },
            --darkgreen1 = '#010300',
            --lightgreen = '#4cd770',
            --darkgreen2 = '#0f0f0a',
            custom_highlights = function ()
                return {
                    CursorLine = { bg = "#080808"},
                    Search = { bg = "#4cd770", fg = "#080808"},
                    hlsearch = { bg = "#4cd770", fg = "#080808"},
                    QuickFixLine = { bg = "#4cd770", fg = "#080808"},
                    IncSearch = { bg = "#4cd770", fg = "#080808"},
                    TermCursor = { bg = "#080808", fg = "#4cd770"},
                    TelescopeMatching = { bg = "#080808", fg = "#4cd770"},
                    TelescopePreviewLink = { bg = "#080808", fg = "#4cd770"},
                    FloatBorder = {fg = "#4cd770"},
                    --LspSignatureActiveParameter = {bg = "#4cd770"},
                    --TypeDefinition = {fg = "#00ffdd"},
                   -- Operator = {fg = "#00ffdd"},
                   -- Keyword= {fg = "#033a1f"},
                   String = {fg = "#4cd770"},
                   ColorColumn = {bg = "#080808"},

	--*Comment	any comment

	--*Constant	any constant
	-- String		a string constant: "this is a string"
	-- Character	a character constant: 'c', '\n'
	-- Number		a number constant: 234, 0xff
	-- Boolean	a boolean constant: TRUE, false
	-- Float		a floating point constant: 2.3e10

	--*Identifier	any variable name
	-- Function	function name (also: methods for classes)

	--*Statement	any statement
	-- Conditional	if, then, else, endif, switch, etc.
	-- Repeat		for, do, while, etc.
	-- Label		case, default, etc.
	-- Operator	"sizeof", "+", "*", etc.
	-- Keyword	any other keyword
	-- Exception	try, catch, throw

	--*PreProc	generic Preprocessor
	-- Include	preprocessor #include
	-- Define		preprocessor #define
	-- Macro		same as Define
	-- PreCondit	preprocessor #if, #else, #endif, etc.

	--*Type		int, long, char, etc.
	-- StorageClass	static, register, volatile, etc.
	-- Structure	struct, union, enum, etc.
	-- Typedef	A typedef

	--*Special	any special symbol
	-- SpecialChar	special character in a constant
	-- Tag		you can use CTRL-] on this
	-- Delimiter	character that needs attention
	-- SpecialComment	special things inside a comment
	-- Debug		debugging statements

	--*Underlined	text that stands out, HTML links

	--*Ignore		left blank, hidden  |hl-Ignore|

	--*Error		any erroneous construct

	--*Todo		anything that needs extra attention; mostly the
	--		keywords TODO FIXME and XXX
                }
            end,
            integrations = {
                cmp = false,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                telescope = true,
                notify = false,
                mini = false,
            },
        })
        vim.cmd("colorscheme catppuccin-mocha")
    end
    }
