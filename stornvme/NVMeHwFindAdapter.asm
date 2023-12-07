

6: kd> dt stornvme!_PORT_CONFIGURATION_INFORMATION
   +0x000 Length           : Uint4B
   +0x004 SystemIoBusNumber : Uint4B
   +0x008 AdapterInterfaceType : _INTERFACE_TYPE
   +0x00c BusInterruptLevel : Uint4B
   +0x010 BusInterruptVector : Uint4B
   +0x014 InterruptMode    : _KINTERRUPT_MODE
   +0x018 MaximumTransferLength : Uint4B
   +0x01c NumberOfPhysicalBreaks : Uint4B
   +0x020 DmaChannel       : Uint4B
   +0x024 DmaPort          : Uint4B
   +0x028 DmaWidth         : _DMA_WIDTH
   +0x02c DmaSpeed         : _DMA_SPEED
   +0x030 AlignmentMask    : Uint4B
   +0x034 NumberOfAccessRanges : Uint4B
   +0x038 AccessRanges     : Ptr64 [0] _ACCESS_RANGE
   +0x040 MiniportDumpData : Ptr64 Void
   +0x048 NumberOfBuses    : UChar
   +0x049 InitiatorBusId   : [8] Char
   +0x051 ScatterGather    : UChar
   +0x052 Master           : UChar
   +0x053 CachesData       : UChar
   +0x054 AdapterScansDown : UChar
   +0x055 AtdiskPrimaryClaimed : UChar
   +0x056 AtdiskSecondaryClaimed : UChar
   +0x057 Dma32BitAddresses : UChar
   +0x058 DemandMode       : UChar
   +0x059 MapBuffers       : UChar
   +0x05a NeedPhysicalAddresses : UChar
   +0x05b TaggedQueuing    : UChar
   +0x05c AutoRequestSense : UChar
   +0x05d MultipleRequestPerLu : UChar
   +0x05e ReceiveEvent     : UChar
   +0x05f RealModeInitialized : UChar
   +0x060 BufferAccessScsiPortControlled : UChar
   +0x061 MaximumNumberOfTargets : UChar
   +0x062 SrbType          : UChar
   +0x063 AddressType      : UChar
   +0x064 SlotNumber       : Uint4B
   +0x068 BusInterruptLevel2 : Uint4B
   +0x06c BusInterruptVector2 : Uint4B
   +0x070 InterruptMode2   : _KINTERRUPT_MODE
   +0x074 DmaChannel2      : Uint4B
   +0x078 DmaPort2         : Uint4B
   +0x07c DmaWidth2        : _DMA_WIDTH
   +0x080 DmaSpeed2        : _DMA_SPEED
   +0x084 DeviceExtensionSize : Uint4B
   +0x088 SpecificLuExtensionSize : Uint4B
   +0x08c SrbExtensionSize : Uint4B
   +0x090 Dma64BitAddresses : UChar
   +0x091 ResetTargetSupported : UChar
   +0x092 MaximumNumberOfLogicalUnits : UChar
   +0x093 WmiDataProvider  : UChar
   +0x094 SynchronizationModel : _STOR_SYNCHRONIZATION_MODEL
   +0x098 HwMSInterruptRoutine : Ptr64     unsigned char 
   +0x0a0 InterruptSynchronizationMode : _INTERRUPT_SYNCHRONIZATION_MODE
   +0x0a8 DumpRegion       : _MEMORY_REGION
   +0x0c0 RequestedDumpBufferSize : Uint4B
   +0x0c4 VirtualDevice    : UChar
   +0x0c5 DumpMode         : UChar
   +0x0c6 DmaAddressWidth  : UChar
   +0x0c8 ExtendedFlags1   : Uint4B
   +0x0cc MaxNumberOfIO    : Uint4B
   +0x0d0 MaxIOsPerLun     : Uint4B
   +0x0d4 InitialLunQueueDepth : Uint4B
   +0x0d8 BusResetHoldTime : Uint4B
   +0x0dc FeatureSupport   : Uint4B


