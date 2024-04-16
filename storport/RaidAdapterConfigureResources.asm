;RaidAdapterStartDeviceIrp+0xd5 => RaidAdapterConfigureResources

1: kd> uf storport!RaidAdapterConfigureResources
storport!RaidAdapterConfigureResources:
fffff80b`7ca1c0cc 4053            push    rbx
fffff80b`7ca1c0ce 4883ec30        sub     rsp,30h
fffff80b`7ca1c0d2 488bd9          mov     rbx,rcx
fffff80b`7ca1c0d5 4881c128010000  add     rcx,128h
fffff80b`7ca1c0dc e897030500      call    storport!RaidInitializeResourceList (fffff80b`7ca6c478)
fffff80b`7ca1c0e1 85c0            test    eax,eax
fffff80b`7ca1c0e3 0f8813010000    js      storport!RaidAdapterConfigureResources+0x130 (fffff80b`7ca1c1fc)  Branch

storport!RaidAdapterConfigureResources+0x1d:
fffff80b`7ca1c0e9 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff80b`7ca1c0ed 488d8b68020000  lea     rcx,[rbx+268h]
fffff80b`7ca1c0f4 e8df040500      call    storport!RaInitializeBus (fffff80b`7ca6c5d8)  ;IRP_MJ_PNP + IRP_MN_QUERY_INTERFACE to query BusInterface callbacks from bus driver.
fffff80b`7ca1c0f9 babb0000c0      mov     edx,0C00000BBh
fffff80b`7ca1c0fe 3bc2            cmp     eax,edx
fffff80b`7ca1c100 0f84fc000000    je      storport!RaidAdapterConfigureResources+0x136 (fffff80b`7ca1c202)  Branch

storport!RaidAdapterConfigureResources+0x3a:
fffff80b`7ca1c106 488b5308        mov     rdx,qword ptr [rbx+8]
fffff80b`7ca1c10a 488d058f5efeff  lea     rax,[storport!RaidAdapterDeferredRoutine (fffff80b`7ca01fa0)]
fffff80b`7ca1c111 488d8b80040000  lea     rcx,[rbx+480h]
fffff80b`7ca1c118 4889442420      mov     qword ptr [rsp+20h],rax
fffff80b`7ca1c11d 41b950000000    mov     r9d,50h
fffff80b`7ca1c123 e8f0000000      call    storport!RaidInitializeDeferredQueue (fffff80b`7ca1c218)
fffff80b`7ca1c128 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c12c 488d8b80060000  lea     rcx,[rbx+680h]
fffff80b`7ca1c133 488d158671feff  lea     rdx,[storport!RaidpAdapterTimerDpcRoutine (fffff80b`7ca032c0)]
fffff80b`7ca1c13a 48ff152faf0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c141 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c146 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c14a 488d8b00070000  lea     rcx,[rbx+700h]
fffff80b`7ca1c151 488d1558f20100  lea     rdx,[storport!RaidPauseTimerDpcRoutine (fffff80b`7ca3b3b0)]
fffff80b`7ca1c158 48ff1511af0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c15f 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c164 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c168 488d8bc8070000  lea     rcx,[rbx+7C8h]
fffff80b`7ca1c16f 488d159ae50100  lea     rdx,[storport!RaidCompletionDpcRoutine (fffff80b`7ca3a710)]
fffff80b`7ca1c176 48ff15f3ae0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c17d 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c182 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c186 488d8bf8100000  lea     rcx,[rbx+10F8h]
fffff80b`7ca1c18d 488d151cf20100  lea     rdx,[storport!RaidPauseTimerDpcRoutine (fffff80b`7ca3b3b0)]
fffff80b`7ca1c194 48ff15d5ae0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c19b 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c1a0 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c1a4 488d8b08080000  lea     rcx,[rbx+808h]
fffff80b`7ca1c1ab 488d155e9a0000  lea     rdx,[storport!RaidAdapterBusChangeDpcRoutine (fffff80b`7ca25c10)]
fffff80b`7ca1c1b2 48ff15b7ae0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c1b9 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c1be 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c1c2 488d8b40070000  lea     rcx,[rbx+740h]
fffff80b`7ca1c1c9 488d1580d00100  lea     rdx,[storport!RaidAdapterRestartDpcRoutine (fffff80b`7ca39250)]
fffff80b`7ca1c1d0 48ff1599ae0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c1d7 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c1dc 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80b`7ca1c1e0 488d8bf0150000  lea     rcx,[rbx+15F0h]
fffff80b`7ca1c1e7 488d15c2520000  lea     rdx,[storport!RaidQueueWaitCheckDpcRoutine (fffff80b`7ca214b0)]
fffff80b`7ca1c1ee 48ff157bae0400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80b`7ca67070)]
fffff80b`7ca1c1f5 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c1fa 33c0            xor     eax,eax

storport!RaidAdapterConfigureResources+0x130:
fffff80b`7ca1c1fc 4883c430        add     rsp,30h
fffff80b`7ca1c200 5b              pop     rbx
fffff80b`7ca1c201 c3              ret

storport!RaidAdapterConfigureResources+0x136:
fffff80b`7ca1c202 f6436808        test    byte ptr [rbx+68h],8
fffff80b`7ca1c206 0f85fafeffff    jne     storport!RaidAdapterConfigureResources+0x3a (fffff80b`7ca1c106)  Branch

storport!RaidAdapterConfigureResources+0x140:
fffff80b`7ca1c20c 8bc2            mov     eax,edx
fffff80b`7ca1c20e ebec            jmp     storport!RaidAdapterConfigureResources+0x130 (fffff80b`7ca1c1fc)  Branch
