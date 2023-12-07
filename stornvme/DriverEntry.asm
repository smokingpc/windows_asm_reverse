0: kd> ??sizeof(_HW_INITIALIZATION_DATA)
unsigned int64 0xd0
0: kd> dt _HW_INITIALIZATION_DATA
storport!_HW_INITIALIZATION_DATA
   +0x000 HwInitializationDataSize : Uint4B
   +0x004 AdapterInterfaceType : _INTERFACE_TYPE
   +0x008 HwInitialize     : Ptr64     unsigned char 
   +0x010 HwStartIo        : Ptr64     unsigned char 
   +0x018 HwInterrupt      : Ptr64     unsigned char 
   +0x020 HwFindAdapter    : Ptr64 Void
   +0x028 HwResetBus       : Ptr64     unsigned char 
   +0x030 HwDmaStarted     : Ptr64     void 
   +0x038 HwAdapterState   : Ptr64     unsigned char 
   +0x040 DeviceExtensionSize : Uint4B
   +0x044 SpecificLuExtensionSize : Uint4B
   +0x048 SrbExtensionSize : Uint4B
   +0x04c NumberOfAccessRanges : Uint4B
   +0x050 Reserved         : Ptr64 Void
   +0x058 MapBuffers       : UChar
   +0x059 NeedPhysicalAddresses : UChar
   +0x05a TaggedQueuing    : UChar
   +0x05b AutoRequestSense : UChar
   +0x05c MultipleRequestPerLu : UChar
   +0x05d ReceiveEvent     : UChar
   +0x05e VendorIdLength   : Uint2B
   +0x060 VendorId         : Ptr64 Void
   +0x068 ReservedUshort   : Uint2B
   +0x068 PortVersionFlags : Uint2B
   +0x06a DeviceIdLength   : Uint2B
   +0x070 DeviceId         : Ptr64 Void
   +0x078 HwAdapterControl : Ptr64     _SCSI_ADAPTER_CONTROL_STATUS 
   +0x080 HwBuildIo        : Ptr64     unsigned char 
   +0x088 HwFreeAdapterResources : Ptr64     void 
   +0x090 HwProcessServiceRequest : Ptr64     void 
   +0x098 HwCompleteServiceIrp : Ptr64     void 
   +0x0a0 HwInitializeTracing : Ptr64     void 
   +0x0a8 HwCleanupTracing : Ptr64     void 
   +0x0b0 HwTracingEnabled : Ptr64     void 
   +0x0b8 FeatureSupport   : Uint4B
   +0x0bc SrbTypeFlags     : Uint4B
   +0x0c0 AddressTypeFlags : Uint4B
   +0x0c4 Reserved1        : Uint4B
   +0x0c8 HwUnitControl    : Ptr64     _SCSI_UNIT_CONTROL_STATUS 


