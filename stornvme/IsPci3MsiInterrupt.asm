52: kd> uf IsPci3MsiInterrupt
stornvme!IsPci3MsiInterrupt:
fffff804`9e884088 80790102        cmp     byte ptr [rcx+1],2
fffff804`9e88408c 7519            jne     stornvme!IsPci3MsiInterrupt+0x1f (fffff804`9e8840a7)  Branch

stornvme!IsPci3MsiInterrupt+0x6:
fffff804`9e88408e f6410403        test    byte ptr [rcx+4],3
fffff804`9e884092 7413            je      stornvme!IsPci3MsiInterrupt+0x1f (fffff804`9e8840a7)  Branch

stornvme!IsPci3MsiInterrupt+0xc:
fffff804`9e884094 b8feffffff      mov     eax,0FFFFFFFEh
fffff804`9e884099 394108          cmp     dword ptr [rcx+8],eax
fffff804`9e88409c 7509            jne     stornvme!IsPci3MsiInterrupt+0x1f (fffff804`9e8840a7)  Branch

stornvme!IsPci3MsiInterrupt+0x16:
fffff804`9e88409e 39410c          cmp     dword ptr [rcx+0Ch],eax
fffff804`9e8840a1 7504            jne     stornvme!IsPci3MsiInterrupt+0x1f (fffff804`9e8840a7)  Branch

stornvme!IsPci3MsiInterrupt+0x1b:
fffff804`9e8840a3 b001            mov     al,1
fffff804`9e8840a5 c3              ret

stornvme!IsPci3MsiInterrupt+0x1f:
fffff804`9e8840a7 32c0            xor     al,al
fffff804`9e8840a9 c3              ret
