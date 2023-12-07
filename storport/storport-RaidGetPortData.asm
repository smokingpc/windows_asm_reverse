3: kd> uf storport!RaidGetPortData
storport!RaidGetPortData:
fffff809`efc05168 4053            push    rbx
fffff809`efc0516a 4883ec20        sub     rsp,20h
fffff809`efc0516e 488b0553960500  mov     rax,qword ptr [storport!RaidpPortData (fffff809`efc5e7c8)]
fffff809`efc05175 4885c0          test    rax,rax
fffff809`efc05178 7410            je      storport!RaidGetPortData+0x22 (fffff809`efc0518a)  Branch

storport!RaidGetPortData+0x12:
fffff809`efc0517a f0ff00          lock inc dword ptr [rax]

storport!RaidGetPortData+0x15:
fffff809`efc0517d 488b0544960500  mov     rax,qword ptr [storport!RaidpPortData (fffff809`efc5e7c8)]

storport!RaidGetPortData+0x1c:
fffff809`efc05184 4883c420        add     rsp,20h
fffff809`efc05188 5b              pop     rbx
fffff809`efc05189 c3              ret

storport!RaidGetPortData+0x22:
fffff809`efc0518a ba28000000      mov     edx,28h       ;40 bytes
fffff809`efc0518f b900020000      mov     ecx,200h      ;NonPagedPoolNx
fffff809`efc05194 41b852615044    mov     r8d,44506152h ;Tag 'RdPD'
fffff809`efc0519a 48ff156ff00500  call    qword ptr [storport!_imp_ExAllocatePoolWithTag (fffff809`efc64210)]
fffff809`efc051a1 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc051a6 488bd8          mov     rbx,rax
fffff809`efc051a9 4885c0          test    rax,rax
fffff809`efc051ac 742e            je      storport!RaidGetPortData+0x74 (fffff809`efc051dc)  Branch

storport!RaidGetPortData+0x46:
fffff809`efc051ae 4883c008        add     rax,8
fffff809`efc051b2 488d4b18        lea     rcx,[rbx+18h]
fffff809`efc051b6 48894008        mov     qword ptr [rax+8],rax ;串 LIST_ENTRY , rax+8 => LIST_ENTRY
fffff809`efc051ba 488900          mov     qword ptr [rax],rax
fffff809`efc051bd 48ff155cef0500  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff809`efc64120)]
fffff809`efc051c4 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc051c9 83632000        and     dword ptr [rbx+20h],0 ;rbx==Allocated Pool
fffff809`efc051cd c70301000000    mov     dword ptr [rbx],1  ;rbx==Allocated Pool
fffff809`efc051d3 48891dee950500  mov     qword ptr [storport!RaidpPortData (fffff809`efc5e7c8)],rbx
fffff809`efc051da eba1            jmp     storport!RaidGetPortData+0x15 (fffff809`efc0517d)  Branch

storport!RaidGetPortData+0x74:
fffff809`efc051dc eba6            jmp     storport!RaidGetPortData+0x1c (fffff809`efc05184)  Branch
