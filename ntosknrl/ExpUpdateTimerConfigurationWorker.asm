24: kd> uf ExpUpdateTimerConfigurationWorker
nt!ExpUpdateTimerConfigurationWorker:
fffff805`34ba96e0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff805`34ba96e5 4889742410      mov     qword ptr [rsp+10h],rsi
fffff805`34ba96ea 48897c2418      mov     qword ptr [rsp+18h],rdi
fffff805`34ba96ef 4157            push    r15
fffff805`34ba96f1 4883ec20        sub     rsp,20h
fffff805`34ba96f5 488d0dac843100  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34ba96fc 488bfa          mov     rdi,rdx
fffff805`34ba96ff e8aca60200      call    nt!KeAcquireSpinLockRaiseToDpc (fffff805`34bd3db0)
fffff805`34ba9704 408af0          mov     sil,al
fffff805`34ba9707 440f20c1        mov     rcx,tmm
fffff805`34ba970b 41bf0f000000    mov     r15d,0Fh
fffff805`34ba9711 450f22c7        mov     tmm,r15
fffff805`34ba9715 8b05c50d4500    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`34ffa4e0)]
fffff805`34ba971b 85c0            test    eax,eax
fffff805`34ba971d 0f8511d51300    jne     nt!ExpUpdateTimerConfigurationWorker+0x13d554 (fffff805`34ce6c34)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x43:
fffff805`34ba9723 83671800        and     dword ptr [rdi+18h],0
fffff805`34ba9727 48833f00        cmp     qword ptr [rdi],0
fffff805`34ba972b 756f            jne     nt!ExpUpdateTimerConfigurationWorker+0xbc (fffff805`34ba979c)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x4d:
fffff805`34ba972d 488d0d74843100  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34ba9734 e8e774f7ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff805`34b20c20)
fffff805`34ba9739 8b05a10d4500    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`34ffa4e0)]
fffff805`34ba973f 85c0            test    eax,eax
fffff805`34ba9741 0f851ad51300    jne     nt!ExpUpdateTimerConfigurationWorker+0x13d581 (fffff805`34ce6c61)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x67:
fffff805`34ba9747 450f22c7        mov     tmm,r15
fffff805`34ba974b 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff805`34ba974f 4885c9          test    rcx,rcx
fffff805`34ba9752 740b            je      nt!ExpUpdateTimerConfigurationWorker+0x7f (fffff805`34ba975f)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x74:
fffff805`34ba9754 488b09          mov     rcx,qword ptr [rcx]
fffff805`34ba9757 e814510700      call    nt!KeSetTimeAdjustment (fffff805`34c1e870)
fffff805`34ba975c 894718          mov     dword ptr [rdi+18h],eax

nt!ExpUpdateTimerConfigurationWorker+0x7f:
fffff805`34ba975f 488b4710        mov     rax,qword ptr [rdi+10h]
fffff805`34ba9763 4885c0          test    rax,rax
fffff805`34ba9766 7408            je      nt!ExpUpdateTimerConfigurationWorker+0x90 (fffff805`34ba9770)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x88:
fffff805`34ba9768 8a00            mov     al,byte ptr [rax]
fffff805`34ba976a 8805aaf84400    mov     byte ptr [nt!KeTimeSynchronization (fffff805`34ff901a)],al

