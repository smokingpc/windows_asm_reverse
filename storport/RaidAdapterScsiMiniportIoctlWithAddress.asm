0: kd> uf storport!RaidAdapterScsiMiniportIoctlWithAddress
storport!RaidAdapterScsiMiniportIoctlWithAddress:
fffff800`294b7a60 4c8bdc          mov     r11,rsp
fffff800`294b7a63 49895b08        mov     qword ptr [r11+8],rbx
fffff800`294b7a67 45894b20        mov     dword ptr [r11+20h],r9d
fffff800`294b7a6b 45894318        mov     dword ptr [r11+18h],r8d
fffff800`294b7a6f 55              push    rbp
fffff800`294b7a70 56              push    rsi
fffff800`294b7a71 57              push    rdi
fffff800`294b7a72 4154            push    r12
fffff800`294b7a74 4155            push    r13
fffff800`294b7a76 4156            push    r14
fffff800`294b7a78 4157            push    r15
fffff800`294b7a7a 4883ec60        sub     rsp,60h
fffff800`294b7a7e 4c8bea          mov     r13,rdx
fffff800`294b7a81 c744242002000000 mov     dword ptr [rsp+20h],2
fffff800`294b7a89 488bf1          mov     rsi,rcx
fffff800`294b7a8c 4d8d4ba0        lea     r9,[r11-60h]
fffff800`294b7a90 33c0            xor     eax,eax
fffff800`294b7a92 4d8d439c        lea     r8,[r11-64h]
fffff800`294b7a96 33ed            xor     ebp,ebp
fffff800`294b7a98 89442430        mov     dword ptr [rsp+30h],eax
fffff800`294b7a9c 48216c2450      and     qword ptr [rsp+50h],rbp
fffff800`294b7aa1 498d53c0        lea     rdx,[r11-40h]
fffff800`294b7aa5 4533e4          xor     r12d,r12d
fffff800`294b7aa8 498bcd          mov     rcx,r13
fffff800`294b7aab 4c89642448      mov     qword ptr [rsp+48h],r12
fffff800`294b7ab0 4533ff          xor     r15d,r15d
fffff800`294b7ab3 4533f6          xor     r14d,r14d
fffff800`294b7ab6 33db            xor     ebx,ebx
fffff800`294b7ab8 e8affcffff      call    storport!RaidGetSrbIoctlFromIrp (fffff800`294b776c)
fffff800`294b7abd 8bf8            mov     edi,eax
fffff800`294b7abf 85c0            test    eax,eax
fffff800`294b7ac1 7909            jns     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x6c (fffff800`294b7acc)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x63:
fffff800`294b7ac3 41894530        mov     dword ptr [r13+30h],eax
fffff800`294b7ac7 e935030000      jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3a1 (fffff800`294b7e01)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x6c:
fffff800`294b7acc 488b4e08        mov     rcx,qword ptr [rsi+8]
fffff800`294b7ad0 488d8640010000  lea     rax,[rsi+140h]
fffff800`294b7ad7 448a4062        mov     r8b,byte ptr [rax+62h]
fffff800`294b7adb 4533c9          xor     r9d,r9d
fffff800`294b7ade 4889442450      mov     qword ptr [rsp+50h],rax
fffff800`294b7ae3 418d5102        lea     edx,[r9+2]
fffff800`294b7ae7 e814050000      call    storport!RaidAllocateSrb (fffff800`294b8000)
fffff800`294b7aec 4c8bf0          mov     r14,rax
fffff800`294b7aef 4885c0          test    rax,rax
fffff800`294b7af2 750a            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x9e (fffff800`294b7afe)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x94:
fffff800`294b7af4 bf170000c0      mov     edi,0C0000017h
fffff800`294b7af9 e903030000      jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3a1 (fffff800`294b7e01)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x9e:
fffff800`294b7afe 8b8ecc010000    mov     ecx,dword ptr [rsi+1CCh]
fffff800`294b7b04 4c8bc6          mov     r8,rsi
fffff800`294b7b07 83c107          add     ecx,7
fffff800`294b7b0a 83e1f8          and     ecx,0FFFFFFF8h
fffff800`294b7b0d 81c140040000    add     ecx,440h
fffff800`294b7b13 e8e0030000      call    storport!StorAllocateContiguousIoResources (fffff800`294b7ef8)
fffff800`294b7b18 488be8          mov     rbp,rax
fffff800`294b7b1b 4885c0          test    rax,rax
fffff800`294b7b1e 7512            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0xd2 (fffff800`294b7b32)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0xc0:
fffff800`294b7b20 48395e70        cmp     qword ptr [rsi+70h],rbx
fffff800`294b7b24 74ce            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x94 (fffff800`294b7af4)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0xc6:
fffff800`294b7b26 f00fba6e7800    lock bts dword ptr [rsi+78h],0
fffff800`294b7b2c 72c6            jb      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x94 (fffff800`294b7af4)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0xce:
fffff800`294b7b2e 488b6e70        mov     rbp,qword ptr [rsi+70h]

storport!RaidAdapterScsiMiniportIoctlWithAddress+0xd2:
fffff800`294b7b32 488d5d20        lea     rbx,[rbp+20h]
fffff800`294b7b36 4533c9          xor     r9d,r9d
fffff800`294b7b39 488bcb          mov     rcx,rbx
fffff800`294b7b3c 48895c2440      mov     qword ptr [rsp+40h],rbx
fffff800`294b7b41 4533c0          xor     r8d,r8d
fffff800`294b7b44 e8cf5c0000      call    storport!RaidZeroXrb (fffff800`294bd818)
fffff800`294b7b49 4c8b642458      mov     r12,qword ptr [rsp+58h]
fffff800`294b7b4e 488bcb          mov     rcx,rbx
fffff800`294b7b51 448b442434      mov     r8d,dword ptr [rsp+34h]
fffff800`294b7b56 498bd4          mov     rdx,r12
fffff800`294b7b59 e83afdffff      call    storport!RaidBuildMdlForXrb (fffff800`294b7898)
fffff800`294b7b5e 8bf8            mov     edi,eax
fffff800`294b7b60 85c0            test    eax,eax
fffff800`294b7b62 0f8896020000    js      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x39e (fffff800`294b7dfe)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x108:
fffff800`294b7b68 83bc24c800000001 cmp     dword ptr [rsp+0C8h],1
fffff800`294b7b70 8a8424c0000000  mov     al,byte ptr [rsp+0C0h]
fffff800`294b7b77 8b9424b0000000  mov     edx,dword ptr [rsp+0B0h]
fffff800`294b7b7e 8b8c24b8000000  mov     ecx,dword ptr [rsp+0B8h]
fffff800`294b7b85 88442432        mov     byte ptr [rsp+32h],al
fffff800`294b7b89 88542430        mov     byte ptr [rsp+30h],dl
fffff800`294b7b8d 884c2431        mov     byte ptr [rsp+31h],cl
fffff800`294b7b91 8b5c2430        mov     ebx,dword ptr [rsp+30h]
fffff800`294b7b95 7529            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x160 (fffff800`294b7bc0)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x137:
fffff800`294b7b97 8bd3            mov     edx,ebx
fffff800`294b7b99 488bce          mov     rcx,rsi
fffff800`294b7b9c e857fdffff      call    storport!RaidAdapterFindUnit (fffff800`294b78f8)
fffff800`294b7ba1 8b8c24b8000000  mov     ecx,dword ptr [rsp+0B8h]
fffff800`294b7ba8 4c8bf8          mov     r15,rax
fffff800`294b7bab 8b9424b0000000  mov     edx,dword ptr [rsp+0B0h]
fffff800`294b7bb2 48898500010000  mov     qword ptr [rbp+100h],rax
fffff800`294b7bb9 8a8424c0000000  mov     al,byte ptr [rsp+0C0h]

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x160:
fffff800`294b7bc0 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff800`294b7bc5 4180786201      cmp     byte ptr [r8+62h],1
fffff800`294b7bca 0f8590000000    jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x200 (fffff800`294b7c60)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x170:
fffff800`294b7bd0 488b442440      mov     rax,qword ptr [rsp+40h]
fffff800`294b7bd5 498bcd          mov     rcx,r13
fffff800`294b7bd8 418b7e34        mov     edi,dword ptr [r14+34h]
fffff800`294b7bdc 49894660        mov     qword ptr [r14+60h],rax
fffff800`294b7be0 4c89742448      mov     qword ptr [rsp+48h],r14
fffff800`294b7be5 4d896e50        mov     qword ptr [r14+50h],r13
fffff800`294b7be9 41c7461402000000 mov     dword ptr [r14+14h],2
fffff800`294b7bf1 41c74618c0000000 mov     dword ptr [r14+18h],0C0h
fffff800`294b7bf9 48ff1538f50500  call    qword ptr [storport!_imp_IoGetIoPriorityHint (fffff800`29517138)]
fffff800`294b7c00 0f1f440000      nop     dword ptr [rax+rax]
fffff800`294b7c05 6641894624      mov     word ptr [r14+24h],ax
fffff800`294b7c0a 418b44240c      mov     eax,dword ptr [r12+0Ch]
fffff800`294b7c0f 41894628        mov     dword ptr [r14+28h],eax
fffff800`294b7c13 8b442434        mov     eax,dword ptr [rsp+34h]
fffff800`294b7c17 4189463c        mov     dword ptr [r14+3Ch],eax
fffff800`294b7c1b 8b8424b0000000  mov     eax,dword ptr [rsp+0B0h]
fffff800`294b7c22 4d896640        mov     qword ptr [r14+40h],r12
fffff800`294b7c26 4288443708      mov     byte ptr [rdi+r14+8],al
fffff800`294b7c2b 8b8424b8000000  mov     eax,dword ptr [rsp+0B8h]
fffff800`294b7c32 4288443709      mov     byte ptr [rdi+r14+9],al
fffff800`294b7c37 8a8424c0000000  mov     al,byte ptr [rsp+0C0h]
fffff800`294b7c3e 428844370a      mov     byte ptr [rdi+r14+0Ah],al
fffff800`294b7c43 488b7c2440      mov     rdi,qword ptr [rsp+40h]
fffff800`294b7c48 4c89b5c8000000  mov     qword ptr [rbp+0C8h],r14
fffff800`294b7c4f 498b4650        mov     rax,qword ptr [r14+50h]
fffff800`294b7c53 488985d0000000  mov     qword ptr [rbp+0D0h],rax
fffff800`294b7c5a 498b4640        mov     rax,qword ptr [r14+40h]
fffff800`294b7c5e eb53            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x253 (fffff800`294b7cb3)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x200:
fffff800`294b7c60 488b7c2440      mov     rdi,qword ptr [rsp+40h]
fffff800`294b7c65 41b858000000    mov     r8d,58h
fffff800`294b7c6b 41884607        mov     byte ptr [r14+7],al
fffff800`294b7c6f 8b442434        mov     eax,dword ptr [rsp+34h]
fffff800`294b7c73 41894610        mov     dword ptr [r14+10h],eax
fffff800`294b7c77 4d896618        mov     qword ptr [r14+18h],r12
fffff800`294b7c7b 49897e30        mov     qword ptr [r14+30h],rdi
fffff800`294b7c7f 66458906        mov     word ptr [r14],r8w
fffff800`294b7c83 41c6460202      mov     byte ptr [r14+2],2
fffff800`294b7c88 41885605        mov     byte ptr [r14+5],dl
fffff800`294b7c8c 41884e06        mov     byte ptr [r14+6],cl
fffff800`294b7c90 41c7460cc0000000 mov     dword ptr [r14+0Ch],0C0h
fffff800`294b7c98 418b44240c      mov     eax,dword ptr [r12+0Ch]
fffff800`294b7c9d 41894614        mov     dword ptr [r14+14h],eax
fffff800`294b7ca1 4c89b5c8000000  mov     qword ptr [rbp+0C8h],r14
fffff800`294b7ca8 4c89add0000000  mov     qword ptr [rbp+0D0h],r13
fffff800`294b7caf 498b4618        mov     rax,qword ptr [r14+18h]

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x253:
fffff800`294b7cb3 4c8d8540040000  lea     r8,[rbp+440h]
fffff800`294b7cba 488985d8000000  mov     qword ptr [rbp+0D8h],rax
fffff800`294b7cc1 498bd6          mov     rdx,r14
fffff800`294b7cc4 488bce          mov     rcx,rsi
fffff800`294b7cc7 e868fdffff      call    storport!RaSrbSetMiniportContext (fffff800`294b7a34)
fffff800`294b7ccc 4c8da5b8020000  lea     r12,[rbp+2B8h]
fffff800`294b7cd3 4533c0          xor     r8d,r8d
fffff800`294b7cd6 498bcc          mov     rcx,r12
fffff800`294b7cd9 33d2            xor     edx,edx
fffff800`294b7cdb 48ff1566f50500  call    qword ptr [storport!_imp_KeInitializeEvent (fffff800`29517248)]
fffff800`294b7ce2 0f1f440000      nop     dword ptr [rax+rax]
fffff800`294b7ce7 488d0572970000  lea     rax,[storport!RaidXrbSignalCompletion (fffff800`294c1460)]
fffff800`294b7cee 488985b0020000  mov     qword ptr [rbp+2B0h],rax
fffff800`294b7cf5 4883be2014000000 cmp     qword ptr [rsi+1420h],0
fffff800`294b7cfd 740e            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2ad (fffff800`294b7d0d)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x29f:
fffff800`294b7cff 33d2            xor     edx,edx
fffff800`294b7d01 488bce          mov     rcx,rsi
fffff800`294b7d04 448d4201        lea     r8d,[rdx+1]
fffff800`294b7d08 e8bba60100      call    storport!RaidAdapterPoFxActivateComponent (fffff800`294d23c8)

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2ad:
fffff800`294b7d0d 80bea211000000  cmp     byte ptr [rsi+11A2h],0
fffff800`294b7d14 488bd7          mov     rdx,rdi
fffff800`294b7d17 488bce          mov     rcx,rsi
fffff800`294b7d1a 7407            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2c3 (fffff800`294b7d23)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2bc:
fffff800`294b7d1c e8dbb1ffff      call    storport!RaidAdapterRaiseIrqlAndExecuteXrb (fffff800`294b2efc)
fffff800`294b7d21 eb05            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2c8 (fffff800`294b7d28)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2c3:
fffff800`294b7d23 e830b2ffff      call    storport!RaidAdapterExecuteXrb (fffff800`294b2f58)

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2c8:
fffff800`294b7d28 8bf8            mov     edi,eax
fffff800`294b7d2a 85c0            test    eax,eax
fffff800`294b7d2c 7828            js      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2f6 (fffff800`294b7d56)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2ce:
fffff800`294b7d2e 488364242000    and     qword ptr [rsp+20h],0
fffff800`294b7d34 4533c9          xor     r9d,r9d
fffff800`294b7d37 4533c0          xor     r8d,r8d
fffff800`294b7d3a 33d2            xor     edx,edx
fffff800`294b7d3c 498bcc          mov     rcx,r12
fffff800`294b7d3f 48ff152af50500  call    qword ptr [storport!_imp_KeWaitForSingleObject (fffff800`29517270)]
fffff800`294b7d46 0f1f440000      nop     dword ptr [rax+rax]
fffff800`294b7d4b 418a4e03        mov     cl,byte ptr [r14+3]
fffff800`294b7d4f e8b85e0000      call    storport!RaidSrbStatusToNtStatus (fffff800`294bdc0c)
fffff800`294b7d54 8bf8            mov     edi,eax

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2f6:
fffff800`294b7d56 8a4531          mov     al,byte ptr [rbp+31h]
fffff800`294b7d59 a801            test    al,1
fffff800`294b7d5b 7418            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x315 (fffff800`294b7d75)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x2fd:
fffff800`294b7d5d 8b950c030000    mov     edx,dword ptr [rbp+30Ch]
fffff800`294b7d63 4533c0          xor     r8d,r8d
fffff800`294b7d66 488bce          mov     rcx,rsi
fffff800`294b7d69 e81ea60100      call    storport!RaidAdapterPoFxIdleComponent (fffff800`294d238c)
fffff800`294b7d6e 806531fe        and     byte ptr [rbp+31h],0FEh
fffff800`294b7d72 8a4531          mov     al,byte ptr [rbp+31h]

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x315:
fffff800`294b7d75 a802            test    al,2
fffff800`294b7d77 7462            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x37b (fffff800`294b7ddb)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x319:
fffff800`294b7d79 448ba424c8000000 mov     r12d,dword ptr [rsp+0C8h]
fffff800`294b7d81 4183fc01        cmp     r12d,1
fffff800`294b7d85 7429            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x350 (fffff800`294b7db0)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x327:
fffff800`294b7d87 8bd3            mov     edx,ebx
fffff800`294b7d89 488bce          mov     rcx,rsi
fffff800`294b7d8c e867fbffff      call    storport!RaidAdapterFindUnit (fffff800`294b78f8)
fffff800`294b7d91 4c8bf8          mov     r15,rax
fffff800`294b7d94 4885c0          test    rax,rax
fffff800`294b7d97 7410            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x349 (fffff800`294b7da9)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x339:
fffff800`294b7d99 41b001          mov     r8b,1
fffff800`294b7d9c 498bd5          mov     rdx,r13
fffff800`294b7d9f 488bc8          mov     rcx,rax
fffff800`294b7da2 e889170000      call    storport!RaUnitAcquireRemoveLock (fffff800`294b9530)
fffff800`294b7da7 eb09            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x352 (fffff800`294b7db2)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x349:
fffff800`294b7da9 b8010000c0      mov     eax,0C0000001h
fffff800`294b7dae eb02            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x352 (fffff800`294b7db2)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x350:
fffff800`294b7db0 33c0            xor     eax,eax

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x352:
fffff800`294b7db2 85c0            test    eax,eax
fffff800`294b7db4 7525            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x37b (fffff800`294b7ddb)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x356:
fffff800`294b7db6 4d85ff          test    r15,r15
fffff800`294b7db9 7420            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x37b (fffff800`294b7ddb)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x35b:
fffff800`294b7dbb 8b950c030000    mov     edx,dword ptr [rbp+30Ch]
fffff800`294b7dc1 498bcf          mov     rcx,r15
fffff800`294b7dc4 e867370300      call    storport!RaidUnitPoFxIdleComponentFromMiniport (fffff800`294eb530)
fffff800`294b7dc9 806531fd        and     byte ptr [rbp+31h],0FDh
fffff800`294b7dcd 4183fc01        cmp     r12d,1
fffff800`294b7dd1 7408            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x37b (fffff800`294b7ddb)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x373:
fffff800`294b7dd3 498bcf          mov     rcx,r15
fffff800`294b7dd6 e815170000      call    storport!RaUnitReleaseRemoveLock (fffff800`294b94f0)

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x37b:
fffff800`294b7ddb 4883be2014000000 cmp     qword ptr [rsi+1420h],0
fffff800`294b7de3 740d            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x392 (fffff800`294b7df2)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x385:
fffff800`294b7de5 4533c0          xor     r8d,r8d
fffff800`294b7de8 33d2            xor     edx,edx
fffff800`294b7dea 488bce          mov     rcx,rsi
fffff800`294b7ded e89aa50100      call    storport!RaidAdapterPoFxIdleComponent (fffff800`294d238c)

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x392:
fffff800`294b7df2 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff800`294b7df7 4c8b642448      mov     r12,qword ptr [rsp+48h]
fffff800`294b7dfc eb03            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3a1 (fffff800`294b7e01)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x39e:
fffff800`294b7dfe 4d8be7          mov     r12,r15

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3a1:
fffff800`294b7e01 85ff            test    edi,edi
fffff800`294b7e03 781f            js      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3c4 (fffff800`294b7e24)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3a5:
fffff800`294b7e05 41807e0228      cmp     byte ptr [r14+2],28h
fffff800`294b7e0a 7507            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3b3 (fffff800`294b7e13)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3ac:
fffff800`294b7e0c 418b44243c      mov     eax,dword ptr [r12+3Ch]
fffff800`294b7e11 eb04            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3b7 (fffff800`294b7e17)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3b3:
fffff800`294b7e13 418b4610        mov     eax,dword ptr [r14+10h]

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3b7:
fffff800`294b7e17 39442438        cmp     dword ptr [rsp+38h],eax
fffff800`294b7e1b 0f42442438      cmovb   eax,dword ptr [rsp+38h]
fffff800`294b7e20 8bc8            mov     ecx,eax
fffff800`294b7e22 eb02            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3c6 (fffff800`294b7e26)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3c4:
fffff800`294b7e24 33c9            xor     ecx,ecx

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3c6:
fffff800`294b7e26 49894d38        mov     qword ptr [r13+38h],rcx
fffff800`294b7e2a 4885ed          test    rbp,rbp
fffff800`294b7e2d 742c            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3fb (fffff800`294b7e5b)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3cf:
fffff800`294b7e2f 33d2            xor     edx,edx
fffff800`294b7e31 488bcb          mov     rcx,rbx
fffff800`294b7e34 e80f0e0000      call    storport!RaidXrbDeallocateResources (fffff800`294b8c48)
fffff800`294b7e39 803d339a050000  cmp     byte ptr [storport!ServicingContainment46448137 (fffff800`29511873)],0
fffff800`294b7e40 740e            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3f0 (fffff800`294b7e50)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3e2:
fffff800`294b7e42 483b6e70        cmp     rbp,qword ptr [rsi+70h]
fffff800`294b7e46 7508            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3f0 (fffff800`294b7e50)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3e8:
fffff800`294b7e48 f00fba767800    lock btr dword ptr [rsi+78h],0
fffff800`294b7e4e eb0b            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3fb (fffff800`294b7e5b)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3f0:
fffff800`294b7e50 488bd5          mov     rdx,rbp
fffff800`294b7e53 488bce          mov     rcx,rsi
fffff800`294b7e56 e871000000      call    storport!StorFreeContiguousIoResources (fffff800`294b7ecc)

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x3fb:
fffff800`294b7e5b 4d85f6          test    r14,r14
fffff800`294b7e5e 743f            je      storport!RaidAdapterScsiMiniportIoctlWithAddress+0x43f (fffff800`294b7e9f)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x400:
fffff800`294b7e60 488b442450      mov     rax,qword ptr [rsp+50h]
fffff800`294b7e65 80786201        cmp     byte ptr [rax+62h],1
fffff800`294b7e69 7516            jne     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x421 (fffff800`294b7e81)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x40b:
fffff800`294b7e6b 4d85e4          test    r12,r12
fffff800`294b7e6e 498bc6          mov     rax,r14
fffff800`294b7e71 490f45c4        cmovne  rax,r12
fffff800`294b7e75 4883605000      and     qword ptr [rax+50h],0
fffff800`294b7e7a 4883606800      and     qword ptr [rax+68h],0
fffff800`294b7e7f eb0a            jmp     storport!RaidAdapterScsiMiniportIoctlWithAddress+0x42b (fffff800`294b7e8b)  Branch

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x421:
fffff800`294b7e81 4983663000      and     qword ptr [r14+30h],0
fffff800`294b7e86 4983663800      and     qword ptr [r14+38h],0

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x42b:
fffff800`294b7e8b ba52615372      mov     edx,72536152h
fffff800`294b7e90 498bce          mov     rcx,r14
fffff800`294b7e93 48ff158ef30500  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff800`29517228)]
fffff800`294b7e9a 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterScsiMiniportIoctlWithAddress+0x43f:
fffff800`294b7e9f 448bc7          mov     r8d,edi
fffff800`294b7ea2 33d2            xor     edx,edx
fffff800`294b7ea4 498bcd          mov     rcx,r13
fffff800`294b7ea7 e814500000      call    storport!RaidCompleteRequestEx (fffff800`294bcec0)
fffff800`294b7eac 488b9c24a0000000 mov     rbx,qword ptr [rsp+0A0h]
fffff800`294b7eb4 4883c460        add     rsp,60h
fffff800`294b7eb8 415f            pop     r15
fffff800`294b7eba 415e            pop     r14
fffff800`294b7ebc 415d            pop     r13
fffff800`294b7ebe 415c            pop     r12
fffff800`294b7ec0 5f              pop     rdi
fffff800`294b7ec1 5e              pop     rsi
fffff800`294b7ec2 5d              pop     rbp
fffff800`294b7ec3 c3              ret
