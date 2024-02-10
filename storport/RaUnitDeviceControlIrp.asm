1: kd> uf storport!RaUnitDeviceControlIrp
storport!RaUnitDeviceControlIrp:
fffff807`3da1a4e4 4c8bdc          mov     r11,rsp
fffff807`3da1a4e7 49895b18        mov     qword ptr [r11+18h],rbx
fffff807`3da1a4eb 49896b20        mov     qword ptr [r11+20h],rbp
fffff807`3da1a4ef 56              push    rsi
fffff807`3da1a4f0 57              push    rdi
fffff807`3da1a4f1 4157            push    r15
fffff807`3da1a4f3 4883ec60        sub     rsp,60h
fffff807`3da1a4f7 488b05923d0500  mov     rax,qword ptr [storport!_security_cookie (fffff807`3da6e290)]
fffff807`3da1a4fe 4833c4          xor     rax,rsp
fffff807`3da1a501 4889442450      mov     qword ptr [rsp+50h],rax
fffff807`3da1a506 33c0            xor     eax,eax
fffff807`3da1a508 33ff            xor     edi,edi
fffff807`3da1a50a 498943c8        mov     qword ptr [r11-38h],rax
fffff807`3da1a50e 488bda          mov     rbx,rdx
fffff807`3da1a511 498943d0        mov     qword ptr [r11-30h],rax
fffff807`3da1a515 488bf1          mov     rsi,rcx
fffff807`3da1a518 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff807`3da1a51f 8b6818          mov     ebp,dword ptr [rax+18h]
fffff807`3da1a522 81fd0c192d00    cmp     ebp,2D190Ch
fffff807`3da1a528 0f844c2c0200    je      storport!RaUnitDeviceControlIrp+0x22c96 (fffff807`3da3d17a)  Branch

storport!RaUnitDeviceControlIrp+0x4a:
fffff807`3da1a52e 40383d2b430500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff807`3da6e860)],dil
fffff807`3da1a535 744b            je      storport!RaUnitDeviceControlIrp+0x9e (fffff807`3da1a582)  Branch

storport!RaUnitDeviceControlIrp+0x53:
fffff807`3da1a537 498d53c8        lea     rdx,[r11-38h]
fffff807`3da1a53b 488bcb          mov     rcx,rbx
fffff807`3da1a53e 48ff150b9c0500  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff807`3da74150)]
fffff807`3da1a545 0f1f440000      nop     dword ptr [rax+rax]
fffff807`3da1a54a 8d85ec2ffbff    lea     eax,[rbp-4D014h]
fffff807`3da1a550 83f834          cmp     eax,34h
fffff807`3da1a553 7714            ja      storport!RaUnitDeviceControlIrp+0x85 (fffff807`3da1a569)  Branch

storport!RaUnitDeviceControlIrp+0x71:
fffff807`3da1a555 48b90100001100001100 mov rcx,11000011000001h
fffff807`3da1a55f 480fa3c1        bt      rcx,rax
fffff807`3da1a563 0f8233020000    jb      storport!RaUnitDeviceControlIrp+0x2b8 (fffff807`3da1a79c)  Branch

storport!RaUnitDeviceControlIrp+0x85:
fffff807`3da1a569 81fd04d00400    cmp     ebp,4D004h
fffff807`3da1a56f 0f8427020000    je      storport!RaUnitDeviceControlIrp+0x2b8 (fffff807`3da1a79c)  Branch

storport!RaUnitDeviceControlIrp+0x91:
fffff807`3da1a575 f6054642050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff807`3da6e7c2)],2
fffff807`3da1a57c 0f85472c0200    jne     storport!RaUnitDeviceControlIrp+0x22ce5 (fffff807`3da3d1c9)  Branch

storport!RaUnitDeviceControlIrp+0x9e:
fffff807`3da1a582 41b001          mov     r8b,1
fffff807`3da1a585 488bd3          mov     rdx,rbx
fffff807`3da1a588 488bce          mov     rcx,rsi
fffff807`3da1a58b e80c030000      call    storport!RaUnitAcquireRemoveLock (fffff807`3da1a89c)
fffff807`3da1a590 85c0            test    eax,eax
fffff807`3da1a592 0f88882c0200    js      storport!RaUnitDeviceControlIrp+0x22d3c (fffff807`3da3d220)  Branch

