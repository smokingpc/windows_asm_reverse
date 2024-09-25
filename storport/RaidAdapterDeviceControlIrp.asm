50: kd> uf RaidAdapterDeviceControlIrp
storport!RaidAdapterDeviceControlIrp:
fffff803`8bc32eec 4c8bdc          mov     r11,rsp
fffff803`8bc32eef 49895b18        mov     qword ptr [r11+18h],rbx
fffff803`8bc32ef3 49896b20        mov     qword ptr [r11+20h],rbp
fffff803`8bc32ef7 56              push    rsi
fffff803`8bc32ef8 57              push    rdi
fffff803`8bc32ef9 4154            push    r12
fffff803`8bc32efb 4883ec60        sub     rsp,60h
fffff803`8bc32eff 488b058ae30500  mov     rax,qword ptr [storport!_security_cookie (fffff803`8bc91290)]
fffff803`8bc32f06 4833c4          xor     rax,rsp
fffff803`8bc32f09 4889442450      mov     qword ptr [rsp+50h],rax
fffff803`8bc32f0e 33c0            xor     eax,eax
fffff803`8bc32f10 488bda          mov     rbx,rdx   ;IRP
fffff803`8bc32f13 498943c8        mov     qword ptr [r11-38h],rax
fffff803`8bc32f17 488bf1          mov     rsi,rcx   ;AdapterExt
fffff803`8bc32f1a 498943d0        mov     qword ptr [r11-30h],rax
fffff803`8bc32f1e e851320000      call    storport!RaidAcquireAdapterRemoveLock (fffff803`8bc36174)
fffff803`8bc32f23 803d66e9050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff803`8bc91890)],0
fffff803`8bc32f2a 8bf8            mov     edi,eax
fffff803`8bc32f2c 488b8bb8000000  mov     rcx,qword ptr [rbx+0B8h]      ;irp->Tail.Overlay.CurrentStackLocation
fffff803`8bc32f33 8b6918          mov     ebp,dword ptr [rcx+18h]       ;irpsp->Paramter.DeviceIoControl.IoControlCode
fffff803`8bc32f36 744c            je      storport!RaidAdapterDeviceControlIrp+0x98 (fffff803`8bc32f84)  Branch

storport!RaidAdapterDeviceControlIrp+0x4c:
fffff803`8bc32f38 488d542440      lea     rdx,[rsp+40h]
fffff803`8bc32f3d 488bcb          mov     rcx,rbx
fffff803`8bc32f40 48ff1509420600  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff803`8bc97150)]
fffff803`8bc32f47 0f1f440000      nop     dword ptr [rax+rax]
fffff803`8bc32f4c 8d8dec2ffbff    lea     ecx,[rbp-4D014h]
fffff803`8bc32f52 83f934          cmp     ecx,34h
fffff803`8bc32f55 7714            ja      storport!RaidAdapterDeviceControlIrp+0x7f (fffff803`8bc32f6b)  Branch

storport!RaidAdapterDeviceControlIrp+0x6b:
fffff803`8bc32f57 48b80100001100001100 mov rax,11000011000001h
fffff803`8bc32f61 480fa3c8        bt      rax,rcx
fffff803`8bc32f65 0f8237010000    jb      storport!RaidAdapterDeviceControlIrp+0x1b6 (fffff803`8bc330a2)  Branch

