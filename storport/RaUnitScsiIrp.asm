;這個function會檢查Adapter能吃哪種SRB，不合的就指定 SrbStatus == 6 退回request

0: kd> uf storport!RaUnitScsiIrp
Flow analysis was incomplete, some code may be missing
storport!RaUnitScsiIrp:
fffff80d`80807220 4053            push    rbx
fffff80d`80807222 55              push    rbp
fffff80d`80807223 56              push    rsi
fffff80d`80807224 57              push    rdi
fffff80d`80807225 4154            push    r12
fffff80d`80807227 4155            push    r13
fffff80d`80807229 4883ec68        sub     rsp,68h
fffff80d`8080722d 488b055ca00500  mov     rax,qword ptr [storport!_security_cookie (fffff80d`80861290)]
fffff80d`80807234 4833c4          xor     rax,rsp
fffff80d`80807237 4889442458      mov     qword ptr [rsp+58h],rax
fffff80d`8080723c 488b9ab8000000  mov     rbx,qword ptr [rdx+0B8h]  ;rbx = IRP->Tail.Overlay.CurrentStackLocation
fffff80d`80807243 33f6            xor     esi,esi
fffff80d`80807245 4c8bea          mov     r13,rdx
fffff80d`80807248 488be9          mov     rbp,rcx   ;UnitExt
fffff80d`8080724b 41b401          mov     r12b,1
fffff80d`8080724e 8bfe            mov     edi,esi
fffff80d`80807250 488b5b08        mov     rbx,qword ptr [rbx+8]
fffff80d`80807254 4885db          test    rbx,rbx   ;if CurrentStackLocation->Parameters.Scsi == NULL, goto error
fffff80d`80807257 0f84ad650200    je      storport!RaUnitScsiIrp+0x265ea (fffff80d`8082d80a)  Branch

storport!RaUnitScsiIrp+0x3d:
fffff80d`8080725d 658b0425a4010000 mov     eax,dword ptr gs:[1A4h]  ;current cpuid
fffff80d`80807265 448bc0          mov     r8d,eax
fffff80d`80807268 488b4120        mov     rax,qword ptr [rcx+20h]
fffff80d`8080726c 49c1e006        shl     r8,6  ;取得 UnitExt->PerProcessorData[cpuid] 的 ptr offset from begin
fffff80d`80807270 418b0400        mov     eax,dword ptr [r8+rax] ; eax = PerProcessorData->OutstandingCount
fffff80d`80807274 4184c4          test    r12b,al
fffff80d`80807277 0f85a7650200    jne     storport!RaUnitScsiIrp+0x26604 (fffff80d`8082d824)  Branch

storport!RaUnitScsiIrp+0x5d:
fffff80d`8080727d 8d5002          lea     edx,[rax+2]
fffff80d`80807280 488b4d20        mov     rcx,qword ptr [rbp+20h]
fffff80d`80807284 f0410fb11408    lock cmpxchg dword ptr [r8+rcx],edx ;InterlockedCompareExcahnge(PerProcessorData->OutstandingCount, 2, 0);
fffff80d`8080728a 0f854f030000    jne     storport!RaUnitScsiIrp+0x3bf (fffff80d`808075df)  Branch

storport!RaUnitScsiIrp+0x70:
fffff80d`80807290 8b4d30          mov     ecx,dword ptr [rbp+30h]   ;UnitExt->DeviceState
fffff80d`80807293 4c89b424b0000000 mov     qword ptr [rsp+0B0h],r14
fffff80d`8080729b 83f905          cmp     ecx,5 ;if UnitExt->DeviceState >= 5, goto 0x26610
fffff80d`8080729e 0f8d8c650200    jge     storport!RaUnitScsiIrp+0x26610 (fffff80d`8082d830)  Branch

storport!RaUnitScsiIrp+0x84:
fffff80d`808072a4 0fb64302        movzx   eax,byte ptr [rbx+2]
fffff80d`808072a8 4c897c2460      mov     qword ptr [rsp+60h],r15
fffff80d`808072ad 3c28            cmp     al,28h    ;check if SRB is STORAGE_REQUEST_BLOCK
fffff80d`808072af 0f85ce010000    jne     storport!RaUnitScsiIrp+0x263 (fffff80d`80807483)  Branch

storport!RaUnitScsiIrp+0x95:
fffff80d`808072b5 488b4518        mov     rax,qword ptr [rbp+18h]   ;rax == AdapterExt
fffff80d`808072b9 80b8a201000001  cmp     byte ptr [rax+1A2h],1     ;if AdapterExt->Miniport->PortConfiguration->SrbType != 1, goto 0x2669d
fffff80d`808072c0 0f85f7650200    jne     storport!RaUnitScsiIrp+0x2669d (fffff80d`8082d8bd)  Branch

storport!RaUnitScsiIrp+0xa6:
fffff80d`808072c6 817b0858425253  cmp     dword ptr [rbx+8],53524258h
fffff80d`808072cd 488bfb          mov     rdi,rbx
fffff80d`808072d0 448b7314        mov     r14d,dword ptr [rbx+14h]
fffff80d`808072d4 448b7b18        mov     r15d,dword ptr [rbx+18h]
fffff80d`808072d8 0f8505660200    jne     storport!RaUnitScsiIrp+0x266c3 (fffff80d`8082d8e3)  Branch

storport!RaUnitScsiIrp+0xbe:
fffff80d`808072de 397330          cmp     dword ptr [rbx+30h],esi
fffff80d`808072e1 0f85fc650200    jne     storport!RaUnitScsiIrp+0x266c3 (fffff80d`8082d8e3)  Branch

storport!RaUnitScsiIrp+0xc7:
fffff80d`808072e7 48397348        cmp     qword ptr [rbx+48h],rsi
fffff80d`808072eb 0f85f2650200    jne     storport!RaUnitScsiIrp+0x266c3 (fffff80d`8082d8e3)  Branch

storport!RaUnitScsiIrp+0xd1:
fffff80d`808072f1 488b0d089d0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808072f8 488d05019d0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808072ff 483bc8          cmp     rcx,rax
fffff80d`80807302 740b            je      storport!RaUnitScsiIrp+0xef (fffff80d`8080730f)  Branch

storport!RaUnitScsiIrp+0xe4:
fffff80d`80807304 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80d`80807307 a808            test    al,8
fffff80d`80807309 0f85fa650200    jne     storport!RaUnitScsiIrp+0x266e9 (fffff80d`8082d909)  Branch

storport!RaUnitScsiIrp+0xef:
fffff80d`8080730f 410fbae714      bt      r15d,14h
fffff80d`80807314 0f826a020000    jb      storport!RaUnitScsiIrp+0x364 (fffff80d`80807584)  Branch

storport!RaUnitScsiIrp+0xfa:
fffff80d`8080731a 4585f6          test    r14d,r14d
fffff80d`8080731d 0f8576010000    jne     storport!RaUnitScsiIrp+0x279 (fffff80d`80807499)  Branch

storport!RaUnitScsiIrp+0x103:
fffff80d`80807323 807b0228        cmp     byte ptr [rbx+2],28h
fffff80d`80807327 0f8563010000    jne     storport!RaUnitScsiIrp+0x270 (fffff80d`80807490)  Branch

storport!RaUnitScsiIrp+0x10d:
fffff80d`8080732d 807f0228        cmp     byte ptr [rdi+2],28h
fffff80d`80807331 4c8bce          mov     r9,rsi
fffff80d`80807334 755a            jne     storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x116:
fffff80d`80807336 397714          cmp     dword ptr [rdi+14h],esi
fffff80d`80807339 7555            jne     storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x11b:
fffff80d`8080733b 448b5738        mov     r10d,dword ptr [rdi+38h]
fffff80d`8080733f 448bde          mov     r11d,esi
fffff80d`80807342 4585d2          test    r10d,r10d
fffff80d`80807345 7449            je      storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x127:
fffff80d`80807347 418bc3          mov     eax,r11d
fffff80d`8080734a 8b4c8778        mov     ecx,dword ptr [rdi+rax*4+78h]
fffff80d`8080734e 81f980000000    cmp     ecx,80h
fffff80d`80807354 0f8244660200    jb      storport!RaUnitScsiIrp+0x2677e (fffff80d`8082d99e)  Branch

storport!RaUnitScsiIrp+0x13a:
fffff80d`8080735a 448b4710        mov     r8d,dword ptr [rdi+10h]
fffff80d`8080735e 413bc8          cmp     ecx,r8d
fffff80d`80807361 0f8737660200    ja      storport!RaUnitScsiIrp+0x2677e (fffff80d`8082d99e)  Branch

