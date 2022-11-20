local glyphs = {}

local status_ok, tree = pcall(require, "nvim-tree")
    if not status_ok then
        return
    end

local installed, circles = pcall(require, 'circles')
if installed then
    circles.setup({
        icons =
            { empty = "○" }
        })
    glyphs = circles.get_nvimtree_glyphs()
end

glyphs.git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = 'R',
    untracked = 'U',
    deleted = 'D',
    ignored = '',
}

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 100
local height = 30

tree.setup({
    filters = {
        custom = {
            "^\\.git"
        }
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    diagnostics = { enable = true },
    git = {
        enable = true,
        ignore = false
    },
    view = {
        signcolumn = "yes",
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                width = width,
                height = height,
                row = (gheight - height) * 0.4,
                col = (gwidth - width) * 0.5,
            }
        }
    },
    renderer = {
        highlight_opened_files = "all",
        highlight_git = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            webdev_colors = true,
            git_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = false,
                folder_arrow = true,
                git = true,
            },
            glyphs = glyphs,
        },
    },
})


