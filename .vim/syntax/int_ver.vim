" Vim syntax file

" $Id: intver.vim,v 1.5 2005/08/11 15:41:03 james Exp $

syn clear

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New int_ver stuff.
"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-level stuff

syn region      ivComment                start="^#" end="$"
syn match       ivUnderlines             "[=-]\{10,}"
syn match       ivBrackets               "[()*{}]\{10,}"
syn match       ivBranchSign             "@\{10}" contained
syn match       ivImportant              "(\*\+)"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Header stuff

" version-pattern := number "." number ".x"
syn match       ivVersionPattern                "\d\+\.\d\+\.\(\d\+\|x\)" contained
syn match       ivBranchStatus                  "Branch-Status" contained                 
syn region      ivBranchStatusLine              start="Branch-Status:" end="$" contains=ivVersionPattern,ivBranchStatus


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Body stuff

syn match       ivCompName              "\(of\|for\) \w\+"hs=s+3 contained

syn region      ivVersionLine           start="Version " end="$" contains=ivVersionPattern,ivCompName

" this is complex; everything in a ChangeLine should be quite strict, so
" anything that isn't recognised is flagged as Error by the highlighting.
syn match       ivNewChangeType         "\(USER\|DEV\|INT\|SECRET\)-\(BUG-FIX\|COMPATABILITY\|COMPATIBILITY\|NEW-FEATURE\|CHANGE\)" contained
syn match       ivChangeNumber          "\d\+" contained
syn match       ivBugComponent          ":\w\+" contained
syn match       ivBugNumber             "#\(\d\+\|new\)"
syn match       ivBugStatus             "\( re\|opens-\=\|closes-\=\|tags-\w\+\|\s\+\)" contained
runtime!  syntax/wikiword.vim
syn region      ivChangeLine            start="^\(USER\|DEV\|INT\|SECRET\)" end="$" contains=ivNewChangeType,ivChangeNumber,ivBugStatus,ivBugNumber,ivBugComponent,twWordWithWeb

syn match       ivGUHead                "\(GU\w\+-HEAD\|V\w\+-HEAD\)"

syn region      ivBranchLine            start="^@@@@@@@@@@" end="$" contains=ivBranchSign

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Old stuff...

syn region      ivOldVersionLine        start="Notes for" end="$" contains=ivVersionPattern,ivCompName
syn match       ivOldChangeType         "^ \(USER\|DEV\|INTERNAL\)-\(NEW-FEATURE\|BUG-FIX\|COMPATABILITY\|CHANGE\|SECRET\)"

if !exists("did_nfast_syntax_inits")
  let did_nfast_syntax_inits = 1

  hi link ivUnderlines          Constant
  hi link ivComment             Comment
  hi link ivBrackets            DiffDelete
  hi link ivBranchSign          DiffDelete
  hi link ivImportant           Todo
  
  hi link ivCompName            Statement
  hi link ivVersionPattern      Special
  
  hi link ivBranchStatus        Statement
  hi link ivBranchStatusLine    WarningMsg
  hi link ivBranchLine          Identifier
  
  hi link ivVersionLine         Constant
  
  hi link ivNewChangeType       Type
  hi link ivBugComponent        Statement
  hi link ivBugNumber           Number
  hi link ivChangeNumber        Directory
  hi link ivBugStatus           Directory
  hi link ivChangeLine          Error

  hi link ivGUHead              Underlined

  hi link twWord                Number
  hi link twWeb                 Special

  
  hi link ivOldVersionLine      Constant
  hi link ivOldChangeType       Type

endif
