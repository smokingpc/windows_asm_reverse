0: kd> uf storport!RaidInitializePerfOptsPassive
storport!RaidInitializePerfOptsPassive:
fffff804`0b8d88d4 4c8bdc          mov     r11,rsp
fffff804`0b8d88d7 49894b08        mov     qword ptr [r11+8],rcx
fffff804`0b8d88db 53              push    rbx
fffff804`0b8d88dc 55              push    rbp
fffff804`0b8d88dd 56              push    rsi
fffff804`0b8d88de 57              push    rdi
fffff804`0b8d88df 4154            push    r12
fffff804`0b8d88e1 4155            push    r13
fffff804`0b8d88e3 4156            push    r14
fffff804`0b8d88e5 4157            push    r15
fffff804`0b8d88e7 4883ec68        sub     rsp,68h
fffff804`0b8d88eb 0fb799b4110000  movzx   ebx,word ptr [rcx+11B4h]
fffff804`0b8d88f2 4533ed          xor     r13d,r13d
fffff804`0b8d88f5 8bb9b8110000    mov     edi,dword ptr [rcx+11B8h]
fffff804`0b8d88fb 33c0            xor     eax,eax
fffff804`0b8d88fd 0f57c0          xorps   xmm0,xmm0
fffff804`0b8d8900 45896b20        mov     dword ptr [r11+20h],r13d
fffff804`0b8d8904 0f11442440      movups  xmmword ptr [rsp+40h],xmm0
fffff804`0b8d8909 458d7501        lea     r14d,[r13+1]
fffff804`0b8d890d 498943a8        mov     qword ptr [r11-58h],rax
fffff804`0b8d8911 44896c2420      mov     dword ptr [rsp+20h],r13d
fffff804`0b8d8916 488bf1          mov     rsi,rcx
fffff804`0b8d8919 66899c24c0000000 mov     word ptr [rsp+0C0h],bx
fffff804`0b8d8921 418bed          mov     ebp,r13d
fffff804`0b8d8924 664489a9b4110000 mov     word ptr [rcx+11B4h],r13w
fffff804`0b8d892c 413bfe          cmp     edi,r14d
fffff804`0b8d892f 7d02            jge     storport!RaidInitializePerfOptsPassive+0x5f (fffff804`0b8d8933)  Branch

storport!RaidInitializePerfOptsPassive+0x5d:
fffff804`0b8d8931 f7df            neg     edi

storport!RaidInitializePerfOptsPassive+0x5f:
fffff804`0b8d8933 4489b1b8110000  mov     dword ptr [rcx+11B8h],r14d
fffff804`0b8d893a 413bfe          cmp     edi,r14d
fffff804`0b8d893d 0f864e010000    jbe     storport!RaidInitializePerfOptsPassive+0x1bd (fffff804`0b8d8a91)  Branch

storport!RaidInitializePerfOptsPassive+0x6f:
fffff804`0b8d8943 4438696e        cmp     byte ptr [rcx+6Eh],r13b
fffff804`0b8d8947 7d0d            jge     storport!RaidInitializePerfOptsPassive+0x82 (fffff804`0b8d8956)  Branch

storport!RaidInitializePerfOptsPassive+0x75:
fffff804`0b8d8949 4c39a9c0110000  cmp     qword ptr [rcx+11C0h],r13
fffff804`0b8d8950 0f853b010000    jne     storport!RaidInitializePerfOptsPassive+0x1bd (fffff804`0b8d8a91)  Branch

storport!RaidInitializePerfOptsPassive+0x82:
fffff804`0b8d8956 4c8b4908        mov     r9,qword ptr [rcx+8]
fffff804`0b8d895a 41b852614354    mov     r8d,54436152h
fffff804`0b8d8960 8bd7            mov     edx,edi
fffff804`0b8d8962 b940000000      mov     ecx,40h
fffff804`0b8d8967 48c1e205        shl     rdx,5
fffff804`0b8d896b e8b406fdff      call    storport!RaidAllocatePool (fffff804`0b8a9024)
fffff804`0b8d8970 4c8bf8          mov     r15,rax
fffff804`0b8d8973 4885c0          test    rax,rax
fffff804`0b8d8976 7546            jne     storport!RaidInitializePerfOptsPassive+0xea (fffff804`0b8d89be)  Branch

storport!RaidInitializePerfOptsPassive+0xa4:
fffff804`0b8d8978 bd9a0000c0      mov     ebp,0C000009Ah

storport!RaidInitializePerfOptsPassive+0xa9:
fffff804`0b8d897d 488b8ec8110000  mov     rcx,qword ptr [rsi+11C8h]
fffff804`0b8d8984 33db            xor     ebx,ebx
fffff804`0b8d8986 4885c9          test    rcx,rcx
fffff804`0b8d8989 741f            je      storport!RaidInitializePerfOptsPassive+0xd6 (fffff804`0b8d89aa)  Branch

storport!RaidInitializePerfOptsPassive+0xb7:
fffff804`0b8d898b ba52614472      mov     edx,72446152h
fffff804`0b8d8990 4c8b15c1380400  mov     r10,qword ptr [storport!_imp_ExFreePoolWithTag (fffff804`0b91c258)]
fffff804`0b8d8997 e874e6d6fd      call    nt!ExFreePool (fffff804`09647010)
fffff804`0b8d899c 48899ec8110000  mov     qword ptr [rsi+11C8h],rbx
fffff804`0b8d89a3 66899eb6110000  mov     word ptr [rsi+11B6h],bx

storport!RaidInitializePerfOptsPassive+0xd6:
fffff804`0b8d89aa 8bc5            mov     eax,ebp
fffff804`0b8d89ac 4883c468        add     rsp,68h
fffff804`0b8d89b0 415f            pop     r15
fffff804`0b8d89b2 415e            pop     r14
fffff804`0b8d89b4 415d            pop     r13
fffff804`0b8d89b6 415c            pop     r12
fffff804`0b8d89b8 5f              pop     rdi
fffff804`0b8d89b9 5e              pop     rsi
fffff804`0b8d89ba 5d              pop     rbp
fffff804`0b8d89bb 5b              pop     rbx
fffff804`0b8d89bc c3              ret

storport!RaidInitializePerfOptsPassive+0xea:
fffff804`0b8d89be 4c8b15f3370400  mov     r10,qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff804`0b91c1b8)]
fffff804`0b8d89c5 e8564d64fd      call    nt!KeQueryHighestNodeNumber (fffff804`08f1d720)
fffff804`0b8d89ca 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff804`0b8d89ce b948000000      mov     ecx,48h
fffff804`0b8d89d3 440fb7e0        movzx   r12d,ax
fffff804`0b8d89d7 41b852614354    mov     r8d,54436152h
fffff804`0b8d89dd 4503e6          add     r12d,r14d
fffff804`0b8d89e0 418bd4          mov     edx,r12d
fffff804`0b8d89e3 48c1e206        shl     rdx,6
fffff804`0b8d89e7 458bec          mov     r13d,r12d
fffff804`0b8d89ea e83506fdff      call    storport!RaidAllocatePool (fffff804`0b8a9024)
fffff804`0b8d89ef 33c9            xor     ecx,ecx
fffff804`0b8d89f1 488986c0110000  mov     qword ptr [rsi+11C0h],rax
fffff804`0b8d89f8 4885c0          test    rax,rax
fffff804`0b8d89fb 0f8477ffffff    je      storport!RaidInitializePerfOptsPassive+0xa4 (fffff804`0b8d8978)  Branch

storport!RaidInitializePerfOptsPassive+0x12d:
fffff804`0b8d8a01 4585e4          test    r12d,r12d
fffff804`0b8d8a04 7425            je      storport!RaidInitializePerfOptsPassive+0x157 (fffff804`0b8d8a2b)  Branch