0: kd> uf stornvme!driverentry
stornvme!DriverEntry:
fffff802`0a588fdc 48895c2408      mov     qword ptr [rsp+8],rbx
fffff802`0a588fe1 48897c2410      mov     qword ptr [rsp+10h],rdi
fffff802`0a588fe6 55              push    rbp
fffff802`0a588fe7 488d6c24a9      lea     rbp,[rsp-57h]
fffff802`0a588fec 4881ecf0000000  sub     rsp,0F0h
fffff802`0a588ff3 488bda          mov     rbx,rdx
fffff802`0a588ff6 488bf9          mov     rdi,rcx
fffff802`0a588ff9 33d2            xor     edx,edx
fffff802`0a588ffb 488d4d87        lea     rcx,[rbp-79h]                             ;variable address of HW_INITIALIZATION_DATA
fffff802`0a588fff 41b8d0000000    mov     r8d,0D0h
fffff802`0a589005 e8b6c4ffff      call    stornvme!memset (fffff802`0a5854c0)       ;cleanup HW_INITIALIZATION_DATA
fffff802`0a58900a 814d3fb8110000  or      dword ptr [rbp+3Fh],11B8h                 ;FeatureSupport = 0x11B8
fffff802`0a589011 488d05b8070000  lea     rax,[stornvme!NVMeHwInitialize (fffff802`0a5897d0)]
fffff802`0a589018 4889458f        mov     qword ptr [rbp-71h],rax                   ;HwInitialize
fffff802`0a58901c 4c8d4587        lea     r8,[rbp-79h]
fffff802`0a589020 488d05e990ffff  lea     rax,[stornvme!NVMeHwStartIo (fffff802`0a582110)]
fffff802`0a589027 c74587d0000000  mov     dword ptr [rbp-79h],0D0h                  ;HwInitializationDataSize
fffff802`0a58902e 48894597        mov     qword ptr [rbp-69h],rax                   ;HwStartIo
fffff802`0a589032 4533c9          xor     r9d,r9d
fffff802`0a589035 488d05f4070000  lea     rax,[stornvme!NVMeHwInterrupt (fffff802`0a589830)]
fffff802`0a58903c c745df02010101  mov     dword ptr [rbp-21h],1010102h              ;MapBuffers=2, NeedPhysicalAddresses=TaggedQueuing=AutoRequestSense=TRUE
fffff802`0a589043 4889459f        mov     qword ptr [rbp-61h],rax
fffff802`0a589047 488bd3          mov     rdx,rbx
fffff802`0a58904a 488d059f010000  lea     rax,[stornvme!NVMeHwFindAdapter (fffff802`0a5891f0)]
fffff802`0a589051 c7458b05000000  mov     dword ptr [rbp-75h],5                     ;AdapterInterfaceType=PCIBus
fffff802`0a589058 488945a7        mov     qword ptr [rbp-59h],rax
fffff802`0a58905c 488bcf          mov     rcx,rdi
fffff802`0a58905f 488d05fa080000  lea     rax,[stornvme!NVMeHwResetBus (fffff802`0a589960)]
fffff802`0a589066 c645e301        mov     byte ptr [rbp-1Dh],1                      ;MultipleRequestPerLu=TRUE
fffff802`0a58906a 488945af        mov     qword ptr [rbp-51h],rax
fffff802`0a58906e 488d051bbaffff  lea     rax,[stornvme!NVMeHwAdapterControl (fffff802`0a584a90)]
fffff802`0a589075 488945ff        mov     qword ptr [rbp-1],rax
fffff802`0a589079 488d05e0a8ffff  lea     rax,[stornvme!NVMeHwBuildIo (fffff802`0a583960)]
fffff802`0a589080 48894507        mov     qword ptr [rbp+7],rax
fffff802`0a589084 488d0535c0ffff  lea     rax,[stornvme!NVMeHwTracingEnabled (fffff802`0a5850c0)]
fffff802`0a58908b 48894537        mov     qword ptr [rbp+37h],rax
fffff802`0a58908f 488d050a090000  lea     rax,[stornvme!NVMeHwUnitControl (fffff802`0a5899a0)]
fffff802`0a589096 4889454f        mov     qword ptr [rbp+4Fh],rax
fffff802`0a58909a b802000000      mov     eax,2
fffff802`0a58909f 8945d3          mov     dword ptr [rbp-2Dh],eax                   ;NumberOfAccessRanges=2
fffff802`0a5890a2 894543          mov     dword ptr [rbp+43h],eax                   ;SrbTypeFlags=SRB_TYPE_FLAG_STORAGE_REQUEST_BLOCK
fffff802`0a5890a5 c745c7980f0000  mov     dword ptr [rbp-39h],0F98h                 ;DeviceExtensionSize=0x0F98
fffff802`0a5890ac c745cfa0200000  mov     dword ptr [rbp-31h],20A0h                 ;SrbExtensionSize=0x20A0
fffff802`0a5890b3 4c8b155ecf0100  mov     r10,qword ptr [stornvme!_imp_StorPortInitialize (fffff802`0a5a6018)]
fffff802`0a5890ba e821a7f6ff      call    storport!StorPortInitialize (fffff802`0a4f37e0)
fffff802`0a5890bf 4c8d9c24f0000000 lea     r11,[rsp+0F0h]
fffff802`0a5890c7 498b5b10        mov     rbx,qword ptr [r11+10h]
fffff802`0a5890cb 498b7b18        mov     rdi,qword ptr [r11+18h]
fffff802`0a5890cf 498be3          mov     rsp,r11
fffff802`0a5890d2 5d              pop     rbp
fffff802`0a5890d3 c3              ret
