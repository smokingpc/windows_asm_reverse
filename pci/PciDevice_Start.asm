111: kd> dt _PCI_DEVICE
pci!_PCI_DEVICE
   +0x000 Signature        : Uint4B
   +0x004 DeviceState      : _PCI_OBJECT_STATE
   +0x008 TentativeNextState : _PCI_OBJECT_STATE
   +0x00c DeviceUsage      : _PCI_DEVICE_USAGE
   +0x018 BusNumber        : Uint4B
   +0x01c Slot             : _PCI_SLOT_NUMBER
   +0x020 VendorID         : Uint2B
   +0x022 DeviceID         : Uint2B
   +0x024 RevisionID       : UChar
   +0x025 BaseClass        : UChar
   +0x026 SubClass         : UChar
   +0x027 ProgIf           : UChar
   +0x028 SubVendorID      : Uint2B
   +0x02a SubSystemID      : Uint2B
   +0x02c HeaderType       : UChar
   +0x02d InterruptPin     : UChar
   +0x02e FirstCapability  : UChar
   +0x02f PowerCapability  : UChar
   +0x030 SubIDsCapability : UChar
   +0x031 AgpCapability    : UChar
   +0x032 PciXCapability   : UChar
   +0x033 AdvancedFeatures : UChar
   +0x034 MsiCapability    : UChar
   +0x035 MsiXCapability   : UChar
   +0x036 FirstHtCapability : UChar
   +0x037 HtMsiMapCapability : UChar
   +0x038 ExpressCapability : UChar
   +0x039 FpbCapability    : UChar
   +0x03a PossibleDecodes  : Uint2B
   +0x03c ResourceDecodes  : Uint2B
   +0x03e PreviousCommand  : Uint2B
   +0x040 DeviceObject     : Ptr64 _DEVICE_OBJECT
   +0x048 Root             : Ptr64 _PCI_ROOT
   +0x050 Parent           : Ptr64 _PCI_BUS
   +0x058 Sibling          : Ptr64 _PCI_DEVICE
   +0x060 RemoveLock       : _IO_REMOVE_LOCK
   +0x080 ExpressCompatibilityPort : Ptr64 _EXPRESS_COMPATIBILITY_PORT
   +0x088 ExpressPort      : Ptr64 _EXPRESS_PORT
   +0x090 HotPlugSlot      : Ptr64 _PCI_HOTPLUG_SLOT
   +0x098 InstanceIdSerialNumber : Uint8B
   +0x0a0 Resources        : _PCI_DEVICE_RESOURCES
   +0x1a8 Requirements     : _PCI_DEVICE_REQUIREMENTS
   +0x348 InterruptResource : _PCI_DEVICE_INTERRUPT_RESOURCE
   +0x3b0 InterruptRequirement : _PCI_DEVICE_INTERRUPT_REQUIREMENT
   +0x3f8 SavedRegisters   : _PCI_SAVE_RESTORE_DATA
   +0x404 CapturedProcessorCount : Uint4B
   +0x408 LogicalPowerState : _DEVICE_POWER_STATE
   +0x40c PreviousPowerState : _DEVICE_POWER_STATE
   +0x410 WakeLevel        : _DEVICE_POWER_STATE
   +0x414 PowerStateChangeDelay : Int4B
   +0x418 PowerSupport     : _PM_SUPPORT
   +0x420 PowerTimer       : Ptr64 _EX_TIMER
   +0x428 DIrp             : Ptr64 _IRP
   +0x430 WakeIrp          : Ptr64 _IRP
   +0x438 WakeIrpState     : _PCI_WAKE_IRP_STATE
   +0x43c D3ColdSupport    : _PCI_D3COLD_SUPPORT
   +0x440 TransactionTimer : _KTIMER
   +0x480 TransactionTimerDpc : _KDPC
   +0x4c0 D0DelayInMilliseconds : Uint2B
   +0x4c2 MpsSizeOverride  : Pos 0, 3 Bits
   +0x4c2 MpsSizeOverrideSet : Pos 3, 1 Bit
   +0x4c3 TransactionTimeoutPasses : UChar
   +0x4c4 DstateChangeRetryCount : UChar
   +0x4c8 D3ColdFilter     : _D3COLD_SUPPORT_INTERFACE
   +0x510 LastPmcsrWriteD0Timestamp : Uint8B
   +0x518 PreviousPowerStateTimestamp : Uint8B
   +0x520 HierarchyDepth   : Uint4B
   +0x528 WakeIrpLock      : Uint8B
   +0x530 D0IrpLock        : Uint8B
   +0x538 ConfigureMwi     : Pos 0, 1 Bit
   +0x538 BusNumbersConfigured : Pos 1, 1 Bit
   +0x538 OnDebugPath      : Pos 2, 1 Bit
   +0x538 PciOwned         : Pos 3, 1 Bit
   +0x538 LegacyDriver     : Pos 4, 1 Bit
   +0x538 NativeIdeSwitchAllowed : Pos 5, 1 Bit
   +0x538 IdeInNativeMode  : Pos 6, 1 Bit
   +0x538 IdeInterfaceActive : Pos 7, 1 Bit
   +0x538 Present          : Pos 8, 1 Bit
   +0x538 ReportedMissing  : Pos 9, 1 Bit
   +0x538 Connected        : Pos 10, 1 Bit
   +0x538 PmeOwned         : Pos 11, 1 Bit
   +0x538 PmeEnabled       : Pos 12, 1 Bit
   +0x538 TriggeredPme     : Pos 13, 1 Bit
   +0x538 HyperTransport   : Pos 14, 1 Bit
   +0x538 MsiHtConverter   : Pos 15, 1 Bit
   +0x538 ExtendedConfigAvailable : Pos 16, 1 Bit
   +0x538 B2On66MHzSegmentIllegal : Pos 17, 1 Bit
   +0x538 Device66MHzCapable : Pos 18, 1 Bit
   +0x538 DsmToIgnoreBootConfigEvaluated : Pos 19, 1 Bit
   +0x538 IgnoreBootConfig : Pos 20, 1 Bit
   +0x538 Removed          : Pos 21, 1 Bit
   +0x538 AriIsEnabled     : Pos 22, 1 Bit
   +0x538 MultiFunction    : Pos 23, 1 Bit
   +0x538 AlreadyBeenStarted : Pos 24, 1 Bit
   +0x538 WaitingForPowerUp : Pos 25, 1 Bit
   +0x538 OnPostPath       : Pos 26, 1 Bit
   +0x538 SriovDeviceDidntGetVfBarSpace : Pos 27, 1 Bit
   +0x538 ExtraBusPowerReferenceForWake : Pos 28, 1 Bit
   +0x538 FirmwareSaysDeviceDoesD3cold : Pos 29, 1 Bit
   +0x538 TransactionTimerSetPower : Pos 30, 1 Bit
   +0x538 SurpriseRemoveAndReenumerateSelf : Pos 31, 1 Bit
   +0x538 BusmasterDisabledOnBoot : Pos 32, 1 Bit
   +0x538 DsmForDelayOptimizationEvaluated : Pos 33, 1 Bit
   +0x538 NoInitialConfig  : Pos 34, 1 Bit
   +0x538 DisableWheaDuringPLDR : Pos 35, 1 Bit
   +0x538 WheaReportingDisabled : Pos 36, 1 Bit
   +0x538 SecureDevice     : Pos 37, 1 Bit
   +0x538 DmaProtected     : Pos 38, 1 Bit
   +0x538 IsThunderboltDevice : Pos 39, 1 Bit
   +0x538 DecodeIoOnBoot   : Pos 40, 1 Bit
   +0x538 FpbNeedRestore   : Pos 41, 1 Bit
   +0x538 ForceSBR         : Pos 42, 1 Bit
   +0x538 IsGuestAssigned  : Pos 43, 1 Bit
   +0x538 SurpriseRemoveAndReenumerateSelfResetDevice : Pos 44, 1 Bit
   +0x538 Reserved         : Pos 45, 19 Bits
   +0x538 FlagsAsULONGLONG : Uint8B
   +0x540 BridgeFlags      : <unnamed-tag>
   +0x548 HackFlags        : Uint8B
   +0x550 Operations       : Ptr64 _PCI_HEADER_OPERATIONS
   +0x558 PciBusInterfaceCount : Int4B
   +0x55c AgpTargetInterfaceRefCount : Int4B
   +0x560 PciCardBusInterfaceCount : Int4B
   +0x564 PciDevicePresentInterfaceCount : Int4B
   +0x568 PciNativeIdeInterfaceCount : Int4B
   +0x56c PciLocationInterfaceCount : Int4B
   +0x570 PciD3ColdSupportInterfaceCount : Int4B
   +0x574 PciD3ColdAuxPowerAndTimingInterfaceCount : Int4B
   +0x578 PciPtmControlInterfaceCount : Int4B
   +0x57c EnumFailureCode  : Uint4B
   +0x580 DebugDevicePowerCallbackHandle : Ptr64 Void
   +0x588 DelayInfo        : [8] Int4B
   +0x5a8 SecureDeviceToken : Uint8B
   +0x5b0 D3ColdAux        : _PCI_D3COLD_AUX_POWER_AND_TIMING_DEVICE_INFO
   +0x5d8 FpbPdoNode       : _PCI_FPB_PDO


