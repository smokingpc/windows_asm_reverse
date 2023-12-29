;[CallStack of HwFindAdapter]
; # Child-SP          RetAddr               Call Site
;00 ffff9801`a80534b8 fffff80b`df13f624     nvme!NVMeFindAdapter 
;01 ffff9801`a80534c0 fffff80b`df13f957     storport!RaCallMiniportFindAdapter+0xb8
;02 ffff9801`a8053590 fffff80b`df13bf44     storport!RaidAdapterStartMiniport+0x5b
;03 ffff9801`a80535d0 fffff80b`df13715e     storport!RaidAdapterStartDeviceIrp+0x16c
;04 ffff9801`a8053660 fffff80b`df12822e     storport!RaidAdapterPnpIrp+0x222
;05 ffff9801`a8053700 fffff806`52ae8f49     storport!RaDriverPnpIrp+0x8e
;06 ffff9801`a8053740 fffff806`531b5f0e     nt!IofCallDriver+0x59
;07 ffff9801`a8053780 fffff806`52ad3095     nt!PnpAsynchronousCall+0xea
;08 ffff9801`a80537c0 fffff806`52c15768     nt!PnpSendIrp+0x95
;09 ffff9801`a8053830 fffff806`531a7be7     nt!PnpStartDevice+0x88
;0a ffff9801`a80538c0 fffff806`531a7dcf     nt!PnpStartDeviceNode+0xdb
;0b ffff9801`a8053950 fffff806`531a29e8     nt!PipProcessStartPhase1+0x6f
;0c ffff9801`a80539a0 fffff806`5321b56f     nt!PipProcessDevNodeTree+0x3dc
;0d ffff9801`a8053a60 fffff806`52c16771     nt!PiRestartDevice+0xab
;0e ffff9801`a8053ab0 fffff806`52b6d4ca     nt!PnpDeviceActionWorker+0x421
;0f ffff9801`a8053b70 fffff806`52bef1e5     nt!ExpWorkerThread+0x16a
;10 ffff9801`a8053c10 fffff806`52c7dd6c     nt!PspSystemThreadStartup+0x55
;11 ffff9801`a8053c60 00000000`00000000     nt!KiStartSystemThread+0x1c

2: kd> uf RaCallMiniportFindAdapter
storport!RaCallMiniportFindAdapter:
fffff80b`df13f56c 488bc4          mov     rax,rsp
fffff80b`df13f56f 48895810        mov     qword ptr [rax+10h],rbx
fffff80b`df13f573 48896818        mov     qword ptr [rax+18h],rbp
fffff80b`df13f577 48897020        mov     qword ptr [rax+20h],rsi
fffff80b`df13f57b 57              push    rdi
fffff80b`df13f57c 4154            push    r12
fffff80b`df13f57e 4155            push    r13
fffff80b`df13f580 4156            push    r14
fffff80b`df13f582 4157            push    r15
fffff80b`df13f584 4881eca0000000  sub     rsp,0A0h
fffff80b`df13f58b 33ff            xor     edi,edi
fffff80b`df13f58d 488d2d1a590300  lea     rbp,[storport!`string` (fffff80b`df174eae)]
fffff80b`df13f594 40887808        mov     byte ptr [rax+8],dil
fffff80b`df13f598 488d5908        lea     rbx,[rcx+8]   ;RBX = AdapterExt->Miniport->PortConfiguration
fffff80b`df13f59c 488b01          mov     rax,qword ptr [rcx];RCX = AdapterExt->Miniport ==> RAX = AdapterExt->Miniport->AdapterExt
fffff80b`df13f59f 4885d2          test    rdx,rdx
fffff80b`df13f5a2 be03000000      mov     esi,3
fffff80b`df13f5a7 4c8bf1          mov     r14,rcx       ;R14 = RCX = AdapterExt->Miniport
fffff80b`df13f5aa 480f45ea        cmovne  rbp,rdx
fffff80b`df13f5ae 4c8b7808        mov     r15,qword ptr [rax+8] ;R15 = DevObj
fffff80b`df13f5b2 8a0528220400    mov     al,byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)]
fffff80b`df13f5b8 448d660d        lea     r12d,[rsi+0Dh]    ;RSI == 3 (why?)  R12D = RSI+0x0D == 0x10
fffff80b`df13f5bc 4184c4          test    r12b,al
fffff80b`df13f5bf 0f8557480100    jne     storport!RaCallMiniportFindAdapter+0x148b0 (fffff80b`df153e1c)  Branch

