1: kd> uf storport!RaidAdapterStartDeviceIrp
storport!RaidAdapterStartDeviceIrp:
fffff80b`7ca1bdd8 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff80b`7ca1bddd 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff80b`7ca1bde2 56              push    rsi
fffff80b`7ca1bde3 57              push    rdi
fffff80b`7ca1bde4 4154            push    r12
fffff80b`7ca1bde6 4156            push    r14
fffff80b`7ca1bde8 4157            push    r15
fffff80b`7ca1bdea 4883ec60        sub     rsp,60h
fffff80b`7ca1bdee 488b059b540400  mov     rax,qword ptr [storport!_security_cookie (fffff80b`7ca61290)]
fffff80b`7ca1bdf5 4833c4          xor     rax,rsp
fffff80b`7ca1bdf8 4889442458      mov     qword ptr [rsp+58h],rax
fffff80b`7ca1bdfd 4c8bfa          mov     r15,rdx
fffff80b`7ca1be00 488bf9          mov     rdi,rcx   ;rcx == rdi == AdapterExt
fffff80b`7ca1be03 488b0df6510400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca1be0a 488d2def510400  lea     rbp,[storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca1be11 483bcd          cmp     rcx,rbp
fffff80b`7ca1be14 740b            je      storport!RaidAdapterStartDeviceIrp+0x49 (fffff80b`7ca1be21)  Branch

storport!RaidAdapterStartDeviceIrp+0x3e:
fffff80b`7ca1be16 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80b`7ca1be19 a802            test    al,2
fffff80b`7ca1be1b 0f85ef620100    jne     storport!RaidAdapterStartDeviceIrp+0x16338 (fffff80b`7ca32110)  Branch

storport!RaidAdapterStartDeviceIrp+0x49:
fffff80b`7ca1be21 8b5f58          mov     ebx,dword ptr [rdi+58h]
fffff80b`7ca1be24 c7475801000000  mov     dword ptr [rdi+58h],1
fffff80b`7ca1be2b 83fb02          cmp     ebx,2     ;if (AdapterExt->DeviceState != DeviceStateStopped) goto 0x16365
fffff80b`7ca1be2e 0f8509630100    jne     storport!RaidAdapterStartDeviceIrp+0x16365 (fffff80b`7ca3213d)  Branch

storport!RaidAdapterStartDeviceIrp+0x5c:
fffff80b`7ca1be34 498b87b8000000  mov     rax,qword ptr [r15+0B8h]  ;rax = IRP->Tail->Overlay->CurrentStackLocation
fffff80b`7ca1be3b 488d8f40010000  lea     rcx,[rdi+140h]            ;AdapterExt->Miniport->PortConfiguration
fffff80b`7ca1be42 448b8f0c030000  mov     r9d,dword ptr [rdi+30Ch]  ;AdapterExt->SlotNumber
fffff80b`7ca1be49 448b8708030000  mov     r8d,dword ptr [rdi+308h]  ;AdapterExt->BusNumber
fffff80b`7ca1be50 488b9720020000  mov     rdx,qword ptr [rdi+220h]  ;AdapterExt->Miniport->HwInitializeData
fffff80b`7ca1be57 4c8b7008        mov     r14,qword ptr [rax+8]     ;CurrentStackLocation->Parameters->StartDevice->AllocatedResources
fffff80b`7ca1be5b 4c8b6010        mov     r12,qword ptr [rax+10h]   ;CurrentStackLocation->Parameters->StartDevice->AllocatedResourcesTranslated
fffff80b`7ca1be5f 8a476e          mov     al,byte ptr [rdi+6Eh]
fffff80b`7ca1be62 d0e8            shr     al,1
fffff80b`7ca1be64 2401            and     al,1
fffff80b`7ca1be66 88442420        mov     byte ptr [rsp+20h],al     ;[rsp+20] = AdapterExt->Flags.AdapterInterfaceTypeInitialized
fffff80b`7ca1be6a e855040500      call    storport!RaInitializeConfiguration (fffff80b`7ca6c2c4)
fffff80b`7ca1be6f 8bf0            mov     esi,eax
fffff80b`7ca1be71 85c0            test    eax,eax
fffff80b`7ca1be73 0f8895010000    js      storport!RaidAdapterStartDeviceIrp+0x236 (fffff80b`7ca1c00e)  Branch

storport!RaidAdapterStartDeviceIrp+0xa1:
fffff80b`7ca1be79 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff80b`7ca1be7d 498bd7          mov     rdx,r15       ;朝 miniport 的 PDO 打一發 IRP (IRP_MJ_PNP + IRP_MN_START)
fffff80b`7ca1be80 e8fbafffff      call    storport!RaForwardIrpSynchronous (fffff80b`7ca16e80)
fffff80b`7ca1be85 8bf0            mov     esi,eax
fffff80b`7ca1be87 85c0            test    eax,eax
fffff80b`7ca1be89 0f887f010000    js      storport!RaidAdapterStartDeviceIrp+0x236 (fffff80b`7ca1c00e)  Branch

storport!RaidAdapterStartDeviceIrp+0xb7:
fffff80b`7ca1be8f 488baf20020000  mov     rbp,qword ptr [rdi+220h]
fffff80b`7ca1be96 4885ed          test    rbp,rbp
fffff80b`7ca1be99 0f84bb620100    je      storport!RaidAdapterStartDeviceIrp+0x16382 (fffff80b`7ca3215a)  Branch

storport!RaidAdapterStartDeviceIrp+0xc7:
fffff80b`7ca1be9f 4d8bc4          mov     r8,r12
fffff80b`7ca1bea2 498bd6          mov     rdx,r14
fffff80b`7ca1bea5 488bcf          mov     rcx,rdi
fffff80b`7ca1bea8 e81f020000      call    storport!RaidAdapterConfigureResources (fffff80b`7ca1c0cc)    ;prepare DPCs and other resources of Adapter.
fffff80b`7ca1bead 8bf0            mov     esi,eax
fffff80b`7ca1beaf 85c0            test    eax,eax
fffff80b`7ca1beb1 0f8884650100    js      storport!RaidAdapterStartDeviceIrp+0x16663 (fffff80b`7ca3243b)  Branch

storport!RaidAdapterStartDeviceIrp+0xdf:
fffff80b`7ca1beb7 83bf4801000005  cmp     dword ptr [rdi+148h],5
fffff80b`7ca1bebe be40000000      mov     esi,40h
fffff80b`7ca1bec3 7525            jne     storport!RaidAdapterStartDeviceIrp+0x112 (fffff80b`7ca1beea)  Branch

storport!RaidAdapterStartDeviceIrp+0xed:
fffff80b`7ca1bec5 488b87a8020000  mov     rax,qword ptr [rdi+2A8h]
fffff80b`7ca1becc 4c8d871c130000  lea     r8,[rdi+131Ch]
fffff80b`7ca1bed3 488b8f78020000  mov     rcx,qword ptr [rdi+278h]
fffff80b`7ca1beda 8d56c4          lea     edx,[rsi-3Ch]
fffff80b`7ca1bedd 4533c9          xor     r9d,r9d
fffff80b`7ca1bee0 89742420        mov     dword ptr [rsp+20h],esi
fffff80b`7ca1bee4 ff153eb90400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80b`7ca67828)]   ;call to PDO's GetBusData()

storport!RaidAdapterStartDeviceIrp+0x112:
fffff80b`7ca1beea 488d8f80080000  lea     rcx,[rdi+880h]    ;AdapterExt->RegistryInfo->SpinLock
fffff80b`7ca1bef1 89b768080000    mov     dword ptr [rdi+868h],esi  ;Set AdapterExt->RegistryInfo->Size = 40
fffff80b`7ca1bef7 48ff1522b20400  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff80b`7ca67120)]
fffff80b`7ca1befe 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1bf03 488d8770080000  lea     rax,[rdi+870h]    ;rax = AdapterExt->RegistryInfo->ListEntry
fffff80b`7ca1bf0a 41bc01000000    mov     r12d,1
fffff80b`7ca1bf10 48894008        mov     qword ptr [rax+8],rax
fffff80b`7ca1bf14 4c8db7a0150000  lea     r14,[rdi+15A0h]   ;AdapterExt->D3ColdInterface
fffff80b`7ca1bf1b 488900          mov     qword ptr [rax],rax
fffff80b`7ca1bf1e 498bd6          mov     rdx,r14
fffff80b`7ca1bf21 4883a78808000000 and     qword ptr [rdi+888h],0   ;
fffff80b`7ca1bf29 4489a7a0080000  mov     dword ptr [rdi+8A0h],r12d
fffff80b`7ca1bf30 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80b`7ca1bf34 e8771b0000      call    storport!RaidGetD3ColdInterface (fffff80b`7ca1dab0)
fffff80b`7ca1bf39 488bd5          mov     rdx,rbp
fffff80b`7ca1bf3c 488bcf          mov     rcx,rdi
fffff80b`7ca1bf3f e8b8390000      call    storport!RaidAdapterStartMiniport (fffff80b`7ca1f8fc)
fffff80b`7ca1bf44 8bf0            mov     esi,eax
fffff80b`7ca1bf46 85c0            test    eax,eax
fffff80b`7ca1bf48 0f88ed640100    js      storport!RaidAdapterStartDeviceIrp+0x16663 (fffff80b`7ca3243b)  Branch

storport!RaidAdapterStartDeviceIrp+0x176:
fffff80b`7ca1bf4e 83fb08          cmp     ebx,8
fffff80b`7ca1bf51 0f84be640100    je      storport!RaidAdapterStartDeviceIrp+0x1663d (fffff80b`7ca32415)  Branch

storport!RaidAdapterStartDeviceIrp+0x17f:
fffff80b`7ca1bf57 498b0e          mov     rcx,qword ptr [r14]
fffff80b`7ca1bf5a 4885c9          test    rcx,rcx
fffff80b`7ca1bf5d 743e            je      storport!RaidAdapterStartDeviceIrp+0x1c5 (fffff80b`7ca1bf9d)  Branch

storport!RaidAdapterStartDeviceIrp+0x187:
fffff80b`7ca1bf5f 4883bf2014000000 cmp     qword ptr [rdi+1420h],0
fffff80b`7ca1bf67 7434            je      storport!RaidAdapterStartDeviceIrp+0x1c5 (fffff80b`7ca1bf9d)  Branch

storport!RaidAdapterStartDeviceIrp+0x191:
fffff80b`7ca1bf69 8364244000      and     dword ptr [rsp+40h],0
fffff80b`7ca1bf6e 488b4128        mov     rax,qword ptr [rcx+28h]
fffff80b`7ca1bf72 4885c0          test    rax,rax
fffff80b`7ca1bf75 7426            je      storport!RaidAdapterStartDeviceIrp+0x1c5 (fffff80b`7ca1bf9d)  Branch

storport!RaidAdapterStartDeviceIrp+0x19f:
fffff80b`7ca1bf77 488b4908        mov     rcx,qword ptr [rcx+8]
fffff80b`7ca1bf7b 4c8d442440      lea     r8,[rsp+40h]
fffff80b`7ca1bf80 418bd4          mov     edx,r12d
fffff80b`7ca1bf83 ff159fb80400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80b`7ca67828)]
fffff80b`7ca1bf89 85c0            test    eax,eax
fffff80b`7ca1bf8b 7810            js      storport!RaidAdapterStartDeviceIrp+0x1c5 (fffff80b`7ca1bf9d)  Branch

