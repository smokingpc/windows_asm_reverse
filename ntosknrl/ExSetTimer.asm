0: kd> dt NT!_KTIMER2
   +0x000 Header           : _DISPATCHER_HEADER
   +0x018 RbNodes          : [2] _RTL_BALANCED_NODE
   +0x018 ListEntry        : _LIST_ENTRY
   +0x048 DueTime          : [2] Uint8B
   +0x058 Period           : Int8B
   +0x060 Callback         : Ptr64     void 
   +0x068 CallbackContext  : Ptr64 Void
   +0x070 DisableCallback  : Ptr64     void 
   +0x078 DisableContext   : Ptr64 Void
   +0x080 AbsoluteSystemTime : UChar
   +0x081 TypeFlags        : UChar
   +0x081 Unused           : Pos 0, 1 Bit
   +0x081 IdleResilient    : Pos 1, 1 Bit
   +0x081 HighResolution   : Pos 2, 1 Bit
   +0x081 NoWake           : Pos 3, 1 Bit
   +0x081 PseudoHighRes    : Pos 4, 1 Bit
   +0x081 AusterityResilient : Pos 5, 1 Bit
   +0x081 Unused1          : Pos 6, 2 Bits
   +0x082 CollectionIndex  : [2] UChar

0: kd> dt _EXT_SET_PARAMETERS_V0
nt!_EXT_SET_PARAMETERS_V0
   +0x000 Version          : Uint4B
   +0x004 Reserved         : Uint4B
   +0x008 NoWakeTolerance  : Int8B


;BOOLEAN ExSetTimer(
;  [in]           PEX_TIMER           Timer,
;  [in]           LONGLONG            DueTime,
;  [in]           LONGLONG            Period,
;  [in, optional] PEXT_SET_PARAMETERS Parameters);

0: kd> uf exsettimer
nt!ExSetTimer:
fffff806`7913e310 4883ec48        sub     rsp,48h
fffff806`7913e314 4533d2          xor     r10d,r10d
fffff806`7913e317 4885d2          test    rdx,rdx       ;if DueTime > 0, goto 0x77
fffff806`7913e31a 7f6b            jg      nt!ExSetTimer+0x77 (fffff806`7913e387)  Branch

nt!ExSetTimer+0xc:
fffff806`7913e31c 4d85c0          test    r8,r8     ;if Period >= 0, goto 0x34
fffff806`7913e31f 7923            jns     nt!ExSetTimer+0x34 (fffff806`7913e344)  Branch

nt!ExSetTimer+0x11:                                 ;if both DueTime and Period are zero, BugCheck(0xC7)
fffff806`7913e321 ba09000000      mov     edx,9
fffff806`7913e326 4c89442430      mov     qword ptr [rsp+30h],r8
fffff806`7913e32b 4c8d4c2430      lea     r9,[rsp+30h]
fffff806`7913e330 4c89542420      mov     qword ptr [rsp+20h],r10
fffff806`7913e335 b9c7000000      mov     ecx,0C7h
fffff806`7913e33a 448d42fb        lea     r8d,[rdx-5]
fffff806`7913e33e e8bda71700      call    nt!KeBugCheckEx (fffff806`792b8b00)
fffff806`7913e343 cc              int     3

nt!ExSetTimer+0x34:
fffff806`7913e344 4d85c9          test    r9,r9     ;if no Parameters, goto 0x5e
fffff806`7913e347 7425            je      nt!ExSetTimer+0x5e (fffff806`7913e36e)  Branch

nt!ExSetTimer+0x39:
fffff806`7913e349 453911          cmp     dword ptr [r9],r10d   ;if Parameters->Version != 0 , goto 0x45 BugCheck(0xC7)
fffff806`7913e34c 7507            jne     nt!ExSetTimer+0x45 (fffff806`7913e355)  Branch

nt!ExSetTimer+0x3e:
fffff806`7913e34e 49837908ff      cmp     qword ptr [r9+8],0FFFFFFFFFFFFFFFFh   ;if Parameters->NoWakeTolerance >= EX_TIMER_UNLIMITED_TOLERANCE, goto 0x5e
fffff806`7913e353 7d19            jge     nt!ExSetTimer+0x5e (fffff806`7913e36e)  Branch    ;if Parameters->NoWakeTolerance < -1, BugCheck(0xC7)

