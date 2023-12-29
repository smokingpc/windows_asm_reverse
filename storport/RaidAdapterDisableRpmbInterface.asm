7: kd> uf RaidAdapterDisableRpmbInterface
storport!RaidAdapterDisableRpmbInterface:
fffff802`e1b87408 4883ec28        sub     rsp,28h
fffff802`e1b8740c 4883b90816000000 cmp     qword ptr [rcx+1608h],0
fffff802`e1b87414 7415            je      storport!RaidAdapterDisableRpmbInterface+0x23 (fffff802`e1b8742b)  Branch

storport!RaidAdapterDisableRpmbInterface+0xe:
fffff802`e1b87416 4881c100160000  add     rcx,1600h
fffff802`e1b8741d 33d2            xor     edx,edx
fffff802`e1b8741f 48ff1562ec0200  call    qword ptr [storport!_imp_IoSetDeviceInterfaceState (fffff802`e1bb6088)]
fffff802`e1b87426 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterDisableRpmbInterface+0x23:
fffff802`e1b8742b 4883c428        add     rsp,28h
fffff802`e1b8742f c3              ret