storport!RaidInitializePerfOptsPassive+0x132:
fffff804`0b8d8a06 448bf1          mov     r14d,ecx

storport!RaidInitializePerfOptsPassive+0x135:
fffff804`0b8d8a09 488b8ec0110000  mov     rcx,qword ptr [rsi+11C0h]
fffff804`0b8d8a10 4903ce          add     rcx,r14
fffff804`0b8d8a13 4c8b15a6380400  mov     r10,qword ptr [storport!_imp_InitializeSListHead (fffff804`0b91c2c0)]
fffff804`0b8d8a1a e8115253fd      call    nt!InitializeSListHead (fffff804`08e0dc30)
fffff804`0b8d8a1f 4983c640        add     r14,40h
fffff804`0b8d8a23 4983ed01        sub     r13,1
fffff804`0b8d8a27 75e0            jne     storport!RaidInitializePerfOptsPassive+0x135 (fffff804`0b8d8a09)  Branch

storport!RaidInitializePerfOptsPassive+0x155:
fffff804`0b8d8a29 33c9            xor     ecx,ecx

storport!RaidInitializePerfOptsPassive+0x157:
fffff804`0b8d8a2b 4d8d6f14        lea     r13,[r15+14h]
fffff804`0b8d8a2f 448bf1          mov     r14d,ecx

storport!RaidInitializePerfOptsPassive+0x15e:
fffff804`0b8d8a32 33d2            xor     edx,edx
fffff804`0b8d8a34 45897500        mov     dword ptr [r13],r14d
fffff804`0b8d8a38 418bc6          mov     eax,r14d
fffff804`0b8d8a3b 41f7f4          div     eax,r12d
fffff804`0b8d8a3e 8bca            mov     ecx,edx
fffff804`0b8d8a40 498bd7          mov     rdx,r15
fffff804`0b8d8a43 48c1e106        shl     rcx,6
fffff804`0b8d8a47 48038ec0110000  add     rcx,qword ptr [rsi+11C0h]
fffff804`0b8d8a4e 4c8b1593360400  mov     r10,qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff804`0b91c0e8)]
fffff804`0b8d8a55 e8461275fd      call    nt!ExpInterlockedPushEntrySList (fffff804`09029ca0)
fffff804`0b8d8a5a 41ffc6          inc     r14d
fffff804`0b8d8a5d 4d8d6d20        lea     r13,[r13+20h]
fffff804`0b8d8a61 4983c720        add     r15,20h
fffff804`0b8d8a65 443bf7          cmp     r14d,edi
fffff804`0b8d8a68 72c8            jb      storport!RaidInitializePerfOptsPassive+0x15e (fffff804`0b8d8a32)  Branch

storport!RaidInitializePerfOptsPassive+0x196:
fffff804`0b8d8a6a 488d542440      lea     rdx,[rsp+40h]
fffff804`0b8d8a6f 488bce          mov     rcx,rsi
fffff804`0b8d8a72 e8fdfbfcff      call    storport!RaidAdapterAcquireStartIoLock (fffff804`0b8a8674)
fffff804`0b8d8a77 488d542440      lea     rdx,[rsp+40h]
fffff804`0b8d8a7c 89beb8110000    mov     dword ptr [rsi+11B8h],edi
fffff804`0b8d8a82 488bce          mov     rcx,rsi
fffff804`0b8d8a85 e8b6fbfcff      call    storport!RaidAdapterReleaseStartIoLock (fffff804`0b8a8640)
fffff804`0b8d8a8a 4533ed          xor     r13d,r13d
fffff804`0b8d8a8d 458d7501        lea     r14d,[r13+1]

storport!RaidInitializePerfOptsPassive+0x1bd:
fffff804`0b8d8a91 4184de          test    r14b,bl
fffff804`0b8d8a94 0f84e3feffff    je      storport!RaidInitializePerfOptsPassive+0xa9 (fffff804`0b8d897d)  Branch

