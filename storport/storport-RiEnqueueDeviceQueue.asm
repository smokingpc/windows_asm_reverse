1: kd> k 
 # Child-SP          RetAddr               Call Site
00 ffffd00c`be501c90 fffff809`1f208950     storport!RiEnqueueDeviceQueue+0x75
01 ffffd00c`be501cc0 fffff809`1f208087     storport!RaidInsertDeviceQueue+0x2d0
02 ffffd00c`be501d80 fffff809`1f207439     storport!RaidStartIoPacket+0x9c7
03 ffffd00c`be501e90 fffff809`1f2071da     storport!RaUnitScsiIrp+0x219
04 ffffd00c`be501f30 fffff802`6863f209     storport!RaDriverScsiIrp+0x5a
05 ffffd00c`be501f70 fffff809`1f210894     nt!IofCallDriver+0x59
06 ffffd00c`be501fb0 fffff809`1f2156f4     storport!RaSendIrpSynchronous+0x54
07 ffffd00c`be502010 fffff809`1f21553c     storport!RaidBusEnumeratorIssueSynchronousRequest+0x128
08 ffffd00c`be502240 fffff809`1f21535c     storport!RaidBusEnumeratorIssueReportLuns+0x68
09 ffffd00c`be502290 fffff809`1f214fba     storport!RaidBusEnumeratorGetLunListFromTarget+0x74
0a ffffd00c`be502310 fffff809`1f214ec0     storport!RaidBusEnumeratorGetLunList+0x7a
0b ffffd00c`be502400 fffff809`1f2143bb     storport!RaidAdapterEnumerateBus+0x94
0c ffffd00c`be502570 fffff809`1f213e7e     storport!RaidAdapterRescanBus+0xb7
0d ffffd00c`be502650 fffff809`1f213cb8     storport!RaidAdapterQueryDeviceRelationsIrp+0xa6
0e ffffd00c`be502710 fffff809`1f20c01e     storport!RaidAdapterPnpIrp+0x168
0f ffffd00c`be5027b0 fffff802`6863f209     storport!RaDriverPnpIrp+0x8e
10 ffffd00c`be5027f0 fffff802`68d0b8ae     nt!IofCallDriver+0x59

3: kd> dt _IO_QUEUE ffff970fe364c1a0+0x280
storport!_IO_QUEUE
   +0x000 DeviceObject     : 0xffff970f`e364c050 _DEVICE_OBJECT
   +0x008 StartIo          : 0xfffff809`1f203310     void  storport!RaUnitStartIo+0
   +0x010 DeviceQueue      : _EXTENDED_DEVICE_QUEUE
   +0x0a0 QueueChanged     : 0
3: kd> dx -id 0,0,ffff970fe7a09080 -r1 (*((storport!_EXTENDED_DEVICE_QUEUE *)0xffff970fe364c430))
(*((storport!_EXTENDED_DEVICE_QUEUE *)0xffff970fe364c430))                 [Type: _EXTENDED_DEVICE_QUEUE]
    [+0x000] Type             : 258 [Type: short]
    [+0x002] Size             : 144 [Type: short]
    [+0x004] Depth            : 1023 [Type: long]
    [+0x008] Gateway          : 0xffff970fe47234e0 [Type: _STOR_IO_GATEWAY *]
    [+0x010] DeviceCount      : 513 [Type: long]
    [+0x014] ByPassCount      : 0 [Type: long]
    [+0x018] ByPassPowerCount : 0 [Type: long]
    [+0x01c] PauseCount       : 1 [Type: long]
    [+0x020] BusyCount        : 0 [Type: long]
    [+0x024] Frozen           : 0x0 [Type: unsigned char]
    [+0x025] Locked           : 0x0 [Type: unsigned char]
    [+0x026] Untagged         : 0x0 [Type: unsigned char]
    [+0x027] PowerLocked      : 0x0 [Type: unsigned char]
    [+0x028] QuiescenceClients : 0x0 [Type: unsigned long]
    [+0x030] QuiescenceEvent  [Type: _KEVENT]
    [+0x048] RWLock           : 0 [Type: long]
    [+0x04c] OutstandingCount : 1023 [Type: long]
    [+0x050] DeviceList       [Type: _LIST_ENTRY]
    [+0x060] ByPassList       [Type: _LIST_ENTRY]
    [+0x070] QosReqList       [Type: _LIST_ENTRY]
    [+0x080] ZoneWriteOverflowEntries : 0x0 [Type: unsigned long]
    [+0x084] PeriodicMaxDeviceCount : 513 [Type: long]
    [+0x088] PeriodicMaxOutstandingCount : 1023 [Type: long]


