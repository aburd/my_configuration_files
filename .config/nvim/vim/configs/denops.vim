let g:denops#deno = '/Users/aburd/.deno/bin/deno'

function! Search(value) abort
  let @/ = a:value
  normal! n
endfunction

" call kensaku#query_async(
"       \ 'kensaku',
"       \ { v -> Search(v) },
"       \)
"
" call kensaku#query_async('honbun', { v -> Search(v) })

command -nargs=1 J :call kensaku#query_async('<args>', { v -> Search(v) })