storport!RaUnitScsiIrp+0x147:
fffff80d`80807367 448b3439        mov     r14d,dword ptr [rcx+rdi]
fffff80d`8080736b 488d1439        lea     rdx,[rcx+rdi]
fffff80d`8080736f 4183fe40        cmp     r14d,40h
fffff80d`80807373 0f85f3650200    jne     storport!RaUnitScsiIrp+0x2674c (fffff80d`8082d96c)  Branch

storport!RaUnitScsiIrp+0x159:
fffff80d`80807379 4883c128        add     rcx,28h
fffff80d`8080737d 493bc8          cmp     rcx,r8
fffff80d`80807380 0f8718660200    ja      storport!RaUnitScsiIrp+0x2677e (fffff80d`8082d99e)  Branch

storport!RaUnitScsiIrp+0x166:
fffff80d`80807386 4038720a        cmp     byte ptr [rdx+0Ah],sil
fffff80d`8080738a 7604            jbe     storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x16c:
fffff80d`8080738c 4c8d4a18        lea     r9,[rdx+18h]

storport!RaUnitScsiIrp+0x170:
fffff80d`80807390 4d85c9          test    r9,r9
fffff80d`80807393 740a            je      storport!RaUnitScsiIrp+0x17f (fffff80d`8080739f)  Branch

storport!RaUnitScsiIrp+0x175:
fffff80d`80807395 4180391b        cmp     byte ptr [r9],1Bh
fffff80d`80807399 0f84a9020000    je      storport!RaUnitScsiIrp+0x428 (fffff80d`80807648)  Branch

storport!RaUnitScsiIrp+0x17f:
fffff80d`8080739f 403835eaa40500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80d`80861890)],sil
fffff80d`808073a6 740d            je      storport!RaUnitScsiIrp+0x195 (fffff80d`808073b5)  Branch

storport!RaUnitScsiIrp+0x188:
fffff80d`808073a8 f60532a405001e  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff80d`808617e1)],1Eh
fffff80d`808073af 0f8579660200    jne     storport!RaUnitScsiIrp+0x2680e (fffff80d`8082da2e)  Branch