1: kd> uf storport!RiEnqueueDeviceQueue
storport!RiEnqueueDeviceQueue:
fffff809`1f20b164 4883ec28        sub     rsp,28h
fffff809`1f20b168 f6421606        test    byte ptr [rdx+16h],6  ;RDX == IRP->Tail.Overlay.DriverContext[3] 第一byte => debug時是 0x06
fffff809`1f20b16c 4c8bc1          mov     r8,rcx                ;RCX == UnitExt->IoQueue->DeviceQueue
fffff809`1f20b16f 7549            jne     storport!RiEnqueueDeviceQueue+0x56 (fffff809`1f20b1ba)  Branch

storport!RiEnqueueDeviceQueue+0xd:
fffff809`1f20b171 488d4150        lea     rax,[rcx+50h]             ;RAX == DeviceQueue->DeviceList
fffff809`1f20b175 488b4808        mov     rcx,qword ptr [rax+8]     ;RCX == DeviceQueue->DeviceList->Blink
fffff809`1f20b179 483901          cmp     qword ptr [rcx],rax       ;if (DeviceQueue->DeviceList->Blink != DeviceQueue->DeviceList) goto 0x80
fffff809`1f20b17c 7566            jne     storport!RiEnqueueDeviceQueue+0x80 (fffff809`1f20b1e4)  Branch

