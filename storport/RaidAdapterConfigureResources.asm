8: kd> uf storport!RaidAdapterConfigureResources
storport!RaidAdapterConfigureResources:
fffff80f`2d2dde34 4053            push    rbx
fffff80f`2d2dde36 4883ec30        sub     rsp,30h
fffff80f`2d2dde3a 488bd9          mov     rbx,rcx
fffff80f`2d2dde3d 4881c128010000  add     rcx,128h
fffff80f`2d2dde44 e8c7fe0400      call    storport!RaidInitializeResourceList (fffff80f`2d32dd10)
fffff80f`2d2dde49 85c0            test    eax,eax
fffff80f`2d2dde4b 0f8813010000    js      storport!RaidAdapterConfigureResources+0x130 (fffff80f`2d2ddf64)  Branch

storport!RaidAdapterConfigureResources+0x1d:
fffff80f`2d2dde51 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff80f`2d2dde55 488d8b68020000  lea     rcx,[rbx+268h]
fffff80f`2d2dde5c e81ffe0400      call    storport!RaInitializeBus (fffff80f`2d32dc80)  ;IRP_MJ_PNP + IRP_MN_QUERY_INTERFACE to query BusInterface callbacks from bus driver.
fffff80f`2d2dde61 babb0000c0      mov     edx,0C00000BBh
fffff80f`2d2dde66 3bc2            cmp     eax,edx
fffff80f`2d2dde68 0f84fc000000    je      storport!RaidAdapterConfigureResources+0x136 (fffff80f`2d2ddf6a)  Branch

storport!RaidAdapterConfigureResources+0x3a:
fffff80f`2d2dde6e 488b5308        mov     rdx,qword ptr [rbx+8]
fffff80f`2d2dde72 488d052741feff  lea     rax,[storport!RaidAdapterDeferredRoutine (fffff80f`2d2c1fa0)]
fffff80f`2d2dde79 488d8b80040000  lea     rcx,[rbx+480h]
fffff80f`2d2dde80 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d2dde85 41b950000000    mov     r9d,50h
fffff80f`2d2dde8b e8f0000000      call    storport!RaidInitializeDeferredQueue (fffff80f`2d2ddf80)
fffff80f`2d2dde90 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2dde94 488d8b80060000  lea     rcx,[rbx+680h]
fffff80f`2d2dde9b 488d15fe52feff  lea     rdx,[storport!RaidpAdapterTimerDpcRoutine (fffff80f`2d2c31a0)]
fffff80f`2d2ddea2 48ff15c7910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddea9 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddeae 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2ddeb2 488d8b00070000  lea     rcx,[rbx+700h]
fffff80f`2d2ddeb9 488d1540d20100  lea     rdx,[storport!RaidPauseTimerDpcRoutine (fffff80f`2d2fb100)]
fffff80f`2d2ddec0 48ff15a9910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddec7 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddecc 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2dded0 488d8bc8070000  lea     rcx,[rbx+7C8h]
fffff80f`2d2dded7 488d1582c50100  lea     rdx,[storport!RaidCompletionDpcRoutine (fffff80f`2d2fa460)]
fffff80f`2d2ddede 48ff158b910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddee5 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddeea 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2ddeee 488d8bf8100000  lea     rcx,[rbx+10F8h]
fffff80f`2d2ddef5 488d1504d20100  lea     rdx,[storport!RaidPauseTimerDpcRoutine (fffff80f`2d2fb100)]
fffff80f`2d2ddefc 48ff156d910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddf03 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddf08 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2ddf0c 488d8b08080000  lea     rcx,[rbx+808h]
fffff80f`2d2ddf13 488d1516790000  lea     rdx,[storport!RaidAdapterBusChangeDpcRoutine (fffff80f`2d2e5830)]
fffff80f`2d2ddf1a 48ff154f910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddf21 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddf26 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2ddf2a 488d8b40070000  lea     rcx,[rbx+740h]
fffff80f`2d2ddf31 488d1568b00100  lea     rdx,[storport!RaidAdapterRestartDpcRoutine (fffff80f`2d2f8fa0)]
fffff80f`2d2ddf38 48ff1531910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddf3f 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddf44 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d2ddf48 488d8bf0150000  lea     rcx,[rbx+15F0h]
fffff80f`2d2ddf4f 488d158a2c0000  lea     rdx,[storport!RaidQueueWaitCheckDpcRoutine (fffff80f`2d2e0be0)]
fffff80f`2d2ddf56 48ff1513910400  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d2ddf5d 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2ddf62 33c0            xor     eax,eax

storport!RaidAdapterConfigureResources+0x130:
fffff80f`2d2ddf64 4883c430        add     rsp,30h
fffff80f`2d2ddf68 5b              pop     rbx
fffff80f`2d2ddf69 c3              ret

storport!RaidAdapterConfigureResources+0x136:
fffff80f`2d2ddf6a f6436808        test    byte ptr [rbx+68h],8
fffff80f`2d2ddf6e 0f85fafeffff    jne     storport!RaidAdapterConfigureResources+0x3a (fffff80f`2d2dde6e)  Branch

storport!RaidAdapterConfigureResources+0x140:
fffff80f`2d2ddf74 8bc2            mov     eax,edx
fffff80f`2d2ddf76 ebec            jmp     storport!RaidAdapterConfigureResources+0x130 (fffff80f`2d2ddf64)  Branch
