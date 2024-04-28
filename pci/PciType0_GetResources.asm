;pci!PciType0_GetResources(pdo_devext, )

2: kd> uf PciType0_GetResources
pci!PciType0_GetResources:
fffff800`0920bbd0 4055            push    rbp
fffff800`0920bbd2 57              push    rdi
fffff800`0920bbd3 4156            push    r14
fffff800`0920bbd5 4881ecc0000000  sub     rsp,0C0h
fffff800`0920bbdc 488b050d880200  mov     rax,qword ptr [pci!_security_cookie (fffff800`092343f0)]
fffff800`0920bbe3 4833c4          xor     rax,rsp
fffff800`0920bbe6 48898424b0000000 mov     qword ptr [rsp+0B0h],rax
fffff800`0920bbee 4c8bf2          mov     r14,rdx
fffff800`0920bbf1 488bf9          mov     rdi,rcx
fffff800`0920bbf4 33d2            xor     edx,edx
fffff800`0920bbf6 488d4c2420      lea     rcx,[rsp+20h]
fffff800`0920bbfb 448d4248        lea     r8d,[rdx+48h]
fffff800`0920bbff e8fc770000      call    pci!memset (fffff800`09213400)
fffff800`0920bc04 33d2            xor     edx,edx
fffff800`0920bc06 41b804010000    mov     r8d,104h
fffff800`0920bc0c 498bce          mov     rcx,r14
fffff800`0920bc0f e8ec770000      call    pci!memset (fffff800`09213400)
fffff800`0920bc14 33ed            xor     ebp,ebp
fffff800`0920bc16 392dec890200    cmp     dword ptr [pci!PciKsrDataCount (fffff800`09234608)],ebp
fffff800`0920bc1c 448bcd          mov     r9d,ebp
fffff800`0920bc1f 0f876b990000    ja      pci!PciType0_GetResources+0x99c0 (fffff800`09215590)  Branch

pci!PciType0_GetResources+0x55:
fffff800`0920bc25 41b902000000    mov     r9d,2
fffff800`0920bc2b 488d542424      lea     rdx,[rsp+24h]
fffff800`0920bc30 488bcf          mov     rcx,rdi
fffff800`0920bc33 458d4102        lea     r8d,[r9+2]
fffff800`0920bc37 e884020000      call    pci!PciReadDeviceConfig (fffff800`0920bec0)

pci!PciType0_GetResources+0x6c:
fffff800`0920bc3c f644242403      test    byte ptr [rsp+24h],3
fffff800`0920bc41 48899c24f0000000 mov     qword ptr [rsp+0F0h],rbx
fffff800`0920bc49 0f84a8000000    je      pci!PciType0_GetResources+0x127 (fffff800`0920bcf7)  Branch

