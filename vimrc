" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
"YCM in penalty box for now, supertab is in
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" screws with . Plug 'Raimondi/delimitMate'
Plug 'wincent/command-t'
Plug 'ervandew/supertab'

source ~/.dotfiles-local/vimrc-plug

" Initialize plugin system
call plug#end()

filetype plugin on
filetype plugin indent on

source ~/.dotfiles-local/vimrc

nnoremap ` :
vnoremap ` :
nnoremap <CR> :noh<CR><CR>

" Auto correction :)
iabbrev teh the
iabbrev tehn then
iabbrev taht that

" Expand %% into current file's folder
cabbr <expr> %% expand('%:p:h')


syntax on

set t_Co=256
colorscheme forloop7

" Leave the default leader (\)
"let mapleader=" "

set noautochdir                   " Change the current working directory whenever you open a file, ...
set   autoread                    " When a file has been detected to have been changed outside of Vim automatically read it again
set   autoindent                  " Copy indent from current line when starting a new line, see smartindent, cindent
set   backspace=indent,eol,start  " allow backspacing over autoindent, line breaks, start of insert
set nobackup                      " Make a backup before overwriting a file, leave it around afterwards
                                  " TODO: backupdir="~/.vim/backups"?
set   browsedir=buffer            " Which directory to use for the file browser: last, buffer, current
set   casemap=internal,keepascii  " Specifies details about changing the case of letters
set nocindent                     " No C indentation stuff
set   colorcolumn=+1
                                  " TODO: complete?
set   confirm                     " Ask to save on exit (not fail)
set nocopyindent                  " Align to existing indent on paste
set nocursorline                  " Don't highlight cursor line, with hl-CursorLine color
                                  " TODO: Should set dictionary too?
set   diffopt=filler,context:6,iwhite,vertical
                                  " Align sides, 6 line context, ignore whitespace, vertical split
set   directory=~/.vim/swap       " Swap file locations
set   display=lastline,uhex       " Show last line, even partialy, show specials in hex mode <xx>
                                  " TODO: consider encoding?
set   equalalways                 " Windows always split equally
set noerrorbells                  " No bells on errors please
set   esckeys                     " Disabling this broke cursors in INSERT mode under Cygwin
set   expandtab                   " TAB into SPACEs
set   fileformat=unix             " Always use UNIX EOL if possible
set   formatoptions=ronl          " disabled t for no text wrapping, TODO: can re-enable?
set nogdefault                    " s///g replaces all instances in line (not only the first one)
"set   guicursor=n:block-nCursor  " Doesn't seem to work under Cygwin
set   hlsearch                    " Highlight all search matches
set   history=100                 " Command and search history size
set   ignorecase                  " Combine with smartcase, search case insensitive when search lowercase
set   incsearch                   " Highlight search matches as typing the term
set noinfercase                   " With ignorecase, insert search is selected as-found in list
set   laststatus=2                " Status line, 0 - no, 1 - auto, 2 - always
set nolist                        " Don't show special characters
set   listchars=tab:>-,trail:~,eol:/  " But if you are, show these
set   magic                       " Should be on 99% of the time, so just do it
set   mouse=a                     " Enable mouse, mouse=nicr has also been suggested
set   number                      " Like those line numbers now
set nopreserveindent              " Be aggressive re-indenting (with spaces, since expandtab is set)
set   pastetoggle=<F2>            " Toggle paste/nopaste in INSERT mode
set   pumheight=0                 " Unlimitted pop-up menu size (space allowing)
set   restorescreen               " Restore screen on exit
set   ruler                       " Show line/col number, needed even with laststatus=2
set   selection=inclusive
set   shiftwidth=4                " Indent by 4 spaces
set   shiftround                  " Indents are multiplies of 4
set   shortmess=fmnrOtTI          " No startup message
set noshortname                   " Don't abreviate file name
set   showcmd                     " Display incomplete commands 
set noshowmatch                   " Don't flash matching bracket
set   showmode                    " In Insert, Replace or Visual mode put a message on the last line
set   showtabline=1               " Show tab headers when multiple open
set   smartcase                   " Search case sensitive when pattern contains upper case characters
set nosmartindent                 " Smart indent moves comments all the way left
set   smarttab                    " TAB and BS skip 4 spaces, at the beginning of the line
set   softtabstop=4               " Soft TAB seems wonky, and I use spaces anyway
set startofline                   " Don't skip to the first non-space
" set   statusline " TODO FIXME TODO
set   switchbuf=newtab,usetab     " Switching buffers opens in new tabs (TODO: doesn't do anything I can see)
set   tabstop=8                   " Used only to display existing TABs, in my case old code, TAB=8
set noterse                       " Message when searching passes end of file
set notildeop                     " Tilde is just for current character
set   textwidth=100               " Used mostly to position end-of-line marker
set   undodir=~/.vim/undo         " Undo-location
set   undofile                    " Enable undo preserved across editing sessions
set   undolevels=500              " 500 undo changes
set   swapfile                    " Create swap file
set   updatecount=100             " Flushing swap file every 10 keystrokes (yeah!)
set   updatetime=3000             " Flushing swap file every 3 seconds
set   virtualedit=block           " Move around screen freely when in visual mode.
set  whichwrap=<,>,[,]            " Left and Right allowed to pass line end, normal mode, insert mode
set   wildmode=list:longest
set nowrap                        " Don't wrap displaying long lines (don't confude with textwrap)
set   wrapmargin=0                " Shoul not be needed, since text wrapping is off

" Shift-T for inserts a to-do
nnoremap T O// TODO(<c-r>=$USER<cr>):<space>
" Shift-R to replace word
nnoremap R ciw
" <F2> toggles paste/nopaste in NORMAL mode (see pastetoggle for INSERT mode)
nnoremap <F2> :set invpaste paste?<CR>

let g:NERDTreeWinSize = 50
let g:nerdtree_tabs_open_on_console_startup = 2
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autofind = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
nnoremap <leader>y :YcmForceCompileAndDiagnostics<CR>

nnoremap <leader>v :AV<CR>
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gb :bp<CR>

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

source ~/.dotfiles-local/vimrc-post
