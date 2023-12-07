63: kd> uf storport!RaidAdapterConnectMSIInterrupt
storport!RaidAdapterConnectMSIInterrupt:
fffff803`125b6150 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff803`125b6155 4889742418      mov     qword ptr [rsp+18h],rsi
fffff803`125b615a 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff803`125b615f 55              push    rbp
fffff803`125b6160 4156            push    r14
fffff803`125b6162 4157            push    r15
fffff803`125b6164 488bec          mov     rbp,rsp
fffff803`125b6167 4883ec70        sub     rsp,70h
fffff803`125b616b 4883652000      and     qword ptr [rbp+20h],0
fffff803`125b6170 408af2          mov     sil,dl
fffff803`125b6173 33d2            xor     edx,edx
fffff803`125b6175 488bf9          mov     rdi,rcx
fffff803`125b6178 488d4db0        lea     rcx,[rbp-50h]
fffff803`125b617c 448d4250        lea     r8d,[rdx+50h]
fffff803`125b6180 e83bcaf9ff      call    storport!memset (fffff803`12552bc0)
fffff803`125b6185 83bf7010000002  cmp     dword ptr [rdi+1070h],2
fffff803`125b618c 488b4720        mov     rax,qword ptr [rdi+20h]
fffff803`125b6190 488945b8        mov     qword ptr [rbp-48h],rax
fffff803`125b6194 488d4520        lea     rax,[rbp+20h]
fffff803`125b6198 488945c0        mov     qword ptr [rbp-40h],rax
fffff803`125b619c 488d050dc8f8ff  lea     rax,[storport!RaidpAdapterMSIInterruptRoutine (fffff803`125429b0)]
fffff803`125b61a3 488945c8        mov     qword ptr [rbp-38h],rax
fffff803`125b61a7 c745b003000000  mov     dword ptr [rbp-50h],3
fffff803`125b61ae 48897dd0        mov     qword ptr [rbp-30h],rdi
fffff803`125b61b2 7507            jne     storport!RaidAdapterConnectMSIInterrupt+0x6b (fffff803`125b61bb)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x64:
fffff803`125b61b4 488365d800      and     qword ptr [rbp-28h],0
fffff803`125b61b9 eb1a            jmp     storport!RaidAdapterConnectMSIInterrupt+0x85 (fffff803`125b61d5)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x6b:
fffff803`125b61bb 488d9f78100000  lea     rbx,[rdi+1078h]
fffff803`125b61c2 488bcb          mov     rcx,rbx
fffff803`125b61c5 4c8b15745fffff  mov     r10,qword ptr [storport!_imp_KeInitializeSpinLock (fffff803`125ac140)]
fffff803`125b61cc e80fe8c9fa      call    nt!KzInitializeSpinLock (fffff803`0d2549e0)
fffff803`125b61d1 48895dd8        mov     qword ptr [rbp-28h],rbx

storport!RaidAdapterConnectMSIInterrupt+0x85:
fffff803`125b61d5 488d05b43bfbff  lea     rax,[storport!RaidpAdapterInterruptRoutine (fffff803`12569d90)]
fffff803`125b61dc 408875e0        mov     byte ptr [rbp-20h],sil
fffff803`125b61e0 488d4db0        lea     rcx,[rbp-50h]
fffff803`125b61e4 488945e8        mov     qword ptr [rbp-18h],rax
fffff803`125b61e8 c645e100        mov     byte ptr [rbp-1Fh],0
fffff803`125b61ec 4c8b15f55fffff  mov     r10,qword ptr [storport!_imp_IoConnectInterruptEx (fffff803`125ac1e8)]
fffff803`125b61f3 e8b8b523fb      call    nt!IoConnectInterruptEx (fffff803`0d7f17b0)
fffff803`125b61f8 c6879110000000  mov     byte ptr [rdi+1091h],0
fffff803`125b61ff 448bf8          mov     r15d,eax
fffff803`125b6202 85c0            test    eax,eax
fffff803`125b6204 0f88cb000000    js      storport!RaidAdapterConnectMSIInterrupt+0x185 (fffff803`125b62d5)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xba:
fffff803`125b620a 8b4db0          mov     ecx,dword ptr [rbp-50h]
fffff803`125b620d 898fdc020000    mov     dword ptr [rdi+2DCh],ecx
fffff803`125b6213 83f903          cmp     ecx,3
fffff803`125b6216 0f85ac000000    jne     storport!RaidAdapterConnectMSIInterrupt+0x178 (fffff803`125b62c8)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xcc:
fffff803`125b621c 807f6e00        cmp     byte ptr [rdi+6Eh],0
fffff803`125b6220 488d9f88100000  lea     rbx,[rdi+1088h]
fffff803`125b6227 488b4dc0        mov     rcx,qword ptr [rbp-40h]
fffff803`125b622b c6879110000001  mov     byte ptr [rdi+1091h],1
fffff803`125b6232 488b11          mov     rdx,qword ptr [rcx]
fffff803`125b6235 48899780100000  mov     qword ptr [rdi+1080h],rdx
fffff803`125b623c 7d08            jge     storport!RaidAdapterConnectMSIInterrupt+0xf6 (fffff803`125b6246)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xee:
fffff803`125b623e 488b03          mov     rax,qword ptr [rbx]
fffff803`125b6241 4885c0          test    rax,rax
fffff803`125b6244 7523            jne     storport!RaidAdapterConnectMSIInterrupt+0x119 (fffff803`125b6269)  Branch