storport!RaidAdapterStartDeviceIrp+0x1b5:
fffff80b`7ca1bf8d 8b442440        mov     eax,dword ptr [rsp+40h]
fffff80b`7ca1bf91 83c0fc          add     eax,0FFFFFFFCh
fffff80b`7ca1bf94 413bc4          cmp     eax,r12d
fffff80b`7ca1bf97 0f86c7610100    jbe     storport!RaidAdapterStartDeviceIrp+0x1638c (fffff80b`7ca32164)  Branch

storport!RaidAdapterStartDeviceIrp+0x1c5:
fffff80b`7ca1bf9d 488bcf          mov     rcx,rdi
fffff80b`7ca1bfa0 e827300000      call    storport!RaidAdapterCompleteInitialization (fffff80b`7ca1efcc)
fffff80b`7ca1bfa5 8bf0            mov     esi,eax
fffff80b`7ca1bfa7 85c0            test    eax,eax
fffff80b`7ca1bfa9 0f888c640100    js      storport!RaidAdapterStartDeviceIrp+0x16663 (fffff80b`7ca3243b)  Branch

storport!RaidAdapterStartDeviceIrp+0x1d7:
fffff80b`7ca1bfaf 803dda58040000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80b`7ca61890)],0
fffff80b`7ca1bfb6 7410            je      storport!RaidAdapterStartDeviceIrp+0x1f0 (fffff80b`7ca1bfc8)  Branch

