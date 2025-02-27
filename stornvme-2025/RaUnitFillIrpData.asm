; RaUnitFillIrpData(irp, struct **IrpData) return a IrpData buffer

3: kd> uf RaUnitFillIrpData
storport!RaUnitFillIrpData:
fffff804`3c1e9640 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff804`3c1e9645 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff804`3c1e964a 56              push    rsi
fffff804`3c1e964b 57              push    rdi
fffff804`3c1e964c 4154            push    r12
fffff804`3c1e964e 4156            push    r14
fffff804`3c1e9650 4157            push    r15
fffff804`3c1e9652 4883ec20        sub     rsp,20h
fffff804`3c1e9656 4c8bb1b8000000  mov     r14,qword ptr [rcx+0B8h]  ;r14 = irp->Tail.Overlay.CurrentStackLocation
fffff804`3c1e965d 488bfa          mov     rdi,rdx
fffff804`3c1e9660 488b12          mov     rdx,qword ptr [rdx]       
fffff804`3c1e9663 488bf1          mov     rsi,rcx
fffff804`3c1e9666 8b5930          mov     ebx,dword ptr [rcx+30h]   ;ebx = irp->IoStatus
fffff804`3c1e9669 498b4628        mov     rax,qword ptr [r14+28h]   ;rax = CurrentStackLocation->DeviceObject
fffff804`3c1e966d 4c8b4040        mov     r8,qword ptr [rax+40h]    ;DeviceObject->DeviceExtension ==> AdapterExt
fffff804`3c1e9671 4885d2          test    rdx,rdx                   ;if
fffff804`3c1e9674 7430            je      storport!RaUnitFillIrpData+0x66 (fffff804`3c1e96a6)  Branch

storport!RaUnitFillIrpData+0x36:
fffff804`3c1e9676 66833a01        cmp     word ptr [rdx],1          ;0x0001
fffff804`3c1e967a 752a            jne     storport!RaUnitFillIrpData+0x66 (fffff804`3c1e96a6)  Branch

storport!RaUnitFillIrpData+0x3c:
fffff804`3c1e967c 837a0404        cmp     dword ptr [rdx+4],4       ;0x00000004
fffff804`3c1e9680 7524            jne     storport!RaUnitFillIrpData+0x66 (fffff804`3c1e96a6)  Branch

storport!RaUnitFillIrpData+0x42:
fffff804`3c1e9682 498b4018        mov     rax,qword ptr [r8+18h]    ;AdapExt->LowerDeviceObject
fffff804`3c1e9686 0fb74838        movzx   ecx,word ptr [rax+38h]    ;AdapExt->LowerDeviceObject->Vpd? => Volume Parameter Block
fffff804`3c1e968a 66894a02        mov     word ptr [rdx+2],cx       ;IprData+0x02 == Vpd->
fffff804`3c1e968e 410fb64068      movzx   eax,byte ptr [r8+68h]
fffff804`3c1e9693 884208          mov     byte ptr [rdx+8],al       ;set all following flags to IrpData+8
;    [+0x000 ( 0: 0)] InitializedMiniport : 0x1 [Type: unsigned char]
;    [+0x000 ( 1: 1)] WmiMiniPortInitialized : 0x1 [Type: unsigned char]
;    [+0x000 ( 2: 2)] WmiInitialized   : 0x0 [Type: unsigned char]
;    [+0x000 ( 3: 3)] BusInterfaceInternal : 0x0 [Type: unsigned char]
;    [+0x000 ( 4: 4)] InHwInitialize   : 0x0 [Type: unsigned char]
;    [+0x000 ( 5: 5)] IdlePowerManagementEnabled : 0x0 [Type: unsigned char]
;    [+0x000 ( 6: 6)] TargetedRescan   : 0x0 [Type: unsigned char]
;    [+0x000 ( 7: 7)] BootAdapter      : 0x0 [Type: unsigned char]


fffff804`3c1e9696 410fb64069      movzx   eax,byte ptr [r8+69h]     ;AdapterExt->Flags->InvalidateBusRelations
fffff804`3c1e969b 884209          mov     byte ptr [rdx+9],al
fffff804`3c1e969e 410fb6406a      movzx   eax,byte ptr [r8+6Ah]     ;AdapterExt->Flags->RescanBus
fffff804`3c1e96a3 88420a          mov     byte ptr [rdx+0Ah],al

storport!RaUnitFillIrpData+0x66:
fffff804`3c1e96a6 8b4e10          mov     ecx,dword ptr [rsi+10h]
fffff804`3c1e96a9 4533e4          xor     r12d,r12d
fffff804`3c1e96ac 8b4738          mov     eax,dword ptr [rdi+38h]
fffff804`3c1e96af 83e102          and     ecx,2
fffff804`3c1e96b2 c1e103          shl     ecx,3
fffff804`3c1e96b5 83e0ef          and     eax,0FFFFFFEFh
fffff804`3c1e96b8 0bc8            or      ecx,eax
fffff804`3c1e96ba 44896714        mov     dword ptr [rdi+14h],r12d
fffff804`3c1e96be 894f38          mov     dword ptr [rdi+38h],ecx
fffff804`3c1e96c1 488d4678        lea     rax,[rsi+78h]
fffff804`3c1e96c5 48894718        mov     qword ptr [rdi+18h],rax
fffff804`3c1e96c9 8bcb            mov     ecx,ebx
fffff804`3c1e96cb 0fbaf11f        btr     ecx,1Fh
fffff804`3c1e96cf 894f30          mov     dword ptr [rdi+30h],ecx
fffff804`3c1e96d2 498b4018        mov     rax,qword ptr [r8+18h]
fffff804`3c1e96d6 8b10            mov     edx,dword ptr [rax]
fffff804`3c1e96d8 81fa52544441    cmp     edx,41445452h
fffff804`3c1e96de 0f85cd010000    jne     storport!RaUnitFillIrpData+0x271 (fffff804`3c1e98b1)  Branch

