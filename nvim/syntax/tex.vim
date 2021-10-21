syn clear
" Def comments coloring
syn match texComment   "%.*$"                                            



" \begin{}/\end{} section markers: {{{1
syn match  texBeginEnd		"\\begin\>\|\\end\>" nextgroup=texBeginEndName
syn region texBeginEndName		matchgroup=Delimiter	start="{"		end="}"	contained	nextgroup=texBeginEndModifier	contains=texComment
syn region texBeginEndModifier	matchgroup=Delimiter	start="\["		end="\]"	contained	contains=texComment,@texMathZones,@NoSpell
" }}}

" TeX input: {{{1
syn match texInput		"\\input\s\+[a-zA-Z/.0-9_^]\+"hs=s+7				contains=texStatement
syn match texInputFile		"\\include\(graphics\|list\)\=\(\[.\{-}\]\)\=\s*{.\{-}}"	contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInputFile		"\\\(epsfig\|input\|usepackage\)\s*\(\[.*\]\)\={.\{-}}"		contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInputCurlies	"[{}]"								contained
syn match texTypeStyle		"\\textbf\>"
syn match texTypeStyle		"\\textit\>"
syn region texInputFileOpt	start="\[" end="\]"			contained	contains=texComment

" }}}

" Sync the bad-math
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{abstract}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{center}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{description}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{enumerate}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{itemize}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{table}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\end{tabular}"
syn sync match texSyncMathZoneA		groupthere NONE		"\\\(sub\)*section\>"



"syn match texMath   "\$.*\$"
hi def link texMath  Number

" Other keywords:
syn match texItem   "TODO"                                            
syn match texItem   "\\item"                                            
syn match texItem   "\\cite"
syn match texItem   "\\documentclass"
syn match texItem   "\\usepackage"
syn match texItem   "\\newcommand"
syn match texItem   "\\theoremstyle"
syn match texItem   "\\newtheorem"
syn match texItem   "\\title"
syn match texItem   "\\titlepage"
syn match texItem   "\\author"
syn match texItem   "\\maketitle"
syn match texItem   "\\chapter"
syn match texItem   "\\section"
syn match texItem   "\\subsection"
syn match texItem   "\\subsubsection"
syn match texItem   "\\subsubsection"
syn match texItem   "\\paragraph"
syn match texItem   "\\subparagraph"
syn match texItem   "\\url"

" Other structures:
syn match texSymbols_option "\[.*\]"
"syn match texSymbols_setting "{.*}"
syn match texSymbols_setting "\\\\"
syn match texSymbols_setting "&"
syn match texSymbols_setting   "\\label"
syn match texSymbols_setting   "\\caption"
syn match texSymbols_setting   "\\centering"
syn match texSymbols_setting   "\\hline"