storport!RaidAdapterDeviceControlIrp+0x7f:
fffff803`8bc32f6b 81fd04d00400    cmp     ebp,4D004h    ;if IOCTL code == IOCTL_SCSI_PASS_THROUGH, goto 0x1b6
fffff803`8bc32f71 0f842b010000    je      storport!RaidAdapterDeviceControlIrp+0x1b6 (fffff803`8bc330a2)  Branch

storport!RaidAdapterDeviceControlIrp+0x8b:
fffff803`8bc32f77 f60564e8050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff803`8bc917e2)],2
fffff803`8bc32f7e 0f85409b0200    jne     storport!RaidAdapterDeviceControlIrp+0x29bd8 (fffff803`8bc5cac4)  Branch

storport!RaidAdapterDeviceControlIrp+0x98:
fffff803`8bc32f84 85ff            test    edi,edi
fffff803`8bc32f86 0f888f9b0200    js      storport!RaidAdapterDeviceControlIrp+0x29c2f (fffff803`8bc5cb1b)  Branch

storport!RaidAdapterDeviceControlIrp+0xa0:
fffff803`8bc32f8c 4c8b156de00500  mov     r10,qword ptr [storport!WPP_GLOBAL_Control (fffff803`8bc91000)]
fffff803`8bc32f93 4c8d2566e00500  lea     r12,[storport!WPP_GLOBAL_Control (fffff803`8bc91000)]
fffff803`8bc32f9a 4d3bd4          cmp     r10,r12
fffff803`8bc32f9d 740c            je      storport!RaidAdapterDeviceControlIrp+0xbf (fffff803`8bc32fab)  Branch

storport!RaidAdapterDeviceControlIrp+0xb3:
fffff803`8bc32f9f 418b422c        mov     eax,dword ptr [r10+2Ch]
fffff803`8bc32fa3 a810            test    al,10h
fffff803`8bc32fa5 0f85889b0200    jne     storport!RaidAdapterDeviceControlIrp+0x29c47 (fffff803`8bc5cb33)  Branch

storport!RaidAdapterDeviceControlIrp+0xbf:
fffff803`8bc32fab b8001c2d00      mov     eax,2D1C00h       ;IOCTL_STORAGE_FIRMWARE_GET_INFO
fffff803`8bc32fb0 3be8            cmp     ebp,eax
fffff803`8bc32fb2 0f870f010000    ja      storport!RaidAdapterDeviceControlIrp+0x1db (fffff803`8bc330c7)  Branch

storport!RaidAdapterDeviceControlIrp+0xcc:
fffff803`8bc32fb8 0f84539c0200    je      storport!RaidAdapterDeviceControlIrp+0x29d25 (fffff803`8bc5cc11)  Branch

storport!RaidAdapterDeviceControlIrp+0xd2:
fffff803`8bc32fbe b814d00400      mov     eax,4D014h    ;IOCTL_SCSI_PASS_THROUGH_DIRECT / IOCTL_SCSI_MINIPORT / IOCTL_SCSI_PASS_THROUGH
fffff803`8bc32fc3 3be8            cmp     ebp,eax
fffff803`8bc32fc5 0f8685000000    jbe     storport!RaidAdapterDeviceControlIrp+0x164 (fffff803`8bc33050)  Branch

storport!RaidAdapterDeviceControlIrp+0xdf:
fffff803`8bc32fcb 8bc5            mov     eax,ebp
fffff803`8bc32fcd 2d38d00400      sub     eax,4D038h    ;IOCTL_MINIPORT_PROCESS_SERVICE_IRP
fffff803`8bc32fd2 0f84289c0200    je      storport!RaidAdapterDeviceControlIrp+0x29d14 (fffff803`8bc5cc00)  Branch

storport!RaidAdapterDeviceControlIrp+0xec:
fffff803`8bc32fd8 83e80c          sub     eax,0Ch       ;IOCTL_SCSI_PASS_THROUGH_EX
fffff803`8bc32fdb 0f843b010000    je      storport!RaidAdapterDeviceControlIrp+0x230 (fffff803`8bc3311c)  Branch

storport!RaidAdapterDeviceControlIrp+0xf5:
fffff803`8bc32fe1 83e804          sub     eax,4     ;IOCTL_SCSI_PASS_THROUGH_DIRECT_EX
fffff803`8bc32fe4 0f84ca000000    je      storport!RaidAdapterDeviceControlIrp+0x1c8 (fffff803`8bc330b4)  Branch

storport!RaidAdapterDeviceControlIrp+0xfe:
fffff803`8bc32fea 2db8432800      sub     eax,2843B8h   ;IOCTL_STORAGE_QUERY_PROPERTY
fffff803`8bc32fef 0f85ef9b0200    jne     storport!RaidAdapterDeviceControlIrp+0x29cf8 (fffff803`8bc5cbe4)  Branch

storport!RaidAdapterDeviceControlIrp+0x109:
fffff803`8bc32ff5 488bd3          mov     rdx,rbx
fffff803`8bc32ff8 488bce          mov     rcx,rsi
fffff803`8bc32ffb e8dc700600      call    storport!RaidAdapterStorageQueryPropertyIoctl (fffff803`8bc9a0dc)

storport!RaidAdapterDeviceControlIrp+0x114:
fffff803`8bc33000 488b8e10010000  mov     rcx,qword ptr [rsi+110h]
fffff803`8bc33007 8bf8            mov     edi,eax
fffff803`8bc33009 48ff1580420600  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff803`8bc97290)]
fffff803`8bc33010 0f1f440000      nop     dword ptr [rax+rax]
fffff803`8bc33015 488b0de4df0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`8bc91000)]
fffff803`8bc3301c 493bcc          cmp     rcx,r12
fffff803`8bc3301f 740b            je      storport!RaidAdapterDeviceControlIrp+0x140 (fffff803`8bc3302c)  Branch

storport!RaidAdapterDeviceControlIrp+0x135:
fffff803`8bc33021 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff803`8bc33024 a810            test    al,10h
fffff803`8bc33026 0f85e99c0200    jne     storport!RaidAdapterDeviceControlIrp+0x29e29 (fffff803`8bc5cd15)  Branch

