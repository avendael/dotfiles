local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.listchars = 'tab:▸ ,trail:.,eol:¬'

opt.termguicolors = true
opt.wrap = true
opt.scrolloff = 8
opt.updatetime = 50

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'

opt.hlsearch = false
opt.incsearch = true

opt.wildignore = opt.wildignore ^ '*.o,*.obj,.git,*.rbc,*.pyc,*.class,.svn,vendor/gems/*'
