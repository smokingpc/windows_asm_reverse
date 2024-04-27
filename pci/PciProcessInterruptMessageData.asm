;called from pci!PciProgramMsiXInterrupt()

5: kd> uf pci!PciProcessInterruptMessageData
pci!PciProcessInterruptMessageData:
fffff808`d84c9d30 4053            push    rbx
fffff808`d84c9d32 56              push    rsi
fffff808`d84c9d33 57              push    rdi
fffff808`d84c9d34 4881ece0000000  sub     rsp,0E0h
fffff808`d84c9d3b 488b05ee240200  mov     rax,qword ptr [pci!_security_cookie (fffff808`d84ec230)]
fffff808`d84c9d42 4833c4          xor     rax,rsp
fffff808`d84c9d45 48898424d0000000 mov     qword ptr [rsp+0D0h],rax
fffff808`d84c9d4d 488bbc2420010000 mov     rdi,qword ptr [rsp+120h]
fffff808`d84c9d55 418d4001        lea     eax,[r8+1]
fffff808`d84c9d59 498bd9          mov     rbx,r9
fffff808`d84c9d5c 488bf1          mov     rsi,rcx
fffff808`d84c9d5f 3902            cmp     dword ptr [rdx],eax
fffff808`d84c9d61 0f827a7c0000    jb      pci!PciProcessInterruptMessageData+0x7cb1 (fffff808`d84d19e1)  Branch

pci!PciProcessInterruptMessageData+0x37:
fffff808`d84c9d67 418bc0          mov     eax,r8d
fffff808`d84c9d6a 486bc858        imul    rcx,rax,58h
fffff808`d84c9d6e 4803d1          add     rdx,rcx
fffff808`d84c9d71 8b4208          mov     eax,dword ptr [rdx+8]
fffff808`d84c9d74 8d48ff          lea     ecx,[rax-1]
fffff808`d84c9d77 83f902          cmp     ecx,2
fffff808`d84c9d7a 0f87617c0000    ja      pci!PciProcessInterruptMessageData+0x7cb1 (fffff808`d84d19e1)  Branch

pci!PciProcessInterruptMessageData+0x50:
fffff808`d84c9d80 83e801          sub     eax,1
fffff808`d84c9d83 0f8494000000    je      pci!PciProcessInterruptMessageData+0xed (fffff808`d84c9e1d)  Branch

pci!PciProcessInterruptMessageData+0x59:
fffff808`d84c9d89 83e801          sub     eax,1
fffff808`d84c9d8c 0f84ae7b0000    je      pci!PciProcessInterruptMessageData+0x7c10 (fffff808`d84d1940)  Branch

pci!PciProcessInterruptMessageData+0x62:
fffff808`d84c9d92 83f801          cmp     eax,1
fffff808`d84c9d95 0f853c7c0000    jne     pci!PciProcessInterruptMessageData+0x7ca7 (fffff808`d84d19d7)  Branch

pci!PciProcessInterruptMessageData+0x6b:
fffff808`d84c9d9b 0f104220        movups  xmm0,xmmword ptr [rdx+20h]
fffff808`d84c9d9f 8b420c          mov     eax,dword ptr [rdx+0Ch]
fffff808`d84c9da2 488d4c2430      lea     rcx,[rsp+30h]
fffff808`d84c9da7 89442438        mov     dword ptr [rsp+38h],eax
fffff808`d84c9dab 8b4250          mov     eax,dword ptr [rdx+50h]
fffff808`d84c9dae 0f11442440      movups  xmmword ptr [rsp+40h],xmm0
fffff808`d84c9db3 c744243000000000 mov     dword ptr [rsp+30h],0
fffff808`d84c9dbb 0f104230        movups  xmm0,xmmword ptr [rdx+30h]
fffff808`d84c9dbf 488d542470      lea     rdx,[rsp+70h]
fffff808`d84c9dc4 89442450        mov     dword ptr [rsp+50h],eax
fffff808`d84c9dc8 0f11442454      movups  xmmword ptr [rsp+54h],xmm0
fffff808`d84c9dcd 48ff1544920200  call    qword ptr [pci!_imp_HalGetMessageRoutingInfo (fffff808`d84f3018)]
fffff808`d84c9dd4 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84c9dd9 85c0            test    eax,eax
fffff808`d84c9ddb 7825            js      pci!PciProcessInterruptMessageData+0xd2 (fffff808`d84c9e02)  Branch

pci!PciProcessInterruptMessageData+0xad:
fffff808`d84c9ddd 837c247803      cmp     dword ptr [rsp+78h],3
fffff808`d84c9de2 7447            je      pci!PciProcessInterruptMessageData+0xfb (fffff808`d84c9e2b)  Branch

pci!PciProcessInterruptMessageData+0xb4:
fffff808`d84c9de4 4c8bcb          mov     r9,rbx
fffff808`d84c9de7 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff808`d84c9dec 4533c0          xor     r8d,r8d
fffff808`d84c9def 488d542470      lea     rdx,[rsp+70h]
fffff808`d84c9df4 488bce          mov     rcx,rsi
fffff808`d84c9df7 e834ffffff      call    pci!PciProcessInterruptMessageData (fffff808`d84c9d30)
fffff808`d84c9dfc 85c0            test    eax,eax
fffff808`d84c9dfe 7802            js      pci!PciProcessInterruptMessageData+0xd2 (fffff808`d84c9e02)  Branch

pci!PciProcessInterruptMessageData+0xd0:
fffff808`d84c9e00 33c0            xor     eax,eax

pci!PciProcessInterruptMessageData+0xd2:
fffff808`d84c9e02 488b8c24d0000000 mov     rcx,qword ptr [rsp+0D0h]
fffff808`d84c9e0a 4833cc          xor     rcx,rsp
fffff808`d84c9e0d e80e150000      call    pci!_security_check_cookie (fffff808`d84cb320)
fffff808`d84c9e12 4881c4e0000000  add     rsp,0E0h
fffff808`d84c9e19 5f              pop     rdi
fffff808`d84c9e1a 5e              pop     rsi
fffff808`d84c9e1b 5b              pop     rbx
fffff808`d84c9e1c c3              ret

pci!PciProcessInterruptMessageData+0xed:
fffff808`d84c9e1d 488b4250        mov     rax,qword ptr [rdx+50h]
fffff808`d84c9e21 498901          mov     qword ptr [r9],rax
fffff808`d84c9e24 8b4258          mov     eax,dword ptr [rdx+58h]
fffff808`d84c9e27 8907            mov     dword ptr [rdi],eax
fffff808`d84c9e29 ebd5            jmp     pci!PciProcessInterruptMessageData+0xd0 (fffff808`d84c9e00)  Branch

pci!PciProcessInterruptMessageData+0xfb:
fffff808`d84c9e2b b8010000c0      mov     eax,0C0000001h
fffff808`d84c9e30 ebd0            jmp     pci!PciProcessInterruptMessageData+0xd2 (fffff808`d84c9e02)  Branch

pci!PciProcessInterruptMessageData+0x7c10:
fffff808`d84d1940 488b4650        mov     rax,qword ptr [rsi+50h]
fffff808`d84d1944 488b4860        mov     rcx,qword ptr [rax+60h]
fffff808`d84d1948 4885c9          test    rcx,rcx
fffff808`d84d194b 740a            je      pci!PciProcessInterruptMessageData+0x7c27 (fffff808`d84d1957)  Branch

pci!PciProcessInterruptMessageData+0x7c1d:
fffff808`d84d194d 8b8198020000    mov     eax,dword ptr [rcx+298h]
fffff808`d84d1953 a810            test    al,10h
fffff808`d84d1955 750d            jne     pci!PciProcessInterruptMessageData+0x7c34 (fffff808`d84d1964)  Branch

pci!PciProcessInterruptMessageData+0x7c27:
fffff808`d84d1957 8b8638050000    mov     eax,dword ptr [rsi+538h]
fffff808`d84d195d 480fbae00e      bt      rax,0Eh
fffff808`d84d1962 7373            jae     pci!PciProcessInterruptMessageData+0x7ca7 (fffff808`d84d19d7)  Branch

pci!PciProcessInterruptMessageData+0x7c34:
fffff808`d84d1964 4885c9          test    rcx,rcx
fffff808`d84d1967 740a            je      pci!PciProcessInterruptMessageData+0x7c43 (fffff808`d84d1973)  Branch

pci!PciProcessInterruptMessageData+0x7c39:
fffff808`d84d1969 8b8198020000    mov     eax,dword ptr [rcx+298h]
fffff808`d84d196f a820            test    al,20h
fffff808`d84d1971 750d            jne     pci!PciProcessInterruptMessageData+0x7c50 (fffff808`d84d1980)  Branch

pci!PciProcessInterruptMessageData+0x7c43:
fffff808`d84d1973 8b8638050000    mov     eax,dword ptr [rsi+538h]
fffff808`d84d1979 480fbae00f      bt      rax,0Fh
fffff808`d84d197e 7357            jae     pci!PciProcessInterruptMessageData+0x7ca7 (fffff808`d84d19d7)  Branch

pci!PciProcessInterruptMessageData+0x7c50:
fffff808`d84d1980 4c8b4250        mov     r8,qword ptr [rdx+50h]
fffff808`d84d1984 41b90000e0fe    mov     r9d,0FEE00000h
fffff808`d84d198a 418bc0          mov     eax,r8d
fffff808`d84d198d 418bc8          mov     ecx,r8d
fffff808`d84d1990 c1e808          shr     eax,8
fffff808`d84d1993 83e140          and     ecx,40h
fffff808`d84d1996 0fb6d0          movzx   edx,al
fffff808`d84d1999 b80400e0fe      mov     eax,0FEE00004h
fffff808`d84d199e 450f45c0        cmovne  r8d,r8d
fffff808`d84d19a2 48c1e20c        shl     rdx,0Ch
fffff808`d84d19a6 85c9            test    ecx,ecx
fffff808`d84d19a8 418bc8          mov     ecx,r8d
fffff808`d84d19ab 410f44c1        cmove   eax,r9d
fffff808`d84d19af 83e120          and     ecx,20h
fffff808`d84d19b2 480bd0          or      rdx,rax
fffff808`d84d19b5 c1e104          shl     ecx,4
fffff808`d84d19b8 418bc0          mov     eax,r8d
fffff808`d84d19bb 488913          mov     qword ptr [rbx],rdx
fffff808`d84d19be 83e01c          and     eax,1Ch
fffff808`d84d19c1 41c1e810        shr     r8d,10h
fffff808`d84d19c5 0bc8            or      ecx,eax
fffff808`d84d19c7 410fb6c0        movzx   eax,r8b
fffff808`d84d19cb c1e106          shl     ecx,6
fffff808`d84d19ce 0bc8            or      ecx,eax
fffff808`d84d19d0 890f            mov     dword ptr [rdi],ecx
fffff808`d84d19d2 e92984ffff      jmp     pci!PciProcessInterruptMessageData+0xd0 (fffff808`d84c9e00)  Branch

pci!PciProcessInterruptMessageData+0x7ca7:
fffff808`d84d19d7 b8bb0000c0      mov     eax,0C00000BBh
fffff808`d84d19dc e92184ffff      jmp     pci!PciProcessInterruptMessageData+0xd2 (fffff808`d84c9e02)  Branch

pci!PciProcessInterruptMessageData+0x7cb1:
fffff808`d84d19e1 b80d0000c0      mov     eax,0C000000Dh
fffff808`d84d19e6 e91784ffff      jmp     pci!PciProcessInterruptMessageData+0xd2 (fffff808`d84c9e02)  Branch
