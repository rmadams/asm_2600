      processor 6502  

      include "vcs.h"
      include "macro.h"

	SEG
	ORG $F000

Reset:

StartOfFrame:
	; Start of vertical blank processing
	lda #0
	sta VBLANK

	lda #2
	sta VSYNC

	; 3 scanlines of VSYNCH signal...
	sta WSYNC
	sta WSYNC
	sta WSYNC
	
	lda #0
	sta VSYNC

	; 37 scanlines of vertical blank
	; Try replacing this with a loop
	
	ldx #37
Loop:
	sta WSYNC
	dex
	bne Loop

	; 192 scanlines of picture

	ldx #0

	;REPEAT 192 ; scanlines
	; Replace REPEAT macro with loop
	ldy #192
ScanLoop:
	inx
	stx COLUBK
	sta WSYNC
	dey
	bne ScanLoop
	
	;REPEND

	lda #%010000010
	sta VBLANK ; End of screen enter blanking

	; 30 scanlines of overscan...
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	
	jmp StartOfFrame

	ORG $FFFA

	.word Reset
	.word Reset
	.word Reset

END

