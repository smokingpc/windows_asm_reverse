;PciDispatchPnpPower(DEVOBJ, IRP)

0: kd> uf pci!PciDispatchPnpPower
pci!PciDispatchPnpPower:
fffff808`d84c3670 48895c2408      mov     qword ptr [rsp+8],rbx
fffff808`d84c3675 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff808`d84c367a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff808`d84c367f 57              push    rdi
fffff808`d84c3680 4154            push    r12
fffff808`d84c3682 4155            push    r13
fffff808`d84c3684 4156            push    r14
fffff808`d84c3686 4157            push    r15
fffff808`d84c3688 4883ec40        sub     rsp,40h
fffff808`d84c368c 4c8b7140        mov     r14,qword ptr [rcx+40h]   ;RCX = DEVICE_OBJECT, R14 = DevObj->DeviceExtension
fffff808`d84c3690 4532e4          xor     r12b,r12b
fffff808`d84c3693 488bb2b8000000  mov     rsi,qword ptr [rdx+0B8h]  ;rsi=IRP->CurrentStackLocation
fffff808`d84c369a 488bfa          mov     rdi,rdx       ;IRP
fffff808`d84c369d b900000080      mov     ecx,80000000h
fffff808`d84c36a2 41837e0402      cmp     dword ptr [r14+4],2   ;R14 = DevObj->DeviceExtension
fffff808`d84c36a7 0f845da40000    je      pci!PciDispatchPnpPower+0xa49a (fffff808`d84cdb0a)  Branch

pci!PciDispatchPnpPower+0x3d:
fffff808`d84c36ad 0fb606          movzx   eax,byte ptr [rsi]
fffff808`d84c36b0 3c1b            cmp     al,1Bh    ;if MajorCode != IRP_MJ_PNP, goto 0x2c1
fffff808`d84c36b2 0f8579020000    jne     pci!PciDispatchPnpPower+0x2c1 (fffff808`d84c3931)  Branch

pci!PciDispatchPnpPower+0x48:
fffff808`d84c36b8 41813e50636942  cmp     dword ptr [r14],42696350h ;check 1st stamp? => if stamp=='PciB', set r12b
fffff808`d84c36bf 4c8d054adc0100  lea     r8,[pci!PciDevice_DispatchPnpTable (fffff808`d84e1310)]
fffff808`d84c36c6 488d0db3d90100  lea     rcx,[pci!PciBus_DispatchPnpTable (fffff808`d84e1080)]
fffff808`d84c36cd ba19000000      mov     edx,19h
fffff808`d84c36d2 410f94c4        sete    r12b
fffff808`d84c36d6 490f45c8        cmovne  rcx,r8

pci!PciDispatchPnpPower+0x6a:
fffff808`d84c36da 0fb64601        movzx   eax,byte ptr [rsi+1]
fffff808`d84c36de 3bc2            cmp     eax,edx
fffff808`d84c36e0 0f874ba40000    ja      pci!PciDispatchPnpPower+0xa4c1 (fffff808`d84cdb31)  Branch

pci!PciDispatchPnpPower+0x76:
fffff808`d84c36e6 8bd0            mov     edx,eax

pci!PciDispatchPnpPower+0x78:
fffff808`d84c36e8 488d0452        lea     rax,[rdx+rdx*2]
fffff808`d84c36ec 8b2cc1          mov     ebp,dword ptr [rcx+rax*8]
fffff808`d84c36ef 4c8b6cc108      mov     r13,qword ptr [rcx+rax*8+8]
fffff808`d84c36f4 440fb67cc110    movzx   r15d,byte ptr [rcx+rax*8+10h]
fffff808`d84c36fa 83fd02          cmp     ebp,2
fffff808`d84c36fd 0f849b010000    je      pci!PciDispatchPnpPower+0x22e (fffff808`d84c389e)  Branch

pci!PciDispatchPnpPower+0x93:
fffff808`d84c3703 4584ff          test    r15b,r15b
fffff808`d84c3706 0f8594000000    jne     pci!PciDispatchPnpPower+0x130 (fffff808`d84c37a0)  Branch

pci!PciDispatchPnpPower+0x9c:
fffff808`d84c370c 4d8bc6          mov     r8,r14
fffff808`d84c370f 488bd6          mov     rdx,rsi
fffff808`d84c3712 488bcf          mov     rcx,rdi
fffff808`d84c3715 498bc5          mov     rax,r13
fffff808`d84c3718 ff155a000300    call    qword ptr [pci!_guard_dispatch_icall_fptr (fffff808`d84f3778)]
fffff808`d84c371e 8bd8            mov     ebx,eax
fffff808`d84c3720 4584ff          test    r15b,r15b
fffff808`d84c3723 0f85f8000000    jne     pci!PciDispatchPnpPower+0x1b1 (fffff808`d84c3821)  Branch