storport!RaUnitScsiIrp+0x195:
fffff80d`808073b5 33c0            xor     eax,eax
fffff80d`808073b7 4889442440      mov     qword ptr [rsp+40h],rax
fffff80d`808073bc 498b85b8000000  mov     rax,qword ptr [r13+0B8h]
fffff80d`808073c3 488b4808        mov     rcx,qword ptr [rax+8]
fffff80d`808073c7 80480301        or      byte ptr [rax+3],1
fffff80d`808073cb 40887103        mov     byte ptr [rcx+3],sil
fffff80d`808073cf 498b85b8000000  mov     rax,qword ptr [r13+0B8h]
fffff80d`808073d6 48897018        mov     qword ptr [rax+18h],rsi
fffff80d`808073da 0fb64102        movzx   eax,byte ptr [rcx+2]
fffff80d`808073de 3c28            cmp     al,28h
fffff80d`808073e0 0f850e010000    jne     storport!RaUnitScsiIrp+0x2d4 (fffff80d`808074f4)  Branch

storport!RaUnitScsiIrp+0x1c6:
fffff80d`808073e6 8b7914          mov     edi,dword ptr [rcx+14h]
fffff80d`808073e9 8b5918          mov     ebx,dword ptr [rcx+18h]

storport!RaUnitScsiIrp+0x1cc:
fffff80d`808073ec 488b05bd9e0500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80d`808612b0)]
fffff80d`808073f3 a820            test    al,20h
fffff80d`808073f5 0f8563660200    jne     storport!RaUnitScsiIrp+0x2683e (fffff80d`8082da5e)  Branch

storport!RaUnitScsiIrp+0x1db:
fffff80d`808073fb 8bc3            mov     eax,ebx
fffff80d`808073fd 8bcb            mov     ecx,ebx
fffff80d`808073ff c1e911          shr     ecx,11h
fffff80d`80807402 83e104          and     ecx,4
fffff80d`80807405 8bd1            mov     edx,ecx
fffff80d`80807407 83ca02          or      edx,2
fffff80d`8080740a 2410            and     al,10h
fffff80d`8080740c 8bc3            mov     eax,ebx
fffff80d`8080740e 0f44d1          cmove   edx,ecx
fffff80d`80807411 2502010000      and     eax,102h
fffff80d`80807416 3d02010000      cmp     eax,102h
fffff80d`8080741b 0f850a010000    jne     storport!RaUnitScsiIrp+0x30b (fffff80d`8080752b)  Branch

storport!RaUnitScsiIrp+0x201:
fffff80d`80807421 448bc2          mov     r8d,edx
fffff80d`80807424 488bcd          mov     rcx,rbp
fffff80d`80807427 4183c801        or      r8d,1
fffff80d`8080742b 85f6            test    esi,esi
fffff80d`8080742d 440f44c2        cmove   r8d,edx
fffff80d`80807431 498bd5          mov     rdx,r13
fffff80d`80807434 e887020000      call    storport!RaidStartIoPacket (fffff80d`808076c0)
fffff80d`80807439 488b0dc09b0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`80807440 488d05b99b0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`80807447 483bc8          cmp     rcx,rax
fffff80d`8080744a 740b            je      storport!RaUnitScsiIrp+0x237 (fffff80d`80807457)  Branch

storport!RaUnitScsiIrp+0x22c:
fffff80d`8080744c 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80d`8080744f a808            test    al,8
fffff80d`80807451 0f8555660200    jne     storport!RaUnitScsiIrp+0x2688c (fffff80d`8082daac)  Branch

storport!RaUnitScsiIrp+0x237:
fffff80d`80807457 b803010000      mov     eax,103h

storport!RaUnitScsiIrp+0x23c:
fffff80d`8080745c 4c8b7c2460      mov     r15,qword ptr [rsp+60h]

storport!RaUnitScsiIrp+0x241:
fffff80d`80807461 4c8bb424b0000000 mov     r14,qword ptr [rsp+0B0h]

storport!RaUnitScsiIrp+0x249:
fffff80d`80807469 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff80d`8080746e 4833cc          xor     rcx,rsp
fffff80d`80807471 e8eae80100      call    storport!_security_check_cookie (fffff80d`80825d60)
fffff80d`80807476 4883c468        add     rsp,68h
fffff80d`8080747a 415d            pop     r13
fffff80d`8080747c 415c            pop     r12
fffff80d`8080747e 5f              pop     rdi
fffff80d`8080747f 5e              pop     rsi
fffff80d`80807480 5d              pop     rbp
fffff80d`80807481 5b              pop     rbx
fffff80d`80807482 c3              ret

storport!RaUnitScsiIrp+0x263:
fffff80d`80807483 448b7b0c        mov     r15d,dword ptr [rbx+0Ch]
fffff80d`80807487 440fb6f0        movzx   r14d,al
fffff80d`8080748b e961feffff      jmp     storport!RaUnitScsiIrp+0xd1 (fffff80d`808072f1)  Branch