storport!RaUnitFillIrpData+0xa4:
fffff804`3c1e96e4 480568020000    add     rax,268h

storport!RaUnitFillIrpData+0xaa:
fffff804`3c1e96ea 488b28          mov     rbp,qword ptr [rax]
fffff804`3c1e96ed 488d542450      lea     rdx,[rsp+50h]
fffff804`3c1e96f2 4489642450      mov     dword ptr [rsp+50h],r12d
fffff804`3c1e96f7 4c8b1542e91000  mov     r10,qword ptr [storport!_imp_KeGetProcessorNumberFromIndex (fffff804`3c2f8040)]
fffff804`3c1e96fe e8fdb4306d      call    nt!KeGetProcessorNumberFromIndex (fffff804`a94f4c00)
fffff804`3c1e9703 85c0            test    eax,eax
fffff804`3c1e9705 7868            js      storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0xc7:
fffff804`3c1e9707 488b4500        mov     rax,qword ptr [rbp]
fffff804`3c1e970b 4885c0          test    rax,rax
fffff804`3c1e970e 745f            je      storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0xd0:
fffff804`3c1e9710 4c8b08          mov     r9,qword ptr [rax]
fffff804`3c1e9713 4d85c9          test    r9,r9
fffff804`3c1e9716 7457            je      storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0xd8:
fffff804`3c1e9718 f680f800000001  test    byte ptr [rax+0F8h],1
fffff804`3c1e971f 418b09          mov     ecx,dword ptr [r9]
fffff804`3c1e9722 0f8567010000    jne     storport!RaUnitFillIrpData+0x24f (fffff804`3c1e988f)  Branch

