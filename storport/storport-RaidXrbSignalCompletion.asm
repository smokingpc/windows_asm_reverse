0: kd> uf RaidXrbSignalCompletion
storport!RaidXrbSignalCompletion:
fffff80e`6c5e46d0 4883ec28        sub     rsp,28h
fffff80e`6c5e46d4 4881c198020000  add     rcx,298h      ;RCX = PortContext = ContiguousIoResource+0x20 , RCX+0x298 == 0x2B8 => KeInitEvent
fffff80e`6c5e46db 4533c0          xor     r8d,r8d
fffff80e`6c5e46de 33d2            xor     edx,edx
fffff80e`6c5e46e0 48ff1599fc0500  call    qword ptr [storport!_imp_KeSetEvent (fffff80e`6c644380)]
fffff80e`6c5e46e7 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5e46ec 4883c428        add     rsp,28h
fffff80e`6c5e46f0 c3              ret
