1: kd> uf storport!StorPortCompleteRequest
storport!StorPortCompleteRequest:
fffff809`1f23e5e0 4c8bdc          mov     r11,rsp
fffff809`1f23e5e3 49895b10        mov     qword ptr [r11+10h],rbx
fffff809`1f23e5e7 49896b18        mov     qword ptr [r11+18h],rbp
fffff809`1f23e5eb 56              push    rsi
fffff809`1f23e5ec 57              push    rdi
fffff809`1f23e5ed 4156            push    r14
fffff809`1f23e5ef 4883ec40        sub     rsp,40h
fffff809`1f23e5f3 33c0            xor     eax,eax
fffff809`1f23e5f5 4533f6          xor     r14d,r14d
fffff809`1f23e5f8 49894308        mov     qword ptr [r11+8],rax
fffff809`1f23e5fc 418af9          mov     dil,r9b
fffff809`1f23e5ff 488b41f0        mov     rax,qword ptr [rcx-10h]
fffff809`1f23e603 418af0          mov     sil,r8b
fffff809`1f23e606 408aea          mov     bpl,dl
fffff809`1f23e609 488b18          mov     rbx,qword ptr [rax]
fffff809`1f23e60c 4885db          test    rbx,rbx
fffff809`1f23e60f 0f8459010000    je      storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0x35:
fffff809`1f23e615 488b05942c0200  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff809`1f2612b0)]
fffff809`1f23e61c a840            test    al,40h
fffff809`1f23e61e 7449            je      storport!StorPortCompleteRequest+0x89 (fffff809`1f23e669)  Branch

storport!StorPortCompleteRequest+0x40:
fffff809`1f23e620 488b542458      mov     rdx,qword ptr [rsp+58h]
fffff809`1f23e625 488bcb          mov     rcx,rbx
fffff809`1f23e628 410fb6c0        movzx   eax,r8b
fffff809`1f23e62c 4c8bc3          mov     r8,rbx
fffff809`1f23e62f 440fb6cd        movzx   r9d,bpl
fffff809`1f23e633 41c1e108        shl     r9d,8
fffff809`1f23e637 440bc8          or      r9d,eax
fffff809`1f23e63a 8b4338          mov     eax,dword ptr [rbx+38h]
fffff809`1f23e63d c1e018          shl     eax,18h
fffff809`1f23e640 4898            cdqe
fffff809`1f23e642 41c1e108        shl     r9d,8
fffff809`1f23e646 4c0bc8          or      r9,rax
fffff809`1f23e649 400fb6c7        movzx   eax,dil
fffff809`1f23e64d 4c0bc8          or      r9,rax
fffff809`1f23e650 498b4308        mov     rax,qword ptr [r11+8]
fffff809`1f23e654 498943d8        mov     qword ptr [r11-28h],rax
fffff809`1f23e658 4d2173d0        and     qword ptr [r11-30h],r14
fffff809`1f23e65c 498953c8        mov     qword ptr [r11-38h],rdx
fffff809`1f23e660 418d560c        lea     edx,[r14+0Ch]
fffff809`1f23e664 e88b3ffcff      call    storport!DbgLogRequest (fffff809`1f2025f4)

storport!StorPortCompleteRequest+0x89:
fffff809`1f23e669 4080fdff        cmp     bpl,0FFh
fffff809`1f23e66d 0f8498000000    je      storport!StorPortCompleteRequest+0x12b (fffff809`1f23e70b)  Branch

storport!StorPortCompleteRequest+0x93:
fffff809`1f23e673 4080feff        cmp     sil,0FFh
fffff809`1f23e677 0f848e000000    je      storport!StorPortCompleteRequest+0x12b (fffff809`1f23e70b)  Branch

storport!StorPortCompleteRequest+0x9d:
fffff809`1f23e67d 4080ffff        cmp     dil,0FFh
fffff809`1f23e681 0f8484000000    je      storport!StorPortCompleteRequest+0x12b (fffff809`1f23e70b)  Branch

