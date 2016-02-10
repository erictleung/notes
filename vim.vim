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