storport!RaidAdapterStartDeviceIrp+0x1e0:
fffff80b`7ca1bfb8 4c8b8f20140000  mov     r9,qword ptr [rdi+1420h]
fffff80b`7ca1bfbf 4d85c9          test    r9,r9
fffff80b`7ca1bfc2 0f85bd000000    jne     storport!RaidAdapterStartDeviceIrp+0x2ad (fffff80b`7ca1c085)  Branch

storport!RaidAdapterStartDeviceIrp+0x1f0:
fffff80b`7ca1bfc8 488bcf          mov     rcx,rdi
fffff80b`7ca1bfcb e870fdffff      call    storport!RaidAdapterInitializeWmi (fffff80b`7ca1bd40)
fffff80b`7ca1bfd0 488bcf          mov     rcx,rdi
fffff80b`7ca1bfd3 e854090000      call    storport!RaidAdapterRegisterDeviceInterface (fffff80b`7ca1c92c)
fffff80b`7ca1bfd8 83bf5016000000  cmp     dword ptr [rdi+1650h],0
fffff80b`7ca1bfdf 0f87fa610100    ja      storport!RaidAdapterStartDeviceIrp+0x16407 (fffff80b`7ca321df)  Branch

storport!RaidAdapterStartDeviceIrp+0x20d:
fffff80b`7ca1bfe5 44382586580400  cmp     byte ptr [storport!IsSystemAoAC (fffff80b`7ca61872)],r12b
fffff80b`7ca1bfec 0f8448620100    je      storport!RaidAdapterStartDeviceIrp+0x16462 (fffff80b`7ca3223a)  Branch

storport!RaidAdapterStartDeviceIrp+0x21a:
fffff80b`7ca1bff2 488d2d07500400  lea     rbp,[storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]

storport!RaidAdapterStartDeviceIrp+0x221:
fffff80b`7ca1bff9 ba0e000000      mov     edx,0Eh
fffff80b`7ca1bffe 488bcf          mov     rcx,rdi
fffff80b`7ca1c001 e8caaeffff      call    storport!RaidIsAdapterControlSupported (fffff80b`7ca16ed0)
fffff80b`7ca1c006 85c0            test    eax,eax
fffff80b`7ca1c008 0f8590630100    jne     storport!RaidAdapterStartDeviceIrp+0x165c6 (fffff80b`7ca3239e)  Branch

storport!RaidAdapterStartDeviceIrp+0x236:
fffff80b`7ca1c00e 488b8720140000  mov     rax,qword ptr [rdi+1420h]
fffff80b`7ca1c015 4885c0          test    rax,rax
fffff80b`7ca1c018 0f8591000000    jne     storport!RaidAdapterStartDeviceIrp+0x2d7 (fffff80b`7ca1c0af)  Branch

storport!RaidAdapterStartDeviceIrp+0x246:
fffff80b`7ca1c01e 83a7b816000000  and     dword ptr [rdi+16B8h],0
fffff80b`7ca1c025 83a7bc16000000  and     dword ptr [rdi+16BCh],0
fffff80b`7ca1c02c 83a7c016000000  and     dword ptr [rdi+16C0h],0
fffff80b`7ca1c033 85f6            test    esi,esi
fffff80b`7ca1c035 0f8829640100    js      storport!RaidAdapterStartDeviceIrp+0x1668c (fffff80b`7ca32464)  Branch

storport!RaidAdapterStartDeviceIrp+0x263:
fffff80b`7ca1c03b 488b0dbe4f0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca1c042 483bcd          cmp     rcx,rbp
fffff80b`7ca1c045 740b            je      storport!RaidAdapterStartDeviceIrp+0x27a (fffff80b`7ca1c052)  Branch

storport!RaidAdapterStartDeviceIrp+0x26f:
fffff80b`7ca1c047 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80b`7ca1c04a a802            test    al,2
fffff80b`7ca1c04c 0f851e640100    jne     storport!RaidAdapterStartDeviceIrp+0x16698 (fffff80b`7ca32470)  Branch

storport!RaidAdapterStartDeviceIrp+0x27a:
fffff80b`7ca1c052 448bc6          mov     r8d,esi

storport!RaidAdapterStartDeviceIrp+0x27d:
fffff80b`7ca1c055 33d2            xor     edx,edx
fffff80b`7ca1c057 498bcf          mov     rcx,r15
fffff80b`7ca1c05a e8410effff      call    storport!RaidCompleteRequestEx (fffff80b`7ca0cea0)
fffff80b`7ca1c05f 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff80b`7ca1c064 4833cc          xor     rcx,rsp
fffff80b`7ca1c067 e8e49f0000      call    storport!_security_check_cookie (fffff80b`7ca26050)
fffff80b`7ca1c06c 4c8d5c2460      lea     r11,[rsp+60h]
fffff80b`7ca1c071 498b5b40        mov     rbx,qword ptr [r11+40h]
fffff80b`7ca1c075 498b6b48        mov     rbp,qword ptr [r11+48h]
fffff80b`7ca1c079 498be3          mov     rsp,r11
fffff80b`7ca1c07c 415f            pop     r15
fffff80b`7ca1c07e 415e            pop     r14
fffff80b`7ca1c080 415c            pop     r12
fffff80b`7ca1c082 5f              pop     rdi
fffff80b`7ca1c083 5e              pop     rsi
fffff80b`7ca1c084 c3              ret

storport!RaidAdapterStartDeviceIrp+0x2ad:
fffff80b`7ca1c085 498b4108        mov     rax,qword ptr [r9+8]
fffff80b`7ca1c089 8b08            mov     ecx,dword ptr [rax]
fffff80b`7ca1c08b 413bcc          cmp     ecx,r12d
fffff80b`7ca1c08e 742f            je      storport!RaidAdapterStartDeviceIrp+0x2e7 (fffff80b`7ca1c0bf)  Branch

storport!RaidAdapterStartDeviceIrp+0x2b8:
fffff80b`7ca1c090 488d5020        lea     rdx,[rax+20h]
fffff80b`7ca1c094 83f902          cmp     ecx,2
fffff80b`7ca1c097 0f85fc600100    jne     storport!RaidAdapterStartDeviceIrp+0x163c1 (fffff80b`7ca32199)  Branch

storport!RaidAdapterStartDeviceIrp+0x2c5:
fffff80b`7ca1c09d f6053e57040010  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff80b`7ca617e2)],10h
fffff80b`7ca1c0a4 0f841effffff    je      storport!RaidAdapterStartDeviceIrp+0x1f0 (fffff80b`7ca1bfc8)  Branch

storport!RaidAdapterStartDeviceIrp+0x2d2:
fffff80b`7ca1c0aa e9fd600100      jmp     storport!RaidAdapterStartDeviceIrp+0x163d4 (fffff80b`7ca321ac)  Branch