storport!RaidAdapterDeviceControlIrp+0x140:
fffff803`8bc3302c 8bc7            mov     eax,edi

storport!RaidAdapterDeviceControlIrp+0x142:
fffff803`8bc3302e 488b4c2450      mov     rcx,qword ptr [rsp+50h]
fffff803`8bc33033 4833cc          xor     rcx,rsp
fffff803`8bc33036 e8252d0200      call    storport!_security_check_cookie (fffff803`8bc55d60)
fffff803`8bc3303b 4c8d5c2460      lea     r11,[rsp+60h]
fffff803`8bc33040 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff803`8bc33044 498b6b38        mov     rbp,qword ptr [r11+38h]
fffff803`8bc33048 498be3          mov     rsp,r11
fffff803`8bc3304b 415c            pop     r12
fffff803`8bc3304d 5f              pop     rdi
fffff803`8bc3304e 5e              pop     rsi
fffff803`8bc3304f c3              ret

storport!RaidAdapterDeviceControlIrp+0x164:
fffff803`8bc33050 7462            je      storport!RaidAdapterDeviceControlIrp+0x1c8 (fffff803`8bc330b4)  Branch

storport!RaidAdapterDeviceControlIrp+0x166:
fffff803`8bc33052 8bc5            mov     eax,ebp
fffff803`8bc33054 2d0c100400      sub     eax,4100Ch    ;IOCTL_SCSI_GET_INQUIRY_DATA
fffff803`8bc33059 0f84749b0200    je      storport!RaidAdapterDeviceControlIrp+0x29ce7 (fffff803`8bc5cbd3)  Branch

storport!RaidAdapterDeviceControlIrp+0x173:
fffff803`8bc3305f 83e804          sub     eax,4         ;IOCTL_SCSI_GET_CAPABILITIES
fffff803`8bc33062 0f845a9b0200    je      storport!RaidAdapterDeviceControlIrp+0x29cd6 (fffff803`8bc5cbc2)  Branch

storport!RaidAdapterDeviceControlIrp+0x17c:
fffff803`8bc33068 83e808          sub     eax,8         ;IOCTL_SCSI_GET_ADDRESS
fffff803`8bc3306b 0f84409b0200    je      storport!RaidAdapterDeviceControlIrp+0x29cc5 (fffff803`8bc5cbb1)  Branch

storport!RaidAdapterDeviceControlIrp+0x185:
fffff803`8bc33071 83e804          sub     eax,4         ;goto 0x29c8d if (ioctl != IOCTL_SCSI_RESCAN_BUS)
fffff803`8bc33074 0f85ff9a0200    jne     storport!RaidAdapterDeviceControlIrp+0x29c8d (fffff803`8bc5cb79)  Branch

storport!RaidAdapterDeviceControlIrp+0x18e:             ;IOCTL_SCSI_RESCAN_BUS
fffff803`8bc3307a 488b4e20        mov     rcx,qword ptr [rsi+20h]
fffff803`8bc3307e 33d2            xor     edx,edx
fffff803`8bc33080 c6466a01        mov     byte ptr [rsi+6Ah],1
fffff803`8bc33084 48ff152d420600  call    qword ptr [storport!_imp_IoInvalidateDeviceRelations (fffff803`8bc972b8)]
fffff803`8bc3308b 0f1f440000      nop     dword ptr [rax+rax]
fffff803`8bc33090 4533c0          xor     r8d,r8d

storport!RaidAdapterDeviceControlIrp+0x1a7:
fffff803`8bc33093 33d2            xor     edx,edx
fffff803`8bc33095 488bcb          mov     rcx,rbx
fffff803`8bc33098 e8d3780000      call    storport!RaidCompleteRequestEx (fffff803`8bc3a970)
fffff803`8bc3309d e95effffff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x1b6:
fffff803`8bc330a2 f6053ae7050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff803`8bc917e3)],1
fffff803`8bc330a9 0f84d5feffff    je      storport!RaidAdapterDeviceControlIrp+0x98 (fffff803`8bc32f84)  Branch

storport!RaidAdapterDeviceControlIrp+0x1c3:
fffff803`8bc330af e9339a0200      jmp     storport!RaidAdapterDeviceControlIrp+0x29bfb (fffff803`8bc5cae7)  Branch

storport!RaidAdapterDeviceControlIrp+0x1c8:
fffff803`8bc330b4 41b001          mov     r8b,1

storport!RaidAdapterDeviceControlIrp+0x1cb:
fffff803`8bc330b7 488bd3          mov     rdx,rbx
fffff803`8bc330ba 488bce          mov     rcx,rsi
fffff803`8bc330bd e81eba0600      call    storport!RaidAdapterPassThrough (fffff803`8bc9eae0)
fffff803`8bc330c2 e939ffffff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x1db:
fffff803`8bc330c7 b800d22d00      mov     eax,2DD200h   ;IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD
fffff803`8bc330cc 3be8            cmp     ebp,eax
fffff803`8bc330ce 0f864e9b0200    jbe     storport!RaidAdapterDeviceControlIrp+0x29d36 (fffff803`8bc5cc22)  Branch

storport!RaidAdapterDeviceControlIrp+0x1e8:
fffff803`8bc330d4 8bc5            mov     eax,ebp
fffff803`8bc330d6 2dc0d32d00      sub     eax,2DD3C0h   ;IOCTL_STORAGE_PROTOCOL_COMMAND
fffff803`8bc330db 0f84239c0200    je      storport!RaidAdapterDeviceControlIrp+0x29e18 (fffff803`8bc5cd04)  Branch

