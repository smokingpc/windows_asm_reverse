1: kd> uf storport!RaidAdapterDisableDeviceInterface
storport!RaidAdapterDisableDeviceInterface:
fffff809`efc33a40 48895c2408      mov     qword ptr [rsp+8],rbx
fffff809`efc33a45 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff809`efc33a4a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff809`efc33a4f 57              push    rdi
fffff809`efc33a50 4883ec20        sub     rsp,20h
fffff809`efc33a54 33ff            xor     edi,edi
fffff809`efc33a56 488bd9          mov     rbx,rcx
fffff809`efc33a59 4839b910080000  cmp     qword ptr [rcx+810h],rdi
fffff809`efc33a60 7415            je      storport!RaidAdapterDisableDeviceInterface+0x37 (fffff809`efc33a77)  Branch

storport!RaidAdapterDisableDeviceInterface+0x22:
fffff809`efc33a62 4881c108080000  add     rcx,808h
fffff809`efc33a69 33d2            xor     edx,edx
fffff809`efc33a6b 48ff1516060300  call    qword ptr [storport!_imp_IoSetDeviceInterfaceState (fffff809`efc64088)]
fffff809`efc33a72 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterDisableDeviceInterface+0x37:
fffff809`efc33a77 0fb6ab78010000  movzx   ebp,byte ptr [rbx+178h]
fffff809`efc33a7e 85ed            test    ebp,ebp
fffff809`efc33a80 7428            je      storport!RaidAdapterDisableDeviceInterface+0x6a (fffff809`efc33aaa)  Branch

storport!RaidAdapterDisableDeviceInterface+0x42:
fffff809`efc33a82 488db370080000  lea     rsi,[rbx+870h]

storport!RaidAdapterDisableDeviceInterface+0x49:
fffff809`efc33a89 81ffff000000    cmp     edi,0FFh
fffff809`efc33a8f 7319            jae     storport!RaidAdapterDisableDeviceInterface+0x6a (fffff809`efc33aaa)  Branch

storport!RaidAdapterDisableDeviceInterface+0x51:
fffff809`efc33a91 488b0e          mov     rcx,qword ptr [rsi]
fffff809`efc33a94 48ff1505080300  call    qword ptr [storport!_imp_ZwClose (fffff809`efc642a0)]
fffff809`efc33a9b 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc33aa0 ffc7            inc     edi
fffff809`efc33aa2 4883c608        add     rsi,8
fffff809`efc33aa6 3bfd            cmp     edi,ebp
fffff809`efc33aa8 72df            jb      storport!RaidAdapterDisableDeviceInterface+0x49 (fffff809`efc33a89)  Branch

storport!RaidAdapterDisableDeviceInterface+0x6a:
fffff809`efc33aaa 8b4b38          mov     ecx,dword ptr [rbx+38h]
fffff809`efc33aad e8d6b60100      call    storport!PortMapDeleteAdapterEntry (fffff809`efc4f188)
fffff809`efc33ab2 f6436804        test    byte ptr [rbx+68h],4
fffff809`efc33ab6 7419            je      storport!RaidAdapterDisableDeviceInterface+0x91 (fffff809`efc33ad1)  Branch

storport!RaidAdapterDisableDeviceInterface+0x78:
fffff809`efc33ab8 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff809`efc33abc ba02000000      mov     edx,2
fffff809`efc33ac1 48ff1568070300  call    qword ptr [storport!_imp_IoWMIRegistrationControl (fffff809`efc64230)]
fffff809`efc33ac8 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc33acd 806368f9        and     byte ptr [rbx+68h],0F9h

storport!RaidAdapterDisableDeviceInterface+0x91:
fffff809`efc33ad1 8b4b38          mov     ecx,dword ptr [rbx+38h]
fffff809`efc33ad4 83cfff          or      edi,0FFFFFFFFh
fffff809`efc33ad7 3bcf            cmp     ecx,edi
fffff809`efc33ad9 7408            je      storport!RaidAdapterDisableDeviceInterface+0xa3 (fffff809`efc33ae3)  Branch

storport!RaidAdapterDisableDeviceInterface+0x9b:
fffff809`efc33adb e8dceb0000      call    storport!StorDeleteScsiSymbolicLink (fffff809`efc426bc)
fffff809`efc33ae0 897b38          mov     dword ptr [rbx+38h],edi

storport!RaidAdapterDisableDeviceInterface+0xa3:
fffff809`efc33ae3 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff809`efc33ae8 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff809`efc33aed 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff809`efc33af2 4883c420        add     rsp,20h
fffff809`efc33af6 5f              pop     rdi
fffff809`efc33af7 c3              ret