;NTSTATUS PciDevice_Start(
;    __in PIRP Irp,
;    __in PIO_STACK_LOCATION IrpSp,
;    __inout PPCI_COMMON_EXTENSION DeviceExtension);
; RCX seems useless. all operation are done in IrpSp.

111: kd> uf PciDevice_Start
Flow analysis was incomplete, some code may be missing
pci!PciDevice_Start:
fffff801`803ca990 48895c2408      mov     qword ptr [rsp+8],rbx
fffff801`803ca995 55              push    rbp
fffff801`803ca996 56              push    rsi
fffff801`803ca997 57              push    rdi
fffff801`803ca998 4154            push    r12
fffff801`803ca99a 4155            push    r13
fffff801`803ca99c 4156            push    r14
fffff801`803ca99e 4157            push    r15
fffff801`803ca9a0 488dac24d0fcffff lea     rbp,[rsp-330h]
fffff801`803ca9a8 4881ec30040000  sub     rsp,430h
fffff801`803ca9af 488b057a18ffff  mov     rax,qword ptr [pci!_security_cookie (fffff801`803bc230)]
fffff801`803ca9b6 4833c4          xor     rax,rsp
fffff801`803ca9b9 48898520030000  mov     qword ptr [rbp+320h],rax
fffff801`803ca9c0 4532e4          xor     r12b,r12b
fffff801`803ca9c3 498bf8          mov     rdi,r8    ;PPCI_COMMON_EXTENSION => devext of pci
fffff801`803ca9c6 4c8bfa          mov     r15,rdx   ;irp->current stack location
fffff801`803ca9c9 4d85c0          test    r8,r8
fffff801`803ca9cc 740d            je      pci!PciDevice_Start+0x4b (fffff801`803ca9db)  Branch

pci!PciDevice_Start+0x3e:
fffff801`803ca9ce 41813850636942  cmp     dword ptr [r8],42696350h
fffff801`803ca9d5 0f84e5390100    je      pci!PciDevice_Start+0x13a30 (fffff801`803de3c0)  Branch

pci!PciDevice_Start+0x4b:
fffff801`803ca9db 488b0d1e16ffff  mov     rcx,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803ca9e2 48ff157786ffff  call    qword ptr [pci!_imp_imp_WppRecorderLogGetDefault (fffff801`803c3060)]
fffff801`803ca9e9 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803ca9ee 4c8bf0          mov     r14,rax

pci!PciDevice_Start+0x61:       ;inline PciBeginStateTransition() begin
fffff801`803ca9f1 41b90a000000    mov     r9d,0Ah
fffff801`803ca9f7 c744243001000000 mov     dword ptr [rsp+30h],1
fffff801`803ca9ff 488d05ca84feff  lea     rax,[pci!WPP_3897241c0bc43c4e354ada0deec054e1_Traceguids (fffff801`803b2ed0)]
fffff801`803caa06 48897c2428      mov     qword ptr [rsp+28h],rdi
fffff801`803caa0b b204            mov     dl,4
fffff801`803caa0d 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803caa12 498bce          mov     rcx,r14
fffff801`803caa15 458d41f8        lea     r8d,[r9-8]
fffff801`803caa19 e88289fcff      call    pci!WPP_RECORDER_SF_qL (fffff801`803933a0)
fffff801`803caa1e 48634f04        movsxd  rcx,dword ptr [rdi+4] ;get devext->DeviceState (current state)?
fffff801`803caa22 488d15d755fcff  lea     rdx,[pci!PciBusInterface_GetBusData <PERF> (pci+0x0) (fffff801`80390000)]
fffff801`803caa29 8b9c8a98410200  mov     ebx,dword ptr [rdx+rcx*4+24198h]  ;check PnpStateTransitionArray in source code
fffff801`803caa30 85db            test    ebx,ebx       ;state transit should be ST_OK
fffff801`803caa32 7807            js      pci!PciDevice_Start+0xab (fffff801`803caa3b)  Branch

pci!PciDevice_Start+0xa4:
fffff801`803caa34 c7470801000000  mov     dword ptr [rdi+8],1   ;set devext->TentativeNextState = PciStarted

pci!PciDevice_Start+0xab:
fffff801`803caa3b be100000c0      mov     esi,0C0000010h
fffff801`803caa40 41bd0c000000    mov     r13d,0Ch
fffff801`803caa46 81fb290200c0    cmp     ebx,0C0000229h    ;if transit state result == ST_ERROR(STATUS_FAIL_CHECK), goto 0x13a3c
fffff801`803caa4c 0f847a390100    je      pci!PciDevice_Start+0x13a3c (fffff801`803de3cc)  Branch

pci!PciDevice_Start+0xc2:
fffff801`803caa52 3bde            cmp     ebx,esi;if transit state result == ST_OSBUG(STATUS_INVALID_DEVICE_REQUEST ), goto 0x13a3c
fffff801`803caa54 0f8492390100    je      pci!PciDevice_Start+0x13a5c (fffff801`803de3ec)  Branch

pci!PciDevice_Start+0xca:
fffff801`803caa5a 41b90d000000    mov     r9d,0Dh
fffff801`803caa60 895c2428        mov     dword ptr [rsp+28h],ebx
fffff801`803caa64 488d056584feff  lea     rax,[pci!WPP_3897241c0bc43c4e354ada0deec054e1_Traceguids (fffff801`803b2ed0)]
fffff801`803caa6b b204            mov     dl,4
fffff801`803caa6d 498bce          mov     rcx,r14
fffff801`803caa70 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803caa75 458d41f5        lea     r8d,[r9-0Bh]
fffff801`803caa79 e84290fcff      call    pci!WPP_RECORDER_SF_d (fffff801`80393ac0)
fffff801`803caa7e 85db            test    ebx,ebx
fffff801`803caa80 0f8883390100    js      pci!PciDevice_Start+0x13a79 (fffff801`803de409)  Branch
                                    ;inline PciBeginStateTransition() end

pci!PciDevice_Start+0xf6:
fffff801`803caa86 488b8738050000  mov     rax,qword ptr [rdi+538h]
fffff801`803caa8d a810            test    al,10h    ;if(FALSE == devext->LegacyDriver) , goto 0x13b68
fffff801`803caa8f 0f85633a0100    jne     pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x105:
; (if devext->HeaderType == 1), goto 0x7ea ?? 
; maybe a special way to handle bridge startup? (PCI dev type 1)
fffff801`803caa95 807f2c01        cmp     byte ptr [rdi+2Ch],1  
fffff801`803caa99 0f84db060000    je      pci!PciDevice_Start+0x7ea (fffff801`803cb17a)  Branch

pci!PciDevice_Start+0x10f:
;if(devext->EnumFailureCode != 0), goto 0x13b7b
;during tracing, I found VROC modified resource will make this field be PCI_FAILED_HARDWARE_UPDATE.
;that's why pcibus reject my resource modification.
fffff801`803caa9f 83bf7c05000000  cmp     dword ptr [rdi+57Ch],0
fffff801`803caaa6 0f855f3a0100    jne     pci!PciDevice_Start+0x13b7b (fffff801`803de50b)  Branch

pci!PciDevice_Start+0x11c:
fffff801`803caaac 48b90000000020000000 mov rcx,2000000000h
fffff801`803caab6 4885c1          test    rcx,rax
fffff801`803caab9 0f85533a0100    jne     pci!PciDevice_Start+0x13b82 (fffff801`803de512)  Branch

pci!PciDevice_Start+0x12f:
fffff801`803caabf 837f0401        cmp     dword ptr [rdi+4],1
fffff801`803caac3 0f8481000000    je      pci!PciDevice_Start+0x1ba (fffff801`803cab4a)  Branch

pci!PciDevice_Start+0x139:
fffff801`803caac9 8b571c          mov     edx,dword ptr [rdi+1Ch]
fffff801`803caacc 4c8d4528        lea     r8,[rbp+28h]
fffff801`803caad0 488b4f50        mov     rcx,qword ptr [rdi+50h]
fffff801`803caad4 e877a3fcff      call    pci!PciReadSlotIdData (fffff801`80394e50)
fffff801`803caad9 85c0            test    eax,eax
fffff801`803caadb 0f88813a0100    js      pci!PciDevice_Start+0x13bd2 (fffff801`803de562)  Branch

pci!PciDevice_Start+0x151:
fffff801`803caae1 488d5528        lea     rdx,[rbp+28h]
fffff801`803caae5 488bcf          mov     rcx,rdi
fffff801`803caae8 e803a9fcff      call    pci!PciIsSameDevice (fffff801`803953f0)
fffff801`803caaed 84c0            test    al,al
fffff801`803caaef 0f846d3a0100    je      pci!PciDevice_Start+0x13bd2 (fffff801`803de562)  Branch

pci!PciDevice_Start+0x165:
fffff801`803caaf5 83bf0804000004  cmp     dword ptr [rdi+408h],4
fffff801`803caafc 0f84263a0100    je      pci!PciDevice_Start+0x13b98 (fffff801`803de528)  Branch

