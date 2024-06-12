return {
  {"ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "floke/which-key.nvim"},

  init = function ()
    local harpoon = require("harpoon")
    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Harpoon [Q]uick Menu"})
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = "Harpoon [A] File"})

    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, {desc = "Harpoon to file [1]"})
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, {desc = "Harpoon to file [2]"})
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, {desc = "Harpoon to file [3]"})
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, {desc = "Harpoon to file [4]"})

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, {desc = "[N]ext Harpoon Buffer"})
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, {desc = "[P]revious Harpoon Buffer"})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
        end
    vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end,
        { desc = "[H]arpoon window" })
    -- which-key prefix
    local wk = require("which-key")
    wk.register({h = {name = "+[H]arpoon",}}, {prefix = "<leader>"})

    end,


    },
}
