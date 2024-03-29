10: kd> uf storport!RaidInitializeAdapter
storport!RaidInitializeAdapter:
fffff80f`2d32d2e8 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff80f`2d32d2ed 55              push    rbp
fffff80f`2d32d2ee 56              push    rsi
fffff80f`2d32d2ef 57              push    rdi
fffff80f`2d32d2f0 4154            push    r12
fffff80f`2d32d2f2 4155            push    r13
fffff80f`2d32d2f4 4156            push    r14
fffff80f`2d32d2f6 4157            push    r15
fffff80f`2d32d2f8 488dac2450feffff lea     rbp,[rsp-1B0h]
fffff80f`2d32d300 4881ecb0020000  sub     rsp,2B0h
fffff80f`2d32d307 488b05823fffff  mov     rax,qword ptr [storport!_security_cookie (fffff80f`2d321290)]
fffff80f`2d32d30e 4833c4          xor     rax,rsp
fffff80f`2d32d311 488985a0010000  mov     qword ptr [rbp+1A0h],rax
fffff80f`2d32d318 488bbd10020000  mov     rdi,qword ptr [rbp+210h]
fffff80f`2d32d31f 488db138010000  lea     rsi,[rcx+138h]
fffff80f`2d32d326 448bbd20020000  mov     r15d,dword ptr [rbp+220h]
fffff80f`2d32d32d 4533f6          xor     r14d,r14d
fffff80f`2d32d330 498bc0          mov     rax,r8
fffff80f`2d32d333 48895108        mov     qword ptr [rcx+8],rdx
fffff80f`2d32d337 48894110        mov     qword ptr [rcx+10h],rax
fffff80f`2d32d33b 488bd9          mov     rbx,rcx       ;rbx == rcx == _RAID_ADAPTER_EXTENSION
fffff80f`2d32d33e 48897920        mov     qword ptr [rcx+20h],rdi
fffff80f`2d32d342 4c8bea          mov     r13,rdx
fffff80f`2d32d345 4c894918        mov     qword ptr [rcx+18h],r9
fffff80f`2d32d349 48894598        mov     qword ptr [rbp-68h],rax
fffff80f`2d32d34d 488b8518020000  mov     rax,qword ptr [rbp+218h]
fffff80f`2d32d354 4489742450      mov     dword ptr [rsp+50h],r14d
fffff80f`2d32d359 4489742454      mov     dword ptr [rsp+54h],r14d
fffff80f`2d32d35e 4489742458      mov     dword ptr [rsp+58h],r14d
fffff80f`2d32d363 0f1000          movups  xmm0,xmmword ptr [rax]
fffff80f`2d32d366 4489b958080000  mov     dword ptr [rcx+858h],r15d
fffff80f`2d32d36d c781ac08000001000000 mov dword ptr [rcx+8ACh],1
fffff80f`2d32d377 f30f7f4128      movdqu  xmmword ptr [rcx+28h],xmm0
fffff80f`2d32d37c c681bd13000001  mov     byte ptr [rcx+13BDh],1
fffff80f`2d32d383 4489b198150000  mov     dword ptr [rcx+1598h],r14d
fffff80f`2d32d38a 48890e          mov     qword ptr [rsi],rcx
fffff80f`2d32d38d 488bcf          mov     rcx,rdi
fffff80f`2d32d390 448974245c      mov     dword ptr [rsp+5Ch],r14d
fffff80f`2d32d395 4489742460      mov     dword ptr [rsp+60h],r14d
fffff80f`2d32d39a 4489742464      mov     dword ptr [rsp+64h],r14d
fffff80f`2d32d39f 4489742468      mov     dword ptr [rsp+68h],r14d
fffff80f`2d32d3a4 e8db02fbff      call    storport!RaGetBusInterface (fffff80f`2d2dd684)
fffff80f`2d32d3a9 83f8ff          cmp     eax,0FFFFFFFFh
fffff80f`2d32d3ac 448bc0          mov     r8d,eax
fffff80f`2d32d3af 450f44c6        cmove   r8d,r14d
fffff80f`2d32d3b3 4585c0          test    r8d,r8d
fffff80f`2d32d3b6 0f8425070000    je      storport!RaidInitializeAdapter+0x7f9 (fffff80f`2d32dae1)  Branch

storport!RaidInitializeAdapter+0xd4:
fffff80f`2d32d3bc 4c8b4b10        mov     r9,qword ptr [rbx+10h]    ;AdapterExt->Driver
fffff80f`2d32d3c0 4983c160        add     r9,60h                    ;AdapterExt->Driver->HwInitList
fffff80f`2d32d3c4 498b11          mov     rdx,qword ptr [r9]        ;rdx = HwInitList->Flink

storport!RaidInitializeAdapter+0xdf:
fffff80f`2d32d3c7 493bd1          cmp     rdx,r9                    ;
fffff80f`2d32d3ca 0f84c93e0000    je      storport!RaidInitializeAdapter+0x3fb1 (fffff80f`2d331299)  Branch

storport!RaidInitializeAdapter+0xe8:
fffff80f`2d32d3d0 488d8a30ffffff  lea     rcx,[rdx-0D0h]    ;rcx == HW_INITIALIZE_DATA
fffff80f`2d32d3d7 f781b800000000080000 test dword ptr [rcx+0B8h],800h   
;if (HW_INITIALIZE_DATA::FeatureSupport & STOR_FEATURE_SET_ADAPTER_INTERFACE_TYPE) => goto 0x3fa8
fffff80f`2d32d3e1 0f85a93e0000    jne     storport!RaidInitializeAdapter+0x3fa8 (fffff80f`2d331290)  Branch