pci!PciDevice_Start+0x172:
fffff801`803cab02 ba01000000      mov     edx,1
fffff801`803cab07 488bcf          mov     rcx,rdi
fffff801`803cab0a e861f1ffff      call    pci!PciSetHardwarePowerStatePassive (fffff801`803c9c70)
fffff801`803cab0f 85c0            test    eax,eax
fffff801`803cab11 0f88273a0100    js      pci!PciDevice_Start+0x13bae (fffff801`803de53e)  Branch

pci!PciDevice_Start+0x187:
fffff801`803cab17 488b4f40        mov     rcx,qword ptr [rdi+40h]
fffff801`803cab1b ba01000000      mov     edx,1
fffff801`803cab20 448bc2          mov     r8d,edx
fffff801`803cab23 c7870804000001000000 mov dword ptr [rdi+408h],1
fffff801`803cab2d 48ff15c487ffff  call    qword ptr [pci!_imp_PoSetPowerState (fffff801`803c32f8)]
fffff801`803cab34 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cab39 48a10800000080f7ffff mov rax,qword ptr [FFFFF78000000008h]
fffff801`803cab43 48898718050000  mov     qword ptr [rdi+518h],rax

pci!PciDevice_Start+0x1ba:
fffff801`803cab4a 8b8738050000    mov     eax,dword ptr [rdi+538h]
fffff801`803cab50 480fbae018      bt      rax,18h
fffff801`803cab55 7210            jb      pci!PciDevice_Start+0x1d7 (fffff801`803cab67)  Branch

pci!PciDevice_Start+0x1c7:
fffff801`803cab57 488b8f88000000  mov     rcx,qword ptr [rdi+88h]
fffff801`803cab5e 4885c9          test    rcx,rcx
fffff801`803cab61 0f85de050000    jne     pci!PciDevice_Start+0x7b5 (fffff801`803cb145)  Branch

pci!PciDevice_Start+0x1d7:
fffff801`803cab67 f6874805000010  test    byte ptr [rdi+548h],10h
fffff801`803cab6e 0f852f060000    jne     pci!PciDevice_Start+0x813 (fffff801`803cb1a3)  Branch

pci!PciDevice_Start+0x1e4:
fffff801`803cab74 4d8b4710        mov     r8,qword ptr [r15+10h]
fffff801`803cab78 488d8748030000  lea     rax,[rdi+348h]
fffff801`803cab7f 498b5708        mov     rdx,qword ptr [r15+8]
fffff801`803cab83 4c8d8d60010000  lea     r9,[rbp+160h]
fffff801`803cab8a 488bcf          mov     rcx,rdi
fffff801`803cab8d 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803cab92 e829e2ffff      call    pci!PciProcessStartResources (fffff801`803c8dc0)
fffff801`803cab97 8bf0            mov     esi,eax
fffff801`803cab99 85c0            test    eax,eax
fffff801`803cab9b 0f88d2390100    js      pci!PciDevice_Start+0x13be3 (fffff801`803de573)  Branch

pci!PciDevice_Start+0x211:
fffff801`803caba1 8b870c060000    mov     eax,dword ptr [rdi+60Ch]
fffff801`803caba7 4533ff          xor     r15d,r15d
fffff801`803cabaa a801            test    al,1
fffff801`803cabac 0f85d0390100    jne     pci!PciDevice_Start+0x13bf2 (fffff801`803de582)  Branch

pci!PciDevice_Start+0x222:
fffff801`803cabb2 488d573c        lea     rdx,[rdi+3Ch]
fffff801`803cabb6 488bcf          mov     rcx,rdi
fffff801`803cabb9 e8d2e6ffff      call    pci!PciDecodesFromDeviceResources (fffff801`803c9290)
fffff801`803cabbe 8bf0            mov     esi,eax
fffff801`803cabc0 85c0            test    eax,eax
fffff801`803cabc2 0f8830390100    js      pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x238:
fffff801`803cabc8 488d9fa0000000  lea     rbx,[rdi+0A0h]
fffff801`803cabcf 41b804010000    mov     r8d,104h
fffff801`803cabd5 488bcb          mov     rcx,rbx
fffff801`803cabd8 488d9560010000  lea     rdx,[rbp+160h]
fffff801`803cabdf e81c14fdff      call    pci!memcmp (fffff801`8039c000)
fffff801`803cabe4 85c0            test    eax,eax
fffff801`803cabe6 7463            je      pci!PciDevice_Start+0x2bb (fffff801`803cac4b)  Branch

pci!PciDevice_Start+0x258:
fffff801`803cabe8 488d8560010000  lea     rax,[rbp+160h]
fffff801`803cabef b902000000      mov     ecx,2

pci!PciDevice_Start+0x264:
fffff801`803cabf4 488d9b80000000  lea     rbx,[rbx+80h]
fffff801`803cabfb 0f1000          movups  xmm0,xmmword ptr [rax]
fffff801`803cabfe 0f104810        movups  xmm1,xmmword ptr [rax+10h]
fffff801`803cac02 488d8080000000  lea     rax,[rax+80h]
fffff801`803cac09 0f114380        movups  xmmword ptr [rbx-80h],xmm0
fffff801`803cac0d 0f1040a0        movups  xmm0,xmmword ptr [rax-60h]
fffff801`803cac11 0f114b90        movups  xmmword ptr [rbx-70h],xmm1
fffff801`803cac15 0f1048b0        movups  xmm1,xmmword ptr [rax-50h]
fffff801`803cac19 0f1143a0        movups  xmmword ptr [rbx-60h],xmm0
fffff801`803cac1d 0f1040c0        movups  xmm0,xmmword ptr [rax-40h]
fffff801`803cac21 0f114bb0        movups  xmmword ptr [rbx-50h],xmm1
fffff801`803cac25 0f1048d0        movups  xmm1,xmmword ptr [rax-30h]
fffff801`803cac29 0f1143c0        movups  xmmword ptr [rbx-40h],xmm0
fffff801`803cac2d 0f1040e0        movups  xmm0,xmmword ptr [rax-20h]
fffff801`803cac31 0f114bd0        movups  xmmword ptr [rbx-30h],xmm1
fffff801`803cac35 0f1048f0        movups  xmm1,xmmword ptr [rax-10h]
fffff801`803cac39 0f1143e0        movups  xmmword ptr [rbx-20h],xmm0
fffff801`803cac3d 0f114bf0        movups  xmmword ptr [rbx-10h],xmm1
fffff801`803cac41 4883e901        sub     rcx,1
fffff801`803cac45 75ad            jne     pci!PciDevice_Start+0x264 (fffff801`803cabf4)  Branch

pci!PciDevice_Start+0x2b7:
fffff801`803cac47 8b00            mov     eax,dword ptr [rax]
fffff801`803cac49 8903            mov     dword ptr [rbx],eax

pci!PciDevice_Start+0x2bb:
fffff801`803cac4b 4533c0          xor     r8d,r8d
fffff801`803cac4e 488d15fba8fcff  lea     rdx,[pci!PciUpdateHardware (fffff801`80395550)]
fffff801`803cac55 488bcf          mov     rcx,rdi
fffff801`803cac58 e89f82fcff      call    pci!PciDeviceCallCritical (fffff801`80392efc)
fffff801`803cac5d 8bf0            mov     esi,eax
fffff801`803cac5f 85c0            test    eax,eax
fffff801`803cac61 0f889b390100    js      pci!PciDevice_Start+0x13c72 (fffff801`803de602)  Branch

pci!PciDevice_Start+0x2d7:
fffff801`803cac67 488b9f88000000  mov     rbx,qword ptr [rdi+88h]
fffff801`803cac6e 4885db          test    rbx,rbx
fffff801`803cac71 0f85e4040000    jne     pci!PciDevice_Start+0x7cb (fffff801`803cb15b)  Branch

pci!PciDevice_Start+0x2e7:
fffff801`803cac77 488bcf          mov     rcx,rdi
fffff801`803cac7a e8519efcff      call    pci!PciProgramInterruptResource (fffff801`80394ad0)
fffff801`803cac7f 8bf0            mov     esi,eax
fffff801`803cac81 85c0            test    eax,eax
fffff801`803cac83 0f886f380100    js      pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x2f9:
fffff801`803cac89 488b4f50        mov     rcx,qword ptr [rdi+50h]
fffff801`803cac8d 4c8d4d88        lea     r9,[rbp-78h]
fffff801`803cac91 8b5f1c          mov     ebx,dword ptr [rdi+1Ch]
fffff801`803cac94 ba01000000      mov     edx,1
fffff801`803cac99 41b81f000200    mov     r8d,2001Fh
fffff801`803cac9f 4c897d88        mov     qword ptr [rbp-78h],r15
fffff801`803caca3 488b89e8000000  mov     rcx,qword ptr [rcx+0E8h]
fffff801`803cacaa 48ff156f84ffff  call    qword ptr [pci!_imp_IoOpenDeviceRegistryKey (fffff801`803c3120)]
fffff801`803cacb1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cacb6 4c8d35fb81feff  lea     r14,[pci!`string` (fffff801`803b2eb8)]
fffff801`803cacbd 8bf0            mov     esi,eax
fffff801`803cacbf 85c0            test    eax,eax
fffff801`803cacc1 0f881b020000    js      pci!PciDevice_Start+0x552 (fffff801`803caee2)  Branch

