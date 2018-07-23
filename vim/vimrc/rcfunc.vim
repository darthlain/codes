"wしたあとQuickRunする
function! WQuickRun()
  :w
  :QuickRun
endfunction

"ファイルを開いているときといないときで開き方を変える
function! Vimshellf()
  if @% == ''
    :VimShell
  else
    :lcd %:h
    :VimShellCreate
  endif
endfunction

function! Runprogram()
  :w
  let e = expand("%:e")


  if e == "tcl"
    :!wish86 %:p
  endif

  if has('win64')

    if e == "c"
      :!gcc %:p -o %:p:r.exe "-finput-charset=CP932 -fexec-charset=CP932
      :!%:r
    endif
  endif

  if has('unix')
    :!./%:r
  endif

  unlet e
endfunction