storport!RaidInitializeAdapter+0xff:
fffff80f`2d32d3e7 44394104        cmp     dword ptr [rcx+4],r8d     
;if (HW_INITIALIZE_DATA::AdapterInterfaceType != PciBus) goto 0x3fa0
fffff80f`2d32d3eb 0f85973e0000    jne     storport!RaidInitializeAdapter+0x3fa0 (fffff80f`2d331288)  Branch

storport!RaidInitializeAdapter+0x109:
fffff80f`2d32d3f1 48898b20020000  mov     qword ptr [rbx+220h],rcx ;rbx+0x220 == HW_INITIALIZE_DATA
fffff80f`2d32d3f8 4885c9          test    rcx,rcx   ;if (HW_INITIALIZE_DATA is NULL) goto 0x3fb9
fffff80f`2d32d3fb 0f84a03e0000    je      storport!RaidInitializeAdapter+0x3fb9 (fffff80f`2d3312a1)  Branch

storport!RaidInitializeAdapter+0x119:
fffff80f`2d32d401 8b4104          mov     eax,dword ptr [rcx+4] 
fffff80f`2d32d404 488bce          mov     rcx,rsi
fffff80f`2d32d407 804b6e02        or      byte ptr [rbx+6Eh],2
fffff80f`2d32d40b 898348010000    mov     dword ptr [rbx+148h],eax
fffff80f`2d32d411 e8e2070000      call    storport!RiAllocateMiniportDeviceExtension (fffff80f`2d32dbf8)    ;Create miniport HBA Extension
fffff80f`2d32d416 85c0            test    eax,eax
fffff80f`2d32d418 0f8899060000    js      storport!RaidInitializeAdapter+0x7cf (fffff80f`2d32dab7)  Branch

storport!RaidInitializeAdapter+0x136:
fffff80f`2d32d41e 488b4b10        mov     rcx,qword ptr [rbx+10h]   ;rbx == _RAID_ADAPTER_EXTENSION, rcx = AdapterExt->Driver
fffff80f`2d32d422 4c8d8360080000  lea     r8,[rbx+860h]     ;r8 = AdapterExt->DriverParameters
fffff80f`2d32d429 4883c128        add     rcx,28h           ;rcx = AdapterExt->Driver->RegistryPath
fffff80f`2d32d42d 418bd7          mov     edx,r15d
fffff80f`2d32d430 e84b070000      call    storport!PortGetDriverParameters (fffff80f`2d32db80)
fffff80f`2d32d435 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d439 4c8da3a8080000  lea     r12,[rbx+8A8h]    ;r12 = AdapterExt->LinkDownTimeoutValue
fffff80f`2d32d440 4883c128        add     rcx,28h           ;rcx = AdapterExt->Driver->RegistryPath
fffff80f`2d32d444 41c704241e000000 mov     dword ptr [r12],1Eh
fffff80f`2d32d44c 4d8bc4          mov     r8,r12
fffff80f`2d32d44f 418bd7          mov     edx,r15d
fffff80f`2d32d452 e8b501fbff      call    storport!PortGetLinkTimeoutValue (fffff80f`2d2dd60c)
fffff80f`2d32d457 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d45b 4c8db3ac100000  lea     r14,[rbx+10ACh]   ;r14 = AdapterExt->DefaultTimeout
fffff80f`2d32d462 41832600        and     dword ptr [r14],0
fffff80f`2d32d466 4883c128        add     rcx,28h           ;rcx = AdapterExt->Driver->RegistryPath
fffff80f`2d32d46a 498bd6          mov     rdx,r14
fffff80f`2d32d46d e83afaffff      call    storport!PortGetIoTimeoutValue (fffff80f`2d32ceac)
fffff80f`2d32d472 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d476 488db3c8130000  lea     rsi,[rbx+13C8h]   ;rsi = AdapterExt->IoLatencyCap
fffff80f`2d32d47d 48832600        and     qword ptr [rsi],0
fffff80f`2d32d481 4883c128        add     rcx,28h           ;rcx = AdapterExt->Driver->RegistryPath
fffff80f`2d32d485 488bd6          mov     rdx,rsi
fffff80f`2d32d488 e85ff9ffff      call    storport!PortGetIoLatencyCapValue (fffff80f`2d32cdec)
fffff80f`2d32d48d 488b06          mov     rax,qword ptr [rsi]
fffff80f`2d32d490 33c9            xor     ecx,ecx
fffff80f`2d32d492 4885c0          test    rax,rax
fffff80f`2d32d495 0f85103e0000    jne     storport!RaidInitializeAdapter+0x3fc3 (fffff80f`2d3312ab)  Branch

storport!RaidInitializeAdapter+0x1b3:
fffff80f`2d32d49b 488d93c4160000  lea     rdx,[rbx+16C4h]       ;rdx = AdapterExt->BusyRetryCount
fffff80f`2d32d4a2 890a            mov     dword ptr [rdx],ecx
fffff80f`2d32d4a4 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d4a8 4883c128        add     rcx,28h           ;rcx = AdapterExt->Driver->RegistryPath
fffff80f`2d32d4ac e83bf8ffff      call    storport!PortGetBusyRetryCountValue (fffff80f`2d32ccec)
fffff80f`2d32d4b1 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d4b5 488d93c8160000  lea     rdx,[rbx+16C8h]       ;rdx = AdapterExt->BusyPauseTimeInMs
fffff80f`2d32d4bc 832200          and     dword ptr [rdx],0
fffff80f`2d32d4bf 4883c128        add     rcx,28h           ;rcx = AdapterExt->Driver->RegistryPath
fffff80f`2d32d4c3 e824f7ffff      call    storport!PortGetBusyPauseTimeValue (fffff80f`2d32cbec)
fffff80f`2d32d4c8 488d15d97bfeff  lea     rdx,[storport!`string` (fffff80f`2d3150a8)]   ;"StorPort" => registry base key
fffff80f`2d32d4cf 488d4c2470      lea     rcx,[rsp+70h]
fffff80f`2d32d4d4 48ff15359cffff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d4db 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d4e0 488d15997bfeff  lea     rdx,[storport!`string` (fffff80f`2d315080)]   ;"TotalSenseDataBytes"
fffff80f`2d32d4e7 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d4ec 48ff151d9cffff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d4f3 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d4f8 b904000000      mov     ecx,4
fffff80f`2d32d4fd 488d442450      lea     rax,[rsp+50h]
fffff80f`2d32d502 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d507 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d50c 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d511 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80f`2d32d515 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d51a 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d51f 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d524 448bc9          mov     r9d,ecx
fffff80f`2d32d527 488bcf          mov     rcx,rdi
fffff80f`2d32d52a 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d52f e84cd8ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d534 8b4c2450        mov     ecx,dword ptr [rsp+50h]
fffff80f`2d32d538 85c0            test    eax,eax
fffff80f`2d32d53a ba00010000      mov     edx,100h
fffff80f`2d32d53f 0f48ca          cmovs   ecx,edx
fffff80f`2d32d542 baff000000      mov     edx,0FFh
fffff80f`2d32d547 894c2450        mov     dword ptr [rsp+50h],ecx
fffff80f`2d32d54b 83f912          cmp     ecx,12h
fffff80f`2d32d54e 0f86663d0000    jbe     storport!RaidInitializeAdapter+0x3fd2 (fffff80f`2d3312ba)  Branch

storport!RaidInitializeAdapter+0x26c:
fffff80f`2d32d554 3bca            cmp     ecx,edx
fffff80f`2d32d556 0fb6c1          movzx   eax,cl
fffff80f`2d32d559 0f43c2          cmovae  eax,edx
fffff80f`2d32d55c 8883bc130000    mov     byte ptr [rbx+13BCh],al   ;set AdapterExt->DefaultSenseByteCount = al (default 0xFF)

storport!RaidInitializeAdapter+0x27a:
fffff80f`2d32d562 488d15df7afeff  lea     rdx,[storport!`string` (fffff80f`2d315048)]   ;"EnableIdlePowerManagement"
fffff80f`2d32d569 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d56e 48ff159b9bffff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d575 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d57a 806368df        and     byte ptr [rbx+68h],0DFh
fffff80f`2d32d57e 488d442454      lea     rax,[rsp+54h]
fffff80f`2d32d583 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d588 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d58d 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d592 c744243004000000 mov     dword ptr [rsp+30h],4
fffff80f`2d32d59a 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d59f 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d5a4 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d5a9 41b904000000    mov     r9d,4
fffff80f`2d32d5af 488bcf          mov     rcx,rdi
fffff80f`2d32d5b2 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d5b7 e8c4d7ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d5bc 33c9            xor     ecx,ecx
fffff80f`2d32d5be 85c0            test    eax,eax   ;goto 0x802 if PortRegistryReadDeviceKey() succeed
fffff80f`2d32d5c0 0f8924050000    jns     storport!RaidInitializeAdapter+0x802 (fffff80f`2d32daea)  Branch

storport!RaidInitializeAdapter+0x2de:
fffff80f`2d32d5c6 488d153b7afeff  lea     rdx,[storport!`string` (fffff80f`2d315008)]       ;"DisableRuntimePowerManagement"
fffff80f`2d32d5cd 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d5d2 48ff15379bffff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d5d9 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d5de 80636cef        and     byte ptr [rbx+6Ch],0EFh
fffff80f`2d32d5e2 488d442458      lea     rax,[rsp+58h]
fffff80f`2d32d5e7 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d5ec 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d5f1 b904000000      mov     ecx,4
fffff80f`2d32d5f6 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d5fb 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d600 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d605 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d60a 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80f`2d32d60e 448bc9          mov     r9d,ecx
fffff80f`2d32d611 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d616 488bcf          mov     rcx,rdi
fffff80f`2d32d619 e862d7ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d61e 33c9            xor     ecx,ecx
fffff80f`2d32d620 85c0            test    eax,eax   ;goto 0x3fde if PortRegistryReadDeviceKey() succeed
fffff80f`2d32d622 0f899e3c0000    jns     storport!RaidInitializeAdapter+0x3fde (fffff80f`2d3312c6)  Branch

storport!RaidInitializeAdapter+0x340:
fffff80f`2d32d628 488d15b979feff  lea     rdx,[storport!`string` (fffff80f`2d314fe8)]   ;"DisableD3Cold"
fffff80f`2d32d62f 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d634 48ff15d59affff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d63b 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d640 8a436c          mov     al,byte ptr [rbx+6Ch]
fffff80f`2d32d643 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d648 24f7            and     al,0F7h
fffff80f`2d32d64a 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d64f b904000000      mov     ecx,4
fffff80f`2d32d654 0ac1            or      al,cl
fffff80f`2d32d656 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80f`2d32d65a 88436c          mov     byte ptr [rbx+6Ch],al
fffff80f`2d32d65d 448bc9          mov     r9d,ecx
fffff80f`2d32d660 488d44245c      lea     rax,[rsp+5Ch]
fffff80f`2d32d665 488bcf          mov     rcx,rdi
fffff80f`2d32d668 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d66d 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d672 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d677 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d67c 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d681 e8fad6ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d686 33c9            xor     ecx,ecx
fffff80f`2d32d688 85c0            test    eax,eax   ;goto 0x3ff5 if PortRegistryReadDeviceKey() succeed
fffff80f`2d32d68a 0f894d3c0000    jns     storport!RaidInitializeAdapter+0x3ff5 (fffff80f`2d3312dd)  Branch

storport!RaidInitializeAdapter+0x3a8:
fffff80f`2d32d690 488d153179feff  lea     rdx,[storport!`string` (fffff80f`2d314fc8)]   ;"IdleTimeoutInMS"
fffff80f`2d32d697 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d69c 48ff156d9affff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d6a3 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d6a8 b904000000      mov     ecx,4
fffff80f`2d32d6ad c7833014000060ea0000 mov dword ptr [rbx+1430h],0EA60h
fffff80f`2d32d6b7 488d442460      lea     rax,[rsp+60h]
fffff80f`2d32d6bc 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80f`2d32d6c0 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d6c5 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d6ca 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d6cf 448bc9          mov     r9d,ecx
fffff80f`2d32d6d2 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d6d7 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d6dc 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d6e1 488bcf          mov     rcx,rdi
fffff80f`2d32d6e4 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d6e9 e892d6ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d6ee 85c0            test    eax,eax   ;goto 0x400c if PortRegistryReadDeviceKey() succeed
fffff80f`2d32d6f0 0f89fe3b0000    jns     storport!RaidInitializeAdapter+0x400c (fffff80f`2d3312f4)  Branch

storport!RaidInitializeAdapter+0x40e:
fffff80f`2d32d6f6 488d15b378feff  lea     rdx,[storport!`string` (fffff80f`2d314fb0)]   ;"UseDMAv3"
fffff80f`2d32d6fd 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d702 48ff15079affff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d709 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d70e 80636dfd        and     byte ptr [rbx+6Dh],0FDh
fffff80f`2d32d712 488d442464      lea     rax,[rsp+64h]
fffff80f`2d32d717 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d71c 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d721 b904000000      mov     ecx,4
fffff80f`2d32d726 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d72b 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d730 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d735 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d73a 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80f`2d32d73e 448bc9          mov     r9d,ecx
fffff80f`2d32d741 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d746 488bcf          mov     rcx,rdi
fffff80f`2d32d749 e832d6ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d74e 33c9            xor     ecx,ecx
fffff80f`2d32d750 85c0            test    eax,eax    ;goto 0x401f if PortRegistryReadDeviceKey() succeed
fffff80f`2d32d752 0f89af3b0000    jns     storport!RaidInitializeAdapter+0x401f (fffff80f`2d331307)  Branch