pci!PciDevice_Start+0x337:
fffff801`803cacc7 8bc3            mov     eax,ebx
fffff801`803cacc9 4c8d052082feff  lea     r8,[pci!`string` (fffff801`803b2ef0)]
fffff801`803cacd0 c1e805          shr     eax,5
fffff801`803cacd3 488d8de0020000  lea     rcx,[rbp+2E0h]
fffff801`803cacda 83e007          and     eax,7
fffff801`803cacdd 83e31f          and     ebx,1Fh
fffff801`803cace0 448bcb          mov     r9d,ebx
fffff801`803cace3 89442420        mov     dword ptr [rsp+20h],eax
fffff801`803cace7 ba1c000000      mov     edx,1Ch
fffff801`803cacec e83f88fcff      call    pci!RtlStringCbPrintfW (fffff801`80393530)
fffff801`803cacf1 8bf0            mov     esi,eax
fffff801`803cacf3 85c0            test    eax,eax
fffff801`803cacf5 0f88e7010000    js      pci!PciDevice_Start+0x552 (fffff801`803caee2)  Branch

pci!PciDevice_Start+0x36b:
fffff801`803cacfb 488b5d88        mov     rbx,qword ptr [rbp-78h]
fffff801`803cacff 488d15b281feff  lea     rdx,[pci!`string` (fffff801`803b2eb8)]
fffff801`803cad06 488d4db8        lea     rcx,[rbp-48h]
fffff801`803cad0a 44897d80        mov     dword ptr [rbp-80h],r15d
fffff801`803cad0e 458bef          mov     r13d,r15d
fffff801`803cad11 4c897c2458      mov     qword ptr [rsp+58h],r15
fffff801`803cad16 44897c2440      mov     dword ptr [rsp+40h],r15d
fffff801`803cad1b 4d8bf7          mov     r14,r15
fffff801`803cad1e 44897c247c      mov     dword ptr [rsp+7Ch],r15d
fffff801`803cad23 4d8be7          mov     r12,r15
fffff801`803cad26 48ff15a385ffff  call    qword ptr [pci!_imp_RtlInitUnicodeString (fffff801`803c32d0)]
fffff801`803cad2d 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cad32 488d45b8        lea     rax,[rbp-48h]
fffff801`803cad36 c745c830000000  mov     dword ptr [rbp-38h],30h
fffff801`803cad3d 0f57c0          xorps   xmm0,xmm0
fffff801`803cad40 488945d8        mov     qword ptr [rbp-28h],rax
fffff801`803cad44 4c8d45c8        lea     r8,[rbp-38h]
fffff801`803cad48 48895dd0        mov     qword ptr [rbp-30h],rbx
fffff801`803cad4c ba19000200      mov     edx,20019h
fffff801`803cad51 c745e040020000  mov     dword ptr [rbp-20h],240h
fffff801`803cad58 488d4c2458      lea     rcx,[rsp+58h]
fffff801`803cad5d f30f7f45e8      movdqu  xmmword ptr [rbp-18h],xmm0
fffff801`803cad62 48ff15ef85ffff  call    qword ptr [pci!_imp_ZwOpenKey (fffff801`803c3358)]
fffff801`803cad69 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cad6e 89442444        mov     dword ptr [rsp+44h],eax
fffff801`803cad72 8bf0            mov     esi,eax
fffff801`803cad74 85c0            test    eax,eax
fffff801`803cad76 0f8809010000    js      pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x3ec:
fffff801`803cad7c 488d95e0020000  lea     rdx,[rbp+2E0h]
fffff801`803cad83 488d4da8        lea     rcx,[rbp-58h]
fffff801`803cad87 48ff154285ffff  call    qword ptr [pci!_imp_RtlInitUnicodeString (fffff801`803c32d0)]
fffff801`803cad8e 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cad93 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff801`803cad98 488d442440      lea     rax,[rsp+40h]
fffff801`803cad9d 4533c9          xor     r9d,r9d
fffff801`803cada0 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`803cada5 488d55a8        lea     rdx,[rbp-58h]
fffff801`803cada9 44897c2420      mov     dword ptr [rsp+20h],r15d
fffff801`803cadae 458d4102        lea     r8d,[r9+2]
fffff801`803cadb2 48ff15af87ffff  call    qword ptr [pci!_imp_ZwQueryValueKey (fffff801`803c3568)]
fffff801`803cadb9 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cadbe 89442444        mov     dword ptr [rsp+44h],eax
fffff801`803cadc2 8bf0            mov     esi,eax
fffff801`803cadc4 3d230000c0      cmp     eax,0C0000023h
fffff801`803cadc9 0f8513390100    jne     pci!PciDevice_Start+0x13d52 (fffff801`803de6e2)  Branch

pci!PciDevice_Start+0x43f:
fffff801`803cadcf 8b542440        mov     edx,dword ptr [rsp+40h]
fffff801`803cadd3 b901010000      mov     ecx,101h
fffff801`803cadd8 41b850636942    mov     r8d,42696350h
fffff801`803cadde 48ff15f388ffff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff801`803c36d8)]
fffff801`803cade5 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cadea 4c8bf0          mov     r14,rax
fffff801`803caded 4885c0          test    rax,rax
fffff801`803cadf0 0f8402390100    je      pci!PciDevice_Start+0x13d68 (fffff801`803de6f8)  Branch

pci!PciDevice_Start+0x466:
fffff801`803cadf6 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff801`803cadfb 488d44247c      lea     rax,[rsp+7Ch]
fffff801`803cae00 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`803cae05 488d55a8        lea     rdx,[rbp-58h]
fffff801`803cae09 8b442440        mov     eax,dword ptr [rsp+40h]
fffff801`803cae0d 4d8bce          mov     r9,r14
fffff801`803cae10 41b802000000    mov     r8d,2
fffff801`803cae16 89442420        mov     dword ptr [rsp+20h],eax
fffff801`803cae1a 48ff154787ffff  call    qword ptr [pci!_imp_ZwQueryValueKey (fffff801`803c3568)]
fffff801`803cae21 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cae26 89442444        mov     dword ptr [rsp+44h],eax
fffff801`803cae2a 8bf0            mov     esi,eax
fffff801`803cae2c 85c0            test    eax,eax
fffff801`803cae2e 7855            js      pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x4a0:
fffff801`803cae30 41837e0403      cmp     dword ptr [r14+4],3
fffff801`803cae35 0f85cb380100    jne     pci!PciDevice_Start+0x13d76 (fffff801`803de706)  Branch

pci!PciDevice_Start+0x4ab:
fffff801`803cae3b 8b442440        mov     eax,dword ptr [rsp+40h]
fffff801`803cae3f b901010000      mov     ecx,101h
fffff801`803cae44 83c0f4          add     eax,0FFFFFFF4h
fffff801`803cae47 41b850636942    mov     r8d,42696350h
fffff801`803cae4d 8bd0            mov     edx,eax
fffff801`803cae4f 89442440        mov     dword ptr [rsp+40h],eax
fffff801`803cae53 48ff157e88ffff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff801`803c36d8)]
fffff801`803cae5a 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cae5f 4c8be0          mov     r12,rax
fffff801`803cae62 4885c0          test    rax,rax
fffff801`803cae65 0f84a9380100    je      pci!PciDevice_Start+0x13d84 (fffff801`803de714)  Branch

pci!PciDevice_Start+0x4db:
fffff801`803cae6b 448b442440      mov     r8d,dword ptr [rsp+40h]
fffff801`803cae70 498d560c        lea     rdx,[r14+0Ch]
fffff801`803cae74 488bc8          mov     rcx,rax
fffff801`803cae77 e88412fdff      call    pci!memcpy (fffff801`8039c100)
fffff801`803cae7c 448b6c2440      mov     r13d,dword ptr [rsp+40h]
fffff801`803cae81 44896d80        mov     dword ptr [rbp-80h],r13d

pci!PciDevice_Start+0x4f5:
fffff801`803cae85 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff801`803cae8a 4885c9          test    rcx,rcx
fffff801`803cae8d 740c            je      pci!PciDevice_Start+0x50b (fffff801`803cae9b)  Branch

pci!PciDevice_Start+0x4ff:
fffff801`803cae8f 48ff159282ffff  call    qword ptr [pci!_imp_ZwClose (fffff801`803c3128)]
fffff801`803cae96 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x50b:
fffff801`803cae9b 4d85f6          test    r14,r14
fffff801`803cae9e 7414            je      pci!PciDevice_Start+0x524 (fffff801`803caeb4)  Branch

