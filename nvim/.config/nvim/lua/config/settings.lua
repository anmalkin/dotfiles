-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indenting
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Text wrap
vim.opt.wrap = false

-- show column as a guide for long lines
vim.opt.colorcolumn = '80'

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 150

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup(
  'YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

-- LSP configurations
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = "clippy",
      },
      cargo = {
        allFeatures = true,
      },
      diagnostics = {
        styleLints = {
          enable = true,
        },
      },
      rustc = {
        source = "discover",
      },
    },
  },
}
)

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = false,
  update_in_insert = false,
  severity_sort = true,
  jump = { float = true },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- Kitty configuration
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  group = vim.api.nvim_create_augroup("KittySetVarVimEnter", { clear = true }),
  callback = function()
    if os.getenv('TERM') == 'xterm-kitty' then
      io.stdout:write("\x1b]1337;SetUserVar=in_editor=MQo\007")
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = vim.api.nvim_create_augroup("KittyUnsetVarVimLeave", { clear = true }),
  callback = function()
    if os.getenv('TERM') == 'xterm-kitty' then
      io.stdout:write("\x1b]1337;SetUserVar=in_editor\007")
    end
  end,
})