21: kd> uf stornvme!NVMeHwFindAdapter
stornvme!NVMeHwFindAdapter:
fffff806`b48a98f0 488bc4          mov     rax,rsp
fffff806`b48a98f3 48895810        mov     qword ptr [rax+10h],rbx
fffff806`b48a98f7 48897018        mov     qword ptr [rax+18h],rsi
fffff806`b48a98fb 48897820        mov     qword ptr [rax+20h],rdi
fffff806`b48a98ff 55              push    rbp
fffff806`b48a9900 4154            push    r12
fffff806`b48a9902 4156            push    r14
fffff806`b48a9904 488d68b1        lea     rbp,[rax-4Fh]
fffff806`b48a9908 4881ecc0000000  sub     rsp,0C0h
fffff806`b48a990f 488b05ea360100  mov     rax,qword ptr [stornvme!_security_cookie (fffff806`b48bd000)]
fffff806`b48a9916 4833c4          xor     rax,rsp
fffff806`b48a9919 48894527        mov     qword ptr [rbp+27h],rax
fffff806`b48a991d 488b7d77        mov     rdi,qword ptr [rbp+77h]           ;arg: PORT_CONFIGURATION_INFORMATION ConfigInfo
fffff806`b48a9921 488bd9          mov     rbx,rcx                           ;rbx == pAE
fffff806`b48a9924 448b6114        mov     r12d,dword ptr [rcx+14h]
fffff806`b48a9928 488b7740        mov     rsi,qword ptr [rdi+40h]
fffff806`b48a992c 4183e402        and     r12d,2
fffff806`b48a9930 751d            jne     stornvme!NVMeHwFindAdapter+0x5f (fffff806`b48a994f)  Branch

stornvme!NVMeHwFindAdapter+0x42:
fffff806`b48a9932 0fb60d67370100  movzx   ecx,byte ptr [stornvme!g_ControllerExtensionIndex (fffff806`b48bd0a0)]
fffff806`b48a9939 488d15e0360100  lea     rdx,[stornvme!g_ControllerExtension (fffff806`b48bd020)]
fffff806`b48a9940 48891cca        mov     qword ptr [rdx+rcx*8],rbx
fffff806`b48a9944 fec1            inc     cl
fffff806`b48a9946 80e10f          and     cl,0Fh
fffff806`b48a9949 880d51370100    mov     byte ptr [stornvme!g_ControllerExtensionIndex (fffff806`b48bd0a0)],cl

stornvme!NVMeHwFindAdapter+0x5f:
fffff806`b48a994f 8a87c5000000    mov     al,byte ptr [rdi+0C5h]                ;PORT_CONFIGURATION_INFORMATION::DumpMode
fffff806`b48a9955 41be40000000    mov     r14d,40h
fffff806`b48a995b 884310          mov     byte ptr [rbx+10h],al
fffff806`b48a995e 84c0            test    al,al
fffff806`b48a9960 0f84a1000000    je      stornvme!NVMeHwFindAdapter+0x117 (fffff806`b48a9a07)  Branch ;if DumpMode==0 goto 0x117 GetBusData....

stornvme!NVMeHwFindAdapter+0x76:
fffff806`b48a9966 4885f6          test    rsi,rsi
fffff806`b48a9969 0f8487000000    je      stornvme!NVMeHwFindAdapter+0x106 (fffff806`b48a99f6)  Branch

stornvme!NVMeHwFindAdapter+0x7f:
fffff806`b48a996f 8364242000      and     dword ptr [rsp+20h],0
fffff806`b48a9974 458d4e38        lea     r9d,[r14+38h]
fffff806`b48a9978 4c8bc6          mov     r8,rsi
fffff806`b48a997b 418d4eed        lea     ecx,[r14-13h]
fffff806`b48a997f 488bd3          mov     rdx,rbx
fffff806`b48a9982 48ff159f560100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`b48bf028)]
fffff806`b48a9989 0f1f440000      nop     dword ptr [rax+rax]
fffff806`b48a998e 0fb706          movzx   eax,word ptr [rsi]
fffff806`b48a9991 66894304        mov     word ptr [rbx+4],ax
fffff806`b48a9995 0fb74602        movzx   eax,word ptr [rsi+2]
fffff806`b48a9999 66894306        mov     word ptr [rbx+6],ax
fffff806`b48a999d 8a4604          mov     al,byte ptr [rsi+4]
fffff806`b48a99a0 884308          mov     byte ptr [rbx+8],al
fffff806`b48a99a3 4c8b4608        mov     r8,qword ptr [rsi+8]
fffff806`b48a99a7 4c898380000000  mov     qword ptr [rbx+80h],r8
fffff806`b48a99ae 0f104610        movups  xmm0,xmmword ptr [rsi+10h]
fffff806`b48a99b2 0f11431c        movups  xmmword ptr [rbx+1Ch],xmm0
fffff806`b48a99b6 0f104e20        movups  xmm1,xmmword ptr [rsi+20h]
fffff806`b48a99ba 0f114b2c        movups  xmmword ptr [rbx+2Ch],xmm1
fffff806`b48a99be 0f104630        movups  xmm0,xmmword ptr [rsi+30h]
fffff806`b48a99c2 0f11433c        movups  xmmword ptr [rbx+3Ch],xmm0
fffff806`b48a99c6 0f104e40        movups  xmm1,xmmword ptr [rsi+40h]
fffff806`b48a99ca 0f114b4c        movups  xmmword ptr [rbx+4Ch],xmm1
fffff806`b48a99ce 0f104650        movups  xmm0,xmmword ptr [rsi+50h]
fffff806`b48a99d2 0f11435c        movups  xmmword ptr [rbx+5Ch],xmm0
fffff806`b48a99d6 0f104e60        movups  xmm1,xmmword ptr [rsi+60h]
fffff806`b48a99da 0f114b6c        movups  xmmword ptr [rbx+6Ch],xmm1
fffff806`b48a99de 8b4670          mov     eax,dword ptr [rsi+70h]
fffff806`b48a99e1 89437c          mov     dword ptr [rbx+7Ch],eax
fffff806`b48a99e4 8b4674          mov     eax,dword ptr [rsi+74h]
fffff806`b48a99e7 834b3404        or      dword ptr [rbx+34h],4
fffff806`b48a99eb 8983b0000000    mov     dword ptr [rbx+0B0h],eax
fffff806`b48a99f1 e9a1000000      jmp     stornvme!NVMeHwFindAdapter+0x1a7 (fffff806`b48a9a97)  Branch

stornvme!NVMeHwFindAdapter+0x106:
fffff806`b48a99f6 c7431802000000  mov     dword ptr [rbx+18h],2
fffff806`b48a99fd b802000000      mov     eax,2
fffff806`b48a9a02 e99d030000      jmp     stornvme!NVMeHwFindAdapter+0x4b4 (fffff806`b48a9da4)  Branch

stornvme!NVMeHwFindAdapter+0x117:
fffff806`b48a9a07 4d8bc6          mov     r8,r14                            ;r14 == 0x40 => is this PCI_COMMON_HEADER?
fffff806`b48a9a0a 488d4de7        lea     rcx,[rbp-19h]
fffff806`b48a9a0e 33d2            xor     edx,edx
fffff806`b48a9a10 e8abceffff      call    stornvme!memset (fffff806`b48a68c0)
fffff806`b48a9a15 448b4f64        mov     r9d,dword ptr [rdi+64h]           ;SlotNumber => rdi is PORT_CONFIGURATION_INFORMATION 
fffff806`b48a9a19 488d45e7        lea     rax,[rbp-19h]
fffff806`b48a9a1d 448b4704        mov     r8d,dword ptr [rdi+4]             ;SystemIoBusNumber
fffff806`b48a9a21 ba04000000      mov     edx,4                             ;BusDataType=PCIConfiguration
fffff806`b48a9a26 4489742428      mov     dword ptr [rsp+28h],r14d          ;length
fffff806`b48a9a2b 488bcb          mov     rcx,rbx                           ;pAE
fffff806`b48a9a2e 4889442420      mov     qword ptr [rsp+20h],rax           ;BUFFER
fffff806`b48a9a33 48ff15e6550100  call    qword ptr [stornvme!_imp_StorPortGetBusData (fffff806`b48bf020)]
fffff806`b48a9a3a 0f1f440000      nop     dword ptr [rax+rax]
fffff806`b48a9a3f 488bcb          mov     rcx,rbx
fffff806`b48a9a42 413bc6          cmp     eax,r14d
fffff806`b48a9a45 0f854a030000    jne     stornvme!NVMeHwFindAdapter+0x4a5 (fffff806`b48a9d95)  Branch  ;if StorPortGetBusData ret != length, goto 0x4a5

stornvme!NVMeHwFindAdapter+0x15b:
fffff806`b48a9a4b 0fb745e7        movzx   eax,word ptr [rbp-19h]        ;PCI_COMMON_HEADER ptr
fffff806`b48a9a4f 66894304        mov     word ptr [rbx+4],ax           ;read DeviceID from PCI_COMMON_HEADER to pAE+4
fffff806`b48a9a53 0fb745e9        movzx   eax,word ptr [rbp-17h]
fffff806`b48a9a57 66894306        mov     word ptr [rbx+6],ax           ;read VendorID from PCI_COMMON_HEADER to pAE+6
fffff806`b48a9a5b 8a45ef          mov     al,byte ptr [rbp-11h]
fffff806`b48a9a5e 884308          mov     byte ptr [rbx+8],al           ;read RevisionID from PCI_COMMON_HEADER to pAE+8
fffff806`b48a9a61 e892fdffff      call    stornvme!IsIntelChatham (fffff806`b48a97f8)
fffff806`b48a9a66 84c0            test    al,al
fffff806`b48a9a68 740f            je      stornvme!NVMeHwFindAdapter+0x189 (fffff806`b48a9a79)  Branch  ;if false==IsIntelChatham() goto NVMeHwFindAdapter+0x189

stornvme!NVMeHwFindAdapter+0x17a:
fffff806`b48a9a6a 488b45ff        mov     rax,qword ptr [rbp-1]         ;rax==> PCI_COMMON_HEADER::type0.BaseAddresses[2][3]
fffff806`b48a9a6e b900f0ffff      mov     ecx,0FFFFF000h                ;refer to NVMe v1.3 2.1.10. get MLBAR(BAR0) BA field. intel Chatham use 20 bits in BA field.
fffff806`b48a9a73 448b4503        mov     r8d,dword ptr [rbp+3]         ;rax==> PCI_COMMON_HEADER::type0.BaseAddresses[3]
fffff806`b48a9a77 eb0d            jmp     stornvme!NVMeHwFindAdapter+0x196 (fffff806`b48a9a86)  Branch

stornvme!NVMeHwFindAdapter+0x189:
fffff806`b48a9a79 488b45f7        mov     rax,qword ptr [rbp-9]         ;rax==> PCI_COMMON_HEADER::type0.BaseAddresses[0][1]
fffff806`b48a9a7d b900c0ffff      mov     ecx,0FFFFC000h                ;refer to NVMe v1.3 2.1.10. get MLBAR(BAR0) BA field.
fffff806`b48a9a82 448b45fb        mov     r8d,dword ptr [rbp-5]         ;rax==> PCI_COMMON_HEADER::type0.BaseAddresses[1]

stornvme!NVMeHwFindAdapter+0x196:
fffff806`b48a9a86 4823c1          and     rax,rcx
fffff806`b48a9a89 49c1e020        shl     r8,20h                ;refer to NVMe v1.3 2.1.11. get MUBAR(BAR1) and Lshift 32 bits. use it as upper bits
fffff806`b48a9a8d 4c0bc0          or      r8,rax                ;combine r8 eax into int64 ptr => real 64bit BAR0
fffff806`b48a9a90 4c898380000000  mov     qword ptr [rbx+80h],r8

stornvme!NVMeHwFindAdapter+0x1a7:
fffff806`b48a9a97 488bd7          mov     rdx,rdi                           ;rdi => PORT_CONFIGURATION_INFORMATION 
fffff806`b48a9a9a 488bcb          mov     rcx,rbx                           ;rbx => pAE
fffff806`b48a9a9d e862da0000      call    stornvme!GetNVMeRegisterAddress (fffff806`b48b7504) ;GetNVMeRegisterAddress(pAE, PORT_CONFIGURATION_INFORMATION, PCIBUS_BAR0);
fffff806`b48a9aa2 48898388000000  mov     qword ptr [rbx+88h],rax           ;pAE+0x88 == CtrlReg mapped address
fffff806`b48a9aa9 488bc8          mov     rcx,rax
fffff806`b48a9aac 4885c0          test    rax,rax
fffff806`b48a9aaf 750f            jne     stornvme!NVMeHwFindAdapter+0x1d0 (fffff806`b48a9ac0)  Branch

stornvme!NVMeHwFindAdapter+0x1c1:
fffff806`b48a9ab1 c7431804000000  mov     dword ptr [rbx+18h],4
fffff806`b48a9ab8 8d7003          lea     esi,[rax+3]
fffff806`b48a9abb e9d0020000      jmp     stornvme!NVMeHwFindAdapter+0x4a0 (fffff806`b48a9d90)  Branch

stornvme!NVMeHwFindAdapter+0x1d0:
fffff806`b48a9ac0 8b00            mov     eax,dword ptr [rax]
fffff806`b48a9ac2 8b4904          mov     ecx,dword ptr [rcx+4]
fffff806`b48a9ac5 48c1e120        shl     rcx,20h
fffff806`b48a9ac9 480bc8          or      rcx,rax
fffff806`b48a9acc 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff806`b48a9ad3 48898b98000000  mov     qword ptr [rbx+98h],rcx
fffff806`b48a9ada 8b4008          mov     eax,dword ptr [rax+8]
fffff806`b48a9add ba04000000      mov     edx,4
fffff806`b48a9ae2 4c8b8398000000  mov     r8,qword ptr [rbx+98h]
fffff806`b48a9ae9 498bc8          mov     rcx,r8
fffff806`b48a9aec 898390000000    mov     dword ptr [rbx+90h],eax
fffff806`b48a9af2 48c1e920        shr     rcx,20h
fffff806`b48a9af6 80e10f          and     cl,0Fh
fffff806`b48a9af9 49c1e818        shr     r8,18h
fffff806`b48a9afd d3e2            shl     edx,cl
fffff806`b48a9aff 488bcb          mov     rcx,rbx
fffff806`b48a9b02 8993a0000000    mov     dword ptr [rbx+0A0h],edx
fffff806`b48a9b08 e8ebfcffff      call    stornvme!IsIntelChatham (fffff806`b48a97f8)
fffff806`b48a9b0d 84c0            test    al,al
fffff806`b48a9b0f 740a            je      stornvme!NVMeHwFindAdapter+0x22b (fffff806`b48a9b1b)  Branch

stornvme!NVMeHwFindAdapter+0x221:
fffff806`b48a9b11 c6839b00000001  mov     byte ptr [rbx+9Bh],1
fffff806`b48a9b18 41b001          mov     r8b,1

stornvme!NVMeHwFindAdapter+0x22b:
fffff806`b48a9b1b 410fb6c0        movzx   eax,r8b           ;r8b == CtrlRegister->Cap.TO
fffff806`b48a9b1f 69c8f4010000    imul    ecx,eax,1F4h      ;ecx = eax*500 => ­pºâ timeout milliseconds
fffff806`b48a9b25 807b1000        cmp     byte ptr [rbx+10h],0
fffff806`b48a9b29 898ba4000000    mov     dword ptr [rbx+0A4h],ecx  ;uSecTimeout
fffff806`b48a9b2f 750d            jne     stornvme!NVMeHwFindAdapter+0x24e (fffff806`b48a9b3e)  Branch

stornvme!NVMeHwFindAdapter+0x241:
fffff806`b48a9b31 4585e4          test    r12d,r12d
fffff806`b48a9b34 7508            jne     stornvme!NVMeHwFindAdapter+0x24e (fffff806`b48a9b3e)  Branch

stornvme!NVMeHwFindAdapter+0x246:
fffff806`b48a9b36 488bcb          mov     rcx,rbx
fffff806`b48a9b39 e82eda0000      call    stornvme!GetRegistrySettings (fffff806`b48b756c)

stornvme!NVMeHwFindAdapter+0x24e:
fffff806`b48a9b3e be03000000      mov     esi,3
fffff806`b48a9b43 8bc6            mov     eax,esi
fffff806`b48a9b45 448d4efe        lea     r9d,[rsi-2]
fffff806`b48a9b49 44394f14        cmp     dword ptr [rdi+14h],r9d
fffff806`b48a9b4d 410f45c1        cmovne  eax,r9d
fffff806`b48a9b51 89430c          mov     dword ptr [rbx+0Ch],eax
fffff806`b48a9b54 807b1000        cmp     byte ptr [rbx+10h],0
fffff806`b48a9b58 8b4320          mov     eax,dword ptr [rbx+20h]
fffff806`b48a9b5b c7830001000040001000 mov dword ptr [rbx+100h],100040h
fffff806`b48a9b65 7413            je      stornvme!NVMeHwFindAdapter+0x28a (fffff806`b48a9b7a)  Branch

stornvme!NVMeHwFindAdapter+0x277:
fffff806`b48a9b67 664489b304010000 mov     word ptr [rbx+104h],r14w
fffff806`b48a9b6f 85c0            test    eax,eax
fffff806`b48a9b71 7447            je      stornvme!NVMeHwFindAdapter+0x2ca (fffff806`b48a9bba)  Branch

stornvme!NVMeHwFindAdapter+0x283:
fffff806`b48a9b73 413bc6          cmp     eax,r14d
fffff806`b48a9b76 7742            ja      stornvme!NVMeHwFindAdapter+0x2ca (fffff806`b48a9bba)  Branch

stornvme!NVMeHwFindAdapter+0x288:
fffff806`b48a9b78 eb3c            jmp     stornvme!NVMeHwFindAdapter+0x2c6 (fffff806`b48a9bb6)  Branch

stornvme!NVMeHwFindAdapter+0x28a:
fffff806`b48a9b7a 4c8b8398000000  mov     r8,qword ptr [rbx+98h]
fffff806`b48a9b81 85c0            test    eax,eax
fffff806`b48a9b83 b900010000      mov     ecx,100h
fffff806`b48a9b88 ba00040000      mov     edx,400h
fffff806`b48a9b8d 0f45d0          cmovne  edx,eax
fffff806`b48a9b90 66898b04010000  mov     word ptr [rbx+104h],cx
fffff806`b48a9b97 410fb7c8        movzx   ecx,r8w
fffff806`b48a9b9b 4903c9          add     rcx,r9
fffff806`b48a9b9e 8bc2            mov     eax,edx
fffff806`b48a9ba0 483bc1          cmp     rax,rcx
fffff806`b48a9ba3 7207            jb      stornvme!NVMeHwFindAdapter+0x2bc (fffff806`b48a9bac)  Branch

