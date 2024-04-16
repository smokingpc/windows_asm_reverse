22: kd> uf RaidTranslateResourceListAddress
storport!RaidTranslateResourceListAddress:
fffff807`3295fa3c 488bc4          mov     rax,rsp
fffff807`3295fa3f 48895818        mov     qword ptr [rax+18h],rbx
fffff807`3295fa43 55              push    rbp
fffff807`3295fa44 56              push    rsi
fffff807`3295fa45 57              push    rdi
fffff807`3295fa46 4154            push    r12
fffff807`3295fa48 4155            push    r13
fffff807`3295fa4a 4156            push    r14
fffff807`3295fa4c 4157            push    r15
fffff807`3295fa4e 4883ec40        sub     rsp,40h
fffff807`3295fa52 4c8bb424b0000000 mov     r14,qword ptr [rsp+0B0h]
fffff807`3295fa5a 33ff            xor     edi,edi
fffff807`3295fa5c 83fa11          cmp     edx,11h
fffff807`3295fa5f 48897808        mov     qword ptr [rax+8],rdi
fffff807`3295fa63 488978b8        mov     qword ptr [rax-48h],rdi
fffff807`3295fa67 498bd9          mov     rbx,r9
fffff807`3295fa6a 488b01          mov     rax,qword ptr [rcx]
fffff807`3295fa6d 458be0          mov     r12d,r8d
fffff807`3295fa70 448d7f0f        lea     r15d,[rdi+0Fh]
fffff807`3295fa74 49893e          mov     qword ptr [r14],rdi
fffff807`3295fa77 440f45fa        cmovne  r15d,edx
fffff807`3295fa7b 4c8be9          mov     r13,rcx
fffff807`3295fa7e 4885c0          test    rax,rax
fffff807`3295fa81 0f8495000000    je      storport!RaidTranslateResourceListAddress+0xe0 (fffff807`3295fb1c)  Branch

storport!RaidTranslateResourceListAddress+0x4b:
fffff807`3295fa87 8b6810          mov     ebp,dword ptr [rax+10h]
fffff807`3295fa8a 8bf7            mov     esi,edi
fffff807`3295fa8c 85ed            test    ebp,ebp
fffff807`3295fa8e 0f8488000000    je      storport!RaidTranslateResourceListAddress+0xe0 (fffff807`3295fb1c)  Branch

storport!RaidTranslateResourceListAddress+0x58:
fffff807`3295fa94 488d442430      lea     rax,[rsp+30h]
fffff807`3295fa99 8bd6            mov     edx,esi
fffff807`3295fa9b 4889442428      mov     qword ptr [rsp+28h],rax
fffff807`3295faa0 4c8d8c2488000000 lea     r9,[rsp+88h]
fffff807`3295faa8 488d842480000000 lea     rax,[rsp+80h]
fffff807`3295fab0 498bcd          mov     rcx,r13
fffff807`3295fab3 4c8d8424a8000000 lea     r8,[rsp+0A8h]
fffff807`3295fabb 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`3295fac0 e857010000      call    storport!RaidGetResourceListElement (fffff807`3295fc1c)
fffff807`3295fac5 4439bc24a8000000 cmp     dword ptr [rsp+0A8h],r15d
fffff807`3295facd 751b            jne     storport!RaidTranslateResourceListAddress+0xae (fffff807`3295faea)  Branch

storport!RaidTranslateResourceListAddress+0x93:
fffff807`3295facf 4439a42488000000 cmp     dword ptr [rsp+88h],r12d
fffff807`3295fad7 7511            jne     storport!RaidTranslateResourceListAddress+0xae (fffff807`3295faea)  Branch

storport!RaidTranslateResourceListAddress+0x9d:
fffff807`3295fad9 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff807`3295fae1 488b5004        mov     rdx,qword ptr [rax+4]
fffff807`3295fae5 483bd3          cmp     rdx,rbx
fffff807`3295fae8 7608            jbe     storport!RaidTranslateResourceListAddress+0xb6 (fffff807`3295faf2)  Branch

storport!RaidTranslateResourceListAddress+0xae:
fffff807`3295faea ffc6            inc     esi
fffff807`3295faec 3bf5            cmp     esi,ebp
fffff807`3295faee 72a4            jb      storport!RaidTranslateResourceListAddress+0x58 (fffff807`3295fa94)  Branch

storport!RaidTranslateResourceListAddress+0xb4:
fffff807`3295faf0 eb2a            jmp     storport!RaidTranslateResourceListAddress+0xe0 (fffff807`3295fb1c)  Branch

storport!RaidTranslateResourceListAddress+0xb6:
fffff807`3295faf2 8b480c          mov     ecx,dword ptr [rax+0Ch]
fffff807`3295faf5 8b8424a0000000  mov     eax,dword ptr [rsp+0A0h]
fffff807`3295fafc 4803ca          add     rcx,rdx
fffff807`3295faff 4803c3          add     rax,rbx
fffff807`3295fb02 483bc8          cmp     rcx,rax
fffff807`3295fb05 72e3            jb      storport!RaidTranslateResourceListAddress+0xae (fffff807`3295faea)  Branch

storport!RaidTranslateResourceListAddress+0xcb:
fffff807`3295fb07 488b442430      mov     rax,qword ptr [rsp+30h]
fffff807`3295fb0c 40b701          mov     dil,1
fffff807`3295fb0f 488b4804        mov     rcx,qword ptr [rax+4]
fffff807`3295fb13 482bca          sub     rcx,rdx
fffff807`3295fb16 4803cb          add     rcx,rbx
fffff807`3295fb19 49890e          mov     qword ptr [r14],rcx

storport!RaidTranslateResourceListAddress+0xe0:
fffff807`3295fb1c 488b9c2490000000 mov     rbx,qword ptr [rsp+90h]
fffff807`3295fb24 40f6df          neg     dil
fffff807`3295fb27 1bc0            sbb     eax,eax
fffff807`3295fb29 f7d0            not     eax
fffff807`3295fb2b 25010000c0      and     eax,0C0000001h
fffff807`3295fb30 4883c440        add     rsp,40h
fffff807`3295fb34 415f            pop     r15
fffff807`3295fb36 415e            pop     r14
fffff807`3295fb38 415d            pop     r13
fffff807`3295fb3a 415c            pop     r12
fffff807`3295fb3c 5f              pop     rdi
fffff807`3295fb3d 5e              pop     rsi
fffff807`3295fb3e 5d              pop     rbp
fffff807`3295fb3f c3              ret
