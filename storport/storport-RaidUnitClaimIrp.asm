16: kd> uf storport!RaidUnitClaimIrp
storport!RaidUnitClaimIrp:
fffff801`8b853e50 4053            push    rbx
fffff801`8b853e52 55              push    rbp
fffff801`8b853e53 56              push    rsi
fffff801`8b853e54 57              push    rdi
fffff801`8b853e55 4154            push    r12
fffff801`8b853e57 4155            push    r13
fffff801`8b853e59 4156            push    r14
fffff801`8b853e5b 4157            push    r15
fffff801`8b853e5d 4881eca8000000  sub     rsp,0A8h
fffff801`8b853e64 488b0525d40500  mov     rax,qword ptr [storport!_security_cookie (fffff801`8b8b1290)]
fffff801`8b853e6b 4833c4          xor     rax,rsp
fffff801`8b853e6e 4889842490000000 mov     qword ptr [rsp+90h],rax
fffff801`8b853e76 498b5910        mov     rbx,qword ptr [r9+10h]
fffff801`8b853e7a 4533e4          xor     r12d,r12d
fffff801`8b853e7d 488bc2          mov     rax,rdx               ;arg2
fffff801`8b853e80 4889542438      mov     qword ptr [rsp+38h],rdx
fffff801`8b853e85 32d2            xor     dl,dl
fffff801`8b853e87 4c894c2440      mov     qword ptr [rsp+40h],r9
fffff801`8b853e8c 4c8be9          mov     r13,rcx               ;arg1 _RAID_UNIT_EXTENSION
fffff801`8b853e8f 4c89642458      mov     qword ptr [rsp+58h],r12
fffff801`8b853e94 4488642432      mov     byte ptr [rsp+32h],r12b
fffff801`8b853e99 418bec          mov     ebp,r12d
fffff801`8b853e9c 488b80b8000000  mov     rax,qword ptr [rax+0B8h]
fffff801`8b853ea3 418bf4          mov     esi,r12d
fffff801`8b853ea6 4c89a42480000000 mov     qword ptr [rsp+80h],r12
fffff801`8b853eae 88542430        mov     byte ptr [rsp+30h],dl
fffff801`8b853eb2 88542431        mov     byte ptr [rsp+31h],dl
fffff801`8b853eb6 488b7808        mov     rdi,qword ptr [rax+8]
fffff801`8b853eba 418d442401      lea     eax,[r12+1]
fffff801`8b853ebf 4c89642460      mov     qword ptr [rsp+60h],r12
fffff801`8b853ec4 807f0228        cmp     byte ptr [rdi+2],28h      ;if(srb->Function != 0x28) goto 0x2b2
fffff801`8b853ec8 0f8534020000    jne     storport!RaidUnitClaimIrp+0x2b2 (fffff801`8b854102)  Branch

storport!RaidUnitClaimIrp+0x7e:
fffff801`8b853ece 8b4f34          mov     ecx,dword ptr [rdi+34h]       ;srb->AddressOffset
fffff801`8b853ed1 4803cf          add     rcx,rdi
fffff801`8b853ed4 48897c2458      mov     qword ptr [rsp+58h],rdi
fffff801`8b853ed9 668901          mov     word ptr [rcx],ax
fffff801`8b853edc c7410404000000  mov     dword ptr [rcx+4],4
fffff801`8b853ee3 410fb64560      movzx   eax,byte ptr [r13+60h]
fffff801`8b853ee8 884108          mov     byte ptr [rcx+8],al
fffff801`8b853eeb 410fb64561      movzx   eax,byte ptr [r13+61h]
fffff801`8b853ef0 884109          mov     byte ptr [rcx+9],al
fffff801`8b853ef3 410fb64562      movzx   eax,byte ptr [r13+62h]
fffff801`8b853ef8 88410a          mov     byte ptr [rcx+0Ah],al
fffff801`8b853efb 0fb64702        movzx   eax,byte ptr [rdi+2]
fffff801`8b853eff 4c8b7750        mov     r14,qword ptr [rdi+50h]       ;srb->OriginalRequest
fffff801`8b853f03 4c8b7f40        mov     r15,qword ptr [rdi+40h]       ;srb->DataBuffer
fffff801`8b853f07 3c28            cmp     al,28h
fffff801`8b853f09 756c            jne     storport!RaidUnitClaimIrp+0x127 (fffff801`8b853f77)  Branch

storport!RaidUnitClaimIrp+0xbb:
fffff801`8b853f0b 397714          cmp     dword ptr [rdi+14h],esi       ;if(srb->SrbFunction != SRB_FUNCTION_EXECUTE_SCSI) goto 0x127
fffff801`8b853f0e 7567            jne     storport!RaidUnitClaimIrp+0x127 (fffff801`8b853f77)  Branch

storport!RaidUnitClaimIrp+0xc0:
fffff801`8b853f10 448b5f38        mov     r11d,dword ptr [rdi+38h]      ;srb->NumSrbExData
fffff801`8b853f14 458bcc          mov     r9d,r12d
fffff801`8b853f17 4585db          test    r11d,r11d                     ;if(srb->NumSrbExData == 0) goto 0x135
fffff801`8b853f1a 7469            je      storport!RaidUnitClaimIrp+0x135 (fffff801`8b853f85)  Branch

storport!RaidUnitClaimIrp+0xcc:
fffff801`8b853f1c 0f1f4000        nop     dword ptr [rax]

storport!RaidUnitClaimIrp+0xd0:
fffff801`8b853f20 418bc1          mov     eax,r9d
fffff801`8b853f23 8b4c8778        mov     ecx,dword ptr [rdi+rax*4+78h]
fffff801`8b853f27 81f980000000    cmp     ecx,80h
fffff801`8b853f2d 7229            jb      storport!RaidUnitClaimIrp+0x108 (fffff801`8b853f58)  Branch

storport!RaidUnitClaimIrp+0xdf:
fffff801`8b853f2f 8b5710          mov     edx,dword ptr [rdi+10h]
fffff801`8b853f32 3bca            cmp     ecx,edx
fffff801`8b853f34 7722            ja      storport!RaidUnitClaimIrp+0x108 (fffff801`8b853f58)  Branch

storport!RaidUnitClaimIrp+0xe6:
fffff801`8b853f36 4c8d1439        lea     r10,[rcx+rdi]
fffff801`8b853f3a 448bc1          mov     r8d,ecx
fffff801`8b853f3d 418b0a          mov     ecx,dword ptr [r10]
fffff801`8b853f40 83e940          sub     ecx,40h
fffff801`8b853f43 740a            je      storport!RaidUnitClaimIrp+0xff (fffff801`8b853f4f)  Branch

storport!RaidUnitClaimIrp+0xf5:
fffff801`8b853f45 83e901          sub     ecx,1
fffff801`8b853f48 7418            je      storport!RaidUnitClaimIrp+0x112 (fffff801`8b853f62)  Branch

storport!RaidUnitClaimIrp+0xfa:
fffff801`8b853f4a 83f901          cmp     ecx,1
fffff801`8b853f4d 7509            jne     storport!RaidUnitClaimIrp+0x108 (fffff801`8b853f58)  Branch

storport!RaidUnitClaimIrp+0xff:
fffff801`8b853f4f 498d4828        lea     rcx,[r8+28h]

storport!RaidUnitClaimIrp+0x103:
fffff801`8b853f53 483bca          cmp     rcx,rdx
fffff801`8b853f56 7610            jbe     storport!RaidUnitClaimIrp+0x118 (fffff801`8b853f68)  Branch

storport!RaidUnitClaimIrp+0x108:
fffff801`8b853f58 41ffc1          inc     r9d
fffff801`8b853f5b 453bcb          cmp     r9d,r11d
fffff801`8b853f5e 72c0            jb      storport!RaidUnitClaimIrp+0xd0 (fffff801`8b853f20)  Branch

storport!RaidUnitClaimIrp+0x110:
fffff801`8b853f60 eb23            jmp     storport!RaidUnitClaimIrp+0x135 (fffff801`8b853f85)  Branch

storport!RaidUnitClaimIrp+0x112:
fffff801`8b853f62 498d4838        lea     rcx,[r8+38h]
fffff801`8b853f66 ebeb            jmp     storport!RaidUnitClaimIrp+0x103 (fffff801`8b853f53)  Branch

storport!RaidUnitClaimIrp+0x118:
fffff801`8b853f68 410fb64a09      movzx   ecx,byte ptr [r10+9]
fffff801`8b853f6d 884c2430        mov     byte ptr [rsp+30h],cl
fffff801`8b853f71 884c2431        mov     byte ptr [rsp+31h],cl
fffff801`8b853f75 eb0e            jmp     storport!RaidUnitClaimIrp+0x135 (fffff801`8b853f85)  Branch

storport!RaidUnitClaimIrp+0x127:
fffff801`8b853f77 32c9            xor     cl,cl
fffff801`8b853f79 884c2430        mov     byte ptr [rsp+30h],cl
fffff801`8b853f7d 884c2431        mov     byte ptr [rsp+31h],cl
fffff801`8b853f81 3c28            cmp     al,28h
fffff801`8b853f83 754c            jne     storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x135:
fffff801`8b853f85 8b4718          mov     eax,dword ptr [rdi+18h]
fffff801`8b853f88 25c0000000      and     eax,0C0h
fffff801`8b853f8d 3cc0            cmp     al,0C0h
fffff801`8b853f8f 7540            jne     storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x141:
fffff801`8b853f91 448b5f38        mov     r11d,dword ptr [rdi+38h]
fffff801`8b853f95 418bd4          mov     edx,r12d
fffff801`8b853f98 4585db          test    r11d,r11d
fffff801`8b853f9b 7434            je      storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x14d:
fffff801`8b853f9d 0f1f00          nop     dword ptr [rax]

storport!RaidUnitClaimIrp+0x150:
fffff801`8b853fa0 8bc2            mov     eax,edx
fffff801`8b853fa2 8b4c8778        mov     ecx,dword ptr [rdi+rax*4+78h]
fffff801`8b853fa6 81f980000000    cmp     ecx,80h
fffff801`8b853fac 721c            jb      storport!RaidUnitClaimIrp+0x17a (fffff801`8b853fca)  Branch

storport!RaidUnitClaimIrp+0x15e:
fffff801`8b853fae 448b4710        mov     r8d,dword ptr [rdi+10h]
fffff801`8b853fb2 413bc8          cmp     ecx,r8d
fffff801`8b853fb5 7713            ja      storport!RaidUnitClaimIrp+0x17a (fffff801`8b853fca)  Branch

storport!RaidUnitClaimIrp+0x167:
fffff801`8b853fb7 833c3901        cmp     dword ptr [rcx+rdi],1
fffff801`8b853fbb 4c8d1439        lea     r10,[rcx+rdi]
fffff801`8b853fbf 7509            jne     storport!RaidUnitClaimIrp+0x17a (fffff801`8b853fca)  Branch

storport!RaidUnitClaimIrp+0x171:
fffff801`8b853fc1 4883c118        add     rcx,18h
fffff801`8b853fc5 493bc8          cmp     rcx,r8
fffff801`8b853fc8 767f            jbe     storport!RaidUnitClaimIrp+0x1f9 (fffff801`8b854049)  Branch

storport!RaidUnitClaimIrp+0x17a:
fffff801`8b853fca ffc2            inc     edx
fffff801`8b853fcc 413bd3          cmp     edx,r11d
fffff801`8b853fcf 72cf            jb      storport!RaidUnitClaimIrp+0x150 (fffff801`8b853fa0)  Branch

storport!RaidUnitClaimIrp+0x181:
fffff801`8b853fd1 443825b8d80500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],r12b
fffff801`8b853fd8 488b442438      mov     rax,qword ptr [rsp+38h]
fffff801`8b853fdd 488983a0000000  mov     qword ptr [rbx+0A0h],rax
fffff801`8b853fe4 4889bba8000000  mov     qword ptr [rbx+0A8h],rdi
fffff801`8b853feb 4c89abe0000000  mov     qword ptr [rbx+0E0h],r13
fffff801`8b853ff2 488b4008        mov     rax,qword ptr [rax+8]
fffff801`8b853ff6 4889b388000000  mov     qword ptr [rbx+88h],rsi
fffff801`8b853ffd 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff801`8b854002 48894368        mov     qword ptr [rbx+68h],rax
fffff801`8b854006 7416            je      storport!RaidUnitClaimIrp+0x1ce (fffff801`8b85401e)  Branch

storport!RaidUnitClaimIrp+0x1b8:
fffff801`8b854008 488d93d8020000  lea     rdx,[rbx+2D8h]
fffff801`8b85400f 488bce          mov     rcx,rsi
fffff801`8b854012 48ff1537310600  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff801`8b8b7150)]
fffff801`8b854019 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitClaimIrp+0x1ce:
fffff801`8b85401e 498b4518        mov     rax,qword ptr [r13+18h]
fffff801`8b854022 f680c412000001  test    byte ptr [rax+12C4h],1
fffff801`8b854029 0f84cc010000    je      storport!RaidUnitClaimIrp+0x3ab (fffff801`8b8541fb)  Branch

storport!RaidUnitClaimIrp+0x1df:
fffff801`8b85402f 807f0228        cmp     byte ptr [rdi+2],28h
fffff801`8b854033 0f85ba010000    jne     storport!RaidUnitClaimIrp+0x3a3 (fffff801`8b8541f3)  Branch

storport!RaidUnitClaimIrp+0x1e9:
fffff801`8b854039 488b442458      mov     rax,qword ptr [rsp+58h]
fffff801`8b85403e 8b4060          mov     eax,dword ptr [rax+60h]
fffff801`8b854041 894312          mov     dword ptr [rbx+12h],eax
fffff801`8b854044 e9bf010000      jmp     storport!RaidUnitClaimIrp+0x3b8 (fffff801`8b854208)  Branch

storport!RaidUnitClaimIrp+0x1f9:
fffff801`8b854049 4d85d2          test    r10,r10
fffff801`8b85404c 7483            je      storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x1fe:
fffff801`8b85404e 4d8b4210        mov     r8,qword ptr [r10+10h]
fffff801`8b854052 4d85c0          test    r8,r8
fffff801`8b854055 0f8476ffffff    je      storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x20b:
fffff801`8b85405b 4585db          test    r11d,r11d
fffff801`8b85405e 7437            je      storport!RaidUnitClaimIrp+0x247 (fffff801`8b854097)  Branch

storport!RaidUnitClaimIrp+0x210:
fffff801`8b854060 32d2            xor     dl,dl
fffff801`8b854062 0f1f4000        nop     dword ptr [rax]
fffff801`8b854066 66660f1f840000000000 nop word ptr [rax+rax]

storport!RaidUnitClaimIrp+0x220:
fffff801`8b854070 0fb6c2          movzx   eax,dl
fffff801`8b854073 8b4c8778        mov     ecx,dword ptr [rdi+rax*4+78h]
fffff801`8b854077 81f980000000    cmp     ecx,80h
fffff801`8b85407d 720e            jb      storport!RaidUnitClaimIrp+0x23d (fffff801`8b85408d)  Branch

storport!RaidUnitClaimIrp+0x22f:
fffff801`8b85407f 3b4f10          cmp     ecx,dword ptr [rdi+10h]
fffff801`8b854082 7309            jae     storport!RaidUnitClaimIrp+0x23d (fffff801`8b85408d)  Branch

storport!RaidUnitClaimIrp+0x234:
fffff801`8b854084 813c39a0000000  cmp     dword ptr [rcx+rdi],0A0h
fffff801`8b85408b 743b            je      storport!RaidUnitClaimIrp+0x278 (fffff801`8b8540c8)  Branch

storport!RaidUnitClaimIrp+0x23d:
fffff801`8b85408d fec2            inc     dl
fffff801`8b85408f 0fb6c2          movzx   eax,dl
fffff801`8b854092 413bc3          cmp     eax,r11d
fffff801`8b854095 72d9            jb      storport!RaidUnitClaimIrp+0x220 (fffff801`8b854070)  Branch

storport!RaidUnitClaimIrp+0x247:
fffff801`8b854097 4c8b4c2438      mov     r9,qword ptr [rsp+38h]
fffff801`8b85409c 32d2            xor     dl,dl
fffff801`8b85409e 498b81b8000000  mov     rax,qword ptr [r9+0B8h]
fffff801`8b8540a5 8b4818          mov     ecx,dword ptr [rax+18h]
fffff801`8b8540a8 81f914d00400    cmp     ecx,4D014h
fffff801`8b8540ae 7408            je      storport!RaidUnitClaimIrp+0x268 (fffff801`8b8540b8)  Branch

storport!RaidUnitClaimIrp+0x260:
fffff801`8b8540b0 81f948d00400    cmp     ecx,4D048h
fffff801`8b8540b6 7502            jne     storport!RaidUnitClaimIrp+0x26a (fffff801`8b8540ba)  Branch

storport!RaidUnitClaimIrp+0x268:
fffff801`8b8540b8 b201            mov     dl,1

storport!RaidUnitClaimIrp+0x26a:
fffff801`8b8540ba 498be8          mov     rbp,r8
fffff801`8b8540bd 84d2            test    dl,dl
fffff801`8b8540bf 741e            je      storport!RaidUnitClaimIrp+0x28f (fffff801`8b8540df)  Branch

storport!RaidUnitClaimIrp+0x271:
fffff801`8b8540c1 450fb64940      movzx   r9d,byte ptr [r9+40h]
fffff801`8b8540c6 eb1a            jmp     storport!RaidUnitClaimIrp+0x292 (fffff801`8b8540e2)  Branch

storport!RaidUnitClaimIrp+0x278:
fffff801`8b8540c8 488b743908      mov     rsi,qword ptr [rcx+rdi+8]
fffff801`8b8540cd 4885f6          test    rsi,rsi
fffff801`8b8540d0 74c5            je      storport!RaidUnitClaimIrp+0x247 (fffff801`8b854097)  Branch

storport!RaidUnitClaimIrp+0x282:
fffff801`8b8540d2 498be8          mov     rbp,r8
fffff801`8b8540d5 4889742460      mov     qword ptr [rsp+60h],rsi
fffff801`8b8540da e9f2feffff      jmp     storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x28f:
fffff801`8b8540df 4532c9          xor     r9b,r9b

storport!RaidUnitClaimIrp+0x292:
fffff801`8b8540e2 418b5208        mov     edx,dword ptr [r10+8]
fffff801`8b8540e6 488d4c2460      lea     rcx,[rsp+60h]
fffff801`8b8540eb e820760400      call    storport!StorpDataInBufferAllocateMdlAndLockPages (fffff801`8b89b710)
fffff801`8b8540f0 85c0            test    eax,eax
fffff801`8b8540f2 0f88d7000000    js      storport!RaidUnitClaimIrp+0x37f (fffff801`8b8541cf)  Branch

storport!RaidUnitClaimIrp+0x2a8:
fffff801`8b8540f8 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff801`8b8540fd e9cffeffff      jmp     storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x2b2:
fffff801`8b854102 0fb64161        movzx   eax,byte ptr [rcx+61h]
fffff801`8b854106 4c8b7730        mov     r14,qword ptr [rdi+30h]
fffff801`8b85410a 4c8b7f18        mov     r15,qword ptr [rdi+18h]
fffff801`8b85410e 884706          mov     byte ptr [rdi+6],al
fffff801`8b854111 0fb64160        movzx   eax,byte ptr [rcx+60h]
fffff801`8b854115 884705          mov     byte ptr [rdi+5],al
fffff801`8b854118 0fb64162        movzx   eax,byte ptr [rcx+62h]
fffff801`8b85411c 884707          mov     byte ptr [rdi+7],al
fffff801`8b85411f 0fb6470b        movzx   eax,byte ptr [rdi+0Bh]
fffff801`8b854123 88442430        mov     byte ptr [rsp+30h],al
fffff801`8b854127 88442431        mov     byte ptr [rsp+31h],al
fffff801`8b85412b 488b4118        mov     rax,qword ptr [rcx+18h]
fffff801`8b85412f 80b8a201000001  cmp     byte ptr [rax+1A2h],1
fffff801`8b854136 0f8595feffff    jne     storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x2ec:
fffff801`8b85413c 4c8b8bf8020000  mov     r9,qword ptr [rbx+2F8h]
fffff801`8b854143 4d85c9          test    r9,r9
fffff801`8b854146 7477            je      storport!RaidUnitClaimIrp+0x36f (fffff801`8b8541bf)  Branch

storport!RaidUnitClaimIrp+0x2f8:
fffff801`8b854148 488b8020020000  mov     rax,qword ptr [rax+220h]
fffff801`8b85414f 488bd7          mov     rdx,rdi
fffff801`8b854152 8b88b8000000    mov     ecx,dword ptr [rax+0B8h]
fffff801`8b854158 c1e907          shr     ecx,7
fffff801`8b85415b 80e101          and     cl,1
fffff801`8b85415e 884c2428        mov     byte ptr [rsp+28h],cl
fffff801`8b854162 498bc9          mov     rcx,r9
fffff801`8b854165 4c89442420      mov     qword ptr [rsp+20h],r8
fffff801`8b85416a 448b83e8020000  mov     r8d,dword ptr [rbx+2E8h]
fffff801`8b854171 e87ee20100      call    storport!TranslateToExtendedSrb (fffff801`8b8723f4)
fffff801`8b854176 85c0            test    eax,eax
fffff801`8b854178 7909            jns     storport!RaidUnitClaimIrp+0x333 (fffff801`8b854183)  Branch

storport!RaidUnitClaimIrp+0x32a:
fffff801`8b85417a c6470330        mov     byte ptr [rdi+3],30h
fffff801`8b85417e 894740          mov     dword ptr [rdi+40h],eax
fffff801`8b854181 eb4c            jmp     storport!RaidUnitClaimIrp+0x37f (fffff801`8b8541cf)  Branch

storport!RaidUnitClaimIrp+0x333:
fffff801`8b854183 4c8b8bf8020000  mov     r9,qword ptr [rbx+2F8h]
fffff801`8b85418a 804b1040        or      byte ptr [rbx+10h],40h
fffff801`8b85418e 488b442438      mov     rax,qword ptr [rsp+38h]
fffff801`8b854193 4889bbf0020000  mov     qword ptr [rbx+2F0h],rdi
fffff801`8b85419a 4889bc2480000000 mov     qword ptr [rsp+80h],rdi
fffff801`8b8541a2 498bf9          mov     rdi,r9
fffff801`8b8541a5 4c894c2458      mov     qword ptr [rsp+58h],r9
fffff801`8b8541aa 488b80b8000000  mov     rax,qword ptr [rax+0B8h]
fffff801`8b8541b1 c644243201      mov     byte ptr [rsp+32h],1
fffff801`8b8541b6 4c894808        mov     qword ptr [rax+8],r9
fffff801`8b8541ba e912feffff      jmp     storport!RaidUnitClaimIrp+0x181 (fffff801`8b853fd1)  Branch