storport!RiEnqueueDeviceQueue+0x1a:
;RDX == IRP->Tail == IRP->Tail.Overlay.DeviceQueueEntry.DeviceListEntry, 
;link DeviceQueue->DeviceList to IRP->Tail.Overlay.DeviceQueueEntry.DeviceListEntry
fffff809`1f20b17e 488902          mov     qword ptr [rdx],rax       
fffff809`1f20b181 48894a08        mov     qword ptr [rdx+8],rcx
fffff809`1f20b185 488911          mov     qword ptr [rcx],rdx
fffff809`1f20b188 48895008        mov     qword ptr [rax+8],rdx
fffff809`1f20b18c 41ff4010        inc     dword ptr [r8+10h]
fffff809`1f20b190 418b4010        mov     eax,dword ptr [r8+10h]
fffff809`1f20b194 413b8084000000  cmp     eax,dword ptr [r8+84h]    ;if DeviceCount > PeriodicMaxDeviceCount, goto 0x4d
fffff809`1f20b19b 7f14            jg      storport!RiEnqueueDeviceQueue+0x4d (fffff809`1f20b1b1)  Branch

storport!RiEnqueueDeviceQueue+0x39:
fffff809`1f20b19d 8a4216          mov     al,byte ptr [rdx+16h]
fffff809`1f20b1a0 a808            test    al,8
fffff809`1f20b1a2 7537            jne     storport!RiEnqueueDeviceQueue+0x77 (fffff809`1f20b1db)  Branch

storport!RiEnqueueDeviceQueue+0x40:
fffff809`1f20b1a4 a820            test    al,20h
fffff809`1f20b1a6 0f851e2e0200    jne     storport!RiEnqueueDeviceQueue+0x22e66 (fffff809`1f22dfca)  Branch

storport!RiEnqueueDeviceQueue+0x48:
fffff809`1f20b1ac 4883c428        add     rsp,28h
fffff809`1f20b1b0 c3              ret

storport!RiEnqueueDeviceQueue+0x4d:
fffff809`1f20b1b1 41898084000000  mov     dword ptr [r8+84h],eax
fffff809`1f20b1b8 ebe3            jmp     storport!RiEnqueueDeviceQueue+0x39 (fffff809`1f20b19d)  Branch

storport!RiEnqueueDeviceQueue+0x56:
fffff809`1f20b1ba 488d4160        lea     rax,[rcx+60h]
fffff809`1f20b1be 488b4808        mov     rcx,qword ptr [rax+8]
fffff809`1f20b1c2 483901          cmp     qword ptr [rcx],rax
fffff809`1f20b1c5 751d            jne     storport!RiEnqueueDeviceQueue+0x80 (fffff809`1f20b1e4)  Branch

storport!RiEnqueueDeviceQueue+0x63:
fffff809`1f20b1c7 488902          mov     qword ptr [rdx],rax
fffff809`1f20b1ca 48894a08        mov     qword ptr [rdx+8],rcx
fffff809`1f20b1ce 488911          mov     qword ptr [rcx],rdx
fffff809`1f20b1d1 48895008        mov     qword ptr [rax+8],rdx
fffff809`1f20b1d5 41ff4014        inc     dword ptr [r8+14h]        ;R8 == IoQueue->BypassCount, ;if DeviceCount > PeriodicMaxDeviceCount, goto 0x39
fffff809`1f20b1d9 ebc2            jmp     storport!RiEnqueueDeviceQueue+0x39 (fffff809`1f20b19d)  Branch

storport!RiEnqueueDeviceQueue+0x77:
fffff809`1f20b1db 41ff4018        inc     dword ptr [r8+18h]
fffff809`1f20b1df 8a4216          mov     al,byte ptr [rdx+16h]
fffff809`1f20b1e2 ebc0            jmp     storport!RiEnqueueDeviceQueue+0x40 (fffff809`1f20b1a4)  Branch

storport!RiEnqueueDeviceQueue+0x80:
fffff809`1f20b1e4 b903000000      mov     ecx,3
fffff809`1f20b1e9 cd29            int     29h
fffff809`1f20b1eb cc              int     3
fffff809`1f20b1ec cc              int     3
fffff809`1f20b1ed cc              int     3
fffff809`1f20b1ee cc              int     3
fffff809`1f20b1ef cc              int     3
fffff809`1f20b1f0 cc              int     3
fffff809`1f20b1f1 cc              int     3
fffff809`1f20b1f2 cc              int     3
fffff809`1f20b1f3 cc              int     3
fffff809`1f20b1f4 488bc4          mov     rax,rsp
fffff809`1f20b1f7 48895808        mov     qword ptr [rax+8],rbx
fffff809`1f20b1fb 48896810        mov     qword ptr [rax+10h],rbp
fffff809`1f20b1ff 48897018        mov     qword ptr [rax+18h],rsi
fffff809`1f20b203 48897820        mov     qword ptr [rax+20h],rdi
fffff809`1f20b207 4156            push    r14
fffff809`1f20b209 4883ec40        sub     rsp,40h
fffff809`1f20b20d 83792c00        cmp     dword ptr [rcx+2Ch],0
fffff809`1f20b211 488d7128        lea     rsi,[rcx+28h]
fffff809`1f20b215 4d8bf0          mov     r14,r8
fffff809`1f20b218 488bfa          mov     rdi,rdx
fffff809`1f20b21b 488bd9          mov     rbx,rcx
fffff809`1f20b21e 0f8fd22d0200    jg      storport!StorSubmitIoGatewayItem+0x22e02 (fffff809`1f22dff6)  Branch

storport!RiEnqueueDeviceQueue+0x22e66:
fffff809`1f22dfca 488bca          mov     rcx,rdx
fffff809`1f22dfcd e87639ffff      call    storport!RaidGetQosEntryForDeviceEntry (fffff809`1f221948)
fffff809`1f22dfd2 498b4878        mov     rcx,qword ptr [r8+78h]
fffff809`1f22dfd6 4983c070        add     r8,70h
fffff809`1f22dfda 4c3901          cmp     qword ptr [rcx],r8
fffff809`1f22dfdd 0f8501d2fdff    jne     storport!RiEnqueueDeviceQueue+0x80 (fffff809`1f20b1e4)  Branch

storport!RiEnqueueDeviceQueue+0x22e7f:
fffff809`1f22dfe3 4c8900          mov     qword ptr [rax],r8
fffff809`1f22dfe6 48894808        mov     qword ptr [rax+8],rcx
fffff809`1f22dfea 488901          mov     qword ptr [rcx],rax
fffff809`1f22dfed 49894008        mov     qword ptr [r8+8],rax
fffff809`1f22dff1 e9b6d1fdff      jmp     storport!RiEnqueueDeviceQueue+0x48 (fffff809`1f20b1ac)  Branch

storport!StorSubmitIoGatewayItem+0x30:
fffff809`1f20b224 833e00          cmp     dword ptr [rsi],0
fffff809`1f20b227 0f8fc92d0200    jg      storport!StorSubmitIoGatewayItem+0x22e02 (fffff809`1f22dff6)  Branch

storport!StorSubmitIoGatewayItem+0x39:
fffff809`1f20b22d 488d4b40        lea     rcx,[rbx+40h]
fffff809`1f20b231 e87a010000      call    storport!RaAllocateIoResource (fffff809`1f20b3b0)
fffff809`1f20b236 488bd0          mov     rdx,rax
fffff809`1f20b239 4885c0          test    rax,rax
fffff809`1f20b23c 0f84ef2d0200    je      storport!StorSubmitIoGatewayItem+0x22e3d (fffff809`1f22e031)  Branch

