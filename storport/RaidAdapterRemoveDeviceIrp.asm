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

0: kd> uf RaidAdapterRemoveDeviceIrp
storport!RaidAdapterRemoveDeviceIrp:
fffff802`e1bc2edc 48895c2408      mov     qword ptr [rsp+8],rbx
fffff802`e1bc2ee1 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff802`e1bc2ee6 4889742418      mov     qword ptr [rsp+18h],rsi
fffff802`e1bc2eeb 57              push    rdi
fffff802`e1bc2eec 4883ec20        sub     rsp,20h
fffff802`e1bc2ef0 488bfa          mov     rdi,rdx
fffff802`e1bc2ef3 488bd9          mov     rbx,rcx
fffff802`e1bc2ef6 e881a0fcff      call    storport!RaCallMiniportCompleteServiceIrp (fffff802`e1b8cf7c)
fffff802`e1bc2efb 8b4358          mov     eax,dword ptr [rbx+58h]       ;eax == AdapterExtension->DeviceState , when issue occur, DeviceState==DeviceStatePendingRemove
fffff802`e1bc2efe 488b6b08        mov     rbp,qword ptr [rbx+8]         ;rbp == AdapterExtension->DeviceObject
fffff802`e1bc2f02 83c0fb          add     eax,0FFFFFFFBh
fffff802`e1bc2f05 488b7318        mov     rsi,qword ptr [rbx+18h]       ;rsi == AdapterExtension->LowerDeviceObject
fffff802`e1bc2f09 c7435806000000  mov     dword ptr [rbx+58h],6         ;AdapterExtension->DeviceState = DeviceStateDeleted
fffff802`e1bc2f10 83f801          cmp     eax,1                         ;if(original DeviceState <= DeviceStateSurpriseRemoval) goto 0x5c
fffff802`e1bc2f13 7623            jbe     storport!RaidAdapterRemoveDeviceIrp+0x5c (fffff802`e1bc2f38)  Branch

storport!RaidAdapterRemoveDeviceIrp+0x39:
fffff802`e1bc2f15 488bcb          mov     rcx,rbx
fffff802`e1bc2f18 e8bf43fcff      call    storport!RaidAdapterDisableDeviceInterface (fffff802`e1b872dc)
fffff802`e1bc2f1d 488bcb          mov     rcx,rbx
fffff802`e1bc2f20 e8e344fcff      call    storport!RaidAdapterDisableRpmbInterface (fffff802`e1b87408)
fffff802`e1bc2f25 488bcb          mov     rcx,rbx
fffff802`e1bc2f28 e88f7cfcff      call    storport!RaidReleaseAdapterRemoveLockAndWait (fffff802`e1b8abbc)
fffff802`e1bc2f2d 488bd7          mov     rdx,rdi
fffff802`e1bc2f30 488bcb          mov     rcx,rbx

;到 RaidAdapterReleaseResources() 裡才呼叫 RaidPnPPassToMiniPort() 去發 SRB_PNP Remove Device
fffff802`e1bc2f33 e804feffff      call    storport!RaidAdapterReleaseResources (fffff802`e1bc2d3c)

storport!RaidAdapterRemoveDeviceIrp+0x5c:
fffff802`e1bc2f38 488bcb          mov     rcx,rbx
fffff802`e1bc2f3b e8e441fcff      call    storport!RaidAdapterDeleteChildren (fffff802`e1b87124)
fffff802`e1bc2f40 488bcb          mov     rcx,rbx
fffff802`e1bc2f43 e84072fcff      call    storport!RaidDeleteAdapter (fffff802`e1b8a188)
fffff802`e1bc2f48 488bd7          mov     rdx,rdi
fffff802`e1bc2f4b 488bce          mov     rcx,rsi
fffff802`e1bc2f4e e80d3bfaff      call    storport!RaForwardIrpSynchronous (fffff802`e1b66a60)
fffff802`e1bc2f53 4533c0          xor     r8d,r8d
fffff802`e1bc2f56 33d2            xor     edx,edx
fffff802`e1bc2f58 488bcf          mov     rcx,rdi
fffff802`e1bc2f5b e8c09bf9ff      call    storport!RaidCompleteRequestEx (fffff802`e1b5cb20)
fffff802`e1bc2f60 488bce          mov     rcx,rsi
fffff802`e1bc2f63 8bd8            mov     ebx,eax
fffff802`e1bc2f65 48ff152431ffff  call    qword ptr [storport!_imp_IoDetachDevice (fffff802`e1bb6090)]
fffff802`e1bc2f6c 0f1f440000      nop     dword ptr [rax+rax]
fffff802`e1bc2f71 488bcd          mov     rcx,rbp
fffff802`e1bc2f74 48ff15ad31ffff  call    qword ptr [storport!_imp_IoDeleteDevice (fffff802`e1bb6128)]
fffff802`e1bc2f7b 0f1f440000      nop     dword ptr [rax+rax]
fffff802`e1bc2f80 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff802`e1bc2f85 8bc3            mov     eax,ebx
fffff802`e1bc2f87 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff802`e1bc2f8c 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff802`e1bc2f91 4883c420        add     rsp,20h
fffff802`e1bc2f95 5f              pop     rdi
fffff802`e1bc2f96 c3              ret
