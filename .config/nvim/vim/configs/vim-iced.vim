function! MyPortalOpen() abort
  call iced#nrepl#eval#code("(do ((requiring-resolve 'portal.api/open)) (add-tap (requiring-resolve 'portal.api/submit)))",
      \ {'ignore_session_validity': v:true, 'ignore_ns': v:true})
endfunction

function! MyPortalClear() abort
  call iced#nrepl#eval#code("(portal.api/clear)",
      \ {'ignore_session_validity': v:true, 'ignore_ns': v:true})
endfunction

let g:iced#palette = {
      \ 'PortalOpen': ":call MyPortalOpen()",
      \ 'PortalClear': ":call MyPortalClear()",
      \ }

let g:iced_formatter = 'cljstyle'

nnoremap tt :IcedCycleSrcAndTest<CR>

aug VimIcedAutoFormatOnWriting
  au!
  " Format whole buffer on writing files
  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

  " Format only current form on writing files
  " au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
aug END

let g:iced#hook = {
    \ 'evaluated': {'type': 'command',
    \               'exec': 'IcedPrintLast' },
    \ }

nmap <Leader>mn <Plug>(iced_jump_to_next_sign)
nmap <Leader>mN <Plug>(iced_jump_to_prev_sign)
nmap <Leader>ml <Plug>(iced_jump_to_let)
" nmap <C-[> :1po<CR>
" <Leader>rcn
nmap <Nop>(iced_macroexpand_outer_list) <Plug>(iced_macroexpand_outer_list) 