storport!StorSubmitIoGatewayItem+0x4e:
fffff809`1f20b242 b801000000      mov     eax,1
fffff809`1f20b247 f00fc183c0000000 lock xadd dword ptr [rbx+0C0h],eax
fffff809`1f20b24f ffc0            inc     eax
fffff809`1f20b251 3b4324          cmp     eax,dword ptr [rbx+24h]
fffff809`1f20b254 7209            jb      storport!StorSubmitIoGatewayItem+0x6b (fffff809`1f20b25f)  Branch

storport!StorSubmitIoGatewayItem+0x62:
fffff809`1f20b256 8b83c0000000    mov     eax,dword ptr [rbx+0C0h]
fffff809`1f20b25c 894324          mov     dword ptr [rbx+24h],eax

storport!StorSubmitIoGatewayItem+0x6b:
fffff809`1f20b25f 488d8240030000  lea     rax,[rdx+340h]
fffff809`1f20b266 49894618        mov     qword ptr [r14+18h],rax
fffff809`1f20b26a 488d4a20        lea     rcx,[rdx+20h]
fffff809`1f20b26e 49894e10        mov     qword ptr [r14+10h],rcx
fffff809`1f20b272 488d8240040000  lea     rax,[rdx+440h]
fffff809`1f20b279 49894608        mov     qword ptr [r14+8],rax
fffff809`1f20b27d 4c8b8a18030000  mov     r9,qword ptr [rdx+318h]
fffff809`1f20b284 448b8208030000  mov     r8d,dword ptr [rdx+308h]
fffff809`1f20b28b e824000000      call    storport!RaidZeroXrb (fffff809`1f20b2b4)
fffff809`1f20b290 32c0            xor     al,al

storport!StorSubmitIoGatewayItem+0x9e:
fffff809`1f20b292 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff809`1f20b297 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff809`1f20b29c 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff809`1f20b2a1 488b7c2468      mov     rdi,qword ptr [rsp+68h]
fffff809`1f20b2a6 4883c440        add     rsp,40h
fffff809`1f20b2aa 415e            pop     r14
fffff809`1f20b2ac c3              ret

