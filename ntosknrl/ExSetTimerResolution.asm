24: kd> uf ExSetTimerResolution
nt!ExSetTimerResolution:
fffff805`34dd13a0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff805`34dd13a5 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff805`34dd13aa 56              push    rsi
fffff805`34dd13ab 57              push    rdi
fffff805`34dd13ac 4156            push    r14
fffff805`34dd13ae 4883ec20        sub     rsp,20h
fffff805`34dd13b2 8ac2            mov     al,dl
fffff805`34dd13b4 8bf1            mov     esi,ecx
fffff805`34dd13b6 f6d8            neg     al
fffff805`34dd13b8 448af2          mov     r14b,dl
fffff805`34dd13bb ba45535452      mov     edx,52545345h
fffff805`34dd13c0 1bc9            sbb     ecx,ecx
fffff805`34dd13c2 23ce            and     ecx,esi
fffff805`34dd13c4 e8b385ddff      call    nt!PoTraceSystemTimerResolutionKernel (fffff805`34ba997c)
fffff805`34dd13c9 488d0dd8070f00  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34dd13d0 e8db29e0ff      call    nt!KeAcquireSpinLockRaiseToDpc (fffff805`34bd3db0)
fffff805`34dd13d5 8b2d3d8f2200    mov     ebp,dword ptr [nt!KeTimeIncrement (fffff805`34ffa318)]
fffff805`34dd13db 33db            xor     ebx,ebx
fffff805`34dd13dd 88442448        mov     byte ptr [rsp+48h],al
fffff805`34dd13e1 408af8          mov     dil,al
fffff805`34dd13e4 4584f6          test    r14b,r14b
fffff805`34dd13e7 7517            jne     nt!ExSetTimerResolution+0x60 (fffff805`34dd1400)  Branch

nt!ExSetTimerResolution+0x49:
fffff805`34dd13e9 8b0dc1070f00    mov     ecx,dword ptr [nt!ExpKernelResolutionCount (fffff805`34ec1bb0)]
fffff805`34dd13ef 85c9            test    ecx,ecx
fffff805`34dd13f1 7428            je      nt!ExSetTimerResolution+0x7b (fffff805`34dd141b)  Branch

nt!ExSetTimerResolution+0x53:
fffff805`34dd13f3 83c1ff          add     ecx,0FFFFFFFFh
fffff805`34dd13f6 890db4070f00    mov     dword ptr [nt!ExpKernelResolutionCount (fffff805`34ec1bb0)],ecx
fffff805`34dd13fc 751d            jne     nt!ExSetTimerResolution+0x7b (fffff805`34dd141b)  Branch

nt!ExSetTimerResolution+0x5e:
fffff805`34dd13fe eb70            jmp     nt!ExSetTimerResolution+0xd0 (fffff805`34dd1470)  Branch

nt!ExSetTimerResolution+0x60:
fffff805`34dd1400 8b05aa070f00    mov     eax,dword ptr [nt!ExpKernelResolutionCount (fffff805`34ec1bb0)]
fffff805`34dd1406 ffc0            inc     eax
fffff805`34dd1408 8905a2070f00    mov     dword ptr [nt!ExpKernelResolutionCount (fffff805`34ec1bb0)],eax
fffff805`34dd140e 83f801          cmp     eax,1
fffff805`34dd1411 745b            je      nt!ExSetTimerResolution+0xce (fffff805`34dd146e)  Branch

nt!ExSetTimerResolution+0x73:
fffff805`34dd1413 3b359b070f00    cmp     esi,dword ptr [nt!ExpKernelRequestedTimerResolution (fffff805`34ec1bb4)]
fffff805`34dd1419 7253            jb      nt!ExSetTimerResolution+0xce (fffff805`34dd146e)  Branch

nt!ExSetTimerResolution+0x7b:
fffff805`34dd141b 488d0d86070f00  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34dd1422 e8f9f7d4ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff805`34b20c20)
fffff805`34dd1427 8b05b3902200    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`34ffa4e0)]
fffff805`34dd142d 85c0            test    eax,eax
fffff805`34dd142f 7433            je      nt!ExSetTimerResolution+0xc4 (fffff805`34dd1464)  Branch

nt!ExSetTimerResolution+0x91:
fffff805`34dd1431 a801            test    al,1
fffff805`34dd1433 742f            je      nt!ExSetTimerResolution+0xc4 (fffff805`34dd1464)  Branch

nt!ExSetTimerResolution+0x95:
fffff805`34dd1435 440f20c0        mov     rax,tmm
fffff805`34dd1439 3c02            cmp     al,2
fffff805`34dd143b 7227            jb      nt!ExSetTimerResolution+0xc4 (fffff805`34dd1464)  Branch

nt!ExSetTimerResolution+0x9d:
fffff805`34dd143d 4080ff02        cmp     dil,2
fffff805`34dd1441 7321            jae     nt!ExSetTimerResolution+0xc4 (fffff805`34dd1464)  Branch

nt!ExSetTimerResolution+0xa3:
fffff805`34dd1443 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff805`34dd144c 488b81b8610000  mov     rax,qword ptr [rcx+61B8h]
fffff805`34dd1453 f08120fffffeff  lock and dword ptr [rax],0FFFEFFFFh
fffff805`34dd145a e80197e9ff      call    nt!KiRemoveSystemWorkPriorityKick (fffff805`34c6ab60)
fffff805`34dd145f 408a7c2448      mov     dil,byte ptr [rsp+48h]

nt!ExSetTimerResolution+0xc4:
fffff805`34dd1464 400fb6c7        movzx   eax,dil
fffff805`34dd1468 440f22c0        mov     tmm,rax
fffff805`34dd146c eb19            jmp     nt!ExSetTimerResolution+0xe7 (fffff805`34dd1487)  Branch

nt!ExSetTimerResolution+0xce:
fffff805`34dd146e 8bde            mov     ebx,esi

nt!ExSetTimerResolution+0xd0:
fffff805`34dd1470 4c8d442448      lea     r8,[rsp+48h]
fffff805`34dd1475 891d39070f00    mov     dword ptr [nt!ExpKernelRequestedTimerResolution (fffff805`34ec1bb4)],ebx
fffff805`34dd147b 8bd3            mov     edx,ebx
fffff805`34dd147d 418ace          mov     cl,r14b
fffff805`34dd1480 e8e79edeff      call    nt!ExpUpdateTimerResolution (fffff805`34bbb36c)
fffff805`34dd1485 8be8            mov     ebp,eax

nt!ExSetTimerResolution+0xe7:
fffff805`34dd1487 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff805`34dd148c 8bc5            mov     eax,ebp
fffff805`34dd148e 488b6c2450      mov     rbp,qword ptr [rsp+50h]
fffff805`34dd1493 4883c420        add     rsp,20h
fffff805`34dd1497 415e            pop     r14
fffff805`34dd1499 5f              pop     rdi
fffff805`34dd149a 5e              pop     rsi
fffff805`34dd149b c3              ret