storport!RaUnitScsiIrp+0x270:
fffff80d`80807490 4c8d4b48        lea     r9,[rbx+48h]
fffff80d`80807494 e9f7feffff      jmp     storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x279:
fffff80d`80807499 4183fe08        cmp     r14d,8
fffff80d`8080749d 0f85a7000000    jne     storport!RaUnitScsiIrp+0x32a (fffff80d`8080754a)  Branch

storport!RaUnitScsiIrp+0x283:
fffff80d`808074a3 488b4518        mov     rax,qword ptr [rbp+18h]
fffff80d`808074a7 4038b093010000  cmp     byte ptr [rax+193h],sil
fffff80d`808074ae 7459            je      storport!RaUnitScsiIrp+0x2e9 (fffff80d`80807509)  Branch

storport!RaUnitScsiIrp+0x290:
fffff80d`808074b0 498bd5          mov     rdx,r13
fffff80d`808074b3 488bcd          mov     rcx,rbp
fffff80d`808074b6 e8f5fbffff      call    storport!RaidUnitSubmitRequest (fffff80d`808070b0)

storport!RaUnitScsiIrp+0x29b:
fffff80d`808074bb 3d03010000      cmp     eax,103h
fffff80d`808074c0 450fb6e4        movzx   r12d,r12b
fffff80d`808074c4 8bd8            mov     ebx,eax
fffff80d`808074c6 440f44e6        cmove   r12d,esi

storport!RaUnitScsiIrp+0x2aa:
fffff80d`808074ca 488b0d2f9b0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808074d1 488d05289b0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808074d8 483bc8          cmp     rcx,rax
fffff80d`808074db 740b            je      storport!RaUnitScsiIrp+0x2c8 (fffff80d`808074e8)  Branch

storport!RaUnitScsiIrp+0x2bd:
fffff80d`808074dd 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80d`808074e0 a808            test    al,8
fffff80d`808074e2 0f85da660200    jne     storport!RaUnitScsiIrp+0x269a2 (fffff80d`8082dbc2)  Branch

storport!RaUnitScsiIrp+0x2c8:
fffff80d`808074e8 4584e4          test    r12b,r12b
fffff80d`808074eb 7512            jne     storport!RaUnitScsiIrp+0x2df (fffff80d`808074ff)  Branch

storport!RaUnitScsiIrp+0x2cd:
fffff80d`808074ed 8bc3            mov     eax,ebx
fffff80d`808074ef e968ffffff      jmp     storport!RaUnitScsiIrp+0x23c (fffff80d`8080745c)  Branch

storport!RaUnitScsiIrp+0x2d4:
fffff80d`808074f4 8b590c          mov     ebx,dword ptr [rcx+0Ch]
fffff80d`808074f7 0fb6f8          movzx   edi,al
fffff80d`808074fa e9edfeffff      jmp     storport!RaUnitScsiIrp+0x1cc (fffff80d`808073ec)  Branch

storport!RaUnitScsiIrp+0x2df:
fffff80d`808074ff 488bcd          mov     rcx,rbp
fffff80d`80807502 e8b5faffff      call    storport!RaUnitReleaseRemoveLock (fffff80d`80806fbc)
fffff80d`80807507 ebe4            jmp     storport!RaUnitScsiIrp+0x2cd (fffff80d`808074ed)  Branch

storport!RaUnitScsiIrp+0x2e9:
fffff80d`80807509 498b85b8000000  mov     rax,qword ptr [r13+0B8h]
fffff80d`80807510 4533c0          xor     r8d,r8d
fffff80d`80807513 33d2            xor     edx,edx
fffff80d`80807515 488b4808        mov     rcx,qword ptr [rax+8]
fffff80d`80807519 c6410301        mov     byte ptr [rcx+3],1
fffff80d`8080751d 498bcd          mov     rcx,r13
fffff80d`80807520 49897538        mov     qword ptr [r13+38h],rsi
fffff80d`80807524 e847340000      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`80807529 eb90            jmp     storport!RaUnitScsiIrp+0x29b (fffff80d`808074bb)  Branch

storport!RaUnitScsiIrp+0x30b:
fffff80d`8080752b f7c310000800    test    ebx,80010h
fffff80d`80807531 0f85eafeffff    jne     storport!RaUnitScsiIrp+0x201 (fffff80d`80807421)  Branch

storport!RaUnitScsiIrp+0x317:
fffff80d`80807537 83ff20          cmp     edi,20h
fffff80d`8080753a 0f8686000000    jbe     storport!RaUnitScsiIrp+0x3a6 (fffff80d`808075c6)  Branch

storport!RaUnitScsiIrp+0x320:
fffff80d`80807540 be01000000      mov     esi,1
fffff80d`80807545 e9d7feffff      jmp     storport!RaUnitScsiIrp+0x201 (fffff80d`80807421)  Branch

storport!RaUnitScsiIrp+0x32a:
fffff80d`8080754a 41ffce          dec     r14d
fffff80d`8080754d 4183fe1f        cmp     r14d,1Fh
fffff80d`80807551 0f875c660200    ja      storport!RaUnitScsiIrp+0x26993 (fffff80d`8082dbb3)  Branch

storport!RaUnitScsiIrp+0x337:
fffff80d`80807557 488d15a28affff  lea     rdx,[storport!RaUnitAtaPassThroughIoctl <PERF> (storport+0x0) (fffff80d`80800000)]
fffff80d`8080755e 428b8cb2a8640500 mov     ecx,dword ptr [rdx+r14*4+564A8h]
fffff80d`80807566 4803ca          add     rcx,rdx
fffff80d`80807569 ffe1            jmp     rcx

storport!RaUnitScsiIrp+0x364:
fffff80d`80807584 488b4d18        mov     rcx,qword ptr [rbp+18h]
fffff80d`80807588 488b8120140000  mov     rax,qword ptr [rcx+1420h]
fffff80d`8080758f 4885c0          test    rax,rax
fffff80d`80807592 0f85a3630200    jne     storport!RaUnitScsiIrp+0x2671b (fffff80d`8082d93b)  Branch