storport!RaidInitializePerfOptsPassive+0x1c6:
fffff804`0b8d8a9a 488d0d4fc00300  lea     rcx,[storport!g_RaidDPCRedirectionInitLock (fffff804`0b914af0)]
fffff804`0b8d8aa1 4c8b15a8350400  mov     r10,qword ptr [storport!_imp_KeAcquireSpinLockRaiseToDpc (fffff804`0b91c050)]
fffff804`0b8d8aa8 e873c756fd      call    nt!KeAcquireSpinLockRaiseToDpc (fffff804`08e45220)
fffff804`0b8d8aad 448ae0          mov     r12b,al
fffff804`0b8d8ab0 888424b8000000  mov     byte ptr [rsp+0B8h],al
fffff804`0b8d8ab7 418bc6          mov     eax,r14d
fffff804`0b8d8aba f00fc10536c00300 lock xadd dword ptr [storport!g_RaidPerfRedirectRefCount (fffff804`0b914af8)],eax
fffff804`0b8d8ac2 4103c6          add     eax,r14d
fffff804`0b8d8ac5 413bc6          cmp     eax,r14d
fffff804`0b8d8ac8 0f85cc010000    jne     storport!RaidInitializePerfOptsPassive+0x3c6 (fffff804`0b8d8c9a)  Branch

storport!RaidInitializePerfOptsPassive+0x1fa:
fffff804`0b8d8ace 4c8b15cb360400  mov     r10,qword ptr [storport!_imp_KeQueryActiveGroupCount (fffff804`0b91c1a0)]
fffff804`0b8d8ad5 e8563d64fd      call    nt!KeQueryActiveGroupCount (fffff804`08f1c830)
fffff804`0b8d8ada 440fb7f8        movzx   r15d,ax
fffff804`0b8d8ade 44386e6e        cmp     byte ptr [rsi+6Eh],r13b
fffff804`0b8d8ae2 7d17            jge     storport!RaidInitializePerfOptsPassive+0x227 (fffff804`0b8d8afb)  Branch

storport!RaidInitializePerfOptsPassive+0x210:
fffff804`0b8d8ae4 488b05d5bf0300  mov     rax,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8aeb 4885c0          test    rax,rax
fffff804`0b8d8aee 740b            je      storport!RaidInitializePerfOptsPassive+0x227 (fffff804`0b8d8afb)  Branch

storport!RaidInitializePerfOptsPassive+0x21c:
fffff804`0b8d8af0 418bff          mov     edi,r15d
fffff804`0b8d8af3 41be52614472    mov     r14d,72446152h
fffff804`0b8d8af9 eb28            jmp     storport!RaidInitializePerfOptsPassive+0x24f (fffff804`0b8d8b23)  Branch

storport!RaidInitializePerfOptsPassive+0x227:
fffff804`0b8d8afb 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff804`0b8d8aff 498bd7          mov     rdx,r15
fffff804`0b8d8b02 41be52614472    mov     r14d,72446152h
fffff804`0b8d8b08 48c1e20d        shl     rdx,0Dh
fffff804`0b8d8b0c 458bc6          mov     r8d,r14d
fffff804`0b8d8b0f b940000000      mov     ecx,40h
fffff804`0b8d8b14 498bff          mov     rdi,r15
fffff804`0b8d8b17 e80805fdff      call    storport!RaidAllocatePool (fffff804`0b8a9024)
fffff804`0b8d8b1c 4889059dbf0300  mov     qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)],rax

storport!RaidInitializePerfOptsPassive+0x24f:
fffff804`0b8d8b23 4885c0          test    rax,rax
fffff804`0b8d8b26 0f8455020000    je      storport!RaidInitializePerfOptsPassive+0x4ad (fffff804`0b8d8d81)  Branch

storport!RaidInitializePerfOptsPassive+0x258:
fffff804`0b8d8b2c 44386e6e        cmp     byte ptr [rsi+6Eh],r13b
fffff804`0b8d8b30 7d09            jge     storport!RaidInitializePerfOptsPassive+0x267 (fffff804`0b8d8b3b)  Branch

storport!RaidInitializePerfOptsPassive+0x25e:
fffff804`0b8d8b32 4c392d77bf0300  cmp     qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff804`0b914ab0)],r13
fffff804`0b8d8b39 7529            jne     storport!RaidInitializePerfOptsPassive+0x290 (fffff804`0b8d8b64)  Branch

storport!RaidInitializePerfOptsPassive+0x267:
fffff804`0b8d8b3b 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff804`0b8d8b3f 488d14bd00000000 lea     rdx,[rdi*4]
fffff804`0b8d8b47 458bc6          mov     r8d,r14d
fffff804`0b8d8b4a b940000000      mov     ecx,40h
fffff804`0b8d8b4f e8d004fdff      call    storport!RaidAllocatePool (fffff804`0b8a9024)
fffff804`0b8d8b54 48890555bf0300  mov     qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff804`0b914ab0)],rax
fffff804`0b8d8b5b 4885c0          test    rax,rax
fffff804`0b8d8b5e 0f841d020000    je      storport!RaidInitializePerfOptsPassive+0x4ad (fffff804`0b8d8d81)  Branch

storport!RaidInitializePerfOptsPassive+0x290:
fffff804`0b8d8b64 450fb7f5        movzx   r14d,r13w
fffff804`0b8d8b68 66453bef        cmp     r13w,r15w
fffff804`0b8d8b6c 0f8316010000    jae     storport!RaidInitializePerfOptsPassive+0x3b4 (fffff804`0b8d8c88)  Branch

storport!RaidInitializePerfOptsPassive+0x29e:
fffff804`0b8d8b72 33ff            xor     edi,edi
fffff804`0b8d8b74 4d8be5          mov     r12,r13
fffff804`0b8d8b77 8d7701          lea     esi,[rdi+1]

storport!RaidInitializePerfOptsPassive+0x2a6:
fffff804`0b8d8b7a 410fb7ce        movzx   ecx,r14w
fffff804`0b8d8b7e 664489b424c8000000 mov   word ptr [rsp+0C8h],r14w
fffff804`0b8d8b87 4088bc24cb000000 mov     byte ptr [rsp+0CBh],dil
fffff804`0b8d8b8f 4c8b154a370400  mov     r10,qword ptr [storport!_imp_KeQueryActiveProcessorCountEx (fffff804`0b91c2e0)]
fffff804`0b8d8b96 e8f5c356fd      call    nt!KeQueryActiveProcessorCountEx (fffff804`08e44f90)
fffff804`0b8d8b9b 408adf          mov     bl,dil
fffff804`0b8d8b9e 8be8            mov     ebp,eax
fffff804`0b8d8ba0 85c0            test    eax,eax
fffff804`0b8d8ba2 0f84a0000000    je      storport!RaidInitializePerfOptsPassive+0x374 (fffff804`0b8d8c48)  Branch

storport!RaidInitializePerfOptsPassive+0x2d4:
fffff804`0b8d8ba8 488b0d11bf0300  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8baf 488d158a3cfeff  lea     rdx,[storport!RaidpAdapterRedirectDpcRoutine (fffff804`0b8bc840)]
fffff804`0b8d8bb6 0fb6fb          movzx   edi,bl
fffff804`0b8d8bb9 4903fd          add     rdi,r13
fffff804`0b8d8bbc 889c24ca000000  mov     byte ptr [rsp+0CAh],bl
fffff804`0b8d8bc3 48c1e707        shl     rdi,7
fffff804`0b8d8bc7 4803cf          add     rcx,rdi
fffff804`0b8d8bca 4c8bc1          mov     r8,rcx
fffff804`0b8d8bcd 4c8b15b4340400  mov     r10,qword ptr [storport!_imp_KeInitializeDpc (fffff804`0b91c088)]
fffff804`0b8d8bd4 e857e057fd      call    nt!KeInitializeDpc (fffff804`08e56c30)
fffff804`0b8d8bd9 488b0de0be0300  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8be0 ba03000000      mov     edx,3
fffff804`0b8d8be5 4803cf          add     rcx,rdi
fffff804`0b8d8be8 4c8b15493c0400  mov     r10,qword ptr [storport!_imp_KeSetImportanceDpc (fffff804`0b91c838)]
fffff804`0b8d8bef e83cc368fd      call    nt!KeSetImportanceDpc (fffff804`08f64f30)
fffff804`0b8d8bf4 488b0dc5be0300  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8bfb 488d9424c8000000 lea     rdx,[rsp+0C8h]
fffff804`0b8d8c03 4803cf          add     rcx,rdi
fffff804`0b8d8c06 4c8b15fb340400  mov     r10,qword ptr [storport!_imp_KeSetTargetProcessorDpcEx (fffff804`0b91c108)]
fffff804`0b8d8c0d e82e8a68fd      call    nt!KeSetTargetProcessorDpcEx (fffff804`08f61640)
fffff804`0b8d8c12 488b0da7be0300  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8c19 4883c140        add     rcx,40h
fffff804`0b8d8c1d 4803cf          add     rcx,rdi
fffff804`0b8d8c20 4c8b1599360400  mov     r10,qword ptr [storport!_imp_InitializeSListHead (fffff804`0b91c2c0)]
fffff804`0b8d8c27 e8045053fd      call    nt!InitializeSListHead (fffff804`08e0dc30)
fffff804`0b8d8c2c 488b058dbe0300  mov     rax,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8c33 4002de          add     bl,sil
fffff804`0b8d8c36 8364075000      and     dword ptr [rdi+rax+50h],0
fffff804`0b8d8c3b 0fb6c3          movzx   eax,bl
fffff804`0b8d8c3e 3bc5            cmp     eax,ebp
fffff804`0b8d8c40 0f8262ffffff    jb      storport!RaidInitializePerfOptsPassive+0x2d4 (fffff804`0b8d8ba8)  Branch

storport!RaidInitializePerfOptsPassive+0x372:
fffff804`0b8d8c46 33ff            xor     edi,edi

storport!RaidInitializePerfOptsPassive+0x374:
fffff804`0b8d8c48 488b0561be0300  mov     rax,qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff804`0b914ab0)]
fffff804`0b8d8c4f 664403f6        add     r14w,si
fffff804`0b8d8c53 4983c540        add     r13,40h
fffff804`0b8d8c57 41892c04        mov     dword ptr [r12+rax],ebp
fffff804`0b8d8c5b 4983c404        add     r12,4
fffff804`0b8d8c5f 66453bf7        cmp     r14w,r15w
fffff804`0b8d8c63 0f8211ffffff    jb      storport!RaidInitializePerfOptsPassive+0x2a6 (fffff804`0b8d8b7a)  Branch