pci!PciType0_GetResources+0x7f:
fffff800`0920bc4f 41b918000000    mov     r9d,18h
fffff800`0920bc55 4889b424f8000000 mov     qword ptr [rsp+0F8h],rsi
fffff800`0920bc5d 488d542430      lea     rdx,[rsp+30h]
fffff800`0920bc62 488bcf          mov     rcx,rdi
fffff800`0920bc65 458d41f8        lea     r8d,[r9-8]
fffff800`0920bc69 e852020000      call    pci!PciReadDeviceConfig (fffff800`0920bec0)
fffff800`0920bc6e 41b904000000    mov     r9d,4
fffff800`0920bc74 488d542450      lea     rdx,[rsp+50h]
fffff800`0920bc79 488bcf          mov     rcx,rdi
fffff800`0920bc7c 458d412c        lea     r8d,[r9+2Ch]
fffff800`0920bc80 e83b020000      call    pci!PciReadDeviceConfig (fffff800`0920bec0)
fffff800`0920bc85 0fb6742424      movzx   esi,byte ptr [rsp+24h]
fffff800`0920bc8a 4c8d5c2430      lea     r11,[rsp+30h]
fffff800`0920bc8f 8bc5            mov     eax,ebp
fffff800`0920bc91 4d8d4e04        lea     r9,[r14+4]
fffff800`0920bc95 4c8d87e9010000  lea     r8,[rdi+1E9h]
fffff800`0920bc9c 0f1f4000        nop     dword ptr [rax]

pci!PciType0_GetResources+0xd0:
fffff800`0920bca0 450fb610        movzx   r10d,byte ptr [r8]
fffff800`0920bca4 4584d2          test    r10b,r10b
fffff800`0920bca7 7575            jne     pci!PciType0_GetResources+0x14e (fffff800`0920bd1e)  Branch

pci!PciType0_GetResources+0xd9:
fffff800`0920bca9 ffc0            inc     eax
fffff800`0920bcab 4983c020        add     r8,20h
fffff800`0920bcaf 4983c114        add     r9,14h
fffff800`0920bcb3 4983c304        add     r11,4
fffff800`0920bcb7 83f806          cmp     eax,6
fffff800`0920bcba 72e4            jb      pci!PciType0_GetResources+0xd0 (fffff800`0920bca0)  Branch

pci!PciType0_GetResources+0xec:
fffff800`0920bcbc 40f6c602        test    sil,2
fffff800`0920bcc0 488bb424f8000000 mov     rsi,qword ptr [rsp+0F8h]
fffff800`0920bcc8 740d            je      pci!PciType0_GetResources+0x107 (fffff800`0920bcd7)  Branch

pci!PciType0_GetResources+0xfa:
fffff800`0920bcca 8b4c2450        mov     ecx,dword ptr [rsp+50h]
fffff800`0920bcce f6c101          test    cl,1
fffff800`0920bcd1 0f8516990000    jne     pci!PciType0_GetResources+0x9a1d (fffff800`092155ed)  Branch

pci!PciType0_GetResources+0x107:
fffff800`0920bcd7 33d2            xor     edx,edx
fffff800`0920bcd9 488d4c2470      lea     rcx,[rsp+70h]
fffff800`0920bcde 448d4240        lea     r8d,[rdx+40h]
fffff800`0920bce2 e819770000      call    pci!memset (fffff800`09213400)
fffff800`0920bce7 488b8fc8000000  mov     rcx,qword ptr [rdi+0C8h]
fffff800`0920bcee 4885c9          test    rcx,rcx
fffff800`0920bcf1 0f85cc000000    jne     pci!PciType0_GetResources+0x1f3 (fffff800`0920bdc3)  Branch

pci!PciType0_GetResources+0x127:
fffff800`0920bcf7 33c0            xor     eax,eax

pci!PciType0_GetResources+0x129:
fffff800`0920bcf9 488b9c24f0000000 mov     rbx,qword ptr [rsp+0F0h]
fffff800`0920bd01 488b8c24b0000000 mov     rcx,qword ptr [rsp+0B0h]
fffff800`0920bd09 4833cc          xor     rcx,rsp
fffff800`0920bd0c e8ff5a0000      call    pci!_security_check_cookie (fffff800`09211810)
fffff800`0920bd11 4881c4c0000000  add     rsp,0C0h
fffff800`0920bd18 415e            pop     r14
fffff800`0920bd1a 5f              pop     rdi
fffff800`0920bd1b 5d              pop     rbp
fffff800`0920bd1c c3              ret

pci!PciType0_GetResources+0x14e:
fffff800`0920bd1e 418d4afd        lea     ecx,[r10-3]
fffff800`0920bd22 f6c1fb          test    cl,0FBh
fffff800`0920bd25 750a            jne     pci!PciType0_GetResources+0x161 (fffff800`0920bd31)  Branch

pci!PciType0_GetResources+0x157:
fffff800`0920bd27 40f6c602        test    sil,2
fffff800`0920bd2b 0f8478ffffff    je      pci!PciType0_GetResources+0xd9 (fffff800`0920bca9)  Branch

pci!PciType0_GetResources+0x161:
fffff800`0920bd31 4180fa01        cmp     r10b,1
fffff800`0920bd35 7474            je      pci!PciType0_GetResources+0x1db (fffff800`0920bdab)  Branch

pci!PciType0_GetResources+0x167:
fffff800`0920bd37 83f805          cmp     eax,5
fffff800`0920bd3a 0f8398000000    jae     pci!PciType0_GetResources+0x208 (fffff800`0920bdd8)  Branch

pci!PciType0_GetResources+0x170:
fffff800`0920bd40 8d4801          lea     ecx,[rax+1]
fffff800`0920bd43 8b5c8c30        mov     ebx,dword ptr [rsp+rcx*4+30h]

pci!PciType0_GetResources+0x177:
fffff800`0920bd47 418b13          mov     edx,dword ptr [r11]
fffff800`0920bd4a 458851fc        mov     byte ptr [r9-4],r10b
fffff800`0920bd4e 413828          cmp     byte ptr [r8],bpl
fffff800`0920bd51 0f8452ffffff    je      pci!PciType0_GetResources+0xd9 (fffff800`0920bca9)  Branch

pci!PciType0_GetResources+0x187:
fffff800`0920bd57 410fb74803      movzx   ecx,word ptr [r8+3]
fffff800`0920bd5c 66418949fe      mov     word ptr [r9-2],cx
fffff800`0920bd61 410fb64801      movzx   ecx,byte ptr [r8+1]
fffff800`0920bd66 418849fd        mov     byte ptr [r9-3],cl
fffff800`0920bd6a 418b4807        mov     ecx,dword ptr [r8+7]
fffff800`0920bd6e 41894908        mov     dword ptr [r9+8],ecx
fffff800`0920bd72 498929          mov     qword ptr [r9],rbp
fffff800`0920bd75 4180fa01        cmp     r10b,1
fffff800`0920bd79 743b            je      pci!PciType0_GetResources+0x1e6 (fffff800`0920bdb6)  Branch

pci!PciType0_GetResources+0x1ab:
fffff800`0920bd7b 4180ea03        sub     r10b,3
fffff800`0920bd7f 41f6c2fb        test    r10b,0FBh
fffff800`0920bd83 751d            jne     pci!PciType0_GetResources+0x1d2 (fffff800`0920bda2)  Branch