storport!RaidAdapterDeviceControlIrp+0x1f5:
fffff803`8bc330e1 2dc4020000      sub     eax,2C4h
fffff803`8bc330e6 0f84079c0200    je      storport!RaidAdapterDeviceControlIrp+0x29e07 (fffff803`8bc5ccf3)  Branch

storport!RaidAdapterDeviceControlIrp+0x200:
fffff803`8bc330ec 2d80050000      sub     eax,580h      ;IOCTL_STORAGE_FIRMWARE_DOWNLOAD
fffff803`8bc330f1 0f84eb9b0200    je      storport!RaidAdapterDeviceControlIrp+0x29df6 (fffff803`8bc5cce2)  Branch

storport!RaidAdapterDeviceControlIrp+0x20b:
fffff803`8bc330f7 83e804          sub     eax,4         ;IOCTL_STORAGE_FIRMWARE_ACTIVATE
fffff803`8bc330fa 0f84d19b0200    je      storport!RaidAdapterDeviceControlIrp+0x29de5 (fffff803`8bc5ccd1)  Branch

storport!RaidAdapterDeviceControlIrp+0x214:
fffff803`8bc33100 3df8e30400      cmp     eax,4E3F8h    ;IOCTL_ACPI_ASYNC_EVAL_METHOD??
fffff803`8bc33105 0f85bb9b0200    jne     storport!RaidAdapterDeviceControlIrp+0x29dda (fffff803`8bc5ccc6)  Branch

storport!RaidAdapterDeviceControlIrp+0x21f:
fffff803`8bc3310b 488b4e18        mov     rcx,qword ptr [rsi+18h]   ;RCX = AdapterExt->LowerDeviceObject
fffff803`8bc3310f 488bd3          mov     rdx,rbx
fffff803`8bc33112 e8790c0100      call    storport!RaForwardIrp (fffff803`8bc43d90)
fffff803`8bc33117 e9e4feffff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x230:
fffff803`8bc3311c 4533c0          xor     r8d,r8d
fffff803`8bc3311f eb96            jmp     storport!RaidAdapterDeviceControlIrp+0x1cb (fffff803`8bc330b7)  Branch

