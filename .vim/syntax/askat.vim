" Vim syntax file for as-kat input files

syn clear

syn match       asNumber                 /\<0x[0-9a-fA-F]\+\>/ contained
syn match       asNumber                 /\<0\>/ contained
syn match       asNumber                 /\<[1-9][0-9]*\>/ contained
syn match       asString                 /("[^"]*"|'[^']')/ contained
syn match       asSymbol                 /\<[a-zA-Z][_a-zA-Z0-9]\+\>/ contained 
syn match       asSymbolStyled           /\<\([A-Z][a-z]*\)\+\>/ contained 
syn region      asSymbolIntern           start="intern(" matchgroup=asSymbolIntern end=")" contains=asString contained
syn match       asBytes                  /bytes(['"][0-9a-fA-F ]*['"])/ contained
syn match       asStructural             /,/ contained
syn match       asStructural             /:/ contained
syn region      asSet                    start=/set(\[/ end=/\])/ matchgroup=asSet contains=@asValue,asStructural
syn region      asMap                    start=/{/ end=/}/ matchgroup=asMap contains=@asValue,asStructural
syn region      asList                   start=/\[/ end=/\]/ matchgroup=asList contains=@asValue,asStructural
syn cluster     asAtom                   contains=asSymbol,asSymbolIntern,asBytes,asNumber,asString
syn cluster     asAggregate              contains=asSet,asMap,asList
syn cluster     asValue                  contains=@asAtom,@asAggregate

syn region      asKeywords               start=/^generate\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^generate-pair\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^import\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^derive-public\>/ end=/$/ contains=asNumber
syn region      asKeywords               start=/^wrap\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^unwrap\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^unwrap-pw\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^derive\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^crypto\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^crypto-pw\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^channel\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^multi\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^reset\>/ end=/$/ matchgroup=asKeywords
syn region      asKeywords               start=/^output\>/ end=/$/ matchgroup=asKeywords
syn region      asKeywords               start=/^corrupt\>/ end=/$/ contains=asSymbolStyled
syn region      asKeywords               start=/^set-rng\>/ end=/$/ contains=asBytes
syn region      asKeywords               start=/^assert-type\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^assert-length\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^assert-result\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^assert-ok\>/ end=/$/ matchgroup=asKeywords
syn region      asKeywords               start=/^assert-error\>/ end=/$/ contains=asSymbolStyled
syn region      asKeywords               start=/^assert-error-top\>/ end=/$/ contains=asSymbolStyled
syn region      asKeywords               start=/^assert-key-eq\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^assert-kind\>/ end=/$/ contains=asList
syn region      asKeywords               start=/^assert-domain\>/ end=/$/ contains=asList

syn region      asComment                start=/^#/ end=/$/

if !exists("did_askat_syn_inits")
    hi link asComment             Comment
    hi link asNumber              Number
    hi link asString              String
    hi link asSymbolStyled        Identifier
    hi link asSymbol              Identifier
    hi link asSymbolIntern        String
    hi link asStructural          Delimiter
    hi link asSet                 Type
    hi link asMap                 Type
    hi link asList                Type
    hi link asKeywords            Keyword

    let did_askat_syn_inits = 1
endif

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