pci!PciType0_GetResources+0x1b5:
fffff800`0920bd85 8bca            mov     ecx,edx
fffff800`0920bd87 80e106          and     cl,6
fffff800`0920bd8a 80f904          cmp     cl,4
fffff800`0920bd8d 742e            je      pci!PciType0_GetResources+0x1ed (fffff800`0920bdbd)  Branch

pci!PciType0_GetResources+0x1bf:
fffff800`0920bd8f b9f0ffffff      mov     ecx,0FFFFFFF0h

pci!PciType0_GetResources+0x1c4:
fffff800`0920bd94 23ca            and     ecx,edx
fffff800`0920bd96 418909          mov     dword ptr [r9],ecx
fffff800`0920bd99 493929          cmp     qword ptr [r9],rbp
fffff800`0920bd9c 0f8507ffffff    jne     pci!PciType0_GetResources+0xd9 (fffff800`0920bca9)  Branch

pci!PciType0_GetResources+0x1d2:
fffff800`0920bda2 418869fc        mov     byte ptr [r9-4],bpl
fffff800`0920bda6 e9fefeffff      jmp     pci!PciType0_GetResources+0xd9 (fffff800`0920bca9)  Branch

pci!PciType0_GetResources+0x1db:
fffff800`0920bdab 40f6c601        test    sil,1
fffff800`0920bdaf 7586            jne     pci!PciType0_GetResources+0x167 (fffff800`0920bd37)  Branch

pci!PciType0_GetResources+0x1e1:
fffff800`0920bdb1 e9f3feffff      jmp     pci!PciType0_GetResources+0xd9 (fffff800`0920bca9)  Branch

pci!PciType0_GetResources+0x1e6:
fffff800`0920bdb6 b9fcffffff      mov     ecx,0FFFFFFFCh
fffff800`0920bdbb ebd7            jmp     pci!PciType0_GetResources+0x1c4 (fffff800`0920bd94)  Branch

pci!PciType0_GetResources+0x1ed:
fffff800`0920bdbd 41895904        mov     dword ptr [r9+4],ebx
fffff800`0920bdc1 ebcc            jmp     pci!PciType0_GetResources+0x1bf (fffff800`0920bd8f)  Branch

pci!PciType0_GetResources+0x1f3:
fffff800`0920bdc3 0fb79178010000  movzx   edx,word ptr [rcx+178h]
fffff800`0920bdca 6685d2          test    dx,dx
fffff800`0920bdcd 0f8424ffffff    je      pci!PciType0_GetResources+0x127 (fffff800`0920bcf7)  Branch

pci!PciType0_GetResources+0x203:
fffff800`0920bdd3 e932980000      jmp     pci!PciType0_GetResources+0x9a3a (fffff800`0921560a)  Branch

pci!PciType0_GetResources+0x208:
fffff800`0920bdd8 8bdd            mov     ebx,ebp
fffff800`0920bdda e968ffffff      jmp     pci!PciType0_GetResources+0x177 (fffff800`0920bd47)  Branch

pci!PciType0_GetResources+0x99c0:
fffff800`09215590 488b1561f00100  mov     rdx,qword ptr [pci!PciKsrData (fffff800`092345f8)]
fffff800`09215597 488bcf          mov     rcx,rdi
fffff800`0921559a 418bc1          mov     eax,r9d
fffff800`0921559d 4c69d0e0020000  imul    r10,rax,2E0h
fffff800`092155a4 4903d2          add     rdx,r10
fffff800`092155a7 e8d8010100      call    pci!PciKsrIsSameDevice (fffff800`09225784)
fffff800`092155ac 84c0            test    al,al
fffff800`092155ae 742c            je      pci!PciType0_GetResources+0x9a0c (fffff800`092155dc)  Branch

pci!PciType0_GetResources+0x99e0:
fffff800`092155b0 488b0d41f00100  mov     rcx,qword ptr [pci!PciKsrData (fffff800`092345f8)]
fffff800`092155b7 42f644110a01    test    byte ptr [rcx+r10+0Ah],1
fffff800`092155bd 751d            jne     pci!PciType0_GetResources+0x9a0c (fffff800`092155dc)  Branch

pci!PciType0_GetResources+0x99ef:
fffff800`092155bf 833d46f0010001  cmp     dword ptr [pci!PciKsrRevision (fffff800`0923460c)],1
fffff800`092155c6 0f855966ffff    jne     pci!PciType0_GetResources+0x55 (fffff800`0920bc25)  Branch

