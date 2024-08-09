return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		---@diagnostic disable-next-line: missing-fields
		harpoon.setup({})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-S-A>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-S-S>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-S-D>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-S-F>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-K>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-J>", function()
			harpoon:list():next()
		end)

		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local function get_filename(path)
				return path:match("([^/]+)$")
			end

			local finder = function()
				local paths = {}
				for _, item in ipairs(harpoon_files.items) do
					local filename = get_filename(item.value)
					table.insert(paths, {
						value = item.value,
						display = filename,
						ordinal = filename,
					})
				end

				return require("telescope.finders").new_table({
					results = paths,
					entry_maker = function(entry)
						return {
							value = entry.value,
							display = entry.display,
							ordinal = entry.ordinal,
						}
					end,
				})
			end

			local remove_file = function(prompt_bufnr)
				local state = require("telescope.actions.state")
				local selected_entry = state.get_selected_entry()
				local current_picker = state.get_current_picker(prompt_bufnr)

				for i, item in ipairs(harpoon_files.items) do
					if item.value == selected_entry.value then
						table.remove(harpoon_files.items, i)
						break
					end
				end
				current_picker:refresh(finder())
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						map("n", "dd", function()
							remove_file(prompt_bufnr)
						end)
						map("i", "<C-d>", function()
							remove_file(prompt_bufnr)
						end)
						return true
					end,
				})
				:find()
		end

		-- Open Harpoon w/ Telescope
		vim.keymap.set("n", "<leader>sh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
