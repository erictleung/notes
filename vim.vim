" resources
" - Vim Cheatsheet http://vimsheet.com/
" - Five Minute Vimscript http://andrewscala.com/vimscript/
" - Learn Vimscript the Hard Way http://learnvimscriptthehardway.stevelosh.com/
" - Vim Help Files Online https://vimhelp.org/

" read Vim manual in Vim
help

" read Vim manual on particular topic
help wrap

" comments are made with double quotes
" comment like this

" echo back messages
echo "Hello, world!"

" echo back messages more permanently
echom "Hello again, world!"

" boolean options
set number " <name>
set nonumber " no<name>

" toggling boolean options
set number! " toggle on/off
set number! " toggle off/on

" ask vim what option is currently set
set number? " <name>?

" set numeric options
set numberwidth=10

" set multiple options in one line
set number numberwidth=10

" remap one key (e.g. '-') to another key (e.g. 'x')
map - x

" spacial characters are in angle brackets
"" when you press space, you'll visually select word
map <space> viw
"" when you press Ctrl-d, you'll delete the line
map <c-d> dd

" more mapping commands for working in specific modes
"" nmap = normal mode
nmap \ dd
"" vmap = visual mode
vmap \ U
"" imap = insert mode
imap <c-d> <esc>ddi

" be careful for recursive mapping e.g.
nmap dd O<esc>jddk

" change file format of file
set ff=unix
set ff=mac
set ff=dos

" set a new leader key
let mapleader = "-" " new leader is '-' key

" define new command using leader key
nnoremap <leader>d dd

" add abbreviations
iabbrev adn and " replace 'adn' with 'and' when typing

" apply mappings in buffer where defined with <buffer>
nnoremap <buffer> <leader>x dd

" autocommands to do things when certain events happen
autocmd BufNewFile * :write " when opening any new file, write it first

" interacting with Vim dictionary
zg " add word
zG " add word to internal word list
zw " like zg but marks word as wrong
zW " like zw but to internal word list
zuw " undo zw
zug " undo zg
zuW " undo zW
zuG " undo zG

" set different file formats
set fileformat=unix
set ff=unix
set ff=dos
set ff=mac
set ffs=unix,dos

" repeat colon command
" @: and repeat with @@
" source: http://vim.wikia.com/wiki/Repeat_last_colon_command

" paste text temporarily from clipboard
set paste

" forces Vim to source .vimrc in working directory
set exrc

" restrict usage of commands to non-default .vimrc files
set secure

" capitalize first letter of first word in each line
" inspired by: https://stackoverflow.com/a/17440797/
" :%s/\<./\u&/g

" word count buffer
" Press g then Ctrl-g
" E.g. Selected 6 of 358 Lines; 37 of 2281 Words; 186 of 13426 Bytes

" confirm text substitutions with c
" :%s/old/new/gc

" use mouse to highlight
set mouse=a

" automatically reselect previously highlighted areas
" gv

" quick search back and forth
" * and # while cursor over word

" delete lines that contain "word"
" :g/word/d

" delete lines that dont' match "word"
" :v/word/d
