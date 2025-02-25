3: kd> uf stornvme!driverentry
stornvme!DriverEntry:
fffff804`3c490df0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff804`3c490df5 48897c2410      mov     qword ptr [rsp+10h],rdi
fffff804`3c490dfa 55              push    rbp
fffff804`3c490dfb 488d6c24a9      lea     rbp,[rsp-57h]
fffff804`3c490e00 4881ecf0000000  sub     rsp,0F0h
fffff804`3c490e07 488bda          mov     rbx,rdx
fffff804`3c490e0a 488bf9          mov     rdi,rcx
fffff804`3c490e0d 33d2            xor     edx,edx
fffff804`3c490e0f 488d4d87        lea     rcx,[rbp-79h] ;HW_INITIALIZATION_DATA  hwinit;
fffff804`3c490e13 41b8d0000000    mov     r8d,0D0h      ;sizeof(_HW_INITIALIZATION_DATA)
fffff804`3c490e19 e862d60100      call    stornvme!_memset_spec_ermsb (fffff804`3c4ae480)
fffff804`3c490e1e 803ddbe2020000  cmp     byte ptr [stornvme!g_DumpPreInitializeInvoked (fffff804`3c4bf100)],0
fffff804`3c490e25 7505            jne     stornvme!DriverEntry+0x3c (fffff804`3c490e2c)  Branch

stornvme!DriverEntry+0x37:
fffff804`3c490e27 e84c520300      call    stornvme!wil_InitializeFeatureStaging (fffff804`3c4c6078)