storport!RaidInitializeAdapter+0x470:
fffff80f`2d32d758 488d153178feff  lea     rdx,[storport!`string` (fffff80f`2d314f90)]   ;"PowerSrbTimeout"
fffff80f`2d32d75f 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d764 48ff15a599ffff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d76b 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d770 418b06          mov     eax,dword ptr [r14]
fffff80f`2d32d773 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d32d778 898380160000    mov     dword ptr [rbx+1680h],eax
fffff80f`2d32d77e 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d32d783 b904000000      mov     ecx,4
fffff80f`2d32d788 488d442468      lea     rax,[rsp+68h]
fffff80f`2d32d78d 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d792 448bc9          mov     r9d,ecx
fffff80f`2d32d795 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d79a 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80f`2d32d79e 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d7a3 488bcf          mov     rcx,rdi
fffff80f`2d32d7a6 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d7ab 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d7b0 e8cbd5ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d7b5 33c9            xor     ecx,ecx
fffff80f`2d32d7b7 85c0            test    eax,eax   ;goto 0x4037 if PortRegistryReadDeviceKey() succeed
fffff80f`2d32d7b9 0f89603b0000    jns     storport!RaidInitializeAdapter+0x4037 (fffff80f`2d33131f)  Branch

storport!RaidInitializeAdapter+0x4d7:
fffff80f`2d32d7bf 83bb801600006e  cmp     dword ptr [rbx+1680h],6Eh ;if(AdapterExt->PowerSrbTimeout > 0x6E) goto 0x404e
fffff80f`2d32d7c6 0f876a3b0000    ja      storport!RaidInitializeAdapter+0x404e (fffff80f`2d331336)  Branch

