-- collect all highlight groups
local lines = {}

-- header row
table.insert(lines, 'Group\tFG\tBG\tBold\tItalic\tUnderline\tLink')

for _, group in ipairs(vim.fn.getcompletion('', 'highlight')) do
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok then
    local fg = hl.fg and string.format('#%06x', hl.fg) or 'NONE'
    local bg = hl.bg and string.format('#%06x', hl.bg) or 'NONE'
    local bold = hl.bold and 'Yes' or 'No'
    local italic = hl.italic and 'Yes' or 'No'
    local underline = hl.underline and 'Yes' or 'No'
    local link = hl.link or ''
    -- use tab as separator
    table.insert(lines, table.concat({ group, fg, bg, bold, italic, underline, link }, '\t'))
  end
end

-- join all lines
local text = table.concat(lines, '\n')

-- copy to system clipboard
vim.fn.setreg('+', text) -- '+' = system clipboard
vim.notify('Copied all highlight groups to clipboard (tab-delimited)!', vim.log.levels.INFO)