storport!RaidUnitClaimIrp+0x36f:
fffff801`8b8541bf c6470330        mov     byte ptr [rdi+3],30h
fffff801`8b8541c3 c747409a0000c0  mov     dword ptr [rdi+40h],0C000009Ah

storport!RaidUnitClaimIrp+0x37a:
fffff801`8b8541ca b89a0000c0      mov     eax,0C000009Ah

storport!RaidUnitClaimIrp+0x37f:
fffff801`8b8541cf 488b8c2490000000 mov     rcx,qword ptr [rsp+90h]
fffff801`8b8541d7 4833cc          xor     rcx,rsp
fffff801`8b8541da e8711e0200      call    storport!_security_check_cookie (fffff801`8b876050)
fffff801`8b8541df 4881c4a8000000  add     rsp,0A8h
fffff801`8b8541e6 415f            pop     r15
fffff801`8b8541e8 415e            pop     r14
fffff801`8b8541ea 415d            pop     r13
fffff801`8b8541ec 415c            pop     r12
fffff801`8b8541ee 5f              pop     rdi
fffff801`8b8541ef 5e              pop     rsi
fffff801`8b8541f0 5d              pop     rbp
fffff801`8b8541f1 5b              pop     rbx
fffff801`8b8541f2 c3              ret

storport!RaidUnitClaimIrp+0x3a3:
fffff801`8b8541f3 8b4738          mov     eax,dword ptr [rdi+38h]
fffff801`8b8541f6 894312          mov     dword ptr [rbx+12h],eax
fffff801`8b8541f9 eb0d            jmp     storport!RaidUnitClaimIrp+0x3b8 (fffff801`8b854208)  Branch

storport!RaidUnitClaimIrp+0x3ab:
fffff801`8b8541fb b8ffff0000      mov     eax,0FFFFh
fffff801`8b854200 c64314ff        mov     byte ptr [rbx+14h],0FFh
fffff801`8b854204 66894312        mov     word ptr [rbx+12h],ax

storport!RaidUnitClaimIrp+0x3b8:
fffff801`8b854208 0fb64310        movzx   eax,byte ptr [rbx+10h]
fffff801`8b85420c 24e7            and     al,0E7h
fffff801`8b85420e 4c89bbb8000000  mov     qword ptr [rbx+0B8h],r15
fffff801`8b854215 4c8b7c2440      mov     r15,qword ptr [rsp+40h]
fffff801`8b85421a 0c04            or      al,4
fffff801`8b85421c 884310          mov     byte ptr [rbx+10h],al
fffff801`8b85421f 44896318        mov     dword ptr [rbx+18h],r12d
fffff801`8b854223 4c89b3b0000000  mov     qword ptr [rbx+0B0h],r14
fffff801`8b85422a 4889abc0000000  mov     qword ptr [rbx+0C0h],rbp
fffff801`8b854231 0fb65702        movzx   edx,byte ptr [rdi+2]
fffff801`8b854235 80fa28          cmp     dl,28h
fffff801`8b854238 7515            jne     storport!RaidUnitClaimIrp+0x3ff (fffff801`8b85424f)  Branch

storport!RaidUnitClaimIrp+0x3ea:
fffff801`8b85423a 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff801`8b85423f 48895960        mov     qword ptr [rcx+60h],rbx
fffff801`8b854243 418b07          mov     eax,dword ptr [r15]
fffff801`8b854246 894120          mov     dword ptr [rcx+20h],eax
fffff801`8b854249 0fb65702        movzx   edx,byte ptr [rdi+2]
fffff801`8b85424d eb0b            jmp     storport!RaidUnitClaimIrp+0x40a (fffff801`8b85425a)  Branch

storport!RaidUnitClaimIrp+0x3ff:
fffff801`8b85424f 48895f30        mov     qword ptr [rdi+30h],rbx
fffff801`8b854253 410fb607        movzx   eax,byte ptr [r15]
fffff801`8b854257 884708          mov     byte ptr [rdi+8],al

storport!RaidUnitClaimIrp+0x40a:
fffff801`8b85425a 498b4518        mov     rax,qword ptr [r13+18h]
fffff801`8b85425e 4d8b4708        mov     r8,qword ptr [r15+8]
fffff801`8b854262 8b88cc010000    mov     ecx,dword ptr [rax+1CCh]
fffff801`8b854268 83c107          add     ecx,7
fffff801`8b85426b 83e1f8          and     ecx,0FFFFFFF8h
fffff801`8b85426e 80fa28          cmp     dl,28h
fffff801`8b854271 750a            jne     storport!RaidUnitClaimIrp+0x42d (fffff801`8b85427d)  Branch

storport!RaidUnitClaimIrp+0x423:
fffff801`8b854273 85c9            test    ecx,ecx
fffff801`8b854275 740e            je      storport!RaidUnitClaimIrp+0x435 (fffff801`8b854285)  Branch

storport!RaidUnitClaimIrp+0x427:
fffff801`8b854277 4c894768        mov     qword ptr [rdi+68h],r8
fffff801`8b85427b eb08            jmp     storport!RaidUnitClaimIrp+0x435 (fffff801`8b854285)  Branch

storport!RaidUnitClaimIrp+0x42d:
fffff801`8b85427d 85c9            test    ecx,ecx
fffff801`8b85427f 7404            je      storport!RaidUnitClaimIrp+0x435 (fffff801`8b854285)  Branch

storport!RaidUnitClaimIrp+0x431:
fffff801`8b854281 4c894738        mov     qword ptr [rdi+38h],r8

storport!RaidUnitClaimIrp+0x435:
fffff801`8b854285 498b4d18        mov     rcx,qword ptr [r13+18h]
fffff801`8b854289 4532f6          xor     r14b,r14b
fffff801`8b85428c 48894c2448      mov     qword ptr [rsp+48h],rcx
fffff801`8b854291 4c396608        cmp     qword ptr [rsi+8],r12
fffff801`8b854295 0f8475030000    je      storport!RaidUnitClaimIrp+0x7c0 (fffff801`8b854610)  Branch

storport!RaidUnitClaimIrp+0x44b:
fffff801`8b85429b 488b86b8000000  mov     rax,qword ptr [rsi+0B8h]
fffff801`8b8542a2 488b7008        mov     rsi,qword ptr [rax+8]
fffff801`8b8542a6 0fb64602        movzx   eax,byte ptr [rsi+2]
fffff801`8b8542aa 3c28            cmp     al,28h
fffff801`8b8542ac 0f859f010000    jne     storport!RaidUnitClaimIrp+0x601 (fffff801`8b854451)  Branch

storport!RaidUnitClaimIrp+0x462:
fffff801`8b8542b2 488b5660        mov     rdx,qword ptr [rsi+60h]
fffff801`8b8542b6 8b6e14          mov     ebp,dword ptr [rsi+14h]
fffff801`8b8542b9 448b7e18        mov     r15d,dword ptr [rsi+18h]
fffff801`8b8542bd 4c8b6640        mov     r12,qword ptr [rsi+40h]
fffff801`8b8542c1 4889542450      mov     qword ptr [rsp+50h],rdx
fffff801`8b8542c6 85ed            test    ebp,ebp
fffff801`8b8542c8 0f858c000000    jne     storport!RaidUnitClaimIrp+0x50a (fffff801`8b85435a)  Branch

storport!RaidUnitClaimIrp+0x47e:
fffff801`8b8542ce 448b5e38        mov     r11d,dword ptr [rsi+38h]
fffff801`8b8542d2 4533d2          xor     r10d,r10d
fffff801`8b8542d5 4585db          test    r11d,r11d
fffff801`8b8542d8 0f847c000000    je      storport!RaidUnitClaimIrp+0x50a (fffff801`8b85435a)  Branch

storport!RaidUnitClaimIrp+0x48e:
fffff801`8b8542de 6690            xchg    ax,ax

storport!RaidUnitClaimIrp+0x490:
fffff801`8b8542e0 428b4c9678      mov     ecx,dword ptr [rsi+r10*4+78h]
fffff801`8b8542e5 418bc2          mov     eax,r10d
fffff801`8b8542e8 81f980000000    cmp     ecx,80h
fffff801`8b8542ee 7258            jb      storport!RaidUnitClaimIrp+0x4f8 (fffff801`8b854348)  Branch

storport!RaidUnitClaimIrp+0x4a0:
fffff801`8b8542f0 8b5610          mov     edx,dword ptr [rsi+10h]
fffff801`8b8542f3 3bca            cmp     ecx,edx
fffff801`8b8542f5 7751            ja      storport!RaidUnitClaimIrp+0x4f8 (fffff801`8b854348)  Branch

storport!RaidUnitClaimIrp+0x4a7:
fffff801`8b8542f7 4c8d0c31        lea     r9,[rcx+rsi]
fffff801`8b8542fb 448bc1          mov     r8d,ecx
fffff801`8b8542fe 418b09          mov     ecx,dword ptr [r9]
fffff801`8b854301 83e940          sub     ecx,40h
fffff801`8b854304 7432            je      storport!RaidUnitClaimIrp+0x4e8 (fffff801`8b854338)  Branch

storport!RaidUnitClaimIrp+0x4b6:
fffff801`8b854306 83e901          sub     ecx,1
fffff801`8b854309 7427            je      storport!RaidUnitClaimIrp+0x4e2 (fffff801`8b854332)  Branch

storport!RaidUnitClaimIrp+0x4bb:
fffff801`8b85430b 83f901          cmp     ecx,1
fffff801`8b85430e 7538            jne     storport!RaidUnitClaimIrp+0x4f8 (fffff801`8b854348)  Branch

storport!RaidUnitClaimIrp+0x4c0:
fffff801`8b854310 498d4828        lea     rcx,[r8+28h]
fffff801`8b854314 8bc2            mov     eax,edx
fffff801`8b854316 483bca          cmp     rcx,rdx
fffff801`8b854319 772d            ja      storport!RaidUnitClaimIrp+0x4f8 (fffff801`8b854348)  Branch

storport!RaidUnitClaimIrp+0x4cb:
fffff801`8b85431b 4183790c00      cmp     dword ptr [r9+0Ch],0
fffff801`8b854320 498d4920        lea     rcx,[r9+20h]
fffff801`8b854324 b800000000      mov     eax,0
fffff801`8b854329 480f44c8        cmove   rcx,rax
fffff801`8b85432d e908010000      jmp     storport!RaidUnitClaimIrp+0x5ea (fffff801`8b85443a)  Branch

storport!RaidUnitClaimIrp+0x4e2:
fffff801`8b854332 498d4838        lea     rcx,[r8+38h]
fffff801`8b854336 eb04            jmp     storport!RaidUnitClaimIrp+0x4ec (fffff801`8b85433c)  Branch

storport!RaidUnitClaimIrp+0x4e8:
fffff801`8b854338 498d4828        lea     rcx,[r8+28h]

storport!RaidUnitClaimIrp+0x4ec:
fffff801`8b85433c 488bc2          mov     rax,rdx
fffff801`8b85433f 483bca          cmp     rcx,rdx
fffff801`8b854342 0f86e3000000    jbe     storport!RaidUnitClaimIrp+0x5db (fffff801`8b85442b)  Branch

storport!RaidUnitClaimIrp+0x4f8:
fffff801`8b854348 41ffc2          inc     r10d
fffff801`8b85434b 453bd3          cmp     r10d,r11d
fffff801`8b85434e 7290            jb      storport!RaidUnitClaimIrp+0x490 (fffff801`8b8542e0)  Branch

storport!RaidUnitClaimIrp+0x500:
fffff801`8b854350 488b542450      mov     rdx,qword ptr [rsp+50h]

storport!RaidUnitClaimIrp+0x505:
fffff801`8b854355 488b4c2448      mov     rcx,qword ptr [rsp+48h]

storport!RaidUnitClaimIrp+0x50a:
fffff801`8b85435a 41f6c7c0        test    r15b,0C0h
fffff801`8b85435e 0f849f020000    je      storport!RaidUnitClaimIrp+0x7b3 (fffff801`8b854603)  Branch

storport!RaidUnitClaimIrp+0x514:
fffff801`8b854364 4d85e4          test    r12,r12
fffff801`8b854367 750a            jne     storport!RaidUnitClaimIrp+0x523 (fffff801`8b854373)  Branch

storport!RaidUnitClaimIrp+0x519:
fffff801`8b854369 4c396268        cmp     qword ptr [rdx+68h],r12
fffff801`8b85436d 0f8490020000    je      storport!RaidUnitClaimIrp+0x7b3 (fffff801`8b854603)  Branch

storport!RaidUnitClaimIrp+0x523:
fffff801`8b854373 83fd17          cmp     ebp,17h
fffff801`8b854376 770e            ja      storport!RaidUnitClaimIrp+0x536 (fffff801`8b854386)  Branch

storport!RaidUnitClaimIrp+0x528:
fffff801`8b854378 b804028000      mov     eax,800204h
fffff801`8b85437d 0fa3e8          bt      eax,ebp
fffff801`8b854380 0f821d010000    jb      storport!RaidUnitClaimIrp+0x653 (fffff801`8b8544a3)  Branch

storport!RaidUnitClaimIrp+0x536:
fffff801`8b854386 0fb68199010000  movzx   eax,byte ptr [rcx+199h]
fffff801`8b85438d 3c03            cmp     al,3
fffff801`8b85438f 0f840e010000    je      storport!RaidUnitClaimIrp+0x653 (fffff801`8b8544a3)  Branch

storport!RaidUnitClaimIrp+0x545:
fffff801`8b854395 fec8            dec     al
fffff801`8b854397 3c01            cmp     al,1
fffff801`8b854399 7716            ja      storport!RaidUnitClaimIrp+0x561 (fffff801`8b8543b1)  Branch

storport!RaidUnitClaimIrp+0x54b:
fffff801`8b85439b 85ed            test    ebp,ebp
fffff801`8b85439d 0f8500010000    jne     storport!RaidUnitClaimIrp+0x653 (fffff801`8b8544a3)  Branch

storport!RaidUnitClaimIrp+0x553:
fffff801`8b8543a3 4180ee08        sub     r14b,8
fffff801`8b8543a7 41f6c65d        test    r14b,5Dh
fffff801`8b8543ab 0f85f2000000    jne     storport!RaidUnitClaimIrp+0x653 (fffff801`8b8544a3)  Branch

storport!RaidUnitClaimIrp+0x561:
fffff801`8b8543b1 4533e4          xor     r12d,r12d
fffff801`8b8543b4 4438a1a2110000  cmp     byte ptr [rcx+11A2h],r12b
fffff801`8b8543bb 0f8445020000    je      storport!RaidUnitClaimIrp+0x7b6 (fffff801`8b854606)  Branch

storport!RaidUnitClaimIrp+0x571:
fffff801`8b8543c1 807e0228        cmp     byte ptr [rsi+2],28h
fffff801`8b8543c5 0f85cf000000    jne     storport!RaidUnitClaimIrp+0x64a (fffff801`8b85449a)  Branch

storport!RaidUnitClaimIrp+0x57b:
fffff801`8b8543cb 8b4618          mov     eax,dword ptr [rsi+18h]
fffff801`8b8543ce 418bfc          mov     edi,r12d
fffff801`8b8543d1 25c0000000      and     eax,0C0h
fffff801`8b8543d6 3cc0            cmp     al,0C0h
fffff801`8b8543d8 0f859c000000    jne     storport!RaidUnitClaimIrp+0x62a (fffff801`8b85447a)  Branch

storport!RaidUnitClaimIrp+0x58e:
fffff801`8b8543de 448b5e38        mov     r11d,dword ptr [rsi+38h]
fffff801`8b8543e2 418bd4          mov     edx,r12d
fffff801`8b8543e5 4585db          test    r11d,r11d
fffff801`8b8543e8 0f848c000000    je      storport!RaidUnitClaimIrp+0x62a (fffff801`8b85447a)  Branch

storport!RaidUnitClaimIrp+0x59e:
fffff801`8b8543ee 6690            xchg    ax,ax

storport!RaidUnitClaimIrp+0x5a0:
fffff801`8b8543f0 8bc2            mov     eax,edx
fffff801`8b8543f2 8b4c8678        mov     ecx,dword ptr [rsi+rax*4+78h]
fffff801`8b8543f6 81f980000000    cmp     ecx,80h
fffff801`8b8543fc 7224            jb      storport!RaidUnitClaimIrp+0x5d2 (fffff801`8b854422)  Branch

storport!RaidUnitClaimIrp+0x5ae:
fffff801`8b8543fe 448b4e10        mov     r9d,dword ptr [rsi+10h]
fffff801`8b854402 413bc9          cmp     ecx,r9d
fffff801`8b854405 771b            ja      storport!RaidUnitClaimIrp+0x5d2 (fffff801`8b854422)  Branch

storport!RaidUnitClaimIrp+0x5b7:
fffff801`8b854407 4c8d040e        lea     r8,[rsi+rcx]
fffff801`8b85440b 448bd1          mov     r10d,ecx
fffff801`8b85440e 418b08          mov     ecx,dword ptr [r8]
fffff801`8b854411 83e901          sub     ecx,1
fffff801`8b854414 750c            jne     storport!RaidUnitClaimIrp+0x5d2 (fffff801`8b854422)  Branch

storport!RaidUnitClaimIrp+0x5c6:
fffff801`8b854416 498d4a18        lea     rcx,[r10+18h]
fffff801`8b85441a 418bc1          mov     eax,r9d
fffff801`8b85441d 493bc9          cmp     rcx,r9
fffff801`8b854420 7655            jbe     storport!RaidUnitClaimIrp+0x627 (fffff801`8b854477)  Branch

storport!RaidUnitClaimIrp+0x5d2:
fffff801`8b854422 ffc2            inc     edx
fffff801`8b854424 413bd3          cmp     edx,r11d
fffff801`8b854427 72c7            jb      storport!RaidUnitClaimIrp+0x5a0 (fffff801`8b8543f0)  Branch

storport!RaidUnitClaimIrp+0x5d9:
fffff801`8b854429 eb4f            jmp     storport!RaidUnitClaimIrp+0x62a (fffff801`8b85447a)  Branch

storport!RaidUnitClaimIrp+0x5db:
fffff801`8b85442b 4180790a00      cmp     byte ptr [r9+0Ah],0
fffff801`8b854430 0f861affffff    jbe     storport!RaidUnitClaimIrp+0x500 (fffff801`8b854350)  Branch

storport!RaidUnitClaimIrp+0x5e6:
fffff801`8b854436 498d4918        lea     rcx,[r9+18h]

storport!RaidUnitClaimIrp+0x5ea:
fffff801`8b85443a 488b542450      mov     rdx,qword ptr [rsp+50h]
fffff801`8b85443f 4885c9          test    rcx,rcx
fffff801`8b854442 0f840dffffff    je      storport!RaidUnitClaimIrp+0x505 (fffff801`8b854355)  Branch

storport!RaidUnitClaimIrp+0x5f8:
fffff801`8b854448 440fb631        movzx   r14d,byte ptr [rcx]
fffff801`8b85444c e904ffffff      jmp     storport!RaidUnitClaimIrp+0x505 (fffff801`8b854355)  Branch

storport!RaidUnitClaimIrp+0x601:
fffff801`8b854451 488b5630        mov     rdx,qword ptr [rsi+30h]
fffff801`8b854455 448b7e0c        mov     r15d,dword ptr [rsi+0Ch]
fffff801`8b854459 4c8b6618        mov     r12,qword ptr [rsi+18h]
fffff801`8b85445d 4889542450      mov     qword ptr [rsp+50h],rdx
fffff801`8b854462 0fb6e8          movzx   ebp,al
fffff801`8b854465 84c0            test    al,al
fffff801`8b854467 0f85edfeffff    jne     storport!RaidUnitClaimIrp+0x50a (fffff801`8b85435a)  Branch

storport!RaidUnitClaimIrp+0x61d:
fffff801`8b85446d 440fb67648      movzx   r14d,byte ptr [rsi+48h]
fffff801`8b854472 e9e3feffff      jmp     storport!RaidUnitClaimIrp+0x50a (fffff801`8b85435a)  Branch

storport!RaidUnitClaimIrp+0x627:
fffff801`8b854477 498bf8          mov     rdi,r8

storport!RaidUnitClaimIrp+0x62a:
fffff801`8b85447a 4c8b7c2440      mov     r15,qword ptr [rsp+40h]
fffff801`8b85447f 4c896640        mov     qword ptr [rsi+40h],r12
fffff801`8b854483 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff801`8b854488 4885ff          test    rdi,rdi
fffff801`8b85448b 0f847f010000    je      storport!RaidUnitClaimIrp+0x7c0 (fffff801`8b854610)  Branch

storport!RaidUnitClaimIrp+0x641:
fffff801`8b854491 4c896710        mov     qword ptr [rdi+10h],r12
fffff801`8b854495 e976010000      jmp     storport!RaidUnitClaimIrp+0x7c0 (fffff801`8b854610)  Branch

storport!RaidUnitClaimIrp+0x64a:
fffff801`8b85449a 4c896618        mov     qword ptr [rsi+18h],r12
fffff801`8b85449e e963010000      jmp     storport!RaidUnitClaimIrp+0x7b6 (fffff801`8b854606)  Branch

storport!RaidUnitClaimIrp+0x653:
fffff801`8b8544a3 488b442438      mov     rax,qword ptr [rsp+38h]
fffff801`8b8544a8 b910000000      mov     ecx,10h
fffff801`8b8544ad 488b6a68        mov     rbp,qword ptr [rdx+68h]
fffff801`8b8544b1 41bf20000000    mov     r15d,20h
fffff801`8b8544b7 4c8bb2b8000000  mov     r14,qword ptr [rdx+0B8h]
fffff801`8b8544be 80784000        cmp     byte ptr [rax+40h],0
fffff801`8b8544c2 440f45f9        cmovne  r15d,ecx
fffff801`8b8544c6 4533e4          xor     r12d,r12d
fffff801`8b8544c9 f6450a05        test    byte ptr [rbp+0Ah],5
fffff801`8b8544cd 7406            je      storport!RaidUnitClaimIrp+0x685 (fffff801`8b8544d5)  Branch

storport!RaidUnitClaimIrp+0x67f:
fffff801`8b8544cf 488b4518        mov     rax,qword ptr [rbp+18h]
fffff801`8b8544d3 eb2d            jmp     storport!RaidUnitClaimIrp+0x6b2 (fffff801`8b854502)  Branch

storport!RaidUnitClaimIrp+0x685:
fffff801`8b8544d5 4533c9          xor     r9d,r9d
fffff801`8b8544d8 418bc7          mov     eax,r15d
fffff801`8b8544db 0fbae81e        bts     eax,1Eh
fffff801`8b8544df 33d2            xor     edx,edx
fffff801`8b8544e1 89442428        mov     dword ptr [rsp+28h],eax
fffff801`8b8544e5 488bcd          mov     rcx,rbp
fffff801`8b8544e8 4489642420      mov     dword ptr [rsp+20h],r12d
fffff801`8b8544ed 458d4101        lea     r8d,[r9+1]
fffff801`8b8544f1 48ff15602d0600  call    qword ptr [storport!_imp_MmMapLockedPagesSpecifyCache (fffff801`8b8b7258)]
fffff801`8b8544f8 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8544fd 488b542450      mov     rdx,qword ptr [rsp+50h]

storport!RaidUnitClaimIrp+0x6b2:
fffff801`8b854502 4885c0          test    rax,rax
fffff801`8b854505 7473            je      storport!RaidUnitClaimIrp+0x72a (fffff801`8b85457a)  Branch