storport!RaidInitializePerfOptsPassive+0x395:
fffff804`0b8d8c69 0fb79c24c0000000 movzx   ebx,word ptr [rsp+0C0h]
fffff804`0b8d8c71 4533ed          xor     r13d,r13d
fffff804`0b8d8c74 488bb424b0000000 mov     rsi,qword ptr [rsp+0B0h]
fffff804`0b8d8c7c 8b6c2420        mov     ebp,dword ptr [rsp+20h]
fffff804`0b8d8c80 448aa424b8000000 mov     r12b,byte ptr [rsp+0B8h]

storport!RaidInitializePerfOptsPassive+0x3b4:
fffff804`0b8d8c88 f044092c24      lock or dword ptr [rsp],r13d
fffff804`0b8d8c8d 44893d24be0300  mov     dword ptr [storport!g_RaidPerfRedirectGroupCount (fffff804`0b914ab8)],r15d
fffff804`0b8d8c94 41be01000000    mov     r14d,1

storport!RaidInitializePerfOptsPassive+0x3c6:
fffff804`0b8d8c9a 664409b6b4110000 or      word ptr [rsi+11B4h],r14w
fffff804`0b8d8ca2 488d0d47be0300  lea     rcx,[storport!g_RaidDPCRedirectionInitLock (fffff804`0b914af0)]
fffff804`0b8d8ca9 418ad4          mov     dl,r12b
fffff804`0b8d8cac 4c8b15e5340400  mov     r10,qword ptr [storport!_imp_KeReleaseSpinLock (fffff804`0b91c198)]
fffff804`0b8d8cb3 e8a85556fd      call    nt!KeReleaseSpinLock (fffff804`08e3e260)
fffff804`0b8d8cb8 f6c302          test    bl,2
fffff804`0b8d8cbb 0f84bcfcffff    je      storport!RaidInitializePerfOptsPassive+0xa9 (fffff804`0b8d897d)  Branch

storport!RaidInitializePerfOptsPassive+0x3ed:
fffff804`0b8d8cc1 b8fcff0000      mov     eax,0FFFCh
fffff804`0b8d8cc6 6685d8          test    ax,bx
fffff804`0b8d8cc9 0f86aefcffff    jbe     storport!RaidInitializePerfOptsPassive+0xa9 (fffff804`0b8d897d)  Branch

storport!RaidInitializePerfOptsPassive+0x3fb:
fffff804`0b8d8ccf 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff804`0b8d8cd3 41b852614472    mov     r8d,72446152h
fffff804`0b8d8cd9 0fb7c3          movzx   eax,bx
fffff804`0b8d8cdc 448bf0          mov     r14d,eax
fffff804`0b8d8cdf 89442430        mov     dword ptr [rsp+30h],eax
fffff804`0b8d8ce3 b801000000      mov     eax,1
fffff804`0b8d8ce8 41c1ee02        shr     r14d,2
fffff804`0b8d8cec 418d8e18010000  lea     ecx,[r14+118h]
fffff804`0b8d8cf3 84c8            test    al,cl
fffff804`0b8d8cf5 8d4101          lea     eax,[rcx+1]
fffff804`0b8d8cf8 0f44c1          cmove   eax,ecx
fffff804`0b8d8cfb b942000000      mov     ecx,42h
fffff804`0b8d8d00 448bf8          mov     r15d,eax
fffff804`0b8d8d03 8bd0            mov     edx,eax
fffff804`0b8d8d05 4c89bc24b0000000 mov     qword ptr [rsp+0B0h],r15
fffff804`0b8d8d0d e81203fdff      call    storport!RaidAllocatePool (fffff804`0b8a9024)
fffff804`0b8d8d12 4889442428      mov     qword ptr [rsp+28h],rax
fffff804`0b8d8d17 488bf8          mov     rdi,rax
fffff804`0b8d8d1a 4885c0          test    rax,rax
fffff804`0b8d8d1d 0f8455fcffff    je      storport!RaidInitializePerfOptsPassive+0xa4 (fffff804`0b8d8978)  Branch

storport!RaidInitializePerfOptsPassive+0x44f:
fffff804`0b8d8d23 0fb796b6110000  movzx   edx,word ptr [rsi+11B6h]
fffff804`0b8d8d2a 418d4604        lea     eax,[r14+4]
fffff804`0b8d8d2e 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff804`0b8d8d32 8d4801          lea     ecx,[rax+1]
fffff804`0b8d8d35 41be01000000    mov     r14d,1
fffff804`0b8d8d3b 41b852614472    mov     r8d,72446152h
fffff804`0b8d8d41 4184c6          test    r14b,al
fffff804`0b8d8d44 0f44c8          cmove   ecx,eax
fffff804`0b8d8d47 0fafd1          imul    edx,ecx
fffff804`0b8d8d4a 898c24b8000000  mov     dword ptr [rsp+0B8h],ecx
fffff804`0b8d8d51 418d4e3f        lea     ecx,[r14+3Fh]
fffff804`0b8d8d55 e8ca02fdff      call    storport!RaidAllocatePool (fffff804`0b8a9024)
fffff804`0b8d8d5a 4889442438      mov     qword ptr [rsp+38h],rax
fffff804`0b8d8d5f 4885c0          test    rax,rax
fffff804`0b8d8d62 0f858f000000    jne     storport!RaidInitializePerfOptsPassive+0x523 (fffff804`0b8d8df7)  Branch

storport!RaidInitializePerfOptsPassive+0x494:
fffff804`0b8d8d68 ba52614472      mov     edx,72446152h
fffff804`0b8d8d6d 488bcf          mov     rcx,rdi
fffff804`0b8d8d70 4c8b15e1340400  mov     r10,qword ptr [storport!_imp_ExFreePoolWithTag (fffff804`0b91c258)]
fffff804`0b8d8d77 e894e2d6fd      call    nt!ExFreePool (fffff804`09647010)
fffff804`0b8d8d7c e9f7fbffff      jmp     storport!RaidInitializePerfOptsPassive+0xa4 (fffff804`0b8d8978)  Branch

storport!RaidInitializePerfOptsPassive+0x4ad:
fffff804`0b8d8d81 83c8ff          or      eax,0FFFFFFFFh
fffff804`0b8d8d84 f00fc1056cbd0300 lock xadd dword ptr [storport!g_RaidPerfRedirectRefCount (fffff804`0b914af8)],eax
fffff804`0b8d8d8c 83f801          cmp     eax,1
fffff804`0b8d8d8f 754b            jne     storport!RaidInitializePerfOptsPassive+0x508 (fffff804`0b8d8ddc)  Branch

storport!RaidInitializePerfOptsPassive+0x4bd:
fffff804`0b8d8d91 488b0d28bd0300  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)]
fffff804`0b8d8d98 4885c9          test    rcx,rcx
fffff804`0b8d8d9b 7416            je      storport!RaidInitializePerfOptsPassive+0x4df (fffff804`0b8d8db3)  Branch

storport!RaidInitializePerfOptsPassive+0x4c9:
fffff804`0b8d8d9d 418bd6          mov     edx,r14d
fffff804`0b8d8da0 4c8b15b1340400  mov     r10,qword ptr [storport!_imp_ExFreePoolWithTag (fffff804`0b91c258)]
fffff804`0b8d8da7 e864e2d6fd      call    nt!ExFreePool (fffff804`09647010)
fffff804`0b8d8dac 4c892d0dbd0300  mov     qword ptr [storport!g_RaidPerProcessorState (fffff804`0b914ac0)],r13

storport!RaidInitializePerfOptsPassive+0x4df:
fffff804`0b8d8db3 488b0df6bc0300  mov     rcx,qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff804`0b914ab0)]
fffff804`0b8d8dba 4885c9          test    rcx,rcx
fffff804`0b8d8dbd 7416            je      storport!RaidInitializePerfOptsPassive+0x501 (fffff804`0b8d8dd5)  Branch

storport!RaidInitializePerfOptsPassive+0x4eb:
fffff804`0b8d8dbf 418bd6          mov     edx,r14d
fffff804`0b8d8dc2 4c8b158f340400  mov     r10,qword ptr [storport!_imp_ExFreePoolWithTag (fffff804`0b91c258)]
fffff804`0b8d8dc9 e842e2d6fd      call    nt!ExFreePool (fffff804`09647010)
fffff804`0b8d8dce 4c892ddbbc0300  mov     qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff804`0b914ab0)],r13

storport!RaidInitializePerfOptsPassive+0x501:
fffff804`0b8d8dd5 44892ddcbc0300  mov     dword ptr [storport!g_RaidPerfRedirectGroupCount (fffff804`0b914ab8)],r13d

