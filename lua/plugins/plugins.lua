return {
    { "folke/tokyonight.nvim",lazy = false, priority = 1000, config = function()
        vim.cmd[[colorscheme tokyonight-night]]
    end },
    --{"iamcco/markdown-preview.nvim",
      --  config = function()
        --vim.g.mkdp_filetypes = { "markdown" }
        --vim.g.mkdp_port = 8080
        --vim.g.mkdp_theme = 'darkula'
        --vim.g.mkdp_auto_start = 1
        --vim.g.mkdp_auto_refresh = 1
        --vim.g.mkdp_browserfunc = 'browser#open'
        --vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
      --end
    --},
    --{ "preservim/nerdtree",
     -- config = function()
       --   vim.keymap.set("n","<leader>n",":NERDTreeToggle<CR>")
      --end 
    --},
    { "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
     vim.keymap.set("n", "<leader>fn", ":NvimTreeFocus<CR>")
    end
    },
    {"voldikss/vim-floaterm",
    config = function()
    vim.keymap.set("n", "<leader>t", ":FloatermToggle<CR>")
    vim.keymap.set("v", "<leader>fs", ":FloatermSendVisual<CR>")
    end
    },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup{ --  直接在此处 setup 并内联配置
          defaults = {
            -- 配置选项，可自定义
            mappings = {
              i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
              },
            },
          },
        }

    end

    },
        { "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup{}
      end
    },
    { "keaising/im-select.nvim",
     config = function()
         require("im_select").setup() 
     end
 },
 
  -- bufferline
  {
    "akinsho/bufferline.nvim",lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons', -- 如果你还没有安装 nvim-web-devicons
    version = "*",
    opts = {
      options = {
        -- 这些是常用的选项，可以根据你的喜好进行修改
        numbers = "buffer_id", -- 显示缓冲区编号
        close_command = "Bdelete! %d",       -- 关闭缓冲区的命令
        right_mouse_command = "Bdelete! %d", -- 鼠标右键关闭缓冲区的命令
        modified_indicator = { icon = "●", highlight = "BufferLineModified" },
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            file_type = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left"
          }
        },
        -- buffer_close_icon = '',
        -- modified_icon = '',
        close_icon = '',
        left_arrow_icon = '',
        right_arrow_icon = '',
        ---@diagnostic disable-next-line: missing-fields
        color_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 table keys:
        -- :which_to_show = ["tabs", "buffers"]
        -- :icons = { 1 = "ic1", 2 = "ic2" }
        -- separators = { left = '', right = '' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'id'
      }
    }
  },
    {"nvim-tree/nvim-web-devicons", lazy = true,},
    {'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.clangd.setup{}
            require'lspconfig'.marksman.setup{}
            require'lspconfig'.texlab.setup{}
            require'lspconfig'.pyright.setup{}

        end
    },
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup{
                ensure_installed = {"c", "cpp"},}
                highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                }
        end
    },
    {'lewis6991/gitsigns.nvim',event = { "BufReadPost", "BufNewFile" },
        config = function()
        require('gitsigns').setup({
            signs = {
              add          = { text = '│' },
              change       = { text = '│' },
              delete       = { text = '_' },
              topdelete    = { text = '‾' },
              changedelete = { text = '~' },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
              interval = 1000,
              follow_symlinks = true
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
              virt_text = true,
              virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
              delay = 1000,
              ignore = "^%s*$",
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
              -- Options passed to nvim_open_win
              border = 'single',
              style = 'minimal',
              relative = 'cursor',
              row = 0,
              col = 1
            },
        })
      end
    },
    { 'christoomey/vim-tmux-navigator' },
    {"tpope/vim-markdown",
        config = function()
          -- tpope/vim-markdown
          vim.g.markdown_syntax_conceal = 0
          vim.g.markdown_fenced_languages =
          { "html", "python", "bash=sh", "json", "java", "js=javascript", "sql", "yaml", "xml", 
            "swift", "javascript", 'lua' }
            vim.cmd [[
              autocmd BufRead,BufNewFile *.md,*.markdown set filetype=markdown
        ]]
    end
    },
    {"nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup()
    end,},

}
