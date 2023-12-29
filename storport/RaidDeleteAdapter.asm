1: kd> uf storport!RaidDeleteAdapter
storport!RaidDeleteAdapter:
fffff809`efc368b8 488bc4          mov     rax,rsp
fffff809`efc368bb 48895808        mov     qword ptr [rax+8],rbx
fffff809`efc368bf 48896810        mov     qword ptr [rax+10h],rbp
fffff809`efc368c3 48897018        mov     qword ptr [rax+18h],rsi
fffff809`efc368c7 48897820        mov     qword ptr [rax+20h],rdi
fffff809`efc368cb 4156            push    r14
fffff809`efc368cd 4883ec20        sub     rsp,20h
fffff809`efc368d1 488db940080000  lea     rdi,[rcx+840h]
fffff809`efc368d8 488bd9          mov     rbx,rcx
fffff809`efc368db 488bcf          mov     rcx,rdi
fffff809`efc368de 48ff1563d70200  call    qword ptr [storport!_imp_KeAcquireSpinLockRaiseToDpc (fffff809`efc64048)]
fffff809`efc368e5 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc368ea 8b9360080000    mov     edx,dword ptr [rbx+860h]
fffff809`efc368f0 408af0          mov     sil,al
fffff809`efc368f3 f6c202          test    dl,2
fffff809`efc368f6 7415            je      storport!RaidDeleteAdapter+0x55 (fffff809`efc3690d)  Branch

storport!RaidDeleteAdapter+0x40:
fffff809`efc368f8 488b8b48080000  mov     rcx,qword ptr [rbx+848h]
fffff809`efc368ff 33d2            xor     edx,edx
fffff809`efc36901 48ff1520d90200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36908 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidDeleteAdapter+0x55:
fffff809`efc3690d 4533f6          xor     r14d,r14d
fffff809`efc36910 408ad6          mov     dl,sil
fffff809`efc36913 488bcf          mov     rcx,rdi
fffff809`efc36916 4489b360080000  mov     dword ptr [rbx+860h],r14d
fffff809`efc3691d 4c89b348080000  mov     qword ptr [rbx+848h],r14
fffff809`efc36924 48ff153dd80200  call    qword ptr [storport!_imp_KeReleaseSpinLock (fffff809`efc64168)]
fffff809`efc3692b 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36930 488d8b18010000  lea     rcx,[rbx+118h]
fffff809`efc36937 e868b10300      call    storport!RaidDeleteResourceList (fffff809`efc71aa4)
fffff809`efc3693c 4438b362110000  cmp     byte ptr [rbx+1162h],r14b
fffff809`efc36943 488d8b28010000  lea     rcx,[rbx+128h]
fffff809`efc3694a 0f94c2          sete    dl
fffff809`efc3694d e8d6b00300      call    storport!RaDeleteMiniport (fffff809`efc71a28)
fffff809`efc36952 4439b3e8020000  cmp     dword ptr [rbx+2E8h],r14d
fffff809`efc36959 7413            je      storport!RaidDeleteAdapter+0xb6 (fffff809`efc3696e)  Branch

storport!RaidDeleteAdapter+0xa3:
fffff809`efc3695b 488d93d8020000  lea     rdx,[rbx+2D8h]
fffff809`efc36962 488d8bb8020000  lea     rcx,[rbx+2B8h]
fffff809`efc36969 e84e100300      call    storport!StorFreeContiguousMemory (fffff809`efc679bc)

storport!RaidDeleteAdapter+0xb6:
fffff809`efc3696e 488b9318120000  mov     rdx,qword ptr [rbx+1218h]
fffff809`efc36975 4885d2          test    rdx,rdx
fffff809`efc36978 740f            je      storport!RaidDeleteAdapter+0xd1 (fffff809`efc36989)  Branch

