local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")--no-ignore-vcs
table.insert(vimgrep_arguments, "--no-ignore-vcs")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require('telescope').setup{
    defaults = {
		-- `hidden = true` is not supported in text grep commands.
		-- vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			-- find_command = { "rg", "--files","--no-ignore-vcs", "--hidden", "--glob", "!.git/*" },
		},
	},
}


require('telescope').load_extension('fzf')
