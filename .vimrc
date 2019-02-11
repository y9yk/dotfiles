"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Original: Amir Salihefendic (http://amix.dk - amix@amix.dk)
"           - Version 5.0 - 29/05/12 15:43:36
"           - http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Modifier:
" - Lucy Park  (http://lucypark.kr - 525600min@gmail.com, https://github.com/e9t/dotfiles)
" - Andrew Lee (andrew.yk82@gmail.com)
"
" Sections:
"     1. General
"     2. VIM user interface
"     3. Colors and Fonts
"     4. Files and backups
"     5. Text, tab and indent related
"     6. Visual mode related
"     7. Moving around, tabs and buffers "    ->  Status line
"     8. Editing mappings
"     9. vimgrep searching and cope displaying
"     10. Spell checking
"     11. Misc
"     13. Helper functions
"     14. Customized
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For pathogen
runtime ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" For Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin list
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Always show current position
set ruler

" Height of the command bar
" set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Extra margin to the left
set foldcolumn=0

" Fold
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
" colorscheme should come after pathogen
syntax enable
set t_Co=256
let g:solarized_termcolors=256
" set background=dark
colorscheme jellybeans
set colorcolumn=80

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" PowerLine Fonts
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5. Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab
set nosmartindent

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" 6. Visual mode related
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7. Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" 7. Status line
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8. Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing whitespace on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  %s/\s\+$//ge
endfunc
func! ReplaceQuotes()
  %s/[“”]/"/ge
  %s/[‘’]/'/ge
endfunc
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.less :call DeleteTrailingWS()
autocmd BufWrite *.markdown :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.tex :call DeleteTrailingWS()
autocmd BufWrite *.markdown :call ReplaceQuotes()
autocmd BufWrite *.md :call ReplaceQuotes()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9. vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 10. Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 11. Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 13. Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 14. Customized (Overrrides current file settings)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" [For timestamping](http://stackoverflow.com/a/58604/1054939)
nmap <leader>t i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <leader>t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
nmap <leader>d i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" Remove trailing whitespaces
map <F8> :call DeleteTrailingWS() <CR>

" Sets line number
set number

" Hide tabline
set showtabline=1

" Prompt 'yes'/'no'/'cancel' if closing with unsaved changes
set confirm

" For Vim-R-plugin
set nocompatible

" [For ctrlp ignore/edit settings]
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|public$\|tmp$\$',
    \ 'file': '\.(exe|so|dll)$'
    \}
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_show_hidden = 1

" [*.md as markdown files](http://stackoverflow.com/a/23279293/1054939)
autocmd BufNewFile,BufRead *.md set filetype=markdown

" [Nerdtree](https://github.com/scrooloose/nerdtree)
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close vim if only nerdtree is left
let NERDTreeShowHidden=1  " show hidden files
