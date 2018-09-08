let mapleader=" "
let g:mapleader=" "

nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wx <C-w>x
nnoremap <leader>wc <C-w>c
nnoremap <leader>wo <C-w>o
nnoremap <leader><TAB> :Buffers<CR><CR>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <leader>fs :w<CR>
nmap <leader>ff :Files<CR>
nmap <leader>bb :Buffers<CR>
nmap <leader>sap :Ag<CR>
nmap <leader>/ :BLines<CR>

nmap <leader>d :Explore<CR>

if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