pci!PciDevice_Start+0x510:
fffff801`803caea0 ba50636942      mov     edx,42696350h
fffff801`803caea5 498bce          mov     rcx,r14
fffff801`803caea8 48ff15a988ffff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff801`803c3758)]
fffff801`803caeaf 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x524:
fffff801`803caeb4 85f6            test    esi,esi
fffff801`803caeb6 7823            js      pci!PciDevice_Start+0x54b (fffff801`803caedb)  Branch

pci!PciDevice_Start+0x528:
fffff801`803caeb8 458bc5          mov     r8d,r13d
fffff801`803caebb 488d4d40        lea     rcx,[rbp+40h]
fffff801`803caebf 498bd4          mov     rdx,r12
fffff801`803caec2 e83912fdff      call    pci!memcpy (fffff801`8039c100)
fffff801`803caec7 ba50636942      mov     edx,42696350h
fffff801`803caecc 498bcc          mov     rcx,r12
fffff801`803caecf 48ff158288ffff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff801`803c3758)]
fffff801`803caed6 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x54b:
fffff801`803caedb 4c8d35d67ffeff  lea     r14,[pci!`string` (fffff801`803b2eb8)]

pci!PciDevice_Start+0x552:
fffff801`803caee2 488b4d88        mov     rcx,qword ptr [rbp-78h]
fffff801`803caee6 4885c9          test    rcx,rcx
fffff801`803caee9 740c            je      pci!PciDevice_Start+0x567 (fffff801`803caef7)  Branch

pci!PciDevice_Start+0x55b:
fffff801`803caeeb 48ff153682ffff  call    qword ptr [pci!_imp_ZwClose (fffff801`803c3128)]
fffff801`803caef2 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x567:
fffff801`803caef7 85f6            test    esi,esi
fffff801`803caef9 0f88f9350100    js      pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x56f:
fffff801`803caeff 0fb6472c        movzx   eax,byte ptr [rdi+2Ch]
fffff801`803caf03 0fb78f00040000  movzx   ecx,word ptr [rdi+400h]
fffff801`803caf0a fec8            dec     al
fffff801`803caf0c f20f108ff8030000 movsd   xmm1,mmword ptr [rdi+3F8h]
fffff801`803caf14 66894c2450      mov     word ptr [rsp+50h],cx
fffff801`803caf19 3c01            cmp     al,1
fffff801`803caf1b 0f8668020000    jbe     pci!PciDevice_Start+0x7f9 (fffff801`803cb189)  Branch

pci!PciDevice_Start+0x591:
fffff801`803caf21 66894d56        mov     word ptr [rbp+56h],cx
fffff801`803caf25 4c8d4c2448      lea     r9,[rsp+48h]
fffff801`803caf2a 488b4f50        mov     rcx,qword ptr [rdi+50h]
fffff801`803caf2e ba01000000      mov     edx,1
fffff801`803caf33 f20f114d4e      movsd   mmword ptr [rbp+4Eh],xmm1
fffff801`803caf38 41b806000200    mov     r8d,20006h
fffff801`803caf3e 4c897c2448      mov     qword ptr [rsp+48h],r15
fffff801`803caf43 4c897c2460      mov     qword ptr [rsp+60h],r15
fffff801`803caf48 488b89e8000000  mov     rcx,qword ptr [rcx+0E8h]
fffff801`803caf4f 48ff15ca81ffff  call    qword ptr [pci!_imp_IoOpenDeviceRegistryKey (fffff801`803c3120)]
fffff801`803caf56 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803caf5b 8bf0            mov     esi,eax
fffff801`803caf5d 85c0            test    eax,eax
fffff801`803caf5f 0f88ed000000    js      pci!PciDevice_Start+0x6c2 (fffff801`803cb052)  Branch

pci!PciDevice_Start+0x5d5:
fffff801`803caf65 488b442448      mov     rax,qword ptr [rsp+48h]
fffff801`803caf6a 4c8d45f8        lea     r8,[rbp-8]
fffff801`803caf6e 48894500        mov     qword ptr [rbp],rax
fffff801`803caf72 488d4c2460      lea     rcx,[rsp+60h]
fffff801`803caf77 488d4590        lea     rax,[rbp-70h]
fffff801`803caf7b 4c897c2430      mov     qword ptr [rsp+30h],r15
fffff801`803caf80 0f57c0          xorps   xmm0,xmm0
fffff801`803caf83 c744242801000000 mov     dword ptr [rsp+28h],1
fffff801`803caf8b 4533c9          xor     r9d,r9d
fffff801`803caf8e 48894508        mov     qword ptr [rbp+8],rax
fffff801`803caf92 ba06000200      mov     edx,20006h
fffff801`803caf97 c7459014001600  mov     dword ptr [rbp-70h],160014h
fffff801`803caf9e 4c897598        mov     qword ptr [rbp-68h],r14
fffff801`803cafa2 c745f830000000  mov     dword ptr [rbp-8],30h
fffff801`803cafa9 c7451040020000  mov     dword ptr [rbp+10h],240h
fffff801`803cafb0 f30f7f4518      movdqu  xmmword ptr [rbp+18h],xmm0
fffff801`803cafb5 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`803cafba 48ff158f81ffff  call    qword ptr [pci!_imp_ZwCreateKey (fffff801`803c3150)]
fffff801`803cafc1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cafc6 8bf0            mov     esi,eax
fffff801`803cafc8 85c0            test    eax,eax
fffff801`803cafca 0f8882000000    js      pci!PciDevice_Start+0x6c2 (fffff801`803cb052)  Branch

pci!PciDevice_Start+0x640:
fffff801`803cafd0 4c397c2460      cmp     qword ptr [rsp+60h],r15
fffff801`803cafd5 747b            je      pci!PciDevice_Start+0x6c2 (fffff801`803cb052)  Branch

pci!PciDevice_Start+0x647:
fffff801`803cafd7 448b4f1c        mov     r9d,dword ptr [rdi+1Ch]
fffff801`803cafdb 4c8d050e7ffeff  lea     r8,[pci!`string` (fffff801`803b2ef0)]
fffff801`803cafe2 418bc1          mov     eax,r9d
fffff801`803cafe5 488d8d00030000  lea     rcx,[rbp+300h]
fffff801`803cafec c1e805          shr     eax,5
fffff801`803cafef 4183e11f        and     r9d,1Fh
fffff801`803caff3 83e007          and     eax,7
fffff801`803caff6 ba1c000000      mov     edx,1Ch
fffff801`803caffb 89442420        mov     dword ptr [rsp+20h],eax
fffff801`803cafff e82c85fcff      call    pci!RtlStringCbPrintfW (fffff801`80393530)
fffff801`803cb004 8bf0            mov     esi,eax
fffff801`803cb006 85c0            test    eax,eax
fffff801`803cb008 7848            js      pci!PciDevice_Start+0x6c2 (fffff801`803cb052)  Branch

pci!PciDevice_Start+0x67a:
fffff801`803cb00a 488d9500030000  lea     rdx,[rbp+300h]
fffff801`803cb011 488d4d90        lea     rcx,[rbp-70h]
fffff801`803cb015 48ff15b482ffff  call    qword ptr [pci!_imp_RtlInitUnicodeString (fffff801`803c32d0)]
fffff801`803cb01c 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cb021 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff801`803cb026 488d4540        lea     rax,[rbp+40h]
fffff801`803cb02a c744242820010000 mov     dword ptr [rsp+28h],120h
fffff801`803cb032 488d5590        lea     rdx,[rbp-70h]
fffff801`803cb036 41b903000000    mov     r9d,3
fffff801`803cb03c 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803cb041 4533c0          xor     r8d,r8d
fffff801`803cb044 48ff151d81ffff  call    qword ptr [pci!_imp_ZwSetValueKey (fffff801`803c3168)]
fffff801`803cb04b 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803cb050 8bf0            mov     esi,eax

pci!PciDevice_Start+0x6c2:
fffff801`803cb052 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff801`803cb057 4885c9          test    rcx,rcx
fffff801`803cb05a 740c            je      pci!PciDevice_Start+0x6d8 (fffff801`803cb068)  Branch

pci!PciDevice_Start+0x6cc:
fffff801`803cb05c 48ff15c580ffff  call    qword ptr [pci!_imp_ZwClose (fffff801`803c3128)]
fffff801`803cb063 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x6d8:
fffff801`803cb068 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff801`803cb06d 4885c9          test    rcx,rcx
fffff801`803cb070 740c            je      pci!PciDevice_Start+0x6ee (fffff801`803cb07e)  Branch

pci!PciDevice_Start+0x6e2:
fffff801`803cb072 48ff15af80ffff  call    qword ptr [pci!_imp_ZwClose (fffff801`803c3128)]
fffff801`803cb079 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x6ee:
fffff801`803cb07e 85f6            test    esi,esi
fffff801`803cb080 0f8872340100    js      pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x6f6:
fffff801`803cb086 f04881a738050000ffffdfff lock and qword ptr [rdi+538h],0FFFFFFFFFFDFFFFFh
fffff801`803cb092 8b8738050000    mov     eax,dword ptr [rdi+538h]
fffff801`803cb098 480fbae018      bt      rax,18h
fffff801`803cb09d 721a            jb      pci!PciDevice_Start+0x729 (fffff801`803cb0b9)  Branch

