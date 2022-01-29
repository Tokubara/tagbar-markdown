let s:save_cpo = &cpo
set cpo&vim

function! s:doInsertAgenda(status, response)
	echo a:response
endfunction

let s:bin_path = expand('<sfile>:p:h:h').'/bin/mdctags'

function! s:insertAgenda()
	let md_path = expand('%:p')
	execute "read !".s:bin_path.' '.md_path.' 1'
endfunction

command! -nargs=0 MDAgenda call s:insertAgenda()

if !exists('g:tagbar_type_markdown')
	let g:tagbar_type_markdown = {
				\ 'ctagsbin'  : s:bin_path,
				\ 'ctagsargs' : '',
				\ 'kinds'     : [
				\     'g:h:0:0',
				\ ],
				\ 'sro'        : '::',
				\ 'kind2scope' : {
				\     'g' : 'h',
				\ },
				\ 'scope2kind' : {
				\     'h' : 'g',
				\}
				\}
endif

let g:tagbar_type_ghmarkdown = g:tagbar_type_markdown
let g:tagbar_type_rmd = g:tagbar_type_markdown

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker:noexpandtab:ts=2:sts=2:sw=2