pci!PciDispatchPnpPower+0xb9:
fffff808`d84c3729 81fb03010000    cmp     ebx,103h
fffff808`d84c372f 0f8422020000    je      pci!PciDispatchPnpPower+0x2e7 (fffff808`d84c3957)  Branch

pci!PciDispatchPnpPower+0xc5:
fffff808`d84c3735 85ed            test    ebp,ebp
fffff808`d84c3737 7552            jne     pci!PciDispatchPnpPower+0x11b (fffff808`d84c378b)  Branch

pci!PciDispatchPnpPower+0xc9:
fffff808`d84c3739 b900000080      mov     ecx,80000000h

pci!PciDispatchPnpPower+0xce:
fffff808`d84c373e 32c0            xor     al,al

pci!PciDispatchPnpPower+0xd0:
fffff808`d84c3740 81fbbb0000c0    cmp     ebx,0C00000BBh
fffff808`d84c3746 743e            je      pci!PciDispatchPnpPower+0x116 (fffff808`d84c3786)  Branch

pci!PciDispatchPnpPower+0xd8:
fffff808`d84c3748 895f30          mov     dword ptr [rdi+30h],ebx
fffff808`d84c374b 84c0            test    al,al
fffff808`d84c374d 0f8584010000    jne     pci!PciDispatchPnpPower+0x267 (fffff808`d84c38d7)  Branch

pci!PciDispatchPnpPower+0xe3:
fffff808`d84c3753 33d2            xor     edx,edx
fffff808`d84c3755 488bcf          mov     rcx,rdi
fffff808`d84c3758 48ff1581fa0200  call    qword ptr [pci!_imp_IofCompleteRequest (fffff808`d84f31e0)]
fffff808`d84c375f 0f1f440000      nop     dword ptr [rax+rax]

pci!PciDispatchPnpPower+0xf4:
fffff808`d84c3764 8bc3            mov     eax,ebx

pci!PciDispatchPnpPower+0xf6:
fffff808`d84c3766 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff808`d84c376b 488b6c2478      mov     rbp,qword ptr [rsp+78h]
fffff808`d84c3770 488bb42480000000 mov     rsi,qword ptr [rsp+80h]
fffff808`d84c3778 4883c440        add     rsp,40h
fffff808`d84c377c 415f            pop     r15
fffff808`d84c377e 415e            pop     r14
fffff808`d84c3780 415d            pop     r13
fffff808`d84c3782 415c            pop     r12
fffff808`d84c3784 5f              pop     rdi
fffff808`d84c3785 c3              ret

pci!PciDispatchPnpPower+0x116:
fffff808`d84c3786 8b5f30          mov     ebx,dword ptr [rdi+30h]
fffff808`d84c3789 ebbd            jmp     pci!PciDispatchPnpPower+0xd8 (fffff808`d84c3748)  Branch

pci!PciDispatchPnpPower+0x11b:
fffff808`d84c378b 83ed01          sub     ebp,1
fffff808`d84c378e 0f8437010000    je      pci!PciDispatchPnpPower+0x25b (fffff808`d84c38cb)  Branch

pci!PciDispatchPnpPower+0x124:
fffff808`d84c3794 83ed01          sub     ebp,1
fffff808`d84c3797 74a0            je      pci!PciDispatchPnpPower+0xc9 (fffff808`d84c3739)  Branch

pci!PciDispatchPnpPower+0x129:
fffff808`d84c3799 83fd01          cmp     ebp,1
fffff808`d84c379c 74c6            je      pci!PciDispatchPnpPower+0xf4 (fffff808`d84c3764)  Branch

pci!PciDispatchPnpPower+0x12e:
fffff808`d84c379e eb99            jmp     pci!PciDispatchPnpPower+0xc9 (fffff808`d84c3739)  Branch

pci!PciDispatchPnpPower+0x130:
fffff808`d84c37a0 4584e4          test    r12b,r12b
fffff808`d84c37a3 0f8563ffffff    jne     pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0x139:
fffff808`d84c37a9 498b5e50        mov     rbx,qword ptr [r14+50h]
fffff808`d84c37ad 4885db          test    rbx,rbx
fffff808`d84c37b0 0f8456ffffff    je      pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0x146:
fffff808`d84c37b6 488b4360        mov     rax,qword ptr [rbx+60h]
fffff808`d84c37ba 4885c0          test    rax,rax
fffff808`d84c37bd 0f8543010000    jne     pci!PciDispatchPnpPower+0x296 (fffff808`d84c3906)  Branch

pci!PciDispatchPnpPower+0x153:
fffff808`d84c37c3 440f20c0        mov     rax,tmm
fffff808`d84c37c7 488b8b28030000  mov     rcx,qword ptr [rbx+328h]
fffff808`d84c37ce 0fb6c0          movzx   eax,al
fffff808`d84c37d1 89442430        mov     dword ptr [rsp+30h],eax
fffff808`d84c37d5 c744242809000000 mov     dword ptr [rsp+28h],9
fffff808`d84c37dd e84e020000      call    pci!WPP_RECORDER_SF_dd (fffff808`d84c3a30)
fffff808`d84c37e2 f0ff8374020000  lock inc dword ptr [rbx+274h]
fffff808`d84c37e9 488b8b20030000  mov     rcx,qword ptr [rbx+320h]
fffff808`d84c37f0 4885c9          test    rcx,rcx
fffff808`d84c37f3 0f843fa30000    je      pci!PciDispatchPnpPower+0xa4c8 (fffff808`d84cdb38)  Branch

pci!PciDispatchPnpPower+0x189:
fffff808`d84c37f9 33d2            xor     edx,edx
fffff808`d84c37fb 448d4202        lea     r8d,[rdx+2]
fffff808`d84c37ff 48ff15faf90200  call    qword ptr [pci!_imp_PoFxActivateComponent (fffff808`d84f3200)]
fffff808`d84c3806 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84c380b 8b83a8020000    mov     eax,dword ptr [rbx+2A8h]
fffff808`d84c3811 480fbae008      bt      rax,8
fffff808`d84c3816 0f82f0feffff    jb      pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0x1ac:
fffff808`d84c381c e941a30000      jmp     pci!PciDispatchPnpPower+0xa4f2 (fffff808`d84cdb62)  Branch

pci!PciDispatchPnpPower+0x1b1:
fffff808`d84c3821 4584e4          test    r12b,r12b
fffff808`d84c3824 0f85fffeffff    jne     pci!PciDispatchPnpPower+0xb9 (fffff808`d84c3729)  Branch

pci!PciDispatchPnpPower+0x1ba:
fffff808`d84c382a 498b7650        mov     rsi,qword ptr [r14+50h]
fffff808`d84c382e 4885f6          test    rsi,rsi
fffff808`d84c3831 0f84f2feffff    je      pci!PciDispatchPnpPower+0xb9 (fffff808`d84c3729)  Branch

pci!PciDispatchPnpPower+0x1c7:
fffff808`d84c3837 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff808`d84c383e 4c8d3d53f70100  lea     r15,[pci!WPP_b37e38feab743ee911c4b7c14d965edc_Traceguids (fffff808`d84e2f98)]
fffff808`d84c3845 41b915000000    mov     r9d,15h
fffff808`d84c384b c744242809000000 mov     dword ptr [rsp+28h],9
fffff808`d84c3853 b204            mov     dl,4
fffff808`d84c3855 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff808`d84c385a 458d41f0        lea     r8d,[r9-10h]
fffff808`d84c385e e85d020000      call    pci!WPP_RECORDER_SF_d (fffff808`d84c3ac0)
fffff808`d84c3863 488b4660        mov     rax,qword ptr [rsi+60h]
fffff808`d84c3867 4885c0          test    rax,rax
fffff808`d84c386a 0f85a5000000    jne     pci!PciDispatchPnpPower+0x2a5 (fffff808`d84c3915)  Branch

pci!PciDispatchPnpPower+0x200:
fffff808`d84c3870 f0ff8e74020000  lock dec dword ptr [rsi+274h]
fffff808`d84c3877 488b8e20030000  mov     rcx,qword ptr [rsi+320h]
fffff808`d84c387e 4885c9          test    rcx,rcx
fffff808`d84c3881 0f8411a30000    je      pci!PciDispatchPnpPower+0xa528 (fffff808`d84cdb98)  Branch

pci!PciDispatchPnpPower+0x217:
fffff808`d84c3887 33d2            xor     edx,edx
fffff808`d84c3889 448d4202        lea     r8d,[rdx+2]
fffff808`d84c388d 48ff15d4f90200  call    qword ptr [pci!_imp_PoFxIdleComponent (fffff808`d84f3268)]
fffff808`d84c3894 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84c3899 e98bfeffff      jmp     pci!PciDispatchPnpPower+0xb9 (fffff808`d84c3729)  Branch

pci!PciDispatchPnpPower+0x22e:
fffff808`d84c389e 488bd7          mov     rdx,rdi
fffff808`d84c38a1 498bce          mov     rcx,r14
fffff808`d84c38a4 e877b40300      call    pci!PciCallDownIrpStack (fffff808`d84fed20)
fffff808`d84c38a9 b900000080      mov     ecx,80000000h
fffff808`d84c38ae 8bd8            mov     ebx,eax
fffff808`d84c38b0 03c1            add     eax,ecx
fffff808`d84c38b2 85c1            test    ecx,eax
fffff808`d84c38b4 0f8549feffff    jne     pci!PciDispatchPnpPower+0x93 (fffff808`d84c3703)  Branch

pci!PciDispatchPnpPower+0x24a:
fffff808`d84c38ba 81fbbb0000c0    cmp     ebx,0C00000BBh
fffff808`d84c38c0 0f843dfeffff    je      pci!PciDispatchPnpPower+0x93 (fffff808`d84c3703)  Branch

pci!PciDispatchPnpPower+0x256:
fffff808`d84c38c6 e973feffff      jmp     pci!PciDispatchPnpPower+0xce (fffff808`d84c373e)  Branch

pci!PciDispatchPnpPower+0x25b:
fffff808`d84c38cb b001            mov     al,1
fffff808`d84c38cd b900000080      mov     ecx,80000000h
fffff808`d84c38d2 e969feffff      jmp     pci!PciDispatchPnpPower+0xd0 (fffff808`d84c3740)  Branch

pci!PciDispatchPnpPower+0x267:
fffff808`d84c38d7 8d040b          lea     eax,[rbx+rcx]
fffff808`d84c38da 85c1            test    ecx,eax
fffff808`d84c38dc 7446            je      pci!PciDispatchPnpPower+0x2b4 (fffff808`d84c3924)  Branch

pci!PciDispatchPnpPower+0x26e:
fffff808`d84c38de fe4743          inc     byte ptr [rdi+43h]
fffff808`d84c38e1 488bd7          mov     rdx,rdi
fffff808`d84c38e4 488387b800000048 add     qword ptr [rdi+0B8h],48h
fffff808`d84c38ec 498b8ee0000000  mov     rcx,qword ptr [r14+0E0h]
fffff808`d84c38f3 48ff15cef80200  call    qword ptr [pci!_imp_IofCallDriver (fffff808`d84f31c8)]
fffff808`d84c38fa 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84c38ff 8bd8            mov     ebx,eax
fffff808`d84c3901 e95efeffff      jmp     pci!PciDispatchPnpPower+0xf4 (fffff808`d84c3764)  Branch

pci!PciDispatchPnpPower+0x296:
fffff808`d84c3906 80780c02        cmp     byte ptr [rax+0Ch],2
fffff808`d84c390a 0f85b3feffff    jne     pci!PciDispatchPnpPower+0x153 (fffff808`d84c37c3)  Branch

pci!PciDispatchPnpPower+0x2a0:
fffff808`d84c3910 e9f7fdffff      jmp     pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0x2a5:
fffff808`d84c3915 80780c02        cmp     byte ptr [rax+0Ch],2
fffff808`d84c3919 0f8551ffffff    jne     pci!PciDispatchPnpPower+0x200 (fffff808`d84c3870)  Branch

