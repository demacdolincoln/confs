"arquivo de configuração do VIM
"usei como base diversos sites pela internet, em especial o http://aurelio.net/doc/coluna/coluna-09.vim , http://www.vivaolinux.com.br/etc/.vimrc-dibetao e http://aurelio.net/vim/vimrc-ivan.txt
set viminfo='10,\"30,:20,%,n~/.viminfo "usa o .viminfo para guardar o histórico de uso
au BufReadpost * if line("'\"")|execute("normal '\"")|endif "abre o arquivo deixando o cursor na mesma posição que da última vez
"
"autocompletar primeira palavra usando o F7 e as seguintes com o F8
"
imap <F7> <c-n>
imap <F8> <c-x><c-n>
"
"mostrando/ocultando os comentários
"
fu! CommOnOff()
        if !exists('g:hiddcomm')
                let g:hiddcomm=1 | hi Comment ctermfg=black
        else
                unlet g:hiddcomm | hi Comment ctermfg=cyan
        endif
endfu
map <F11> :call CommOnOff()<cr>
"
"configurações sobre o comportamento do VIM
"
set ic is hls scs "opções espertas de busca
set sm "ShowMatch (mostrando par de chaves e colchetes)
set expandtab "usando tabulações e espaços
set autoindent "autoidentação
set ruler "regua: mostra a posição do cursor
set shm=filmnrwxt "SHortMessages: encurta as mensagens da regua
set wildmode=longest,list "para completação do TAB igual ao bash
set mouse=a "habilita todas as ações do mouse
set ts=4 "seta onde o tab pára
set sw=4 "Shiftwidth: largura do tab
set nu "numeração de linhas
syntax on "syntax highlight
"
"configurando o título
"
set title
set titlelen=25
set titlestring=%<Nome=%t%m%r%h%w
\%=
\BUFFER=%n
\%(\ %a%)
\%28([TOTAL\ DE\ LINHAS=%L]%)
"
"configurando régua:
"
setlocal laststatus=2
highlight Statusline ctermfg=black       ctermbg=cyan
"
"definindo cores:
"
colorscheme koehler "esquema de cores, veja as disponíveis em /usr/share/vim;vim7*/colors
syn on "ativa as cores
"
"melhorando a utilização do VIM para Python
"
au FileType python syn match pythonTAB '\t\+'
au FileType python hi pythonTAB ctermbg=blue
au FileType python set ts=4 tw=80 noet
au FileType python hi pythonString ctermfg=darkblue
"
"fechamento automático de parênteses:
"
imap ( ()<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