storport!RaUnitScsiIrp+0x378:
fffff80d`80807598 f6416c02        test    byte ptr [rcx+6Ch],2
fffff80d`8080759c 0f85a4630200    jne     storport!RaUnitScsiIrp+0x26726 (fffff80d`8082d946)  Branch

storport!RaUnitScsiIrp+0x382:
fffff80d`808075a2 83b91c01000001  cmp     dword ptr [rcx+11Ch],1
fffff80d`808075a9 0f846bfdffff    je      storport!RaUnitScsiIrp+0xfa (fffff80d`8080731a)  Branch

storport!RaUnitScsiIrp+0x38f:
fffff80d`808075af e992630200      jmp     storport!RaUnitScsiIrp+0x26726 (fffff80d`8082d946)  Branch

storport!RaUnitScsiIrp+0x3a6:
fffff80d`808075c6 48b900000d0001000000 mov rcx,1000D0000h
fffff80d`808075d0 480fa3f9        bt      rcx,rdi
fffff80d`808075d4 0f8366ffffff    jae     storport!RaUnitScsiIrp+0x320 (fffff80d`80807540)  Branch

storport!RaUnitScsiIrp+0x3ba:
fffff80d`808075da e942feffff      jmp     storport!RaUnitScsiIrp+0x201 (fffff80d`80807421)  Branch

storport!RaUnitScsiIrp+0x3bf:
fffff80d`808075df a801            test    al,1
fffff80d`808075e1 0f8496fcffff    je      storport!RaUnitScsiIrp+0x5d (fffff80d`8080727d)  Branch

storport!RaUnitScsiIrp+0x3c7:
fffff80d`808075e7 e938620200      jmp     storport!RaUnitScsiIrp+0x26604 (fffff80d`8082d824)  Branch

storport!RaUnitScsiIrp+0x428:
fffff80d`80807648 41f6410401      test    byte ptr [r9+4],1
fffff80d`8080764d 0f854cfdffff    jne     storport!RaUnitScsiIrp+0x17f (fffff80d`8080739f)  Branch

storport!RaUnitScsiIrp+0x433:
fffff80d`80807653 e957630200      jmp     storport!RaUnitScsiIrp+0x2678f (fffff80d`8082d9af)  Branch

