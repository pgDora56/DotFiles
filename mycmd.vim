command! -nargs=1 Fnt call s:fontchange(<f-args>)
command! Py !python %
command! Ghci !stack ghci %
command! Ghc !stack exec -- runghc %
command! Stack !stack build --test --file-watch
command! Tex !ptex2pdf -l -ot -kanji=utf8 -synctex=1 %<CR>
command! Mocho call s:mocho()
command! -nargs=? Mtime call s:nowtime(<f-args>)
command! Test call s:test()
command! -nargs=? Rough call s:roughWithDate(<f-args>)
command! -nargs=1 Roughf call s:roughfile(<f-args>)
command! OpenDiary call s:openDiary()
command! DiaryMemo call s:diaryMemo()

function! s:fontchange(size)
    execute "set gfn=Myrica_MM:h" . a:size . ":cSHIFTJIS"
endfunction

function! s:roughWithDate(...)
    if a:0 == 0
        execute "cd D:\\rough"
    else
        let nowtime = strftime("%Y%m%d_%H%M")
        let filename = nowtime . "." . a:1
        call s:roughfile(filename)
    end
endfunction

function! s:roughfile(filename)
    execute "cd D:\\rough" 
    execute "e " . a:filename
endfunction

function! s:test()
    let now = localtime()
    echo now
    for i in [1,2,3,4,5]
        echo "Hello, (o・∇・o)" . i
    endfor
endfunction

let s:mochocnt = 1
function! s:mocho()
    let i = 0
    while i < s:mochocnt
        echo "(o・∇・o)"
        let i += 1
    endwhile
    let s:mochocnt += 1
endfunction

let s:timerec = -1
function! s:nowtime(...)
    let nowtime = strftime("%m月%d日%H時%M分")
    let loctime = localtime()
    if a:0 >= 1
        if a:1 == "help"
            echo("(o・∇・o)<引数によって私が「r:記録開始, b:終了, 引数なし:現在時刻&経過時間」をお知らせするよ!")
        elseif a:1 == "r"
            echo ("(o・∇・o)<すたーと～ いま" . nowtime . "です～がんばっていこ～")
            let s:timerec = loctime
        elseif a:1 == "b"
            if s:timerec == -1
                echo("(o・∇・o)<時間が記録されてないよ～")
                return
            end
            let strtime = s:getElapsedTime(loctime)
            echo ("(o・∇・o)<いま、" . nowtime . "！ " . strtime . "作業したよ～おつかれさま～")
            let s:timerec = -1
        end
    else
        if s:timerec == -1
            echo ("(o・∇・o)<いま、" . nowtime . "だよ～")
        else
            let strtime = s:getElapsedTime(loctime)
            echo ("(o・∇・o)<いま、" . nowtime . "！ " . strtime . "作業したよ～がんばっていこ～")
        end
    end
endfunction

function! s:getElapsedTime(loctime)
    let worktime = a:loctime - s:timerec
    let wsec = worktime % 60
    let worktime = worktime / 60
    let wmin = worktime % 60
    let whour = worktime / 60
    let strtime = wsec . "秒"
    if whour > 0
        let strtime = whour . "時間" . wmin . "分" . strtime
    elseif wmin > 0
        let strtime = wmin . "分" . strtime
    endif
    return strtime
endfunction

function s:mkdir(directory)
    call mkdir(a:directory)
    execute "cd " . a:directory
endfunction

function! s:diaryMemo()
    let today = strftime("%Y%m%d")
    let filename = today . ".md"
    execute "tabnew /cvar/memo/" . filename
endfunction

function! s:openDiary()
    let filename = strftime("/cvar/diary.md")
    execute "e " . filename
    let heading = "# " . strftime("%Y/%m/%d(%a)")
    let firstline = getline(1)
    let idx = match(firstline,heading)
    if idx < 0
        execute "normal O" . heading . "\n"
        execute "normal O\t* "
        call cursor(2, 417)
    else
        let line = 2
        let lastline = line('$')
        let haveData = match(getline(line), '\*')
        while haveData != -1
            let line = line + 1
            if line == lastline
                break
            endif
            let haveData = match(getline(line), '\*')
        endwhile
        call cursor(line-1, 417)
    endif
endfunction
