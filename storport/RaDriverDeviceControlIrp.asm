0: kd> uf storport!radriverdevicecontrolirp
storport!RaDriverDeviceControlIrp:
fffff807`3da1a440 48895c2408      mov     qword ptr [rsp+8],rbx
fffff807`3da1a445 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff807`3da1a44a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff807`3da1a44f 57              push    rdi
fffff807`3da1a450 4883ec30        sub     rsp,30h
fffff807`3da1a454 488bfa          mov     rdi,rdx           ;IRP
fffff807`3da1a457 488bf1          mov     rsi,rcx           ;DeviceObject
fffff807`3da1a45a 488b0d9f3b0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff807`3da6e000)]
fffff807`3da1a461 488d2d983b0500  lea     rbp,[storport!WPP_GLOBAL_Control (fffff807`3da6e000)]
fffff807`3da1a468 483bcd          cmp     rcx,rbp
fffff807`3da1a46b 740b            je      storport!RaDriverDeviceControlIrp+0x38 (fffff807`3da1a478)  Branch

storport!RaDriverDeviceControlIrp+0x2d:
fffff807`3da1a46d 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff807`3da1a470 a810            test    al,10h
fffff807`3da1a472 0f85a42c0200    jne     storport!RaDriverDeviceControlIrp+0x22cdc (fffff807`3da3d11c)  Branch

storport!RaDriverDeviceControlIrp+0x38:
fffff807`3da1a478 c6878d000000a8  mov     byte ptr [rdi+8Dh],0A8h   ;write something to Irp->Tail.Overlay.DriverContext
fffff807`3da1a47f 4c8b4640        mov     r8,qword ptr [rsi+40h]    ;R8 = devobj->DeviceExtension = AdapterExt
fffff807`3da1a483 418b08          mov     ecx,dword ptr [r8]        ;ECX = AdapterExt->ObjectType
fffff807`3da1a486 85c9            test    ecx,ecx       ;if ObjectType == RaidAdapterObject, goto 0x8a
fffff807`3da1a488 7440            je      storport!RaDriverDeviceControlIrp+0x8a (fffff807`3da1a4ca)  Branch

storport!RaDriverDeviceControlIrp+0x4a:
fffff807`3da1a48a 83f901          cmp     ecx,1         ;if ObjectType != RaidUnitObject, goto 0x97
fffff807`3da1a48d 7548            jne     storport!RaDriverDeviceControlIrp+0x97 (fffff807`3da1a4d7)  Branch

storport!RaDriverDeviceControlIrp+0x4f:
fffff807`3da1a48f 488bd7          mov     rdx,rdi
fffff807`3da1a492 498bc8          mov     rcx,r8
fffff807`3da1a495 e84a000000      call    storport!RaUnitDeviceControlIrp (fffff807`3da1a4e4)

storport!RaDriverDeviceControlIrp+0x5a:
fffff807`3da1a49a 8bd8            mov     ebx,eax

storport!RaDriverDeviceControlIrp+0x5c:
fffff807`3da1a49c 488b0d5d3b0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff807`3da6e000)]
fffff807`3da1a4a3 483bcd          cmp     rcx,rbp
fffff807`3da1a4a6 740b            je      storport!RaDriverDeviceControlIrp+0x73 (fffff807`3da1a4b3)  Branch

storport!RaDriverDeviceControlIrp+0x68:
fffff807`3da1a4a8 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff807`3da1a4ab a810            test    al,10h
fffff807`3da1a4ad 0f85962c0200    jne     storport!RaDriverDeviceControlIrp+0x22d09 (fffff807`3da3d149)  Branch

storport!RaDriverDeviceControlIrp+0x73:
fffff807`3da1a4b3 488b6c2448      mov     rbp,qword ptr [rsp+48h]
fffff807`3da1a4b8 8bc3            mov     eax,ebx
fffff807`3da1a4ba 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff807`3da1a4bf 488b742450      mov     rsi,qword ptr [rsp+50h]
fffff807`3da1a4c4 4883c430        add     rsp,30h
fffff807`3da1a4c8 5f              pop     rdi
fffff807`3da1a4c9 c3              ret

storport!RaDriverDeviceControlIrp+0x8a:
fffff807`3da1a4ca 488bd7          mov     rdx,rdi       ;IRP
fffff807`3da1a4cd 498bc8          mov     rcx,r8        ;AdapterExt
fffff807`3da1a4d0 e85f100000      call    storport!RaidAdapterDeviceControlIrp (fffff807`3da1b534)
fffff807`3da1a4d5 ebc3            jmp     storport!RaDriverDeviceControlIrp+0x5a (fffff807`3da1a49a)  Branch

storport!RaDriverDeviceControlIrp+0x97:
fffff807`3da1a4d7 bb010000c0      mov     ebx,0C0000001h
fffff807`3da1a4dc ebbe            jmp     storport!RaDriverDeviceControlIrp+0x5c (fffff807`3da1a49c)  Branch

storport!RaDriverDeviceControlIrp+0x22cdc:
fffff807`3da3d11c 80792904        cmp     byte ptr [rcx+29h],4
fffff807`3da3d120 0f8252d3fdff    jb      storport!RaDriverDeviceControlIrp+0x38 (fffff807`3da1a478)  Branch

storport!RaDriverDeviceControlIrp+0x22ce6:
fffff807`3da3d126 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`3da3d12a 4c8d055fa20200  lea     r8,[storport!WPP_fca335724287372554e4fcd7cdd207c8_Traceguids (fffff807`3da67390)]
fffff807`3da3d131 ba10000000      mov     edx,10h
fffff807`3da3d136 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff807`3da3d13b 4c8bce          mov     r9,rsi
fffff807`3da3d13e e829aa0000      call    storport!WPP_SF_qq (fffff807`3da47b6c)
fffff807`3da3d143 90              nop
fffff807`3da3d144 e92fd3fdff      jmp     storport!RaDriverDeviceControlIrp+0x38 (fffff807`3da1a478)  Branch

storport!RaDriverDeviceControlIrp+0x22d09:
fffff807`3da3d149 80792904        cmp     byte ptr [rcx+29h],4
fffff807`3da3d14d 0f8260d3fdff    jb      storport!RaDriverDeviceControlIrp+0x73 (fffff807`3da1a4b3)  Branch

storport!RaDriverDeviceControlIrp+0x22d13:
fffff807`3da3d153 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`3da3d157 4c8d0532a20200  lea     r8,[storport!WPP_fca335724287372554e4fcd7cdd207c8_Traceguids (fffff807`3da67390)]
fffff807`3da3d15e ba11000000      mov     edx,11h
fffff807`3da3d163 895c2428        mov     dword ptr [rsp+28h],ebx
fffff807`3da3d167 4c8bce          mov     r9,rsi
fffff807`3da3d16a 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff807`3da3d16f e848aa0000      call    storport!WPP_SF_qqD (fffff807`3da47bbc)
fffff807`3da3d174 90              nop
fffff807`3da3d175 e939d3fdff      jmp     storport!RaDriverDeviceControlIrp+0x73 (fffff807`3da1a4b3)  Branch