pci!PciDevice_Start+0x70f:
fffff801`803cb09f 488b4f50        mov     rcx,qword ptr [rdi+50h]
fffff801`803cb0a3 ba04000000      mov     edx,4
fffff801`803cb0a8 e81385fcff      call    pci!PciBus_PowerDereference (fffff801`803935c0)
fffff801`803cb0ad f048818f3805000000000001 lock or qword ptr [rdi+538h],1000000h

pci!PciDevice_Start+0x729:
fffff801`803cb0b9 813f50636942    cmp     dword ptr [rdi],42696350h
fffff801`803cb0bf 0f845d360100    je      pci!PciDevice_Start+0x13d92 (fffff801`803de722)  Branch

pci!PciDevice_Start+0x735:
fffff801`803cb0c5 488b0d340fffff  mov     rcx,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803cb0cc 48ff158d7fffff  call    qword ptr [pci!_imp_imp_WppRecorderLogGetDefault (fffff801`803c3060)]
fffff801`803cb0d3 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDevice_Start+0x748:
fffff801`803cb0d8 41b90e000000    mov     r9d,0Eh
fffff801`803cb0de c744243001000000 mov     dword ptr [rsp+30h],1
fffff801`803cb0e6 488d0de37dfeff  lea     rcx,[pci!WPP_3897241c0bc43c4e354ada0deec054e1_Traceguids (fffff801`803b2ed0)]
fffff801`803cb0ed 48897c2428      mov     qword ptr [rsp+28h],rdi
fffff801`803cb0f2 48894c2420      mov     qword ptr [rsp+20h],rcx
fffff801`803cb0f7 b204            mov     dl,4
fffff801`803cb0f9 488bc8          mov     rcx,rax
fffff801`803cb0fc 458d41f4        lea     r8d,[r9-0Ch]
fffff801`803cb100 e89b82fcff      call    pci!WPP_RECORDER_SF_qL (fffff801`803933a0)
fffff801`803cb105 803d1913ffff00  cmp     byte ptr [pci!PciKSREnabled (fffff801`803bc425)],0
fffff801`803cb10c c7470401000000  mov     dword ptr [rdi+4],1
fffff801`803cb113 0f8515360100    jne     pci!PciDevice_Start+0x13d9e (fffff801`803de72e)  Branch

pci!PciDevice_Start+0x789:
fffff801`803cb119 8bc6            mov     eax,esi

pci!PciDevice_Start+0x78b:
fffff801`803cb11b 488b8d20030000  mov     rcx,qword ptr [rbp+320h]
fffff801`803cb122 4833cc          xor     rcx,rsp
fffff801`803cb125 e8f601fdff      call    pci!_security_check_cookie (fffff801`8039b320)
fffff801`803cb12a 488b9c2470040000 mov     rbx,qword ptr [rsp+470h]
fffff801`803cb132 4881c430040000  add     rsp,430h
fffff801`803cb139 415f            pop     r15
fffff801`803cb13b 415e            pop     r14
fffff801`803cb13d 415d            pop     r13
fffff801`803cb13f 415c            pop     r12
fffff801`803cb141 5f              pop     rdi
fffff801`803cb142 5e              pop     rsi
fffff801`803cb143 5d              pop     rbp
fffff801`803cb144 c3              ret