pci!PciType0_GetResources+0x99fc:
fffff800`092155cc 420fb7441108    movzx   eax,word ptr [rcx+r10+8]
fffff800`092155d2 6689442424      mov     word ptr [rsp+24h],ax
fffff800`092155d7 e96066ffff      jmp     pci!PciType0_GetResources+0x6c (fffff800`0920bc3c)  Branch

pci!PciType0_GetResources+0x9a0c:
fffff800`092155dc 41ffc1          inc     r9d
fffff800`092155df 443b0d22f00100  cmp     r9d,dword ptr [pci!PciKsrDataCount (fffff800`09234608)]
fffff800`092155e6 72a8            jb      pci!PciType0_GetResources+0x99c0 (fffff800`09215590)  Branch

pci!PciType0_GetResources+0x9a18:
fffff800`092155e8 e93866ffff      jmp     pci!PciType0_GetResources+0x55 (fffff800`0920bc25)  Branch

pci!PciType0_GetResources+0x9a1d:
fffff800`092155ed 4d8d4678        lea     r8,[r14+78h]
fffff800`092155f1 488d97a8020000  lea     rdx,[rdi+2A8h]
fffff800`092155f8 e8f7110100      call    pci!PciResourceFromRomBar (fffff800`092267f4)
fffff800`092155fd 85c0            test    eax,eax
fffff800`092155ff 0f88f466ffff    js      pci!PciType0_GetResources+0x129 (fffff800`0920bcf9)  Branch

pci!PciType0_GetResources+0x9a35:
fffff800`09215605 e9cd66ffff      jmp     pci!PciType0_GetResources+0x107 (fffff800`0920bcd7)  Branch

pci!PciType0_GetResources+0x9a3a:
fffff800`0921560a f705eced010000800000 test dword ptr [pci!PciSystemWideHackFlags (fffff800`09234400)],8000h
fffff800`09215614 0f85dd66ffff    jne     pci!PciType0_GetResources+0x127 (fffff800`0920bcf7)  Branch