storport!RaUnitFillIrpData+0xe8:
fffff804`3c1e9728 81f952544441    cmp     ecx,41445452h
fffff804`3c1e972e 753f            jne     storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0xf0:
fffff804`3c1e9730 41f6813412000002 test    byte ptr [r9+1234h],2
fffff804`3c1e9738 7431            je      storport!RaUnitFillIrpData+0x12b (fffff804`3c1e976b)  Branch

storport!RaUnitFillIrpData+0xfa:
fffff804`3c1e973a 8b442450        mov     eax,dword ptr [rsp+50h]
fffff804`3c1e973e 66413b8136120000 cmp     ax,word ptr [r9+1236h]
fffff804`3c1e9746 7323            jae     storport!RaUnitFillIrpData+0x12b (fffff804`3c1e976b)  Branch

storport!RaUnitFillIrpData+0x108:
fffff804`3c1e9748 0fb7c8          movzx   ecx,ax
fffff804`3c1e974b 0fb6442452      movzx   eax,byte ptr [rsp+52h]
fffff804`3c1e9750 c1e106          shl     ecx,6
fffff804`3c1e9753 03c8            add     ecx,eax
fffff804`3c1e9755 498b8148120000  mov     rax,qword ptr [r9+1248h]
fffff804`3c1e975c 0fb61401        movzx   edx,byte ptr [rcx+rax]
fffff804`3c1e9760 895734          mov     dword ptr [rdi+34h],edx
fffff804`3c1e9763 81faff000000    cmp     edx,0FFh
fffff804`3c1e9769 7504            jne     storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0x12b:
fffff804`3c1e976b 44896734        mov     dword ptr [rdi+34h],r12d

storport!RaUnitFillIrpData+0x12f:
fffff804`3c1e976f 410fb606        movzx   eax,byte ptr [r14]
fffff804`3c1e9773 83e803          sub     eax,3
fffff804`3c1e9776 0f84ce000000    je      storport!RaUnitFillIrpData+0x20a (fffff804`3c1e984a)  Branch

storport!RaUnitFillIrpData+0x13c:
fffff804`3c1e977c 83f801          cmp     eax,1
fffff804`3c1e977f 756a            jne     storport!RaUnitFillIrpData+0x1ab (fffff804`3c1e97eb)  Branch

storport!RaUnitFillIrpData+0x141:
fffff804`3c1e9781 488b4608        mov     rax,qword ptr [rsi+8]
fffff804`3c1e9785 4883c030        add     rax,30h
fffff804`3c1e9789 48894720        mov     qword ptr [rdi+20h],rax
fffff804`3c1e978d 488b4608        mov     rax,qword ptr [rsi+8]
fffff804`3c1e9791 8b482c          mov     ecx,dword ptr [rax+2Ch]
fffff804`3c1e9794 034820          add     ecx,dword ptr [rax+20h]
fffff804`3c1e9797 8b4028          mov     eax,dword ptr [rax+28h]
fffff804`3c1e979a 81e1ff0f0000    and     ecx,0FFFh
fffff804`3c1e97a0 4805ff0f0000    add     rax,0FFFh
fffff804`3c1e97a6 4803c8          add     rcx,rax
fffff804`3c1e97a9 48c1e90c        shr     rcx,0Ch
fffff804`3c1e97ad 894f28          mov     dword ptr [rdi+28h],ecx
fffff804`3c1e97b0 488b4608        mov     rax,qword ptr [rsi+8]
fffff804`3c1e97b4 8b482c          mov     ecx,dword ptr [rax+2Ch]
fffff804`3c1e97b7 034e38          add     ecx,dword ptr [rsi+38h]
fffff804`3c1e97ba 443825cf3d1000  cmp     byte ptr [storport!FUAEnabled (fffff804`3c2ed590)],r12b
fffff804`3c1e97c1 894f2c          mov     dword ptr [rdi+2Ch],ecx
fffff804`3c1e97c4 0f85fe000000    jne     storport!RaUnitFillIrpData+0x288 (fffff804`3c1e98c8)  Branch

storport!RaUnitFillIrpData+0x18a:
fffff804`3c1e97ca 8b4738          mov     eax,dword ptr [rdi+38h]
fffff804`3c1e97cd 83e0f1          and     eax,0FFFFFFF1h
fffff804`3c1e97d0 83c801          or      eax,1
fffff804`3c1e97d3 894738          mov     dword ptr [rdi+38h],eax

storport!RaUnitFillIrpData+0x196:
fffff804`3c1e97d6 8b4638          mov     eax,dword ptr [rsi+38h]
fffff804`3c1e97d9 49034618        add     rax,qword ptr [r14+18h]
fffff804`3c1e97dd 48894708        mov     qword ptr [rdi+8],rax
fffff804`3c1e97e1 418b4e08        mov     ecx,dword ptr [r14+8]
fffff804`3c1e97e5 2b4e38          sub     ecx,dword ptr [rsi+38h]
fffff804`3c1e97e8 894f10          mov     dword ptr [rdi+10h],ecx

storport!RaUnitFillIrpData+0x1ab:
fffff804`3c1e97eb 8b4610          mov     eax,dword ptr [rsi+10h]
fffff804`3c1e97ee a808            test    al,8
fffff804`3c1e97f0 0f85e6000000    jne     storport!RaUnitFillIrpData+0x29c (fffff804`3c1e98dc)  Branch

storport!RaUnitFillIrpData+0x1b6:
fffff804`3c1e97f6 410fb606        movzx   eax,byte ptr [r14]
fffff804`3c1e97fa 2c03            sub     al,3
fffff804`3c1e97fc 3c01            cmp     al,1
fffff804`3c1e97fe 7620            jbe     storport!RaUnitFillIrpData+0x1e0 (fffff804`3c1e9820)  Branch

storport!RaUnitFillIrpData+0x1c0:
fffff804`3c1e9800 85db            test    ebx,ebx
fffff804`3c1e9802 0f88f6000000    js      storport!RaUnitFillIrpData+0x2be (fffff804`3c1e98fe)  Branch

storport!RaUnitFillIrpData+0x1c8:
fffff804`3c1e9808 488b5c2458      mov     rbx,qword ptr [rsp+58h]
fffff804`3c1e980d 488b6c2460      mov     rbp,qword ptr [rsp+60h]
fffff804`3c1e9812 4883c420        add     rsp,20h
fffff804`3c1e9816 415f            pop     r15
fffff804`3c1e9818 415e            pop     r14
fffff804`3c1e981a 415c            pop     r12
fffff804`3c1e981c 5f              pop     rdi
fffff804`3c1e981d 5e              pop     rsi
fffff804`3c1e981e c3              ret

storport!RaUnitFillIrpData+0x1e0:
fffff804`3c1e9820 418b4610        mov     eax,dword ptr [r14+10h]
fffff804`3c1e9824 894714          mov     dword ptr [rdi+14h],eax
fffff804`3c1e9827 85c0            test    eax,eax
fffff804`3c1e9829 74d5            je      storport!RaUnitFillIrpData+0x1c0 (fffff804`3c1e9800)  Branch

storport!RaUnitFillIrpData+0x1eb:
fffff804`3c1e982b 250000ffff      and     eax,0FFFF0000h
fffff804`3c1e9830 3d00005356      cmp     eax,56530000h
fffff804`3c1e9835 0f84ba000000    je      storport!RaUnitFillIrpData+0x2b5 (fffff804`3c1e98f5)  Branch