storport!StorSubmitIoGatewayItem+0x22e02:
fffff809`1f22dff6 488d542420      lea     rdx,[rsp+20h]
fffff809`1f22dffb 48ff156e930300  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLockAtDpcLevel (fffff809`1f267370)]
fffff809`1f22e002 0f1f440000      nop     dword ptr [rax+rax]
fffff809`1f22e007 837b2c00        cmp     dword ptr [rbx+2Ch],0
fffff809`1f22e00b 0f8fd8000000    jg      storport!StorSubmitIoGatewayItem+0x22ef5 (fffff809`1f22e0e9)  Branch

storport!StorSubmitIoGatewayItem+0x22e1d:
fffff809`1f22e011 833e00          cmp     dword ptr [rsi],0
fffff809`1f22e014 0f8fcf000000    jg      storport!StorSubmitIoGatewayItem+0x22ef5 (fffff809`1f22e0e9)  Branch

storport!StorSubmitIoGatewayItem+0x22e26:
fffff809`1f22e01a 488d4c2420      lea     rcx,[rsp+20h]
fffff809`1f22e01f 48ff1552930300  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLockFromDpcLevel (fffff809`1f267378)]
fffff809`1f22e026 0f1f440000      nop     dword ptr [rax+rax]
fffff809`1f22e02b 90              nop
fffff809`1f22e02c e9fcd1fdff      jmp     storport!StorSubmitIoGatewayItem+0x39 (fffff809`1f20b22d)  Branch

storport!StorSubmitIoGatewayItem+0x22e3d:
fffff809`1f22e031 8b8390000000    mov     eax,dword ptr [rbx+90h]
fffff809`1f22e037 398388000000    cmp     dword ptr [rbx+88h],eax
fffff809`1f22e03d 731d            jae     storport!StorSubmitIoGatewayItem+0x22e68 (fffff809`1f22e05c)  Branch

storport!StorSubmitIoGatewayItem+0x22e4b:
fffff809`1f22e03f 488bcb          mov     rcx,rbx
fffff809`1f22e042 e809da0100      call    storport!RaAttemptHighWaterMarkIncrease (fffff809`1f24ba50)
fffff809`1f22e047 488d4b40        lea     rcx,[rbx+40h]
fffff809`1f22e04b e860d3fdff      call    storport!RaAllocateIoResource (fffff809`1f20b3b0)
fffff809`1f22e050 488bd0          mov     rdx,rax
fffff809`1f22e053 4885c0          test    rax,rax
fffff809`1f22e056 0f85e6d1fdff    jne     storport!StorSubmitIoGatewayItem+0x4e (fffff809`1f20b242)  Branch

storport!StorSubmitIoGatewayItem+0x22e68:
fffff809`1f22e05c 488d542420      lea     rdx,[rsp+20h]
fffff809`1f22e061 488bcb          mov     rcx,rbx
fffff809`1f22e064 48ff1505930300  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLockAtDpcLevel (fffff809`1f267370)]
fffff809`1f22e06b 0f1f440000      nop     dword ptr [rax+rax]
fffff809`1f22e070 488d4308        lea     rax,[rbx+8]
fffff809`1f22e074 488b4808        mov     rcx,qword ptr [rax+8]
fffff809`1f22e078 483901          cmp     qword ptr [rcx],rax
fffff809`1f22e07b 7579            jne     storport!StorSubmitIoGatewayItem+0x22f02 (fffff809`1f22e0f6)  Branch

storport!StorSubmitIoGatewayItem+0x22e89:
fffff809`1f22e07d 488907          mov     qword ptr [rdi],rax
fffff809`1f22e080 48894f08        mov     qword ptr [rdi+8],rcx
fffff809`1f22e084 488939          mov     qword ptr [rcx],rdi
fffff809`1f22e087 48897808        mov     qword ptr [rax+8],rdi
fffff809`1f22e08b c70601000000    mov     dword ptr [rsi],1
fffff809`1f22e091 eb0e            jmp     storport!StorSubmitIoGatewayItem+0x22ead (fffff809`1f22e0a1)  Branch

storport!StorSubmitIoGatewayItem+0x22e9f:
fffff809`1f22e093 488907          mov     qword ptr [rdi],rax
fffff809`1f22e096 48894f08        mov     qword ptr [rdi+8],rcx
fffff809`1f22e09a 488939          mov     qword ptr [rcx],rdi
fffff809`1f22e09d 48897808        mov     qword ptr [rax+8],rdi

storport!StorSubmitIoGatewayItem+0x22ead:
fffff809`1f22e0a1 ff4318          inc     dword ptr [rbx+18h]
fffff809`1f22e0a4 8a4716          mov     al,byte ptr [rdi+16h]
fffff809`1f22e0a7 a820            test    al,20h
fffff809`1f22e0a9 7426            je      storport!StorSubmitIoGatewayItem+0x22edd (fffff809`1f22e0d1)  Branch

storport!StorSubmitIoGatewayItem+0x22eb7:
fffff809`1f22e0ab 488bcf          mov     rcx,rdi
fffff809`1f22e0ae e89538ffff      call    storport!RaidGetQosEntryForDeviceEntry (fffff809`1f221948)
fffff809`1f22e0b3 4881c308010000  add     rbx,108h
fffff809`1f22e0ba 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff809`1f22e0be 483919          cmp     qword ptr [rcx],rbx
fffff809`1f22e0c1 7533            jne     storport!StorSubmitIoGatewayItem+0x22f02 (fffff809`1f22e0f6)  Branch

storport!StorSubmitIoGatewayItem+0x22ecf:
fffff809`1f22e0c3 488918          mov     qword ptr [rax],rbx
fffff809`1f22e0c6 48894808        mov     qword ptr [rax+8],rcx
fffff809`1f22e0ca 488901          mov     qword ptr [rcx],rax
fffff809`1f22e0cd 48894308        mov     qword ptr [rbx+8],rax

storport!StorSubmitIoGatewayItem+0x22edd:
fffff809`1f22e0d1 488d4c2420      lea     rcx,[rsp+20h]
fffff809`1f22e0d6 48ff159b920300  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLockFromDpcLevel (fffff809`1f267378)]
fffff809`1f22e0dd 0f1f440000      nop     dword ptr [rax+rax]
fffff809`1f22e0e2 b001            mov     al,1
fffff809`1f22e0e4 e9a9d1fdff      jmp     storport!StorSubmitIoGatewayItem+0x9e (fffff809`1f20b292)  Branch

storport!StorSubmitIoGatewayItem+0x22ef5:
fffff809`1f22e0e9 488d4308        lea     rax,[rbx+8]
fffff809`1f22e0ed 488b4808        mov     rcx,qword ptr [rax+8]
fffff809`1f22e0f1 483901          cmp     qword ptr [rcx],rax
fffff809`1f22e0f4 749d            je      storport!StorSubmitIoGatewayItem+0x22e9f (fffff809`1f22e093)  Branch

storport!StorSubmitIoGatewayItem+0x22f02:
fffff809`1f22e0f6 b903000000      mov     ecx,3
fffff809`1f22e0fb cd29            int     29h
fffff809`1f22e0fd cc              int     3
fffff809`1f22e0fe 8b4b40          mov     ecx,dword ptr [rbx+40h]
fffff809`1f22e101 be01000000      mov     esi,1
fffff809`1f22e106 3bce            cmp     ecx,esi
fffff809`1f22e108 0f86cad2fdff    jbe     storport!RaAllocateIoResource+0x28 (fffff809`1f20b3d8)  Branch

storport!RaAllocateIoResource+0x28:
fffff809`1f20b3d8 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff809`1f20b3dd 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff809`1f20b3e2 4883c420        add     rsp,20h
fffff809`1f20b3e6 5f              pop     rdi
fffff809`1f20b3e7 c3              ret

storport!RaAllocateIoResource+0x66:
fffff809`1f20b416 8938            mov     dword ptr [rax],edi
fffff809`1f20b418 ebbe            jmp     storport!RaAllocateIoResource+0x28 (fffff809`1f20b3d8)  Branch

storport!RaAllocateIoResource+0x22d5e:
fffff809`1f22e10e 4885c0          test    rax,rax
fffff809`1f22e111 0f85ffd2fdff    jne     storport!RaAllocateIoResource+0x66 (fffff809`1f20b416)  Branch

storport!RaAllocateIoResource+0x22d67:
fffff809`1f22e117 33d2            xor     edx,edx
fffff809`1f22e119 8d043e          lea     eax,[rsi+rdi]
fffff809`1f22e11c f7f1            div     eax,ecx
fffff809`1f22e11e 488b0b          mov     rcx,qword ptr [rbx]
fffff809`1f22e121 488b0cd1        mov     rcx,qword ptr [rcx+rdx*8]
fffff809`1f22e125 48ff15848f0300  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff809`1f2670b0)]
fffff809`1f22e12c 0f1f440000      nop     dword ptr [rax+rax]
fffff809`1f22e131 8b4b40          mov     ecx,dword ptr [rbx+40h]
fffff809`1f22e134 ffc6            inc     esi
fffff809`1f22e136 3bf1            cmp     esi,ecx
fffff809`1f22e138 72d4            jb      storport!RaAllocateIoResource+0x22d5e (fffff809`1f22e10e)  Branch

storport!RaAllocateIoResource+0x22d8a:
fffff809`1f22e13a 4885c0          test    rax,rax
fffff809`1f22e13d 0f8495d2fdff    je      storport!RaAllocateIoResource+0x28 (fffff809`1f20b3d8)  Branch

storport!RaAllocateIoResource+0x22d93:
fffff809`1f22e143 e9ced2fdff      jmp     storport!RaAllocateIoResource+0x66 (fffff809`1f20b416)  Branch
