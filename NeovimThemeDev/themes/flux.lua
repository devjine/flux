local M = {}

local palette = {
  bg      = '#1e1e2e',
  fg      = '#cdd6f4',
  gray    = '#585b70',
  red     = '#f38ba8',
  green   = '#a6e3a1',
  yellow  = '#f9e2af',
  blue    = '#89b4fa',
  purple  = '#f5c2e7',
  aqua    = '#94e2d5',
  orange  = '#fab387',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') == 1 then vim.cmd('syntax reset') end
  vim.g.colors_name = 'flux'

  -- 기본 그룹
  hl('Normal',       { fg = palette.fg, bg = palette.bg })
  hl('CursorLine',   { bg = palette.gray })
  hl('CursorColumn', { bg = palette.gray })
  hl('LineNr',       { fg = palette.gray, bg = palette.bg })
  hl('CursorLineNr', { fg = palette.yellow, bg = palette.gray })

  -- 문법 하이라이트
  hl('Comment',      { fg = palette.gray, italic = true })
  hl('Constant',     { fg = palette.orange })
  hl('String',       { fg = palette.green })
  hl('Number',       { fg = palette.purple })
  hl('Identifier',   { fg = palette.blue })
  hl('Function',     { fg = palette.blue })
  hl('Keyword',      { fg = palette.red, bold = true })
  hl('Type',         { fg = palette.yellow })
  hl('Special',      { fg = palette.aqua })

  -- UI 요소
  hl('Pmenu',        { fg = palette.fg, bg = palette.gray })
  hl('PmenuSel',     { fg = palette.bg, bg = palette.blue })
  hl('PmenuSbar',    { bg = palette.gray })
  hl('PmenuThumb',   { bg = palette.blue })

  -- Diff
  hl('DiffAdd',      { fg = palette.green, bg = palette.bg })
  hl('DiffChange',   { fg = palette.yellow, bg = palette.bg })
  hl('DiffDelete',   { fg = palette.red, bg = palette.bg })
  hl('DiffText',     { fg = palette.blue, bg = palette.bg })

  -- 검색
  hl('Search',       { fg = palette.bg, bg = palette.yellow })
  hl('IncSearch',    { fg = palette.bg, bg = palette.orange })

  -- Diagnostics
  hl('DiagnosticError', { fg = palette.red })
  hl('DiagnosticWarn',  { fg = palette.yellow })
  hl('DiagnosticInfo',  { fg = palette.blue })
  hl('DiagnosticHint',  { fg = palette.gray })

  -- Treesitter 지원
  if vim.treesitter then
    local ts = {
      TSKeyword     = { fg = palette.red },
      TSVariable    = { fg = palette.fg },
      TSComment     = { fg = palette.gray, italic = true },
      TSFunction    = { fg = palette.blue },
      TSString      = { fg = palette.green },
      TSNumber      = { fg = palette.purple },
      TSConstant    = { fg = palette.orange },
      TSConstructor = { fg = palette.yellow },
      TSConditional = { fg = palette.red },
      TSException   = { fg = palette.red },
      TSField       = { fg = palette.fg },
      TSProperty    = { fg = palette.fg },
      TSOperator    = { fg = palette.purple },
      TSParameter   = { fg = palette.aqua },
    }
    for group, opts in pairs(ts) do hl(group, opts) end
  end
end

return M