storport!RaUnitScsiIrp+0x475:
fffff80d`80807695 498bd5          mov     rdx,r13
fffff80d`80807698 e8c7f40300      call    storport!RaUnitCheckRemoveStateForDisabled (fffff80d`80846b64)
fffff80d`8080769d 448bf0          mov     r14d,eax
fffff80d`808076a0 85c0            test    eax,eax
fffff80d`808076a2 0f89fcfbffff    jns     storport!RaUnitScsiIrp+0x84 (fffff80d`808072a4)  Branch

storport!RaUnitScsiIrp+0x488:
fffff80d`808076a8 e9c4610200      jmp     storport!RaUnitScsiIrp+0x26651 (fffff80d`8082d871)  Branch

storport!RaUnitScsiIrp+0x265ea:
fffff80d`8082d80a 48897238        mov     qword ptr [rdx+38h],rsi
fffff80d`8082d80e 41b80d0000c0    mov     r8d,0C000000Dh
fffff80d`8082d814 33d2            xor     edx,edx
fffff80d`8082d816 498bcd          mov     rcx,r13
fffff80d`8082d819 e852d1fdff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`8082d81e 90              nop
fffff80d`8082d81f e9459cfdff      jmp     storport!RaUnitScsiIrp+0x249 (fffff80d`80807469)  Branch

storport!RaUnitScsiIrp+0x26604:
fffff80d`8082d824 f0ff8590030000  lock inc dword ptr [rbp+390h]
fffff80d`8082d82b e9609afdff      jmp     storport!RaUnitScsiIrp+0x70 (fffff80d`80807290)  Branch

storport!RaUnitScsiIrp+0x26610:
fffff80d`8082d830 83e905          sub     ecx,5
fffff80d`8082d833 7413            je      storport!RaUnitScsiIrp+0x26628 (fffff80d`8082d848)  Branch

storport!RaUnitScsiIrp+0x26615:
fffff80d`8082d835 83e901          sub     ecx,1
fffff80d`8082d838 7431            je      storport!RaUnitScsiIrp+0x2664b (fffff80d`8082d86b)  Branch

storport!RaUnitScsiIrp+0x2661a:
fffff80d`8082d83a 83f901          cmp     ecx,1
fffff80d`8082d83d 0f85619afdff    jne     storport!RaUnitScsiIrp+0x84 (fffff80d`808072a4)  Branch

storport!RaUnitScsiIrp+0x26623:
fffff80d`8082d843 e94d9efdff      jmp     storport!RaUnitScsiIrp+0x475 (fffff80d`80807695)  Branch

storport!RaUnitScsiIrp+0x26628:
fffff80d`8082d848 498b8db8000000  mov     rcx,qword ptr [r13+0B8h]
fffff80d`8082d84f 0fb601          movzx   eax,byte ptr [rcx]
fffff80d`8082d852 3c1b            cmp     al,1Bh
fffff80d`8082d854 0f844a9afdff    je      storport!RaUnitScsiIrp+0x84 (fffff80d`808072a4)  Branch

storport!RaUnitScsiIrp+0x2663a:
fffff80d`8082d85a 3c0e            cmp     al,0Eh
fffff80d`8082d85c 750d            jne     storport!RaUnitScsiIrp+0x2664b (fffff80d`8082d86b)  Branch

storport!RaUnitScsiIrp+0x2663e:
fffff80d`8082d85e 81791824100400  cmp     dword ptr [rcx+18h],41024h
fffff80d`8082d865 0f84399afdff    je      storport!RaUnitScsiIrp+0x84 (fffff80d`808072a4)  Branch

storport!RaUnitScsiIrp+0x2664b:
fffff80d`8082d86b 41be560000c0    mov     r14d,0C0000056h

storport!RaUnitScsiIrp+0x26651:
fffff80d`8082d871 b8ffffffff      mov     eax,0FFFFFFFFh
fffff80d`8082d876 f00fc18590030000 lock xadd dword ptr [rbp+390h],eax
fffff80d`8082d87e 83f801          cmp     eax,1
fffff80d`8082d881 7518            jne     storport!RaUnitScsiIrp+0x2667b (fffff80d`8082d89b)  Branch

storport!RaUnitScsiIrp+0x26663:
fffff80d`8082d883 488d8dd0010000  lea     rcx,[rbp+1D0h]
fffff80d`8082d88a 4533c0          xor     r8d,r8d
fffff80d`8082d88d 33d2            xor     edx,edx
fffff80d`8082d88f 48ff15029b0300  call    qword ptr [storport!_imp_KeSetEvent (fffff80d`80867398)]
fffff80d`8082d896 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitScsiIrp+0x2667b:
fffff80d`8082d89b 418bce          mov     ecx,r14d
fffff80d`8082d89e e8b5840100      call    storport!RaidNtStatusToSrbStatus (fffff80d`80845d58)
fffff80d`8082d8a3 884303          mov     byte ptr [rbx+3],al
fffff80d`8082d8a6 33d2            xor     edx,edx
fffff80d`8082d8a8 458bc6          mov     r8d,r14d
fffff80d`8082d8ab 49897538        mov     qword ptr [r13+38h],rsi
fffff80d`8082d8af 498bcd          mov     rcx,r13
fffff80d`8082d8b2 e8b9d0fdff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`8082d8b7 90              nop
fffff80d`8082d8b8 e9a49bfdff      jmp     storport!RaUnitScsiIrp+0x241 (fffff80d`80807461)  Branch

storport!RaUnitScsiIrp+0x2669d:
fffff80d`8082d8bd c6430306        mov     byte ptr [rbx+3],6    ;set Srb->SrbStatus = 6
fffff80d`8082d8c1 488bcd          mov     rcx,rbp
fffff80d`8082d8c4 49897538        mov     qword ptr [r13+38h],rsi
fffff80d`8082d8c8 e8ef96fdff      call    storport!RaUnitReleaseRemoveLock (fffff80d`80806fbc)
fffff80d`8082d8cd 33d2            xor     edx,edx
fffff80d`8082d8cf 41b8bb0000c0    mov     r8d,0C00000BBh
fffff80d`8082d8d5 498bcd          mov     rcx,r13
fffff80d`8082d8d8 e893d0fdff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`8082d8dd 90              nop
fffff80d`8082d8de e9799bfdff      jmp     storport!RaUnitScsiIrp+0x23c (fffff80d`8080745c)  Branch

storport!RaUnitScsiIrp+0x266c3:
fffff80d`8082d8e3 c6430306        mov     byte ptr [rbx+3],6
fffff80d`8082d8e7 488bcd          mov     rcx,rbp
fffff80d`8082d8ea 49897538        mov     qword ptr [r13+38h],rsi
fffff80d`8082d8ee e8c996fdff      call    storport!RaUnitReleaseRemoveLock (fffff80d`80806fbc)
fffff80d`8082d8f3 33d2            xor     edx,edx
fffff80d`8082d8f5 41b80d0000c0    mov     r8d,0C000000Dh
fffff80d`8082d8fb 498bcd          mov     rcx,r13
fffff80d`8082d8fe e86dd0fdff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`8082d903 90              nop
fffff80d`8082d904 e9539bfdff      jmp     storport!RaUnitScsiIrp+0x23c (fffff80d`8080745c)  Branch

storport!RaUnitScsiIrp+0x266e9:
fffff80d`8082d909 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082d90d 0f82fc99fdff    jb      storport!RaUnitScsiIrp+0xef (fffff80d`8080730f)  Branch

storport!RaUnitScsiIrp+0x266f3:
fffff80d`8082d913 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082d917 4c8d05c2820200  lea     r8,[storport!WPP_d6831b3a5b933a01bb909582e3b1c70f_Traceguids (fffff80d`80855be0)]
fffff80d`8082d91e ba14000000      mov     edx,14h
fffff80d`8082d923 4489742428      mov     dword ptr [rsp+28h],r14d
fffff80d`8082d928 4c8bcd          mov     r9,rbp
fffff80d`8082d92b 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80d`8082d930 e843e00000      call    storport!WPP_SF_qqD (fffff80d`8083b978)
fffff80d`8082d935 90              nop
fffff80d`8082d936 e9d499fdff      jmp     storport!RaUnitScsiIrp+0xef (fffff80d`8080730f)  Branch

storport!RaUnitScsiIrp+0x2671b:
fffff80d`8082d93b 8b4014          mov     eax,dword ptr [rax+14h]
fffff80d`8082d93e a801            test    al,1
fffff80d`8082d940 0f85529cfdff    jne     storport!RaUnitScsiIrp+0x378 (fffff80d`80807598)  Branch

storport!RaUnitScsiIrp+0x26726:
fffff80d`8082d946 c6430324        mov     byte ptr [rbx+3],24h
fffff80d`8082d94a 488bcd          mov     rcx,rbp
fffff80d`8082d94d 49897538        mov     qword ptr [r13+38h],rsi
fffff80d`8082d951 e86696fdff      call    storport!RaUnitReleaseRemoveLock (fffff80d`80806fbc)
fffff80d`8082d956 33d2            xor     edx,edx
fffff80d`8082d958 41b8010000c0    mov     r8d,0C0000001h
fffff80d`8082d95e 498bcd          mov     rcx,r13
fffff80d`8082d961 e80ad0fdff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`8082d966 90              nop
fffff80d`8082d967 e9f09afdff      jmp     storport!RaUnitScsiIrp+0x23c (fffff80d`8080745c)  Branch

storport!RaUnitScsiIrp+0x2674c:
fffff80d`8082d96c 4183ee41        sub     r14d,41h
fffff80d`8082d970 741f            je      storport!RaUnitScsiIrp+0x26771 (fffff80d`8082d991)  Branch

storport!RaUnitScsiIrp+0x26752:
fffff80d`8082d972 4183fe01        cmp     r14d,1
fffff80d`8082d976 7526            jne     storport!RaUnitScsiIrp+0x2677e (fffff80d`8082d99e)  Branch

storport!RaUnitScsiIrp+0x26758:
fffff80d`8082d978 4883c128        add     rcx,28h
fffff80d`8082d97c 493bc8          cmp     rcx,r8
fffff80d`8082d97f 771d            ja      storport!RaUnitScsiIrp+0x2677e (fffff80d`8082d99e)  Branch

storport!RaUnitScsiIrp+0x26761:
fffff80d`8082d981 39720c          cmp     dword ptr [rdx+0Ch],esi
fffff80d`8082d984 4c8d4a20        lea     r9,[rdx+20h]
fffff80d`8082d988 4c0f44ce        cmove   r9,rsi
fffff80d`8082d98c e9ff99fdff      jmp     storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x26771:
fffff80d`8082d991 4883c138        add     rcx,38h
fffff80d`8082d995 493bc8          cmp     rcx,r8
fffff80d`8082d998 0f86e899fdff    jbe     storport!RaUnitScsiIrp+0x166 (fffff80d`80807386)  Branch

storport!RaUnitScsiIrp+0x2677e:
fffff80d`8082d99e 41ffc3          inc     r11d
fffff80d`8082d9a1 453bda          cmp     r11d,r10d
fffff80d`8082d9a4 0f829d99fdff    jb      storport!RaUnitScsiIrp+0x127 (fffff80d`80807347)  Branch

storport!RaUnitScsiIrp+0x2678a:
fffff80d`8082d9aa e9e199fdff      jmp     storport!RaUnitScsiIrp+0x170 (fffff80d`80807390)  Branch

storport!RaUnitScsiIrp+0x2678f:
fffff80d`8082d9af 488bcd          mov     rcx,rbp
fffff80d`8082d9b2 e85db30100      call    storport!RaUnitSwallowStopUnitCommand (fffff80d`80848d14)
fffff80d`8082d9b7 84c0            test    al,al
fffff80d`8082d9b9 0f84e099fdff    je      storport!RaUnitScsiIrp+0x17f (fffff80d`8080739f)  Branch

storport!RaUnitScsiIrp+0x2679f:
fffff80d`8082d9bf c6430301        mov     byte ptr [rbx+3],1
fffff80d`8082d9c3 4533c0          xor     r8d,r8d
fffff80d`8082d9c6 33d2            xor     edx,edx
fffff80d`8082d9c8 49897538        mov     qword ptr [r13+38h],rsi
fffff80d`8082d9cc 498bcd          mov     rcx,r13
fffff80d`8082d9cf e89ccffdff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`8082d9d4 488bcd          mov     rcx,rbp
fffff80d`8082d9d7 8bd8            mov     ebx,eax
fffff80d`8082d9d9 e8de95fdff      call    storport!RaUnitReleaseRemoveLock (fffff80d`80806fbc)
fffff80d`8082d9de 488b0d1b360300  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`8082d9e5 488d0514360300  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`8082d9ec 483bc8          cmp     rcx,rax
fffff80d`8082d9ef 0f84f89afdff    je      storport!RaUnitScsiIrp+0x2cd (fffff80d`808074ed)  Branch

storport!RaUnitScsiIrp+0x267d5:
fffff80d`8082d9f5 8b512c          mov     edx,dword ptr [rcx+2Ch]
fffff80d`8082d9f8 f6c208          test    dl,8
fffff80d`8082d9fb 0f84ec9afdff    je      storport!RaUnitScsiIrp+0x2cd (fffff80d`808074ed)  Branch

storport!RaUnitScsiIrp+0x267e1:
fffff80d`8082da01 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082da05 0f82e29afdff    jb      storport!RaUnitScsiIrp+0x2cd (fffff80d`808074ed)  Branch

storport!RaUnitScsiIrp+0x267eb:
fffff80d`8082da0b 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082da0f 4c8d05ca810200  lea     r8,[storport!WPP_d6831b3a5b933a01bb909582e3b1c70f_Traceguids (fffff80d`80855be0)]
fffff80d`8082da16 ba15000000      mov     edx,15h
fffff80d`8082da1b 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80d`8082da20 4c8bcd          mov     r9,rbp
fffff80d`8082da23 e800df0000      call    storport!WPP_SF_qq (fffff80d`8083b928)
fffff80d`8082da28 90              nop
fffff80d`8082da29 e9bf9afdff      jmp     storport!RaUnitScsiIrp+0x2cd (fffff80d`808074ed)  Branch

storport!RaUnitScsiIrp+0x2680e:
fffff80d`8082da2e 410fb601        movzx   eax,byte ptr [r9]
fffff80d`8082da32 2c08            sub     al,8
fffff80d`8082da34 a85d            test    al,5Dh
fffff80d`8082da36 0f857999fdff    jne     storport!RaUnitScsiIrp+0x195 (fffff80d`808073b5)  Branch

storport!RaUnitScsiIrp+0x2681c:
fffff80d`8082da3c 488d542448      lea     rdx,[rsp+48h]
fffff80d`8082da41 498bcd          mov     rcx,r13
fffff80d`8082da44 48ff1505970300  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff80d`80867150)]
fffff80d`8082da4b 0f1f440000      nop     dword ptr [rax+rax]
fffff80d`8082da50 498bcd          mov     rcx,r13
fffff80d`8082da53 e8d8ed0100      call    storport!StorEtwIORequestDispatch (fffff80d`8084c830)
fffff80d`8082da58 90              nop
fffff80d`8082da59 e95799fdff      jmp     storport!RaUnitScsiIrp+0x195 (fffff80d`808073b5)  Branch

storport!RaUnitScsiIrp+0x2683e:
fffff80d`8082da5e 8b4d60          mov     ecx,dword ptr [rbp+60h]
fffff80d`8082da61 4d8bc5          mov     r8,r13
fffff80d`8082da64 8bc1            mov     eax,ecx
fffff80d`8082da66 ba03000000      mov     edx,3
fffff80d`8082da6b c1e808          shr     eax,8
fffff80d`8082da6e 440fb6c8        movzx   r9d,al
fffff80d`8082da72 0fb6c1          movzx   eax,cl
fffff80d`8082da75 48c1e008        shl     rax,8
fffff80d`8082da79 4c0bc8          or      r9,rax
fffff80d`8082da7c c1e910          shr     ecx,10h
fffff80d`8082da7f 0fb6c1          movzx   eax,cl
fffff80d`8082da82 488b4d18        mov     rcx,qword ptr [rbp+18h]
fffff80d`8082da86 49c1e108        shl     r9,8
fffff80d`8082da8a 4c0bc8          or      r9,rax
fffff80d`8082da8d 488b442440      mov     rax,qword ptr [rsp+40h]
fffff80d`8082da92 4889442430      mov     qword ptr [rsp+30h],rax
fffff80d`8082da97 4889742428      mov     qword ptr [rsp+28h],rsi
fffff80d`8082da9c 4889742420      mov     qword ptr [rsp+20h],rsi
fffff80d`8082daa1 e84e4bfdff      call    storport!DbgLogRequest (fffff80d`808025f4)
fffff80d`8082daa6 90              nop
fffff80d`8082daa7 e94f99fdff      jmp     storport!RaUnitScsiIrp+0x1db (fffff80d`808073fb)  Branch

storport!RaUnitScsiIrp+0x2688c:
fffff80d`8082daac 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082dab0 0f82a199fdff    jb      storport!RaUnitScsiIrp+0x237 (fffff80d`80807457)  Branch

storport!RaUnitScsiIrp+0x26896:
fffff80d`8082dab6 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082daba 4c8d051f810200  lea     r8,[storport!WPP_d6831b3a5b933a01bb909582e3b1c70f_Traceguids (fffff80d`80855be0)]
fffff80d`8082dac1 ba16000000      mov     edx,16h
fffff80d`8082dac6 c744242803010000 mov     dword ptr [rsp+28h],103h
fffff80d`8082dace 4c8bcd          mov     r9,rbp
fffff80d`8082dad1 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80d`8082dad6 e89dde0000      call    storport!WPP_SF_qqD (fffff80d`8083b978)
fffff80d`8082dadb 90              nop
fffff80d`8082dadc e97699fdff      jmp     storport!RaUnitScsiIrp+0x237 (fffff80d`80807457)  Branch

storport!RaUnitScsiIrp+0x26993:
fffff80d`8082dbb3 498bd5          mov     rdx,r13
fffff80d`8082dbb6 e8ad770400      call    storport!RaUnitUnknownSrb (fffff80d`80875368)
fffff80d`8082dbbb 8bd8            mov     ebx,eax
fffff80d`8082dbbd e90899fdff      jmp     storport!RaUnitScsiIrp+0x2aa (fffff80d`808074ca)  Branch

storport!RaUnitScsiIrp+0x269a2:
fffff80d`8082dbc2 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082dbc6 0f821c99fdff    jb      storport!RaUnitScsiIrp+0x2c8 (fffff80d`808074e8)  Branch

storport!RaUnitScsiIrp+0x269ac:
fffff80d`8082dbcc 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082dbd0 4c8d0509800200  lea     r8,[storport!WPP_d6831b3a5b933a01bb909582e3b1c70f_Traceguids (fffff80d`80855be0)]
fffff80d`8082dbd7 ba17000000      mov     edx,17h
fffff80d`8082dbdc 895c2428        mov     dword ptr [rsp+28h],ebx
fffff80d`8082dbe0 4c8bcd          mov     r9,rbp
fffff80d`8082dbe3 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80d`8082dbe8 e88bdd0000      call    storport!WPP_SF_qqD (fffff80d`8083b978)
fffff80d`8082dbed 90              nop
fffff80d`8082dbee e9f598fdff      jmp     storport!RaUnitScsiIrp+0x2c8 (fffff80d`808074e8)  Branch
