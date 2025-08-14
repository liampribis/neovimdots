" Vim syntax file
" Language: Analog Devices SHARC DSP Assembly
" Maintainer: Generated for SHARC assembly
" Last Change: 2025
" Filenames: *.asm *.dsp *.s

if exists("b:current_syntax")
  finish
endif

" Case insensitive
syn case ignore

" Variable names in declarations and usage
syn match sharcVariable "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

" Variable declarations with .var directive
syn match sharcVarDecl "\.var\s\+[a-zA-Z_][a-zA-Z0-9_]*\s*\[\s*\d\+\s*\]" contains=sharcDirective,sharcVariable,sharcNumber
syn match sharcVarDecl "\.var\s\+[a-zA-Z_][a-zA-Z0-9_]*" contains=sharcDirective,sharcVariable

" Labels (identifiers followed by colon)
syn match sharcLabel "^\s*[a-zA-Z_][a-zA-Z0-9_]*:"

" Numbers
syn match sharcNumber "\<\d\+\>"
syn match sharcHexNumber "\<0x[0-9a-fA-F]\+\>"
syn match sharcBinNumber "\<b#[01]\+\>"
syn match sharcFloatNumber "\<\d\+\.\d*\>"

" Registers - Data Registers
syn keyword sharcReg r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15
syn keyword sharcReg s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15

" Registers - Index/Pointer Registers  
syn keyword sharcReg i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i14 i15
syn keyword sharcReg m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15
syn keyword sharcReg l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15
syn keyword sharcReg b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15
syn keyword sharcReg f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15

" System Registers
syn keyword sharcSystemReg mode1 mode2
syn keyword sharcSystemReg faddr daddr pc pcstk pcstkp
syn keyword sharcSystemReg irptl imask imaskp lirptl mmask
syn keyword sharcSystemReg laddr lcntr curlcntr
syn keyword sharcSystemReg tperiod tcount
syn keyword sharcSystemReg flags
syn keyword sharcSystemReg mrf0 mrf1 mrf2
syn keyword sharcSystemReg msf0 msf1 msf2
syn keyword sharcSystemReg mrb0 mrb1 mrb2
syn keyword sharcSystemReg msb0 msb1 msb2
syn keyword sharcSystemReg astatx astaty stkyx stkyy
syn keyword sharcSystemReg px px1 px2 ustat1 ustat2 ustat3 ustat4
syn keyword sharcSystemReg emuclk emuclk2
syn keyword sharcSystemReg eemuin eemustat eemuout sysctl brkctl revpid
syn keyword sharcSystemReg psa1s psa1e psa2s psa2e psa3s psa3e psa4s psa4e
syn keyword sharcSystemReg emun ioas ioae dma1s dma1e dma2s dma2e pmdas pmdae

" Memory Access
syn keyword sharcMemory dm pm io
syn match sharcMemoryAccess "\<\(dm\|pm\|io\)\s*("

" Arithmetic Instructions
syn keyword sharcArithInst add sub mult mac msu
syn keyword sharcArithInst abs neg inc dec
syn keyword sharcArithInst min max clip
syn keyword sharcArithInst divs divq
syn keyword sharcArithInst scalb
syn keyword sharcArithInst fix float
syn keyword sharcArithInst recips rsqrts

" Logical Instructions
syn keyword sharcLogicInst and or xor not
syn keyword sharcLogicInst lshift ashift
syn keyword sharcLogicInst rot bclr bset btst
syn keyword sharcLogicInst exp leftz lefto
syn keyword sharcLogicInst pass
syn keyword sharcLogicInst fext by
syn match sharcArithInst "bit\s*\(set\|clr\|tgl\|tst\|xor\)"
syn keyword sharcArithInst bitrev modify


" Flow Control Instructions
syn keyword sharcFlowInst jump cjump call rts rti idle emuidle
syn keyword sharcFlowInst rframe
syn keyword sharcFlowInst do until
syn keyword sharcFlowInst if else
syn keyword sharcFlowInst nop

" Move Instructions
syn keyword sharcMoveInst move
syn keyword sharcMoveInst gets puts
syn match sharcMoveInst "\(push\|pop\)\s*\(loop\|sts\|pcstk\)"
syn match sharcMoveInst "flush\s*cache"

" Compare Instructions
syn keyword sharcCompareInst comp

" Condition Codes
syn keyword sharcCondition eq ne lt le gt ge
syn keyword sharcCondition ac not_ac av not_av
syn keyword sharcCondition mv not_mv
syn keyword sharcCondition sz not_sz
syn keyword sharcCondition flag0_in flag1_in flag2_in flag3_in
syn keyword sharcCondition flag0_out flag1_out flag2_out flag3_out
syn keyword sharcCondition true false
syn keyword sharcCondition forever

" Data Type Modifiers and Formats
syn keyword sharcFormat ssf suf usf uu sf su us ss
syn keyword sharcFormat rnd sat
syn keyword sharcFormat hi lo
syn keyword sharcFormat x y
syn keyword sharcFormat re im

" Assembler Directives
syn keyword sharcDirective .section .global .extern .align
syn keyword sharcDirective .var .init .seg .endseg
syn keyword sharcDirective .byte .word .long .float
syn keyword sharcDirective .ascii .asciz
syn keyword sharcDirective .include .define .undef
syn keyword sharcDirective .if .ifdef .ifndef .else .endif
syn keyword sharcDirective .macro .endmacro
syn keyword sharcDirective .org .equ .set

" Memory Segments
syn keyword sharcSegment seg_pmco seg_pmda seg_dmda seg_heap seg_stack

" Special Operators
syn match sharcOperator "[\+\-\*\/\=\(\)\[\]\,\;]"
syn match sharcOperator "\<by\>"

" Strings
syn region sharcString start='"' end='"' contains=sharcStringEscape
syn match sharcStringEscape "\\." contained

" Special characters and delimiters
syn match sharcDelimiter "[(),;]"
syn match sharcOperator "[+\-*/%=<>!&|^~]"

" Preprocessing
syn match sharcPreProc "^\s*#.*$"

syn match sharcAppendModifier "(\s*\(db\|la\|ci\|lr\|lw\)\(,\(db\|la\|ci\|lr\|lw\)\)*\s*)"


" Comments - C-style
syn match sharcLineComment "//.*$" contains=sharcCommentTodo
syn region sharcBlockComment start="/\*" end="\*/" contains=sharcCommentTodo
syn keyword sharcCommentTodo TODO FIXME NOTE XXX contained


" Define highlighting groups
hi def link sharcVariable Identifier
hi def link sharcLabel Label
hi def link sharcVarDecl Define
hi def link sharcNumber Number
hi def link sharcHexNumber Number
hi def link sharcBinNumber Number
hi def link sharcFloatNumber Float

hi def link sharcReg Macro
hi def link sharcSystemReg Macro

hi def link sharcMemory StorageClass
hi def link sharcMemoryAccess StorageClass

hi def link sharcArithInst Statement
hi def link sharcLogicInst Statement
hi def link sharcFlowInst Statement
hi def link sharcMoveInst Statement
hi def link sharcCompareInst Statement


hi def link sharcCondition Conditional
hi def link sharcFormat Keyword
hi def link sharcDirective PreProc
hi def link sharcSegment StorageClass
hi def link sharcOperator Operator
hi def link sharcDelimiter Delimiter
hi def link sharcString String
hi def link sharcStringEscape SpecialChar
hi def link sharcPreProc PreProc

hi def link sharcAppendModifier Special

hi def link sharcLineComment Comment
hi def link sharcBlockComment Comment
hi def link sharcCommentTodo Todo

let b:current_syntax = "sharc"