storport!RaidUnitClaimIrp+0x6b7:
fffff801`8b854507 4d85f6          test    r14,r14
fffff801`8b85450a 740c            je      storport!RaidUnitClaimIrp+0x6c8 (fffff801`8b854518)  Branch

storport!RaidUnitClaimIrp+0x6bc:
fffff801`8b85450c 8b4d2c          mov     ecx,dword ptr [rbp+2Ch]
fffff801`8b85450f 4c2bf1          sub     r14,rcx
fffff801`8b854512 4c2b7520        sub     r14,qword ptr [rbp+20h]
fffff801`8b854516 eb03            jmp     storport!RaidUnitClaimIrp+0x6cb (fffff801`8b85451b)  Branch

storport!RaidUnitClaimIrp+0x6c8:
fffff801`8b854518 4d8bf4          mov     r14,r12

storport!RaidUnitClaimIrp+0x6cb:
fffff801`8b85451b 4903c6          add     rax,r14
fffff801`8b85451e 807e0228        cmp     byte ptr [rsi+2],28h
fffff801`8b854522 4889442448      mov     qword ptr [rsp+48h],rax
fffff801`8b854527 7506            jne     storport!RaidUnitClaimIrp+0x6df (fffff801`8b85452f)  Branch

storport!RaidUnitClaimIrp+0x6d9:
fffff801`8b854529 48894640        mov     qword ptr [rsi+40h],rax
fffff801`8b85452d eb04            jmp     storport!RaidUnitClaimIrp+0x6e3 (fffff801`8b854533)  Branch

storport!RaidUnitClaimIrp+0x6df:
fffff801`8b85452f 48894618        mov     qword ptr [rsi+18h],rax

storport!RaidUnitClaimIrp+0x6e3:
fffff801`8b854533 488b8a88000000  mov     rcx,qword ptr [rdx+88h]
fffff801`8b85453a 4885c9          test    rcx,rcx
fffff801`8b85453d 0f84c3000000    je      storport!RaidUnitClaimIrp+0x7b6 (fffff801`8b854606)  Branch