nt!ExSetTimer+0x45:
fffff806`7913e355 ba09000000      mov     edx,9
fffff806`7913e35a 4c89542420      mov     qword ptr [rsp+20h],r10
fffff806`7913e35f b9c7000000      mov     ecx,0C7h
fffff806`7913e364 448d42f8        lea     r8d,[rdx-8]
fffff806`7913e368 e893a71700      call    nt!KeBugCheckEx (fffff806`792b8b00)
fffff806`7913e36d cc              int     3

nt!ExSetTimer+0x5e:
fffff806`7913e36e 8a057367c800    mov     al,byte ptr [nt!ExpTimerFreedCookie (fffff806`79dc4ae7)]
fffff806`7913e374 388198000000    cmp     byte ptr [rcx+98h],al
fffff806`7913e37a 7537            jne     nt!ExSetTimer+0xa3 (fffff806`7913e3b3)  Branch

nt!ExSetTimer+0x6c:
fffff806`7913e37c e86f000000      call    nt!KeSetTimer2 (fffff806`7913e3f0)
fffff806`7913e381 4883c448        add     rsp,48h
fffff806`7913e385 c3              ret

nt!ExSetTimer+0x77:
fffff806`7913e387 f6818100000004  test    byte ptr [rcx+81h],4      ;if(!timer->HighResolution), goto 0x0C
fffff806`7913e38e 748c            je      nt!ExSetTimer+0xc (fffff806`7913e31c)  Branch

nt!ExSetTimer+0x80:
fffff806`7913e390 4889542458      mov     qword ptr [rsp+58h],rdx
fffff806`7913e395 4c8d4c2458      lea     r9,[rsp+58h]
fffff806`7913e39a ba09000000      mov     edx,9
fffff806`7913e39f 4c89542420      mov     qword ptr [rsp+20h],r10
fffff806`7913e3a4 b9c7000000      mov     ecx,0C7h
fffff806`7913e3a9 448d42f9        lea     r8d,[rdx-7]
fffff806`7913e3ad e84ea71700      call    nt!KeBugCheckEx (fffff806`792b8b00)
fffff806`7913e3b2 cc              int     3

nt!ExSetTimer+0xa3:
fffff806`7913e3b3 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff806`7913e3bc 488bd1          mov     rdx,rcx
fffff806`7913e3bf 41b801000000    mov     r8d,1
fffff806`7913e3c5 4c89542420      mov     qword ptr [rsp+20h],r10
fffff806`7913e3ca b9c6000000      mov     ecx,0C6h
fffff806`7913e3cf 4c0fbe8832020000 movsx   r9,byte ptr [rax+232h]
fffff806`7913e3d7 e824a71700      call    nt!KeBugCheckEx (fffff806`792b8b00)
fffff806`7913e3dc cc              int     3
fffff806`7913e3dd cc              int     3
fffff806`7913e3de cc              int     3
fffff806`7913e3df cc              int     3
fffff806`7913e3e0 cc              int     3
fffff806`7913e3e1 cc              int     3
fffff806`7913e3e2 cc              int     3
fffff806`7913e3e3 cc              int     3
fffff806`7913e3e4 cc              int     3
fffff806`7913e3e5 cc              int     3
fffff806`7913e3e6 cc              int     3
fffff806`7913e3e7 cc              int     3
fffff806`7913e3e8 cc              int     3
fffff806`7913e3e9 cc              int     3
fffff806`7913e3ea cc              int     3
fffff806`7913e3eb cc              int     3
fffff806`7913e3ec cc              int     3
fffff806`7913e3ed cc              int     3
fffff806`7913e3ee cc              int     3
fffff806`7913e3ef cc              int     3
fffff806`7913e3f0 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff806`7913e3f5 55              push    rbp
fffff806`7913e3f6 56              push    rsi
fffff806`7913e3f7 57              push    rdi
fffff806`7913e3f8 4154            push    r12
fffff806`7913e3fa 4155            push    r13
fffff806`7913e3fc 4156            push    r14
fffff806`7913e3fe 4157            push    r15
fffff806`7913e400 4883ec20        sub     rsp,20h
fffff806`7913e404 4d8bf9          mov     r15,r9
fffff806`7913e407 4d8be0          mov     r12,r8
fffff806`7913e40a 488bf2          mov     rsi,rdx
fffff806`7913e40d 488bf9          mov     rdi,rcx
fffff806`7913e410 4d85c0          test    r8,r8
fffff806`7913e413 0f859b030000    jne     nt!KeSetTimer2+0x3c4 (fffff806`7913e7b4)  Branch

