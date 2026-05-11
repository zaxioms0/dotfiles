-- resize_mode.lua
-- Spatially-aware window resize mode for Neovim
--
-- INSTALL:
--   Place at ~/.config/nvim/lua/resize_mode.lua
--   Then in init.lua:  require("resize_mode").setup()
--
-- CONTROLS:
--   <C-w>r            → enter / exit resize mode
--   h/l  or  ←/→      → resize horizontally (spatially aware)
--   j/k  or  ↓/↑      → resize vertically   (spatially aware)
--   =                  → equalize all windows
--   <Esc> / <CR>       → exit resize mode
--
-- SPATIAL LOGIC:
--   Keys always move the nearest *free* edge, so the action feels natural
--   regardless of where the window sits on screen.
--
--   Horizontal:
--     Window pinned to LEFT   → h shrinks (right edge ←),  l grows (right edge →)
--     Window pinned to RIGHT  → h grows   (left  edge ←),  l shrinks (left edge →)
--     Window in the MIDDLE    → natural: h moves left edge ←, l moves right edge →
--
--   Vertical:
--     Window pinned to TOP    → k shrinks (bottom edge ↑),  j grows (bottom edge ↓)
--     Window pinned to BOTTOM → k grows   (top    edge ↑),  j shrinks (top  edge ↓)
--     Window in the MIDDLE    → natural: k moves top edge ↑, j moves bottom edge ↓

local M            = {}

-- ── config ───────────────────────────────────────────────────────────────────

local cfg          = {
    step             = 2,        -- columns / lines per keypress
    show_status      = true,     -- live hint in the cmdline
    highlight_active = true,     -- tint WinSeparator while in resize mode
    hl_group         = "Visual", -- highlight group used for the tint
}

-- ── state ────────────────────────────────────────────────────────────────────

local active       = false
local saved_sep_hl = nil -- original WinSeparator attrs
local bound_lhs    = {}  -- lhs strings that are currently mapped

-- ── spatial edge detection ───────────────────────────────────────────────────

---Return which screen edges the current window touches.
---@return { left:boolean, right:boolean, top:boolean, bottom:boolean }
local function get_edges()
    local win        = vim.api.nvim_get_current_win()
    local pos        = vim.api.nvim_win_get_position(win) -- {row, col} 0-indexed
    local w          = vim.api.nvim_win_get_width(win)
    local h          = vim.api.nvim_win_get_height(win)

    local total_cols = vim.o.columns
    local total_rows = vim.o.lines
        - vim.o.cmdheight
        - (vim.o.laststatus > 0 and 1 or 0)

    return {
        left   = pos[2] == 0,
        right  = (pos[2] + w) >= (total_cols - 1),
        top    = pos[1] == 0,
        bottom = (pos[1] + h) >= (total_rows - 1),
    }
end

-- ── resize helpers ───────────────────────────────────────────────────────────

local function show_hint()
    local win = vim.api.nvim_get_current_win()
    local w   = vim.api.nvim_win_get_width(win)
    local h   = vim.api.nvim_win_get_height(win)

    vim.api.nvim_echo({
        { " RESIZE ",                  "ModeMsg" },
        { "  hjkl/arrows",             "Special" },
        { " · ",                       "Comment" },
        { "=",                         "Special" },
        { " equalize",                 "Comment" },
        { " · ",                       "Comment" },
        { "<Esc>",                     "Special" },
        { " exit",                     "Comment" },
        { "  size: " .. w .. "×" .. h, "Comment" },
    }, false, {})
end

local function apply_border_hl(on)
    if not cfg.highlight_active then return end
    if on then
        saved_sep_hl = vim.api.nvim_get_hl(0, { name = "WinSeparator" })
        vim.api.nvim_set_hl(0, "WinSeparator", { link = cfg.hl_group, force = true })
    else
        if saved_sep_hl then
            vim.api.nvim_set_hl(0, "WinSeparator", saved_sep_hl)
            saved_sep_hl = nil
        end
    end
    vim.cmd("redraw")
end


---Execute a resize command then immediately force a redraw so the
---window geometry updates on screen without any perceptible lag.
local function do_resize(cmd)
    vim.cmd(cmd)
    -- `redraw` flushes pending UI changes synchronously.
    vim.cmd("redraw")
    if cfg.show_status then
        show_hint()
    end
end

---Resize horizontally with spatial awareness.
---@param dir integer  -1 for h/← , +1 for l/→
local function resize_h(dir)
    local e     = get_edges()
    local delta = dir * cfg.step

    if e.left and e.right then
        -- sole window or full-width: no useful action
        return
    elseif e.right and not e.left then
        -- right edge pinned → push the LEFT edge instead (flip direction)
        delta = -delta
    end
    -- e.left (and not e.right): right edge is free — direction is already natural
    -- middle: treat like left-pinned (push right edge)

    local sign = delta >= 0 and "+" or ""
    do_resize("vertical resize " .. sign .. delta)
end

---Resize vertically with spatial awareness.
---@param dir integer  -1 for k/↑ , +1 for j/↓
local function resize_v(dir)
    local e     = get_edges()
    local delta = dir * cfg.step

    if e.top and e.bottom then
        return
    elseif e.bottom and not e.top then
        -- bottom edge pinned → push the TOP edge instead
        delta = -delta
    end

    local sign = delta >= 0 and "+" or ""
    do_resize("resize " .. sign .. delta)
end
-- ── keymap management ────────────────────────────────────────────────────────

local keymap_defs = {
    { lhs = "h",       fn = function() resize_h(-1) end },
    { lhs = "l",       fn = function() resize_h(1) end },
    { lhs = "j",       fn = function() resize_v(1) end },
    { lhs = "k",       fn = function() resize_v(-1) end },
    { lhs = "<Left>",  fn = function() resize_h(-5) end },
    { lhs = "<Right>", fn = function() resize_h(5) end },
    { lhs = "<Down>",  fn = function() resize_v(5) end },
    { lhs = "<Up>",    fn = function() resize_v(-5) end },
    { lhs = "=",       fn = function() do_resize("wincmd =") end },
    { lhs = "<Esc>",   fn = function() M.exit() end },
    { lhs = "<CR>",    fn = function() M.exit() end },
}

local map_opts = { silent = true, nowait = true }

local function bind_keys()
    bound_lhs = {}
    for _, k in ipairs(keymap_defs) do
        vim.keymap.set("n", k.lhs, k.fn, map_opts)
        table.insert(bound_lhs, k.lhs)
    end
end

local function unbind_keys()
    for _, lhs in ipairs(bound_lhs) do
        pcall(vim.keymap.del, "n", lhs)
    end
    bound_lhs = {}
end

-- ── public API ───────────────────────────────────────────────────────────────

function M.enter()
    if active then
        M.exit(); return
    end
    active = true
    bind_keys()
    apply_border_hl(true)
    if cfg.show_status then show_hint() end
end

function M.exit()
    if not active then return end
    active = false
    unbind_keys()
    apply_border_hl(false)
    vim.api.nvim_echo({ { "" } }, false, {})
    vim.cmd("redraw")
end

---Call from init.lua to register the plugin.
---@param opts? table  Any keys from `cfg` to override.
function M.setup(opts)
    if opts then
        cfg = vim.tbl_deep_extend("force", cfg, opts)
    end

    vim.keymap.set("n", "<C-w>r", M.enter, {
        noremap = true,
        silent  = true,
        desc    = "Enter spatially-aware window resize mode",
    })
end

return M
