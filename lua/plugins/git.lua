return {
  -- Gitsigns - Git integration for buffers
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    },
  },

  -- Fugitive - Comprehensive Git wrapper
  {
    "tpope/vim-fugitive",
    cmd = {
      "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep",
      "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit"
    },
    ft = { "fugitive" }
  },

  -- Git Blame - Advanced blame annotations
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = false, -- disable by default, toggle with <leader>gb
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y %H:%M:%S",
      virtual_text_column = nil,
    }
  },

  -- Diffview - Advanced diff and merge tool
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {
      diff_binaries = false,
      enhanced_diff_hl = false,
      git_cmd = { "git" },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
    }
  },

  -- Neogit - Magit-like Git interface
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    opts = {
      disable_signs = false,
      disable_hint = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = false,
      auto_refresh = true,
      sort_branches = "-committerdate",
      disable_builtin_notifications = false,
      use_magit_keybindings = false,
      commit_popup = {
        kind = "split",
      },
      change_buffer = {
        kind = "tab",
      },
      popup = {
        kind = "split",
      },
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      integrations = {
        telescope = true,
        diffview = true,
      },
    }
  },

  -- Git Conflict - Resolve merge conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    opts = {
      default_mappings = true,
      default_commands = true,
      disable_diagnostics = false,
      list_opener = 'copen',
      highlights = {
        incoming = 'DiffAdd',
        current = 'DiffText',
      }
    }
  },

  -- Gitlinker - Generate Git links
  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup({
        opts = {
          remote = nil,
          add_current_line_on_normal_mode = true,
          action_callback = function(url)
            -- Copy to clipboard
            vim.fn.setreg('+', url)
            vim.notify('Git URL copied to clipboard: ' .. url)
          end,
          print_url = true,
        },
        callbacks = {
          ["github.com"] = function(url_data)
            local url = "https://github.com/"
              .. url_data.repo .. "/blob/"
              .. url_data.rev .. "/"
              .. url_data.file
            if url_data.lstart then
              url = url .. "#L" .. url_data.lstart
              if url_data.lend then
                url = url .. "-L" .. url_data.lend
              end
            end
            return url
          end,
          ["gitlab.com"] = function(url_data)
            local url = "https://gitlab.com/"
              .. url_data.repo .. "/-/blob/"
              .. url_data.rev .. "/"
              .. url_data.file
            if url_data.lstart then
              url = url .. "#L" .. url_data.lstart
              if url_data.lend then
                url = url .. "-" .. url_data.lend
              end
            end
            return url
          end,
        },
      })
    end
  }
}