storport!RaidAdapterStartDeviceIrp+0x2d7:
fffff80b`7ca1c0af 8b4014          mov     eax,dword ptr [rax+14h]
fffff80b`7ca1c0b2 a804            test    al,4
fffff80b`7ca1c0b4 0f8464ffffff    je      storport!RaidAdapterStartDeviceIrp+0x246 (fffff80b`7ca1c01e)  Branch

storport!RaidAdapterStartDeviceIrp+0x2e2:
fffff80b`7ca1c0ba e988630100      jmp     storport!RaidAdapterStartDeviceIrp+0x1666f (fffff80b`7ca32447)  Branch

storport!RaidAdapterStartDeviceIrp+0x2e7:
fffff80b`7ca1c0bf 488d5018        lea     rdx,[rax+18h]
fffff80b`7ca1c0c3 ebd8            jmp     storport!RaidAdapterStartDeviceIrp+0x2c5 (fffff80b`7ca1c09d)  Branch

storport!RaidAdapterStartDeviceIrp+0x16338:
fffff80b`7ca32110 80792904        cmp     byte ptr [rcx+29h],4
fffff80b`7ca32114 0f82079dfeff    jb      storport!RaidAdapterStartDeviceIrp+0x49 (fffff80b`7ca1be21)  Branch