" Implmeenting the highlightings 
hi def link texItem  Identifier
hi def link texSymbols_setting  Delimiter
hi def link texSymbols_option  Conditional
hi def link texComment  Comment
hi def link texInputFileOpt  Identifier
hi def link texBeginEnd  Delimiter
hi def link texBeginEndModifier  Delimiter
hi def link texBeginEndName  Delimiter


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"What follows are from the original syntax file for Tex from the master Vim distribution"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Math Symbols {{{2
" (many of these symbols were contributed by Björn Winckler)
let s:texMathList=[
\ ['|'		, '‖'],
\ ['aleph'		, 'ℵ'],
\ ['amalg'		, '∐'],
\ ['angle'		, '∠'],
\ ['approx'		, '≈'],
\ ['ast'		, '∗'],
\ ['asymp'		, '≍'],
\ ['backepsilon'	, '∍'],
\ ['backsimeq'	, '≃'],
\ ['backslash'	, '∖'],
\ ['barwedge'	, '⊼'],
\ ['because'	, '∵'],
\ ['between'	, '≬'],
\ ['bigcap'		, '∩'],
\ ['bigcirc'	, '○'],
\ ['bigcup'		, '∪'],
\ ['bigodot'	, '⊙'],
\ ['bigoplus'	, '⊕'],
\ ['bigotimes'	, '⊗'],
\ ['bigsqcup'	, '⊔'],
\ ['bigtriangledown', '∇'],
\ ['bigtriangleup'	, '∆'],
\ ['bigvee'		, '⋁'],
\ ['bigwedge'	, '⋀'],
\ ['blacksquare'	, '∎'],
\ ['bot'		, '⊥'],
\ ['bowtie'	        , '⋈'],
\ ['boxdot'		, '⊡'],
\ ['boxminus'	, '⊟'],
\ ['boxplus'	, '⊞'],
\ ['boxtimes'	, '⊠'],
\ ['bullet'	        , '•'],
\ ['bumpeq'		, '≏'],
\ ['Bumpeq'		, '≎'],
\ ['cap'		, '∩'],
\ ['Cap'		, '⋒'],
\ ['cdot'		, '·'],
\ ['cdots'		, '⋯'],
\ ['circ'		, '∘'],
\ ['circeq'		, '≗'],
\ ['circlearrowleft', '↺'],
\ ['circlearrowright', '↻'],
\ ['circledast'	, '⊛'],
\ ['circledcirc'	, '⊚'],
\ ['clubsuit'	, '♣'],
\ ['complement'	, '∁'],
\ ['cong'		, '≅'],
\ ['coprod'		, '∐'],
\ ['copyright'	, '©'],
\ ['cup'		, '∪'],
\ ['Cup'		, '⋓'],
\ ['curlyeqprec'	, '⋞'],
\ ['curlyeqsucc'	, '⋟'],
\ ['curlyvee'	, '⋎'],
\ ['curlywedge'	, '⋏'],
\ ['dagger'	        , '†'],
\ ['dashv'		, '⊣'],
\ ['ddagger'	, '‡'],
\ ['ddots'	        , '⋱'],
\ ['diamond'	, '⋄'],
\ ['diamondsuit'	, '♢'],
\ ['div'		, '÷'],
\ ['doteq'		, '≐'],
\ ['doteqdot'	, '≑'],
\ ['dotplus'	, '∔'],
\ ['dots'		, '…'],
\ ['dotsb'		, '⋯'],
\ ['dotsc'		, '…'],
\ ['dotsi'		, '⋯'],
\ ['dotso'		, '…'],
\ ['doublebarwedge'	, '⩞'],
\ ['downarrow'	, '↓'],
\ ['Downarrow'	, '⇓'],
\ ['ell'		, 'ℓ'],
\ ['emptyset'	, '∅'],
\ ['eqcirc'		, '≖'],
\ ['eqsim'		, '≂'],
\ ['eqslantgtr'	, '⪖'],
\ ['eqslantless'	, '⪕'],
\ ['equiv'		, '≡'],
\ ['exists'		, '∃'],
\ ['fallingdotseq'	, '≒'],
\ ['flat'		, '♭'],
\ ['forall'		, '∀'],
\ ['frown'		, '⁔'],
\ ['ge'		, '≥'],
\ ['geq'		, '≥'],
\ ['geqq'		, '≧'],
\ ['gets'		, '←'],
\ ['gg'		, '⟫'],
\ ['gneqq'		, '≩'],
\ ['gtrdot'		, '⋗'],
\ ['gtreqless'	, '⋛'],
\ ['gtrless'	, '≷'],
\ ['gtrsim'		, '≳'],
\ ['hbar'		, 'ℏ'],
\ ['heartsuit'	, '♡'],
\ ['hookleftarrow'	, '↩'],
\ ['hookrightarrow'	, '↪'],
\ ['iiint'		, '∭'],
\ ['iint'		, '∬'],
\ ['Im'		, 'ℑ'],
\ ['imath'		, 'ɩ'],
\ ['in'		, '∈'],
\ ['infty'		, '∞'],
\ ['int'		, '∫'],
\ ['lceil'		, '⌈'],
\ ['ldots'		, '…'],
\ ['le'		, '≤'],
\ ['leadsto'	, '↝'],
\ ['left('		, '('],
\ ['left\['		, '['],
\ ['left\\{'	, '{'],
\ ['leftarrow'	, '←'],
\ ['Leftarrow'	, '⇐'],
\ ['leftarrowtail'	, '↢'],
\ ['leftharpoondown', '↽'],
\ ['leftharpoonup'	, '↼'],
\ ['leftrightarrow'	, '↔'],
\ ['Leftrightarrow'	, '⇔'],
\ ['leftrightsquigarrow', '↭'],
\ ['leftthreetimes'	, '⋋'],
\ ['leq'		, '≤'],
\ ['leq'		, '≤'],
\ ['leqq'		, '≦'],
\ ['lessdot'	, '⋖'],
\ ['lesseqgtr'	, '⋚'],
\ ['lesssim'	, '≲'],
\ ['lfloor'		, '⌊'],
\ ['ll'		, '≪'],
\ ['lmoustache'     , '╭'],
\ ['lneqq'		, '≨'],
\ ['ltimes'		, '⋉'],
\ ['mapsto'		, '↦'],
\ ['measuredangle'	, '∡'],
\ ['mid'		, '∣'],
\ ['models'		, '╞'],
\ ['mp'		, '∓'],
\ ['nabla'		, '∇'],
\ ['natural'	, '♮'],
\ ['ncong'		, '≇'],
\ ['ne'		, '≠'],
\ ['nearrow'	, '↗'],
\ ['neg'		, '¬'],
\ ['neq'		, '≠'],
\ ['nexists'	, '∄'],
\ ['ngeq'		, '≱'],
\ ['ngeqq'		, '≱'],
\ ['ngtr'		, '≯'],
\ ['ni'		, '∋'],
\ ['nleftarrow'	, '↚'],
\ ['nLeftarrow'	, '⇍'],
\ ['nLeftrightarrow', '⇎'],
\ ['nleq'		, '≰'],
\ ['nleqq'		, '≰'],
\ ['nless'		, '≮'],
\ ['nmid'		, '∤'],
\ ['notin'		, '∉'],
\ ['nprec'		, '⊀'],
\ ['nrightarrow'	, '↛'],
\ ['nRightarrow'	, '⇏'],
\ ['nsim'		, '≁'],
\ ['nsucc'		, '⊁'],
\ ['ntriangleleft'	, '⋪'],
\ ['ntrianglelefteq', '⋬'],
\ ['ntriangleright'	, '⋫'],
\ ['ntrianglerighteq', '⋭'],
\ ['nvdash'		, '⊬'],
\ ['nvDash'		, '⊭'],
\ ['nVdash'		, '⊮'],
\ ['nwarrow'	, '↖'],
\ ['odot'		, '⊙'],
\ ['oint'		, '∮'],
\ ['ominus'		, '⊖'],
\ ['oplus'		, '⊕'],
\ ['oslash'		, '⊘'],
\ ['otimes'		, '⊗'],
\ ['owns'		, '∋'],
\ ['P'	        , '¶'],
\ ['parallel'	, '║'],
\ ['partial'	, '∂'],
\ ['perp'		, '⊥'],
\ ['pitchfork'	, '⋔'],
\ ['pm'		, '±'],
\ ['prec'		, '≺'],
\ ['precapprox'	, '⪷'],
\ ['preccurlyeq'	, '≼'],
\ ['preceq'		, '⪯'],
\ ['precnapprox'	, '⪹'],
\ ['precneqq'	, '⪵'],
\ ['precsim'	, '≾'],
\ ['prime'		, '′'],
\ ['prod'		, '∏'],
\ ['propto'		, '∝'],
\ ['rceil'		, '⌉'],
\ ['Re'		, 'ℜ'],
\ ['rfloor'		, '⌋'],
\ ['right)'		, ')'],
\ ['right]'		, ']'],
\ ['right\\}'	, '}'],
\ ['rightarrow'	, '→'],
\ ['Rightarrow'	, '⇒'],
\ ['rightarrowtail'	, '↣'],
\ ['rightleftharpoons', '⇌'],
\ ['rightsquigarrow', '↝'],
\ ['rightthreetimes', '⋌'],
\ ['risingdotseq'	, '≓'],
\ ['rmoustache'     , '╮'],
\ ['rtimes'		, '⋊'],
\ ['S'	        , '§'],
\ ['searrow'	, '↘'],
\ ['setminus'	, '∖'],
\ ['sharp'		, '♯'],
\ ['sim'		, '∼'],
\ ['simeq'		, '⋍'],
\ ['smile'		, '‿'],
\ ['spadesuit'	, '♠'],
\ ['sphericalangle'	, '∢'],
\ ['sqcap'		, '⊓'],
\ ['sqcup'		, '⊔'],
\ ['sqsubset'	, '⊏'],
\ ['sqsubseteq'	, '⊑'],
\ ['sqsupset'	, '⊐'],
\ ['sqsupseteq'	, '⊒'],
\ ['star'		, '✫'],
\ ['subset'		, '⊂'],
\ ['Subset'		, '⋐'],
\ ['subseteq'	, '⊆'],
\ ['subseteqq'	, '⫅'],
\ ['subsetneq'	, '⊊'],
\ ['subsetneqq'	, '⫋'],
\ ['succ'		, '≻'],
\ ['succapprox'	, '⪸'],
\ ['succcurlyeq'	, '≽'],
\ ['succeq'		, '⪰'],
\ ['succnapprox'	, '⪺'],
\ ['succneqq'	, '⪶'],
\ ['succsim'	, '≿'],
\ ['sum'		, '∑'],
\ ['supset'		, '⊃'],
\ ['Supset'		, '⋑'],
\ ['supseteq'	, '⊇'],
\ ['supseteqq'	, '⫆'],
\ ['supsetneq'	, '⊋'],
\ ['supsetneqq'	, '⫌'],
\ ['surd'		, '√'],
\ ['swarrow'	, '↙'],
\ ['therefore'	, '∴'],
\ ['times'		, '×'],
\ ['to'		, '→'],
\ ['top'		, '⊤'],
\ ['triangle'	, '∆'],
\ ['triangleleft'	, '⊲'],
\ ['trianglelefteq'	, '⊴'],
\ ['triangleq'	, '≜'],
\ ['triangleright'	, '⊳'],
\ ['trianglerighteq', '⊵'],
\ ['twoheadleftarrow', '↞'],
\ ['twoheadrightarrow', '↠'],
\ ['uparrow'	, '↑'],
\ ['Uparrow'	, '⇑'],
\ ['updownarrow'	, '↕'],
\ ['Updownarrow'	, '⇕'],
\ ['varnothing'	, '∅'],
\ ['vartriangle'	, '∆'],
\ ['vdash'		, '⊢'],
\ ['vDash'		, '⊨'],
\ ['Vdash'		, '⊩'],
\ ['vdots'		, '⋮'],
\ ['vee'		, '∨'],
\ ['veebar'		, '⊻'],
\ ['Vvdash'		, '⊪'],
\ ['wedge'		, '∧'],
\ ['wp'		, '℘'],
\ ['wr'		, '≀']]
"    \ ['jmath'		, 'X']
"    \ ['uminus'	, 'X']
"    \ ['uplus'		, 'X']
for texmath in s:texMathList
if texmath[0] =~# '\w$'
exe "syn match texMathSymbol '\\\\".texmath[0]."\\>' contained conceal cchar=".texmath[1]
else
exe "syn match texMathSymbol '\\\\".texmath[0]."' contained conceal cchar=".texmath[1]
endif
endfor

if &ambw == "double"
syn match texMathSymbol '\\gg\>'			contained conceal cchar=≫
syn match texMathSymbol '\\ll\>'			contained conceal cchar=≪
else
syn match texMathSymbol '\\gg\>'			contained conceal cchar=⟫
syn match texMathSymbol '\\ll\>'			contained conceal cchar=⟪
endif

syn match texMathSymbol '\\hat{a}' contained conceal cchar=â
syn match texMathSymbol '\\hat{A}' contained conceal cchar=Â
syn match texMathSymbol '\\hat{c}' contained conceal cchar=ĉ
syn match texMathSymbol '\\hat{C}' contained conceal cchar=Ĉ
syn match texMathSymbol '\\hat{e}' contained conceal cchar=ê
syn match texMathSymbol '\\hat{E}' contained conceal cchar=Ê
syn match texMathSymbol '\\hat{g}' contained conceal cchar=ĝ
syn match texMathSymbol '\\hat{G}' contained conceal cchar=Ĝ
syn match texMathSymbol '\\hat{i}' contained conceal cchar=î
syn match texMathSymbol '\\hat{I}' contained conceal cchar=Î
syn match texMathSymbol '\\hat{o}' contained conceal cchar=ô
syn match texMathSymbol '\\hat{O}' contained conceal cchar=Ô
syn match texMathSymbol '\\hat{s}' contained conceal cchar=ŝ
syn match texMathSymbol '\\hat{S}' contained conceal cchar=Ŝ
syn match texMathSymbol '\\hat{u}' contained conceal cchar=û
syn match texMathSymbol '\\hat{U}' contained conceal cchar=Û
syn match texMathSymbol '\\hat{w}' contained conceal cchar=ŵ
syn match texMathSymbol '\\hat{W}' contained conceal cchar=Ŵ
syn match texMathSymbol '\\hat{y}' contained conceal cchar=ŷ
syn match texMathSymbol '\\hat{Y}' contained conceal cchar=Ŷ
"  syn match texMathSymbol '\\bar{a}' contained conceal cchar=a̅

" Inline Math Zones: {{{2
syn region texMathZoneV	matchgroup=Identifier start="\\("			matchgroup=Delimiter	end="\\)\|%stopzone\>"			keepend concealends contains=@texMathZoneGroup
syn region texMathZoneW	matchgroup=Identifier start="\\\["			matchgroup=Delimiter	end="\\]\|%stopzone\>"			keepend concealends contains=@texMathZoneGroup
syn region texMathZoneX	matchgroup=Identifier start="\$" skip="\\\\\|\\\$"	matchgroup=Delimiter	end="\$"	end="%stopzone\>"		concealends contains=@texMathZoneGroup
syn region texMathZoneY	matchgroup=Identifier start="\$\$" 			matchgroup=Delimiter	end="\$\$"	end="%stopzone\>"	keepend concealends contains=@texMathZoneGroup
syn region texMathZoneZ	matchgroup=texStatement start="\\ensuremath\s*{"	matchgroup=texStatement	end="}"		end="%stopzone\>"	contains=@texMathZoneGroup