nt!KeSetTimer2+0x29:
fffff806`7913e419 440fb6a981000000 movzx   r13d,byte ptr [rcx+81h]
fffff806`7913e421 440f20c5        mov     rbp,cr8
fffff806`7913e425 b802000000      mov     eax,2
fffff806`7913e42a 440f22c0        mov     cr8,rax
fffff806`7913e42e 833dd368c80000  cmp     dword ptr [nt!KiIrqlFlags (fffff806`79dc4d08)],0
fffff806`7913e435 0f8560030000    jne     nt!KeSetTimer2+0x3ab (fffff806`7913e79b)  Branch

nt!KeSetTimer2+0x4b:
fffff806`7913e43b c644246000      mov     byte ptr [rsp+60h],0
fffff806`7913e440 4885f6          test    rsi,rsi
fffff806`7913e443 0f8f23030000    jg      nt!KeSetTimer2+0x37c (fffff806`7913e76c)  Branch

nt!KeSetTimer2+0x59:
fffff806`7913e449 48b80800000080f7ffff mov rax,0FFFFF78000000008h
fffff806`7913e453 41f6c504        test    r13b,4
fffff806`7913e457 0f850f020000    jne     nt!KeSetTimer2+0x27c (fffff806`7913e66c)  Branch

nt!KeSetTimer2+0x6d:
fffff806`7913e45d 488b00          mov     rax,qword ptr [rax]

nt!KeSetTimer2+0x70:
fffff806`7913e460 488bd8          mov     rbx,rax
fffff806`7913e463 482bde          sub     rbx,rsi
fffff806`7913e466 483bd8          cmp     rbx,rax
fffff806`7913e469 0f82f1010000    jb      nt!KeSetTimer2+0x270 (fffff806`7913e660)  Branch

nt!KeSetTimer2+0x7f:
fffff806`7913e46f 4883fbff        cmp     rbx,0FFFFFFFFFFFFFFFFh
fffff806`7913e473 0f84e7010000    je      nt!KeSetTimer2+0x270 (fffff806`7913e660)  Branch

nt!KeSetTimer2+0x89:
fffff806`7913e479 4c8bf3          mov     r14,rbx
fffff806`7913e47c 4d85ff          test    r15,r15
fffff806`7913e47f 742e            je      nt!KeSetTimer2+0xbf (fffff806`7913e4af)  Branch

nt!KeSetTimer2+0x91:
fffff806`7913e481 80bf8200000017  cmp     byte ptr [rdi+82h],17h
fffff806`7913e488 7425            je      nt!KeSetTimer2+0xbf (fffff806`7913e4af)  Branch

nt!KeSetTimer2+0x9a:
fffff806`7913e48a 498b4708        mov     rax,qword ptr [r15+8]
fffff806`7913e48e 4883f8ff        cmp     rax,0FFFFFFFFFFFFFFFFh
fffff806`7913e492 0f8419020000    je      nt!KeSetTimer2+0x2c1 (fffff806`7913e6b1)  Branch

nt!KeSetTimer2+0xa8:
fffff806`7913e498 4c8d3418        lea     r14,[rax+rbx]
fffff806`7913e49c 4c3bf3          cmp     r14,rbx
fffff806`7913e49f 0f8218020000    jb      nt!KeSetTimer2+0x2cd (fffff806`7913e6bd)  Branch