storport!RaidUnitClaimIrp+0x6f3:
fffff801`8b854543 488b92c0000000  mov     rdx,qword ptr [rdx+0C0h]
fffff801`8b85454a 4c8d4c2448      lea     r9,[rsp+48h]
fffff801`8b85454f 458bc7          mov     r8d,r15d
fffff801`8b854552 e8ad190400      call    storport!RaidGetSystemAddressForMdl (fffff801`8b895f04)
fffff801`8b854557 8be8            mov     ebp,eax
fffff801`8b854559 85c0            test    eax,eax
fffff801`8b85455b 7811            js      storport!RaidUnitClaimIrp+0x71e (fffff801`8b85456e)  Branch

storport!RaidUnitClaimIrp+0x70d:
fffff801`8b85455d 488bce          mov     rcx,rsi
fffff801`8b854560 e843060400      call    storport!RaidSrbExGetBidirectionalData (fffff801`8b894ba8)
fffff801`8b854565 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff801`8b85456a 48894810        mov     qword ptr [rax+10h],rcx

storport!RaidUnitClaimIrp+0x71e:
fffff801`8b85456e 81fd9a0000c0    cmp     ebp,0C000009Ah
fffff801`8b854574 0f858c000000    jne     storport!RaidUnitClaimIrp+0x7b6 (fffff801`8b854606)  Branch

storport!RaidUnitClaimIrp+0x72a:
fffff801`8b85457a 807f0228        cmp     byte ptr [rdi+2],28h
fffff801`8b85457e 7515            jne     storport!RaidUnitClaimIrp+0x745 (fffff801`8b854595)  Branch

storport!RaidUnitClaimIrp+0x730:
fffff801`8b854580 807c243200      cmp     byte ptr [rsp+32h],0
fffff801`8b854585 7515            jne     storport!RaidUnitClaimIrp+0x74c (fffff801`8b85459c)  Branch

storport!RaidUnitClaimIrp+0x737:
fffff801`8b854587 488b442458      mov     rax,qword ptr [rsp+58h]
fffff801`8b85458c c7402c9a0000c0  mov     dword ptr [rax+2Ch],0C000009Ah
fffff801`8b854593 eb33            jmp     storport!RaidUnitClaimIrp+0x778 (fffff801`8b8545c8)  Branch

storport!RaidUnitClaimIrp+0x745:
fffff801`8b854595 807c243200      cmp     byte ptr [rsp+32h],0
fffff801`8b85459a 741a            je      storport!RaidUnitClaimIrp+0x766 (fffff801`8b8545b6)  Branch

storport!RaidUnitClaimIrp+0x74c:
fffff801`8b85459c 488b442438      mov     rax,qword ptr [rsp+38h]
fffff801`8b8545a1 488bbc2480000000 mov     rdi,qword ptr [rsp+80h]
fffff801`8b8545a9 488b80b8000000  mov     rax,qword ptr [rax+0B8h]
fffff801`8b8545b0 48897808        mov     qword ptr [rax+8],rdi
fffff801`8b8545b4 eb0b            jmp     storport!RaidUnitClaimIrp+0x771 (fffff801`8b8545c1)  Branch

storport!RaidUnitClaimIrp+0x766:
fffff801`8b8545b6 488b83b0000000  mov     rax,qword ptr [rbx+0B0h]
fffff801`8b8545bd 48894730        mov     qword ptr [rdi+30h],rax

storport!RaidUnitClaimIrp+0x771:
fffff801`8b8545c1 c747409a0000c0  mov     dword ptr [rdi+40h],0C000009Ah

storport!RaidUnitClaimIrp+0x778:
fffff801`8b8545c8 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff801`8b8545cf 4885c9          test    rcx,rcx
fffff801`8b8545d2 0f84f2fbffff    je      storport!RaidUnitClaimIrp+0x37a (fffff801`8b8541ca)  Branch

storport!RaidUnitClaimIrp+0x788:
fffff801`8b8545d8 48ff15f92f0600  call    qword ptr [storport!_imp_MmUnlockPages (fffff801`8b8b75d8)]
fffff801`8b8545df 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8545e4 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff801`8b8545eb 48ff150e2d0600  call    qword ptr [storport!_imp_IoFreeMdl (fffff801`8b8b7300)]
fffff801`8b8545f2 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8545f7 4c89a388000000  mov     qword ptr [rbx+88h],r12
fffff801`8b8545fe e9c7fbffff      jmp     storport!RaidUnitClaimIrp+0x37a (fffff801`8b8541ca)  Branch
;=========================Error Handling and return END =========================
storport!RaidUnitClaimIrp+0x7b3:
fffff801`8b854603 4533e4          xor     r12d,r12d

storport!RaidUnitClaimIrp+0x7b6:
fffff801`8b854606 4c8b7c2440      mov     r15,qword ptr [rsp+40h]
fffff801`8b85460b 488b742438      mov     rsi,qword ptr [rsp+38h]

storport!RaidUnitClaimIrp+0x7c0:
fffff801`8b854610 0fb64c2430      movzx   ecx,byte ptr [rsp+30h]
fffff801`8b854615 410fb685c4060000 movzx   eax,byte ptr [r13+6C4h]
fffff801`8b85461d 440fb6d9        movzx   r11d,cl
fffff801`8b854621 3ac8            cmp     cl,al
fffff801`8b854623 7704            ja      storport!RaidUnitClaimIrp+0x7d9 (fffff801`8b854629)  Branch

storport!RaidUnitClaimIrp+0x7d5:
fffff801`8b854625 440fb6d8        movzx   r11d,al

storport!RaidUnitClaimIrp+0x7d9:
fffff801`8b854629 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]  ;set rdx = XRB->Srb
fffff801`8b854630 498b7f18        mov     rdi,qword ptr [r15+18h]
fffff801`8b854634 807a0228        cmp     byte ptr [rdx+2],28h      ;check if (Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x8a9
fffff801`8b854638 0f85bb000000    jne     storport!RaidUnitClaimIrp+0x8a9 (fffff801`8b8546f9)  Branch

storport!RaidUnitClaimIrp+0x7ee:
fffff801`8b85463e 837a1400        cmp     dword ptr [rdx+14h],0     ;if(Srb->SrbFunction != SRB_FUNCTION_EXECUTE_SCSI) goto 0x8ca
fffff801`8b854642 0f85d2000000    jne     storport!RaidUnitClaimIrp+0x8ca (fffff801`8b85471a)  Branch

storport!RaidUnitClaimIrp+0x7f8:
fffff801`8b854648 837a3800        cmp     dword ptr [rdx+38h],0     ;if(Srb->NumSrbExData <= 0) goto 0x8ca
fffff801`8b85464c 458bd4          mov     r10d,r12d
fffff801`8b85464f 0f86c5000000    jbe     storport!RaidUnitClaimIrp+0x8ca (fffff801`8b85471a)  Branch

storport!RaidUnitClaimIrp+0x805:
fffff801`8b854655 6666660f1f840000000000 nop word ptr [rax+rax]

storport!RaidUnitClaimIrp+0x810:
fffff801`8b854660 418bc2          mov     eax,r10d
fffff801`8b854663 8b4c8278        mov     ecx,dword ptr [rdx+rax*4+78h]
fffff801`8b854667 81f980000000    cmp     ecx,80h
fffff801`8b85466d 727b            jb      storport!RaidUnitClaimIrp+0x89a (fffff801`8b8546ea)  Branch

storport!RaidUnitClaimIrp+0x81f:
fffff801`8b85466f 448b4210        mov     r8d,dword ptr [rdx+10h]
fffff801`8b854673 413bc8          cmp     ecx,r8d
fffff801`8b854676 7772            ja      storport!RaidUnitClaimIrp+0x89a (fffff801`8b8546ea)  Branch

storport!RaidUnitClaimIrp+0x828:
fffff801`8b854678 448bc9          mov     r9d,ecx
fffff801`8b85467b 8b0c11          mov     ecx,dword ptr [rcx+rdx]
fffff801`8b85467e 83e940          sub     ecx,40h
fffff801`8b854681 7438            je      storport!RaidUnitClaimIrp+0x86b (fffff801`8b8546bb)  Branch

storport!RaidUnitClaimIrp+0x833:
fffff801`8b854683 83e901          sub     ecx,1
fffff801`8b854686 742d            je      storport!RaidUnitClaimIrp+0x865 (fffff801`8b8546b5)  Branch

storport!RaidUnitClaimIrp+0x838:
fffff801`8b854688 83f901          cmp     ecx,1
fffff801`8b85468b 755d            jne     storport!RaidUnitClaimIrp+0x89a (fffff801`8b8546ea)  Branch

storport!RaidUnitClaimIrp+0x83d:
fffff801`8b85468d 498d4928        lea     rcx,[r9+28h]
fffff801`8b854691 493bc8          cmp     rcx,r8
fffff801`8b854694 7754            ja      storport!RaidUnitClaimIrp+0x89a (fffff801`8b8546ea)  Branch

storport!RaidUnitClaimIrp+0x846:
fffff801`8b854696 498b441118      mov     rax,qword ptr [r9+rdx+18h]
fffff801`8b85469b 488983c8000000  mov     qword ptr [rbx+0C8h],rax
fffff801`8b8546a2 410fb6441109    movzx   eax,byte ptr [r9+rdx+9]
fffff801`8b8546a8 8883d0000000    mov     byte ptr [rbx+0D0h],al
fffff801`8b8546ae 49897c1118      mov     qword ptr [r9+rdx+18h],rdi
fffff801`8b8546b3 eb2c            jmp     storport!RaidUnitClaimIrp+0x891 (fffff801`8b8546e1)  Branch

storport!RaidUnitClaimIrp+0x865:
fffff801`8b8546b5 498d4938        lea     rcx,[r9+38h]
fffff801`8b8546b9 eb04            jmp     storport!RaidUnitClaimIrp+0x86f (fffff801`8b8546bf)  Branch

storport!RaidUnitClaimIrp+0x86b:
fffff801`8b8546bb 498d4928        lea     rcx,[r9+28h]

storport!RaidUnitClaimIrp+0x86f:
fffff801`8b8546bf 493bc8          cmp     rcx,r8
fffff801`8b8546c2 7726            ja      storport!RaidUnitClaimIrp+0x89a (fffff801`8b8546ea)  Branch

storport!RaidUnitClaimIrp+0x874:
fffff801`8b8546c4 498b441110      mov     rax,qword ptr [r9+rdx+10h]
fffff801`8b8546c9 488983c8000000  mov     qword ptr [rbx+0C8h],rax
fffff801`8b8546d0 410fb6441109    movzx   eax,byte ptr [r9+rdx+9]
fffff801`8b8546d6 8883d0000000    mov     byte ptr [rbx+0D0h],al
fffff801`8b8546dc 49897c1110      mov     qword ptr [r9+rdx+10h],rdi

storport!RaidUnitClaimIrp+0x891:
fffff801`8b8546e1 45885c1109      mov     byte ptr [r9+rdx+9],r11b
fffff801`8b8546e6 804b1020        or      byte ptr [rbx+10h],20h

storport!RaidUnitClaimIrp+0x89a:
fffff801`8b8546ea 41ffc2          inc     r10d
fffff801`8b8546ed 443b5238        cmp     r10d,dword ptr [rdx+38h]
fffff801`8b8546f1 0f8269ffffff    jb      storport!RaidUnitClaimIrp+0x810 (fffff801`8b854660)  Branch

storport!RaidUnitClaimIrp+0x8a7:
fffff801`8b8546f7 eb21            jmp     storport!RaidUnitClaimIrp+0x8ca (fffff801`8b85471a)  Branch

storport!RaidUnitClaimIrp+0x8a9:
fffff801`8b8546f9 488b4220        mov     rax,qword ptr [rdx+20h]
fffff801`8b8546fd 488983c8000000  mov     qword ptr [rbx+0C8h],rax
fffff801`8b854704 0fb6420b        movzx   eax,byte ptr [rdx+0Bh]
fffff801`8b854708 8883d0000000    mov     byte ptr [rbx+0D0h],al
fffff801`8b85470e 48897a20        mov     qword ptr [rdx+20h],rdi
fffff801`8b854712 44885a0b        mov     byte ptr [rdx+0Bh],r11b
fffff801`8b854716 804b1020        or      byte ptr [rbx+10h],20h

storport!RaidUnitClaimIrp+0x8ca:
fffff801`8b85471a 488b86b8000000  mov     rax,qword ptr [rsi+0B8h]
fffff801`8b854721 488b4808        mov     rcx,qword ptr [rax+8]
fffff801`8b854725 80790228        cmp     byte ptr [rcx+2],28h
fffff801`8b854729 7506            jne     storport!RaidUnitClaimIrp+0x8e1 (fffff801`8b854731)  Branch

storport!RaidUnitClaimIrp+0x8db:
fffff801`8b85472b 488b5960        mov     rbx,qword ptr [rcx+60h]
fffff801`8b85472f eb04            jmp     storport!RaidUnitClaimIrp+0x8e5 (fffff801`8b854735)  Branch

storport!RaidUnitClaimIrp+0x8e1:
fffff801`8b854731 488b5930        mov     rbx,qword ptr [rcx+30h]

storport!RaidUnitClaimIrp+0x8e5:
fffff801`8b854735 488b83a8000000  mov     rax,qword ptr [rbx+0A8h]  ;set rax = XRB->Srb
fffff801`8b85473c 80780228        cmp     byte ptr [rax+2],28h      ;if(Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x8f7
fffff801`8b854740 7505            jne     storport!RaidUnitClaimIrp+0x8f7 (fffff801`8b854747)  Branch

storport!RaidUnitClaimIrp+0x8f2:
fffff801`8b854742 8b7828          mov     edi,dword ptr [rax+28h]   ;?? set edi = (_SCSI_REQUEST_BLOCK)Srb->
fffff801`8b854745 eb03            jmp     storport!RaidUnitClaimIrp+0x8fa (fffff801`8b85474a)  Branch

storport!RaidUnitClaimIrp+0x8f7:
fffff801`8b854747 8b7814          mov     edi,dword ptr [rax+14h]   ;set edi = Srb->SrbFunction

storport!RaidUnitClaimIrp+0x8fa:
fffff801`8b85474a 4180bd780c000000 cmp     byte ptr [r13+0C78h],0   ;if(UnitExt->QoS.Enabled) goto 0x90f
fffff801`8b854752 bd03000000      mov     ebp,3
fffff801`8b854757 7506            jne     storport!RaidUnitClaimIrp+0x90f (fffff801`8b85475f)  Branch

storport!RaidUnitClaimIrp+0x909:
fffff801`8b854759 83ff02          cmp     edi,2         ;if(function code < SRB_FUNCTION_IO_CONTROL) set edi=3 
fffff801`8b85475c 0f46fd          cmovbe  edi,ebp

storport!RaidUnitClaimIrp+0x90f:
fffff801`8b85475f 498b4518        mov     rax,qword ptr [r13+18h]
fffff801`8b854763 4885c0          test    rax,rax               ;if(NULL == UnitExt->Adapter) goto 0x922
fffff801`8b854766 740a            je      storport!RaidUnitClaimIrp+0x922 (fffff801`8b854772)  Branch

storport!RaidUnitClaimIrp+0x918:
fffff801`8b854768 4883b8c813000000 cmp     qword ptr [rax+13C8h],0      ;if(AdapterExt->IoLatencyCap) goto 0x92e
fffff801`8b854770 770c            ja      storport!RaidUnitClaimIrp+0x92e (fffff801`8b85477e)  Branch

storport!RaidUnitClaimIrp+0x922:
fffff801`8b854772 498b85f8010000  mov     rax,qword ptr [r13+1F8h]
fffff801`8b854779 f60001          test    byte ptr [rax],1      ;if(!UnitExp->PendingQueue.SortedQueueEnabled) goto 0x93d
fffff801`8b85477c 740f            je      storport!RaidUnitClaimIrp+0x93d (fffff801`8b85478d)  Branch

storport!RaidUnitClaimIrp+0x92e:
fffff801`8b85477e 48ff1523290600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff801`8b8b70a8)]
fffff801`8b854785 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b85478a 4c8be0          mov     r12,rax

storport!RaidUnitClaimIrp+0x93d:
fffff801`8b85478d 804b1002        or      byte ptr [rbx+10h],2      ;set XRB->State
fffff801`8b854791 488d4c2440      lea     rcx,[rsp+40h]
fffff801`8b854796 4d8bb5f8010000  mov     r14,qword ptr [r13+1F8h]
fffff801`8b85479d 4883c330        add     rbx,30h
fffff801`8b8547a1 48ff15282b0600  call    qword ptr [storport!_imp_KeGetCurrentProcessorNumberEx (fffff801`8b8b72d0)]
fffff801`8b8547a8 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8547ad 488d4c2440      lea     rcx,[rsp+40h]
fffff801`8b8547b2 48ff15af2b0600  call    qword ptr [storport!_imp_KeGetProcessorIndexFromNumber (fffff801`8b8b7368)]
fffff801`8b8547b9 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8547be 33d2            xor     edx,edx
fffff801`8b8547c0 b90a000000      mov     ecx,0Ah
fffff801`8b8547c5 41f77608        div     eax,dword ptr [r14+8]
fffff801`8b8547c9 8d47ff          lea     eax,[rdi-1]
fffff801`8b8547cc 4c896328        mov     qword ptr [rbx+28h],r12       ;set XRB->PendingLink.StartTime
fffff801`8b8547d0 8bf2            mov     esi,edx
fffff801`8b8547d2 48ffc6          inc     rsi
fffff801`8b8547d5 895324          mov     dword ptr [rbx+24h],edx       ;set XRB->PendingLink.QueueIndex
fffff801`8b8547d8 48c1e606        shl     rsi,6
fffff801`8b8547dc 488d542468      lea     rdx,[rsp+68h]
fffff801`8b8547e1 4903f6          add     rsi,r14
fffff801`8b8547e4 83f8fc          cmp     eax,0FFFFFFFCh
fffff801`8b8547e7 0f47f9          cmova   edi,ecx
fffff801`8b8547ea 03ff            add     edi,edi
fffff801`8b8547ec 488d4e28        lea     rcx,[rsi+28h]                    ;lock UnitExt->PendingQueue.ProcessorQueues[current cpu].Lock
fffff801`8b8547f0 897b20          mov     dword ptr [rbx+20h],edi       ;set XRB->PendingLink.Timeout = UnitExt->PendingQueue.ProcessorQueues[current cpu].Timeout 
fffff801`8b8547f3 48ff15762b0600  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLockAtDpcLevel (fffff801`8b8b7370)]
fffff801`8b8547fa 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8547ff 488b4608        mov     rax,qword ptr [rsi+8]
fffff801`8b854803 483930          cmp     qword ptr [rax],rsi
fffff801`8b854806 0f8582010000    jne     storport!RaidUnitClaimIrp+0xb3e (fffff801`8b85498e)  Branch