stornvme!DriverEntry+0x3c:
fffff804`3c490e2c 814d3fb8b103c0  or      dword ptr [rbp+3Fh],0C003B1B8h
fffff804`3c490e33 488d05163e0000  lea     rax,[stornvme!NVMeHwInitialize (fffff804`3c494c50)]
fffff804`3c490e3a 4889458f        mov     qword ptr [rbp-71h],rax   ;HW_INITIALIZATION_DATA::HwInitialize = NVMeHwInitialize();
fffff804`3c490e3e 4c8d4587        lea     r8,[rbp-79h]
fffff804`3c490e42 488d0507400000  lea     rax,[stornvme!NVMeHwStartIo (fffff804`3c494e50)]
fffff804`3c490e49 c74587d0000000  mov     dword ptr [rbp-79h],0D0h  ;HW_INITIALIZATION_DATA::HwInitializationDataSize = 0xD0
fffff804`3c490e50 48894597        mov     qword ptr [rbp-69h],rax   ;HW_INITIALIZATION_DATA::HwStartIo = NVMeHwStartIo
fffff804`3c490e54 4533c9          xor     r9d,r9d
fffff804`3c490e57 488d05f21bffff  lea     rax,[stornvme!NVMeHwInterrupt (fffff804`3c482a50)]
fffff804`3c490e5e c745df02010101  mov     dword ptr [rbp-21h],1010102h  ;(HW_INITIALIZATION_DATA)MapBuffers=STOR_MAP_NON_READ_WRITE_BUFFERS, NeedPhysicalAddresses=1, TaggedQueuing=1, AutoRequestSense=1
fffff804`3c490e65 4889459f        mov     qword ptr [rbp-61h],rax   ;HW_INITIALIZATION_DATA::HwInterrupt = NVMeHwInterrupt
fffff804`3c490e69 488bd3          mov     rdx,rbx
fffff804`3c490e6c 488d058d350000  lea     rax,[stornvme!NVMeHwFindAdapter (fffff804`3c494400)]
fffff804`3c490e73 c745d302000000  mov     dword ptr [rbp-2Dh],2     ;NumberOfAccessRanges = 2
fffff804`3c490e7a 488945a7        mov     qword ptr [rbp-59h],rax   ;HW_INITIALIZATION_DATA::HwFindAdapter=NVMeHwFindAdapter
fffff804`3c490e7e 488bcf          mov     rcx,rdi
fffff804`3c490e81 488d05783f0000  lea     rax,[stornvme!NVMeHwResetBus (fffff804`3c494e00)]
fffff804`3c490e88 c7458b05000000  mov     dword ptr [rbp-75h],5     ;HW_INITIALIZATION_DATA::AdapterInterfaceType = PCIBus
fffff804`3c490e8f 488945af        mov     qword ptr [rbp-51h],rax   ;HW_INITIALIZATION_DATA::HwResetBus = NVMeHwResetBus
fffff804`3c490e93 488d05960cffff  lea     rax,[stornvme!NVMeHwAdapterControl (fffff804`3c481b30)]
fffff804`3c490e9a 488945ff        mov     qword ptr [rbp-1],rax     ;HW_INITIALIZATION_DATA::HwAdapterControl = NVMeHwAdapterControl
fffff804`3c490e9e 488d050b85ffff  lea     rax,[stornvme!NVMeHwBuildIo (fffff804`3c4893b0)]
fffff804`3c490ea5 48894507        mov     qword ptr [rbp+7],rax     ;HW_INITIALIZATION_DATA::HwBuildIo = NVMeHwBuildIo
fffff804`3c490ea9 488d0550410000  lea     rax,[stornvme!NVMeHwTracingEnabled (fffff804`3c495000)]
fffff804`3c490eb0 48894537        mov     qword ptr [rbp+37h],rax   ;HW_INITIALIZATION_DATA::HwTracingEnabled = NVMeHwTracingEnabled
fffff804`3c490eb4 488d05a5f9ffff  lea     rax,[stornvme!NVMeHwUnitControl (fffff804`3c490860)]
fffff804`3c490ebb 4889454f        mov     qword ptr [rbp+4Fh],rax   ;HW_INITIALIZATION_DATA::HwUnitControl = NVMeHwUnitControl
fffff804`3c490ebf c645e301        mov     byte ptr [rbp-1Dh],1      ;HW_INITIALIZATION_DATA::MultipleRequestPerLu = TRUE
fffff804`3c490ec3 c745c760100000  mov     dword ptr [rbp-39h],1060h ;DeviceExtensionSize = sizeof(stornvme devext) = 0x1060
fffff804`3c490eca c745cf80200000  mov     dword ptr [rbp-31h],2080h ;SrbExtensionSize = sizeof(stornvme srvext) = 0x2080
fffff804`3c490ed1 c7454302000000  mov     dword ptr [rbp+43h],2     ;SrbTypeFlags = SRB_TYPE_FLAG_STORAGE_REQUEST_BLOCK
fffff804`3c490ed8 4c8b15c9210300  mov     r10,qword ptr [stornvme!_imp_StorPortInitialize (fffff804`3c4c30a8)]
fffff804`3c490edf e8dc93d9ff      call    storport!StorPortInitialize (fffff804`3c22a2c0)
fffff804`3c490ee4 8bd8            mov     ebx,eax
fffff804`3c490ee6 803d13e2020000  cmp     byte ptr [stornvme!g_DumpPreInitializeInvoked (fffff804`3c4bf100)],0
fffff804`3c490eed 7563            jne     stornvme!DriverEntry+0x162 (fffff804`3c490f52)  Branch

stornvme!DriverEntry+0xff:
fffff804`3c490eef 85c0            test    eax,eax
fffff804`3c490ef1 751d            jne     stornvme!DriverEntry+0x120 (fffff804`3c490f10)  Branch

stornvme!DriverEntry+0x103:
fffff804`3c490ef3 488b4f68        mov     rcx,qword ptr [rdi+68h]
fffff804`3c490ef7 48890daae20200  mov     qword ptr [stornvme!StorPortDriverUnload (fffff804`3c4bf1a8)],rcx
fffff804`3c490efe 4885c9          test    rcx,rcx
fffff804`3c490f01 744f            je      stornvme!DriverEntry+0x162 (fffff804`3c490f52)  Branch

stornvme!DriverEntry+0x113:
fffff804`3c490f03 488d0596c10100  lea     rax,[stornvme!StorNVMeDriverUnload (fffff804`3c4ad0a0)]
fffff804`3c490f0a 48894768        mov     qword ptr [rdi+68h],rax
fffff804`3c490f0e eb40            jmp     stornvme!DriverEntry+0x160 (fffff804`3c490f50)  Branch

stornvme!DriverEntry+0x120:
fffff804`3c490f10 488b0d91e30200  mov     rcx,qword ptr [stornvme!wil_details_featureChangeNotification (fffff804`3c4bf2a8)]
fffff804`3c490f17 33ff            xor     edi,edi
fffff804`3c490f19 4885c9          test    rcx,rcx
fffff804`3c490f1c 7413            je      stornvme!DriverEntry+0x141 (fffff804`3c490f31)  Branch

stornvme!DriverEntry+0x12e:
fffff804`3c490f1e 4c8b15e3200300  mov     r10,qword ptr [stornvme!_imp_RtlUnregisterFeatureConfigurationChangeNotification (fffff804`3c4c3008)]
fffff804`3c490f25 e806814c6d      call    nt!RtlUnregisterFeatureConfigurationChangeNotification (fffff804`a9959030)
fffff804`3c490f2a 48893d77e30200  mov     qword ptr [stornvme!wil_details_featureChangeNotification (fffff804`3c4bf2a8)],rdi

stornvme!DriverEntry+0x141:
fffff804`3c490f31 488b0dd0e10200  mov     rcx,qword ptr [stornvme!g_wil_details_featureUsageProvider (fffff804`3c4bf108)]
fffff804`3c490f38 4885c9          test    rcx,rcx
fffff804`3c490f3b 7413            je      stornvme!DriverEntry+0x160 (fffff804`3c490f50)  Branch

stornvme!DriverEntry+0x14d:
fffff804`3c490f3d 4c8b15cc200300  mov     r10,qword ptr [stornvme!_imp_RtlUnregisterFeatureUsageProvider (fffff804`3c4c3010)]
fffff804`3c490f44 e807814c6d      call    nt!RtlUnregisterFeatureUsageProvider (fffff804`a9959050)
fffff804`3c490f49 48893db8e10200  mov     qword ptr [stornvme!g_wil_details_featureUsageProvider (fffff804`3c4bf108)],rdi

stornvme!DriverEntry+0x160:
fffff804`3c490f50 8bc3            mov     eax,ebx

stornvme!DriverEntry+0x162:
fffff804`3c490f52 4c8d9c24f0000000 lea     r11,[rsp+0F0h]
fffff804`3c490f5a 498b5b10        mov     rbx,qword ptr [r11+10h]
fffff804`3c490f5e 498b7b18        mov     rdi,qword ptr [r11+18h]
fffff804`3c490f62 498be3          mov     rsp,r11
fffff804`3c490f65 5d              pop     rbp
fffff804`3c490f66 c3              ret
