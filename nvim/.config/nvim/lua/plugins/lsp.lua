-- Rust snippets
local spawn = "thread::spawn(move || {\n\t$0\n})"

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
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

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

      lspconfig.clangd.setup {
        capabilities = capabilities
      }

      lspconfig.pyright.setup {
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
            completion = {
              snippets = {
                custom = {
                  ["thread spawn"] = {
                    prefix = "spawn",
                    body = spawn,
                    description = "Insert a thread::spawn call",
                    requires = "std::thread",
                    scope = "expr",
                  },
                }
              }
            }
          },
        },
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
        callback = function(args)
          -- Buffer local mappings.
          -- See`:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
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
}