nt!ExpUpdateTimerConfigurationWorker+0x90:
fffff805`34ba9770 8b056a0d4500    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`34ffa4e0)]
fffff805`34ba9776 85c0            test    eax,eax
fffff805`34ba9778 0f85f4d41300    jne     nt!ExpUpdateTimerConfigurationWorker+0x13d592 (fffff805`34ce6c72)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x9e:
fffff805`34ba977e 400fb6c6        movzx   eax,sil
fffff805`34ba9782 440f22c0        mov     tmm,rax
fffff805`34ba9786 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff805`34ba978b 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff805`34ba9790 488b7c2440      mov     rdi,qword ptr [rsp+40h]
fffff805`34ba9795 4883c420        add     rsp,20h
fffff805`34ba9799 415f            pop     r15
fffff805`34ba979b c3              ret

nt!ExpUpdateTimerConfigurationWorker+0xbc:
fffff805`34ba979c 8b0d46073100    mov     ecx,dword ptr [nt!ExpLastRequestedTime (fffff805`34eb9ee8)]
fffff805`34ba97a2 4c8d05d7833100  lea     r8,[nt!ExpClockIntervalRequest (fffff805`34ec1b80)]
fffff805`34ba97a9 b201            mov     dl,1
fffff805`34ba97ab e88c000000      call    nt!KiSetClockInterval (fffff805`34ba983c)
fffff805`34ba97b0 8bd8            mov     ebx,eax
fffff805`34ba97b2 e811000000      call    nt!KiSendClockInterruptToClockOwner (fffff805`34ba97c8)
fffff805`34ba97b7 488b17          mov     rdx,qword ptr [rdi]
fffff805`34ba97ba 891a            mov     dword ptr [rdx],ebx
fffff805`34ba97bc e96cffffff      jmp     nt!ExpUpdateTimerConfigurationWorker+0x4d (fffff805`34ba972d)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d554:
fffff805`34ce6c34 a801            test    al,1
fffff805`34ce6c36 0f84e72aecff    je      nt!ExpUpdateTimerConfigurationWorker+0x43 (fffff805`34ba9723)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d55c:
fffff805`34ce6c3c 80f902          cmp     cl,2
fffff805`34ce6c3f 0f83de2aecff    jae     nt!ExpUpdateTimerConfigurationWorker+0x43 (fffff805`34ba9723)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d565:
fffff805`34ce6c45 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff805`34ce6c4e 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff805`34ce6c55 f0810900000100  lock or dword ptr [rcx],10000h
fffff805`34ce6c5c e9c22aecff      jmp     nt!ExpUpdateTimerConfigurationWorker+0x43 (fffff805`34ba9723)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d581:
fffff805`34ce6c61 a801            test    al,1
fffff805`34ce6c63 0f84de2aecff    je      nt!ExpUpdateTimerConfigurationWorker+0x67 (fffff805`34ba9747)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d589:
fffff805`34ce6c69 440f20c0        mov     rax,tmm
fffff805`34ce6c6d e9d52aecff      jmp     nt!ExpUpdateTimerConfigurationWorker+0x67 (fffff805`34ba9747)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d592:
fffff805`34ce6c72 a801            test    al,1
fffff805`34ce6c74 0f84042becff    je      nt!ExpUpdateTimerConfigurationWorker+0x9e (fffff805`34ba977e)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d59a:
fffff805`34ce6c7a 440f20c0        mov     rax,tmm
fffff805`34ce6c7e 3c02            cmp     al,2
fffff805`34ce6c80 0f82f82aecff    jb      nt!ExpUpdateTimerConfigurationWorker+0x9e (fffff805`34ba977e)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d5a6:
fffff805`34ce6c86 4080fe02        cmp     sil,2
fffff805`34ce6c8a 0f83ee2aecff    jae     nt!ExpUpdateTimerConfigurationWorker+0x9e (fffff805`34ba977e)  Branch

nt!ExpUpdateTimerConfigurationWorker+0x13d5b0:
fffff805`34ce6c90 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff805`34ce6c99 488b81b8610000  mov     rax,qword ptr [rcx+61B8h]
fffff805`34ce6ca0 f08120fffffeff  lock and dword ptr [rax],0FFFEFFFFh
fffff805`34ce6ca7 e8b43ef8ff      call    nt!KiRemoveSystemWorkPriorityKick (fffff805`34c6ab60)
fffff805`34ce6cac 90              nop
fffff805`34ce6cad e9cc2aecff      jmp     nt!ExpUpdateTimerConfigurationWorker+0x9e (fffff805`34ba977e)  Branch