storport!RaidInitializeAdapter+0x4e4:
fffff80f`2d32d7cc 80636c7f        and     byte ptr [rbx+6Ch],7Fh
fffff80f`2d32d7d0 33d2            xor     edx,edx
fffff80f`2d32d7d2 804b6d10        or      byte ptr [rbx+6Dh],10h    ;set AdapterExt->Flags.ProtocolCommandEffectsPendingUpdate = TRUE
fffff80f`2d32d7d6 41b848010000    mov     r8d,148h
fffff80f`2d32d7dc 48898b28140000  mov     qword ptr [rbx+1428h],rcx ;AdapterExt->LowPowerEpochHandle = rcx (NULL?)
fffff80f`2d32d7e3 488d4dc0        lea     rcx,[rbp-40h]
fffff80f`2d32d7e7 e814e6fbff      call    storport!memset (fffff80f`2d2ebe00)   ;清理stack上某個structure, 0x148 bytes
fffff80f`2d32d7ec 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d7f0 4c8d45c0        lea     r8,[rbp-40h]
fffff80f`2d32d7f4 660f6f05248ffeff movdqa  xmm0,xmmword ptr [storport!_xmm (fffff80f`2d316720)]
fffff80f`2d32d7fc 33c0            xor     eax,eax
fffff80f`2d32d7fe 8945ec          mov     dword ptr [rbp-14h],eax
fffff80f`2d32d801 4883c128        add     rcx,28h
fffff80f`2d32d805 b8ffffffff      mov     eax,0FFFFFFFFh
fffff80f`2d32d80a c745c0ff000000  mov     dword ptr [rbp-40h],0FFh
fffff80f`2d32d811 418bd7          mov     edx,r15d
fffff80f`2d32d814 8945e0          mov     dword ptr [rbp-20h],eax
fffff80f`2d32d817 660f7f45d0      movdqa  xmmword ptr [rbp-30h],xmm0
fffff80f`2d32d81c e8e7020000      call    storport!PortGetRegistrySettings (fffff80f`2d32db08)
fffff80f`2d32d821 488b45d8        mov     rax,qword ptr [rbp-28h]
fffff80f`2d32d825 488d5580        lea     rdx,[rbp-80h]
fffff80f`2d32d829 48898350110000  mov     qword ptr [rbx+1150h],rax
fffff80f`2d32d830 4533ff          xor     r15d,r15d
fffff80f`2d32d833 488b45d0        mov     rax,qword ptr [rbp-30h]
fffff80f`2d32d837 48898358110000  mov     qword ptr [rbx+1158h],rax
fffff80f`2d32d83e 8b45e0          mov     eax,dword ptr [rbp-20h]
fffff80f`2d32d841 898340110000    mov     dword ptr [rbx+1140h],eax
fffff80f`2d32d847 8b45ec          mov     eax,dword ptr [rbp-14h]
fffff80f`2d32d84a 898348110000    mov     dword ptr [rbx+1148h],eax
fffff80f`2d32d850 b8ffffffff      mov     eax,0FFFFFFFFh
fffff80f`2d32d855 48898370110000  mov     qword ptr [rbx+1170h],rax
fffff80f`2d32d85c 4c89bb60110000  mov     qword ptr [rbx+1160h],r15
fffff80f`2d32d863 4c89bb68110000  mov     qword ptr [rbx+1168h],r15
fffff80f`2d32d86a c7834411000006000000 mov dword ptr [rbx+1144h],6
fffff80f`2d32d874 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80f`2d32d878 4883c128        add     rcx,28h
fffff80f`2d32d87c e833f7ffff      call    storport!PortReadStorageBusType (fffff80f`2d32cfb4)
fffff80f`2d32d881 84c0            test    al,al     ;if (!PortReadStorageBusType()) goto 0x5a6
fffff80f`2d32d883 7409            je      storport!RaidInitializeAdapter+0x5a6 (fffff80f`2d32d88e)  Branch

storport!RaidInitializeAdapter+0x59d:
fffff80f`2d32d885 8b4580          mov     eax,dword ptr [rbp-80h]
fffff80f`2d32d888 898344110000    mov     dword ptr [rbx+1144h],eax     ;set AdapterExt->Parameters.BusType = eax (BusTypeNvme?)

storport!RaidInitializeAdapter+0x5a6:
fffff80f`2d32d88e 488b4d98        mov     rcx,qword ptr [rbp-68h]
fffff80f`2d32d892 488d55a8        lea     rdx,[rbp-58h]     ;[rbp-0x58] 是 UNICODE_STRING 結構
fffff80f`2d32d896 e801bafaff      call    storport!RaidDriverGetName (fffff80f`2d2d929c)    ;讀出driver name 放進 rdx (UNICODE_STRING)
fffff80f`2d32d89b 488b45b0        mov     rax,qword ptr [rbp-50h]   ;rax = UNICODE_STRING::Buffer
fffff80f`2d32d89f 4c8d8308130000  lea     r8,[rbx+1308h]            ;r8 = &(AdapterExt->SqmAdapterId)
fffff80f`2d32d8a6 488bcf          mov     rcx,rdi
fffff80f`2d32d8a9 48898300130000  mov     qword ptr [rbx+1300h],rax     ;AdapterExt->SqmMiniportName = UNICODE_STRING::Buffer ("stornvme")
fffff80f`2d32d8b0 e897fcfaff      call    storport!RaidAllocateDeviceProperty (fffff80f`2d2dd54c)
fffff80f`2d32d8b5 48b82003000080f7ffff mov rax,0FFFFF78000000320h
fffff80f`2d32d8bf 488b00          mov     rax,qword ptr [rax]
fffff80f`2d32d8c2 65488b142588010000 mov   rdx,qword ptr gs:[188h]      ;rdx == current ETHREAD
fffff80f`2d32d8cb 488bc8          mov     rcx,rax
fffff80f`2d32d8ce 48c1e920        shr     rcx,20h
fffff80f`2d32d8d2 33d1            xor     edx,ecx
fffff80f`2d32d8d4 488d4d84        lea     rcx,[rbp-7Ch]
fffff80f`2d32d8d8 4133d5          xor     edx,r13d
fffff80f`2d32d8db 33d0            xor     edx,eax
fffff80f`2d32d8dd 895584          mov     dword ptr [rbp-7Ch],edx
fffff80f`2d32d8e0 48ff15d997ffff  call    qword ptr [storport!_imp_RtlRandomEx (fffff80f`2d3270c0)]
fffff80f`2d32d8e7 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d8ec 898310130000    mov     dword ptr [rbx+1310h],eax     ;AdapterExt->SqmRandomId
fffff80f`2d32d8f2 488d8b00170000  lea     rcx,[rbx+1700h]               ;給miniport的 HBA Extention 起始位置
fffff80f`2d32d8f9 b8ffffffff      mov     eax,0FFFFFFFFh
fffff80f`2d32d8fe 488d157376feff  lea     rdx,[storport!`string` (fffff80f`2d314f78)]   ;"AdapterGuid"
fffff80f`2d32d905 898300140000    mov     dword ptr [rbx+1400h],eax     ;AdapterExt->RaidLogListIndex = 0xFFFFFFFF
fffff80f`2d32d90b 8b058f39ffff    mov     eax,dword ptr [storport!RaidLogListSize (fffff80f`2d3212a0)]  ;0x100
fffff80f`2d32d911 898304140000    mov     dword ptr [rbx+1404h],eax     ;ADapterExt->RaidLogListSize = 0x100
fffff80f`2d32d917 f7d8            neg     eax
fffff80f`2d32d919 481bc0          sbb     rax,rax
fffff80f`2d32d91c 4823c1          and     rax,rcx
fffff80f`2d32d91f 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`2d32d924 48898308140000  mov     qword ptr [rbx+1408h],rax     ;AdapterExt->RaidLogList
fffff80f`2d32d92b 33c0            xor     eax,eax
fffff80f`2d32d92d 48898510010000  mov     qword ptr [rbp+110h],rax
fffff80f`2d32d934 48898518010000  mov     qword ptr [rbp+118h],rax
fffff80f`2d32d93b 48ff15ce97ffff  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d32d942 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32d947 488d8510010000  lea     rax,[rbp+110h]
fffff80f`2d32d94e 41bd10000000    mov     r13d,10h
fffff80f`2d32d954 4889442438      mov     qword ptr [rsp+38h],rax
fffff80f`2d32d959 4c8d442440      lea     r8,[rsp+40h]      ;UNICODE_STRING "AdapterGuid"
fffff80f`2d32d95e 488d442430      lea     rax,[rsp+30h]
fffff80f`2d32d963 44896c2430      mov     dword ptr [rsp+30h],r13d
fffff80f`2d32d968 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32d96d 488d542470      lea     rdx,[rsp+70h]     ;UNICODE_STRING "StorPort"
fffff80f`2d32d972 488d442438      lea     rax,[rsp+38h]
fffff80f`2d32d977 488bcf          mov     rcx,rdi
fffff80f`2d32d97a 458d4df3        lea     r9d,[r13-0Dh]
fffff80f`2d32d97e 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d32d983 e8f8d3ffff      call    storport!PortRegistryReadDeviceKey (fffff80f`2d32ad80)
fffff80f`2d32d988 85c0            test    eax,eax   ;if (!PortRegistryReadDeviceKey()) goto 0x405d
fffff80f`2d32d98a 0f88b5390000    js      storport!RaidInitializeAdapter+0x405d (fffff80f`2d331345)  Branch

storport!RaidInitializeAdapter+0x6a8:
fffff80f`2d32d990 0f108510010000  movups  xmm0,xmmword ptr [rbp+110h]
fffff80f`2d32d997 4c8d8b88140000  lea     r9,[rbx+1488h]
fffff80f`2d32d99e 488bcb          mov     rcx,rbx
fffff80f`2d32d9a1 f3410f7f01      movdqu  xmmword ptr [r9],xmm0 ;set AdapterExt->AdapterGuid
fffff80f`2d32d9a6 e815fbfaff      call    storport!StorpInitializeAdapterTelemetry (fffff80f`2d2dd4c0)
fffff80f`2d32d9ab 833da636ffff05  cmp     dword ptr [storport!StorPortEventProvider_Context+0x48 (fffff80f`2d321058)],5
fffff80f`2d32d9b2 0f86d7000000    jbe     storport!RaidInitializeAdapter+0x7a7 (fffff80f`2d32da8f)  Branch

storport!RaidInitializeAdapter+0x6d0:
fffff80f`2d32d9b8 48ba0000000000400000 mov rdx,400000000000h
fffff80f`2d32d9c2 e8150afaff      call    storport!TlgKeywordOn (fffff80f`2d2ce3dc)
fffff80f`2d32d9c7 84c0            test    al,al
fffff80f`2d32d9c9 0f84c0000000    je      storport!RaidInitializeAdapter+0x7a7 (fffff80f`2d32da8f)  Branch

storport!RaidInitializeAdapter+0x6e7:
fffff80f`2d32d9cf 418b0424        mov     eax,dword ptr [r12]
fffff80f`2d32d9d3 ba08000000      mov     edx,8
fffff80f`2d32d9d8 894588          mov     dword ptr [rbp-78h],eax
fffff80f`2d32d9db 418b06          mov     eax,dword ptr [r14]
fffff80f`2d32d9de 89458c          mov     dword ptr [rbp-74h],eax
fffff80f`2d32d9e1 488b06          mov     rax,qword ptr [rsi]
fffff80f`2d32d9e4 488945a0        mov     qword ptr [rbp-60h],rax
fffff80f`2d32d9e8 0fb683bc130000  movzx   eax,byte ptr [rbx+13BCh]
fffff80f`2d32d9ef 894590          mov     dword ptr [rbp-70h],eax
fffff80f`2d32d9f2 8b8330140000    mov     eax,dword ptr [rbx+1430h]
fffff80f`2d32d9f8 894598          mov     dword ptr [rbp-68h],eax
fffff80f`2d32d9fb 488d4588        lea     rax,[rbp-78h]
fffff80f`2d32d9ff 48898550010000  mov     qword ptr [rbp+150h],rax
fffff80f`2d32da06 488d458c        lea     rax,[rbp-74h]
fffff80f`2d32da0a 48898560010000  mov     qword ptr [rbp+160h],rax
fffff80f`2d32da11 488d45a0        lea     rax,[rbp-60h]
fffff80f`2d32da15 48898570010000  mov     qword ptr [rbp+170h],rax
fffff80f`2d32da1c 488d4590        lea     rax,[rbp-70h]
fffff80f`2d32da20 48898580010000  mov     qword ptr [rbp+180h],rax
fffff80f`2d32da27 488d4598        lea     rax,[rbp-68h]
fffff80f`2d32da2b 48898590010000  mov     qword ptr [rbp+190h],rax
fffff80f`2d32da32 4c898d40010000  mov     qword ptr [rbp+140h],r9
fffff80f`2d32da39 4c89ad48010000  mov     qword ptr [rbp+148h],r13
fffff80f`2d32da40 48c7855801000004000000 mov qword ptr [rbp+158h],4
fffff80f`2d32da4b 48c7856801000004000000 mov qword ptr [rbp+168h],4
fffff80f`2d32da56 48899578010000  mov     qword ptr [rbp+178h],rdx
fffff80f`2d32da5d 48c7858801000004000000 mov qword ptr [rbp+188h],4
fffff80f`2d32da68 48c7859801000004000000 mov qword ptr [rbp+198h],4
fffff80f`2d32da73 488d8520010000  lea     rax,[rbp+120h]
fffff80f`2d32da7a 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d32da7f 89542420        mov     dword ptr [rsp+20h],edx
fffff80f`2d32da83 488d15ea93feff  lea     rdx,[storport!TraceLoggingMetadata+0x10c (fffff80f`2d316e74)]
fffff80f`2d32da8a e8a508faff      call    storport!TlgWrite (fffff80f`2d2ce334)

storport!RaidInitializeAdapter+0x7a7:
fffff80f`2d32da8f 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff80f`2d32da93 488d15f62afaff  lea     rdx,[storport!RaidpAdapterDpcRoutine (fffff80f`2d2d0590)]
fffff80f`2d32da9a 498d88c8000000  lea     rcx,[r8+0C8h]
fffff80f`2d32daa1 48ff15c895ffff  call    qword ptr [storport!_imp_KeInitializeDpc (fffff80f`2d327070)]
fffff80f`2d32daa8 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d32daad 836378fe        and     dword ptr [rbx+78h],0FFFFFFFEh
fffff80f`2d32dab1 33c0            xor     eax,eax
fffff80f`2d32dab3 4c897b70        mov     qword ptr [rbx+70h],r15

storport!RaidInitializeAdapter+0x7cf:
fffff80f`2d32dab7 488b8da0010000  mov     rcx,qword ptr [rbp+1A0h]
fffff80f`2d32dabe 4833cc          xor     rcx,rsp
fffff80f`2d32dac1 e89a82fbff      call    storport!_security_check_cookie (fffff80f`2d2e5d60)
fffff80f`2d32dac6 488b9c2408030000 mov     rbx,qword ptr [rsp+308h]
fffff80f`2d32dace 4881c4b0020000  add     rsp,2B0h
fffff80f`2d32dad5 415f            pop     r15
fffff80f`2d32dad7 415e            pop     r14
fffff80f`2d32dad9 415d            pop     r13
fffff80f`2d32dadb 415c            pop     r12
fffff80f`2d32dadd 5f              pop     rdi
fffff80f`2d32dade 5e              pop     rsi
fffff80f`2d32dadf 5d              pop     rbp
fffff80f`2d32dae0 c3              ret

storport!RaidInitializeAdapter+0x7f9:
fffff80f`2d32dae1 804b6808        or      byte ptr [rbx+68h],8      ;rbx == _RAID_ADAPTER_EXTENSION
fffff80f`2d32dae5 e9d2f8ffff      jmp     storport!RaidInitializeAdapter+0xd4 (fffff80f`2d32d3bc)  Branch

storport!RaidInitializeAdapter+0x802:
fffff80f`2d32daea 8a4368          mov     al,byte ptr [rbx+68h]
fffff80f`2d32daed 394c2454        cmp     dword ptr [rsp+54h],ecx
fffff80f`2d32daf1 740a            je      storport!RaidInitializeAdapter+0x815 (fffff80f`2d32dafd)  Branch

storport!RaidInitializeAdapter+0x80b:
fffff80f`2d32daf3 0c20            or      al,20h

storport!RaidInitializeAdapter+0x80d:
fffff80f`2d32daf5 884368          mov     byte ptr [rbx+68h],al
fffff80f`2d32daf8 e9c9faffff      jmp     storport!RaidInitializeAdapter+0x2de (fffff80f`2d32d5c6)  Branch

storport!RaidInitializeAdapter+0x815:
fffff80f`2d32dafd 24df            and     al,0DFh
fffff80f`2d32daff ebf4            jmp     storport!RaidInitializeAdapter+0x80d (fffff80f`2d32daf5)  Branch

storport!RaidInitializeAdapter+0x3fa0:
fffff80f`2d331288 488b12          mov     rdx,qword ptr [rdx]
fffff80f`2d33128b e937c1ffff      jmp     storport!RaidInitializeAdapter+0xdf (fffff80f`2d32d3c7)  Branch

storport!RaidInitializeAdapter+0x3fa8:
fffff80f`2d331290 44894104        mov     dword ptr [rcx+4],r8d
fffff80f`2d331294 e958c1ffff      jmp     storport!RaidInitializeAdapter+0x109 (fffff80f`2d32d3f1)  Branch

storport!RaidInitializeAdapter+0x3fb1:
fffff80f`2d331299 498bce          mov     rcx,r14
fffff80f`2d33129c e950c1ffff      jmp     storport!RaidInitializeAdapter+0x109 (fffff80f`2d32d3f1)  Branch

storport!RaidInitializeAdapter+0x3fb9:
fffff80f`2d3312a1 b80e0000c0      mov     eax,0C000000Eh
fffff80f`2d3312a6 e90cc8ffff      jmp     storport!RaidInitializeAdapter+0x7cf (fffff80f`2d32dab7)  Branch

storport!RaidInitializeAdapter+0x3fc3:
fffff80f`2d3312ab 4869c010270000  imul    rax,rax,2710h
fffff80f`2d3312b2 488906          mov     qword ptr [rsi],rax
fffff80f`2d3312b5 e9e1c1ffff      jmp     storport!RaidInitializeAdapter+0x1b3 (fffff80f`2d32d49b)  Branch

storport!RaidInitializeAdapter+0x3fd2:
fffff80f`2d3312ba c683bc13000012  mov     byte ptr [rbx+13BCh],12h
fffff80f`2d3312c1 e99cc2ffff      jmp     storport!RaidInitializeAdapter+0x27a (fffff80f`2d32d562)  Branch

storport!RaidInitializeAdapter+0x3fde:
fffff80f`2d3312c6 8a436c          mov     al,byte ptr [rbx+6Ch]
fffff80f`2d3312c9 394c2458        cmp     dword ptr [rsp+58h],ecx
fffff80f`2d3312cd 7404            je      storport!RaidInitializeAdapter+0x3feb (fffff80f`2d3312d3)  Branch

storport!RaidInitializeAdapter+0x3fe7:
fffff80f`2d3312cf 0c10            or      al,10h
fffff80f`2d3312d1 eb02            jmp     storport!RaidInitializeAdapter+0x3fed (fffff80f`2d3312d5)  Branch

storport!RaidInitializeAdapter+0x3feb:
fffff80f`2d3312d3 24ef            and     al,0EFh

storport!RaidInitializeAdapter+0x3fed:
fffff80f`2d3312d5 88436c          mov     byte ptr [rbx+6Ch],al
fffff80f`2d3312d8 e94bc3ffff      jmp     storport!RaidInitializeAdapter+0x340 (fffff80f`2d32d628)  Branch

storport!RaidInitializeAdapter+0x3ff5:
fffff80f`2d3312dd 8a436c          mov     al,byte ptr [rbx+6Ch]
fffff80f`2d3312e0 394c245c        cmp     dword ptr [rsp+5Ch],ecx
fffff80f`2d3312e4 7404            je      storport!RaidInitializeAdapter+0x4002 (fffff80f`2d3312ea)  Branch

storport!RaidInitializeAdapter+0x3ffe:
fffff80f`2d3312e6 24fb            and     al,0FBh
fffff80f`2d3312e8 eb02            jmp     storport!RaidInitializeAdapter+0x4004 (fffff80f`2d3312ec)  Branch

storport!RaidInitializeAdapter+0x4002:
fffff80f`2d3312ea 0c04            or      al,4

storport!RaidInitializeAdapter+0x4004:
fffff80f`2d3312ec 88436c          mov     byte ptr [rbx+6Ch],al
fffff80f`2d3312ef e99cc3ffff      jmp     storport!RaidInitializeAdapter+0x3a8 (fffff80f`2d32d690)  Branch

storport!RaidInitializeAdapter+0x400c:
fffff80f`2d3312f4 8b442460        mov     eax,dword ptr [rsp+60h]
fffff80f`2d3312f8 804b6c40        or      byte ptr [rbx+6Ch],40h
fffff80f`2d3312fc 898330140000    mov     dword ptr [rbx+1430h],eax
fffff80f`2d331302 e9efc3ffff      jmp     storport!RaidInitializeAdapter+0x40e (fffff80f`2d32d6f6)  Branch

storport!RaidInitializeAdapter+0x401f:
fffff80f`2d331307 3b4c2464        cmp     ecx,dword ptr [rsp+64h]
fffff80f`2d33130b 8a436d          mov     al,byte ptr [rbx+6Dh]
fffff80f`2d33130e 1ac9            sbb     cl,cl
fffff80f`2d331310 24fd            and     al,0FDh
fffff80f`2d331312 80e102          and     cl,2
fffff80f`2d331315 0ac1            or      al,cl
fffff80f`2d331317 88436d          mov     byte ptr [rbx+6Dh],al
fffff80f`2d33131a e939c4ffff      jmp     storport!RaidInitializeAdapter+0x470 (fffff80f`2d32d758)  Branch

storport!RaidInitializeAdapter+0x4037:
fffff80f`2d33131f 8b442468        mov     eax,dword ptr [rsp+68h]
fffff80f`2d331323 85c0            test    eax,eax
fffff80f`2d331325 0f8494c4ffff    je      storport!RaidInitializeAdapter+0x4d7 (fffff80f`2d32d7bf)  Branch

storport!RaidInitializeAdapter+0x4043:
fffff80f`2d33132b 898380160000    mov     dword ptr [rbx+1680h],eax
fffff80f`2d331331 e989c4ffff      jmp     storport!RaidInitializeAdapter+0x4d7 (fffff80f`2d32d7bf)  Branch

storport!RaidInitializeAdapter+0x404e:
fffff80f`2d331336 c783801600006e000000 mov dword ptr [rbx+1680h],6Eh
fffff80f`2d331340 e987c4ffff      jmp     storport!RaidInitializeAdapter+0x4e4 (fffff80f`2d32d7cc)  Branch

storport!RaidInitializeAdapter+0x405d:
fffff80f`2d331345 488d8d10010000  lea     rcx,[rbp+110h]
fffff80f`2d33134c 48ff15e55effff  call    qword ptr [storport!_imp_ExUuidCreate (fffff80f`2d327238)]
fffff80f`2d331353 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d331358 85c0            test    eax,eax
fffff80f`2d33135a 0f8830c6ffff    js      storport!RaidInitializeAdapter+0x6a8 (fffff80f`2d32d990)  Branch

storport!RaidInitializeAdapter+0x4078:
fffff80f`2d331360 488b442438      mov     rax,qword ptr [rsp+38h]
fffff80f`2d331365 4c8d442440      lea     r8,[rsp+40h]
fffff80f`2d33136a 44896c2428      mov     dword ptr [rsp+28h],r13d
fffff80f`2d33136f 488d542470      lea     rdx,[rsp+70h]
fffff80f`2d331374 41b903000000    mov     r9d,3
fffff80f`2d33137a 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d33137f 488bcf          mov     rcx,rdi
fffff80f`2d331382 e84d9dffff      call    storport!PortRegistryWriteDeviceKey (fffff80f`2d32b0d4)
fffff80f`2d331387 90              nop
fffff80f`2d331388 e903c6ffff      jmp     storport!RaidInitializeAdapter+0x6a8 (fffff80f`2d32d990)  Branch