storport!RaidAdapterStartDeviceIrp+0x16342:
fffff80b`7ca3211a 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80b`7ca3211e 4c8d0503380200  lea     r8,[storport!WPP_d22b89442b9e367d913ef9c1639baccc_Traceguids (fffff80b`7ca55928)]
fffff80b`7ca32125 ba10000000      mov     edx,10h
fffff80b`7ca3212a 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff80b`7ca3212f 4c8bcf          mov     r9,rdi
fffff80b`7ca32132 e8c19a0000      call    storport!WPP_SF_qq (fffff80b`7ca3bbf8)
fffff80b`7ca32137 90              nop
fffff80b`7ca32138 e9e49cfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x49 (fffff80b`7ca1be21)  Branch

storport!RaidAdapterStartDeviceIrp+0x16365:
fffff80b`7ca3213d 83fb08          cmp     ebx,8
fffff80b`7ca32140 0f84ee9cfeff    je      storport!RaidAdapterStartDeviceIrp+0x5c (fffff80b`7ca1be34)  Branch

storport!RaidAdapterStartDeviceIrp+0x1636e:
fffff80b`7ca32146 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff80b`7ca3214a 498bd7          mov     rdx,r15
fffff80b`7ca3214d e82e4dfeff      call    storport!RaForwardIrpSynchronous (fffff80b`7ca16e80)
fffff80b`7ca32152 448bc0          mov     r8d,eax
fffff80b`7ca32155 e9fb9efeff      jmp     storport!RaidAdapterStartDeviceIrp+0x27d (fffff80b`7ca1c055)  Branch

storport!RaidAdapterStartDeviceIrp+0x16382:
fffff80b`7ca3215a be0e0000c0      mov     esi,0C000000Eh
fffff80b`7ca3215f e9d7020000      jmp     storport!RaidAdapterStartDeviceIrp+0x16663 (fffff80b`7ca3243b)  Branch

storport!RaidAdapterStartDeviceIrp+0x1638c:
fffff80b`7ca32164 488b8720140000  mov     rax,qword ptr [rdi+1420h]
fffff80b`7ca3216b 83481440        or      dword ptr [rax+14h],40h
fffff80b`7ca3216f 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80b`7ca32173 48ff15ae4e0300  call    qword ptr [storport!_imp_IoAllocateWorkItem (fffff80b`7ca67028)]
fffff80b`7ca3217a 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca3217f 488987d0160000  mov     qword ptr [rdi+16D0h],rax
fffff80b`7ca32186 4885c0          test    rax,rax
fffff80b`7ca32189 0f850e9efeff    jne     storport!RaidAdapterStartDeviceIrp+0x1c5 (fffff80b`7ca1bf9d)  Branch

storport!RaidAdapterStartDeviceIrp+0x163b7:
fffff80b`7ca3218f be9a0000c0      mov     esi,0C000009Ah
fffff80b`7ca32194 e9a2020000      jmp     storport!RaidAdapterStartDeviceIrp+0x16663 (fffff80b`7ca3243b)  Branch

storport!RaidAdapterStartDeviceIrp+0x163c1:
fffff80b`7ca32199 83f903          cmp     ecx,3
fffff80b`7ca3219c 0f84fb9efeff    je      storport!RaidAdapterStartDeviceIrp+0x2c5 (fffff80b`7ca1c09d)  Branch

storport!RaidAdapterStartDeviceIrp+0x163ca:
fffff80b`7ca321a2 ba08000000      mov     edx,8
fffff80b`7ca321a7 e9f19efeff      jmp     storport!RaidAdapterStartDeviceIrp+0x2c5 (fffff80b`7ca1c09d)  Branch

storport!RaidAdapterStartDeviceIrp+0x163d4:
fffff80b`7ca321ac 8b02            mov     eax,dword ptr [rdx]
fffff80b`7ca321ae 0fb64f6c        movzx   ecx,byte ptr [rdi+6Ch]
fffff80b`7ca321b2 4d8b09          mov     r9,qword ptr [r9]
fffff80b`7ca321b5 89442438        mov     dword ptr [rsp+38h],eax
fffff80b`7ca321b9 8b8730140000    mov     eax,dword ptr [rdi+1430h]
fffff80b`7ca321bf 89442430        mov     dword ptr [rsp+30h],eax
fffff80b`7ca321c3 8b4738          mov     eax,dword ptr [rdi+38h]
fffff80b`7ca321c6 c1e903          shr     ecx,3
fffff80b`7ca321c9 4123cc          and     ecx,r12d
fffff80b`7ca321cc 894c2428        mov     dword ptr [rsp+28h],ecx
fffff80b`7ca321d0 89442420        mov     dword ptr [rsp+20h],eax
fffff80b`7ca321d4 e8df460000      call    storport!McTemplateK0pqtqq (fffff80b`7ca368b8)
fffff80b`7ca321d9 90              nop
fffff80b`7ca321da e9e99dfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x1f0 (fffff80b`7ca1bfc8)  Branch

storport!RaidAdapterStartDeviceIrp+0x16407:
fffff80b`7ca321df 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff80b`7ca321e3 488d9f40160000  lea     rbx,[rdi+1640h]
fffff80b`7ca321ea 4c8bcb          mov     r9,rbx
fffff80b`7ca321ed 488d155c850200  lea     rdx,[storport!GUID_DEVINTERFACE_UNIFIED_ACCESS_RPMB (fffff80b`7ca5a750)]
fffff80b`7ca321f4 4533c0          xor     r8d,r8d
fffff80b`7ca321f7 48ff15ba510300  call    qword ptr [storport!_imp_IoRegisterDeviceInterface (fffff80b`7ca673b8)]
fffff80b`7ca321fe 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca32203 85c0            test    eax,eax
fffff80b`7ca32205 0f88da9dfeff    js      storport!RaidAdapterStartDeviceIrp+0x20d (fffff80b`7ca1bfe5)  Branch

storport!RaidAdapterStartDeviceIrp+0x16433:
fffff80b`7ca3220b 418ad4          mov     dl,r12b
fffff80b`7ca3220e 488bcb          mov     rcx,rbx
fffff80b`7ca32211 48ff15704e0300  call    qword ptr [storport!_imp_IoSetDeviceInterfaceState (fffff80b`7ca67088)]
fffff80b`7ca32218 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca3221d 85c0            test    eax,eax
fffff80b`7ca3221f 0f89c09dfeff    jns     storport!RaidAdapterStartDeviceIrp+0x20d (fffff80b`7ca1bfe5)  Branch

storport!RaidAdapterStartDeviceIrp+0x1644d:
fffff80b`7ca32225 488bcb          mov     rcx,rbx
fffff80b`7ca32228 48ff15a94e0300  call    qword ptr [storport!_imp_RtlFreeUnicodeString (fffff80b`7ca670d8)]
fffff80b`7ca3222f 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca32234 90              nop
fffff80b`7ca32235 e9ab9dfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x20d (fffff80b`7ca1bfe5)  Branch

storport!RaidAdapterStartDeviceIrp+0x16462:
fffff80b`7ca3223a bd0c000000      mov     ebp,0Ch
fffff80b`7ca3223f 488bcf          mov     rcx,rdi
fffff80b`7ca32242 8bd5            mov     edx,ebp
fffff80b`7ca32244 e8874cfeff      call    storport!RaidIsAdapterControlSupported (fffff80b`7ca16ed0)
fffff80b`7ca32249 85c0            test    eax,eax
fffff80b`7ca3224b 0f84a19dfeff    je      storport!RaidAdapterStartDeviceIrp+0x21a (fffff80b`7ca1bff2)  Branch

storport!RaidAdapterStartDeviceIrp+0x16479:
fffff80b`7ca32251 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80b`7ca32255 488d9f28140000  lea     rbx,[rdi+1428h]
fffff80b`7ca3225c 4c8bcf          mov     r9,rdi
fffff80b`7ca3225f 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff80b`7ca32264 4c8d05b5d5feff  lea     r8,[storport!RaidPowerSettingCallback (fffff80b`7ca1f820)]
fffff80b`7ca3226b 488d1526310200  lea     rdx,[storport!GUID_LOW_POWER_EPOCH (fffff80b`7ca55398)]
fffff80b`7ca32272 48ff151f4e0300  call    qword ptr [storport!_imp_PoRegisterPowerSettingCallback (fffff80b`7ca67098)]
fffff80b`7ca32279 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca3227e 448bc0          mov     r8d,eax
fffff80b`7ca32281 85c0            test    eax,eax
fffff80b`7ca32283 0f88f3000000    js      storport!RaidAdapterStartDeviceIrp+0x165a4 (fffff80b`7ca3237c)  Branch

