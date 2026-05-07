-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/domiziano.scarcelli/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?.lua;/Users/domiziano.scarcelli/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?/init.lua;/Users/domiziano.scarcelli/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?.lua;/Users/domiziano.scarcelli/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/domiziano.scarcelli/.cache/nvim/packer_hererocks/2.1.1753364724/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["blink.cmp"] = {
    config = { "\27LJ\2\nâ\3\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\r\0005\4\f\0=\4\14\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\nfuzzy\1\0\1\19implementation\29prefer_rust_with_warning\fsources\fdefault\1\0\1\fdefault\0\1\5\0\0\blsp\tpath\rsnippets\vbuffer\15completion\18documentation\1\0\1\18documentation\0\1\0\1\14auto_show\1\15appearance\1\0\1\22nerd_font_variant\tmono\vkeymap\1\0\5\15appearance\0\vkeymap\0\15completion\0\fsources\0\nfuzzy\0\1\0\1\vpreset\14super-tab\nsetup\14blink.cmp\frequire\0" },
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/blink.cmp",
    url = "https://github.com/saghen/blink.cmp"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\nä\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\21formatters_by_ft\1\0\1\21formatters_by_ft\0\vpython\1\0\1\vpython\0\1\2\0\0\truff\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["distant.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0B\0\2\1K\0\1\0\nsetup\fdistant\frequire\0" },
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/distant.nvim",
    url = "https://github.com/chipsenkbeil/distant.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-conflict.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jay-babu/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["molten-nvim"] = {
    config = { "\27LJ\2\n‡\1\0\0\2\0\b\0\0216\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0K\0\1\0\31molten_virt_lines_off_by_1\28molten_virt_text_output\23molten_wrap_output\15image.nvim\26molten_image_provider\28molten_auto_open_output\6g\bvim\0" },
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/molten-nvim",
    url = "https://github.com/benlubas/molten-nvim"
  },
  ["none-ls.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["pymple.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vpymple\frequire\0" },
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/pymple.nvim",
    url = "https://github.com/alexpasmantier/pymple.nvim"
  },
  rainbow_csv = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/rainbow_csv",
    url = "https://github.com/mechatroner/rainbow_csv"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["snacks.nvim"] = {
    config = { "\27LJ\2\nì\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\r\0005\4\v\0005\5\n\0=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\vstyles\17notification\1\0\1\17notification\0\awo\1\0\1\awo\0\1\0\1\twrap\2\14quickfile\1\0\1\fenabled\2\rnotifier\1\0\2\ftimeout\3∏\23\fenabled\2\fbigfile\1\0\4\rnotifier\0\14quickfile\0\vstyles\0\fbigfile\0\1\0\1\fenabled\2\nsetup\vsnacks\frequire\0" },
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/snacks.nvim",
    url = "https://github.com/folke/snacks.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-z.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/telescope-z.nvim",
    url = "https://github.com/nvim-telescope/telescope-z.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  vimtex = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["wrapping.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/wrapping.nvim",
    url = "https://github.com/andrewferrier/wrapping.nvim"
  },
  ["yazi.nvim"] = {
    loaded = true,
    path = "/Users/domiziano.scarcelli/.local/share/nvim/site/pack/packer/start/yazi.nvim",
    url = "https://github.com/mikavilpas/yazi.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: snacks.nvim
time([[Config for snacks.nvim]], true)
try_loadstring("\27LJ\2\nì\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\r\0005\4\v\0005\5\n\0=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\vstyles\17notification\1\0\1\17notification\0\awo\1\0\1\awo\0\1\0\1\twrap\2\14quickfile\1\0\1\fenabled\2\rnotifier\1\0\2\ftimeout\3∏\23\fenabled\2\fbigfile\1\0\4\rnotifier\0\14quickfile\0\vstyles\0\fbigfile\0\1\0\1\fenabled\2\nsetup\vsnacks\frequire\0", "config", "snacks.nvim")
time([[Config for snacks.nvim]], false)
-- Config for: distant.nvim
time([[Config for distant.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0B\0\2\1K\0\1\0\nsetup\fdistant\frequire\0", "config", "distant.nvim")
time([[Config for distant.nvim]], false)
-- Config for: blink.cmp
time([[Config for blink.cmp]], true)
try_loadstring("\27LJ\2\nâ\3\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\r\0005\4\f\0=\4\14\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\nfuzzy\1\0\1\19implementation\29prefer_rust_with_warning\fsources\fdefault\1\0\1\fdefault\0\1\5\0\0\blsp\tpath\rsnippets\vbuffer\15completion\18documentation\1\0\1\18documentation\0\1\0\1\14auto_show\1\15appearance\1\0\1\22nerd_font_variant\tmono\vkeymap\1\0\5\15appearance\0\vkeymap\0\15completion\0\fsources\0\nfuzzy\0\1\0\1\vpreset\14super-tab\nsetup\14blink.cmp\frequire\0", "config", "blink.cmp")
time([[Config for blink.cmp]], false)
-- Config for: molten-nvim
time([[Config for molten-nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\2\0\b\0\0216\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0K\0\1\0\31molten_virt_lines_off_by_1\28molten_virt_text_output\23molten_wrap_output\15image.nvim\26molten_image_provider\28molten_auto_open_output\6g\bvim\0", "config", "molten-nvim")
time([[Config for molten-nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\nä\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\21formatters_by_ft\1\0\1\21formatters_by_ft\0\vpython\1\0\1\vpython\0\1\2\0\0\truff\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: pymple.nvim
time([[Config for pymple.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vpymple\frequire\0", "config", "pymple.nvim")
time([[Config for pymple.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