storport!RaidInitializePerfOptsPassive+0x508:
fffff804`0b8d8ddc 418ad4          mov     dl,r12b
fffff804`0b8d8ddf 488d0d0abd0300  lea     rcx,[storport!g_RaidDPCRedirectionInitLock (fffff804`0b914af0)]
fffff804`0b8d8de6 4c8b15ab330400  mov     r10,qword ptr [storport!_imp_KeReleaseSpinLock (fffff804`0b91c198)]
fffff804`0b8d8ded e86e5456fd      call    nt!KeReleaseSpinLock (fffff804`08e3e260)
fffff804`0b8d8df2 e981fbffff      jmp     storport!RaidInitializePerfOptsPassive+0xa4 (fffff804`0b8d8978)  Branch

storport!RaidInitializePerfOptsPassive+0x523:
fffff804`0b8d8df7 450fb7c5        movzx   r8d,r13w
fffff804`0b8d8dfb 66443baeb6110000 cmp     r13w,word ptr [rsi+11B6h]
fffff804`0b8d8e03 0f83bf000000    jae     storport!RaidInitializePerfOptsPassive+0x5f4 (fffff804`0b8d8ec8)  Branch

storport!RaidInitializePerfOptsPassive+0x535:
fffff804`0b8d8e09 8b9c24b8000000  mov     ebx,dword ptr [rsp+0B8h]
fffff804`0b8d8e10 488be8          mov     rbp,rax
fffff804`0b8d8e13 33ff            xor     edi,edi

storport!RaidInitializePerfOptsPassive+0x541:
fffff804`0b8d8e15 8bd3            mov     edx,ebx
fffff804`0b8d8e17 450fb7f0        movzx   r14d,r8w
fffff804`0b8d8e1b 410fafd6        imul    edx,r14d
fffff804`0b8d8e1f 440fb7cf        movzx   r9d,di
fffff804`0b8d8e23 448bdf          mov     r11d,edi
fffff804`0b8d8e26 bb01000000      mov     ebx,1
fffff804`0b8d8e2b 4803d5          add     rdx,rbp
fffff804`0b8d8e2e 41c1e606        shl     r14d,6
fffff804`0b8d8e32 458bfe          mov     r15d,r14d
fffff804`0b8d8e35 66448902        mov     word ptr [rdx],r8w

storport!RaidInitializePerfOptsPassive+0x565:
fffff804`0b8d8e39 4c8ba6c8110000  mov     r12,qword ptr [rsi+11C8h]
fffff804`0b8d8e40 418bc7          mov     eax,r15d
fffff804`0b8d8e43 468a2c20        mov     r13b,byte ptr [rax+r12]
fffff804`0b8d8e47 4180fdff        cmp     r13b,0FFh
fffff804`0b8d8e4b 7437            je      storport!RaidInitializePerfOptsPassive+0x5b0 (fffff804`0b8d8e84)  Branch

storport!RaidInitializePerfOptsPassive+0x579:
fffff804`0b8d8e4d 440fb7d7        movzx   r10d,di
fffff804`0b8d8e51 66413bf9        cmp     di,r9w
fffff804`0b8d8e55 731c            jae     storport!RaidInitializePerfOptsPassive+0x59f (fffff804`0b8d8e73)  Branch

storport!RaidInitializePerfOptsPassive+0x583:
fffff804`0b8d8e57 438d041e        lea     eax,[r14+r11]
fffff804`0b8d8e5b 428a0c20        mov     cl,byte ptr [rax+r12]

storport!RaidInitializePerfOptsPassive+0x58b:
fffff804`0b8d8e5f 410fb7c2        movzx   eax,r10w
fffff804`0b8d8e63 384c1004        cmp     byte ptr [rax+rdx+4],cl
fffff804`0b8d8e67 741b            je      storport!RaidInitializePerfOptsPassive+0x5b0 (fffff804`0b8d8e84)  Branch

storport!RaidInitializePerfOptsPassive+0x595:
fffff804`0b8d8e69 664403d3        add     r10w,bx
fffff804`0b8d8e6d 66453bd1        cmp     r10w,r9w
fffff804`0b8d8e71 72ec            jb      storport!RaidInitializePerfOptsPassive+0x58b (fffff804`0b8d8e5f)  Branch

storport!RaidInitializePerfOptsPassive+0x59f:
fffff804`0b8d8e73 410fb7c1        movzx   eax,r9w
fffff804`0b8d8e77 44886c1004      mov     byte ptr [rax+rdx+4],r13b
fffff804`0b8d8e7c 66015a02        add     word ptr [rdx+2],bx
fffff804`0b8d8e80 664403cb        add     r9w,bx

storport!RaidInitializePerfOptsPassive+0x5b0:
fffff804`0b8d8e84 4403db          add     r11d,ebx
fffff804`0b8d8e87 4403fb          add     r15d,ebx
fffff804`0b8d8e8a 4183fb40        cmp     r11d,40h
fffff804`0b8d8e8e 72a9            jb      storport!RaidInitializePerfOptsPassive+0x565 (fffff804`0b8d8e39)  Branch

storport!RaidInitializePerfOptsPassive+0x5bc:
fffff804`0b8d8e90 4c8bf3          mov     r14,rbx
fffff804`0b8d8e93 8b9c24b8000000  mov     ebx,dword ptr [rsp+0B8h]
fffff804`0b8d8e9a 664503c6        add     r8w,r14w
fffff804`0b8d8e9e 66443b86b6110000 cmp     r8w,word ptr [rsi+11B6h]
fffff804`0b8d8ea6 0f8269ffffff    jb      storport!RaidInitializePerfOptsPassive+0x541 (fffff804`0b8d8e15)  Branch

storport!RaidInitializePerfOptsPassive+0x5d8:
fffff804`0b8d8eac 0fb79c24c0000000 movzx   ebx,word ptr [rsp+0C0h]
fffff804`0b8d8eb4 4533ed          xor     r13d,r13d
fffff804`0b8d8eb7 488b7c2428      mov     rdi,qword ptr [rsp+28h]
fffff804`0b8d8ebc 8b6c2420        mov     ebp,dword ptr [rsp+20h]
fffff804`0b8d8ec0 4c8bbc24b0000000 mov     r15,qword ptr [rsp+0B0h]

storport!RaidInitializePerfOptsPassive+0x5f4:
fffff804`0b8d8ec8 4c8b15e9320400  mov     r10,qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff804`0b91c1b8)]
fffff804`0b8d8ecf e84c4864fd      call    nt!KeQueryHighestNodeNumber (fffff804`08f1d720)
fffff804`0b8d8ed4 0fb7c0          movzx   eax,ax
fffff804`0b8d8ed7 4103c6          add     eax,r14d
fffff804`0b8d8eda 0f84ea010000    je      storport!RaidInitializePerfOptsPassive+0x7f6 (fffff804`0b8d90ca)  Branch

storport!RaidInitializePerfOptsPassive+0x60c:
fffff804`0b8d8ee0 488d9f08010000  lea     rbx,[rdi+108h]
fffff804`0b8d8ee7 33ed            xor     ebp,ebp

storport!RaidInitializePerfOptsPassive+0x615:
fffff804`0b8d8ee9 4d8bc7          mov     r8,r15
fffff804`0b8d8eec 33d2            xor     edx,edx
fffff804`0b8d8eee 488bcf          mov     rcx,rdi
fffff804`0b8d8ef1 e8ca9efeff      call    storport!memset (fffff804`0b8c2dc0)
fffff804`0b8d8ef6 4c8bc7          mov     r8,rdi
fffff804`0b8d8ef9 488bd3          mov     rdx,rbx
fffff804`0b8d8efc 410fb7cd        movzx   ecx,r13w
fffff804`0b8d8f00 4c8b1551310400  mov     r10,qword ptr [storport!_imp_KeQueryNodeActiveAffinity (fffff804`0b91c058)]
fffff804`0b8d8f07 e8344864fd      call    nt!KeQueryNodeActiveAffinity (fffff804`08f1d740)
fffff804`0b8d8f0c 0fb70f          movzx   ecx,word ptr [rdi]
fffff804`0b8d8f0f 6685c9          test    cx,cx
fffff804`0b8d8f12 0f8488010000    je      storport!RaidInitializePerfOptsPassive+0x7cc (fffff804`0b8d90a0)  Branch

storport!RaidInitializePerfOptsPassive+0x644:
fffff804`0b8d8f18 488b13          mov     rdx,qword ptr [rbx]
fffff804`0b8d8f1b 440fb7cd        movzx   r9d,bp
fffff804`0b8d8f1f 448be5          mov     r12d,ebp
fffff804`0b8d8f22 440fb7c5        movzx   r8d,bp
fffff804`0b8d8f26 4885d2          test    rdx,rdx
fffff804`0b8d8f29 7421            je      storport!RaidInitializePerfOptsPassive+0x678 (fffff804`0b8d8f4c)  Branch

storport!RaidInitializePerfOptsPassive+0x657:
fffff804`0b8d8f2b 4184d6          test    r14b,dl
fffff804`0b8d8f2e 7410            je      storport!RaidInitializePerfOptsPassive+0x66c (fffff804`0b8d8f40)  Branch

storport!RaidInitializePerfOptsPassive+0x65c:
fffff804`0b8d8f30 410fb7c1        movzx   eax,r9w
fffff804`0b8d8f34 664503ce        add     r9w,r14w
fffff804`0b8d8f38 410fb7c8        movzx   ecx,r8w
fffff804`0b8d8f3c 894c8704        mov     dword ptr [rdi+rax*4+4],ecx

storport!RaidInitializePerfOptsPassive+0x66c:
fffff804`0b8d8f40 664503c6        add     r8w,r14w
fffff804`0b8d8f44 48d1ea          shr     rdx,1
fffff804`0b8d8f47 75e2            jne     storport!RaidInitializePerfOptsPassive+0x657 (fffff804`0b8d8f2b)  Branch