storport!RaidUnitClaimIrp+0x9bc:
fffff801`8b85480c 488933          mov     qword ptr [rbx],rsi               ;push XRB->PendingLink.NextLink to UnitExt->PendingQueue.ProcessorQueues[current cpu].List
fffff801`8b85480f 48894308        mov     qword ptr [rbx+8],rax
fffff801`8b854813 488918          mov     qword ptr [rax],rbx
fffff801`8b854816 48895e08        mov     qword ptr [rsi+8],rbx
fffff801`8b85481a 837e30fe        cmp     dword ptr [rsi+30h],0FFFFFFFEh
fffff801`8b85481e 7203            jb      storport!RaidUnitClaimIrp+0x9d3 (fffff801`8b854823)  Branch

storport!RaidUnitClaimIrp+0x9d0:
fffff801`8b854820 897e30          mov     dword ptr [rsi+30h],edi

storport!RaidUnitClaimIrp+0x9d3:
fffff801`8b854823 41f60601        test    byte ptr [r14],1
fffff801`8b854827 0f847f000000    je      storport!RaidUnitClaimIrp+0xa5c (fffff801`8b8548ac)  Branch

storport!RaidUnitClaimIrp+0x9dd:
fffff801`8b85482d 44694b20404b4c00 imul    r9d,dword ptr [rbx+20h],4C4B40h
fffff801`8b854835 4c8d4610        lea     r8,[rsi+10h]
fffff801`8b854839 488b5618        mov     rdx,qword ptr [rsi+18h]
fffff801`8b85483d 4c034b28        add     r9,qword ptr [rbx+28h]
fffff801`8b854841 493bd0          cmp     rdx,r8
fffff801`8b854844 7423            je      storport!RaidUnitClaimIrp+0xa19 (fffff801`8b854869)  Branch

storport!RaidUnitClaimIrp+0x9f6:
fffff801`8b854846 66660f1f840000000000 nop word ptr [rax+rax]

storport!RaidUnitClaimIrp+0xa00:
fffff801`8b854850 694a10404b4c00  imul    ecx,dword ptr [rdx+10h],4C4B40h
fffff801`8b854857 48034a18        add     rcx,qword ptr [rdx+18h]
fffff801`8b85485b 4c3bc9          cmp     r9,rcx
fffff801`8b85485e 732e            jae     storport!RaidUnitClaimIrp+0xa3e (fffff801`8b85488e)  Branch

storport!RaidUnitClaimIrp+0xa10:
fffff801`8b854860 488b5208        mov     rdx,qword ptr [rdx+8]
fffff801`8b854864 493bd0          cmp     rdx,r8
fffff801`8b854867 75e7            jne     storport!RaidUnitClaimIrp+0xa00 (fffff801`8b854850)  Branch

storport!RaidUnitClaimIrp+0xa19:
fffff801`8b854869 498b08          mov     rcx,qword ptr [r8]
fffff801`8b85486c 488d4310        lea     rax,[rbx+10h]
fffff801`8b854870 4c394108        cmp     qword ptr [rcx+8],r8
fffff801`8b854874 0f8514010000    jne     storport!RaidUnitClaimIrp+0xb3e (fffff801`8b85498e)  Branch

storport!RaidUnitClaimIrp+0xa2a:
fffff801`8b85487a 488908          mov     qword ptr [rax],rcx
fffff801`8b85487d 4c894008        mov     qword ptr [rax+8],r8
fffff801`8b854881 48894108        mov     qword ptr [rcx+8],rax
fffff801`8b854885 498900          mov     qword ptr [r8],rax
fffff801`8b854888 834b3001        or      dword ptr [rbx+30h],1
fffff801`8b85488c eb22            jmp     storport!RaidUnitClaimIrp+0xa60 (fffff801`8b8548b0)  Branch