storport!RaidAdapterStartDeviceIrp+0x164b1:
fffff80b`7ca32289 4c8db738140000  lea     r14,[rdi+1438h]
fffff80b`7ca32290 4c8bcf          mov     r9,rdi
fffff80b`7ca32293 4d8bc6          mov     r8,r14
fffff80b`7ca32296 488d0d93820000  lea     rcx,[storport!RaidCoalescingCallback (fffff80b`7ca3a530)]
fffff80b`7ca3229d 418ad4          mov     dl,r12b
fffff80b`7ca322a0 48ff15d94f0300  call    qword ptr [storport!_imp_PoRegisterCoalescingCallback (fffff80b`7ca67280)]
fffff80b`7ca322a7 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca322ac 8bf0            mov     esi,eax
fffff80b`7ca322ae 85c0            test    eax,eax
fffff80b`7ca322b0 7851            js      storport!RaidAdapterStartDeviceIrp+0x1652b (fffff80b`7ca32303)  Branch

storport!RaidAdapterStartDeviceIrp+0x164da:
fffff80b`7ca322b2 80676c7f        and     byte ptr [rdi+6Ch],7Fh
fffff80b`7ca322b6 33c0            xor     eax,eax
fffff80b`7ca322b8 80676dfe        and     byte ptr [rdi+6Dh],0FEh
fffff80b`7ca322bc 488bcf          mov     rcx,rdi
fffff80b`7ca322bf 4889442448      mov     qword ptr [rsp+48h],rax
fffff80b`7ca322c4 4489642448      mov     dword ptr [rsp+48h],r12d
fffff80b`7ca322c9 c744244c10000000 mov     dword ptr [rsp+4Ch],10h
fffff80b`7ca322d1 4889442450      mov     qword ptr [rsp+50h],rax
fffff80b`7ca322d6 e83d5c0000      call    storport!RaidAdapterGetSystemPowerHint (fffff80b`7ca37f18)
fffff80b`7ca322db 8bc8            mov     ecx,eax
fffff80b`7ca322dd 89442450        mov     dword ptr [rsp+50h],eax
fffff80b`7ca322e1 e8525c0000      call    storport!RaidAdapterGetSystemPowerResumeLatency (fffff80b`7ca37f38)
fffff80b`7ca322e6 488d8f38010000  lea     rcx,[rdi+138h]
fffff80b`7ca322ed 89442454        mov     dword ptr [rsp+54h],eax
fffff80b`7ca322f1 4c8d442448      lea     r8,[rsp+48h]
fffff80b`7ca322f6 8bd5            mov     edx,ebp
fffff80b`7ca322f8 e8cb49feff      call    storport!RaCallMiniportAdapterControl (fffff80b`7ca16cc8)
fffff80b`7ca322fd 90              nop
fffff80b`7ca322fe e9ef9cfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x21a (fffff80b`7ca1bff2)  Branch

storport!RaidAdapterStartDeviceIrp+0x1652b:
fffff80b`7ca32303 488b0df6ec0200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca3230a 488d2defec0200  lea     rbp,[storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca32311 483bcd          cmp     rcx,rbp
fffff80b`7ca32314 7429            je      storport!RaidAdapterStartDeviceIrp+0x16567 (fffff80b`7ca3233f)  Branch

storport!RaidAdapterStartDeviceIrp+0x1653e:
fffff80b`7ca32316 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80b`7ca32319 a802            test    al,2
fffff80b`7ca3231b 7422            je      storport!RaidAdapterStartDeviceIrp+0x16567 (fffff80b`7ca3233f)  Branch