storport!RaCallMiniportFindAdapter+0x59:
fffff80b`df13f5c5 418a86f8000000  mov     al,byte ptr [r14+0F8h]    ;AdapterExt->Miniport.Flags.InFindAdapter
fffff80b`df13f5cc 498b8ee8000000  mov     rcx,qword ptr [r14+0E8h]  ;RCX = HwInitializeData
fffff80b`df13f5d3 0c01            or      al,1
fffff80b`df13f5d5 418886f8000000  mov     byte ptr [r14+0F8h],al    ;set Miniport.Flags.InFindAdapter=1
fffff80b`df13f5dc 8b11            mov     edx,dword ptr [rcx]
fffff80b`df13f5de 81fa88000000    cmp     edx,88h   ;if(HwInitializeData.Size == 0x88(HW_INIT_DATA_SIZE_PHYSICAL)) goto 0x8a
fffff80b`df13f5e4 7410            je      storport!RaCallMiniportFindAdapter+0x8a (fffff80b`df13f5f6)  Branch

storport!RaCallMiniportFindAdapter+0x7a:
fffff80b`df13f5e6 a804            test    al,4  ;if(TRUE==AdapterExt->Miniport.Flags.IsVirtual) goto 0x234
fffff80b`df13f5e8 0f85b2010000    jne     storport!RaCallMiniportFindAdapter+0x234 (fffff80b`df13f7a0)  Branch

storport!RaCallMiniportFindAdapter+0x82:
fffff80b`df13f5ee 81fad0000000    cmp     edx,0D0h  ;if(!IsVirtual but InitData.Size == virtual size) goto 0xba
fffff80b`df13f5f4 7530            jne     storport!RaCallMiniportFindAdapter+0xba (fffff80b`df13f626)  Branch

storport!RaCallMiniportFindAdapter+0x8a:
fffff80b`df13f5f6 488b4120        mov     rax,qword ptr [rcx+20h]   ;RAX = InitData.HwFindAdapter func address
fffff80b`df13f5fa 488d9424d0000000 lea     rdx,[rsp+0D0h]
fffff80b`df13f602 498b8ef0000000  mov     rcx,qword ptr [r14+0F0h]  ;RCX = AdapterExt->Miniport.PrivateDeviceExt
fffff80b`df13f609 4c8bcd          mov     r9,rbp
fffff80b`df13f60c 4889542428      mov     qword ptr [rsp+28h],rdx
fffff80b`df13f611 4903cc          add     rcx,r12   ;RCX = AdapterExt->Miniport.PrivateDeviceExt+0x10 == HwDeviceExtension of miniport
fffff80b`df13f614 33d2            xor     edx,edx
fffff80b`df13f616 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff80b`df13f61b 4533c0          xor     r8d,r8d       ;call to miniport's HwFindAdapter()
fffff80b`df13f61e ff1504820400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80b`df187828)]

storport!RaCallMiniportFindAdapter+0xb8:
fffff80b`df13f624 8bf0            mov     esi,eax

storport!RaCallMiniportFindAdapter+0xba:
fffff80b`df13f626 4180a6f8000000fe and     byte ptr [r14+0F8h],0FEh
fffff80b`df13f62e 41b702          mov     r15b,2
fffff80b`df13f631 83fe01          cmp     esi,1     ;if HwFindAdapter() != SP_RETURN_FOUND , goto 0xf2
fffff80b`df13f634 7528            jne     storport!RaCallMiniportFindAdapter+0xf2 (fffff80b`df13f65e)  Branch

storport!RaCallMiniportFindAdapter+0xca:
fffff80b`df13f636 40387b5a        cmp     byte ptr [rbx+5Ah],dil
fffff80b`df13f63a 0f8494480100    je      storport!RaCallMiniportFindAdapter+0x14968 (fffff80b`df153ed4)  Branch

storport!RaCallMiniportFindAdapter+0xd4:
fffff80b`df13f640 40387b5b        cmp     byte ptr [rbx+5Bh],dil
fffff80b`df13f644 0f848a480100    je      storport!RaCallMiniportFindAdapter+0x14968 (fffff80b`df153ed4)  Branch

storport!RaCallMiniportFindAdapter+0xde:
fffff80b`df13f64a 40387b51        cmp     byte ptr [rbx+51h],dil
fffff80b`df13f64e 0f8480480100    je      storport!RaCallMiniportFindAdapter+0x14968 (fffff80b`df153ed4)  Branch

storport!RaCallMiniportFindAdapter+0xe8:
fffff80b`df13f654 40387b52        cmp     byte ptr [rbx+52h],dil
fffff80b`df13f658 0f8476480100    je      storport!RaCallMiniportFindAdapter+0x14968 (fffff80b`df153ed4)  Branch

storport!RaCallMiniportFindAdapter+0xf2:
fffff80b`df13f65e 85f6            test    esi,esi   ;if HwFindAdapter() == SP_RETURN_NOT_FOUND, goto 0x149f5
fffff80b`df13f660 0f84fb480100    je      storport!RaCallMiniportFindAdapter+0x149f5 (fffff80b`df153f61)  Branch

