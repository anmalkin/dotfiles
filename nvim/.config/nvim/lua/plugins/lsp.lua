return {

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "j-hui/fidget.nvim",
        opts = {
          progress = {
            ignore_empty_message = true
          },
        },
      },
      { 'saghen/blink.cmp' },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      -- example to setup lua_ls and enable call snippets
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      })

      lspconfig.gopls.setup {
        capabilities = capabilities
      }

      lspconfig.clangd.setup {
        capabilities = capabilities
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
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

      lspconfig.ocamllsp.setup {
        filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
        capabilities = capabilities,
        settings = { codelens = { enable = true } },
        root_dir = lspconfig.util.root_pattern(
          "*.opam",
          "esy.json",
          "package.json",
          ".git",
          "dune-project",
          "dune-workspace",
          "*.ml"
        ),
      }

      -- Configure how diagnostics are displayed
      -- See :help vim.diagnostic.config for more advanced customization options
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
      })

      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See`:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },

  {
    "folke/lazydev.nvim",
    name = "lazydev",
    ft = "lua",
    dependencies = {
      { "Bilal2453/luvit-meta" },
    },
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',     -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    config = function()
      vim.g.haskell_tools = {
        tools = {
          repl = {
            prefer = 'cabal'
          }
        }
      }
    end
  },
}