storport!StorPortCompleteRequest+0xa7:
fffff809`1f23e687 40886c2460      mov     byte ptr [rsp+60h],bpl
fffff809`1f23e68c 488bcb          mov     rcx,rbx
fffff809`1f23e68f 4088742461      mov     byte ptr [rsp+61h],sil
fffff809`1f23e694 40887c2462      mov     byte ptr [rsp+62h],dil
fffff809`1f23e699 8b542460        mov     edx,dword ptr [rsp+60h]
fffff809`1f23e69d e852d7fcff      call    storport!RaidAdapterFindUnit (fffff809`1f20bdf4)
fffff809`1f23e6a2 4c8bf0          mov     r14,rax
fffff809`1f23e6a5 4885c0          test    rax,rax
fffff809`1f23e6a8 7557            jne     storport!StorPortCompleteRequest+0x121 (fffff809`1f23e701)  Branch

storport!StorPortCompleteRequest+0xca:
fffff809`1f23e6aa 488b0d4f290200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`1f261000)]
fffff809`1f23e6b1 488d0548290200  lea     rax,[storport!WPP_GLOBAL_Control (fffff809`1f261000)]
fffff809`1f23e6b8 483bc8          cmp     rcx,rax
fffff809`1f23e6bb 0f84ad000000    je      storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0xe1:
fffff809`1f23e6c1 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`1f23e6c4 a808            test    al,8
fffff809`1f23e6c6 0f84a2000000    je      storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0xec:
fffff809`1f23e6cc 80792903        cmp     byte ptr [rcx+29h],3
fffff809`1f23e6d0 0f8298000000    jb      storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0xf6:
fffff809`1f23e6d6 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`1f23e6da 418d5619        lea     edx,[r14+19h]
fffff809`1f23e6de 400fb6c7        movzx   eax,dil
fffff809`1f23e6e2 440fb6c6        movzx   r8d,sil
fffff809`1f23e6e6 89442428        mov     dword ptr [rsp+28h],eax
fffff809`1f23e6ea 4489442420      mov     dword ptr [rsp+20h],r8d
fffff809`1f23e6ef 4c8d0542740100  lea     r8,[storport!WPP_890ff0257e5a37fc61b1814295f1a13c_Traceguids (fffff809`1f255b38)]
fffff809`1f23e6f6 440fb6cd        movzx   r9d,bpl
fffff809`1f23e6fa e865d0ffff      call    storport!WPP_SF_DDD (fffff809`1f23b764)
fffff809`1f23e6ff eb6d            jmp     storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0x121:
fffff809`1f23e701 488bc8          mov     rcx,rax
fffff809`1f23e704 e89f3dfcff      call    storport!RaidPauseUnitQueue (fffff809`1f2024a8)
fffff809`1f23e709 eb08            jmp     storport!StorPortCompleteRequest+0x133 (fffff809`1f23e713)  Branch

storport!StorPortCompleteRequest+0x12b:
fffff809`1f23e70b 488bcb          mov     rcx,rbx
fffff809`1f23e70e e8859bfdff      call    storport!RaidPauseAdapterQueue (fffff809`1f218298)

storport!StorPortCompleteRequest+0x133:
fffff809`1f23e713 440fb6842480000000 movzx r8d,byte ptr [rsp+80h]
fffff809`1f23e71c 488d8bc8070000  lea     rcx,[rbx+7C8h]
fffff809`1f23e723 400fb6d5        movzx   edx,bpl
fffff809`1f23e727 c1e208          shl     edx,8
fffff809`1f23e72a 400fb6c6        movzx   eax,sil
fffff809`1f23e72e 0bd0            or      edx,eax
fffff809`1f23e730 400fb6c7        movzx   eax,dil
fffff809`1f23e734 c1e208          shl     edx,8
fffff809`1f23e737 480bd0          or      rdx,rax
fffff809`1f23e73a 48ff15ff8f0200  call    qword ptr [storport!_imp_KeInsertQueueDpc (fffff809`1f267740)]
fffff809`1f23e741 0f1f440000      nop     dword ptr [rax+rax]
fffff809`1f23e746 84c0            test    al,al
fffff809`1f23e748 7524            jne     storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0x16a:
fffff809`1f23e74a 4080fdff        cmp     bpl,0FFh
fffff809`1f23e74e 7416            je      storport!StorPortCompleteRequest+0x186 (fffff809`1f23e766)  Branch

storport!StorPortCompleteRequest+0x170:
fffff809`1f23e750 4080feff        cmp     sil,0FFh
fffff809`1f23e754 7410            je      storport!StorPortCompleteRequest+0x186 (fffff809`1f23e766)  Branch

storport!StorPortCompleteRequest+0x176:
fffff809`1f23e756 4080ffff        cmp     dil,0FFh
fffff809`1f23e75a 740a            je      storport!StorPortCompleteRequest+0x186 (fffff809`1f23e766)  Branch

storport!StorPortCompleteRequest+0x17c:
fffff809`1f23e75c 498bce          mov     rcx,r14
fffff809`1f23e75f e8e03dfcff      call    storport!RaidResumeUnitQueue (fffff809`1f202544)
fffff809`1f23e764 eb08            jmp     storport!StorPortCompleteRequest+0x18e (fffff809`1f23e76e)  Branch

storport!StorPortCompleteRequest+0x186:
fffff809`1f23e766 488bcb          mov     rcx,rbx
fffff809`1f23e769 e88e9bfdff      call    storport!RaidResumeAdapterQueue (fffff809`1f2182fc)

storport!StorPortCompleteRequest+0x18e:
fffff809`1f23e76e 488b5c2468      mov     rbx,qword ptr [rsp+68h]
fffff809`1f23e773 488b6c2470      mov     rbp,qword ptr [rsp+70h]
fffff809`1f23e778 4883c440        add     rsp,40h
fffff809`1f23e77c 415e            pop     r14
fffff809`1f23e77e 5f              pop     rdi
fffff809`1f23e77f 5e              pop     rsi
fffff809`1f23e780 c3              ret