pci!PciDevice_Start+0x7b5:
fffff801`803cb145 e812d1ffff      call    pci!ExpressInitializeLtrValue (fffff801`803c825c)
fffff801`803cb14a 488b8f88000000  mov     rcx,qword ptr [rdi+88h]
fffff801`803cb151 e8b6d1ffff      call    pci!ExpressInitializeObffValue (fffff801`803c830c)
fffff801`803cb156 e90cfaffff      jmp     pci!PciDevice_Start+0x1d7 (fffff801`803cab67)  Branch

pci!PciDevice_Start+0x7cb:
fffff801`803cb15b 8b05df10ffff    mov     eax,dword ptr [pci!PciSystemWideHackFlags (fffff801`803bc240)]
fffff801`803cb161 a840            test    al,40h
fffff801`803cb163 0f84a8340100    je      pci!PciDevice_Start+0x13c81 (fffff801`803de611)  Branch

pci!PciDevice_Start+0x7d9:
fffff801`803cb169 488b8f88000000  mov     rcx,qword ptr [rdi+88h]
fffff801`803cb170 e86f7bfcff      call    pci!PciDeviceEnableAtomics (fffff801`80392ce4)
fffff801`803cb175 e9fdfaffff      jmp     pci!PciDevice_Start+0x2e7 (fffff801`803cac77)  Branch

pci!PciDevice_Start+0x7ea:
fffff801`803cb17a 807f3200        cmp     byte ptr [rdi+32h],0
fffff801`803cb17e 0f841bf9ffff    je      pci!PciDevice_Start+0x10f (fffff801`803caa9f)  Branch

pci!PciDevice_Start+0x7f4:
fffff801`803cb184 e987320100      jmp     pci!PciDevice_Start+0x13a80 (fffff801`803de410)  Branch

pci!PciDevice_Start+0x7f9:
fffff801`803cb189 0fb64556        movzx   eax,byte ptr [rbp+56h]
fffff801`803cb18d 88442450        mov     byte ptr [rsp+50h],al
fffff801`803cb191 0fb64557        movzx   eax,byte ptr [rbp+57h]
fffff801`803cb195 88442451        mov     byte ptr [rsp+51h],al
fffff801`803cb199 0fb74c2450      movzx   ecx,word ptr [rsp+50h]
fffff801`803cb19e e97efdffff      jmp     pci!PciDevice_Start+0x591 (fffff801`803caf21)  Branch

pci!PciDevice_Start+0x813:
fffff801`803cb1a3 4533ff          xor     r15d,r15d
fffff801`803cb1a6 418bf7          mov     esi,r15d
fffff801`803cb1a9 e9d8feffff      jmp     pci!PciDevice_Start+0x6f6 (fffff801`803cb086)  Branch

pci!PciDevice_Start+0x13a30:
fffff801`803de3c0 4d8bb028030000  mov     r14,qword ptr [r8+328h]
fffff801`803de3c7 e925c6feff      jmp     pci!PciDevice_Start+0x61 (fffff801`803ca9f1)  Branch

pci!PciDevice_Start+0x13a3c:
fffff801`803de3cc 894c2430        mov     dword ptr [rsp+30h],ecx
fffff801`803de3d0 41b90b000000    mov     r9d,0Bh
fffff801`803de3d6 498bce          mov     rcx,r14
fffff801`803de3d9 c744242801000000 mov     dword ptr [rsp+28h],1
fffff801`803de3e1 e8da14fdff      call    pci!WPP_RECORDER_SF_LL (fffff801`803af8c0)
fffff801`803de3e6 90              nop
fffff801`803de3e7 e96ec6feff      jmp     pci!PciDevice_Start+0xca (fffff801`803caa5a)  Branch

pci!PciDevice_Start+0x13a5c:
fffff801`803de3ec 894c2430        mov     dword ptr [rsp+30h],ecx
fffff801`803de3f0 458bcd          mov     r9d,r13d
fffff801`803de3f3 498bce          mov     rcx,r14
fffff801`803de3f6 c744242801000000 mov     dword ptr [rsp+28h],1
fffff801`803de3fe e8bd14fdff      call    pci!WPP_RECORDER_SF_LL (fffff801`803af8c0)
fffff801`803de403 90              nop
fffff801`803de404 e951c6feff      jmp     pci!PciDevice_Start+0xca (fffff801`803caa5a)  Branch

pci!PciDevice_Start+0x13a79:
fffff801`803de409 8bc3            mov     eax,ebx
fffff801`803de40b e90bcdfeff      jmp     pci!PciDevice_Start+0x78b (fffff801`803cb11b)  Branch

pci!PciDevice_Start+0x13a80:
fffff801`803de410 48b90000000080000000 mov rcx,8000000000h
fffff801`803de41a 4885c1          test    rcx,rax
fffff801`803de41d 0f847cc6feff    je      pci!PciDevice_Start+0x10f (fffff801`803caa9f)  Branch

pci!PciDevice_Start+0x13a93:
fffff801`803de423 833d9edcfdff05  cmp     dword ptr [pci!EntryReg+0x18 (fffff801`803bc0c8)],5
fffff801`803de42a 0f86c8000000    jbe     pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x13aa0:
fffff801`803de430 e8e754fcff      call    pci!TlgKeywordOn (fffff801`803a391c)
fffff801`803de435 84c0            test    al,al
fffff801`803de437 0f84bb000000    je      pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x13aad:
fffff801`803de43d 0fb74720        movzx   eax,word ptr [rdi+20h]
fffff801`803de441 89442468        mov     dword ptr [rsp+68h],eax
fffff801`803de445 0fb74722        movzx   eax,word ptr [rdi+22h]
fffff801`803de449 8944246c        mov     dword ptr [rsp+6Ch],eax
fffff801`803de44d 0fb64724        movzx   eax,byte ptr [rdi+24h]
fffff801`803de451 89442470        mov     dword ptr [rsp+70h],eax
fffff801`803de455 0fb74728        movzx   eax,word ptr [rdi+28h]
fffff801`803de459 89442474        mov     dword ptr [rsp+74h],eax
fffff801`803de45d 0fb7472a        movzx   eax,word ptr [rdi+2Ah]
fffff801`803de461 89442478        mov     dword ptr [rsp+78h],eax
fffff801`803de465 488d442468      lea     rax,[rsp+68h]
fffff801`803de46a 48898590020000  mov     qword ptr [rbp+290h],rax
fffff801`803de471 488d44246c      lea     rax,[rsp+6Ch]
fffff801`803de476 488985a0020000  mov     qword ptr [rbp+2A0h],rax
fffff801`803de47d 488d442470      lea     rax,[rsp+70h]
fffff801`803de482 488985b0020000  mov     qword ptr [rbp+2B0h],rax
fffff801`803de489 488d442474      lea     rax,[rsp+74h]
fffff801`803de48e 488985c0020000  mov     qword ptr [rbp+2C0h],rax
fffff801`803de495 488d442478      lea     rax,[rsp+78h]
fffff801`803de49a 488985d0020000  mov     qword ptr [rbp+2D0h],rax
fffff801`803de4a1 48c7859802000004000000 mov qword ptr [rbp+298h],4
fffff801`803de4ac 48c785a802000004000000 mov qword ptr [rbp+2A8h],4
fffff801`803de4b7 48c785b802000004000000 mov qword ptr [rbp+2B8h],4
fffff801`803de4c2 48c785c802000004000000 mov qword ptr [rbp+2C8h],4
fffff801`803de4cd 48c785d802000004000000 mov qword ptr [rbp+2D8h],4
fffff801`803de4d8 488d8570020000  lea     rax,[rbp+270h]
fffff801`803de4df 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`803de4e4 488d15e866fdff  lea     rdx,[pci!TraceLoggingMetadata+0x31b (fffff801`803b4bd3)]
fffff801`803de4eb c744242007000000 mov     dword ptr [rsp+20h],7
fffff801`803de4f3 e85854fcff      call    pci!TlgWrite (fffff801`803a3950)

pci!PciDevice_Start+0x13b68:
fffff801`803de4f8 ba01000000      mov     edx,1
fffff801`803de4fd 488bcf          mov     rcx,rdi
fffff801`803de500 e8df0d0100      call    pci!PciCancelStateTransition (fffff801`803ef2e4)
fffff801`803de505 90              nop
fffff801`803de506 e90eccfeff      jmp     pci!PciDevice_Start+0x789 (fffff801`803cb119)  Branch

pci!PciDevice_Start+0x13b7b:
fffff801`803de50b be010000c0      mov     esi,0C0000001h
fffff801`803de510 ebe6            jmp     pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x13b82:
fffff801`803de512 450fb7c5        movzx   r8d,r13w
fffff801`803de516 410fb7d5        movzx   edx,r13w
fffff801`803de51a 488bcf          mov     rcx,rdi
fffff801`803de51d e8d29c0000      call    pci!PciEnableAcsForHierarchy (fffff801`803e81f4)
fffff801`803de522 90              nop
fffff801`803de523 e997c5feff      jmp     pci!PciDevice_Start+0x12f (fffff801`803caabf)  Branch

pci!PciDevice_Start+0x13b98:
fffff801`803de528 488b4f50        mov     rcx,qword ptr [rdi+50h]
fffff801`803de52c ba01000000      mov     edx,1
fffff801`803de531 e83a54fbff      call    pci!PciBus_PowerReference (fffff801`80393970)
fffff801`803de536 41b401          mov     r12b,1
fffff801`803de539 e9c4c5feff      jmp     pci!PciDevice_Start+0x172 (fffff801`803cab02)  Branch

pci!PciDevice_Start+0x13bae:
fffff801`803de53e 818f7c05000000000200 or  dword ptr [rdi+57Ch],20000h
fffff801`803de548 be9e0000c0      mov     esi,0C000009Eh
fffff801`803de54d 4584e4          test    r12b,r12b
fffff801`803de550 74a6            je      pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x13bc2:
fffff801`803de552 488b4f50        mov     rcx,qword ptr [rdi+50h]
fffff801`803de556 ba01000000      mov     edx,1
fffff801`803de55b e86050fbff      call    pci!PciBus_PowerDereference (fffff801`803935c0)
fffff801`803de560 eb96            jmp     pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x13bd2:
fffff801`803de562 818f7c05000000000100 or  dword ptr [rdi+57Ch],10000h
fffff801`803de56c bec00000c0      mov     esi,0C00000C0h
fffff801`803de571 eb85            jmp     pci!PciDevice_Start+0x13b68 (fffff801`803de4f8)  Branch

pci!PciDevice_Start+0x13be3:
fffff801`803de573 818f7c05000000000400 or  dword ptr [rdi+57Ch],40000h
fffff801`803de57d e9fccafeff      jmp     pci!PciDevice_Start+0x6ee (fffff801`803cb07e)  Branch

pci!PciDevice_Start+0x13bf2:
fffff801`803de582 458bf7          mov     r14d,r15d
fffff801`803de585 488d9d60010000  lea     rbx,[rbp+160h]
fffff801`803de58c 41bcffffffff    mov     r12d,0FFFFFFFFh

pci!PciDevice_Start+0x13c02:
fffff801`803de592 0fb603          movzx   eax,byte ptr [rbx]
fffff801`803de595 2c03            sub     al,3
fffff801`803de597 a8fb            test    al,0FBh
fffff801`803de599 7555            jne     pci!PciDevice_Start+0x13c60 (fffff801`803de5f0)  Branch

pci!PciDevice_Start+0x13c0b:
fffff801`803de59b 488d55a0        lea     rdx,[rbp-60h]
fffff801`803de59f 488bcb          mov     rcx,rbx
fffff801`803de5a2 48ff153f51feff  call    qword ptr [pci!_imp_RtlCmDecodeMemIoResource (fffff801`803c36e8)]
fffff801`803de5a9 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803de5ae 4885c0          test    rax,rax
fffff801`803de5b1 743d            je      pci!PciDevice_Start+0x13c60 (fffff801`803de5f0)  Branch

pci!PciDevice_Start+0x13c23:
fffff801`803de5b3 4c8b45a0        mov     r8,qword ptr [rbp-60h]
fffff801`803de5b7 488d8fd8050000  lea     rcx,[rdi+5D8h]
fffff801`803de5be 418bd7          mov     edx,r15d
fffff801`803de5c1 c644242001      mov     byte ptr [rsp+20h],1
fffff801`803de5c6 4d8d48ff        lea     r9,[r8-1]
fffff801`803de5ca 4c03c8          add     r9,rax
fffff801`803de5cd 4d3bcc          cmp     r9,r12
fffff801`803de5d0 0f96c2          setbe   dl
fffff801`803de5d3 83c202          add     edx,2
fffff801`803de5d6 e8e5b3fcff      call    pci!PciFpbPdoSetResourceDescriptor (fffff801`803a99c0)
fffff801`803de5db 8bf0            mov     esi,eax
fffff801`803de5dd 85c0            test    eax,eax
fffff801`803de5df 790f            jns     pci!PciDevice_Start+0x13c60 (fffff801`803de5f0)  Branch

pci!PciDevice_Start+0x13c51:
fffff801`803de5e1 818f7c05000000001000 or  dword ptr [rdi+57Ch],100000h
fffff801`803de5eb e98ecafeff      jmp     pci!PciDevice_Start+0x6ee (fffff801`803cb07e)  Branch

pci!PciDevice_Start+0x13c60:
fffff801`803de5f0 41ffc6          inc     r14d
fffff801`803de5f3 4883c314        add     rbx,14h
fffff801`803de5f7 4183fe0d        cmp     r14d,0Dh
fffff801`803de5fb 7295            jb      pci!PciDevice_Start+0x13c02 (fffff801`803de592)  Branch

pci!PciDevice_Start+0x13c6d:
fffff801`803de5fd e9b0c5feff      jmp     pci!PciDevice_Start+0x222 (fffff801`803cabb2)  Branch

pci!PciDevice_Start+0x13c72:
fffff801`803de602 818f7c05000000000800 or  dword ptr [rdi+57Ch],80000h
fffff801`803de60c e96dcafeff      jmp     pci!PciDevice_Start+0x6ee (fffff801`803cb07e)  Branch

pci!PciDevice_Start+0x13c81:
fffff801`803de611 488b7320        mov     rsi,qword ptr [rbx+20h]
fffff801`803de615 4885f6          test    rsi,rsi
fffff801`803de618 0f844bcbfeff    je      pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13c8e:
fffff801`803de61e 8b06            mov     eax,dword ptr [rsi]
fffff801`803de620 83e804          sub     eax,4
fffff801`803de623 a9fdffffff      test    eax,0FFFFFFFDh
fffff801`803de628 0f853bcbfeff    jne     pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13c9e:
fffff801`803de62e 4438be80050000  cmp     byte ptr [rsi+580h],r15b
fffff801`803de635 740d            je      pci!PciDevice_Start+0x13cb4 (fffff801`803de644)  Branch

pci!PciDevice_Start+0x13ca7:
fffff801`803de637 4438be81050000  cmp     byte ptr [rsi+581h],r15b
fffff801`803de63e 0f8525cbfeff    jne     pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13cb4:
fffff801`803de644 4c8b7348        mov     r14,qword ptr [rbx+48h]
fffff801`803de648 4d85f6          test    r14,r14
fffff801`803de64b 0f8418cbfeff    je      pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13cc1:
fffff801`803de651 8b4360          mov     eax,dword ptr [rbx+60h]
fffff801`803de654 a802            test    al,2
fffff801`803de656 0f850dcbfeff    jne     pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13ccc:
fffff801`803de65c 486303          movsxd  rax,dword ptr [rbx]
fffff801`803de65f 83f809          cmp     eax,9
fffff801`803de662 7746            ja      pci!PciDevice_Start+0x13d1a (fffff801`803de6aa)  Branch

pci!PciDevice_Start+0x13cd4:
fffff801`803de664 488d159519fbff  lea     rdx,[pci!PciBusInterface_GetBusData <PERF> (pci+0x0) (fffff801`80390000)]
fffff801`803de66b 8b8c8200470200  mov     ecx,dword ptr [rdx+rax*4+24700h]
fffff801`803de672 4803ca          add     rcx,rdx
fffff801`803de675 ffe1            jmp     rcx

pci!PciDevice_Start+0x13d1a:
fffff801`803de6aa 45387e12        cmp     byte ptr [r14+12h],r15b
fffff801`803de6ae 7409            je      pci!PciDevice_Start+0x13d29 (fffff801`803de6b9)  Branch

pci!PciDevice_Start+0x13d20:
fffff801`803de6b0 4438be80050000  cmp     byte ptr [rsi+580h],r15b
fffff801`803de6b7 7417            je      pci!PciDevice_Start+0x13d40 (fffff801`803de6d0)  Branch

pci!PciDevice_Start+0x13d29:
fffff801`803de6b9 45387e13        cmp     byte ptr [r14+13h],r15b
fffff801`803de6bd 0f84a6cafeff    je      pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13d33:
fffff801`803de6c3 4438be81050000  cmp     byte ptr [rsi+581h],r15b
fffff801`803de6ca 0f8599cafeff    jne     pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13d40:
fffff801`803de6d0 834b6002        or      dword ptr [rbx+60h],2
fffff801`803de6d4 488bcb          mov     rcx,rbx
fffff801`803de6d7 e8e86d0000      call    pci!ExpressBridgeRegisterDeviceForAspmCallbacks (fffff801`803e54c4)
fffff801`803de6dc 90              nop
fffff801`803de6dd e987cafeff      jmp     pci!PciDevice_Start+0x7d9 (fffff801`803cb169)  Branch

pci!PciDevice_Start+0x13d52:
fffff801`803de6e2 85c0            test    eax,eax
fffff801`803de6e4 0f889bc7feff    js      pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x13d5a:
fffff801`803de6ea be010000c0      mov     esi,0C0000001h
fffff801`803de6ef 89742444        mov     dword ptr [rsp+44h],esi
fffff801`803de6f3 e98dc7feff      jmp     pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x13d68:
fffff801`803de6f8 be9a0000c0      mov     esi,0C000009Ah
fffff801`803de6fd 89742444        mov     dword ptr [rsp+44h],esi
fffff801`803de701 e97fc7feff      jmp     pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x13d76:
fffff801`803de706 be0d0000c0      mov     esi,0C000000Dh
fffff801`803de70b 89742444        mov     dword ptr [rsp+44h],esi
fffff801`803de70f e971c7feff      jmp     pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x13d84:
fffff801`803de714 be9a0000c0      mov     esi,0C000009Ah
fffff801`803de719 89742444        mov     dword ptr [rsp+44h],esi
fffff801`803de71d e963c7feff      jmp     pci!PciDevice_Start+0x4f5 (fffff801`803cae85)  Branch

pci!PciDevice_Start+0x13d92:
fffff801`803de722 488b8728030000  mov     rax,qword ptr [rdi+328h]
fffff801`803de729 e9aac9feff      jmp     pci!PciDevice_Start+0x748 (fffff801`803cb0d8)  Branch

pci!PciDevice_Start+0x13d9e:
fffff801`803de72e 8b4f18          mov     ecx,dword ptr [rdi+18h]
fffff801`803de731 8b571c          mov     edx,dword ptr [rdi+1Ch]
fffff801`803de734 e84f01fdff      call    pci!PciKsrInvalidatePersitedCommandRegister (fffff801`803ae888)
fffff801`803de739 90              nop
fffff801`803de73a e9dac9feff      jmp     pci!PciDevice_Start+0x789 (fffff801`803cb119)  Branch
