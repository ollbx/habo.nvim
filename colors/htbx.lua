vim.g.colors_name = "habo"
vim.o.background = "dark"
vim.cmd.highlight("clear")

local color = require("htbx.color")

-- Define base colors.
local bg     = "#141d2b"
local grey   = "#a4b1cd"
local red    = "#ff8484"
local teal   = "#5cecc6"
local purple = "#cf8dfb"
local gold   = "#ffcc5c"
local silver = "#c5d1eb"
local blue   = "#5cb2ff"
local green  = "#c5f467"

local light_blue = color.change_hsl(blue, { l = 1.2 })
local dark_grey  = color.change_hsl(grey, { l = 0.6, s = 0.4 })
local dark_gold  = color.change_hsl(gold, { l = 0.8, s = 0.8 })

-- Exception	try, catch, throw
-- PreProc		generic Preprocessor
-- Include		preprocessor #include
-- Define		preprocessor #define
-- Macro		same as Define
-- PreCondit	preprocessor #if, #else, #endif, etc.
-- StorageClass	static, register, volatile, etc.
-- Structure	struct, union, enum, etc.
-- Typedef		a typedef
-- SpecialChar	special character in a constant
-- Tag		you can use CTRL-] on this
-- SpecialComment	special things inside a comment
-- Debug		debugging statements
-- Underlined	text that stands out, HTML links
-- Dimmed		text that is de-emphasized
-- Ignore		left blank, hidden  hl-Ignore
-- Error		any erroneous construct
-- Todo		anything that needs extra attention; mostly the
-- Added		added line in a diff
-- Changed		changed line in a diff
-- Removed		removed line in a diff

vim.api.nvim_set_hl(0, "Normal",     { fg = silver, bg = bg })
vim.api.nvim_set_hl(0, "Identifier", { fg = purple })
vim.api.nvim_set_hl(0, "String",     { fg = green })
vim.api.nvim_set_hl(0, "Function",   { fg = light_blue })
vim.api.nvim_set_hl(0, "Special",    { fg = blue })
vim.api.nvim_set_hl(0, "Keyword",    { fg = red })
vim.api.nvim_set_hl(0, "Type",       { fg = gold })
vim.api.nvim_set_hl(0, "Constant",   { fg = teal })
vim.api.nvim_set_hl(0, "Comment",    { fg = dark_grey, italic = true })
vim.api.nvim_set_hl(0, "Delimiter",  { fg = grey })
vim.api.nvim_set_hl(0, "Number",     { fg = dark_gold })

-- Links to other colors.
vim.api.nvim_set_hl(0, "Character",   { link = "String" })
vim.api.nvim_set_hl(0, "Boolean",     { link = "Number" })
vim.api.nvim_set_hl(0, "Float",       { link = "Number" })
vim.api.nvim_set_hl(0, "Conditional", { link = "Keyword" })
vim.api.nvim_set_hl(0, "Repeat",      { link = "Keyword" })
vim.api.nvim_set_hl(0, "Label",       { link = "Identifier" })
vim.api.nvim_set_hl(0, "Operator",    { link = "Normal" })

-- Find usage examples.
vim.api.nvim_set_hl(0, "Statement",  { link = "Identifier" })