storport!RaidAdapterDeviceControlIrp+0x29bd8:
fffff803`8bc5cac4 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff803`8bc5cacb 896c2430        mov     dword ptr [rsp+30h],ebp
fffff803`8bc5cacf 0fb610          movzx   edx,byte ptr [rax]
fffff803`8bc5cad2 0fb64801        movzx   ecx,byte ptr [rax+1]
fffff803`8bc5cad6 894c2428        mov     dword ptr [rsp+28h],ecx
fffff803`8bc5cada 89542420        mov     dword ptr [rsp+20h],edx
fffff803`8bc5cade 488d15c3d70200  lea     rdx,[storport!EventIOCTL (fffff803`8bc8a2a8)]
fffff803`8bc5cae5 eb21            jmp     storport!RaidAdapterDeviceControlIrp+0x29c1c (fffff803`8bc5cb08)  Branch

storport!RaidAdapterDeviceControlIrp+0x29bfb:
fffff803`8bc5cae7 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff803`8bc5caee 896c2430        mov     dword ptr [rsp+30h],ebp
fffff803`8bc5caf2 0fb610          movzx   edx,byte ptr [rax]
fffff803`8bc5caf5 0fb64801        movzx   ecx,byte ptr [rax+1]
fffff803`8bc5caf9 894c2428        mov     dword ptr [rsp+28h],ecx
fffff803`8bc5cafd 89542420        mov     dword ptr [rsp+20h],edx
fffff803`8bc5cb01 488d1520da0200  lea     rdx,[storport!EventPassThrough (fffff803`8bc8a528)]

storport!RaidAdapterDeviceControlIrp+0x29c1c:
fffff803`8bc5cb08 4c8bcb          mov     r9,rbx
fffff803`8bc5cb0b 4c8d442440      lea     r8,[rsp+40h]
fffff803`8bc5cb10 e8fb970000      call    storport!McTemplateK0pddd (fffff803`8bc66310)
fffff803`8bc5cb15 90              nop
fffff803`8bc5cb16 e96964fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x98 (fffff803`8bc32f84)  Branch

storport!RaidAdapterDeviceControlIrp+0x29c2f:
fffff803`8bc5cb1b 4883633800      and     qword ptr [rbx+38h],0
fffff803`8bc5cb20 448bc7          mov     r8d,edi
fffff803`8bc5cb23 33d2            xor     edx,edx
fffff803`8bc5cb25 488bcb          mov     rcx,rbx
fffff803`8bc5cb28 e843defdff      call    storport!RaidCompleteRequestEx (fffff803`8bc3a970)
fffff803`8bc5cb2d 90              nop
fffff803`8bc5cb2e e9fb64fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x142 (fffff803`8bc3302e)  Branch

storport!RaidAdapterDeviceControlIrp+0x29c47:
fffff803`8bc5cb33 41807a2904      cmp     byte ptr [r10+29h],4
fffff803`8bc5cb38 0f826d64fdff    jb      storport!RaidAdapterDeviceControlIrp+0xbf (fffff803`8bc32fab)  Branch

storport!RaidAdapterDeviceControlIrp+0x29c52:
fffff803`8bc5cb3e 8bcd            mov     ecx,ebp
fffff803`8bc5cb40 4c8d05718d0200  lea     r8,[storport!WPP_0e11a8d225a936f45e9b3e6eeadbaef4_Traceguids (fffff803`8bc858b8)]
fffff803`8bc5cb47 c1e902          shr     ecx,2
fffff803`8bc5cb4a 8bc5            mov     eax,ebp
fffff803`8bc5cb4c 81e1ff0f0000    and     ecx,0FFFh
fffff803`8bc5cb52 c1e810          shr     eax,10h
fffff803`8bc5cb55 894c2430        mov     dword ptr [rsp+30h],ecx
fffff803`8bc5cb59 ba0a000000      mov     edx,0Ah
fffff803`8bc5cb5e 498b4a18        mov     rcx,qword ptr [r10+18h]
fffff803`8bc5cb62 4c8bce          mov     r9,rsi
fffff803`8bc5cb65 89442428        mov     dword ptr [rsp+28h],eax
fffff803`8bc5cb69 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff803`8bc5cb6e e865ee0000      call    storport!WPP_SF_qqDD (fffff803`8bc6b9d8)
fffff803`8bc5cb73 90              nop
fffff803`8bc5cb74 e93264fdff      jmp     storport!RaidAdapterDeviceControlIrp+0xbf (fffff803`8bc32fab)  Branch

storport!RaidAdapterDeviceControlIrp+0x29c8d:
fffff803`8bc5cb79 2de8bf0000      sub     eax,0BFE8h;??   IOCTL_SCSI_RESCAN_BUS - 0bfe8?
fffff803`8bc5cb7e 0f849865fdff    je      storport!RaidAdapterDeviceControlIrp+0x230 (fffff803`8bc3311c)  Branch