storport!RaCallMiniportFindAdapter+0xfa:
fffff80b`df13f666 83ee01          sub     esi,1     ;if HwFindAdapter() != SP_RETURN_FOUND, goto 0x149d7
fffff80b`df13f669 0f85d4480100    jne     storport!RaCallMiniportFindAdapter+0x149d7 (fffff80b`df153f43)  Branch

storport!RaCallMiniportFindAdapter+0x103:
fffff80b`df13f66f 4d8b16          mov     r10,qword ptr [r14]
fffff80b`df13f672 418b8260130000  mov     eax,dword ptr [r10+1360h]
fffff80b`df13f679 85c0            test    eax,eax
fffff80b`df13f67b 0f8592000000    jne     storport!RaCallMiniportFindAdapter+0x1a7 (fffff80b`df13f713)  Branch

storport!RaCallMiniportFindAdapter+0x115:
fffff80b`df13f681 8b8bcc000000    mov     ecx,dword ptr [rbx+0CCh]
fffff80b`df13f687 4c8d2d12b10300  lea     r13,[storport!`string` (fffff80b`df17a7a0)]   ;L"MaxNumberOfIO"
fffff80b`df13f68e bde8030000      mov     ebp,3E8h
fffff80b`df13f693 3bcd            cmp     ecx,ebp
fffff80b`df13f695 0f8743010000    ja      storport!RaCallMiniportFindAdapter+0x272 (fffff80b`df13f7de)  Branch

storport!RaCallMiniportFindAdapter+0x12f:
fffff80b`df13f69b 8be9            mov     ebp,ecx
fffff80b`df13f69d 413bcc          cmp     ecx,r12d
fffff80b`df13f6a0 0f82fc480100    jb      storport!RaCallMiniportFindAdapter+0x14a36 (fffff80b`df153fa2)  Branch

storport!RaCallMiniportFindAdapter+0x13a:
fffff80b`df13f6a6 8b8bd0000000    mov     ecx,dword ptr [rbx+0D0h]
fffff80b`df13f6ac 4c8d351db10300  lea     r14,[storport!`string` (fffff80b`df17a7d0)]   ;L"MaxIOsPerLun"
fffff80b`df13f6b3 beff000000      mov     esi,0FFh
fffff80b`df13f6b8 3bce            cmp     ecx,esi
fffff80b`df13f6ba 0f8715490100    ja      storport!RaCallMiniportFindAdapter+0x14a69 (fffff80b`df153fd5)  Branch

storport!RaCallMiniportFindAdapter+0x154:
fffff80b`df13f6c0 413bcc          cmp     ecx,r12d
fffff80b`df13f6c3 0f824e490100    jb      storport!RaCallMiniportFindAdapter+0x14aab (fffff80b`df154017)  Branch

storport!RaCallMiniportFindAdapter+0x15d:
fffff80b`df13f6c9 8bf1            mov     esi,ecx
fffff80b`df13f6cb 3bcd            cmp     ecx,ebp
fffff80b`df13f6cd 0f8724010000    ja      storport!RaCallMiniportFindAdapter+0x28b (fffff80b`df13f7f7)  Branch

storport!RaCallMiniportFindAdapter+0x167:
fffff80b`df13f6d3 448b8bd4000000  mov     r9d,dword ptr [rbx+0D4h]
fffff80b`df13f6da 443bce          cmp     r9d,esi
fffff80b`df13f6dd 0f878b490100    ja      storport!RaCallMiniportFindAdapter+0x14b02 (fffff80b`df15406e)  Branch

storport!RaCallMiniportFindAdapter+0x177:
fffff80b`df13f6e3 448425f6200400  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df13f6ea 0f85b9490100    jne     storport!RaCallMiniportFindAdapter+0x14b3d (fffff80b`df1540a9)  Branch

storport!RaCallMiniportFindAdapter+0x184:
fffff80b`df13f6f0 4c8d9c24a0000000 lea     r11,[rsp+0A0h]
fffff80b`df13f6f8 8bc7            mov     eax,edi
fffff80b`df13f6fa 498b5b38        mov     rbx,qword ptr [r11+38h]
fffff80b`df13f6fe 498b6b40        mov     rbp,qword ptr [r11+40h]
fffff80b`df13f702 498b7348        mov     rsi,qword ptr [r11+48h]
fffff80b`df13f706 498be3          mov     rsp,r11
fffff80b`df13f709 415f            pop     r15
fffff80b`df13f70b 415e            pop     r14
fffff80b`df13f70d 415d            pop     r13
fffff80b`df13f70f 415c            pop     r12
fffff80b`df13f711 5f              pop     rdi
fffff80b`df13f712 c3              ret

storport!RaCallMiniportFindAdapter+0x1a7:
fffff80b`df13f713 4939ba68130000  cmp     qword ptr [r10+1368h],rdi
fffff80b`df13f71a 0f8461ffffff    je      storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x1b4:
fffff80b`df13f720 4939ba70130000  cmp     qword ptr [r10+1370h],rdi
fffff80b`df13f727 0f8454ffffff    je      storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x1c1:
fffff80b`df13f72d 8bf7            mov     esi,edi
fffff80b`df13f72f 85c0            test    eax,eax
fffff80b`df13f731 0f844affffff    je      storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x1cb:
fffff80b`df13f737 8bd6            mov     edx,esi
fffff80b`df13f739 48c1e204        shl     rdx,4
fffff80b`df13f73d 49039268130000  add     rdx,qword ptr [r10+1368h]
fffff80b`df13f744 448bc6          mov     r8d,esi
fffff80b`df13f747 488b02          mov     rax,qword ptr [rdx]
fffff80b`df13f74a 482b05475c0300  sub     rax,qword ptr [storport!GUID_LOW_POWER_EPOCH (fffff80b`df175398)]
fffff80b`df13f751 750b            jne     storport!RaCallMiniportFindAdapter+0x1f2 (fffff80b`df13f75e)  Branch

storport!RaCallMiniportFindAdapter+0x1e7:
fffff80b`df13f753 488b4208        mov     rax,qword ptr [rdx+8]
fffff80b`df13f757 482b05425c0300  sub     rax,qword ptr [storport!GUID_LOW_POWER_EPOCH+0x8 (fffff80b`df1753a0)]

storport!RaCallMiniportFindAdapter+0x1f2:
fffff80b`df13f75e 4885c0          test    rax,rax
fffff80b`df13f761 742a            je      storport!RaCallMiniportFindAdapter+0x221 (fffff80b`df13f78d)  Branch

storport!RaCallMiniportFindAdapter+0x1f7:
fffff80b`df13f763 498b8270130000  mov     rax,qword ptr [r10+1370h]
fffff80b`df13f76a 4d8bca          mov     r9,r10
fffff80b`df13f76d 498b4a08        mov     rcx,qword ptr [r10+8]
fffff80b`df13f771 4e8d04c0        lea     r8,[rax+r8*8]
fffff80b`df13f775 4c89442420      mov     qword ptr [rsp+20h],r8
fffff80b`df13f77a 4c8d059f000000  lea     r8,[storport!RaidPowerSettingCallback (fffff80b`df13f820)]
fffff80b`df13f781 48ff1510790400  call    qword ptr [storport!_imp_PoRegisterPowerSettingCallback (fffff80b`df187098)]
fffff80b`df13f788 0f1f440000      nop     dword ptr [rax+rax]

storport!RaCallMiniportFindAdapter+0x221:
fffff80b`df13f78d 4d8b16          mov     r10,qword ptr [r14]
fffff80b`df13f790 ffc6            inc     esi
fffff80b`df13f792 413bb260130000  cmp     esi,dword ptr [r10+1360h]
fffff80b`df13f799 729c            jb      storport!RaCallMiniportFindAdapter+0x1cb (fffff80b`df13f737)  Branch

storport!RaCallMiniportFindAdapter+0x22f:
fffff80b`df13f79b e9e1feffff      jmp     storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x234:
fffff80b`df13f7a0 498b16          mov     rdx,qword ptr [r14]
fffff80b`df13f7a3 4c8d8424d0000000 lea     r8,[rsp+0D0h]
fffff80b`df13f7ab 488b4120        mov     rax,qword ptr [rcx+20h]
fffff80b`df13f7af 498b8ef0000000  mov     rcx,qword ptr [r14+0F0h]
fffff80b`df13f7b6 4c89442430      mov     qword ptr [rsp+30h],r8
fffff80b`df13f7bb 4903cc          add     rcx,r12
fffff80b`df13f7be 4c8b4a18        mov     r9,qword ptr [rdx+18h]
fffff80b`df13f7c2 4d8bc7          mov     r8,r15
fffff80b`df13f7c5 488b5220        mov     rdx,qword ptr [rdx+20h]
fffff80b`df13f7c9 48895c2428      mov     qword ptr [rsp+28h],rbx
fffff80b`df13f7ce 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff80b`df13f7d3 ff154f800400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80b`df187828)]
fffff80b`df13f7d9 e946feffff      jmp     storport!RaCallMiniportFindAdapter+0xb8 (fffff80b`df13f624)  Branch