storport!RaidAdapterStartDeviceIrp+0x16545:
fffff80b`7ca3231d 80792904        cmp     byte ptr [rcx+29h],4
fffff80b`7ca32321 721c            jb      storport!RaidAdapterStartDeviceIrp+0x16567 (fffff80b`7ca3233f)  Branch

storport!RaidAdapterStartDeviceIrp+0x1654b:
fffff80b`7ca32323 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80b`7ca32327 4c8d05fa350200  lea     r8,[storport!WPP_d22b89442b9e367d913ef9c1639baccc_Traceguids (fffff80b`7ca55928)]
fffff80b`7ca3232e ba11000000      mov     edx,11h
fffff80b`7ca32333 89742420        mov     dword ptr [rsp+20h],esi
fffff80b`7ca32337 4c8bcf          mov     r9,rdi
fffff80b`7ca3233a e895970000      call    storport!WPP_SF_qD (fffff80b`7ca3bad4)

storport!RaidAdapterStartDeviceIrp+0x16567:
fffff80b`7ca3233f 49832600        and     qword ptr [r14],0
fffff80b`7ca32343 488b0b          mov     rcx,qword ptr [rbx]
fffff80b`7ca32346 48ff152b4e0300  call    qword ptr [storport!_imp_PoUnregisterPowerSettingCallback (fffff80b`7ca67178)]
fffff80b`7ca3234d 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca32352 eb1d            jmp     storport!RaidAdapterStartDeviceIrp+0x16599 (fffff80b`7ca32371)  Branch

storport!RaidAdapterStartDeviceIrp+0x1657c:
fffff80b`7ca32354 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80b`7ca32358 ba12000000      mov     edx,12h
fffff80b`7ca3235d 4489442420      mov     dword ptr [rsp+20h],r8d
fffff80b`7ca32362 4c8bcf          mov     r9,rdi
fffff80b`7ca32365 4c8d05bc350200  lea     r8,[storport!WPP_d22b89442b9e367d913ef9c1639baccc_Traceguids (fffff80b`7ca55928)]
fffff80b`7ca3236c e863970000      call    storport!WPP_SF_qD (fffff80b`7ca3bad4)

storport!RaidAdapterStartDeviceIrp+0x16599:
fffff80b`7ca32371 48832300        and     qword ptr [rbx],0
fffff80b`7ca32375 33f6            xor     esi,esi
fffff80b`7ca32377 e97d9cfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x221 (fffff80b`7ca1bff9)  Branch

storport!RaidAdapterStartDeviceIrp+0x165a4:
fffff80b`7ca3237c 488b0d7dec0200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca32383 488d2d76ec0200  lea     rbp,[storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca3238a 483bcd          cmp     rcx,rbp
fffff80b`7ca3238d 74e2            je      storport!RaidAdapterStartDeviceIrp+0x16599 (fffff80b`7ca32371)  Branch

storport!RaidAdapterStartDeviceIrp+0x165b7:
fffff80b`7ca3238f 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80b`7ca32392 a802            test    al,2
fffff80b`7ca32394 74db            je      storport!RaidAdapterStartDeviceIrp+0x16599 (fffff80b`7ca32371)  Branch

storport!RaidAdapterStartDeviceIrp+0x165be:
fffff80b`7ca32396 80792904        cmp     byte ptr [rcx+29h],4
fffff80b`7ca3239a 72d5            jb      storport!RaidAdapterStartDeviceIrp+0x16599 (fffff80b`7ca32371)  Branch

storport!RaidAdapterStartDeviceIrp+0x165c4:
fffff80b`7ca3239c ebb6            jmp     storport!RaidAdapterStartDeviceIrp+0x1657c (fffff80b`7ca32354)  Branch

storport!RaidAdapterStartDeviceIrp+0x165c6:
fffff80b`7ca3239e 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80b`7ca323a2 488d8740140000  lea     rax,[rdi+1440h]
fffff80b`7ca323a9 4c8bcf          mov     r9,rdi
fffff80b`7ca323ac 4889442420      mov     qword ptr [rsp+20h],rax
fffff80b`7ca323b1 4c8d0568d4feff  lea     r8,[storport!RaidPowerSettingCallback (fffff80b`7ca1f820)]
fffff80b`7ca323b8 488d15c92f0200  lea     rdx,[storport!GUID_DISK_MAX_POWER (fffff80b`7ca55388)]
fffff80b`7ca323bf 48ff15d24c0300  call    qword ptr [storport!_imp_PoRegisterPowerSettingCallback (fffff80b`7ca67098)]
fffff80b`7ca323c6 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca323cb 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff80b`7ca323cf 488d9f48140000  lea     rbx,[rdi+1448h]
fffff80b`7ca323d6 4c8bcb          mov     r9,rbx
fffff80b`7ca323d9 488d15e8800200  lea     rdx,[storport!GUID_DEVINTERFACE_THERMAL_COOLING (fffff80b`7ca5a4c8)]
fffff80b`7ca323e0 4533c0          xor     r8d,r8d
fffff80b`7ca323e3 48ff15ce4f0300  call    qword ptr [storport!_imp_IoRegisterDeviceInterface (fffff80b`7ca673b8)]
fffff80b`7ca323ea 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca323ef 8bf0            mov     esi,eax
fffff80b`7ca323f1 85c0            test    eax,eax
fffff80b`7ca323f3 0f88159cfeff    js      storport!RaidAdapterStartDeviceIrp+0x236 (fffff80b`7ca1c00e)  Branch

storport!RaidAdapterStartDeviceIrp+0x16621:
fffff80b`7ca323f9 804f6d08        or      byte ptr [rdi+6Dh],8
fffff80b`7ca323fd 418ad4          mov     dl,r12b
fffff80b`7ca32400 488bcb          mov     rcx,rbx
fffff80b`7ca32403 48ff157e4c0300  call    qword ptr [storport!_imp_IoSetDeviceInterfaceState (fffff80b`7ca67088)]
fffff80b`7ca3240a 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca3240f 90              nop
fffff80b`7ca32410 e9f99bfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x236 (fffff80b`7ca1c00e)  Branch

storport!RaidAdapterStartDeviceIrp+0x1663d:
fffff80b`7ca32415 b102            mov     cl,2
fffff80b`7ca32417 48ff15324e0300  call    qword ptr [storport!_imp_KfRaiseIrql (fffff80b`7ca67250)]
fffff80b`7ca3241e 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca32423 488bcf          mov     rcx,rdi
fffff80b`7ca32426 8ad8            mov     bl,al
fffff80b`7ca32428 e80b900000      call    storport!RaidResumeAndRestartAdapterQueues (fffff80b`7ca3b438)
fffff80b`7ca3242d 8acb            mov     cl,bl
fffff80b`7ca3242f 48ff156a4d0300  call    qword ptr [storport!_imp_KeLowerIrql (fffff80b`7ca671a0)]
fffff80b`7ca32436 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterStartDeviceIrp+0x16663:
fffff80b`7ca3243b 488d2dbeeb0200  lea     rbp,[storport!WPP_GLOBAL_Control (fffff80b`7ca61000)]
fffff80b`7ca32442 e9c79bfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x236 (fffff80b`7ca1c00e)  Branch

storport!RaidAdapterStartDeviceIrp+0x1666f:
fffff80b`7ca32447 4533c0          xor     r8d,r8d
fffff80b`7ca3244a 33d2            xor     edx,edx
fffff80b`7ca3244c 488bcf          mov     rcx,rdi
fffff80b`7ca3244f e818fffeff      call    storport!RaidAdapterPoFxIdleComponent (fffff80b`7ca2236c)
fffff80b`7ca32454 488b8720140000  mov     rax,qword ptr [rdi+1420h]
fffff80b`7ca3245b 836014fb        and     dword ptr [rax+14h],0FFFFFFFBh
fffff80b`7ca3245f e9ba9bfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x246 (fffff80b`7ca1c01e)  Branch

storport!RaidAdapterStartDeviceIrp+0x1668c:
fffff80b`7ca32464 c7475802000000  mov     dword ptr [rdi+58h],2
fffff80b`7ca3246b e9cb9bfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x263 (fffff80b`7ca1c03b)  Branch

storport!RaidAdapterStartDeviceIrp+0x16698:
fffff80b`7ca32470 80792904        cmp     byte ptr [rcx+29h],4
fffff80b`7ca32474 0f82d89bfeff    jb      storport!RaidAdapterStartDeviceIrp+0x27a (fffff80b`7ca1c052)  Branch

storport!RaidAdapterStartDeviceIrp+0x166a2:
fffff80b`7ca3247a 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80b`7ca3247e 4c8d05a3340200  lea     r8,[storport!WPP_d22b89442b9e367d913ef9c1639baccc_Traceguids (fffff80b`7ca55928)]
fffff80b`7ca32485 ba13000000      mov     edx,13h
fffff80b`7ca3248a 89742428        mov     dword ptr [rsp+28h],esi
fffff80b`7ca3248e 4c8bcf          mov     r9,rdi
fffff80b`7ca32491 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff80b`7ca32496 e8ad970000      call    storport!WPP_SF_qqD (fffff80b`7ca3bc48)
fffff80b`7ca3249b 90              nop
fffff80b`7ca3249c e9b19bfeff      jmp     storport!RaidAdapterStartDeviceIrp+0x27a (fffff80b`7ca1c052)  Branch