storport!RaidInitializePerfOptsPassive+0x675:
fffff804`0b8d8f49 0fb70f          movzx   ecx,word ptr [rdi]

storport!RaidInitializePerfOptsPassive+0x678:
fffff804`0b8d8f4c 8bd5            mov     edx,ebp
fffff804`0b8d8f4e 663be9          cmp     bp,cx
fffff804`0b8d8f51 0f83a6000000    jae     storport!RaidInitializePerfOptsPassive+0x729 (fffff804`0b8d8ffd)  Branch

storport!RaidInitializePerfOptsPassive+0x683:
fffff804`0b8d8f57 0fb78f10010000  movzx   ecx,word ptr [rdi+110h]
fffff804`0b8d8f5e 448ac5          mov     r8b,bpl
fffff804`0b8d8f61 4c8bb6c8110000  mov     r14,qword ptr [rsi+11C8h]
fffff804`0b8d8f68 c1e106          shl     ecx,6
fffff804`0b8d8f6b 448bda          mov     r11d,edx
fffff804`0b8d8f6e 428b449f04      mov     eax,dword ptr [rdi+r11*4+4]
fffff804`0b8d8f73 03c1            add     eax,ecx
fffff804`0b8d8f75 468a3c30        mov     r15b,byte ptr [rax+r14]
fffff804`0b8d8f79 4180ffff        cmp     r15b,0FFh
fffff804`0b8d8f7d 750b            jne     storport!RaidInitializePerfOptsPassive+0x6b6 (fffff804`0b8d8f8a)  Branch

storport!RaidInitializePerfOptsPassive+0x6ab:
fffff804`0b8d8f7f 41be01000000    mov     r14d,1
fffff804`0b8d8f85 4503e6          add     r12d,r14d
fffff804`0b8d8f88 eb5d            jmp     storport!RaidInitializePerfOptsPassive+0x713 (fffff804`0b8d8fe7)  Branch

storport!RaidInitializePerfOptsPassive+0x6b6:
fffff804`0b8d8f8a 448b9704010000  mov     r10d,dword ptr [rdi+104h]
fffff804`0b8d8f91 440fb7cd        movzx   r9d,bp
fffff804`0b8d8f95 4585d2          test    r10d,r10d
fffff804`0b8d8f98 7438            je      storport!RaidInitializePerfOptsPassive+0x6fe (fffff804`0b8d8fd2)  Branch

storport!RaidInitializePerfOptsPassive+0x6c6:
fffff804`0b8d8f9a 428b449f04      mov     eax,dword ptr [rdi+r11*4+4]
fffff804`0b8d8f9f 03c1            add     eax,ecx
fffff804`0b8d8fa1 428a0c30        mov     cl,byte ptr [rax+r14]
fffff804`0b8d8fa5 41be01000000    mov     r14d,1

storport!RaidInitializePerfOptsPassive+0x6d7:
fffff804`0b8d8fab 410fb7c1        movzx   eax,r9w
fffff804`0b8d8faf 450fb6c0        movzx   r8d,r8b
fffff804`0b8d8fb3 3a8c3818010000  cmp     cl,byte ptr [rax+rdi+118h]
fffff804`0b8d8fba 450f44c6        cmove   r8d,r14d
fffff804`0b8d8fbe 664503ce        add     r9w,r14w
fffff804`0b8d8fc2 410fb7c1        movzx   eax,r9w
fffff804`0b8d8fc6 413bc2          cmp     eax,r10d
fffff804`0b8d8fc9 72e0            jb      storport!RaidInitializePerfOptsPassive+0x6d7 (fffff804`0b8d8fab)  Branch

storport!RaidInitializePerfOptsPassive+0x6f7:
fffff804`0b8d8fcb 4584c0          test    r8b,r8b
fffff804`0b8d8fce 7517            jne     storport!RaidInitializePerfOptsPassive+0x713 (fffff804`0b8d8fe7)  Branch

storport!RaidInitializePerfOptsPassive+0x6fc:
fffff804`0b8d8fd0 eb06            jmp     storport!RaidInitializePerfOptsPassive+0x704 (fffff804`0b8d8fd8)  Branch

storport!RaidInitializePerfOptsPassive+0x6fe:
fffff804`0b8d8fd2 41be01000000    mov     r14d,1

storport!RaidInitializePerfOptsPassive+0x704:
fffff804`0b8d8fd8 4588bc3a18010000 mov     byte ptr [r10+rdi+118h],r15b
fffff804`0b8d8fe0 4401b704010000  add     dword ptr [rdi+104h],r14d

storport!RaidInitializePerfOptsPassive+0x713:
fffff804`0b8d8fe7 0fb70f          movzx   ecx,word ptr [rdi]
fffff804`0b8d8fea 4103d6          add     edx,r14d
fffff804`0b8d8fed 3bd1            cmp     edx,ecx
fffff804`0b8d8fef 0f8262ffffff    jb      storport!RaidInitializePerfOptsPassive+0x683 (fffff804`0b8d8f57)  Branch

storport!RaidInitializePerfOptsPassive+0x721:
fffff804`0b8d8ff5 4c8bbc24b0000000 mov     r15,qword ptr [rsp+0B0h]

storport!RaidInitializePerfOptsPassive+0x729:
fffff804`0b8d8ffd 448b8704010000  mov     r8d,dword ptr [rdi+104h]
fffff804`0b8d9004 440fb7dd        movzx   r11d,bp
fffff804`0b8d9008 4585c0          test    r8d,r8d
fffff804`0b8d900b 0f848f000000    je      storport!RaidInitializePerfOptsPassive+0x7cc (fffff804`0b8d90a0)  Branch

storport!RaidInitializePerfOptsPassive+0x73d:
fffff804`0b8d9011 4585e4          test    r12d,r12d
fffff804`0b8d9014 0f8486000000    je      storport!RaidInitializePerfOptsPassive+0x7cc (fffff804`0b8d90a0)  Branch

storport!RaidInitializePerfOptsPassive+0x746:
fffff804`0b8d901a 33d2            xor     edx,edx
fffff804`0b8d901c 418d4424ff      lea     eax,[r12-1]
fffff804`0b8d9021 4103c0          add     eax,r8d
fffff804`0b8d9024 448bcd          mov     r9d,ebp
fffff804`0b8d9027 41f7f0          div     eax,r8d
fffff804`0b8d902a 448bc5          mov     r8d,ebp
fffff804`0b8d902d 448bf0          mov     r14d,eax
fffff804`0b8d9030 663be9          cmp     bp,cx
fffff804`0b8d9033 7365            jae     storport!RaidInitializePerfOptsPassive+0x7c6 (fffff804`0b8d909a)  Branch

storport!RaidInitializePerfOptsPassive+0x761:
fffff804`0b8d9035 bb01000000      mov     ebx,1

storport!RaidInitializePerfOptsPassive+0x766:
fffff804`0b8d903a 0fb78f10010000  movzx   ecx,word ptr [rdi+110h]
fffff804`0b8d9041 4c8b96c8110000  mov     r10,qword ptr [rsi+11C8h]
fffff804`0b8d9048 418bc0          mov     eax,r8d
fffff804`0b8d904b c1e106          shl     ecx,6
fffff804`0b8d904e 8b448704        mov     eax,dword ptr [rdi+rax*4+4]
fffff804`0b8d9052 03c1            add     eax,ecx
fffff804`0b8d9054 8bd0            mov     edx,eax
fffff804`0b8d9056 42803c10ff      cmp     byte ptr [rax+r10],0FFh
fffff804`0b8d905b 752b            jne     storport!RaidInitializePerfOptsPassive+0x7b4 (fffff804`0b8d9088)  Branch

storport!RaidInitializePerfOptsPassive+0x789:
fffff804`0b8d905d 410fb7c3        movzx   eax,r11w
fffff804`0b8d9061 4403cb          add     r9d,ebx
fffff804`0b8d9064 8a8c3818010000  mov     cl,byte ptr [rax+rdi+118h]
fffff804`0b8d906b 42880c12        mov     byte ptr [rdx+r10],cl
fffff804`0b8d906f 453bce          cmp     r9d,r14d
fffff804`0b8d9072 7514            jne     storport!RaidInitializePerfOptsPassive+0x7b4 (fffff804`0b8d9088)  Branch

storport!RaidInitializePerfOptsPassive+0x7a0:
fffff804`0b8d9074 410fb7c3        movzx   eax,r11w
fffff804`0b8d9078 33d2            xor     edx,edx
fffff804`0b8d907a 03c3            add     eax,ebx
fffff804`0b8d907c 448bcd          mov     r9d,ebp
fffff804`0b8d907f f7b704010000    div     eax,dword ptr [rdi+104h]
fffff804`0b8d9085 448bda          mov     r11d,edx

storport!RaidInitializePerfOptsPassive+0x7b4:
fffff804`0b8d9088 0fb707          movzx   eax,word ptr [rdi]
fffff804`0b8d908b 4403c3          add     r8d,ebx
fffff804`0b8d908e 443bc0          cmp     r8d,eax
fffff804`0b8d9091 72a7            jb      storport!RaidInitializePerfOptsPassive+0x766 (fffff804`0b8d903a)  Branch

storport!RaidInitializePerfOptsPassive+0x7bf:
fffff804`0b8d9093 488d9f08010000  lea     rbx,[rdi+108h]

storport!RaidInitializePerfOptsPassive+0x7c6:
fffff804`0b8d909a 41be01000000    mov     r14d,1

storport!RaidInitializePerfOptsPassive+0x7cc:
fffff804`0b8d90a0 664503ee        add     r13w,r14w
fffff804`0b8d90a4 4c8b150d310400  mov     r10,qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff804`0b91c1b8)]
fffff804`0b8d90ab e8704664fd      call    nt!KeQueryHighestNodeNumber (fffff804`08f1d720)
fffff804`0b8d90b0 0fb7c8          movzx   ecx,ax
fffff804`0b8d90b3 4103ce          add     ecx,r14d
fffff804`0b8d90b6 410fb7c5        movzx   eax,r13w
fffff804`0b8d90ba 3bc1            cmp     eax,ecx
fffff804`0b8d90bc 0f8227feffff    jb      storport!RaidInitializePerfOptsPassive+0x615 (fffff804`0b8d8ee9)  Branch