storport!RaUnitFillIrpData+0x1fb:
fffff804`3c1e983b 41803e04        cmp     byte ptr [r14],4
fffff804`3c1e983f 75bf            jne     storport!RaUnitFillIrpData+0x1c0 (fffff804`3c1e9800)  Branch

storport!RaUnitFillIrpData+0x201:
fffff804`3c1e9841 814f3880000000  or      dword ptr [rdi+38h],80h
fffff804`3c1e9848 ebb6            jmp     storport!RaUnitFillIrpData+0x1c0 (fffff804`3c1e9800)  Branch

storport!RaUnitFillIrpData+0x20a:
fffff804`3c1e984a 488b4608        mov     rax,qword ptr [rsi+8]
fffff804`3c1e984e 4883c030        add     rax,30h
fffff804`3c1e9852 48894720        mov     qword ptr [rdi+20h],rax
fffff804`3c1e9856 488b4608        mov     rax,qword ptr [rsi+8]
fffff804`3c1e985a 8b482c          mov     ecx,dword ptr [rax+2Ch]
fffff804`3c1e985d 034820          add     ecx,dword ptr [rax+20h]
fffff804`3c1e9860 8b4028          mov     eax,dword ptr [rax+28h]
fffff804`3c1e9863 81e1ff0f0000    and     ecx,0FFFh
fffff804`3c1e9869 4805ff0f0000    add     rax,0FFFh
fffff804`3c1e986f 4803c8          add     rcx,rax
fffff804`3c1e9872 48c1e90c        shr     rcx,0Ch
fffff804`3c1e9876 894f28          mov     dword ptr [rdi+28h],ecx
fffff804`3c1e9879 488b4608        mov     rax,qword ptr [rsi+8]
fffff804`3c1e987d 8b482c          mov     ecx,dword ptr [rax+2Ch]
fffff804`3c1e9880 034e38          add     ecx,dword ptr [rsi+38h]
fffff804`3c1e9883 836738f0        and     dword ptr [rdi+38h],0FFFFFFF0h
fffff804`3c1e9887 894f2c          mov     dword ptr [rdi+2Ch],ecx
fffff804`3c1e988a e947ffffff      jmp     storport!RaUnitFillIrpData+0x196 (fffff804`3c1e97d6)  Branch

storport!RaUnitFillIrpData+0x24f:
fffff804`3c1e988f 81f94441564e    cmp     ecx,4E564144h
fffff804`3c1e9895 0f85d4feffff    jne     storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0x25b:
fffff804`3c1e989b 4c8d4734        lea     r8,[rdi+34h]
fffff804`3c1e989f 498bc9          mov     rcx,r9
fffff804`3c1e98a2 488d542450      lea     rdx,[rsp+50h]
fffff804`3c1e98a7 e834750500      call    storport!NvmeGetMessageNumberFromProcessorNumber (fffff804`3c240de0)
fffff804`3c1e98ac e9befeffff      jmp     storport!RaUnitFillIrpData+0x12f (fffff804`3c1e976f)  Branch