storport!RaidAdapterConnectMSIInterrupt+0xf6:
fffff803`125b6246 8b5204          mov     edx,dword ptr [rdx+4]
fffff803`125b6249 b940000000      mov     ecx,40h
fffff803`125b624e 4c8b4f08        mov     r9,qword ptr [rdi+8]
fffff803`125b6252 41b852614472    mov     r8d,72446152h
fffff803`125b6258 48c1e204        shl     rdx,4
fffff803`125b625c e8132df8ff      call    storport!RaidAllocatePool (fffff803`12538f74)
fffff803`125b6261 488903          mov     qword ptr [rbx],rax
fffff803`125b6264 4885c0          test    rax,rax
fffff803`125b6267 7474            je      storport!RaidAdapterConnectMSIInterrupt+0x18d (fffff803`125b62dd)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x119:
fffff803`125b6269 4c8b8f80100000  mov     r9,qword ptr [rdi+1080h]
fffff803`125b6270 33f6            xor     esi,esi
fffff803`125b6272 41397104        cmp     dword ptr [r9+4],esi
fffff803`125b6276 7665            jbe     storport!RaidAdapterConnectMSIInterrupt+0x18d (fffff803`125b62dd)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x128:
fffff803`125b6278 488b13          mov     rdx,qword ptr [rbx]
fffff803`125b627b 488d0c76        lea     rcx,[rsi+rsi*2]
fffff803`125b627f 4803c9          add     rcx,rcx
fffff803`125b6282 448bf6          mov     r14d,esi
fffff803`125b6285 49c1e604        shl     r14,4
fffff803`125b6289 4903d6          add     rdx,r14
fffff803`125b628c 498b4cc918      mov     rcx,qword ptr [r9+rcx*8+18h]
fffff803`125b6291 4c8b15605effff  mov     r10,qword ptr [storport!_imp_IoGetAffinityInterrupt (fffff803`125ac0f8)]
fffff803`125b6298 e83331e2fa      call    nt!IoGetAffinityInterrupt (fffff803`0d3d93d0)
fffff803`125b629d 85c0            test    eax,eax
fffff803`125b629f 7916            jns     storport!RaidAdapterConnectMSIInterrupt+0x167 (fffff803`125b62b7)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x151:
fffff803`125b62a1 488b03          mov     rax,qword ptr [rbx]
fffff803`125b62a4 b9ffff0000      mov     ecx,0FFFFh
fffff803`125b62a9 6642894c3008    mov     word ptr [rax+r14+8],cx
fffff803`125b62af 488b03          mov     rax,qword ptr [rbx]
fffff803`125b62b2 4983240600      and     qword ptr [r14+rax],0

storport!RaidAdapterConnectMSIInterrupt+0x167:
fffff803`125b62b7 4c8b8f80100000  mov     r9,qword ptr [rdi+1080h]
fffff803`125b62be ffc6            inc     esi
fffff803`125b62c0 413b7104        cmp     esi,dword ptr [r9+4]
fffff803`125b62c4 72b2            jb      storport!RaidAdapterConnectMSIInterrupt+0x128 (fffff803`125b6278)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x176:
fffff803`125b62c6 eb15            jmp     storport!RaidAdapterConnectMSIInterrupt+0x18d (fffff803`125b62dd)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x178:
fffff803`125b62c8 488b4520        mov     rax,qword ptr [rbp+20h]
fffff803`125b62cc 488987d0020000  mov     qword ptr [rdi+2D0h],rax
fffff803`125b62d3 eb08            jmp     storport!RaidAdapterConnectMSIInterrupt+0x18d (fffff803`125b62dd)  Branch

storport!RaidAdapterConnectMSIInterrupt+0x185:
fffff803`125b62d5 4883a7d002000000 and     qword ptr [rdi+2D0h],0

storport!RaidAdapterConnectMSIInterrupt+0x18d:
fffff803`125b62dd 4c8d5c2470      lea     r11,[rsp+70h]
fffff803`125b62e2 418bc7          mov     eax,r15d
fffff803`125b62e5 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff803`125b62e9 498b7330        mov     rsi,qword ptr [r11+30h]
fffff803`125b62ed 498b7b38        mov     rdi,qword ptr [r11+38h]
fffff803`125b62f1 498be3          mov     rsp,r11
fffff803`125b62f4 415f            pop     r15
fffff803`125b62f6 415e            pop     r14
fffff803`125b62f8 5d              pop     rbp
fffff803`125b62f9 c3              ret
