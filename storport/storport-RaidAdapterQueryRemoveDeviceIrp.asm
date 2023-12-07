enum _DEVICE_STATE
{
    DeviceStateNotPresent = 0,
    DeviceStateWorking = 1,
    DeviceStateStopped = 2,
    DeviceStatePendingStop = 3,
    DeviceStatePendingRemove = 4,
    DeviceStateSurpriseRemoval = 5,
    DeviceStateDeleted = 6,
    DeviceStateDisabled = 7,
    DeviceStateNoResource = 8
};

;這 FUNCTION 把 QUERY REMOVE DEVICE 打向 LowerDevice => acpi.sys ??

1: kd> uf storport!RaidAdapterQueryRemoveDeviceIrp
storport!RaidAdapterQueryRemoveDeviceIrp:
fffff802`e1bc2bf4 4c8bdc          mov     r11,rsp
fffff802`e1bc2bf7 49895b18        mov     qword ptr [r11+18h],rbx
fffff802`e1bc2bfb 57              push    rdi
fffff802`e1bc2bfc 4883ec50        sub     rsp,50h
fffff802`e1bc2c00 488b0589d6feff  mov     rax,qword ptr [storport!_security_cookie (fffff802`e1bb0290)]
fffff802`e1bc2c07 4833c4          xor     rax,rsp
fffff802`e1bc2c0a 4889442440      mov     qword ptr [rsp+40h],rax
fffff802`e1bc2c0f b804000000      mov     eax,4                 ;DeviceStatePendingRemove
fffff802`e1bc2c14 488bda          mov     rbx,rdx               ;IRP
fffff802`e1bc2c17 874158          xchg    eax,dword ptr [rcx+58h]       ;AdapterExt->status = DeviceStatePendingRemove
fffff802`e1bc2c1a 83623000        and     dword ptr [rdx+30h],0
fffff802`e1bc2c1e 488bf9          mov     rdi,rcx
fffff802`e1bc2c21 803d68dcfeff00  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff802`e1bb0890)],0   ;got 0
fffff802`e1bc2c28 7441            je      storport!RaidAdapterQueryRemoveDeviceIrp+0x77 (fffff802`e1bc2c6b)  Branch

storport!RaidAdapterQueryRemoveDeviceIrp+0x36:
fffff802`e1bc2c2a 33c0            xor     eax,eax
fffff802`e1bc2c2c 498d53d8        lea     rdx,[r11-28h]     ;r11 == RSP, r11-0x28 to retrieve GUID
fffff802`e1bc2c30 488bcb          mov     rcx,rbx
fffff802`e1bc2c33 498943d8        mov     qword ptr [r11-28h],rax
fffff802`e1bc2c37 498943e0        mov     qword ptr [r11-20h],rax
fffff802`e1bc2c3b 48ff150e35ffff  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff802`e1bb6150)]
fffff802`e1bc2c42 0f1f440000      nop     dword ptr [rax+rax]   ;rax= 0xC0000225
                        ;if (Microsoft_Windows_StorPortEnableBits!=0x20) goto 0x77
fffff802`e1bc2c47 f60594dbfeff20  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff802`e1bb07e2)],20h
fffff802`e1bc2c4e 741b            je      storport!RaidAdapterQueryRemoveDeviceIrp+0x77 (fffff802`e1bc2c6b)  Branch

storport!RaidAdapterQueryRemoveDeviceIrp+0x5c:
fffff802`e1bc2c50 8b4330          mov     eax,dword ptr [rbx+30h]
fffff802`e1bc2c53 4c8d442430      lea     r8,[rsp+30h]
fffff802`e1bc2c58 4c8bcb          mov     r9,rbx
fffff802`e1bc2c5b 89442420        mov     dword ptr [rsp+20h],eax
fffff802`e1bc2c5f 488d15c265feff  lea     rdx,[storport!EventPnpRequestComplete (fffff802`e1ba9228)]
fffff802`e1bc2c66 e8ed30fcff      call    storport!McTemplateK0pd (fffff802`e1b85d58)

storport!RaidAdapterQueryRemoveDeviceIrp+0x77:
fffff802`e1bc2c6b 488b4f18        mov     rcx,qword ptr [rdi+18h]   ;Target DeviceObject
fffff802`e1bc2c6f 488bd3          mov     rdx,rbx       ;IRP
fffff802`e1bc2c72 e8e540faff      call    storport!RaForwardIrp (fffff802`e1b66d5c) ;STATUS_SUCCCES
fffff802`e1bc2c77 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff802`e1bc2c7c 4833cc          xor     rcx,rsp
fffff802`e1bc2c7f e84c2cfbff      call    storport!_security_check_cookie (fffff802`e1b758d0)
fffff802`e1bc2c84 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff802`e1bc2c89 4883c450        add     rsp,50h
fffff802`e1bc2c8d 5f              pop     rdi
fffff802`e1bc2c8e c3              ret