stornvme!NVMeHwFindAdapter+0x2b5:
fffff806`b48a9ba5 410fb7d0        movzx   edx,r8w
fffff806`b48a9ba9 4103d1          add     edx,r9d

stornvme!NVMeHwFindAdapter+0x2bc:
fffff806`b48a9bac b8ffff0000      mov     eax,0FFFFh
fffff806`b48a9bb1 3bd0            cmp     edx,eax
fffff806`b48a9bb3 0f42c2          cmovb   eax,edx

stornvme!NVMeHwFindAdapter+0x2c6:
fffff806`b48a9bb6 440fb7f0        movzx   r14d,ax

stornvme!NVMeHwFindAdapter+0x2ca:
fffff806`b48a9bba 664489b306010000 mov     word ptr [rbx+106h],r14w                     ;r14==0x400
fffff806`b48a9bc2 897730          mov     dword ptr [rdi+30h],esi                       ;AlignmentMask = 3, FILE_LONG_ALIGNMENT
fffff806`b48a9bc5 498bf1          mov     rsi,r9                                        ;r9==1
fffff806`b48a9bc8 40887751        mov     byte ptr [rdi+51h],sil                        ;ScatterGather = TRUE
fffff806`b48a9bcc 89b794000000    mov     dword ptr [rdi+94h],esi                       ;SynchronizationModel = StorSynchronizeFullDuplex(1);
fffff806`b48a9bd2 c6879100000000  mov     byte ptr [rdi+91h],0                          ;ResetTargetSupported = FALSE
fffff806`b48a9bd9 44394f14        cmp     dword ptr [rdi+14h],r9d                       ;InterruptMode = Latched
fffff806`b48a9bdd 7515            jne     stornvme!NVMeHwFindAdapter+0x304 (fffff806`b48a9bf4)  Branch

stornvme!NVMeHwFindAdapter+0x2ef:
fffff806`b48a9bdf 488d05eabfffff  lea     rax,[stornvme!NVMeHwMSIInterrupt (fffff806`b48a5bd0)]
fffff806`b48a9be6 48898798000000  mov     qword ptr [rdi+98h],rax                       ;HwMSInterruptRoutine = stornvme!NVMeHwMSIInterrupt()
fffff806`b48a9bed b802000000      mov     eax,2
fffff806`b48a9bf2 eb02            jmp     stornvme!NVMeHwFindAdapter+0x306 (fffff806`b48a9bf6)  Branch

stornvme!NVMeHwFindAdapter+0x304:
fffff806`b48a9bf4 8bc6            mov     eax,esi

stornvme!NVMeHwFindAdapter+0x306:
fffff806`b48a9bf6 8987a0000000    mov     dword ptr [rdi+0A0h],eax                      ;InterruptSynchronizationMode = InterruptSynchronizeAll
fffff806`b48a9bfc 83a7d800000000  and     dword ptr [rdi+0D8h],0                        ;BusResetHoldTime = 0
fffff806`b48a9c03 80bf9000000080  cmp     byte ptr [rdi+90h],80h                        ;if(Dma64BitAddresses != SCSI_DMA64_SYSTEM_SUPPORTED) goto 0x323
fffff806`b48a9c0a 7507            jne     stornvme!NVMeHwFindAdapter+0x323 (fffff806`b48a9c13)  Branch

stornvme!NVMeHwFindAdapter+0x31c:
fffff806`b48a9c0c c6879000000002  mov     byte ptr [rdi+90h],2                          ;   Dma64BitAddresses=SCSI_DMA64_MINIPORT_FULL64BIT_SUPPORTED;

stornvme!NVMeHwFindAdapter+0x323:
fffff806`b48a9c13 8b8fdc000000    mov     ecx,dword ptr [rdi+0DCh]
fffff806`b48a9c19 41be20000000    mov     r14d,20h                              ;STOR_ADAPTER_FEATURE_RICH_TEMPERATURE_THRESHOLD 
fffff806`b48a9c1f 83c90a          or      ecx,0Ah                               ;STOR_ADAPTER_FEATURE_STOP_UNIT_DURING_POWER_DOWN + STOR_ADAPTER_DMA_V3_PREFERRED 
fffff806`b48a9c22 c6879300000000  mov     byte ptr [rdi+93h],0                  ;WmiDataProvider == 0
fffff806`b48a9c29 410bce          or      ecx,r14d
fffff806`b48a9c2c 898fdc000000    mov     dword ptr [rdi+0DCh],ecx              ;FeatureSupport field
fffff806`b48a9c32 8b4334          mov     eax,dword ptr [rbx+34h]
fffff806`b48a9c35 a802            test    al,2
fffff806`b48a9c37 7509            jne     stornvme!NVMeHwFindAdapter+0x352 (fffff806`b48a9c42)  Branch

stornvme!NVMeHwFindAdapter+0x349:
fffff806`b48a9c39 83c904          or      ecx,4                                 ;STOR_ADAPTER_UNCACHED_EXTENSION_NUMA_NODE_PREFERRED
fffff806`b48a9c3c 898fdc000000    mov     dword ptr [rdi+0DCh],ecx

stornvme!NVMeHwFindAdapter+0x352:
fffff806`b48a9c42 4585e4          test    r12d,r12d
fffff806`b48a9c45 755e            jne     stornvme!NVMeHwFindAdapter+0x3b5 (fffff806`b48a9ca5)  Branch

stornvme!NVMeHwFindAdapter+0x357:
fffff806`b48a9c47 488bd7          mov     rdx,rdi
fffff806`b48a9c4a 488bcb          mov     rcx,rbx
fffff806`b48a9c4d e8eaf8ffff      call    stornvme!ControllerAllocateUncachedExtension (fffff806`b48a953c)
fffff806`b48a9c52 84c0            test    al,al
fffff806`b48a9c54 0f8431010000    je      stornvme!NVMeHwFindAdapter+0x49b (fffff806`b48a9d8b)  Branch

stornvme!NVMeHwFindAdapter+0x36a:
fffff806`b48a9c5a 44386310        cmp     byte ptr [rbx+10h],r12b
fffff806`b48a9c5e 7545            jne     stornvme!NVMeHwFindAdapter+0x3b5 (fffff806`b48a9ca5)  Branch

stornvme!NVMeHwFindAdapter+0x370:
fffff806`b48a9c60 448b436c        mov     r8d,dword ptr [rbx+6Ch]
fffff806`b48a9c64 4585c0          test    r8d,r8d
fffff806`b48a9c67 743c            je      stornvme!NVMeHwFindAdapter+0x3b5 (fffff806`b48a9ca5)  Branch

stornvme!NVMeHwFindAdapter+0x379:
fffff806`b48a9c69 488db3c80e0000  lea     rsi,[rbx+0EC8h]
fffff806`b48a9c70 41b94e766d65    mov     r9d,656D764Eh                 ; 'emvN' , POOL TAG
fffff806`b48a9c76 488bd3          mov     rdx,rbx
fffff806`b48a9c79 4889742420      mov     qword ptr [rsp+20h],rsi
fffff806`b48a9c7e 33c9            xor     ecx,ecx                       ;ExtFunctionAllocatePool == 0
fffff806`b48a9c80 48ff15a1530100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`b48bf028)]    ;StorPortAllocatePool()
fffff806`b48a9c87 0f1f440000      nop     dword ptr [rax+rax]
fffff806`b48a9c8c 85c0            test    eax,eax
fffff806`b48a9c8e 7510            jne     stornvme!NVMeHwFindAdapter+0x3b0 (fffff806`b48a9ca0)  Branch

stornvme!NVMeHwFindAdapter+0x3a0:
fffff806`b48a9c90 488b0e          mov     rcx,qword ptr [rsi]
fffff806`b48a9c93 4885c9          test    rcx,rcx
fffff806`b48a9c96 7408            je      stornvme!NVMeHwFindAdapter+0x3b0 (fffff806`b48a9ca0)  Branch

stornvme!NVMeHwFindAdapter+0x3a8:
fffff806`b48a9c98 8b536c          mov     edx,dword ptr [rbx+6Ch]
fffff806`b48a9c9b e8b0b2ffff      call    stornvme!NVMeZeroMemory (fffff806`b48a4f50)

stornvme!NVMeHwFindAdapter+0x3b0:
fffff806`b48a9ca0 be01000000      mov     esi,1

stornvme!NVMeHwFindAdapter+0x3b5:
fffff806`b48a9ca5 488bcb          mov     rcx,rbx
fffff806`b48a9ca8 e88f070000      call    stornvme!ControllerReset (fffff806`b48aa43c)
fffff806`b48a9cad 84c0            test    al,al
fffff806`b48a9caf 0f84d6000000    je      stornvme!NVMeHwFindAdapter+0x49b (fffff806`b48a9d8b)  Branch

stornvme!NVMeHwFindAdapter+0x3c5:
fffff806`b48a9cb5 408ad6          mov     dl,sil
fffff806`b48a9cb8 488bcb          mov     rcx,rbx
fffff806`b48a9cbb e8dc290000      call    stornvme!NVMeControllerInitPart1 (fffff806`b48ac69c)
fffff806`b48a9cc0 84c0            test    al,al
fffff806`b48a9cc2 0f84c3000000    je      stornvme!NVMeHwFindAdapter+0x49b (fffff806`b48a9d8b)  Branch

stornvme!NVMeHwFindAdapter+0x3d8:
fffff806`b48a9cc8 488b83f8050000  mov     rax,qword ptr [rbx+5F8h]
fffff806`b48a9ccf 448a404d        mov     r8b,byte ptr [rax+4Dh]
fffff806`b48a9cd3 4584c0          test    r8b,r8b
fffff806`b48a9cd6 7505            jne     stornvme!NVMeHwFindAdapter+0x3ed (fffff806`b48a9cdd)  Branch

stornvme!NVMeHwFindAdapter+0x3e8:
fffff806`b48a9cd8 83caff          or      edx,0FFFFFFFFh
fffff806`b48a9cdb eb19            jmp     stornvme!NVMeHwFindAdapter+0x406 (fffff806`b48a9cf6)  Branch

stornvme!NVMeHwFindAdapter+0x3ed:
fffff806`b48a9cdd 8a839e000000    mov     al,byte ptr [rbx+9Eh]             ;[rbx+9Eh] == 0
fffff806`b48a9ce3 8bd6            mov     edx,esi                           ;rsi==1
fffff806`b48a9ce5 240f            and     al,0Fh                            ;rax==ffffba01d9b5a000 => seems IdentifyCtrl returned page?  "....469F071A047000005409Patriot M.2 P300                        EDFM20.0..yd"
fffff806`b48a9ce7 8d480c          lea     ecx,[rax+0Ch]                     ;rcx=d9b5a00C => "047000005409Patriot M.2 P300                        EDFM20.0..yd"
fffff806`b48a9cea 8bc6            mov     eax,esi                           ;rax=1
fffff806`b48a9cec d3e2            shl     edx,cl                            ;edx==1, edx << 12 => 4096
fffff806`b48a9cee 418ac8          mov     cl,r8b                            ;r8b==0x06, rcx changed to d9b5a006
fffff806`b48a9cf1 d3e0            shl     eax,cl                            ;eax = eax << 6 == 64
fffff806`b48a9cf3 0fafd0          imul    edx,eax                           ;edx = 64*4096 = 262144

stornvme!NVMeHwFindAdapter+0x406:
fffff806`b48a9cf6 488bcb          mov     rcx,rbx
fffff806`b48a9cf9 8993a8000000    mov     dword ptr [rbx+0A8h],edx          ;262144
fffff806`b48a9cff e8ccb4ffff      call    stornvme!GetControllerMaxTransferSize (fffff806`b48a51d0) ;min(0x200000, [rbx+0A8h])
fffff806`b48a9d04 894718          mov     dword ptr [rdi+18h],eax               ;MaximumTransferLength = 0x40000 (262144) ??
fffff806`b48a9d07 c7471c01020000  mov     dword ptr [rdi+1Ch],201h              ;NumberOfPhysicalBreaks = 0x201 = 513 Pages
fffff806`b48a9d0e 40887748        mov     byte ptr [rdi+48h],sil                ;NumberOfBuses = 1
fffff806`b48a9d12 40887761        mov     byte ptr [rdi+61h],sil                ;MaximumNumberOfTargets = 1
fffff806`b48a9d16 c68792000000ff  mov     byte ptr [rdi+92h],0FFh               ;MaximumNumberOfLogicalUnits = 0xFF
fffff806`b48a9d1d 4489b7d4000000  mov     dword ptr [rdi+0D4h],r14d         ;InitialLunQueueDepth field
fffff806`b48a9d24 4489b7cc000000  mov     dword ptr [rdi+0CCh],r14d         ;MaxNumberOfIO field
fffff806`b48a9d2b 4489b7d0000000  mov     dword ptr [rdi+0D0h],r14d         ;BusResetHoldTime field
fffff806`b48a9d32 807b1000        cmp     byte ptr [rbx+10h],0              ;if(BusInterruptVector != 0) goto NVMeHwFindAdapter+0x495
fffff806`b48a9d36 754d            jne     stornvme!NVMeHwFindAdapter+0x495 (fffff806`b48a9d85)  Branch

stornvme!NVMeHwFindAdapter+0x448:
fffff806`b48a9d38 0f100561070100  movups  xmm0,xmmword ptr [stornvme!GUID_NVME_POWER_STATE_TRANSITION_LATENCY_TOLERANCE1 (fffff806`b48ba4a0)]
fffff806`b48a9d3f 41b804000000    mov     r8d,4
fffff806`b48a9d45 4c8d4da7        lea     r9,[rbp-59h]
fffff806`b48a9d49 0f100d40070100  movups  xmm1,xmmword ptr [stornvme!GUID_NVME_POWER_IDLE_TIMEOUT1 (fffff806`b48ba490)]
fffff806`b48a9d50 488bd3          mov     rdx,rbx
fffff806`b48a9d53 f30f7f45a7      movdqu  xmmword ptr [rbp-59h],xmm0
fffff806`b48a9d58 418d4816        lea     ecx,[r8+16h]
fffff806`b48a9d5c 0f10055d070100  movups  xmm0,xmmword ptr [stornvme!GUID_NVME_POWER_STATE_TRANSITION_LATENCY_TOLERANCE2 (fffff806`b48ba4c0)]
fffff806`b48a9d63 f30f7f4db7      movdqu  xmmword ptr [rbp-49h],xmm1
fffff806`b48a9d68 0f100d41070100  movups  xmm1,xmmword ptr [stornvme!GUID_NVME_POWER_IDLE_TIMEOUT2 (fffff806`b48ba4b0)]
fffff806`b48a9d6f f30f7f45c7      movdqu  xmmword ptr [rbp-39h],xmm0
fffff806`b48a9d74 f30f7f4dd7      movdqu  xmmword ptr [rbp-29h],xmm1
fffff806`b48a9d79 48ff15a8520100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`b48bf028)]
fffff806`b48a9d80 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeHwFindAdapter+0x495:
fffff806`b48a9d85 836314fd        and     dword ptr [rbx+14h],0FFFFFFFDh
fffff806`b48a9d89 eb17            jmp     stornvme!NVMeHwFindAdapter+0x4b2 (fffff806`b48a9da2)  Branch

stornvme!NVMeHwFindAdapter+0x49b:
fffff806`b48a9d8b be02000000      mov     esi,2

stornvme!NVMeHwFindAdapter+0x4a0:
fffff806`b48a9d90 488bcb          mov     rcx,rbx
fffff806`b48a9d93 eb08            jmp     stornvme!NVMeHwFindAdapter+0x4ad (fffff806`b48a9d9d)  Branch

stornvme!NVMeHwFindAdapter+0x4a5:
fffff806`b48a9d95 be03000000      mov     esi,3
fffff806`b48a9d9a 897318          mov     dword ptr [rbx+18h],esi

stornvme!NVMeHwFindAdapter+0x4ad:
fffff806`b48a9d9d e8befaffff      call    stornvme!NVMeControllerStartFailureEventLog (fffff806`b48a9860)

stornvme!NVMeHwFindAdapter+0x4b2:
fffff806`b48a9da2 8bc6            mov     eax,esi

stornvme!NVMeHwFindAdapter+0x4b4:
fffff806`b48a9da4 488b4d27        mov     rcx,qword ptr [rbp+27h]
fffff806`b48a9da8 4833cc          xor     rcx,rsp
fffff806`b48a9dab e8c0c2ffff      call    stornvme!_security_check_cookie (fffff806`b48a6070)
fffff806`b48a9db0 4c8d9c24c0000000 lea     r11,[rsp+0C0h]
fffff806`b48a9db8 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff806`b48a9dbc 498b7330        mov     rsi,qword ptr [r11+30h]
fffff806`b48a9dc0 498b7b38        mov     rdi,qword ptr [r11+38h]
fffff806`b48a9dc4 498be3          mov     rsp,r11
fffff806`b48a9dc7 415e            pop     r14
fffff806`b48a9dc9 415c            pop     r12
fffff806`b48a9dcb 5d              pop     rbp
fffff806`b48a9dcc c3              ret