storport!RaCallMiniportFindAdapter+0x272:
fffff80b`df13f7de 8a9390000000    mov     dl,byte ptr [rbx+90h]
fffff80b`df13f7e4 8ac2            mov     al,dl
fffff80b`df13f7e6 412ac7          sub     al,r15b
fffff80b`df13f7e9 413ac7          cmp     al,r15b
fffff80b`df13f7ec 0f86a9feffff    jbe     storport!RaCallMiniportFindAdapter+0x12f (fffff80b`df13f69b)  Branch

storport!RaCallMiniportFindAdapter+0x286:
fffff80b`df13f7f2 e974470100      jmp     storport!RaCallMiniportFindAdapter+0x149ff (fffff80b`df153f6b)  Branch

storport!RaCallMiniportFindAdapter+0x28b:
fffff80b`df13f7f7 448425e21f0400  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df13f7fe 8bf5            mov     esi,ebp
fffff80b`df13f800 0f8544480100    jne     storport!RaCallMiniportFindAdapter+0x14ade (fffff80b`df15404a)  Branch

storport!RaCallMiniportFindAdapter+0x29a:
fffff80b`df13f806 89b3d0000000    mov     dword ptr [rbx+0D0h],esi
fffff80b`df13f80c e9c2feffff      jmp     storport!RaCallMiniportFindAdapter+0x167 (fffff80b`df13f6d3)  Branch