pci!PciType0_GetResources+0x9a4a:
fffff800`0921561a 488b4908        mov     rcx,qword ptr [rcx+8]
fffff800`0921561e 448d4208        lea     r8d,[rdx+8]
fffff800`09215622 488d542478      lea     rdx,[rsp+78h]
fffff800`09215627 41b902000000    mov     r9d,2
fffff800`0921562d e88e68ffff      call    pci!PciReadDeviceConfig (fffff800`0920bec0)
fffff800`09215632 0fb7442478      movzx   eax,word ptr [rsp+78h]
fffff800`09215637 a801            test    al,1
fffff800`09215639 0f84b866ffff    je      pci!PciType0_GetResources+0x127 (fffff800`0920bcf7)  Branch

pci!PciType0_GetResources+0x9a6f:
fffff800`0921563f a808            test    al,8
fffff800`09215641 0f84b066ffff    je      pci!PciType0_GetResources+0x127 (fffff800`0920bcf7)  Branch

pci!PciType0_GetResources+0x9a77:
fffff800`09215647 488b8fc8000000  mov     rcx,qword ptr [rdi+0C8h]
fffff800`0921564e 488d942494000000 lea     rdx,[rsp+94h]
fffff800`09215656 41b918000000    mov     r9d,18h
fffff800`0921565c 440fb78178010000 movzx   r8d,word ptr [rcx+178h]
fffff800`09215664 488b4908        mov     rcx,qword ptr [rcx+8]
fffff800`09215668 4183c024        add     r8d,24h
fffff800`0921566c e84f68ffff      call    pci!PciReadDeviceConfig (fffff800`0920bec0)
fffff800`09215671 448bdd          mov     r11d,ebp
fffff800`09215674 4c8d87c8020000  lea     r8,[rdi+2C8h]
fffff800`0921567b 488d9c2494000000 lea     rbx,[rsp+94h]

pci!PciType0_GetResources+0x9ab3:
fffff800`09215683 41386801        cmp     byte ptr [r8+1],bpl
fffff800`09215687 7433            je      pci!PciType0_GetResources+0x9aec (fffff800`092156bc)  Branch

pci!PciType0_GetResources+0x9ab9:
fffff800`09215689 4183fb05        cmp     r11d,5
fffff800`0921568d 730d            jae     pci!PciType0_GetResources+0x9acc (fffff800`0921569c)  Branch

pci!PciType0_GetResources+0x9abf:
fffff800`0921568f 418d4301        lea     eax,[r11+1]
fffff800`09215693 8b948494000000  mov     edx,dword ptr [rsp+rax*4+94h]
fffff800`0921569a eb02            jmp     pci!PciType0_GetResources+0x9ace (fffff800`0921569e)  Branch

pci!PciType0_GetResources+0x9acc:
fffff800`0921569c 8bd5            mov     edx,ebp

pci!PciType0_GetResources+0x9ace:
fffff800`0921569e 8b0b            mov     ecx,dword ptr [rbx]
fffff800`092156a0 418bc3          mov     eax,r11d
fffff800`092156a3 4883c007        add     rax,7
fffff800`092156a7 488d0480        lea     rax,[rax+rax*4]
fffff800`092156ab 4d8d0c86        lea     r9,[r14+rax*4]
fffff800`092156af e8a003ffff      call    pci!PciResourceFromBar (fffff800`09205a54)
fffff800`092156b4 85c0            test    eax,eax
fffff800`092156b6 0f883d66ffff    js      pci!PciType0_GetResources+0x129 (fffff800`0920bcf9)  Branch

pci!PciType0_GetResources+0x9aec:
fffff800`092156bc 41ffc3          inc     r11d
fffff800`092156bf 4983c020        add     r8,20h
fffff800`092156c3 4883c304        add     rbx,4
fffff800`092156c7 4183fb06        cmp     r11d,6
fffff800`092156cb 72b6            jb      pci!PciType0_GetResources+0x9ab3 (fffff800`09215683)  Branch

pci!PciType0_GetResources+0x9afd:
fffff800`092156cd e92566ffff      jmp     pci!PciType0_GetResources+0x127 (fffff800`0920bcf7)  Branch