storport!RaUnitDeviceControlIrp+0xb4:
fffff807`3da1a598 488b0d613a0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff807`3da6e000)]
fffff807`3da1a59f 4c8d3d5a3a0500  lea     r15,[storport!WPP_GLOBAL_Control (fffff807`3da6e000)]
fffff807`3da1a5a6 493bcf          cmp     rcx,r15
fffff807`3da1a5a9 740b            je      storport!RaUnitDeviceControlIrp+0xd2 (fffff807`3da1a5b6)  Branch

storport!RaUnitDeviceControlIrp+0xc7:
fffff807`3da1a5ab 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff807`3da1a5ae a810            test    al,10h
fffff807`3da1a5b0 0f85762c0200    jne     storport!RaUnitDeviceControlIrp+0x22d48 (fffff807`3da3d22c)  Branch

storport!RaUnitDeviceControlIrp+0xd2:
fffff807`3da1a5b6 b88c1c2d00      mov     eax,2D1C8Ch
fffff807`3da1a5bb 3be8            cmp     ebp,eax
fffff807`3da1a5bd 0f87d2000000    ja      storport!RaUnitDeviceControlIrp+0x1b1 (fffff807`3da1a695)  Branch

storport!RaUnitDeviceControlIrp+0xdf:
fffff807`3da1a5c3 0f84f02c0200    je      storport!RaUnitDeviceControlIrp+0x22dd5 (fffff807`3da3d2b9)  Branch

storport!RaUnitDeviceControlIrp+0xe5:
fffff807`3da1a5c9 b848d00400      mov     eax,4D048h
fffff807`3da1a5ce 3be8            cmp     ebp,eax
fffff807`3da1a5d0 0f8629010000    jbe     storport!RaUnitDeviceControlIrp+0x21b (fffff807`3da1a6ff)  Branch

storport!RaUnitDeviceControlIrp+0xf2:
fffff807`3da1a5d6 8bc5            mov     eax,ebp
fffff807`3da1a5d8 2d00142d00      sub     eax,2D1400h
fffff807`3da1a5dd 7550            jne     storport!RaUnitDeviceControlIrp+0x14b (fffff807`3da1a62f)  Branch

storport!RaUnitDeviceControlIrp+0xfb:
fffff807`3da1a5df 488bd3          mov     rdx,rbx
fffff807`3da1a5e2 488bce          mov     rcx,rsi
fffff807`3da1a5e5 e8bacd0500      call    storport!RaUnitStorageQueryPropertyIoctl (fffff807`3da773a4)

storport!RaUnitDeviceControlIrp+0x106:
fffff807`3da1a5ea 8bf8            mov     edi,eax
fffff807`3da1a5ec 488b0d0d3a0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff807`3da6e000)]
fffff807`3da1a5f3 493bcf          cmp     rcx,r15
fffff807`3da1a5f6 740b            je      storport!RaUnitDeviceControlIrp+0x11f (fffff807`3da1a603)  Branch

storport!RaUnitDeviceControlIrp+0x114:
fffff807`3da1a5f8 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff807`3da1a5fb a810            test    al,10h
fffff807`3da1a5fd 0f85c12d0200    jne     storport!RaUnitDeviceControlIrp+0x22ee0 (fffff807`3da3d3c4)  Branch

storport!RaUnitDeviceControlIrp+0x11f:
fffff807`3da1a603 488bce          mov     rcx,rsi
fffff807`3da1a606 e851020000      call    storport!RaUnitReleaseRemoveLock (fffff807`3da1a85c)
fffff807`3da1a60b 8bc7            mov     eax,edi

storport!RaUnitDeviceControlIrp+0x129:
fffff807`3da1a60d 488b4c2450      mov     rcx,qword ptr [rsp+50h]
fffff807`3da1a612 4833cc          xor     rcx,rsp
fffff807`3da1a615 e8d6890100      call    storport!_security_check_cookie (fffff807`3da32ff0)
fffff807`3da1a61a 4c8d5c2460      lea     r11,[rsp+60h]
fffff807`3da1a61f 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff807`3da1a623 498b6b38        mov     rbp,qword ptr [r11+38h]
fffff807`3da1a627 498be3          mov     rsp,r11
fffff807`3da1a62a 415f            pop     r15
fffff807`3da1a62c 5f              pop     rdi
fffff807`3da1a62d 5e              pop     rsi
fffff807`3da1a62e c3              ret

storport!RaUnitDeviceControlIrp+0x14b:
fffff807`3da1a62f 2d4b020000      sub     eax,24Bh
fffff807`3da1a634 0f846e2c0200    je      storport!RaUnitDeviceControlIrp+0x22dc4 (fffff807`3da3d2a8)  Branch

storport!RaUnitDeviceControlIrp+0x156:
fffff807`3da1a63a 83e804          sub     eax,4
fffff807`3da1a63d 0f84542c0200    je      storport!RaUnitDeviceControlIrp+0x22db3 (fffff807`3da3d297)  Branch

storport!RaUnitDeviceControlIrp+0x15f:
fffff807`3da1a643 83e831          sub     eax,31h
fffff807`3da1a646 0f842e2d0200    je      storport!RaUnitDeviceControlIrp+0x22e96 (fffff807`3da3d37a)  Branch

storport!RaUnitDeviceControlIrp+0x168:
fffff807`3da1a64c 2d80050000      sub     eax,580h
fffff807`3da1a651 7432            je      storport!RaUnitDeviceControlIrp+0x1a1 (fffff807`3da1a685)  Branch

storport!RaUnitDeviceControlIrp+0x16f:
fffff807`3da1a653 2d80000000      sub     eax,80h
fffff807`3da1a658 0f8465010000    je      storport!RaUnitDeviceControlIrp+0x2df (fffff807`3da1a7c3)  Branch

storport!RaUnitDeviceControlIrp+0x17a:
fffff807`3da1a65e 83e804          sub     eax,4
fffff807`3da1a661 0f84152c0200    je      storport!RaUnitDeviceControlIrp+0x22d98 (fffff807`3da3d27c)  Branch

storport!RaUnitDeviceControlIrp+0x183:
fffff807`3da1a667 83f804          cmp     eax,4
fffff807`3da1a66a 0f84fb2b0200    je      storport!RaUnitDeviceControlIrp+0x22d87 (fffff807`3da3d26b)  Branch

storport!RaUnitDeviceControlIrp+0x18c:
fffff807`3da1a670 41b8100000c0    mov     r8d,0C0000010h

storport!RaUnitDeviceControlIrp+0x192:
fffff807`3da1a676 33d2            xor     edx,edx
fffff807`3da1a678 488bcb          mov     rcx,rbx
fffff807`3da1a67b e830efffff      call    storport!RaidCompleteRequestEx (fffff807`3da195b0)
fffff807`3da1a680 e965ffffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x1a1:
fffff807`3da1a685 488bd3          mov     rdx,rbx
fffff807`3da1a688 488bce          mov     rcx,rsi
fffff807`3da1a68b e84c380100      call    storport!RaUnitHwFirmwareGetInfoIoctl (fffff807`3da2dedc)
fffff807`3da1a690 e955ffffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x1b1:
fffff807`3da1a695 b814502d00      mov     eax,2D5014h
fffff807`3da1a69a 3be8            cmp     ebp,eax
fffff807`3da1a69c 0f86ba000000    jbe     storport!RaUnitDeviceControlIrp+0x278 (fffff807`3da1a75c)  Branch

storport!RaUnitDeviceControlIrp+0x1be:
fffff807`3da1a6a2 8bc5            mov     eax,ebp
fffff807`3da1a6a4 2d04942d00      sub     eax,2D9404h
fffff807`3da1a6a9 0f849d000000    je      storport!RaUnitDeviceControlIrp+0x268 (fffff807`3da1a74c)  Branch

storport!RaUnitDeviceControlIrp+0x1cb:
fffff807`3da1a6af 2dfc3d0000      sub     eax,3DFCh
fffff807`3da1a6b4 0f84f92c0200    je      storport!RaUnitDeviceControlIrp+0x22ecf (fffff807`3da3d3b3)  Branch

storport!RaUnitDeviceControlIrp+0x1d6:
fffff807`3da1a6ba 2dc0010000      sub     eax,1C0h
fffff807`3da1a6bf 0f84dd2c0200    je      storport!RaUnitDeviceControlIrp+0x22ebe (fffff807`3da3d3a2)  Branch

storport!RaUnitDeviceControlIrp+0x1e1:
fffff807`3da1a6c5 2dc4020000      sub     eax,2C4h
fffff807`3da1a6ca 0f84aa2c0200    je      storport!RaUnitDeviceControlIrp+0x22e96 (fffff807`3da3d37a)  Branch

storport!RaUnitDeviceControlIrp+0x1ec:
fffff807`3da1a6d0 2d80050000      sub     eax,580h
fffff807`3da1a6d5 0f848e2c0200    je      storport!RaUnitDeviceControlIrp+0x22e85 (fffff807`3da3d369)  Branch

storport!RaUnitDeviceControlIrp+0x1f7:
fffff807`3da1a6db 83e804          sub     eax,4
fffff807`3da1a6de 0f84742c0200    je      storport!RaUnitDeviceControlIrp+0x22e74 (fffff807`3da3d358)  Branch

storport!RaUnitDeviceControlIrp+0x200:
fffff807`3da1a6e4 2d94000000      sub     eax,94h
fffff807`3da1a6e9 0f84582c0200    je      storport!RaUnitDeviceControlIrp+0x22e63 (fffff807`3da3d347)  Branch

storport!RaUnitDeviceControlIrp+0x20b:
fffff807`3da1a6ef 3d780b0000      cmp     eax,0B78h
fffff807`3da1a6f4 0f8576ffffff    jne     storport!RaUnitDeviceControlIrp+0x18c (fffff807`3da1a670)  Branch

storport!RaUnitDeviceControlIrp+0x216:
fffff807`3da1a6fa e9372c0200      jmp     storport!RaUnitDeviceControlIrp+0x22e52 (fffff807`3da3d336)  Branch

storport!RaUnitDeviceControlIrp+0x21b:
fffff807`3da1a6ff 0f84ae000000    je      storport!RaUnitDeviceControlIrp+0x2cf (fffff807`3da1a7b3)  Branch

storport!RaUnitDeviceControlIrp+0x221:
fffff807`3da1a705 8bc5            mov     eax,ebp
fffff807`3da1a707 2d18100400      sub     eax,41018h
fffff807`3da1a70c 7510            jne     storport!RaUnitDeviceControlIrp+0x23a (fffff807`3da1a71e)  Branch

storport!RaUnitDeviceControlIrp+0x22a:
fffff807`3da1a70e 488bd3          mov     rdx,rbx
fffff807`3da1a711 488bce          mov     rcx,rsi
fffff807`3da1a714 e827e50500      call    storport!RaUnitScsiGetAddressIoctl (fffff807`3da78c40)
fffff807`3da1a719 e9ccfeffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x23a:
fffff807`3da1a71e 83e808          sub     eax,8
fffff807`3da1a721 0f84c5000000    je      storport!RaUnitDeviceControlIrp+0x308 (fffff807`3da1a7ec)  Branch

storport!RaUnitDeviceControlIrp+0x243:
fffff807`3da1a727 83e804          sub     eax,4
fffff807`3da1a72a 0f84cc000000    je      storport!RaUnitDeviceControlIrp+0x318 (fffff807`3da1a7fc)  Branch

storport!RaUnitDeviceControlIrp+0x24c:
fffff807`3da1a730 2de0bf0000      sub     eax,0BFE0h
fffff807`3da1a735 747c            je      storport!RaUnitDeviceControlIrp+0x2cf (fffff807`3da1a7b3)  Branch

storport!RaUnitDeviceControlIrp+0x253:
fffff807`3da1a737 83e804          sub     eax,4
fffff807`3da1a73a 7572            jne     storport!RaUnitDeviceControlIrp+0x2ca (fffff807`3da1a7ae)  Branch

storport!RaUnitDeviceControlIrp+0x258:
fffff807`3da1a73c 488bd3          mov     rdx,rbx
fffff807`3da1a73f 488bce          mov     rcx,rsi
fffff807`3da1a742 e885190000      call    storport!RaUnitScsiMiniportIoctl (fffff807`3da1c0cc)
fffff807`3da1a747 e99efeffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x268:
fffff807`3da1a74c 488bd3          mov     rdx,rbx
fffff807`3da1a74f 488bce          mov     rcx,rsi
fffff807`3da1a752 e8bde10500      call    storport!RaUnitStorageDataSetManagementIoctl (fffff807`3da78914)
fffff807`3da1a757 e98efeffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x278:
fffff807`3da1a75c 0f84c32b0200    je      storport!RaUnitDeviceControlIrp+0x22e41 (fffff807`3da3d325)  Branch

storport!RaUnitDeviceControlIrp+0x27e:
fffff807`3da1a762 8bc5            mov     eax,ebp
fffff807`3da1a764 2d941c2d00      sub     eax,2D1C94h
fffff807`3da1a769 0f84a52b0200    je      storport!RaUnitDeviceControlIrp+0x22e30 (fffff807`3da3d314)  Branch

storport!RaUnitDeviceControlIrp+0x28b:
fffff807`3da1a76f 83e80c          sub     eax,0Ch
fffff807`3da1a772 0f848b2b0200    je      storport!RaUnitDeviceControlIrp+0x22e1f (fffff807`3da3d303)  Branch

storport!RaUnitDeviceControlIrp+0x294:
fffff807`3da1a778 83e828          sub     eax,28h
fffff807`3da1a77b 0f84712b0200    je      storport!RaUnitDeviceControlIrp+0x22e0e (fffff807`3da3d2f2)  Branch

storport!RaUnitDeviceControlIrp+0x29d:
fffff807`3da1a781 2d440b0000      sub     eax,0B44h
fffff807`3da1a786 0f8580000000    jne     storport!RaUnitDeviceControlIrp+0x328 (fffff807`3da1a80c)  Branch

storport!RaUnitDeviceControlIrp+0x2a8:
fffff807`3da1a78c 488bd3          mov     rdx,rbx
fffff807`3da1a78f 488bce          mov     rcx,rsi
fffff807`3da1a792 e831670100      call    storport!RaUnitTelemetryIdIoctl (fffff807`3da30ec8)
fffff807`3da1a797 e94efeffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x2b8:
fffff807`3da1a79c f6052040050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff807`3da6e7c3)],1
fffff807`3da1a7a3 0f84d9fdffff    je      storport!RaUnitDeviceControlIrp+0x9e (fffff807`3da1a582)  Branch

storport!RaUnitDeviceControlIrp+0x2c5:
fffff807`3da1a7a9 e93e2a0200      jmp     storport!RaUnitDeviceControlIrp+0x22d08 (fffff807`3da3d1ec)  Branch

storport!RaUnitDeviceControlIrp+0x2ca:
fffff807`3da1a7ae 83e80c          sub     eax,0Ch
fffff807`3da1a7b1 757b            jne     storport!RaUnitDeviceControlIrp+0x34a (fffff807`3da1a82e)  Branch

storport!RaUnitDeviceControlIrp+0x2cf:
fffff807`3da1a7b3 488bd3          mov     rdx,rbx
fffff807`3da1a7b6 488bce          mov     rcx,rsi
fffff807`3da1a7b9 e8c2180600      call    storport!RaUnitScsiPassThroughIoctl (fffff807`3da7c080)
fffff807`3da1a7be e927feffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x2df:
fffff807`3da1a7c3 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff807`3da1a7ca 48897b38        mov     qword ptr [rbx+38h],rdi
fffff807`3da1a7ce 83781010        cmp     dword ptr [rax+10h],10h
fffff807`3da1a7d2 0f82b52a0200    jb      storport!RaUnitDeviceControlIrp+0x22da9 (fffff807`3da3d28d)  Branch

storport!RaUnitDeviceControlIrp+0x2f4:
fffff807`3da1a7d8 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff807`3da1a7dc 488bce          mov     rcx,rsi
fffff807`3da1a7df e818f50500      call    storport!RaUnitRegisterForIdleDetection (fffff807`3da79cfc)

storport!RaUnitDeviceControlIrp+0x300:
fffff807`3da1a7e4 448bc0          mov     r8d,eax
fffff807`3da1a7e7 e98afeffff      jmp     storport!RaUnitDeviceControlIrp+0x192 (fffff807`3da1a676)  Branch

storport!RaUnitDeviceControlIrp+0x308:
fffff807`3da1a7ec 488bd3          mov     rdx,rbx
fffff807`3da1a7ef 488bce          mov     rcx,rsi
fffff807`3da1a7f2 e875ad0000      call    storport!RaUnitScsiGetDumpPointersIoctl (fffff807`3da2556c)
fffff807`3da1a7f7 e9eefdffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x318:
fffff807`3da1a7fc 488bd3          mov     rdx,rbx
fffff807`3da1a7ff 488bce          mov     rcx,rsi
fffff807`3da1a802 e8f5d30000      call    storport!RaUnitScsiFreeDumpPointersIoctl (fffff807`3da27bfc)
fffff807`3da1a807 e9defdffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x328:
fffff807`3da1a80c 83e804          sub     eax,4
fffff807`3da1a80f 0f84cc2a0200    je      storport!RaUnitDeviceControlIrp+0x22dfd (fffff807`3da3d2e1)  Branch

storport!RaUnitDeviceControlIrp+0x331:
fffff807`3da1a815 83e818          sub     eax,18h
fffff807`3da1a818 0f85ac2a0200    jne     storport!RaUnitDeviceControlIrp+0x22de6 (fffff807`3da3d2ca)  Branch

storport!RaUnitDeviceControlIrp+0x33a:
fffff807`3da1a81e 488bd3          mov     rdx,rbx
fffff807`3da1a821 488bce          mov     rcx,rsi
fffff807`3da1a824 e8fb3c0100      call    storport!RaUnitStreamsIoctl (fffff807`3da2e524)
fffff807`3da1a829 e9bcfdffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x34a:
fffff807`3da1a82e 83e818          sub     eax,18h
fffff807`3da1a831 741c            je      storport!RaUnitDeviceControlIrp+0x36b (fffff807`3da1a84f)  Branch

storport!RaUnitDeviceControlIrp+0x34f:
fffff807`3da1a833 83e804          sub     eax,4
fffff807`3da1a836 0f85212a0200    jne     storport!RaUnitDeviceControlIrp+0x22d79 (fffff807`3da3d25d)  Branch

storport!RaUnitDeviceControlIrp+0x358:
fffff807`3da1a83c 41b001          mov     r8b,1

storport!RaUnitDeviceControlIrp+0x35b:
fffff807`3da1a83f 488bd3          mov     rdx,rbx
fffff807`3da1a842 488bce          mov     rcx,rsi
fffff807`3da1a845 e8be67ffff      call    storport!RaUnitAtaPassThroughIoctl (fffff807`3da11008)
fffff807`3da1a84a e99bfdffff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x36b:
fffff807`3da1a84f 4533c0          xor     r8d,r8d
fffff807`3da1a852 ebeb            jmp     storport!RaUnitDeviceControlIrp+0x35b (fffff807`3da1a83f)  Branch

storport!RaUnitDeviceControlIrp+0x22c96:
fffff807`3da3d17a 40387a40        cmp     byte ptr [rdx+40h],dil
fffff807`3da3d17e 7437            je      storport!RaUnitDeviceControlIrp+0x22cd3 (fffff807`3da3d1b7)  Branch

storport!RaUnitDeviceControlIrp+0x22c9c:
fffff807`3da3d180 41b8100000c0    mov     r8d,0C0000010h
fffff807`3da3d186 eb1f            jmp     storport!RaUnitDeviceControlIrp+0x22cc3 (fffff807`3da3d1a7)  Branch

storport!RaUnitDeviceControlIrp+0x22ca4:
fffff807`3da3d188 8a89a0000000    mov     cl,byte ptr [rcx+0A0h]
fffff807`3da3d18e 488b4218        mov     rax,qword ptr [rdx+18h]
fffff807`3da3d192 c0e902          shr     cl,2
fffff807`3da3d195 f6d1            not     cl
fffff807`3da3d197 80e101          and     cl,1
fffff807`3da3d19a 8808            mov     byte ptr [rax],cl
fffff807`3da3d19c 4533c0          xor     r8d,r8d
fffff807`3da3d19f 48c7423801000000 mov     qword ptr [rdx+38h],1

storport!RaUnitDeviceControlIrp+0x22cc3:
fffff807`3da3d1a7 33d2            xor     edx,edx
fffff807`3da3d1a9 488bcb          mov     rcx,rbx
fffff807`3da3d1ac e8ffc3fdff      call    storport!RaidCompleteRequestEx (fffff807`3da195b0)
fffff807`3da3d1b1 90              nop
fffff807`3da3d1b2 e956d4fdff      jmp     storport!RaUnitDeviceControlIrp+0x129 (fffff807`3da1a60d)  Branch

storport!RaUnitDeviceControlIrp+0x22cd3:
fffff807`3da3d1b7 83780801        cmp     dword ptr [rax+8],1
fffff807`3da3d1bb 73cb            jae     storport!RaUnitDeviceControlIrp+0x22ca4 (fffff807`3da3d188)  Branch

storport!RaUnitDeviceControlIrp+0x22cd9:
fffff807`3da3d1bd 48897a38        mov     qword ptr [rdx+38h],rdi
fffff807`3da3d1c1 41b8230000c0    mov     r8d,0C0000023h
fffff807`3da3d1c7 ebde            jmp     storport!RaUnitDeviceControlIrp+0x22cc3 (fffff807`3da3d1a7)  Branch

storport!RaUnitDeviceControlIrp+0x22ce5:
fffff807`3da3d1c9 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff807`3da3d1d0 896c2430        mov     dword ptr [rsp+30h],ebp
fffff807`3da3d1d4 0fb610          movzx   edx,byte ptr [rax]
fffff807`3da3d1d7 0fb64801        movzx   ecx,byte ptr [rax+1]
fffff807`3da3d1db 894c2428        mov     dword ptr [rsp+28h],ecx
fffff807`3da3d1df 89542420        mov     dword ptr [rsp+20h],edx
fffff807`3da3d1e3 488d15be9b0200  lea     rdx,[storport!EventIOCTL (fffff807`3da66da8)]
fffff807`3da3d1ea eb21            jmp     storport!RaUnitDeviceControlIrp+0x22d29 (fffff807`3da3d20d)  Branch

storport!RaUnitDeviceControlIrp+0x22d08:
fffff807`3da3d1ec 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff807`3da3d1f3 896c2430        mov     dword ptr [rsp+30h],ebp
fffff807`3da3d1f7 0fb610          movzx   edx,byte ptr [rax]
fffff807`3da3d1fa 0fb64801        movzx   ecx,byte ptr [rax+1]
fffff807`3da3d1fe 894c2428        mov     dword ptr [rsp+28h],ecx
fffff807`3da3d202 89542420        mov     dword ptr [rsp+20h],edx
fffff807`3da3d206 488d15fb9f0200  lea     rdx,[storport!EventPassThrough (fffff807`3da67208)]

storport!RaUnitDeviceControlIrp+0x22d29:
fffff807`3da3d20d 4c8bcb          mov     r9,rbx
fffff807`3da3d210 4c8d442440      lea     r8,[rsp+40h]
fffff807`3da3d215 e846510000      call    storport!McTemplateK0pddd (fffff807`3da42360)
fffff807`3da3d21a 90              nop
fffff807`3da3d21b e962d3fdff      jmp     storport!RaUnitDeviceControlIrp+0x9e (fffff807`3da1a582)  Branch

storport!RaUnitDeviceControlIrp+0x22d3c:
fffff807`3da3d220 48897b38        mov     qword ptr [rbx+38h],rdi
fffff807`3da3d224 448bc0          mov     r8d,eax
fffff807`3da3d227 e97bffffff      jmp     storport!RaUnitDeviceControlIrp+0x22cc3 (fffff807`3da3d1a7)  Branch

storport!RaUnitDeviceControlIrp+0x22d48:
fffff807`3da3d22c 80792904        cmp     byte ptr [rcx+29h],4
fffff807`3da3d230 0f8280d3fdff    jb      storport!RaUnitDeviceControlIrp+0xd2 (fffff807`3da1a5b6)  Branch

storport!RaUnitDeviceControlIrp+0x22d52:
fffff807`3da3d236 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`3da3d23a 4c8d0507a50200  lea     r8,[storport!WPP_7b464925758c31034f964a6a282053e0_Traceguids (fffff807`3da67748)]
fffff807`3da3d241 ba1c000000      mov     edx,1Ch
fffff807`3da3d246 896c2428        mov     dword ptr [rsp+28h],ebp
fffff807`3da3d24a 4c8bce          mov     r9,rsi
fffff807`3da3d24d 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff807`3da3d252 e865a90000      call    storport!WPP_SF_qqD (fffff807`3da47bbc)
fffff807`3da3d257 90              nop
fffff807`3da3d258 e959d3fdff      jmp     storport!RaUnitDeviceControlIrp+0xd2 (fffff807`3da1a5b6)  Branch

storport!RaUnitDeviceControlIrp+0x22d79:
fffff807`3da3d25d 83f814          cmp     eax,14h
fffff807`3da3d260 0f844dd5fdff    je      storport!RaUnitDeviceControlIrp+0x2cf (fffff807`3da1a7b3)  Branch

storport!RaUnitDeviceControlIrp+0x22d82:
fffff807`3da3d266 e905d4fdff      jmp     storport!RaUnitDeviceControlIrp+0x18c (fffff807`3da1a670)  Branch

storport!RaUnitDeviceControlIrp+0x22d87:
fffff807`3da3d26b 488bd3          mov     rdx,rbx
fffff807`3da3d26e 488bce          mov     rcx,rsi
fffff807`3da3d271 e8ca7a0100      call    storport!RaUnitStoragePowerActive (fffff807`3da54d40)
fffff807`3da3d276 90              nop
fffff807`3da3d277 e96ed3fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22d98:
fffff807`3da3d27c 488bd3          mov     rdx,rbx
fffff807`3da3d27f 488bce          mov     rcx,rsi
fffff807`3da3d282 e829500400      call    storport!RaUnitStorageGetIdlePowerUpReason (fffff807`3da822b0)
fffff807`3da3d287 90              nop
fffff807`3da3d288 e95dd3fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22da9:
fffff807`3da3d28d b80d0000c0      mov     eax,0C000000Dh
fffff807`3da3d292 e94dd5fdff      jmp     storport!RaUnitDeviceControlIrp+0x300 (fffff807`3da1a7e4)  Branch

storport!RaUnitDeviceControlIrp+0x22db3:
fffff807`3da3d297 488bd3          mov     rdx,rbx
fffff807`3da3d29a 488bce          mov     rcx,rsi
fffff807`3da3d29d e8764a0400      call    storport!RaUnitStorageFreeDumpInfoIoctl (fffff807`3da81d18)
fffff807`3da3d2a2 90              nop
fffff807`3da3d2a3 e942d3fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22dc4:
fffff807`3da3d2a8 488bd3          mov     rdx,rbx
fffff807`3da3d2ab 488bce          mov     rcx,rsi
fffff807`3da3d2ae e8a94c0400      call    storport!RaUnitStorageGetDumpInfoIoctl (fffff807`3da81f5c)
fffff807`3da3d2b3 90              nop
fffff807`3da3d2b4 e931d3fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22dd5:
fffff807`3da3d2b9 488bd3          mov     rdx,rbx
fffff807`3da3d2bc 488bce          mov     rcx,rsi
fffff807`3da3d2bf e8087b0100      call    storport!RaUnitStoragePowerIdle (fffff807`3da54dcc)
fffff807`3da3d2c4 90              nop
fffff807`3da3d2c5 e920d3fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22de6:
fffff807`3da3d2ca 83e804          sub     eax,4
fffff807`3da3d2cd 0f844bd5fdff    je      storport!RaUnitDeviceControlIrp+0x33a (fffff807`3da1a81e)  Branch

storport!RaUnitDeviceControlIrp+0x22def:
fffff807`3da3d2d3 83f804          cmp     eax,4
fffff807`3da3d2d6 0f8594d3fdff    jne     storport!RaUnitDeviceControlIrp+0x18c (fffff807`3da1a670)  Branch

storport!RaUnitDeviceControlIrp+0x22df8:
fffff807`3da3d2dc e93dd5fdff      jmp     storport!RaUnitDeviceControlIrp+0x33a (fffff807`3da1a81e)  Branch

storport!RaUnitDeviceControlIrp+0x22dfd:
fffff807`3da3d2e1 488bd3          mov     rdx,rbx
fffff807`3da3d2e4 488bce          mov     rcx,rsi
fffff807`3da3d2e7 e824630100      call    storport!RaUnitGetQOSIoctl (fffff807`3da53610)
fffff807`3da3d2ec 90              nop
fffff807`3da3d2ed e9f8d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e0e:
fffff807`3da3d2f2 488bd3          mov     rdx,rbx
fffff807`3da3d2f5 488bce          mov     rcx,rsi
fffff807`3da3d2f8 e8876e0100      call    storport!RaUnitSmartDataIoctl (fffff807`3da54184)
fffff807`3da3d2fd 90              nop
fffff807`3da3d2fe e9e7d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e1f:
fffff807`3da3d303 488bd3          mov     rdx,rbx
fffff807`3da3d306 488bce          mov     rcx,rsi
fffff807`3da3d309 e89a490400      call    storport!RaUnitStorageDiagnosticIoctl (fffff807`3da81ca8)
fffff807`3da3d30e 90              nop
fffff807`3da3d30f e9d6d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e30:
fffff807`3da3d314 488bd3          mov     rdx,rbx
fffff807`3da3d317 488bce          mov     rcx,rsi
fffff807`3da3d31a e8ed640100      call    storport!RaUnitPowerCapIoctl (fffff807`3da5380c)
fffff807`3da3d31f 90              nop
fffff807`3da3d320 e9c5d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e41:
fffff807`3da3d325 488bd3          mov     rdx,rbx
fffff807`3da3d328 488bce          mov     rcx,rsi
fffff807`3da3d32b e8a8480400      call    storport!RaUnitStorageBreakReservationIoctl (fffff807`3da81bd8)
fffff807`3da3d330 90              nop
fffff807`3da3d331 e9b4d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e52:
fffff807`3da3d336 488bd3          mov     rdx,rbx
fffff807`3da3d339 488bce          mov     rcx,rsi
fffff807`3da3d33c e85b670100      call    storport!RaUnitSetQOSIoctl (fffff807`3da53a9c)
fffff807`3da3d341 90              nop
fffff807`3da3d342 e9a3d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e63:
fffff807`3da3d347 488bd3          mov     rdx,rbx
fffff807`3da3d34a 488bce          mov     rcx,rsi
fffff807`3da3d34d e86e590100      call    storport!RaUnitAttributeManagement (fffff807`3da52cc0)
fffff807`3da3d352 90              nop
fffff807`3da3d353 e992d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e74:
fffff807`3da3d358 488bd3          mov     rdx,rbx
fffff807`3da3d35b 488bce          mov     rcx,rsi
fffff807`3da3d35e e8c1630100      call    storport!RaUnitHwFirmwareActivateIoctl (fffff807`3da53724)
fffff807`3da3d363 90              nop
fffff807`3da3d364 e981d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e85:
fffff807`3da3d369 488bd3          mov     rdx,rbx
fffff807`3da3d36c 488bce          mov     rcx,rsi
fffff807`3da3d36f e824640100      call    storport!RaUnitHwFirmwareDownloadIoctl (fffff807`3da53798)
fffff807`3da3d374 90              nop
fffff807`3da3d375 e970d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22e96:
fffff807`3da3d37a 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff807`3da3d37e 488bd3          mov     rdx,rbx
fffff807`3da3d381 fe4343          inc     byte ptr [rbx+43h]
fffff807`3da3d384 488383b800000048 add     qword ptr [rbx+0B8h],48h
fffff807`3da3d38c 488b4908        mov     rcx,qword ptr [rcx+8]
fffff807`3da3d390 48ff15816e0300  call    qword ptr [storport!_imp_IofCallDriver (fffff807`3da74218)]
fffff807`3da3d397 0f1f440000      nop     dword ptr [rax+rax]
fffff807`3da3d39c 90              nop
fffff807`3da3d39d e948d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22ebe:
fffff807`3da3d3a2 488bd3          mov     rdx,rbx
fffff807`3da3d3a5 488bce          mov     rcx,rsi
fffff807`3da3d3a8 e807650100      call    storport!RaUnitProtocolCommandIoctl (fffff807`3da538b4)
fffff807`3da3d3ad 90              nop
fffff807`3da3d3ae e937d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22ecf:
fffff807`3da3d3b3 488bd3          mov     rdx,rbx
fffff807`3da3d3b6 488bce          mov     rcx,rsi
fffff807`3da3d3b9 e8de6b0100      call    storport!RaUnitSetTemperatureThresholdIoctl (fffff807`3da53f9c)
fffff807`3da3d3be 90              nop
fffff807`3da3d3bf e926d2fdff      jmp     storport!RaUnitDeviceControlIrp+0x106 (fffff807`3da1a5ea)  Branch

storport!RaUnitDeviceControlIrp+0x22ee0:
fffff807`3da3d3c4 80792904        cmp     byte ptr [rcx+29h],4
fffff807`3da3d3c8 0f8235d2fdff    jb      storport!RaUnitDeviceControlIrp+0x11f (fffff807`3da1a603)  Branch

storport!RaUnitDeviceControlIrp+0x22eea:
fffff807`3da3d3ce 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`3da3d3d2 4c8d056fa30200  lea     r8,[storport!WPP_7b464925758c31034f964a6a282053e0_Traceguids (fffff807`3da67748)]
fffff807`3da3d3d9 897c2430        mov     dword ptr [rsp+30h],edi
fffff807`3da3d3dd ba1d000000      mov     edx,1Dh
fffff807`3da3d3e2 896c2428        mov     dword ptr [rsp+28h],ebp
fffff807`3da3d3e6 4c8bce          mov     r9,rsi
fffff807`3da3d3e9 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff807`3da3d3ee e829a80000      call    storport!WPP_SF_qqDD (fffff807`3da47c1c)
fffff807`3da3d3f3 90              nop
fffff807`3da3d3f4 e90ad2fdff      jmp     storport!RaUnitDeviceControlIrp+0x11f (fffff807`3da1a603)  Branch
