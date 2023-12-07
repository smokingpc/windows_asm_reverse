5: kd> uf RaidAdapterConnectMSIInterrupt
storport!RaidAdapterConnectMSIInterrupt:
fffff800`95aee7d0 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff800`95aee7d5 4889742418      mov     qword ptr [rsp+18h],rsi
fffff800`95aee7da 55              push    rbp
fffff800`95aee7db 57              push    rdi
fffff800`95aee7dc 4156            push    r14
fffff800`95aee7de 488bec          mov     rbp,rsp
fffff800`95aee7e1 4883ec70        sub     rsp,70h
fffff800`95aee7e5 408af2          mov     sil,dl
fffff800`95aee7e8 488bf9          mov     rdi,rcx
fffff800`95aee7eb 33d2            xor     edx,edx
fffff800`95aee7ed 488d4db0        lea     rcx,[rbp-50h]
fffff800`95aee7f1 448d4250        lea     r8d,[rdx+50h]
fffff800`95aee7f5 e8c6d3fbff      call    storport!memset (fffff800`95aabbc0)
fffff800`95aee7fa 83bf8011000002  cmp     dword ptr [rdi+1180h],2
fffff800`95aee801 488b4720        mov     rax,qword ptr [rdi+20h]
fffff800`95aee805 488945b8        mov     qword ptr [rbp-48h],rax
fffff800`95aee809 488d4520        lea     rax,[rbp+20h]
fffff800`95aee80d 488945c0        mov     qword ptr [rbp-40h],rax
fffff800`95aee811 488d055813faff  lea     rax,[storport!RaidpAdapterMSIInterruptRoutine (fffff800`95a8fb70)]
fffff800`95aee818 488945c8        mov     qword ptr [rbp-38h],rax
fffff800`95aee81c c745b003000000  mov     dword ptr [rbp-50h],3
fffff800`95aee823 48897dd0        mov     qword ptr [rbp-30h],rdi
fffff800`95aee827 0f852d2e0000    jne     storport!RaidAdapterConnectMSIInterrupt+0x2e8a (fffff800`95af165a)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x5d:
fffff800`95aee82d 488365d800      and     qword ptr [rbp-28h],0

storport!RaidAdapterConnectMSIInterrupt+0x62:
fffff800`95aee832 488d0597cafcff  lea     rax,[storport!RaidpAdapterInterruptRoutine (fffff800`95abb2d0)]
fffff800`95aee839 408875e0        mov     byte ptr [rbp-20h],sil
fffff800`95aee83d 488d4db0        lea     rcx,[rbp-50h]
fffff800`95aee841 488945e8        mov     qword ptr [rbp-18h],rax
fffff800`95aee845 c645e100        mov     byte ptr [rbp-1Fh],0
fffff800`95aee849 48ff156889ffff  call    qword ptr [storport!_imp_IoConnectInterruptEx (fffff800`95ae71b8)]
fffff800`95aee850 0f1f440000      nop     dword ptr [rax+rax]
fffff800`95aee855 c687a111000000  mov     byte ptr [rdi+11A1h],0
fffff800`95aee85c 448bf0          mov     r14d,eax
fffff800`95aee85f 85c0            test    eax,eax
fffff800`95aee861 0f88442e0000    js      storport!RaidAdapterConnectMSIInterrupt+0x2edb (fffff800`95af16ab)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x97:
fffff800`95aee867 8b4db0          mov     ecx,dword ptr [rbp-50h]
fffff800`95aee86a 898fac020000    mov     dword ptr [rdi+2ACh],ecx
fffff800`95aee870 83f903          cmp     ecx,3
fffff800`95aee873 0f85222e0000    jne     storport!RaidAdapterConnectMSIInterrupt+0x2ecb (fffff800`95af169b)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xa9:
fffff800`95aee879 488b4dc0        mov     rcx,qword ptr [rbp-40h]
fffff800`95aee87d 41b852614472    mov     r8d,72446152h
fffff800`95aee883 c687a111000001  mov     byte ptr [rdi+11A1h],1
fffff800`95aee88a 488b01          mov     rax,qword ptr [rcx]
fffff800`95aee88d b900020000      mov     ecx,200h
fffff800`95aee892 48898790110000  mov     qword ptr [rdi+1190h],rax
fffff800`95aee899 8b5004          mov     edx,dword ptr [rax+4]
fffff800`95aee89c 48c1e204        shl     rdx,4
fffff800`95aee8a0 48ff156989ffff  call    qword ptr [storport!_imp_ExAllocatePoolWithTag (fffff800`95ae7210)]
fffff800`95aee8a7 0f1f440000      nop     dword ptr [rax+rax]
fffff800`95aee8ac 48898798110000  mov     qword ptr [rdi+1198h],rax
fffff800`95aee8b3 4885c0          test    rax,rax
fffff800`95aee8b6 744e            je      storport!RaidAdapterConnectMSIInterrupt+0x136 (fffff800`95aee906)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xe8:
fffff800`95aee8b8 4c8b8f90110000  mov     r9,qword ptr [rdi+1190h]
fffff800`95aee8bf 33db            xor     ebx,ebx
fffff800`95aee8c1 41395904        cmp     dword ptr [r9+4],ebx
fffff800`95aee8c5 763f            jbe     storport!RaidAdapterConnectMSIInterrupt+0x136 (fffff800`95aee906)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xf7:
fffff800`95aee8c7 488b9798110000  mov     rdx,qword ptr [rdi+1198h]
fffff800`95aee8ce 488d0c5b        lea     rcx,[rbx+rbx*2]
fffff800`95aee8d2 4803c9          add     rcx,rcx
fffff800`95aee8d5 8bf3            mov     esi,ebx
fffff800`95aee8d7 48c1e604        shl     rsi,4
fffff800`95aee8db 4803d6          add     rdx,rsi
fffff800`95aee8de 498b4cc918      mov     rcx,qword ptr [r9+rcx*8+18h]
fffff800`95aee8e3 48ff15f687ffff  call    qword ptr [storport!_imp_IoGetAffinityInterrupt (fffff800`95ae70e0)]
fffff800`95aee8ea 0f1f440000      nop     dword ptr [rax+rax]
fffff800`95aee8ef 85c0            test    eax,eax
fffff800`95aee8f1 0f88822d0000    js      storport!RaidAdapterConnectMSIInterrupt+0x2ea9 (fffff800`95af1679)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x127:
fffff800`95aee8f7 4c8b8f90110000  mov     r9,qword ptr [rdi+1190h]
fffff800`95aee8fe ffc3            inc     ebx
fffff800`95aee900 413b5904        cmp     ebx,dword ptr [r9+4]
fffff800`95aee904 72c1            jb      storport!RaidAdapterConnectMSIInterrupt+0xf7 (fffff800`95aee8c7)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x136:
fffff800`95aee906 4c8d5c2470      lea     r11,[rsp+70h]
fffff800`95aee90b 418bc6          mov     eax,r14d
fffff800`95aee90e 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff800`95aee912 498b7330        mov     rsi,qword ptr [r11+30h]
fffff800`95aee916 498be3          mov     rsp,r11
fffff800`95aee919 415e            pop     r14
fffff800`95aee91b 5f              pop     rdi
fffff800`95aee91c 5d              pop     rbp
fffff800`95aee91d c3              ret

storport!RaidAdapterConnectMSIInterrupt+0x2e8a:
fffff800`95af165a 488d9f88110000  lea     rbx,[rdi+1188h]
fffff800`95af1661 488bcb          mov     rcx,rbx
fffff800`95af1664 48ff15b55affff  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff800`95ae7120)]
fffff800`95af166b 0f1f440000      nop     dword ptr [rax+rax]
fffff800`95af1670 48895dd8        mov     qword ptr [rbp-28h],rbx
fffff800`95af1674 e9b9d1ffff      jmp     storport!RaidAdapterConnectMSIInterrupt+0x62 (fffff800`95aee832)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x2ea9:
fffff800`95af1679 488b8798110000  mov     rax,qword ptr [rdi+1198h]
fffff800`95af1680 b9ffff0000      mov     ecx,0FFFFh
fffff800`95af1685 66894c3008      mov     word ptr [rax+rsi+8],cx
fffff800`95af168a 488b8798110000  mov     rax,qword ptr [rdi+1198h]
fffff800`95af1691 4883240600      and     qword ptr [rsi+rax],0
fffff800`95af1696 e95cd2ffff      jmp     storport!RaidAdapterConnectMSIInterrupt+0x127 (fffff800`95aee8f7)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x2ecb:
fffff800`95af169b 488b4520        mov     rax,qword ptr [rbp+20h]
fffff800`95af169f 488987a0020000  mov     qword ptr [rdi+2A0h],rax
fffff800`95af16a6 e95bd2ffff      jmp     storport!RaidAdapterConnectMSIInterrupt+0x136 (fffff800`95aee906)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x2edb:
fffff800`95af16ab 4883a7a002000000 and     qword ptr [rdi+2A0h],0
fffff800`95af16b3 e94ed2ffff      jmp     storport!RaidAdapterConnectMSIInterrupt+0x136 (fffff800`95aee906)  Branch