nt!KeSetTimer2+0xb5:
fffff806`7913e4a5 4983feff        cmp     r14,0FFFFFFFFFFFFFFFFh
fffff806`7913e4a9 0f840e020000    je      nt!KeSetTimer2+0x2cd (fffff806`7913e6bd)  Branch

nt!KeSetTimer2+0xbf:
fffff806`7913e4af 4032f6          xor     sil,sil
fffff806`7913e4b2 488bcf          mov     rcx,rdi
fffff806`7913e4b5 4088742468      mov     byte ptr [rsp+68h],sil
fffff806`7913e4ba 41bf01000000    mov     r15d,1
fffff806`7913e4c0 e88b030000      call    nt!KiAcquireTimer2LockUnlessDisabled (fffff806`7913e850)
fffff806`7913e4c5 84c0            test    al,al
fffff806`7913e4c7 0f855b010000    jne     nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0xdd:
fffff806`7913e4cd 488bcf          mov     rcx,rdi
fffff806`7913e4d0 e84f070000      call    nt!KiAcquireTimer2CollectionLockIfInserted (fffff806`7913ec24)
fffff806`7913e4d5 84c0            test    al,al
fffff806`7913e4d7 0f84af010000    je      nt!KeSetTimer2+0x29c (fffff806`7913e68c)  Branch

nt!KeSetTimer2+0xed:
fffff806`7913e4dd 488bcf          mov     rcx,rdi
fffff806`7913e4e0 e83beeffff      call    nt!KiRemoveTimer2 (fffff806`7913d320)
fffff806`7913e4e5 488d0d14f1c800  lea     rcx,[nt!KiTimer2CollectionLock (fffff806`79dcd600)]
fffff806`7913e4ec e81f3bf5ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff806`79092010)
fffff806`7913e4f1 410fb6f7        movzx   esi,r15b

nt!KeSetTimer2+0x105:
fffff806`7913e4f5 0fb6442460      movzx   eax,byte ptr [rsp+60h]
fffff806`7913e4fa 48895f48        mov     qword ptr [rdi+48h],rbx
fffff806`7913e4fe 4c897750        mov     qword ptr [rdi+50h],r14
fffff806`7913e502 0fb69781000000  movzx   edx,byte ptr [rdi+81h]
fffff806`7913e509 888780000000    mov     byte ptr [rdi+80h],al
fffff806`7913e50f c7470400000000  mov     dword ptr [rdi+4],0
fffff806`7913e516 4c896758        mov     qword ptr [rdi+58h],r12
fffff806`7913e51a 833d1f67c80000  cmp     dword ptr [nt!KiGlobalTimerResolutionRequests (fffff806`79dc4c40)],0
fffff806`7913e521 0f85b3010000    jne     nt!KeSetTimer2+0x2ea (fffff806`7913e6da)  Branch

