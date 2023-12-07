2: kd> uf storport!RaidAdapterRaiseIrqlAndExecuteXrb
storport!RaidAdapterRaiseIrqlAndExecuteXrb:
fffff806`c7d12dd4 48895c2408      mov     qword ptr [rsp+8],rbx
fffff806`c7d12dd9 4889742410      mov     qword ptr [rsp+10h],rsi
fffff806`c7d12dde 57              push    rdi
fffff806`c7d12ddf 4883ec20        sub     rsp,20h
fffff806`c7d12de3 488bf1          mov     rsi,rcx
fffff806`c7d12de6 488bda          mov     rbx,rdx
fffff806`c7d12de9 b102            mov     cl,2
fffff806`c7d12deb 48ff155e440600  call    qword ptr [storport!_imp_KfRaiseIrql (fffff806`c7d77250)]
fffff806`c7d12df2 0f1f440000      nop     dword ptr [rax+rax]
fffff806`c7d12df7 488bd3          mov     rdx,rbx
fffff806`c7d12dfa 488bce          mov     rcx,rsi
fffff806`c7d12dfd 408af8          mov     dil,al
fffff806`c7d12e00 e82b000000      call    storport!RaidAdapterExecuteXrb (fffff806`c7d12e30)
fffff806`c7d12e05 408acf          mov     cl,dil
fffff806`c7d12e08 8bd8            mov     ebx,eax
fffff806`c7d12e0a 48ff158f430600  call    qword ptr [storport!_imp_KeLowerIrql (fffff806`c7d771a0)]
fffff806`c7d12e11 0f1f440000      nop     dword ptr [rax+rax]
fffff806`c7d12e16 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff806`c7d12e1b 8bc3            mov     eax,ebx
fffff806`c7d12e1d 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff806`c7d12e22 4883c420        add     rsp,20h
fffff806`c7d12e26 5f              pop     rdi
fffff806`c7d12e27 c3              ret