pci!PciDispatchPnpPower+0x2af:
fffff808`d84c391f e905feffff      jmp     pci!PciDispatchPnpPower+0xb9 (fffff808`d84c3729)  Branch

pci!PciDispatchPnpPower+0x2b4:
fffff808`d84c3924 81fbbb0000c0    cmp     ebx,0C00000BBh
fffff808`d84c392a 74b2            je      pci!PciDispatchPnpPower+0x26e (fffff808`d84c38de)  Branch

pci!PciDispatchPnpPower+0x2bc:
fffff808`d84c392c e922feffff      jmp     pci!PciDispatchPnpPower+0xe3 (fffff808`d84c3753)  Branch

pci!PciDispatchPnpPower+0x2c1:
fffff808`d84c3931 3c16            cmp     al,16h    ;if IRP_MJ code != IRP_MJ_POWER, goto 0xa4a6 (return C000000D)
fffff808`d84c3933 0f85dda10000    jne     pci!PciDispatchPnpPower+0xa4a6 (fffff808`d84cdb16)  Branch

pci!PciDispatchPnpPower+0x2c9:
fffff808`d84c3939 41813e50636942  cmp     dword ptr [r14],42696350h
fffff808`d84c3940 0f84dca10000    je      pci!PciDispatchPnpPower+0xa4b2 (fffff808`d84cdb22)  Branch

pci!PciDispatchPnpPower+0x2d6:
fffff808`d84c3946 488d0db3d60100  lea     rcx,[pci!PciDevice_DispatchPowerTable (fffff808`d84e1000)]

pci!PciDispatchPnpPower+0x2dd:
fffff808`d84c394d ba03000000      mov     edx,3
fffff808`d84c3952 e983fdffff      jmp     pci!PciDispatchPnpPower+0x6a (fffff808`d84c36da)  Branch

pci!PciDispatchPnpPower+0x2e7:
fffff808`d84c3957 b803010000      mov     eax,103h
fffff808`d84c395c e905feffff      jmp     pci!PciDispatchPnpPower+0xf6 (fffff808`d84c3766)  Branch

pci!PciDispatchPnpPower+0xa49a:
fffff808`d84cdb0a bb0e0000c0      mov     ebx,0C000000Eh
fffff808`d84cdb0f 32c0            xor     al,al
fffff808`d84cdb11 e9325cffff      jmp     pci!PciDispatchPnpPower+0xd8 (fffff808`d84c3748)  Branch

pci!PciDispatchPnpPower+0xa4a6:
fffff808`d84cdb16 32c0            xor     al,al
fffff808`d84cdb18 bb0d0000c0      mov     ebx,0C000000Dh
fffff808`d84cdb1d e9265cffff      jmp     pci!PciDispatchPnpPower+0xd8 (fffff808`d84c3748)  Branch

pci!PciDispatchPnpPower+0xa4b2:
fffff808`d84cdb22 41b401          mov     r12b,1
fffff808`d84cdb25 488d0d64490100  lea     rcx,[pci!PciBus_DispatchPowerTable (fffff808`d84e2490)]
fffff808`d84cdb2c e91c5effff      jmp     pci!PciDispatchPnpPower+0x2dd (fffff808`d84c394d)  Branch

pci!PciDispatchPnpPower+0xa4c1:
fffff808`d84cdb31 ffc2            inc     edx
fffff808`d84cdb33 e9b05bffff      jmp     pci!PciDispatchPnpPower+0x78 (fffff808`d84c36e8)  Branch

pci!PciDispatchPnpPower+0xa4c8:
fffff808`d84cdb38 488b8b28030000  mov     rcx,qword ptr [rbx+328h]
fffff808`d84cdb3f 488d0552540100  lea     rax,[pci!WPP_b37e38feab743ee911c4b7c14d965edc_Traceguids (fffff808`d84e2f98)]
fffff808`d84cdb46 41b914000000    mov     r9d,14h
fffff808`d84cdb4c 4889442420      mov     qword ptr [rsp+20h],rax
fffff808`d84cdb51 b204            mov     dl,4
fffff808`d84cdb53 458d41f1        lea     r8d,[r9-0Fh]
fffff808`d84cdb57 e82459ffff      call    pci!WPP_RECORDER_SF_ (fffff808`d84c3480)
fffff808`d84cdb5c 90              nop
fffff808`d84cdb5d e9aa5bffff      jmp     pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0xa4f2:
fffff808`d84cdb62 440f20c0        mov     rax,tmm
fffff808`d84cdb66 3c02            cmp     al,2
fffff808`d84cdb68 0f839e5bffff    jae     pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0xa4fe:
fffff808`d84cdb6e 488d8b28020000  lea     rcx,[rbx+228h]
fffff808`d84cdb75 48c744242000000000 mov   qword ptr [rsp+20h],0
fffff808`d84cdb7e 4533c9          xor     r9d,r9d
fffff808`d84cdb81 4533c0          xor     r8d,r8d
fffff808`d84cdb84 33d2            xor     edx,edx
fffff808`d84cdb86 48ff151b5b0200  call    qword ptr [pci!_imp_KeWaitForSingleObject (fffff808`d84f36a8)]
fffff808`d84cdb8d 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84cdb92 90              nop
fffff808`d84cdb93 e9745bffff      jmp     pci!PciDispatchPnpPower+0x9c (fffff808`d84c370c)  Branch

pci!PciDispatchPnpPower+0xa528:
fffff808`d84cdb98 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff808`d84cdb9f 41b916000000    mov     r9d,16h
fffff808`d84cdba5 b204            mov     dl,4
fffff808`d84cdba7 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff808`d84cdbac 458d41ef        lea     r8d,[r9-11h]
fffff808`d84cdbb0 e8cb58ffff      call    pci!WPP_RECORDER_SF_ (fffff808`d84c3480)
fffff808`d84cdbb5 90              nop
fffff808`d84cdbb6 e96e5bffff      jmp     pci!PciDispatchPnpPower+0xb9 (fffff808`d84c3729)  Branch