storport!RaCallMiniportFindAdapter+0x148b0:
fffff80b`df153e1c 0fb683c4000000  movzx   eax,byte ptr [rbx+0C4h]
fffff80b`df153e23 0fb69392000000  movzx   edx,byte ptr [rbx+92h]
fffff80b`df153e2a 440fb64b48      movzx   r9d,byte ptr [rbx+48h]
fffff80b`df153e2f 0fb64b53        movzx   ecx,byte ptr [rbx+53h]
fffff80b`df153e33 440fb64361      movzx   r8d,byte ptr [rbx+61h]
fffff80b`df153e38 89842498000000  mov     dword ptr [rsp+98h],eax
fffff80b`df153e3f 8b83a0000000    mov     eax,dword ptr [rbx+0A0h]
fffff80b`df153e45 898c2490000000  mov     dword ptr [rsp+90h],ecx
fffff80b`df153e4c 89842488000000  mov     dword ptr [rsp+88h],eax
fffff80b`df153e53 8b83d8000000    mov     eax,dword ptr [rbx+0D8h]
fffff80b`df153e59 89842480000000  mov     dword ptr [rsp+80h],eax
fffff80b`df153e60 8a8390000000    mov     al,byte ptr [rbx+90h]
fffff80b`df153e66 88442478        mov     byte ptr [rsp+78h],al
fffff80b`df153e6a 8a4363          mov     al,byte ptr [rbx+63h]
fffff80b`df153e6d 88442470        mov     byte ptr [rsp+70h],al
fffff80b`df153e71 8a4362          mov     al,byte ptr [rbx+62h]
fffff80b`df153e74 88442468        mov     byte ptr [rsp+68h],al
fffff80b`df153e78 8b83dc000000    mov     eax,dword ptr [rbx+0DCh]
fffff80b`df153e7e 89442460        mov     dword ptr [rsp+60h],eax
fffff80b`df153e82 8b83c0000000    mov     eax,dword ptr [rbx+0C0h]
fffff80b`df153e88 89442458        mov     dword ptr [rsp+58h],eax
fffff80b`df153e8c 8b83d4000000    mov     eax,dword ptr [rbx+0D4h]
fffff80b`df153e92 89442450        mov     dword ptr [rsp+50h],eax
fffff80b`df153e96 8b83d0000000    mov     eax,dword ptr [rbx+0D0h]
fffff80b`df153e9c 89442448        mov     dword ptr [rsp+48h],eax
fffff80b`df153ea0 8b83cc000000    mov     eax,dword ptr [rbx+0CCh]
fffff80b`df153ea6 89442440        mov     dword ptr [rsp+40h],eax
fffff80b`df153eaa 8b4318          mov     eax,dword ptr [rbx+18h]
fffff80b`df153ead 89542438        mov     dword ptr [rsp+38h],edx
fffff80b`df153eb1 488d1590660200  lea     rdx,[storport!EventAdapterInitPortConfigInfo (fffff80b`df17a548)]
fffff80b`df153eb8 4489442430      mov     dword ptr [rsp+30h],r8d
fffff80b`df153ebd 44894c2428      mov     dword ptr [rsp+28h],r9d
fffff80b`df153ec2 448b0b          mov     r9d,dword ptr [rbx]
fffff80b`df153ec5 89442420        mov     dword ptr [rsp+20h],eax
fffff80b`df153ec9 e866960000      call    storport!McTemplateK0ddqqqqqqdduuuqqtt (fffff80b`df15d534)
fffff80b`df153ece 90              nop
fffff80b`df153ecf e9f1b6feff      jmp     storport!RaCallMiniportFindAdapter+0x59 (fffff80b`df13f5c5)  Branch

storport!RaCallMiniportFindAdapter+0x14968:
fffff80b`df153ed4 488b0d25d10200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80b`df181000)]
fffff80b`df153edb 488d3d1ed10200  lea     rdi,[storport!WPP_GLOBAL_Control (fffff80b`df181000)]
fffff80b`df153ee2 483bcf          cmp     rcx,rdi
fffff80b`df153ee5 7452            je      storport!RaCallMiniportFindAdapter+0x149cd (fffff80b`df153f39)  Branch

storport!RaCallMiniportFindAdapter+0x1497b:
fffff80b`df153ee7 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80b`df153eea 4184c7          test    r15b,al
fffff80b`df153eed 741b            je      storport!RaCallMiniportFindAdapter+0x1499e (fffff80b`df153f0a)  Branch

storport!RaCallMiniportFindAdapter+0x14983:
fffff80b`df153eef 44387929        cmp     byte ptr [rcx+29h],r15b
fffff80b`df153ef3 7215            jb      storport!RaCallMiniportFindAdapter+0x1499e (fffff80b`df153f0a)  Branch

storport!RaCallMiniportFindAdapter+0x14989:
fffff80b`df153ef5 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80b`df153ef9 4c8d0520690200  lea     r8,[storport!WPP_c5c82f8c2d0d3b71a5687db0aa357632_Traceguids (fffff80b`df17a820)]
fffff80b`df153f00 ba0a000000      mov     edx,0Ah
fffff80b`df153f05 e86a7a0000      call    storport!WPP_SF_ (fffff80b`df15b974)

storport!RaCallMiniportFindAdapter+0x1499e:
fffff80b`df153f0a 488b0defd00200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80b`df181000)]
fffff80b`df153f11 483bcf          cmp     rcx,rdi
fffff80b`df153f14 7423            je      storport!RaCallMiniportFindAdapter+0x149cd (fffff80b`df153f39)  Branch

storport!RaCallMiniportFindAdapter+0x149aa:
fffff80b`df153f16 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80b`df153f19 4184c7          test    r15b,al
fffff80b`df153f1c 741b            je      storport!RaCallMiniportFindAdapter+0x149cd (fffff80b`df153f39)  Branch

storport!RaCallMiniportFindAdapter+0x149b2:
fffff80b`df153f1e 44387929        cmp     byte ptr [rcx+29h],r15b
fffff80b`df153f22 7215            jb      storport!RaCallMiniportFindAdapter+0x149cd (fffff80b`df153f39)  Branch

storport!RaCallMiniportFindAdapter+0x149b8:
fffff80b`df153f24 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80b`df153f28 4c8d05f1680200  lea     r8,[storport!WPP_c5c82f8c2d0d3b71a5687db0aa357632_Traceguids (fffff80b`df17a820)]
fffff80b`df153f2f ba0b000000      mov     edx,0Bh
fffff80b`df153f34 e83b7a0000      call    storport!WPP_SF_ (fffff80b`df15b974)

storport!RaCallMiniportFindAdapter+0x149cd:
fffff80b`df153f39 bf820100c0      mov     edi,0C0000182h
fffff80b`df153f3e e93eb7feff      jmp     storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x149d7:
fffff80b`df153f43 83ee01          sub     esi,1     ;if HwFindAdapter() == SP_RETURN_ERROR, goto 0x149eb
fffff80b`df153f46 740f            je      storport!RaCallMiniportFindAdapter+0x149eb (fffff80b`df153f57)  Branch

storport!RaCallMiniportFindAdapter+0x149dc:
fffff80b`df153f48 83fe01          cmp     esi,1
fffff80b`df153f4b 74ec            je      storport!RaCallMiniportFindAdapter+0x149cd (fffff80b`df153f39)  Branch

storport!RaCallMiniportFindAdapter+0x149e1:
fffff80b`df153f4d bfe50000c0      mov     edi,0C00000E5h
fffff80b`df153f52 e92ab7feff      jmp     storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x149eb:
fffff80b`df153f57 bfc20000c0      mov     edi,0C00000C2h
fffff80b`df153f5c e920b7feff      jmp     storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x149f5:
fffff80b`df153f61 bf250200c0      mov     edi,0C0000225h
fffff80b`df153f66 e916b7feff      jmp     storport!RaCallMiniportFindAdapter+0x115 (fffff80b`df13f681)  Branch

storport!RaCallMiniportFindAdapter+0x149ff:
fffff80b`df153f6b 4484256ed80200  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df153f72 7423            je      storport!RaCallMiniportFindAdapter+0x14a2b (fffff80b`df153f97)  Branch

storport!RaCallMiniportFindAdapter+0x14a08:
fffff80b`df153f74 0fb6c2          movzx   eax,dl
fffff80b`df153f77 4d8bcd          mov     r9,r13
fffff80b`df153f7a 896c2438        mov     dword ptr [rsp+38h],ebp
fffff80b`df153f7e 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80b`df153f82 89442428        mov     dword ptr [rsp+28h],eax
fffff80b`df153f86 488d058b0b0200  lea     rax,[storport!`string` (fffff80b`df174b18)]
fffff80b`df153f8d 4889442420      mov     qword ptr [rsp+20h],rax
fffff80b`df153f92 e83d970000      call    storport!McTemplateK0zzdqq (fffff80b`df15d6d4)

storport!RaCallMiniportFindAdapter+0x14a2b:
fffff80b`df153f97 89abcc000000    mov     dword ptr [rbx+0CCh],ebp
fffff80b`df153f9d e904b7feff      jmp     storport!RaCallMiniportFindAdapter+0x13a (fffff80b`df13f6a6)  Branch

storport!RaCallMiniportFindAdapter+0x14a36:
fffff80b`df153fa2 44842537d80200  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df153fa9 741b            je      storport!RaCallMiniportFindAdapter+0x14a5a (fffff80b`df153fc6)  Branch

storport!RaCallMiniportFindAdapter+0x14a3f:
fffff80b`df153fab 4489642438      mov     dword ptr [rsp+38h],r12d
fffff80b`df153fb0 4d8bcd          mov     r9,r13
fffff80b`df153fb3 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80b`df153fb7 4489642428      mov     dword ptr [rsp+28h],r12d
fffff80b`df153fbc 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80b`df153fc1 e80e970000      call    storport!McTemplateK0zzdqq (fffff80b`df15d6d4)

storport!RaCallMiniportFindAdapter+0x14a5a:
fffff80b`df153fc6 4489a3cc000000  mov     dword ptr [rbx+0CCh],r12d
fffff80b`df153fcd 418bec          mov     ebp,r12d
fffff80b`df153fd0 e9d1b6feff      jmp     storport!RaCallMiniportFindAdapter+0x13a (fffff80b`df13f6a6)  Branch

storport!RaCallMiniportFindAdapter+0x14a69:
fffff80b`df153fd5 8a5362          mov     dl,byte ptr [rbx+62h]
fffff80b`df153fd8 80fa01          cmp     dl,1
fffff80b`df153fdb 0f84dfb6feff    je      storport!RaCallMiniportFindAdapter+0x154 (fffff80b`df13f6c0)  Branch

storport!RaCallMiniportFindAdapter+0x14a75:
fffff80b`df153fe1 448425f8d70200  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df153fe8 0f8418b8feff    je      storport!RaCallMiniportFindAdapter+0x29a (fffff80b`df13f806)  Branch

storport!RaCallMiniportFindAdapter+0x14a82:
fffff80b`df153fee 0fb6c2          movzx   eax,dl
fffff80b`df153ff1 4d8bce          mov     r9,r14
fffff80b`df153ff4 89742438        mov     dword ptr [rsp+38h],esi
fffff80b`df153ff8 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80b`df153ffc 89442428        mov     dword ptr [rsp+28h],eax
fffff80b`df154000 488d05b9670200  lea     rax,[storport!`string` (fffff80b`df17a7c0)]
fffff80b`df154007 4889442420      mov     qword ptr [rsp+20h],rax
fffff80b`df15400c e8c3960000      call    storport!McTemplateK0zzdqq (fffff80b`df15d6d4)
fffff80b`df154011 90              nop
fffff80b`df154012 e9efb7feff      jmp     storport!RaCallMiniportFindAdapter+0x29a (fffff80b`df13f806)  Branch

storport!RaCallMiniportFindAdapter+0x14aab:
fffff80b`df154017 448425c2d70200  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df15401e 741b            je      storport!RaCallMiniportFindAdapter+0x14acf (fffff80b`df15403b)  Branch

storport!RaCallMiniportFindAdapter+0x14ab4:
fffff80b`df154020 4489642438      mov     dword ptr [rsp+38h],r12d
fffff80b`df154025 4d8bce          mov     r9,r14
fffff80b`df154028 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80b`df15402c 4489642428      mov     dword ptr [rsp+28h],r12d
fffff80b`df154031 4c89742420      mov     qword ptr [rsp+20h],r14
fffff80b`df154036 e899960000      call    storport!McTemplateK0zzdqq (fffff80b`df15d6d4)

storport!RaCallMiniportFindAdapter+0x14acf:
fffff80b`df15403b 4489a3d0000000  mov     dword ptr [rbx+0D0h],r12d
fffff80b`df154042 418bf4          mov     esi,r12d
fffff80b`df154045 e989b6feff      jmp     storport!RaCallMiniportFindAdapter+0x167 (fffff80b`df13f6d3)  Branch

storport!RaCallMiniportFindAdapter+0x14ade:
fffff80b`df15404a 896c2438        mov     dword ptr [rsp+38h],ebp
fffff80b`df15404e 4d8bce          mov     r9,r14
fffff80b`df154051 894c2430        mov     dword ptr [rsp+30h],ecx
fffff80b`df154055 896c2428        mov     dword ptr [rsp+28h],ebp
fffff80b`df154059 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80b`df15405e e871960000      call    storport!McTemplateK0zzdqq (fffff80b`df15d6d4)
fffff80b`df154063 8bb3cc000000    mov     esi,dword ptr [rbx+0CCh]
fffff80b`df154069 e998b7feff      jmp     storport!RaCallMiniportFindAdapter+0x29a (fffff80b`df13f806)  Branch

storport!RaCallMiniportFindAdapter+0x14b02:
fffff80b`df15406e 4484256bd70200  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80b`df1817e0)],r12b
fffff80b`df154075 7424            je      storport!RaCallMiniportFindAdapter+0x14b2f (fffff80b`df15409b)  Branch

storport!RaCallMiniportFindAdapter+0x14b0b:
fffff80b`df154077 89742438        mov     dword ptr [rsp+38h],esi
fffff80b`df15407b 44894c2430      mov     dword ptr [rsp+30h],r9d
fffff80b`df154080 4c8d0d69670200  lea     r9,[storport!`string` (fffff80b`df17a7f0)]
fffff80b`df154087 89742428        mov     dword ptr [rsp+28h],esi
fffff80b`df15408b 4c89742420      mov     qword ptr [rsp+20h],r14
fffff80b`df154090 e83f960000      call    storport!McTemplateK0zzdqq (fffff80b`df15d6d4)
fffff80b`df154095 8bb3d0000000    mov     esi,dword ptr [rbx+0D0h]

storport!RaCallMiniportFindAdapter+0x14b2f:
fffff80b`df15409b 89b3d4000000    mov     dword ptr [rbx+0D4h],esi
fffff80b`df1540a1 448bce          mov     r9d,esi
fffff80b`df1540a4 e93ab6feff      jmp     storport!RaCallMiniportFindAdapter+0x177 (fffff80b`df13f6e3)  Branch

storport!RaCallMiniportFindAdapter+0x14b3d:
fffff80b`df1540a9 0fb683c4000000  movzx   eax,byte ptr [rbx+0C4h]
fffff80b`df1540b0 0fb64b53        movzx   ecx,byte ptr [rbx+53h]
fffff80b`df1540b4 0fb69392000000  movzx   edx,byte ptr [rbx+92h]
fffff80b`df1540bb 440fb64361      movzx   r8d,byte ptr [rbx+61h]
fffff80b`df1540c0 440fb65348      movzx   r10d,byte ptr [rbx+48h]
fffff80b`df1540c5 89842498000000  mov     dword ptr [rsp+98h],eax
fffff80b`df1540cc 8b83a0000000    mov     eax,dword ptr [rbx+0A0h]
fffff80b`df1540d2 898c2490000000  mov     dword ptr [rsp+90h],ecx
fffff80b`df1540d9 8b8bcc000000    mov     ecx,dword ptr [rbx+0CCh]
fffff80b`df1540df 89842488000000  mov     dword ptr [rsp+88h],eax
fffff80b`df1540e6 8b83d8000000    mov     eax,dword ptr [rbx+0D8h]
fffff80b`df1540ec 89842480000000  mov     dword ptr [rsp+80h],eax
fffff80b`df1540f3 8a8390000000    mov     al,byte ptr [rbx+90h]
fffff80b`df1540f9 88442478        mov     byte ptr [rsp+78h],al
fffff80b`df1540fd 8a4363          mov     al,byte ptr [rbx+63h]
fffff80b`df154100 88442470        mov     byte ptr [rsp+70h],al
fffff80b`df154104 8a4362          mov     al,byte ptr [rbx+62h]
fffff80b`df154107 88442468        mov     byte ptr [rsp+68h],al
fffff80b`df15410b 8b83dc000000    mov     eax,dword ptr [rbx+0DCh]
fffff80b`df154111 89442460        mov     dword ptr [rsp+60h],eax
fffff80b`df154115 8b83c0000000    mov     eax,dword ptr [rbx+0C0h]
fffff80b`df15411b 89442458        mov     dword ptr [rsp+58h],eax
fffff80b`df15411f 44894c2450      mov     dword ptr [rsp+50h],r9d
fffff80b`df154124 448b0b          mov     r9d,dword ptr [rbx]
fffff80b`df154127 89742448        mov     dword ptr [rsp+48h],esi
fffff80b`df15412b 894c2440        mov     dword ptr [rsp+40h],ecx
fffff80b`df15412f 8b4b18          mov     ecx,dword ptr [rbx+18h]
fffff80b`df154132 89542438        mov     dword ptr [rsp+38h],edx
fffff80b`df154136 488d15eb630200  lea     rdx,[storport!EventAdapterFinalPortConfigInfo (fffff80b`df17a528)]
fffff80b`df15413d 4489442430      mov     dword ptr [rsp+30h],r8d
fffff80b`df154142 4489542428      mov     dword ptr [rsp+28h],r10d
fffff80b`df154147 894c2420        mov     dword ptr [rsp+20h],ecx
fffff80b`df15414b e8e4930000      call    storport!McTemplateK0ddqqqqqqdduuuqqtt (fffff80b`df15d534)
fffff80b`df154150 90              nop
fffff80b`df154151 e99ab5feff      jmp     storport!RaCallMiniportFindAdapter+0x184 (fffff80b`df13f6f0)  Branch
