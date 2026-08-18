-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
	hl_override = {
		Normal = { bg = "#000000", fg = "#909090" },
		NormalNC = { bg = "#000000", fg = "#909090" },

		-- Floating windows
		NormalFloat = { bg = "#000000" },
		FloatBorder = { bg = "#000000" },

		-- Sign / number columns
		SignColumn = { bg = "#000000" },
		LineNr = { bg = "#000000" },
		CursorLineNr = { bg = "#000000" },

		-- Cursor line
		CursorLine = { bg = "#080808" },

		-- End-of-buffer "~"
		EndOfBuffer = { bg = "#000000" },

		-- NvimTree
		NvimTreeNormal = { bg = "#000000" },
		NvimTreeNormalNC = { bg = "#000000" },
		NvimTreeEndOfBuffer = { bg = "#000000" },
		NvimTreeWinSeparator = { bg = "#000000" }
	}
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