storport!RaidUnitClaimIrp+0xa3e:
fffff801`8b85488e 488b02          mov     rax,qword ptr [rdx]
fffff801`8b854891 488d4b10        lea     rcx,[rbx+10h]
fffff801`8b854895 488901          mov     qword ptr [rcx],rax
fffff801`8b854898 488b02          mov     rax,qword ptr [rdx]
fffff801`8b85489b 48894808        mov     qword ptr [rax+8],rcx
fffff801`8b85489f 48890a          mov     qword ptr [rdx],rcx
fffff801`8b8548a2 834b3001        or      dword ptr [rbx+30h],1
fffff801`8b8548a6 48895318        mov     qword ptr [rbx+18h],rdx
fffff801`8b8548aa eb04            jmp     storport!RaidUnitClaimIrp+0xa60 (fffff801`8b8548b0)  Branch

storport!RaidUnitClaimIrp+0xa5c:
fffff801`8b8548ac 836330fe        and     dword ptr [rbx+30h],0FFFFFFFEh

storport!RaidUnitClaimIrp+0xa60:
fffff801`8b8548b0 488d4c2468      lea     rcx,[rsp+68h]
fffff801`8b8548b5 48ff15bc2a0600  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLockFromDpcLevel (fffff801`8b8b7378)]
fffff801`8b8548bc 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8548c1 803dc8cf050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],0
fffff801`8b8548c8 7448            je      storport!RaidUnitClaimIrp+0xac2 (fffff801`8b854912)  Branch

storport!RaidUnitClaimIrp+0xa7a:
fffff801`8b8548ca 488b4c2438      mov     rcx,qword ptr [rsp+38h]
fffff801`8b8548cf 488d942480000000 lea     rdx,[rsp+80h]
fffff801`8b8548d7 33c0            xor     eax,eax
fffff801`8b8548d9 4889842480000000 mov     qword ptr [rsp+80h],rax
fffff801`8b8548e1 4889842488000000 mov     qword ptr [rsp+88h],rax
fffff801`8b8548e9 48ff1560280600  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff801`8b8b7150)]
fffff801`8b8548f0 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8548f5 0fb605e6ce0500  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff801`8b8b17e2)]
fffff801`8b8548fc 84c0            test    al,al
fffff801`8b8548fe 7912            jns     storport!RaidUnitClaimIrp+0xac2 (fffff801`8b854912)  Branch

storport!RaidUnitClaimIrp+0xab0:
fffff801`8b854900 4c8d842480000000 lea     r8,[rsp+80h]
fffff801`8b854908 40886c2420      mov     byte ptr [rsp+20h],bpl
fffff801`8b85490d e8561b0400      call    storport!McTemplateK0dud (fffff801`8b896468)

storport!RaidUnitClaimIrp+0xac2:
fffff801`8b854912 4180bdc101000000 cmp     byte ptr [r13+1C1h],0
fffff801`8b85491a 7c31            jl      storport!RaidUnitClaimIrp+0xafd (fffff801`8b85494d)  Branch

storport!RaidUnitClaimIrp+0xacc:
fffff801`8b85491c 498b4518        mov     rax,qword ptr [r13+18h]
fffff801`8b854920 4883b82014000000 cmp     qword ptr [rax+1420h],0
fffff801`8b854928 7523            jne     storport!RaidUnitClaimIrp+0xafd (fffff801`8b85494d)  Branch

storport!RaidUnitClaimIrp+0xada:
fffff801`8b85492a 4180bd940c000000 cmp     byte ptr [r13+0C94h],0
fffff801`8b854932 7453            je      storport!RaidUnitClaimIrp+0xb37 (fffff801`8b854987)  Branch

storport!RaidUnitClaimIrp+0xae4:
fffff801`8b854934 b201            mov     dl,1
fffff801`8b854936 498bcd          mov     rcx,r13
fffff801`8b854939 e83e180000      call    storport!RaidUnitReenablePendingTimer (fffff801`8b85617c)
fffff801`8b85493e 33c0            xor     eax,eax
fffff801`8b854940 41c685940c000000 mov     byte ptr [r13+0C94h],0
fffff801`8b854948 e982f8ffff      jmp     storport!RaidUnitClaimIrp+0x37f (fffff801`8b8541cf)  Branch

storport!RaidUnitClaimIrp+0xafd:
fffff801`8b85494d 418b85c8010000  mov     eax,dword ptr [r13+1C8h]
fffff801`8b854954 a804            test    al,4
fffff801`8b854956 7512            jne     storport!RaidUnitClaimIrp+0xb1a (fffff801`8b85496a)  Branch

storport!RaidUnitClaimIrp+0xb08:
fffff801`8b854958 f0410fbaadc801000002 lock bts dword ptr [r13+1C8h],2
fffff801`8b854962 0f92c0          setb    al
fffff801`8b854965 0fb6c0          movzx   eax,al
fffff801`8b854968 eb05            jmp     storport!RaidUnitClaimIrp+0xb1f (fffff801`8b85496f)  Branch

storport!RaidUnitClaimIrp+0xb1a:
fffff801`8b85496a b801000000      mov     eax,1

storport!RaidUnitClaimIrp+0xb1f:
fffff801`8b85496f 4180bd940c000000 cmp     byte ptr [r13+0C94h],0
fffff801`8b854977 75bb            jne     storport!RaidUnitClaimIrp+0xae4 (fffff801`8b854934)  Branch

storport!RaidUnitClaimIrp+0xb29:
fffff801`8b854979 85c0            test    eax,eax
fffff801`8b85497b 750a            jne     storport!RaidUnitClaimIrp+0xb37 (fffff801`8b854987)  Branch

storport!RaidUnitClaimIrp+0xb2d:
fffff801`8b85497d 33d2            xor     edx,edx
fffff801`8b85497f 498bcd          mov     rcx,r13
fffff801`8b854982 e8f5170000      call    storport!RaidUnitReenablePendingTimer (fffff801`8b85617c)

storport!RaidUnitClaimIrp+0xb37:
fffff801`8b854987 33c0            xor     eax,eax
fffff801`8b854989 e941f8ffff      jmp     storport!RaidUnitClaimIrp+0x37f (fffff801`8b8541cf)  Branch

storport!RaidUnitClaimIrp+0xb3e:
fffff801`8b85498e 488bcd          mov     rcx,rbp
fffff801`8b854991 cd29            int     29h
fffff801`8b854993 cc              int     3
fffff801`8b854994 cc              int     3
fffff801`8b854995 cc              int     3
fffff801`8b854996 cc              int     3
fffff801`8b854997 cc              int     3
fffff801`8b854998 cc              int     3
fffff801`8b854999 cc              int     3
fffff801`8b85499a cc              int     3
fffff801`8b85499b cc              int     3
fffff801`8b85499c cc              int     3
fffff801`8b85499d cc              int     3
fffff801`8b85499e cc              int     3
fffff801`8b85499f cc              int     3
fffff801`8b8549a0 4053            push    rbx
fffff801`8b8549a2 55              push    rbp
fffff801`8b8549a3 57              push    rdi
fffff801`8b8549a4 4154            push    r12
fffff801`8b8549a6 4155            push    r13
fffff801`8b8549a8 4156            push    r14
fffff801`8b8549aa 4157            push    r15
fffff801`8b8549ac 4883ec40        sub     rsp,40h
fffff801`8b8549b0 33ed            xor     ebp,ebp
fffff801`8b8549b2 48898ad8000000  mov     qword ptr [rdx+0D8h],rcx
fffff801`8b8549b9 488bda          mov     rbx,rdx
fffff801`8b8549bc 4889ac2480000000 mov     qword ptr [rsp+80h],rbp
fffff801`8b8549c4 488b92e0000000  mov     rdx,qword ptr [rdx+0E0h]
fffff801`8b8549cb 488bf9          mov     rdi,rcx
fffff801`8b8549ce 448bfd          mov     r15d,ebp
fffff801`8b8549d1 4889ac2488000000 mov     qword ptr [rsp+88h],rbp
fffff801`8b8549d9 448be5          mov     r12d,ebp
fffff801`8b8549dc 448bed          mov     r13d,ebp
fffff801`8b8549df 488b8ba8000000  mov     rcx,qword ptr [rbx+0A8h]
fffff801`8b8549e6 0fb64102        movzx   eax,byte ptr [rcx+2]
fffff801`8b8549ea 3c28            cmp     al,28h
fffff801`8b8549ec 7509            jne     storport!RaidAdapterPostScatterGatherExecute+0x57 (fffff801`8b8549f7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4e:
fffff801`8b8549ee 8b4114          mov     eax,dword ptr [rcx+14h]
fffff801`8b8549f1 448b4118        mov     r8d,dword ptr [rcx+18h]
fffff801`8b8549f5 eb07            jmp     storport!RaidAdapterPostScatterGatherExecute+0x5e (fffff801`8b8549fe)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x57:
fffff801`8b8549f7 448b410c        mov     r8d,dword ptr [rcx+0Ch]
fffff801`8b8549fb 0fb6c0          movzx   eax,al

storport!RaidAdapterPostScatterGatherExecute+0x5e:
fffff801`8b8549fe 41be01000000    mov     r14d,1
fffff801`8b854a04 4885d2          test    rdx,rdx
fffff801`8b854a07 7469            je      storport!RaidAdapterPostScatterGatherExecute+0xd2 (fffff801`8b854a72)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x69:
fffff801`8b854a09 39aaac020000    cmp     dword ptr [rdx+2ACh],ebp
fffff801`8b854a0f 7e40            jle     storport!RaidAdapterPostScatterGatherExecute+0xb1 (fffff801`8b854a51)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x71:
fffff801`8b854a11 83f820          cmp     eax,20h
fffff801`8b854a14 7408            je      storport!RaidAdapterPostScatterGatherExecute+0x7e (fffff801`8b854a1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x76:
fffff801`8b854a16 83f813          cmp     eax,13h
fffff801`8b854a19 418bc6          mov     eax,r14d
fffff801`8b854a1c 7502            jne     storport!RaidAdapterPostScatterGatherExecute+0x80 (fffff801`8b854a20)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x7e:
fffff801`8b854a1e 8bc5            mov     eax,ebp

storport!RaidAdapterPostScatterGatherExecute+0x80:
fffff801`8b854a20 85c0            test    eax,eax
fffff801`8b854a22 7564            jne     storport!RaidAdapterPostScatterGatherExecute+0xe8 (fffff801`8b854a88)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x84:
fffff801`8b854a24 40382d65ce0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],bpl
fffff801`8b854a2b 0f848d000000    je      storport!RaidAdapterPostScatterGatherExecute+0x11e (fffff801`8b854abe)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x91:
fffff801`8b854a31 40382d38ce0500  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],bpl