nt!KeSetTimer2+0x137:
fffff806`7913e527 f6c22e          test    dl,2Eh
fffff806`7913e52a 0f84eb010000    je      nt!KeSetTimer2+0x32b (fffff806`7913e71b)  Branch

nt!KeSetTimer2+0x140:
fffff806`7913e530 c644246000      mov     byte ptr [rsp+60h],0
fffff806`7913e535 4183ff01        cmp     r15d,1
fffff806`7913e539 7531            jne     nt!KeSetTimer2+0x17c (fffff806`7913e56c)  Branch

nt!KeSetTimer2+0x14b:
fffff806`7913e53b f605c465c80021  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff806`79dc4b06)],21h
fffff806`7913e542 0f8592020000    jne     nt!KeSetTimer2+0x3ea (fffff806`7913e7da)  Branch

nt!KeSetTimer2+0x158:
fffff806`7913e548 f0480fba2daef0c80000 lock bts qword ptr [nt!KiTimer2CollectionLock (fffff806`79dcd600)],0
fffff806`7913e552 0f8203020000    jb      nt!KeSetTimer2+0x36b (fffff806`7913e75b)  Branch

nt!KeSetTimer2+0x168:
fffff806`7913e558 4c8d4c2460      lea     r9,[rsp+60h]
fffff806`7913e55d b201            mov     dl,1
fffff806`7913e55f 4c8d442468      lea     r8,[rsp+68h]
fffff806`7913e564 488bcf          mov     rcx,rdi
fffff806`7913e567 e864030000      call    nt!KiInsertTimer2WithCollectionLockHeld (fffff806`7913e8d0)

nt!KeSetTimer2+0x17c:
fffff806`7913e56c f7059265c80000000200 test dword ptr [nt!PerfGlobalGroupMask+0x8 (fffff806`79dc4b08)],20000h
fffff806`7913e576 458bc7          mov     r8d,r15d
fffff806`7913e579 0f854a010000    jne     nt!KeSetTimer2+0x2d9 (fffff806`7913e6c9)  Branch

nt!KeSetTimer2+0x18f:
fffff806`7913e57f 8b17            mov     edx,dword ptr [rdi]
fffff806`7913e581 8bca            mov     ecx,edx
fffff806`7913e583 81e17ff0ffff    and     ecx,0FFFFF07Fh
fffff806`7913e589 41c1e008        shl     r8d,8
fffff806`7913e58d 410bc8          or      ecx,r8d
fffff806`7913e590 8bc2            mov     eax,edx
fffff806`7913e592 f00fb10f        lock cmpxchg dword ptr [rdi],ecx
fffff806`7913e596 3bd0            cmp     edx,eax
fffff806`7913e598 7415            je      nt!KeSetTimer2+0x1bf (fffff806`7913e5af)  Branch

nt!KeSetTimer2+0x1aa:
fffff806`7913e59a 8bc8            mov     ecx,eax
fffff806`7913e59c 8bd0            mov     edx,eax
fffff806`7913e59e 81e17ff0ffff    and     ecx,0FFFFF07Fh
fffff806`7913e5a4 410bc8          or      ecx,r8d
fffff806`7913e5a7 f00fb10f        lock cmpxchg dword ptr [rdi],ecx
fffff806`7913e5ab 3bd0            cmp     edx,eax
fffff806`7913e5ad 75eb            jne     nt!KeSetTimer2+0x1aa (fffff806`7913e59a)  Branch

nt!KeSetTimer2+0x1bf:
fffff806`7913e5af 4183ff01        cmp     r15d,1
fffff806`7913e5b3 7516            jne     nt!KeSetTimer2+0x1db (fffff806`7913e5cb)  Branch

nt!KeSetTimer2+0x1c5:
fffff806`7913e5b5 44843d4a65c800  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff806`79dc4b06)],r15b
fffff806`7913e5bc 0f8537020000    jne     nt!KeSetTimer2+0x409 (fffff806`7913e7f9)  Branch

nt!KeSetTimer2+0x1d2:
fffff806`7913e5c2 f048832535f0c80000 lock and qword ptr [nt!KiTimer2CollectionLock (fffff806`79dcd600)],0

nt!KeSetTimer2+0x1db:
fffff806`7913e5cb 807c246000      cmp     byte ptr [rsp+60h],0
fffff806`7913e5d0 0f8547020000    jne     nt!KeSetTimer2+0x42d (fffff806`7913e81d)  Branch

nt!KeSetTimer2+0x1e6:
fffff806`7913e5d6 833dfb69c80000  cmp     dword ptr [nt!KiForceIdleDisabled (fffff806`79dc4fd8)],0
fffff806`7913e5dd 0f8498000000    je      nt!KeSetTimer2+0x28b (fffff806`7913e67b)  Branch

nt!KeSetTimer2+0x1f3:
fffff806`7913e5e3 807c246800      cmp     byte ptr [rsp+68h],0
fffff806`7913e5e8 0f85d8010000    jne     nt!KeSetTimer2+0x3d6 (fffff806`7913e7c6)  Branch

nt!KeSetTimer2+0x1fe:
fffff806`7913e5ee 41f6c504        test    r13b,4
fffff806`7913e5f2 7434            je      nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0x204:
fffff806`7913e5f4 48b80800000080f7ffff mov rax,0FFFFF78000000008h
fffff806`7913e5fe 488b00          mov     rax,qword ptr [rax]
fffff806`7913e601 8b0d9964c800    mov     ecx,dword ptr [nt!KeMaximumIncrement (fffff806`79dc4aa0)]
fffff806`7913e607 4803c8          add     rcx,rax
fffff806`7913e60a 483bd9          cmp     rbx,rcx
fffff806`7913e60d 7319            jae     nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0x21f:
fffff806`7913e60f 488b0d3a1dbe00  mov     rcx,qword ptr [nt!KiClockOwnerOneShotRequest (fffff806`79d20350)]
fffff806`7913e616 4885c9          test    rcx,rcx
fffff806`7913e619 0f84ec000000    je      nt!KeSetTimer2+0x31b (fffff806`7913e70b)  Branch

nt!KeSetTimer2+0x22f:
fffff806`7913e61f 483bd9          cmp     rbx,rcx
fffff806`7913e622 0f82d1000000    jb      nt!KeSetTimer2+0x309 (fffff806`7913e6f9)  Branch

nt!KeSetTimer2+0x238:
fffff806`7913e628 833dd966c80000  cmp     dword ptr [nt!KiIrqlFlags (fffff806`79dc4d08)],0
fffff806`7913e62f 740d            je      nt!KeSetTimer2+0x24e (fffff806`7913e63e)  Branch

nt!KeSetTimer2+0x241:
fffff806`7913e631 440f20c1        mov     rcx,cr8
fffff806`7913e635 400fb6d5        movzx   edx,bpl
fffff806`7913e639 e8563e1700      call    nt!KiLowerIrqlProcessIrqlFlags (fffff806`792b2494)

nt!KeSetTimer2+0x24e:
fffff806`7913e63e 400fb6cd        movzx   ecx,bpl
fffff806`7913e642 440f22c1        mov     cr8,rcx
fffff806`7913e646 488b5c2478      mov     rbx,qword ptr [rsp+78h]
fffff806`7913e64b 400fb6c6        movzx   eax,sil
fffff806`7913e64f 4883c420        add     rsp,20h
fffff806`7913e653 415f            pop     r15
fffff806`7913e655 415e            pop     r14
fffff806`7913e657 415d            pop     r13
fffff806`7913e659 415c            pop     r12
fffff806`7913e65b 5f              pop     rdi
fffff806`7913e65c 5e              pop     rsi
fffff806`7913e65d 5d              pop     rbp
fffff806`7913e65e c3              ret

nt!KeSetTimer2+0x270:
fffff806`7913e660 48c7c3feffffff  mov     rbx,0FFFFFFFFFFFFFFFEh
fffff806`7913e667 e90dfeffff      jmp     nt!KeSetTimer2+0x89 (fffff806`7913e479)  Branch

nt!KeSetTimer2+0x27c:
fffff806`7913e66c 488d4c2470      lea     rcx,[rsp+70h]
fffff806`7913e671 e83a6aeeff      call    nt!RtlGetInterruptTimePrecise (fffff806`790250b0)
fffff806`7913e676 e9e5fdffff      jmp     nt!KeSetTimer2+0x70 (fffff806`7913e460)  Branch

nt!KeSetTimer2+0x28b:
fffff806`7913e67b 8b055f2ebe00    mov     eax,dword ptr [nt!KiForceIdleState (fffff806`79d214e0)]
fffff806`7913e681 83f804          cmp     eax,4
fffff806`7913e684 0f8559ffffff    jne     nt!KeSetTimer2+0x1f3 (fffff806`7913e5e3)  Branch

nt!KeSetTimer2+0x29a:
fffff806`7913e68a eb9c            jmp     nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0x29c:
fffff806`7913e68c 0fb64701        movzx   eax,byte ptr [rdi+1]
fffff806`7913e690 a80f            test    al,0Fh
fffff806`7913e692 0f845dfeffff    je      nt!KeSetTimer2+0x105 (fffff806`7913e4f5)  Branch

nt!KeSetTimer2+0x2a8:
fffff806`7913e698 a804            test    al,4
fffff806`7913e69a 400fb6f6        movzx   esi,sil
fffff806`7913e69e b801000000      mov     eax,1
fffff806`7913e6a3 41bf08000000    mov     r15d,8
fffff806`7913e6a9 0f44f0          cmove   esi,eax
fffff806`7913e6ac e944feffff      jmp     nt!KeSetTimer2+0x105 (fffff806`7913e4f5)  Branch

nt!KeSetTimer2+0x2c1:
fffff806`7913e6b1 49c7c6ffffffff  mov     r14,0FFFFFFFFFFFFFFFFh
fffff806`7913e6b8 e9f2fdffff      jmp     nt!KeSetTimer2+0xbf (fffff806`7913e4af)  Branch

nt!KeSetTimer2+0x2cd:
fffff806`7913e6bd 49c7c6feffffff  mov     r14,0FFFFFFFFFFFFFFFEh
fffff806`7913e6c4 e9e6fdffff      jmp     nt!KeSetTimer2+0xbf (fffff806`7913e4af)  Branch

nt!KeSetTimer2+0x2d9:
fffff806`7913e6c9 400fb6d6        movzx   edx,sil
fffff806`7913e6cd 488bcf          mov     rcx,rdi
fffff806`7913e6d0 e8efe0ffff      call    nt!KiTraceSetTimer2 (fffff806`7913c7c4)
fffff806`7913e6d5 e9f1feffff      jmp     nt!KeSetTimer2+0x1db (fffff806`7913e5cb)  Branch

nt!KeSetTimer2+0x2ea:
fffff806`7913e6da f6c210          test    dl,10h

nt!KeSetTimer2+0x2ed:
fffff806`7913e6dd 0f854dfeffff    jne     nt!KeSetTimer2+0x140 (fffff806`7913e530)  Branch

nt!KeSetTimer2+0x2f3:
fffff806`7913e6e3 80ca10          or      dl,10h
fffff806`7913e6e6 488bcf          mov     rcx,rdi
fffff806`7913e6e9 889781000000    mov     byte ptr [rdi+81h],dl
fffff806`7913e6ef e844dbffff      call    nt!KiUpdateTimer2Collections (fffff806`7913c238)
fffff806`7913e6f4 e937feffff      jmp     nt!KeSetTimer2+0x140 (fffff806`7913e530)  Branch

nt!KeSetTimer2+0x309:
fffff806`7913e6f9 8b054164c800    mov     eax,dword ptr [nt!KeMinimumIncrement (fffff806`79dc4b40)]
fffff806`7913e6ff 482bcb          sub     rcx,rbx
fffff806`7913e702 483bc8          cmp     rcx,rax
fffff806`7913e705 0f861dffffff    jbe     nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0x31b:
fffff806`7913e70b 8b0da31bbe00    mov     ecx,dword ptr [nt!KiClockTimerOwner (fffff806`79d202b4)]
fffff806`7913e711 e8d22bf7ff      call    nt!KiSendClockInterruptToTargetProcessor (fffff806`790b12e8)
fffff806`7913e716 e90dffffff      jmp     nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0x32b:
fffff806`7913e71b 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff806`7913e724 440fb6c2        movzx   r8d,dl
fffff806`7913e728 4180e010        and     r8b,10h
fffff806`7913e72c 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff806`7913e733 e8e8dbffff      call    nt!PsTimerResolutionActive (fffff806`7913c320)
fffff806`7913e738 84c0            test    al,al
fffff806`7913e73a 7570            jne     nt!KeSetTimer2+0x3bc (fffff806`7913e7ac)  Branch

nt!KeSetTimer2+0x34c:
fffff806`7913e73c 4584c0          test    r8b,r8b
fffff806`7913e73f 0f84ebfdffff    je      nt!KeSetTimer2+0x140 (fffff806`7913e530)  Branch

nt!KeSetTimer2+0x355:
fffff806`7913e745 80e2ef          and     dl,0EFh
fffff806`7913e748 488bcf          mov     rcx,rdi
fffff806`7913e74b 889781000000    mov     byte ptr [rdi+81h],dl
fffff806`7913e751 e8e2daffff      call    nt!KiUpdateTimer2Collections (fffff806`7913c238)
fffff806`7913e756 e9d5fdffff      jmp     nt!KeSetTimer2+0x140 (fffff806`7913e530)  Branch

nt!KeSetTimer2+0x36b:
fffff806`7913e75b 488d0d9eeec800  lea     rcx,[nt!KiTimer2CollectionLock (fffff806`79dcd600)]
fffff806`7913e762 e899a9ecff      call    nt!KxWaitForSpinLockAndAcquire (fffff806`79009100)
fffff806`7913e767 e9ecfdffff      jmp     nt!KeSetTimer2+0x168 (fffff806`7913e558)  Branch

nt!KeSetTimer2+0x37c:
fffff806`7913e76c c644246001      mov     byte ptr [rsp+60h],1
fffff806`7913e771 41f6c504        test    r13b,4
fffff806`7913e775 7559            jne     nt!KeSetTimer2+0x3e0 (fffff806`7913e7d0)  Branch

nt!KeSetTimer2+0x387:
fffff806`7913e777 48ba1400000080f7ffff mov rdx,0FFFFF78000000014h
fffff806`7913e781 488b12          mov     rdx,qword ptr [rdx]

nt!KeSetTimer2+0x394:
fffff806`7913e784 33c0            xor     eax,eax
fffff806`7913e786 488bca          mov     rcx,rdx
fffff806`7913e789 482bce          sub     rcx,rsi
fffff806`7913e78c 483bf2          cmp     rsi,rdx
fffff806`7913e78f 480f4fc1        cmovg   rax,rcx
fffff806`7913e793 488bf0          mov     rsi,rax
fffff806`7913e796 e9aefcffff      jmp     nt!KeSetTimer2+0x59 (fffff806`7913e449)  Branch

nt!KeSetTimer2+0x3ab:
fffff806`7913e79b 0fb6d0          movzx   edx,al
fffff806`7913e79e 400fb6cd        movzx   ecx,bpl
fffff806`7913e7a2 e8dd461700      call    nt!KiRaiseIrqlProcessIrqlFlags (fffff806`792b2e84)
fffff806`7913e7a7 e98ffcffff      jmp     nt!KeSetTimer2+0x4b (fffff806`7913e43b)  Branch

nt!KeSetTimer2+0x3bc:
fffff806`7913e7ac 4584c0          test    r8b,r8b
fffff806`7913e7af e929ffffff      jmp     nt!KeSetTimer2+0x2ed (fffff806`7913e6dd)  Branch

nt!KeSetTimer2+0x3c4:
fffff806`7913e7b4 8b058663c800    mov     eax,dword ptr [nt!KeMinimumIncrement (fffff806`79dc4b40)]
fffff806`7913e7ba 4c3be0          cmp     r12,rax
fffff806`7913e7bd 4c0f4ce0        cmovl   r12,rax
fffff806`7913e7c1 e953fcffff      jmp     nt!KeSetTimer2+0x29 (fffff806`7913e419)  Branch

nt!KeSetTimer2+0x3d6:
fffff806`7913e7c6 e8715ff7ff      call    nt!KiRequestTimer2Expiration (fffff806`790b473c)
fffff806`7913e7cb e958feffff      jmp     nt!KeSetTimer2+0x238 (fffff806`7913e628)  Branch

nt!KeSetTimer2+0x3e0:
fffff806`7913e7d0 e8cb74faff      call    nt!RtlGetSystemTimePrecise (fffff806`790e5ca0)
fffff806`7913e7d5 488bd0          mov     rdx,rax
fffff806`7913e7d8 ebaa            jmp     nt!KeSetTimer2+0x394 (fffff806`7913e784)  Branch

nt!KeSetTimer2+0x3ea:
fffff806`7913e7da 8b0590d7bc00    mov     eax,dword ptr [nt!PopHibernateInProgress (fffff806`79d0bf70)]
fffff806`7913e7e0 85c0            test    eax,eax
fffff806`7913e7e2 0f8560fdffff    jne     nt!KeSetTimer2+0x158 (fffff806`7913e548)  Branch

nt!KeSetTimer2+0x3f8:
fffff806`7913e7e8 488d0d11eec800  lea     rcx,[nt!KiTimer2CollectionLock (fffff806`79dcd600)]
fffff806`7913e7ef e85c801400      call    nt!KiAcquireSpinLockInstrumented (fffff806`79286850)
fffff806`7913e7f4 e95ffdffff      jmp     nt!KeSetTimer2+0x168 (fffff806`7913e558)  Branch

nt!KeSetTimer2+0x409:
fffff806`7913e7f9 8b0571d7bc00    mov     eax,dword ptr [nt!PopHibernateInProgress (fffff806`79d0bf70)]
fffff806`7913e7ff 85c0            test    eax,eax
fffff806`7913e801 0f85bbfdffff    jne     nt!KeSetTimer2+0x1d2 (fffff806`7913e5c2)  Branch

nt!KeSetTimer2+0x417:
fffff806`7913e807 488b542458      mov     rdx,qword ptr [rsp+58h]
fffff806`7913e80c 488d0dededc800  lea     rcx,[nt!KiTimer2CollectionLock (fffff806`79dcd600)]
fffff806`7913e813 e818ad1300      call    nt!KiReleaseSpinLockInstrumented (fffff806`79279530)
fffff806`7913e818 e9aefdffff      jmp     nt!KeSetTimer2+0x1db (fffff806`7913e5cb)  Branch

nt!KeSetTimer2+0x42d:
fffff806`7913e81d 8b05911abe00    mov     eax,dword ptr [nt!KiClockTimerOwner (fffff806`79d202b4)]
fffff806`7913e823 488d15d683c800  lea     rdx,[nt!KiProcessorBlock (fffff806`79dc6c00)]
fffff806`7913e82a 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff806`7913e833 448b052648c800  mov     r8d,dword ptr [nt!KiVpThreadSystemWorkPriority (fffff806`79dc3060)]
fffff806`7913e83a 488b14c2        mov     rdx,qword ptr [rdx+rax*8]
fffff806`7913e83e e80d3ef1ff      call    nt!KiHvEnlightenedGuestPriorityKick (fffff806`79052650)
fffff806`7913e843 e98efdffff      jmp     nt!KeSetTimer2+0x1e6 (fffff806`7913e5d6)  Branch