storport!RaUnitFillIrpData+0x271:
fffff804`3c1e98b1 81fa4441564e    cmp     edx,4E564144h
fffff804`3c1e98b7 0f85d9210e00    jne     storport!RaUnitFillIrpData+0xe2456 (fffff804`3c2cba96)  Branch

storport!RaUnitFillIrpData+0x27d:
fffff804`3c1e98bd 480598010000    add     rax,198h
fffff804`3c1e98c3 e922feffff      jmp     storport!RaUnitFillIrpData+0xaa (fffff804`3c1e96ea)  Branch

storport!RaUnitFillIrpData+0x288:
fffff804`3c1e98c8 41f6460204      test    byte ptr [r14+2],4
fffff804`3c1e98cd 0f84f7feffff    je      storport!RaUnitFillIrpData+0x18a (fffff804`3c1e97ca)  Branch

storport!RaUnitFillIrpData+0x293:
fffff804`3c1e98d3 834f3820        or      dword ptr [rdi+38h],20h
fffff804`3c1e98d7 e9eefeffff      jmp     storport!RaUnitFillIrpData+0x18a (fffff804`3c1e97ca)  Branch

storport!RaUnitFillIrpData+0x29c:
fffff804`3c1e98dc 488b4618        mov     rax,qword ptr [rsi+18h]
fffff804`3c1e98e0 4885c0          test    rax,rax
fffff804`3c1e98e3 0f840dffffff    je      storport!RaUnitFillIrpData+0x1b6 (fffff804`3c1e97f6)  Branch

storport!RaUnitFillIrpData+0x2a9:
fffff804`3c1e98e9 4c8bb0b8000000  mov     r14,qword ptr [rax+0B8h]
fffff804`3c1e98f0 e901ffffff      jmp     storport!RaUnitFillIrpData+0x1b6 (fffff804`3c1e97f6)  Branch

storport!RaUnitFillIrpData+0x2b5:
fffff804`3c1e98f5 834f3840        or      dword ptr [rdi+38h],40h
fffff804`3c1e98f9 e902ffffff      jmp     storport!RaUnitFillIrpData+0x1c0 (fffff804`3c1e9800)  Branch

storport!RaUnitFillIrpData+0x2be:
fffff804`3c1e98fe 817f1000000400  cmp     dword ptr [rdi+10h],40000h
fffff804`3c1e9905 0f86fdfeffff    jbe     storport!RaUnitFillIrpData+0x1c8 (fffff804`3c1e9808)  Branch

storport!RaUnitFillIrpData+0x2cb:
fffff804`3c1e990b c7471000000400  mov     dword ptr [rdi+10h],40000h
fffff804`3c1e9912 e9f1feffff      jmp     storport!RaUnitFillIrpData+0x1c8 (fffff804`3c1e9808)  Branch

storport!RaUnitFillIrpData+0xe2456:
fffff804`3c2cba96 b8f0000000      mov     eax,0F0h
fffff804`3c2cba9b e94adcf1ff      jmp     storport!RaUnitFillIrpData+0xaa (fffff804`3c1e96ea)  Branch