storport!RaidInitializePerfOptsPassive+0x7ee:
fffff804`0b8d90c2 0fb79c24c0000000 movzx   ebx,word ptr [rsp+0C0h]

storport!RaidInitializePerfOptsPassive+0x7f6:
fffff804`0b8d90ca ba52614472      mov     edx,72446152h
fffff804`0b8d90cf 488bcf          mov     rcx,rdi
fffff804`0b8d90d2 4c8b157f310400  mov     r10,qword ptr [storport!_imp_ExFreePoolWithTag (fffff804`0b91c258)]
fffff804`0b8d90d9 e832dfd6fd      call    nt!ExFreePool (fffff804`09647010)
fffff804`0b8d90de 33c0            xor     eax,eax
fffff804`0b8d90e0 440fb7f8        movzx   r15d,ax
fffff804`0b8d90e4 66898424b0000000 mov     word ptr [rsp+0B0h],ax
fffff804`0b8d90ec 663b86b6110000  cmp     ax,word ptr [rsi+11B6h]
fffff804`0b8d90f3 0f83e5010000    jae     storport!RaidInitializePerfOptsPassive+0xa0a (fffff804`0b8d92de)  Branch

storport!RaidInitializePerfOptsPassive+0x825:
fffff804`0b8d90f9 4c8b6c2438      mov     r13,qword ptr [rsp+38h]
fffff804`0b8d90fe 33ed            xor     ebp,ebp
fffff804`0b8d9100 8b9c24b8000000  mov     ebx,dword ptr [rsp+0B8h]

storport!RaidInitializePerfOptsPassive+0x833:
fffff804`0b8d9107 448bf3          mov     r14d,ebx
fffff804`0b8d910a 450fb7e7        movzx   r12d,r15w
fffff804`0b8d910e 450faff4        imul    r14d,r12d
fffff804`0b8d9112 410fb7cf        movzx   ecx,r15w
fffff804`0b8d9116 4d03f5          add     r14,r13
fffff804`0b8d9119 6641396e02      cmp     word ptr [r14+2],bp
fffff804`0b8d911e 0f8688000000    jbe     storport!RaidInitializePerfOptsPassive+0x8d8 (fffff804`0b8d91ac)  Branch

storport!RaidInitializePerfOptsPassive+0x850:
fffff804`0b8d9124 410fb77e02      movzx   edi,word ptr [r14+2]
fffff804`0b8d9129 4c8b15b0310400  mov     r10,qword ptr [storport!_imp_KeQueryActiveProcessorCountEx (fffff804`0b91c2e0)]
fffff804`0b8d9130 e85bbe56fd      call    nt!KeQueryActiveProcessorCountEx (fffff804`08e44f90)
fffff804`0b8d9135 ffc8            dec     eax
fffff804`0b8d9137 33d2            xor     edx,edx
fffff804`0b8d9139 03c7            add     eax,edi
fffff804`0b8d913b f7f7            div     eax,edi
fffff804`0b8d913d 448bd8          mov     r11d,eax
fffff804`0b8d9140 4183eb01        sub     r11d,1
fffff804`0b8d9144 0f8467010000    je      storport!RaidInitializePerfOptsPassive+0x9dd (fffff804`0b8d92b1)  Branch

storport!RaidInitializePerfOptsPassive+0x876:
fffff804`0b8d914a 0fb7fd          movzx   edi,bp
fffff804`0b8d914d 41c1e406        shl     r12d,6
fffff804`0b8d9151 448bcd          mov     r9d,ebp
fffff804`0b8d9154 448bc5          mov     r8d,ebp
fffff804`0b8d9157 bb01000000      mov     ebx,1

storport!RaidInitializePerfOptsPassive+0x888:
fffff804`0b8d915c 4c8b96c8110000  mov     r10,qword ptr [rsi+11C8h]
fffff804`0b8d9163 438d0404        lea     eax,[r12+r8]
fffff804`0b8d9167 8bd0            mov     edx,eax
fffff804`0b8d9169 42803c10ff      cmp     byte ptr [rax+r10],0FFh
fffff804`0b8d916e 7527            jne     storport!RaidInitializePerfOptsPassive+0x8c3 (fffff804`0b8d9197)  Branch

storport!RaidInitializePerfOptsPassive+0x89c:
fffff804`0b8d9170 0fb7c7          movzx   eax,di
fffff804`0b8d9173 4403cb          add     r9d,ebx
fffff804`0b8d9176 428a4c3004      mov     cl,byte ptr [rax+r14+4]
fffff804`0b8d917b 42880c12        mov     byte ptr [rdx+r10],cl
fffff804`0b8d917f 453bcb          cmp     r9d,r11d
fffff804`0b8d9182 7513            jne     storport!RaidInitializePerfOptsPassive+0x8c3 (fffff804`0b8d9197)  Branch

storport!RaidInitializePerfOptsPassive+0x8b0:
fffff804`0b8d9184 410fb74e02      movzx   ecx,word ptr [r14+2]
fffff804`0b8d9189 33d2            xor     edx,edx
fffff804`0b8d918b 0fb7c7          movzx   eax,di
fffff804`0b8d918e 448bcd          mov     r9d,ebp
fffff804`0b8d9191 03c3            add     eax,ebx
fffff804`0b8d9193 f7f1            div     eax,ecx
fffff804`0b8d9195 8bfa            mov     edi,edx

storport!RaidInitializePerfOptsPassive+0x8c3:
fffff804`0b8d9197 4403c3          add     r8d,ebx
fffff804`0b8d919a 4183f840        cmp     r8d,40h
fffff804`0b8d919e 72bc            jb      storport!RaidInitializePerfOptsPassive+0x888 (fffff804`0b8d915c)  Branch

storport!RaidInitializePerfOptsPassive+0x8cc:
fffff804`0b8d91a0 8b9c24b8000000  mov     ebx,dword ptr [rsp+0B8h]
fffff804`0b8d91a7 e905010000      jmp     storport!RaidInitializePerfOptsPassive+0x9dd (fffff804`0b8d92b1)  Branch

storport!RaidInitializePerfOptsPassive+0x8d8:
fffff804`0b8d91ac 8b7c2430        mov     edi,dword ptr [rsp+30h]
fffff804`0b8d91b0 440fb7f5        movzx   r14d,bp
fffff804`0b8d91b4 c1ef02          shr     edi,2
fffff804`0b8d91b7 4c8b1522310400  mov     r10,qword ptr [storport!_imp_KeQueryActiveProcessorCountEx (fffff804`0b91c2e0)]
fffff804`0b8d91be e8cdbd56fd      call    nt!KeQueryActiveProcessorCountEx (fffff804`08e44f90)
fffff804`0b8d91c3 33d2            xor     edx,edx
fffff804`0b8d91c5 41c1e406        shl     r12d,6
fffff804`0b8d91c9 ffc8            dec     eax
fffff804`0b8d91cb 440fb7c5        movzx   r8d,bp
fffff804`0b8d91cf 03c7            add     eax,edi
fffff804`0b8d91d1 448bd5          mov     r10d,ebp
fffff804`0b8d91d4 f7f7            div     eax,edi
fffff804`0b8d91d6 448bcd          mov     r9d,ebp
fffff804`0b8d91d9 498bd5          mov     rdx,r13
fffff804`0b8d91dc 89442428        mov     dword ptr [rsp+28h],eax
fffff804`0b8d91e0 8be8            mov     ebp,eax
fffff804`0b8d91e2 4533ff          xor     r15d,r15d

storport!RaidInitializePerfOptsPassive+0x911:
fffff804`0b8d91e5 488bbec8110000  mov     rdi,qword ptr [rsi+11C8h]
fffff804`0b8d91ec 438d040c        lea     eax,[r12+r9]
fffff804`0b8d91f0 448bd8          mov     r11d,eax
fffff804`0b8d91f3 803c38ff        cmp     byte ptr [rax+rdi],0FFh
fffff804`0b8d91f7 0f8596000000    jne     storport!RaidInitializePerfOptsPassive+0x9bf (fffff804`0b8d9293)  Branch

storport!RaidInitializePerfOptsPassive+0x929:
fffff804`0b8d91fd 6644397a02      cmp     word ptr [rdx+2],r15w
fffff804`0b8d9202 7543            jne     storport!RaidInitializePerfOptsPassive+0x973 (fffff804`0b8d9247)  Branch

storport!RaidInitializePerfOptsPassive+0x930:
fffff804`0b8d9204 440fb7aeb6110000 movzx   r13d,word ptr [rsi+11B6h]
fffff804`0b8d920c 488b5c2438      mov     rbx,qword ptr [rsp+38h]
fffff804`0b8d9211 8bac24b8000000  mov     ebp,dword ptr [rsp+0B8h]
fffff804`0b8d9218 410fb7ce        movzx   ecx,r14w

storport!RaidInitializePerfOptsPassive+0x948:
fffff804`0b8d921c 33d2            xor     edx,edx           ;RSI==AdapterExt
fffff804`0b8d921e 8d4101          lea     eax,[rcx+1]
fffff804`0b8d9221 41f7f5          div     eax,r13d
fffff804`0b8d9224 0fb7ca          movzx   ecx,dx
fffff804`0b8d9227 448bf2          mov     r14d,edx
fffff804`0b8d922a 8bd1            mov     edx,ecx
fffff804`0b8d922c 0fafd5          imul    edx,ebp
fffff804`0b8d922f 4803d3          add     rdx,rbx
fffff804`0b8d9232 6644397a02      cmp     word ptr [rdx+2],r15w
fffff804`0b8d9237 74e3            je      storport!RaidInitializePerfOptsPassive+0x948 (fffff804`0b8d921c)  Branch

storport!RaidInitializePerfOptsPassive+0x965:
fffff804`0b8d9239 8b6c2428        mov     ebp,dword ptr [rsp+28h]
fffff804`0b8d923d 4c8beb          mov     r13,rbx
fffff804`0b8d9240 8b9c24b8000000  mov     ebx,dword ptr [rsp+0B8h]

storport!RaidInitializePerfOptsPassive+0x973:
fffff804`0b8d9247 410fb7c0        movzx   eax,r8w
fffff804`0b8d924b 8a4c1004        mov     cl,byte ptr [rax+rdx+4]
fffff804`0b8d924f 41880c3b        mov     byte ptr [r11+rdi],cl
fffff804`0b8d9253 41bb01000000    mov     r11d,1
fffff804`0b8d9259 4503d3          add     r10d,r11d
fffff804`0b8d925c 443bd5          cmp     r10d,ebp
fffff804`0b8d925f 7538            jne     storport!RaidInitializePerfOptsPassive+0x9c5 (fffff804`0b8d9299)  Branch

storport!RaidInitializePerfOptsPassive+0x98d:
fffff804`0b8d9261 664503c3        add     r8w,r11w
fffff804`0b8d9265 458bd7          mov     r10d,r15d
fffff804`0b8d9268 66443b4202      cmp     r8w,word ptr [rdx+2]
fffff804`0b8d926d 752a            jne     storport!RaidInitializePerfOptsPassive+0x9c5 (fffff804`0b8d9299)  Branch

storport!RaidInitializePerfOptsPassive+0x99b:
fffff804`0b8d926f 0fb78eb6110000  movzx   ecx,word ptr [rsi+11B6h]
fffff804`0b8d9276 33d2            xor     edx,edx
fffff804`0b8d9278 410fb7c6        movzx   eax,r14w
fffff804`0b8d927c 458bc7          mov     r8d,r15d
fffff804`0b8d927f 4103c3          add     eax,r11d
fffff804`0b8d9282 f7f1            div     eax,ecx
fffff804`0b8d9284 440fb7f2        movzx   r14d,dx
fffff804`0b8d9288 418bd6          mov     edx,r14d
fffff804`0b8d928b 0fafd3          imul    edx,ebx
fffff804`0b8d928e 4903d5          add     rdx,r13
fffff804`0b8d9291 eb06            jmp     storport!RaidInitializePerfOptsPassive+0x9c5 (fffff804`0b8d9299)  Branch

storport!RaidInitializePerfOptsPassive+0x9bf:
fffff804`0b8d9293 41bb01000000    mov     r11d,1

storport!RaidInitializePerfOptsPassive+0x9c5:
fffff804`0b8d9299 4503cb          add     r9d,r11d
fffff804`0b8d929c 4183f940        cmp     r9d,40h
fffff804`0b8d92a0 0f823fffffff    jb      storport!RaidInitializePerfOptsPassive+0x911 (fffff804`0b8d91e5)  Branch

storport!RaidInitializePerfOptsPassive+0x9d2:
fffff804`0b8d92a6 440fb7bc24b0000000 movzx r15d,word ptr [rsp+0B0h]
fffff804`0b8d92af 33ed            xor     ebp,ebp

storport!RaidInitializePerfOptsPassive+0x9dd:
fffff804`0b8d92b1 41be01000000    mov     r14d,1
fffff804`0b8d92b7 664503fe        add     r15w,r14w
fffff804`0b8d92bb 664489bc24b0000000 mov   word ptr [rsp+0B0h],r15w
fffff804`0b8d92c4 66443bbeb6110000 cmp     r15w,word ptr [rsi+11B6h]
fffff804`0b8d92cc 0f8235feffff    jb      storport!RaidInitializePerfOptsPassive+0x833 (fffff804`0b8d9107)  Branch

storport!RaidInitializePerfOptsPassive+0x9fe:
fffff804`0b8d92d2 0fb79c24c0000000 movzx   ebx,word ptr [rsp+0C0h]
fffff804`0b8d92da 8b6c2420        mov     ebp,dword ptr [rsp+20h]

storport!RaidInitializePerfOptsPassive+0xa0a:
fffff804`0b8d92de 488b4c2438      mov     rcx,qword ptr [rsp+38h]
fffff804`0b8d92e3 ba52614472      mov     edx,72446152h
fffff804`0b8d92e8 4c8b15692f0400  mov     r10,qword ptr [storport!_imp_ExFreePoolWithTag (fffff804`0b91c258)]
fffff804`0b8d92ef e81cddd6fd      call    nt!ExFreePool (fffff804`09647010)
fffff804`0b8d92f4 b8feff0000      mov     eax,0FFFEh
fffff804`0b8d92f9 6623d8          and     bx,ax
fffff804`0b8d92fc 0fb786b4110000  movzx   eax,word ptr [rsi+11B4h]
fffff804`0b8d9303 664123c6        and     ax,r14w
fffff804`0b8d9307 660bd8          or      bx,ax
fffff804`0b8d930a 6683cb02        or      bx,2
fffff804`0b8d930e 66899eb4110000  mov     word ptr [rsi+11B4h],bx
fffff804`0b8d9315 e990f6ffff      jmp     storport!RaidInitializePerfOptsPassive+0xd6 (fffff804`0b8d89aa)  Branch