storport!RaidAdapterPostScatterGatherExecute+0x98:
fffff801`8b854a38 0f849c000000    je      storport!RaidAdapterPostScatterGatherExecute+0x13a (fffff801`8b854ada)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x9e:
fffff801`8b854a3e 33c9            xor     ecx,ecx
fffff801`8b854a40 48ff15b9250600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff801`8b8b7000)]
fffff801`8b854a47 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b854a4c e99a000000      jmp     storport!RaidAdapterPostScatterGatherExecute+0x14b (fffff801`8b854aeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xb1:
fffff801`8b854a51 4038aab4020000  cmp     byte ptr [rdx+2B4h],bpl
fffff801`8b854a58 7406            je      storport!RaidAdapterPostScatterGatherExecute+0xc0 (fffff801`8b854a60)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xba:
fffff801`8b854a5a 41f6c010        test    r8b,10h
fffff801`8b854a5e 7428            je      storport!RaidAdapterPostScatterGatherExecute+0xe8 (fffff801`8b854a88)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xc0:
fffff801`8b854a60 4038aab5020000  cmp     byte ptr [rdx+2B5h],bpl
fffff801`8b854a67 74bb            je      storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff801`8b854a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xc9:
fffff801`8b854a69 41f7c000000800  test    r8d,80000h
fffff801`8b854a70 eb14            jmp     storport!RaidAdapterPostScatterGatherExecute+0xe6 (fffff801`8b854a86)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xd2:
fffff801`8b854a72 39af6c030000    cmp     dword ptr [rdi+36Ch],ebp
fffff801`8b854a78 74aa            je      storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff801`8b854a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xda:
fffff801`8b854a7a 83c0dc          add     eax,0FFFFFFDCh
fffff801`8b854a7d 413bc6          cmp     eax,r14d
fffff801`8b854a80 76a2            jbe     storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff801`8b854a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xe2:
fffff801`8b854a82 f6431108        test    byte ptr [rbx+11h],8

storport!RaidAdapterPostScatterGatherExecute+0xe6:
fffff801`8b854a86 759c            jne     storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff801`8b854a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xe8:
fffff801`8b854a88 c6410305        mov     byte ptr [rcx+3],5
fffff801`8b854a8c 4c8bc3          mov     r8,rbx
fffff801`8b854a8f 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff801`8b854a96 33d2            xor     edx,edx
fffff801`8b854a98 e8ff250200      call    storport!RaidUpdateZoneIoMetadata (fffff801`8b87709c)
fffff801`8b854a9d 450fb6c6        movzx   r8d,r14b
fffff801`8b854aa1 488bd3          mov     rdx,rbx
fffff801`8b854aa4 488bcf          mov     rcx,rdi
fffff801`8b854aa7 e834130000      call    storport!RaidAdapterRequestComplete (fffff801`8b855de0)
fffff801`8b854aac 33c0            xor     eax,eax
fffff801`8b854aae 4883c440        add     rsp,40h
fffff801`8b854ab2 415f            pop     r15
fffff801`8b854ab4 415e            pop     r14
fffff801`8b854ab6 415d            pop     r13
fffff801`8b854ab8 415c            pop     r12
fffff801`8b854aba 5f              pop     rdi
fffff801`8b854abb 5d              pop     rbp
fffff801`8b854abc 5b              pop     rbx
fffff801`8b854abd c3              ret

storport!RaidAdapterPostScatterGatherExecute+0x11e:
fffff801`8b854abe 392d10c80500    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceEnabled (fffff801`8b8b12d4)],ebp
fffff801`8b854ac4 7422            je      storport!RaidAdapterPostScatterGatherExecute+0x148 (fffff801`8b854ae8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x126:
fffff801`8b854ac6 40382da3cd0500  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],bpl
fffff801`8b854acd 740b            je      storport!RaidAdapterPostScatterGatherExecute+0x13a (fffff801`8b854ada)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x12f:
fffff801`8b854acf 392d03c80500    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceHighResolutionTimer (fffff801`8b8b12d8)],ebp
fffff801`8b854ad5 e95effffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x98 (fffff801`8b854a38)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x13a:
fffff801`8b854ada 48ff15c7250600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff801`8b8b70a8)]
fffff801`8b854ae1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b854ae6 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x14b (fffff801`8b854aeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x148:
fffff801`8b854ae8 488bc5          mov     rax,rbp

storport!RaidAdapterPostScatterGatherExecute+0x14b:
fffff801`8b854aeb 40382d81cd0500  cmp     byte ptr [storport!FUAEnabled (fffff801`8b8b1873)],bpl
fffff801`8b854af2 4c8b93a8000000  mov     r10,qword ptr [rbx+0A8h]
fffff801`8b854af9 4889b42498000000 mov     qword ptr [rsp+98h],rsi
fffff801`8b854b01 488983b8020000  mov     qword ptr [rbx+2B8h],rax
fffff801`8b854b08 0f85ee000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff801`8b854bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x16e:
fffff801`8b854b0e 4d85d2          test    r10,r10
fffff801`8b854b11 0f84e5000000    je      storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff801`8b854bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x177:
fffff801`8b854b17 410fb64202      movzx   eax,byte ptr [r10+2]
fffff801`8b854b1c 3c28            cmp     al,28h
fffff801`8b854b1e 0f85a2000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x226 (fffff801`8b854bc6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x184:
fffff801`8b854b24 458b7a14        mov     r15d,dword ptr [r10+14h]
fffff801`8b854b28 488bf5          mov     rsi,rbp
fffff801`8b854b2b 4585ff          test    r15d,r15d
fffff801`8b854b2e 0f859a000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff801`8b854bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x194:
fffff801`8b854b34 458b7238        mov     r14d,dword ptr [r10+38h]
fffff801`8b854b38 448bdd          mov     r11d,ebp
fffff801`8b854b3b 4585f6          test    r14d,r14d
fffff801`8b854b3e 744a            je      storport!RaidAdapterPostScatterGatherExecute+0x1ea (fffff801`8b854b8a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1a0:
fffff801`8b854b40 418bc3          mov     eax,r11d
fffff801`8b854b43 418b4c8278      mov     ecx,dword ptr [r10+rax*4+78h]
fffff801`8b854b48 81f980000000    cmp     ecx,80h
fffff801`8b854b4e 7254            jb      storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff801`8b854ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1b0:
fffff801`8b854b50 418b5210        mov     edx,dword ptr [r10+10h]
fffff801`8b854b54 3bca            cmp     ecx,edx
fffff801`8b854b56 734c            jae     storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff801`8b854ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1b8:
fffff801`8b854b58 4e8d0c11        lea     r9,[rcx+r10]
fffff801`8b854b5c 448bc1          mov     r8d,ecx
fffff801`8b854b5f 418b09          mov     ecx,dword ptr [r9]
fffff801`8b854b62 83e940          sub     ecx,40h
fffff801`8b854b65 7431            je      storport!RaidAdapterPostScatterGatherExecute+0x1f8 (fffff801`8b854b98)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1c7:
fffff801`8b854b67 83e901          sub     ecx,1
fffff801`8b854b6a 7426            je      storport!RaidAdapterPostScatterGatherExecute+0x1f2 (fffff801`8b854b92)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1cc:
fffff801`8b854b6c 83f901          cmp     ecx,1
fffff801`8b854b6f 7533            jne     storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff801`8b854ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1d1:
fffff801`8b854b71 498d4828        lea     rcx,[r8+28h]
fffff801`8b854b75 8bc2            mov     eax,edx
fffff801`8b854b77 483bca          cmp     rcx,rdx
fffff801`8b854b7a 7728            ja      storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff801`8b854ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1dc:
fffff801`8b854b7c 418b410c        mov     eax,dword ptr [r9+0Ch]
fffff801`8b854b80 498d7120        lea     rsi,[r9+20h]
fffff801`8b854b84 85c0            test    eax,eax
fffff801`8b854b86 480f44f5        cmove   rsi,rbp

storport!RaidAdapterPostScatterGatherExecute+0x1ea:
fffff801`8b854b8a 41be01000000    mov     r14d,1
fffff801`8b854b90 eb3c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff801`8b854bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1f2:
fffff801`8b854b92 498d4838        lea     rcx,[r8+38h]
fffff801`8b854b96 eb04            jmp     storport!RaidAdapterPostScatterGatherExecute+0x1fc (fffff801`8b854b9c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1f8:
fffff801`8b854b98 498d4828        lea     rcx,[r8+28h]

storport!RaidAdapterPostScatterGatherExecute+0x1fc:
fffff801`8b854b9c 488bc2          mov     rax,rdx
fffff801`8b854b9f 483bca          cmp     rcx,rdx
fffff801`8b854ba2 7610            jbe     storport!RaidAdapterPostScatterGatherExecute+0x214 (fffff801`8b854bb4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x204:
fffff801`8b854ba4 41ffc3          inc     r11d
fffff801`8b854ba7 453bde          cmp     r11d,r14d
fffff801`8b854baa 7294            jb      storport!RaidAdapterPostScatterGatherExecute+0x1a0 (fffff801`8b854b40)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x20c:
fffff801`8b854bac 41be01000000    mov     r14d,1
fffff801`8b854bb2 eb1a            jmp     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff801`8b854bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x214:
fffff801`8b854bb4 41be01000000    mov     r14d,1
fffff801`8b854bba 4138710a        cmp     byte ptr [r9+0Ah],sil
fffff801`8b854bbe 760e            jbe     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff801`8b854bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x220:
fffff801`8b854bc0 498d7118        lea     rsi,[r9+18h]
fffff801`8b854bc4 eb08            jmp     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff801`8b854bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x226:
fffff801`8b854bc6 440fb6f8        movzx   r15d,al
fffff801`8b854bca 498d7248        lea     rsi,[r10+48h]

storport!RaidAdapterPostScatterGatherExecute+0x22e:
fffff801`8b854bce 4885f6          test    rsi,rsi
fffff801`8b854bd1 7426            je      storport!RaidAdapterPostScatterGatherExecute+0x259 (fffff801`8b854bf9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x233:
fffff801`8b854bd3 4585ff          test    r15d,r15d
fffff801`8b854bd6 7521            jne     storport!RaidAdapterPostScatterGatherExecute+0x259 (fffff801`8b854bf9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x238:
fffff801`8b854bd8 0fb606          movzx   eax,byte ptr [rsi]
fffff801`8b854bdb 3c2a            cmp     al,2Ah
fffff801`8b854bdd 7408            je      storport!RaidAdapterPostScatterGatherExecute+0x247 (fffff801`8b854be7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x23f:
fffff801`8b854bdf 3caa            cmp     al,0AAh
fffff801`8b854be1 7404            je      storport!RaidAdapterPostScatterGatherExecute+0x247 (fffff801`8b854be7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x243:
fffff801`8b854be3 3c8a            cmp     al,8Ah
fffff801`8b854be5 7512            jne     storport!RaidAdapterPostScatterGatherExecute+0x259 (fffff801`8b854bf9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x247:
fffff801`8b854be7 0fb64601        movzx   eax,byte ptr [rsi+1]
fffff801`8b854beb 4c8bfd          mov     r15,rbp
fffff801`8b854bee a808            test    al,8
fffff801`8b854bf0 740a            je      storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff801`8b854bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x252:
fffff801`8b854bf2 24f7            and     al,0F7h
fffff801`8b854bf4 884601          mov     byte ptr [rsi+1],al
fffff801`8b854bf7 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff801`8b854bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x259:
fffff801`8b854bf9 4c8bfd          mov     r15,rbp

storport!RaidAdapterPostScatterGatherExecute+0x25c:
fffff801`8b854bfc 4038afa2110000  cmp     byte ptr [rdi+11A2h],bpl
fffff801`8b854c03 0f84d7010000    je      storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff801`8b854de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x269:
fffff801`8b854c09 488b05a0c60500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff801`8b8b12b0)]
fffff801`8b854c10 a801            test    al,1
fffff801`8b854c12 0f84a7000000    je      storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff801`8b854cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x278:
fffff801`8b854c18 488bcb          mov     rcx,rbx
fffff801`8b854c1b e850060000      call    storport!RaidLogGetParm4 (fffff801`8b855270)
fffff801`8b854c20 4c8b93a0000000  mov     r10,qword ptr [rbx+0A0h]
fffff801`8b854c27 488bf0          mov     rsi,rax
fffff801`8b854c2a 4c8b83a8000000  mov     r8,qword ptr [rbx+0A8h]
fffff801`8b854c31 4d85d2          test    r10,r10
fffff801`8b854c34 7516            jne     storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff801`8b854c4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x296:
fffff801`8b854c36 4d85c0          test    r8,r8
fffff801`8b854c39 7411            je      storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff801`8b854c4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x29b:
fffff801`8b854c3b 4180780228      cmp     byte ptr [r8+2],28h
fffff801`8b854c40 7506            jne     storport!RaidAdapterPostScatterGatherExecute+0x2a8 (fffff801`8b854c48)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2a2:
fffff801`8b854c42 4d8b5050        mov     r10,qword ptr [r8+50h]
fffff801`8b854c46 eb04            jmp     storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff801`8b854c4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2a8:
fffff801`8b854c48 4d8b5030        mov     r10,qword ptr [r8+30h]

storport!RaidAdapterPostScatterGatherExecute+0x2ac:
fffff801`8b854c4c 488bcb          mov     rcx,rbx
fffff801`8b854c4f e8f4140000      call    storport!DbgGetAddressLongFromXrb (fffff801`8b856148)
fffff801`8b854c54 4c8b8bd8000000  mov     r9,qword ptr [rbx+0D8h]
fffff801`8b854c5b 448bd8          mov     r11d,eax
fffff801`8b854c5e 4d85c9          test    r9,r9
fffff801`8b854c61 745c            je      storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff801`8b854cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2c3:
fffff801`8b854c63 4139a904140000  cmp     dword ptr [r9+1404h],ebp
fffff801`8b854c6a 7653            jbe     storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff801`8b854cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2cc:
fffff801`8b854c6c 4939a908140000  cmp     qword ptr [r9+1408h],rbp
fffff801`8b854c73 744a            je      storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff801`8b854cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2d5:
fffff801`8b854c75 418bc6          mov     eax,r14d
fffff801`8b854c78 f0410fc18100140000 lock xadd dword ptr [r9+1400h],eax
fffff801`8b854c81 ffc0            inc     eax
fffff801`8b854c83 33d2            xor     edx,edx
fffff801`8b854c85 41f7b104140000  div     eax,dword ptr [r9+1404h]
fffff801`8b854c8c 488d0c52        lea     rcx,[rdx+rdx*2]
fffff801`8b854c90 48c1e104        shl     rcx,4
fffff801`8b854c94 49038908140000  add     rcx,qword ptr [r9+1408h]
fffff801`8b854c9b c70124000000    mov     dword ptr [rcx],24h
fffff801`8b854ca1 48a11400000080f7ffff mov rax,qword ptr [FFFFF78000000014h]
fffff801`8b854cab 48894128        mov     qword ptr [rcx+28h],rax
fffff801`8b854caf 4c895108        mov     qword ptr [rcx+8],r10
fffff801`8b854cb3 4c895910        mov     qword ptr [rcx+10h],r11
fffff801`8b854cb7 4c894118        mov     qword ptr [rcx+18h],r8
fffff801`8b854cbb 48897120        mov     qword ptr [rcx+20h],rsi

storport!RaidAdapterPostScatterGatherExecute+0x31f:
fffff801`8b854cbf 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff801`8b854cc6 4885c0          test    rax,rax
fffff801`8b854cc9 7407            je      storport!RaidAdapterPostScatterGatherExecute+0x332 (fffff801`8b854cd2)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x32b:
fffff801`8b854ccb c6808d000000ae  mov     byte ptr [rax+8Dh],0AEh

storport!RaidAdapterPostScatterGatherExecute+0x332:
fffff801`8b854cd2 488b8bd8000000  mov     rcx,qword ptr [rbx+0D8h]
fffff801`8b854cd9 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]
fffff801`8b854ce0 488b8120020000  mov     rax,qword ptr [rcx+220h]
fffff801`8b854ce7 488b8080000000  mov     rax,qword ptr [rax+80h]
fffff801`8b854cee 4885c0          test    rax,rax
fffff801`8b854cf1 7416            je      storport!RaidAdapterPostScatterGatherExecute+0x369 (fffff801`8b854d09)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x353:
fffff801`8b854cf3 488b8928020000  mov     rcx,qword ptr [rcx+228h]
fffff801`8b854cfa 4883c110        add     rcx,10h
fffff801`8b854cfe ff15242b0600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff801`8b8b7828)]
fffff801`8b854d04 0fb6f0          movzx   esi,al
fffff801`8b854d07 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x36c (fffff801`8b854d0c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x369:
fffff801`8b854d09 40b601          mov     sil,1

storport!RaidAdapterPostScatterGatherExecute+0x36c:
fffff801`8b854d0c 40382d7dcb0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],bpl
fffff801`8b854d13 743e            je      storport!RaidAdapterPostScatterGatherExecute+0x3b3 (fffff801`8b854d53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x375:
fffff801`8b854d15 f605c5ca050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff801`8b8b17e1)],1
fffff801`8b854d1c 7509            jne     storport!RaidAdapterPostScatterGatherExecute+0x387 (fffff801`8b854d27)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x37e:
fffff801`8b854d1e f605beca050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff801`8b8b17e3)],2
fffff801`8b854d25 742c            je      storport!RaidAdapterPostScatterGatherExecute+0x3b3 (fffff801`8b854d53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x387:
fffff801`8b854d27 40382d42cb0500  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],bpl
fffff801`8b854d2e 7410            je      storport!RaidAdapterPostScatterGatherExecute+0x3a0 (fffff801`8b854d40)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x390:
fffff801`8b854d30 33c9            xor     ecx,ecx
fffff801`8b854d32 48ff15c7220600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff801`8b8b7000)]
fffff801`8b854d39 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b854d3e eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x3ac (fffff801`8b854d4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3a0:
fffff801`8b854d40 48ff1561230600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff801`8b8b70a8)]
fffff801`8b854d47 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x3ac:
fffff801`8b854d4c 488983c0020000  mov     qword ptr [rbx+2C0h],rax

