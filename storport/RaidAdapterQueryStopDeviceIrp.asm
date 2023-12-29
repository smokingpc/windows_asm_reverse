127: kd> uf storport!RaidAdapterQueryStopDeviceIrp
storport!RaidAdapterQueryStopDeviceIrp:
fffff80e`55283c38 4c8bdc          mov     r11,rsp
fffff80e`55283c3b 49895b18        mov     qword ptr [r11+18h],rbx
fffff80e`55283c3f 57              push    rdi
fffff80e`55283c40 4883ec50        sub     rsp,50h
fffff80e`55283c44 488b0545d6feff  mov     rax,qword ptr [storport!_security_cookie (fffff80e`55271290)]
fffff80e`55283c4b 4833c4          xor     rax,rsp
fffff80e`55283c4e 4889442440      mov     qword ptr [rsp+40h],rax
fffff80e`55283c53 83623000        and     dword ptr [rdx+30h],0
fffff80e`55283c57 b803000000      mov     eax,3
fffff80e`55283c5c 874158          xchg    eax,dword ptr [rcx+58h]
fffff80e`55283c5f 803d2adcfeff00  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80e`55271890)],0
fffff80e`55283c66 488bda          mov     rbx,rdx
fffff80e`55283c69 488bf9          mov     rdi,rcx
fffff80e`55283c6c 7441            je      storport!RaidAdapterQueryStopDeviceIrp+0x77 (fffff80e`55283caf)  Branch

storport!RaidAdapterQueryStopDeviceIrp+0x36:
fffff80e`55283c6e 33c0            xor     eax,eax
fffff80e`55283c70 498d53d8        lea     rdx,[r11-28h]
fffff80e`55283c74 488bcb          mov     rcx,rbx
fffff80e`55283c77 498943d8        mov     qword ptr [r11-28h],rax
fffff80e`55283c7b 498943e0        mov     qword ptr [r11-20h],rax
fffff80e`55283c7f 48ff15ca34ffff  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff80e`55277150)]
fffff80e`55283c86 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`55283c8b f60550dbfeff20  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff80e`552717e2)],20h
fffff80e`55283c92 741b            je      storport!RaidAdapterQueryStopDeviceIrp+0x77 (fffff80e`55283caf)  Branch

storport!RaidAdapterQueryStopDeviceIrp+0x5c:
fffff80e`55283c94 8b4330          mov     eax,dword ptr [rbx+30h]
fffff80e`55283c97 4c8d442430      lea     r8,[rsp+30h]
fffff80e`55283c9c 4c8bcb          mov     r9,rbx
fffff80e`55283c9f 89442420        mov     dword ptr [rsp+20h],eax
fffff80e`55283ca3 488d15be65feff  lea     rdx,[storport!EventPnpRequestComplete (fffff80e`5526a268)]
fffff80e`55283caa e8f125fcff      call    storport!McTemplateK0pd (fffff80e`552462a0)

storport!RaidAdapterQueryStopDeviceIrp+0x77:
fffff80e`55283caf 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff80e`55283cb3 488bd3          mov     rdx,rbx
fffff80e`55283cb6 e8d500faff      call    storport!RaForwardIrp (fffff80e`55223d90)
fffff80e`55283cbb 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff80e`55283cc0 4833cc          xor     rcx,rsp
fffff80e`55283cc3 e89820fbff      call    storport!_security_check_cookie (fffff80e`55235d60)
fffff80e`55283cc8 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff80e`55283ccd 4883c450        add     rsp,50h
fffff80e`55283cd1 5f              pop     rdi
fffff80e`55283cd2 c3              ret