storport!RaidAdapterDeviceControlIrp+0x29c98:
fffff803`8bc5cb84 83f804          cmp     eax,4     ;??
fffff803`8bc5cb87 0f8539010000    jne     storport!RaidAdapterDeviceControlIrp+0x29dda (fffff803`8bc5ccc6)  Branch

storport!RaidAdapterDeviceControlIrp+0x29ca1:
fffff803`8bc5cb8d c744242802000000 mov     dword ptr [rsp+28h],2
fffff803`8bc5cb95 4533c9          xor     r9d,r9d
fffff803`8bc5cb98 8364242000      and     dword ptr [rsp+20h],0
fffff803`8bc5cb9d 4533c0          xor     r8d,r8d
fffff803`8bc5cba0 488bd3          mov     rdx,rbx
fffff803`8bc5cba3 488bce          mov     rcx,rsi
fffff803`8bc5cba6 e8e9ecfdff      call    storport!RaidAdapterScsiMiniportIoctlWithAddress (fffff803`8bc3b894)
fffff803`8bc5cbab 90              nop
fffff803`8bc5cbac e94f64fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29cc5:
fffff803`8bc5cbb1 488bd3          mov     rdx,rbx
fffff803`8bc5cbb4 488bce          mov     rcx,rsi
fffff803`8bc5cbb7 e8d8c60000      call    storport!RaidAdapterScsiGetAddressIoctl (fffff803`8bc69294)
fffff803`8bc5cbbc 90              nop
fffff803`8bc5cbbd e93e64fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29cd6:
fffff803`8bc5cbc2 488bd3          mov     rdx,rbx
fffff803`8bc5cbc5 488bce          mov     rcx,rsi
fffff803`8bc5cbc8 e81fc70000      call    storport!RaidAdapterScsiGetCapabilitiesIoctl (fffff803`8bc692ec)
fffff803`8bc5cbcd 90              nop
fffff803`8bc5cbce e92d64fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29ce7:
fffff803`8bc5cbd3 488bd3          mov     rdx,rbx
fffff803`8bc5cbd6 488bce          mov     rcx,rsi
fffff803`8bc5cbd9 e886c70000      call    storport!RaidAdapterScsiGetInquiryDataIoctl (fffff803`8bc69364)
fffff803`8bc5cbde 90              nop
fffff803`8bc5cbdf e91c64fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29cf8:
fffff803`8bc5cbe4 3d80020000      cmp     eax,280h
fffff803`8bc5cbe9 0f85d7000000    jne     storport!RaidAdapterDeviceControlIrp+0x29dda (fffff803`8bc5ccc6)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d03:
fffff803`8bc5cbef 488bd3          mov     rdx,rbx
fffff803`8bc5cbf2 488bce          mov     rcx,rsi
fffff803`8bc5cbf5 e802ba0000      call    storport!RaidAdapterQueryBootLunsIoctl (fffff803`8bc685fc)
fffff803`8bc5cbfa 90              nop
fffff803`8bc5cbfb e90064fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d14:
fffff803`8bc5cc00 488bd3          mov     rdx,rbx
fffff803`8bc5cc03 488bce          mov     rcx,rsi
fffff803`8bc5cc06 e8d5b50000      call    storport!RaidAdapterMiniportProcessServiceRequest (fffff803`8bc681e0)
fffff803`8bc5cc0b 90              nop
fffff803`8bc5cc0c e91d64fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x142 (fffff803`8bc3302e)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d25:
fffff803`8bc5cc11 488bd3          mov     rdx,rbx
fffff803`8bc5cc14 488bce          mov     rcx,rsi
fffff803`8bc5cc17 e840b30000      call    storport!RaidAdapterHwFirmwareGetInfoIoctl (fffff803`8bc67f5c)
fffff803`8bc5cc1c 90              nop
fffff803`8bc5cc1d e9de63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d36:
fffff803`8bc5cc22 0f848d000000    je      storport!RaidAdapterDeviceControlIrp+0x29dc9 (fffff803`8bc5ccb5)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d3c:
fffff803`8bc5cc28 8bc5            mov     eax,ebp
fffff803`8bc5cc2a 2d941c2d00      sub     eax,2D1C94h
fffff803`8bc5cc2f 7473            je      storport!RaidAdapterDeviceControlIrp+0x29db8 (fffff803`8bc5cca4)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d45:
fffff803`8bc5cc31 83e804          sub     eax,4
fffff803`8bc5cc34 745d            je      storport!RaidAdapterDeviceControlIrp+0x29da7 (fffff803`8bc5cc93)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d4a:
fffff803`8bc5cc36 83e808          sub     eax,8
fffff803`8bc5cc39 7447            je      storport!RaidAdapterDeviceControlIrp+0x29d96 (fffff803`8bc5cc82)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d4f:
fffff803`8bc5cc3b 2d60330000      sub     eax,3360h
fffff803`8bc5cc40 7416            je      storport!RaidAdapterDeviceControlIrp+0x29d6c (fffff803`8bc5cc58)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d56:
fffff803`8bc5cc42 83f814          cmp     eax,14h
fffff803`8bc5cc45 757f            jne     storport!RaidAdapterDeviceControlIrp+0x29dda (fffff803`8bc5ccc6)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d5b:
fffff803`8bc5cc47 488bd3          mov     rdx,rbx
fffff803`8bc5cc4a 488bce          mov     rcx,rsi
fffff803`8bc5cc4d e876d50000      call    storport!RaidAdapterStorageBreakReservationIoctl (fffff803`8bc6a1c8)
fffff803`8bc5cc52 90              nop
fffff803`8bc5cc53 e9a863fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d6c:
fffff803`8bc5cc58 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff803`8bc5cc5f 83781001        cmp     dword ptr [rax+10h],1
fffff803`8bc5cc63 7307            jae     storport!RaidAdapterDeviceControlIrp+0x29d80 (fffff803`8bc5cc6c)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d79:
fffff803`8bc5cc65 b80d0000c0      mov     eax,0C000000Dh
fffff803`8bc5cc6a eb0e            jmp     storport!RaidAdapterDeviceControlIrp+0x29d8e (fffff803`8bc5cc7a)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d80:
fffff803`8bc5cc6c 488b4318        mov     rax,qword ptr [rbx+18h]
fffff803`8bc5cc70 488bce          mov     rcx,rsi
fffff803`8bc5cc73 8a10            mov     dl,byte ptr [rax]
fffff803`8bc5cc75 e88abf0000      call    storport!RaidAdapterResetBus (fffff803`8bc68c04)

storport!RaidAdapterDeviceControlIrp+0x29d8e:
fffff803`8bc5cc7a 448bc0          mov     r8d,eax
fffff803`8bc5cc7d e91164fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x1a7 (fffff803`8bc33093)  Branch

storport!RaidAdapterDeviceControlIrp+0x29d96:
fffff803`8bc5cc82 488bd3          mov     rdx,rbx
fffff803`8bc5cc85 488bce          mov     rcx,rsi
fffff803`8bc5cc88 e8ff600400      call    storport!RaidAdapterDiagnosticIoctl (fffff803`8bca2d8c)
fffff803`8bc5cc8d 90              nop
fffff803`8bc5cc8e e96d63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29da7:
fffff803`8bc5cc93 488bd3          mov     rdx,rbx
fffff803`8bc5cc96 488bce          mov     rcx,rsi
fffff803`8bc5cc99 e81ac30000      call    storport!RaidAdapterRpmbRequest (fffff803`8bc68fb8)
fffff803`8bc5cc9e 90              nop
fffff803`8bc5cc9f e95c63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29db8:
fffff803`8bc5cca4 488bd3          mov     rdx,rbx
fffff803`8bc5cca7 488bce          mov     rcx,rsi
fffff803`8bc5ccaa e865b60000      call    storport!RaidAdapterPowerCapIoctl (fffff803`8bc68314)
fffff803`8bc5ccaf 90              nop
fffff803`8bc5ccb0 e94b63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29dc9:
fffff803`8bc5ccb5 488bd3          mov     rdx,rbx
fffff803`8bc5ccb8 488bce          mov     rcx,rsi
fffff803`8bc5ccbb e8fc9e0000      call    storport!RaAdapterSetTemperatureThresholdIoctl (fffff803`8bc66bbc)
fffff803`8bc5ccc0 90              nop
fffff803`8bc5ccc1 e93a63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29dda:
fffff803`8bc5ccc6 41b8bb0000c0    mov     r8d,0C00000BBh
fffff803`8bc5cccc e9c263fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x1a7 (fffff803`8bc33093)  Branch

storport!RaidAdapterDeviceControlIrp+0x29de5:
fffff803`8bc5ccd1 488bd3          mov     rdx,rbx
fffff803`8bc5ccd4 488bce          mov     rcx,rsi
fffff803`8bc5ccd7 e8d0af0000      call    storport!RaidAdapterHwFirmwareActivateIoctl (fffff803`8bc67cac)
fffff803`8bc5ccdc 90              nop
fffff803`8bc5ccdd e91e63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29df6:
fffff803`8bc5cce2 488bd3          mov     rdx,rbx
fffff803`8bc5cce5 488bce          mov     rcx,rsi
fffff803`8bc5cce8 e8b7b00000      call    storport!RaidAdapterHwFirmwareDownloadIoctl (fffff803`8bc67da4)
fffff803`8bc5cced 90              nop
fffff803`8bc5ccee e90d63fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29e07:
fffff803`8bc5ccf3 488bd3          mov     rdx,rbx
fffff803`8bc5ccf6 488bce          mov     rcx,rsi
fffff803`8bc5ccf9 e88ad30000      call    storport!RaidAdapterSetBootLunIoctl (fffff803`8bc6a088)
fffff803`8bc5ccfe 90              nop
fffff803`8bc5ccff e9fc62fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29e18:
fffff803`8bc5cd04 488bd3          mov     rdx,rbx
fffff803`8bc5cd07 488bce          mov     rcx,rsi
fffff803`8bc5cd0a e81d9e0000      call    storport!RaAdapterProtocolCommandIoctl (fffff803`8bc66b2c)
fffff803`8bc5cd0f 90              nop
fffff803`8bc5cd10 e9eb62fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x114 (fffff803`8bc33000)  Branch

storport!RaidAdapterDeviceControlIrp+0x29e29:
fffff803`8bc5cd15 80792904        cmp     byte ptr [rcx+29h],4
fffff803`8bc5cd19 0f820d63fdff    jb      storport!RaidAdapterDeviceControlIrp+0x140 (fffff803`8bc3302c)  Branch

storport!RaidAdapterDeviceControlIrp+0x29e33:
fffff803`8bc5cd1f 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`8bc5cd23 4c8d058e8b0200  lea     r8,[storport!WPP_0e11a8d225a936f45e9b3e6eeadbaef4_Traceguids (fffff803`8bc858b8)]
fffff803`8bc5cd2a 897c2430        mov     dword ptr [rsp+30h],edi
fffff803`8bc5cd2e ba0b000000      mov     edx,0Bh
fffff803`8bc5cd33 896c2428        mov     dword ptr [rsp+28h],ebp
fffff803`8bc5cd37 4c8bce          mov     r9,rsi
fffff803`8bc5cd3a 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff803`8bc5cd3f e894ec0000      call    storport!WPP_SF_qqDD (fffff803`8bc6b9d8)
fffff803`8bc5cd44 90              nop
fffff803`8bc5cd45 e9e262fdff      jmp     storport!RaidAdapterDeviceControlIrp+0x140 (fffff803`8bc3302c)  Branch
