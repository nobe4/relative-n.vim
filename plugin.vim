" List of all displayed lines
let b:lines = []

" Add a line to the signbar
function! AddLine(lnum)
  " create a unique id to the current sign
  let l:id = a:lnum * 1000 + bufnr('%')

  " Create a new sign and place it
  execute 'sign define Signature_' . l:id . ' text=' . a:lnum
  execute 'sign place ' . l:id . ' line=' . a:lnum . ' name=Signature_' . l:id . ' buffer=' . bufnr('%')
endfunction

function! Remove(lnum)
  " Find the sign based on it's id and remove it
  let l:id = a:lnum * 1000 + bufnr('%')
  silent! execute 'sign unplace ' . l:id
endfunction

" Create a list of all lines on the document to display
function! GetLines(currentLine) abort
  let l:c = a:currentLine % 10

  while l:c <= line('$')
    call add(b:lines, l:c)
    let l:c += 10
  endwhile
endfunction

" Get called on every cursor move, reload the signs
function! Refresh()
  for j in b:lines
      call Remove (j)
  endfor
  let b:lines = []

  call GetLines(line('.'))
  for j in b:lines
      call AddLine(j)
  endfor
endfunction

" Call the refresh method once on every cursor move
augroup CursorMove
  autocmd!
  autocmd CursorMoved * call Refresh()
augroup END