storport!RaidAdapterPostScatterGatherExecute+0x3b3:
fffff801`8b854d53 4084f6          test    sil,sil
fffff801`8b854d56 7518            jne     storport!RaidAdapterPostScatterGatherExecute+0x3d0 (fffff801`8b854d70)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3b8:
fffff801`8b854d58 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff801`8b854d5f 4c8bc3          mov     r8,rbx
fffff801`8b854d62 33d2            xor     edx,edx
fffff801`8b854d64 e833230200      call    storport!RaidUpdateZoneIoMetadata (fffff801`8b87709c)
fffff801`8b854d69 33c0            xor     eax,eax
fffff801`8b854d6b e971020000      jmp     storport!RaidAdapterPostScatterGatherExecute+0x641 (fffff801`8b854fe1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3d0:
fffff801`8b854d70 83bfc812000001  cmp     dword ptr [rdi+12C8h],1
fffff801`8b854d77 7e39            jle     storport!RaidAdapterPostScatterGatherExecute+0x412 (fffff801`8b854db2)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3d9:
fffff801`8b854d79 b9ffff0000      mov     ecx,0FFFFh
fffff801`8b854d7e 48ff1523250600  call    qword ptr [storport!_imp_KeQueryActiveProcessorCountEx (fffff801`8b8b72a8)]
fffff801`8b854d85 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b854d8a 3987c8120000    cmp     dword ptr [rdi+12C8h],eax
fffff801`8b854d90 7313            jae     storport!RaidAdapterPostScatterGatherExecute+0x405 (fffff801`8b854da5)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3f2:
fffff801`8b854d92 488bcf          mov     rcx,rdi
fffff801`8b854d95 e8d20a0200      call    storport!RaAllocateConcurrentChannelToken (fffff801`8b87586c)
fffff801`8b854d9a 4c8bf8          mov     r15,rax
fffff801`8b854d9d 8b4814          mov     ecx,dword ptr [rax+14h]
fffff801`8b854da0 894b18          mov     dword ptr [rbx+18h],ecx
fffff801`8b854da3 eb3b            jmp     storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff801`8b854de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x405:
fffff801`8b854da5 658b0425a4010000 mov     eax,dword ptr gs:[1A4h]
fffff801`8b854dad 894318          mov     dword ptr [rbx+18h],eax
fffff801`8b854db0 eb2e            jmp     storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff801`8b854de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x412:
fffff801`8b854db2 39afc8020000    cmp     dword ptr [rdi+2C8h],ebp
fffff801`8b854db8 750e            jne     storport!RaidAdapterPostScatterGatherExecute+0x428 (fffff801`8b854dc8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x41a:
fffff801`8b854dba 488bcf          mov     rcx,rdi
fffff801`8b854dbd e89e200000      call    storport!RaidAdapterAcquireInterruptLock (fffff801`8b856e60)
fffff801`8b854dc2 88442420        mov     byte ptr [rsp+20h],al
fffff801`8b854dc6 eb18            jmp     storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff801`8b854de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x428:
fffff801`8b854dc8 488d8fc0020000  lea     rcx,[rdi+2C0h]
fffff801`8b854dcf 488d542420      lea     rdx,[rsp+20h]
fffff801`8b854dd4 48ff15d5240600  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff801`8b8b72b0)]
fffff801`8b854ddb 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x440:
fffff801`8b854de0 488b05c9c40500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff801`8b8b12b0)]
fffff801`8b854de7 a804            test    al,4
fffff801`8b854de9 0f8482000000    je      storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff801`8b854e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x44f:
fffff801`8b854def 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff801`8b854df6 4885c0          test    rax,rax
fffff801`8b854df9 7423            je      storport!RaidAdapterPostScatterGatherExecute+0x47e (fffff801`8b854e1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x45b:
fffff801`8b854dfb 8b4860          mov     ecx,dword ptr [rax+60h]
fffff801`8b854dfe 8bc1            mov     eax,ecx
fffff801`8b854e00 c1e808          shr     eax,8
fffff801`8b854e03 440fb6e0        movzx   r12d,al
fffff801`8b854e07 0fb6c1          movzx   eax,cl
fffff801`8b854e0a 48c1e008        shl     rax,8
fffff801`8b854e0e 4c0be0          or      r12,rax
fffff801`8b854e11 c1e910          shr     ecx,10h
fffff801`8b854e14 49c1e408        shl     r12,8
fffff801`8b854e18 0fb6c1          movzx   eax,cl
fffff801`8b854e1b 4c0be0          or      r12,rax

storport!RaidAdapterPostScatterGatherExecute+0x47e:
fffff801`8b854e1e 488bcb          mov     rcx,rbx
fffff801`8b854e21 e84a040000      call    storport!RaidLogGetParm4 (fffff801`8b855270)
fffff801`8b854e26 488b8ba0000000  mov     rcx,qword ptr [rbx+0A0h]
fffff801`8b854e2d 4c8baba8000000  mov     r13,qword ptr [rbx+0A8h]
fffff801`8b854e34 4889842488000000 mov     qword ptr [rsp+88h],rax
fffff801`8b854e3c 4885c9          test    rcx,rcx
fffff801`8b854e3f 740a            je      storport!RaidAdapterPostScatterGatherExecute+0x4ab (fffff801`8b854e4b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4a1:
fffff801`8b854e41 48898c2480000000 mov     qword ptr [rsp+80h],rcx
fffff801`8b854e49 eb26            jmp     storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff801`8b854e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4ab:
fffff801`8b854e4b 4d85ed          test    r13,r13
fffff801`8b854e4e 7421            je      storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff801`8b854e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4b0:
fffff801`8b854e50 41807d0228      cmp     byte ptr [r13+2],28h
fffff801`8b854e55 750e            jne     storport!RaidAdapterPostScatterGatherExecute+0x4c5 (fffff801`8b854e65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4b7:
fffff801`8b854e57 498b7550        mov     rsi,qword ptr [r13+50h]
fffff801`8b854e5b 4889b42480000000 mov     qword ptr [rsp+80h],rsi
fffff801`8b854e63 eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff801`8b854e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4c5:
fffff801`8b854e65 498b4530        mov     rax,qword ptr [r13+30h]
fffff801`8b854e69 4889842480000000 mov     qword ptr [rsp+80h],rax

storport!RaidAdapterPostScatterGatherExecute+0x4d1:
fffff801`8b854e71 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff801`8b854e78 4c8bc3          mov     r8,rbx
fffff801`8b854e7b 33d2            xor     edx,edx
fffff801`8b854e7d e81a220200      call    storport!RaidUpdateZoneIoMetadata (fffff801`8b87709c)
fffff801`8b854e82 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff801`8b854e89 4885c0          test    rax,rax
fffff801`8b854e8c 7407            je      storport!RaidAdapterPostScatterGatherExecute+0x4f5 (fffff801`8b854e95)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4ee:
fffff801`8b854e8e c6808d000000aa  mov     byte ptr [rax+8Dh],0AAh

storport!RaidAdapterPostScatterGatherExecute+0x4f5:
fffff801`8b854e95 0fb64310        movzx   eax,byte ptr [rbx+10h]
fffff801`8b854e99 24ef            and     al,0EFh
fffff801`8b854e9b 0c0c            or      al,0Ch
fffff801`8b854e9d 884310          mov     byte ptr [rbx+10h],al
fffff801`8b854ea0 48b81400000080f7ffff mov rax,0FFFFF78000000014h
fffff801`8b854eaa 488b00          mov     rax,qword ptr [rax]
fffff801`8b854ead 488b8f28020000  mov     rcx,qword ptr [rdi+228h]
fffff801`8b854eb4 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]
fffff801`8b854ebb 4883c110        add     rcx,10h
fffff801`8b854ebf 4889842490000000 mov     qword ptr [rsp+90h],rax
fffff801`8b854ec7 488b8720020000  mov     rax,qword ptr [rdi+220h]
fffff801`8b854ece 488b4010        mov     rax,qword ptr [rax+10h]
fffff801`8b854ed2 ff1550290600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff801`8b8b7828)]
fffff801`8b854ed8 40382db1c90500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],bpl
fffff801`8b854edf 0fb6f0          movzx   esi,al
fffff801`8b854ee2 743e            je      storport!RaidAdapterPostScatterGatherExecute+0x582 (fffff801`8b854f22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x544:
fffff801`8b854ee4 f605f6c8050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff801`8b8b17e1)],1
fffff801`8b854eeb 7509            jne     storport!RaidAdapterPostScatterGatherExecute+0x556 (fffff801`8b854ef6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x54d:
fffff801`8b854eed f605efc8050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff801`8b8b17e3)],2
fffff801`8b854ef4 742c            je      storport!RaidAdapterPostScatterGatherExecute+0x582 (fffff801`8b854f22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x556:
fffff801`8b854ef6 40382d73c90500  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],bpl
fffff801`8b854efd 7410            je      storport!RaidAdapterPostScatterGatherExecute+0x56f (fffff801`8b854f0f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x55f:
fffff801`8b854eff 33c9            xor     ecx,ecx
fffff801`8b854f01 48ff15f8200600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff801`8b8b7000)]
fffff801`8b854f08 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b854f0d eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x57b (fffff801`8b854f1b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x56f:
fffff801`8b854f0f 48ff1592210600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff801`8b8b70a8)]
fffff801`8b854f16 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x57b:
fffff801`8b854f1b 488983c8020000  mov     qword ptr [rbx+2C8h],rax

storport!RaidAdapterPostScatterGatherExecute+0x582:
fffff801`8b854f22 4038afa2110000  cmp     byte ptr [rdi+11A2h],bpl
fffff801`8b854f29 7428            je      storport!RaidAdapterPostScatterGatherExecute+0x5b3 (fffff801`8b854f53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x58b:
fffff801`8b854f2b 83bfc812000001  cmp     dword ptr [rdi+12C8h],1
fffff801`8b854f32 7e12            jle     storport!RaidAdapterPostScatterGatherExecute+0x5a6 (fffff801`8b854f46)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x594:
fffff801`8b854f34 4d85ff          test    r15,r15
fffff801`8b854f37 741a            je      storport!RaidAdapterPostScatterGatherExecute+0x5b3 (fffff801`8b854f53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x599:
fffff801`8b854f39 498bd7          mov     rdx,r15
fffff801`8b854f3c 488bcf          mov     rcx,rdi
fffff801`8b854f3f e800200300      call    storport!RaFreeConcurrentChannelToken (fffff801`8b886f44)
fffff801`8b854f44 eb0d            jmp     storport!RaidAdapterPostScatterGatherExecute+0x5b3 (fffff801`8b854f53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5a6:
fffff801`8b854f46 488d542420      lea     rdx,[rsp+20h]
fffff801`8b854f4b 488bcf          mov     rcx,rdi
fffff801`8b854f4e e8ad000000      call    storport!RaidAdapterReleaseStartIoLock (fffff801`8b855000)

storport!RaidAdapterPostScatterGatherExecute+0x5b3:
fffff801`8b854f53 488b0556c30500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff801`8b8b12b0)]
fffff801`8b854f5a a804            test    al,4
fffff801`8b854f5c 0f8472000000    je      storport!RaidAdapterPostScatterGatherExecute+0x634 (fffff801`8b854fd4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5c2:
fffff801`8b854f62 39af04140000    cmp     dword ptr [rdi+1404h],ebp
fffff801`8b854f68 766a            jbe     storport!RaidAdapterPostScatterGatherExecute+0x634 (fffff801`8b854fd4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5ca:
fffff801`8b854f6a 4839af08140000  cmp     qword ptr [rdi+1408h],rbp
fffff801`8b854f71 7461            je      storport!RaidAdapterPostScatterGatherExecute+0x634 (fffff801`8b854fd4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5d3:
fffff801`8b854f73 f0440fc1b700140000 lock xadd dword ptr [rdi+1400h],r14d
fffff801`8b854f7c 33d2            xor     edx,edx
fffff801`8b854f7e 418d4601        lea     eax,[r14+1]
fffff801`8b854f82 f7b704140000    div     eax,dword ptr [rdi+1404h]
fffff801`8b854f88 488b842490000000 mov     rax,qword ptr [rsp+90h]
fffff801`8b854f90 488d0c52        lea     rcx,[rdx+rdx*2]
fffff801`8b854f94 48c1e104        shl     rcx,4
fffff801`8b854f98 48038f08140000  add     rcx,qword ptr [rdi+1408h]
fffff801`8b854f9f 8929            mov     dword ptr [rcx],ebp
fffff801`8b854fa1 4885c0          test    rax,rax
fffff801`8b854fa4 750a            jne     storport!RaidAdapterPostScatterGatherExecute+0x610 (fffff801`8b854fb0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x606:
fffff801`8b854fa6 48a11400000080f7ffff mov rax,qword ptr [FFFFF78000000014h]

storport!RaidAdapterPostScatterGatherExecute+0x610:
fffff801`8b854fb0 48894128        mov     qword ptr [rcx+28h],rax
fffff801`8b854fb4 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff801`8b854fbc 48894108        mov     qword ptr [rcx+8],rax
fffff801`8b854fc0 488b842488000000 mov     rax,qword ptr [rsp+88h]
fffff801`8b854fc8 48894120        mov     qword ptr [rcx+20h],rax
fffff801`8b854fcc 4c896110        mov     qword ptr [rcx+10h],r12
fffff801`8b854fd0 4c896918        mov     qword ptr [rcx+18h],r13

storport!RaidAdapterPostScatterGatherExecute+0x634:
fffff801`8b854fd4 b8010000c0      mov     eax,0C0000001h
fffff801`8b854fd9 4084f6          test    sil,sil
fffff801`8b854fdc 0f44e8          cmove   ebp,eax
fffff801`8b854fdf 8bc5            mov     eax,ebp

storport!RaidAdapterPostScatterGatherExecute+0x641:
fffff801`8b854fe1 488bb42498000000 mov     rsi,qword ptr [rsp+98h]
fffff801`8b854fe9 4883c440        add     rsp,40h
fffff801`8b854fed 415f            pop     r15
fffff801`8b854fef 415e            pop     r14
fffff801`8b854ff1 415d            pop     r13
fffff801`8b854ff3 415c            pop     r12
fffff801`8b854ff5 5f              pop     rdi
fffff801`8b854ff6 5d              pop     rbp
fffff801`8b854ff7 5b              pop     rbx
fffff801`8b854ff8 c3              ret