storport!RaidDeleteAdapter+0xc2:
fffff809`efc3697a 488bcb          mov     rcx,rbx
fffff809`efc3697d e86e53fdff      call    storport!StorFreeContiguousIoResources (fffff809`efc0bcf0)
fffff809`efc36982 4c89b318120000  mov     qword ptr [rbx+1218h],r14

storport!RaidDeleteAdapter+0xd1:
fffff809`efc36989 4438b362110000  cmp     byte ptr [rbx+1162h],r14b
fffff809`efc36990 740c            je      storport!RaidDeleteAdapter+0xe6 (fffff809`efc3699e)  Branch

storport!RaidDeleteAdapter+0xda:
fffff809`efc36992 488d8bb8020000  lea     rcx,[rbx+2B8h]
fffff809`efc36999 e85aa90300      call    storport!RaidDeleteDma (fffff809`efc712f8)

storport!RaidDeleteAdapter+0xe6:
fffff809`efc3699e 488d8b50020000  lea     rcx,[rbx+250h]
fffff809`efc369a5 e872510300      call    storport!RaDeleteBus (fffff809`efc6bb1c)
fffff809`efc369aa 488d8b40040000  lea     rcx,[rbx+440h]
fffff809`efc369b1 e87e170000      call    storport!RaidDeleteDeferredQueue (fffff809`efc38134)
fffff809`efc369b6 488d8bc0050000  lea     rcx,[rbx+5C0h]
fffff809`efc369bd e872170000      call    storport!RaidDeleteDeferredQueue (fffff809`efc38134)
fffff809`efc369c2 488b8b20080000  mov     rcx,qword ptr [rbx+820h]
fffff809`efc369c9 83cdff          or      ebp,0FFFFFFFFh
fffff809`efc369cc 892b            mov     dword ptr [rbx],ebp
fffff809`efc369ce 4885c9          test    rcx,rcx
fffff809`efc369d1 740c            je      storport!RaidDeleteAdapter+0x127 (fffff809`efc369df)  Branch

storport!RaidDeleteAdapter+0x11b:
fffff809`efc369d3 e838c00300      call    storport!PortFreeDriverParameters (fffff809`efc72a10)
fffff809`efc369d8 4c89b320080000  mov     qword ptr [rbx+820h],r14

storport!RaidDeleteAdapter+0x127:
fffff809`efc369df 488b8b68110000  mov     rcx,qword ptr [rbx+1168h]
fffff809`efc369e6 4885c9          test    rcx,rcx
fffff809`efc369e9 7415            je      storport!RaidDeleteAdapter+0x148 (fffff809`efc36a00)  Branch

storport!RaidDeleteAdapter+0x133:
fffff809`efc369eb 33d2            xor     edx,edx
fffff809`efc369ed 48ff1534d80200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc369f4 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc369f9 4c89b368110000  mov     qword ptr [rbx+1168h],r14

storport!RaidDeleteAdapter+0x148:
fffff809`efc36a00 488d8b08080000  lea     rcx,[rbx+808h]
fffff809`efc36a07 48ff15cad60200  call    qword ptr [storport!_imp_RtlFreeUnicodeString (fffff809`efc640d8)]
fffff809`efc36a0e 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36a13 488d8bf8150000  lea     rcx,[rbx+15F8h]
fffff809`efc36a1a 48ff15b7d60200  call    qword ptr [storport!_imp_RtlFreeUnicodeString (fffff809`efc640d8)]
fffff809`efc36a21 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36a26 488bcb          mov     rcx,rbx
fffff809`efc36a29 e8ee170000      call    storport!RaDriverDeleteDevice (fffff809`efc3821c)
fffff809`efc36a2e 488b8b00010000  mov     rcx,qword ptr [rbx+100h]
fffff809`efc36a35 4c897308        mov     qword ptr [rbx+8],r14
fffff809`efc36a39 4c897310        mov     qword ptr [rbx+10h],r14
fffff809`efc36a3d 4c897318        mov     qword ptr [rbx+18h],r14
fffff809`efc36a41 4c897320        mov     qword ptr [rbx+20h],r14
fffff809`efc36a45 4885c9          test    rcx,rcx
fffff809`efc36a48 7413            je      storport!RaidDeleteAdapter+0x1a5 (fffff809`efc36a5d)  Branch

storport!RaidDeleteAdapter+0x192:
fffff809`efc36a4a 48ff1587d80200  call    qword ptr [storport!_imp_ExFreeCacheAwareRundownProtection (fffff809`efc642d8)]
fffff809`efc36a51 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36a56 4c89b300010000  mov     qword ptr [rbx+100h],r14

storport!RaidDeleteAdapter+0x1a5:
fffff809`efc36a5d be52614472      mov     esi,72446152h
fffff809`efc36a62 4438b361110000  cmp     byte ptr [rbx+1161h],r14b
fffff809`efc36a69 7421            je      storport!RaidDeleteAdapter+0x1d4 (fffff809`efc36a8c)  Branch

storport!RaidDeleteAdapter+0x1b3:
fffff809`efc36a6b 488b8b58110000  mov     rcx,qword ptr [rbx+1158h]
fffff809`efc36a72 4885c9          test    rcx,rcx
fffff809`efc36a75 7415            je      storport!RaidDeleteAdapter+0x1d4 (fffff809`efc36a8c)  Branch

storport!RaidDeleteAdapter+0x1bf:
fffff809`efc36a77 8bd6            mov     edx,esi
fffff809`efc36a79 48ff15a8d70200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36a80 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36a85 4c89b358110000  mov     qword ptr [rbx+1158h],r14

storport!RaidDeleteAdapter+0x1d4:
fffff809`efc36a8c f6838412000001  test    byte ptr [rbx+1284h],1
fffff809`efc36a93 0f849f000000    je      storport!RaidDeleteAdapter+0x280 (fffff809`efc36b38)  Branch

storport!RaidDeleteAdapter+0x1e1:
fffff809`efc36a99 488d0df07d0200  lea     rcx,[storport!g_RaidDPCRedirectionInitLock (fffff809`efc5e890)]
fffff809`efc36aa0 48ff15a1d50200  call    qword ptr [storport!_imp_KeAcquireSpinLockRaiseToDpc (fffff809`efc64048)]
fffff809`efc36aa7 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36aac 408af8          mov     dil,al
fffff809`efc36aaf 8bcd            mov     ecx,ebp
fffff809`efc36ab1 f00fc10ddf7d0200 lock xadd dword ptr [storport!g_RaidPerfRedirectRefCount (fffff809`efc5e898)],ecx
fffff809`efc36ab9 03cd            add     ecx,ebp
fffff809`efc36abb 7544            jne     storport!RaidDeleteAdapter+0x249 (fffff809`efc36b01)  Branch

storport!RaidDeleteAdapter+0x205:
fffff809`efc36abd 448935407d0200  mov     dword ptr [storport!g_RaidPerfRedirectGroupCount (fffff809`efc5e804)],r14d
fffff809`efc36ac4 f044093424      lock or dword ptr [rsp],r14d
fffff809`efc36ac9 488b0d387d0200  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff809`efc5e808)]
fffff809`efc36ad0 8bd6            mov     edx,esi
fffff809`efc36ad2 48ff154fd70200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36ad9 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36ade 488b0dfb7c0200  mov     rcx,qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff809`efc5e7e0)]
fffff809`efc36ae5 8bd6            mov     edx,esi
fffff809`efc36ae7 48ff153ad70200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36aee 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36af3 4c89350e7d0200  mov     qword ptr [storport!g_RaidPerProcessorState (fffff809`efc5e808)],r14
fffff809`efc36afa 4c8935df7c0200  mov     qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff809`efc5e7e0)],r14

storport!RaidDeleteAdapter+0x249:
fffff809`efc36b01 408ad7          mov     dl,dil
fffff809`efc36b04 488d0d857d0200  lea     rcx,[storport!g_RaidDPCRedirectionInitLock (fffff809`efc5e890)]
fffff809`efc36b0b 48ff1556d60200  call    qword ptr [storport!_imp_KeReleaseSpinLock (fffff809`efc64168)]
fffff809`efc36b12 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36b17 488b8b98120000  mov     rcx,qword ptr [rbx+1298h]
fffff809`efc36b1e 4885c9          test    rcx,rcx
fffff809`efc36b21 7415            je      storport!RaidDeleteAdapter+0x280 (fffff809`efc36b38)  Branch

storport!RaidDeleteAdapter+0x26b:
fffff809`efc36b23 8bd6            mov     edx,esi
fffff809`efc36b25 48ff15fcd60200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36b2c 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36b31 4c89b398120000  mov     qword ptr [rbx+1298h],r14

storport!RaidDeleteAdapter+0x280:
fffff809`efc36b38 83bb8812000001  cmp     dword ptr [rbx+1288h],1
fffff809`efc36b3f 7e75            jle     storport!RaidDeleteAdapter+0x2fe (fffff809`efc36bb6)  Branch

storport!RaidDeleteAdapter+0x289:
fffff809`efc36b41 498bee          mov     rbp,r14
fffff809`efc36b44 48ff153dd60200  call    qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff809`efc64188)]
fffff809`efc36b4b 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36b50 0fb7f0          movzx   esi,ax
fffff809`efc36b53 418bfe          mov     edi,r14d
fffff809`efc36b56 83c601          add     esi,1
fffff809`efc36b59 7430            je      storport!RaidDeleteAdapter+0x2d3 (fffff809`efc36b8b)  Branch

storport!RaidDeleteAdapter+0x2a3:
fffff809`efc36b5b 8bcf            mov     ecx,edi
fffff809`efc36b5d 48c1e106        shl     rcx,6
fffff809`efc36b61 48038b90120000  add     rcx,qword ptr [rbx+1290h]
fffff809`efc36b68 48ff15f1d40200  call    qword ptr [storport!_imp_ExpInterlockedFlushSList (fffff809`efc64060)]
fffff809`efc36b6f 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidDeleteAdapter+0x2bc:
fffff809`efc36b74 488be8          mov     rbp,rax
fffff809`efc36b77 44397014        cmp     dword ptr [rax+14h],r14d
fffff809`efc36b7b 740e            je      storport!RaidDeleteAdapter+0x2d3 (fffff809`efc36b8b)  Branch

storport!RaidDeleteAdapter+0x2c5:
fffff809`efc36b7d 488b00          mov     rax,qword ptr [rax]
fffff809`efc36b80 4885c0          test    rax,rax
fffff809`efc36b83 75ef            jne     storport!RaidDeleteAdapter+0x2bc (fffff809`efc36b74)  Branch

storport!RaidDeleteAdapter+0x2cd:
fffff809`efc36b85 ffc7            inc     edi
fffff809`efc36b87 3bfe            cmp     edi,esi
fffff809`efc36b89 72d0            jb      storport!RaidDeleteAdapter+0x2a3 (fffff809`efc36b5b)  Branch

storport!RaidDeleteAdapter+0x2d3:
fffff809`efc36b8b bf52614354      mov     edi,54436152h
fffff809`efc36b90 488bcd          mov     rcx,rbp
fffff809`efc36b93 8bd7            mov     edx,edi
fffff809`efc36b95 48ff158cd60200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36b9c 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36ba1 488b8b90120000  mov     rcx,qword ptr [rbx+1290h]
fffff809`efc36ba8 8bd7            mov     edx,edi
fffff809`efc36baa 48ff1577d60200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36bb1 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidDeleteAdapter+0x2fe:
fffff809`efc36bb6 488b8bc8120000  mov     rcx,qword ptr [rbx+12C8h]
fffff809`efc36bbd 4885c9          test    rcx,rcx
fffff809`efc36bc0 7418            je      storport!RaidDeleteAdapter+0x322 (fffff809`efc36bda)  Branch

storport!RaidDeleteAdapter+0x30a:
fffff809`efc36bc2 ba52615351      mov     edx,51536152h
fffff809`efc36bc7 48ff155ad60200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36bce 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36bd3 4c89b3c8120000  mov     qword ptr [rbx+12C8h],r14

storport!RaidDeleteAdapter+0x322:
fffff809`efc36bda 488b8b70130000  mov     rcx,qword ptr [rbx+1370h]
fffff809`efc36be1 4885c9          test    rcx,rcx
fffff809`efc36be4 7418            je      storport!RaidDeleteAdapter+0x346 (fffff809`efc36bfe)  Branch

storport!RaidDeleteAdapter+0x32e:
fffff809`efc36be6 ba5261564d      mov     edx,4D566152h
fffff809`efc36beb 48ff1536d60200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36bf2 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36bf7 4c89b370130000  mov     qword ptr [rbx+1370h],r14

storport!RaidDeleteAdapter+0x346:
fffff809`efc36bfe 4439b390000000  cmp     dword ptr [rbx+90h],r14d
fffff809`efc36c05 7518            jne     storport!RaidDeleteAdapter+0x367 (fffff809`efc36c1f)  Branch

storport!RaidDeleteAdapter+0x34f:
fffff809`efc36c07 488b8ba0000000  mov     rcx,qword ptr [rbx+0A0h]
fffff809`efc36c0e ba44696374      mov     edx,74636944h
fffff809`efc36c13 48ff150ed60200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36c1a 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidDeleteAdapter+0x367:
fffff809`efc36c1f 488b4b30        mov     rcx,qword ptr [rbx+30h]
fffff809`efc36c23 4885c9          test    rcx,rcx
fffff809`efc36c26 740e            je      storport!RaidDeleteAdapter+0x37e (fffff809`efc36c36)  Branch

storport!RaidDeleteAdapter+0x370:
fffff809`efc36c28 33d2            xor     edx,edx
fffff809`efc36c2a 48ff15f7d50200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36c31 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidDeleteAdapter+0x37e:
fffff809`efc36c36 488b8b60150000  mov     rcx,qword ptr [rbx+1560h]
fffff809`efc36c3d 4885c9          test    rcx,rcx
fffff809`efc36c40 7418            je      storport!RaidDeleteAdapter+0x3a2 (fffff809`efc36c5a)  Branch

storport!RaidDeleteAdapter+0x38a:
fffff809`efc36c42 ba52614345      mov     edx,45436152h
fffff809`efc36c47 48ff15dad50200  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc36c4e 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc36c53 4c89b360150000  mov     qword ptr [rbx+1560h],r14

storport!RaidDeleteAdapter+0x3a2:
fffff809`efc36c5a 838bc0130000ff  or      dword ptr [rbx+13C0h],0FFFFFFFFh
fffff809`efc36c61 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff809`efc36c66 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff809`efc36c6b 488b7c2448      mov     rdi,qword ptr [rsp+48h]
fffff809`efc36c70 4489b3c4130000  mov     dword ptr [rbx+13C4h],r14d
fffff809`efc36c77 4c89b3c8130000  mov     qword ptr [rbx+13C8h],r14
fffff809`efc36c7e 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff809`efc36c83 4883c420        add     rsp,20h
fffff809`efc36c87 415e            pop     r14
fffff809`efc36c89 c3              ret
