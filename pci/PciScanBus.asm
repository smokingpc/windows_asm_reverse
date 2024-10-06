42: kd> uf pci!PciScanBus
pci!PciScanBus:
fffff801`803d04d0 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff801`803d04d5 55              push    rbp
fffff801`803d04d6 56              push    rsi
fffff801`803d04d7 57              push    rdi
fffff801`803d04d8 4154            push    r12
fffff801`803d04da 4155            push    r13
fffff801`803d04dc 4156            push    r14
fffff801`803d04de 4157            push    r15
fffff801`803d04e0 488dac24a0f9ffff lea     rbp,[rsp-660h]
fffff801`803d04e8 4881ec60070000  sub     rsp,760h
fffff801`803d04ef 488b053abdfeff  mov     rax,qword ptr [pci!_security_cookie (fffff801`803bc230)]
fffff801`803d04f6 4833c4          xor     rax,rsp
fffff801`803d04f9 48898550060000  mov     qword ptr [rbp+650h],rax
fffff801`803d0500 4533ff          xor     r15d,r15d
fffff801`803d0503 4889542470      mov     qword ptr [rsp+70h],rdx
fffff801`803d0508 458bf7          mov     r14d,r15d
fffff801`803d050b 4c897c2468      mov     qword ptr [rsp+68h],r15
fffff801`803d0510 488bf1          mov     rsi,rcx
fffff801`803d0513 488b05e6bafeff  mov     rax,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d051a 488d0d6721feff  lea     rcx,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803d0521 6644397048      cmp     word ptr [rax+48h],r14w
fffff801`803d0526 0f85c0f80000    jne     pci!PciScanBus+0xf91c (fffff801`803dfdec)  Branch

pci!PciScanBus+0x5c:
fffff801`803d052c b201            mov     dl,1
fffff801`803d052e 488bce          mov     rcx,rsi
fffff801`803d0531 e8ba4dfcff      call    pci!PciHibernateInfoLogTime (fffff801`803952f0)
fffff801`803d0536 488b0553c0feff  mov     rax,qword ptr [pci!PciControlDevice (fffff801`803bc590)]
fffff801`803d053d 458be7          mov     r12d,r15d
fffff801`803d0540 488b7840        mov     rdi,qword ptr [rax+40h]
fffff801`803d0544 48ff156531ffff  call    qword ptr [pci!_imp_KeEnterCriticalRegion (fffff801`803c36b0)]
fffff801`803d054b 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d0550 4533c9          xor     r9d,r9d
fffff801`803d0553 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`803d0558 4533c0          xor     r8d,r8d
fffff801`803d055b 488d4f08        lea     rcx,[rdi+8]
fffff801`803d055f 33d2            xor     edx,edx
fffff801`803d0561 48ff154031ffff  call    qword ptr [pci!_imp_KeWaitForSingleObject (fffff801`803c36a8)]
fffff801`803d0568 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d056d 488b4728        mov     rax,qword ptr [rdi+28h]
fffff801`803d0571 4885c0          test    rax,rax
fffff801`803d0574 0f8595f80000    jne     pci!PciScanBus+0xf93f (fffff801`803dfe0f)  Branch

pci!PciScanBus+0xaa:
fffff801`803d057a 4533c0          xor     r8d,r8d
fffff801`803d057d 488d4f08        lea     rcx,[rdi+8]
fffff801`803d0581 33d2            xor     edx,edx
fffff801`803d0583 48ff151631ffff  call    qword ptr [pci!_imp_KeSetEvent (fffff801`803c36a0)]
fffff801`803d058a 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d058f 48ff150231ffff  call    qword ptr [pci!_imp_KeLeaveCriticalRegion (fffff801`803c3698)]
fffff801`803d0596 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d059b 488bce          mov     rcx,rsi
fffff801`803d059e e889050000      call    pci!PciFixupBridgeBusNumbers (fffff801`803d0b2c)
fffff801`803d05a3 488bce          mov     rcx,rsi
fffff801`803d05a6 e8a94efcff      call    pci!PciBusAffectedByConsoleLock (fffff801`80395454)
fffff801`803d05ab 84c0            test    al,al
fffff801`803d05ad 0f85dff80000    jne     pci!PciScanBus+0xf9c2 (fffff801`803dfe92)  Branch

pci!PciScanBus+0xe3:
fffff801`803d05b3 4c396660        cmp     qword ptr [rsi+60h],r12
fffff801`803d05b7 0f8452040000    je      pci!PciScanBus+0x53f (fffff801`803d0a0f)  Branch

pci!PciScanBus+0xed:
fffff801`803d05bd 48ff15ec30ffff  call    qword ptr [pci!_imp_KeEnterCriticalRegion (fffff801`803c36b0)]
fffff801`803d05c4 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d05c9 4533c9          xor     r9d,r9d
fffff801`803d05cc 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`803d05d1 4533c0          xor     r8d,r8d
fffff801`803d05d4 488d4e78        lea     rcx,[rsi+78h]
fffff801`803d05d8 33d2            xor     edx,edx
fffff801`803d05da 48ff15c730ffff  call    qword ptr [pci!_imp_KeWaitForSingleObject (fffff801`803c36a8)]
fffff801`803d05e1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d05e6 83be3401000001  cmp     dword ptr [rsi+134h],1
fffff801`803d05ed 488b4668        mov     rax,qword ptr [rsi+68h]
fffff801`803d05f1 4889442458      mov     qword ptr [rsp+58h],rax
fffff801`803d05f6 0f8505f90000    jne     pci!PciScanBus+0xfa31 (fffff801`803dff01)  Branch

pci!PciScanBus+0x12c:
fffff801`803d05fc 4885c0          test    rax,rax
fffff801`803d05ff 0f85bb030000    jne     pci!PciScanBus+0x4f0 (fffff801`803d09c0)  Branch

pci!PciScanBus+0x135:
fffff801`803d0605 4532f6          xor     r14b,r14b
fffff801`803d0608 44897c2460      mov     dword ptr [rsp+60h],r15d
fffff801`803d060d 4488742450      mov     byte ptr [rsp+50h],r14b
fffff801`803d0612 488d8ea8000000  lea     rcx,[rsi+0A8h]
fffff801`803d0619 41b601          mov     r14b,1
fffff801`803d061c 41bd250200c0    mov     r13d,0C0000225h
fffff801`803d0622 498bff          mov     rdi,r15
fffff801`803d0625 48ff15dc2affff  call    qword ptr [pci!_imp_RtlClearAllBits (fffff801`803c3108)]
fffff801`803d062c 0f1f440000      nop     dword ptr [rax+rax]

pci!PciScanBus+0x161:
fffff801`803d0631 4c8d4c2460      lea     r9,[rsp+60h]
fffff801`803d0636 450fb6c6        movzx   r8d,r14b
fffff801`803d063a 488bd7          mov     rdx,rdi
fffff801`803d063d 488bce          mov     rcx,rsi
fffff801`803d0640 e8bb46fcff      call    pci!PciBusGetNextSlotNumber (fffff801`80394d00)
fffff801`803d0645 0fb6f8          movzx   edi,al
fffff801`803d0648 488b0db1b9feff  mov     rcx,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d064f 8b5c2460        mov     ebx,dword ptr [rsp+60h]
fffff801`803d0653 6644396148      cmp     word ptr [rcx+48h],r12w
fffff801`803d0658 0f85f3f80000    jne     pci!PciScanBus+0xfa81 (fffff801`803dff51)  Branch

pci!PciScanBus+0x18e:
fffff801`803d065e 4084ff          test    dil,dil
fffff801`803d0661 0f846b020000    je      pci!PciScanBus+0x402 (fffff801`803d08d2)  Branch

pci!PciScanBus+0x197:
fffff801`803d0667 488b86b0000000  mov     rax,qword ptr [rsi+0B0h]
fffff801`803d066e 480fa318        bt      qword ptr [rax],rbx
fffff801`803d0672 0f825efb0000    jb      pci!PciScanBus+0xfd06 (fffff801`803e01d6)  Branch

pci!PciScanBus+0x1a8:
fffff801`803d0678 8bd3            mov     edx,ebx
fffff801`803d067a 488d8ea8000000  lea     rcx,[rsi+0A8h]
fffff801`803d0681 48ff15082bffff  call    qword ptr [pci!_imp_RtlSetBit (fffff801`803c3190)]
fffff801`803d0688 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d068d 488b7e68        mov     rdi,qword ptr [rsi+68h]
fffff801`803d0691 4532f6          xor     r14b,r14b
fffff801`803d0694 48897c2458      mov     qword ptr [rsp+58h],rdi
fffff801`803d0699 4885ff          test    rdi,rdi
fffff801`803d069c 741b            je      pci!PciScanBus+0x1e9 (fffff801`803d06b9)  Branch

pci!PciScanBus+0x1ce:
fffff801`803d069e 6690            xchg    ax,ax

pci!PciScanBus+0x1d0:
fffff801`803d06a0 8b471c          mov     eax,dword ptr [rdi+1Ch]
fffff801`803d06a3 3bc3            cmp     eax,ebx
fffff801`803d06a5 0f844a010000    je      pci!PciScanBus+0x325 (fffff801`803d07f5)  Branch

pci!PciScanBus+0x1db:
fffff801`803d06ab 488b7f58        mov     rdi,qword ptr [rdi+58h]
fffff801`803d06af 48897c2458      mov     qword ptr [rsp+58h],rdi
fffff801`803d06b4 4885ff          test    rdi,rdi
fffff801`803d06b7 75e7            jne     pci!PciScanBus+0x1d0 (fffff801`803d06a0)  Branch

pci!PciScanBus+0x1e9:
fffff801`803d06b9 4c8d8540060000  lea     r8,[rbp+640h]
fffff801`803d06c0 8bd3            mov     edx,ebx
fffff801`803d06c2 488bce          mov     rcx,rsi
fffff801`803d06c5 e88647fcff      call    pci!PciReadSlotIdData (fffff801`80394e50)
fffff801`803d06ca 85c0            test    eax,eax
fffff801`803d06cc 7922            jns     pci!PciScanBus+0x220 (fffff801`803d06f0)  Branch

pci!PciScanBus+0x1fe:
fffff801`803d06ce 3dc00000c0      cmp     eax,0C00000C0h
fffff801`803d06d3 0f8594f90000    jne     pci!PciScanBus+0xfb9d (fffff801`803e006d)  Branch

pci!PciScanBus+0x209:
fffff801`803d06d9 488b0520b9feff  mov     rax,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d06e0 6644396048      cmp     word ptr [rax+48h],r12w
fffff801`803d06e5 0f8446ffffff    je      pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0x21b:
fffff801`803d06eb e953f90000      jmp     pci!PciScanBus+0xfb73 (fffff801`803e0043)  Branch

pci!PciScanBus+0x220:
fffff801`803d06f0 488b0509b9feff  mov     rax,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d06f7 6644396048      cmp     word ptr [rax+48h],r12w
fffff801`803d06fc 0f8599f90000    jne     pci!PciScanBus+0xfbcb (fffff801`803e009b)  Branch

pci!PciScanBus+0x232:
fffff801`803d0702 488b7e68        mov     rdi,qword ptr [rsi+68h]
fffff801`803d0706 48897c2458      mov     qword ptr [rsp+58h],rdi
fffff801`803d070b 4885ff          test    rdi,rdi
fffff801`803d070e 7417            je      pci!PciScanBus+0x257 (fffff801`803d0727)  Branch

pci!PciScanBus+0x240:
fffff801`803d0710 395f1c          cmp     dword ptr [rdi+1Ch],ebx
fffff801`803d0713 0f8423010000    je      pci!PciScanBus+0x36c (fffff801`803d083c)  Branch

pci!PciScanBus+0x249:
fffff801`803d0719 488b7f58        mov     rdi,qword ptr [rdi+58h]
fffff801`803d071d 48897c2458      mov     qword ptr [rsp+58h],rdi
fffff801`803d0722 4885ff          test    rdi,rdi
fffff801`803d0725 75e9            jne     pci!PciScanBus+0x240 (fffff801`803d0710)  Branch

pci!PciScanBus+0x257:
fffff801`803d0727 4533c0          xor     r8d,r8d
fffff801`803d072a 488d4e78        lea     rcx,[rsi+78h]
fffff801`803d072e 33d2            xor     edx,edx
fffff801`803d0730 48ff15692fffff  call    qword ptr [pci!_imp_KeSetEvent (fffff801`803c36a0)]
fffff801`803d0737 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d073c 48ff15552fffff  call    qword ptr [pci!_imp_KeLeaveCriticalRegion (fffff801`803c3698)]
fffff801`803d0743 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d0748 488b05b1b8feff  mov     rax,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d074f 6644396048      cmp     word ptr [rax+48h],r12w
fffff801`803d0754 0f85b4f90000    jne     pci!PciScanBus+0xfc3e (fffff801`803e010e)  Branch

pci!PciScanBus+0x28a:
fffff801`803d075a 4c8b4c2468      mov     r9,qword ptr [rsp+68h]
fffff801`803d075f 488d442458      lea     rax,[rsp+58h]
fffff801`803d0764 4c8d8540060000  lea     r8,[rbp+640h]
fffff801`803d076b 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803d0770 8bd3            mov     edx,ebx
fffff801`803d0772 488bce          mov     rcx,rsi
fffff801`803d0775 e8b6d6ffff      call    pci!PciProcessNewDevice (fffff801`803cde30)
fffff801`803d077a 8bf8            mov     edi,eax
fffff801`803d077c 48ff152d2fffff  call    qword ptr [pci!_imp_KeEnterCriticalRegion (fffff801`803c36b0)]
fffff801`803d0783 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d0788 4533c9          xor     r9d,r9d
fffff801`803d078b 4c89642420      mov     qword ptr [rsp+20h],r12
fffff801`803d0790 4533c0          xor     r8d,r8d
fffff801`803d0793 488d4e78        lea     rcx,[rsi+78h]
fffff801`803d0797 33d2            xor     edx,edx
fffff801`803d0799 48ff15082fffff  call    qword ptr [pci!_imp_KeWaitForSingleObject (fffff801`803c36a8)]
fffff801`803d07a0 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d07a5 85ff            test    edi,edi
fffff801`803d07a7 0f88e3f90000    js      pci!PciScanBus+0xfcc0 (fffff801`803e0190)  Branch

pci!PciScanBus+0x2dd:
fffff801`803d07ad 488b7c2458      mov     rdi,qword ptr [rsp+58h]
fffff801`803d07b2 4885ff          test    rdi,rdi
fffff801`803d07b5 0f84d5f90000    je      pci!PciScanBus+0xfcc0 (fffff801`803e0190)  Branch

pci!PciScanBus+0x2eb:
fffff801`803d07bb 4c896758        mov     qword ptr [rdi+58h],r12
fffff801`803d07bf 4c8b4e68        mov     r9,qword ptr [rsi+68h]
fffff801`803d07c3 4d85c9          test    r9,r9
fffff801`803d07c6 0f8436020000    je      pci!PciScanBus+0x532 (fffff801`803d0a02)  Branch

pci!PciScanBus+0x2fc:
fffff801`803d07cc 488b5670        mov     rdx,qword ptr [rsi+70h]
fffff801`803d07d0 488bcf          mov     rcx,rdi
fffff801`803d07d3 e8a455fcff      call    pci!PciDeviceIsInHigherSlot (fffff801`80395d7c)
fffff801`803d07d8 84c0            test    al,al
fffff801`803d07da 0f8458f90000    je      pci!PciScanBus+0xfc68 (fffff801`803e0138)  Branch

pci!PciScanBus+0x310:
fffff801`803d07e0 48897a58        mov     qword ptr [rdx+58h],rdi
fffff801`803d07e4 48897e70        mov     qword ptr [rsi+70h],rdi

pci!PciScanBus+0x318:
fffff801`803d07e8 c644245001      mov     byte ptr [rsp+50h],1
fffff801`803d07ed 4533ed          xor     r13d,r13d
fffff801`803d07f0 e93cfeffff      jmp     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0x325:
fffff801`803d07f5 488b8f38050000  mov     rcx,qword ptr [rdi+538h]
fffff801`803d07fc ba00000080      mov     edx,80000000h
fffff801`803d0801 4885ca          test    rdx,rcx
fffff801`803d0804 0f8527feffff    jne     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0x33a:
fffff801`803d080a 480fbae109      bt      rcx,9
fffff801`803d080f 0f8296feffff    jb      pci!PciScanBus+0x1db (fffff801`803d06ab)  Branch

pci!PciScanBus+0x345:
fffff801`803d0815 488b0de4b7feff  mov     rcx,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d081c 6644396148      cmp     word ptr [rcx+48h],r12w
fffff801`803d0821 0f855df70000    jne     pci!PciScanBus+0xfab4 (fffff801`803dff84)  Branch

pci!PciScanBus+0x357:
fffff801`803d0827 488bcf          mov     rcx,rdi
fffff801`803d082a e8e10afcff      call    pci!PciIsDeviceConfigSpaceUnavailable (fffff801`80391310)
fffff801`803d082f 84c0            test    al,al
fffff801`803d0831 0f8474feffff    je      pci!PciScanBus+0x1db (fffff801`803d06ab)  Branch

pci!PciScanBus+0x367:
fffff801`803d0837 e986f70000      jmp     pci!PciScanBus+0xfaf2 (fffff801`803dffc2)  Branch

pci!PciScanBus+0x36c:
fffff801`803d083c 8b8738050000    mov     eax,dword ptr [rdi+538h]
fffff801`803d0842 480fbae009      bt      rax,9
fffff801`803d0847 0f82ccfeffff    jb      pci!PciScanBus+0x249 (fffff801`803d0719)  Branch

pci!PciScanBus+0x37d:
fffff801`803d084d 488d9540060000  lea     rdx,[rbp+640h]
fffff801`803d0854 488bcf          mov     rcx,rdi
fffff801`803d0857 e8944bfcff      call    pci!PciIsSameDevice (fffff801`803953f0)
fffff801`803d085c 84c0            test    al,al
fffff801`803d085e 0f84b5feffff    je      pci!PciScanBus+0x249 (fffff801`803d0719)  Branch

pci!PciScanBus+0x394:
fffff801`803d0864 488b0595b7feff  mov     rax,qword ptr [pci!WPP_GLOBAL_Control (fffff801`803bc000)]
fffff801`803d086b 6644396048      cmp     word ptr [rax+48h],r12w
fffff801`803d0870 0f8564f80000    jne     pci!PciScanBus+0xfc0a (fffff801`803e00da)  Branch

pci!PciScanBus+0x3a6:
fffff801`803d0876 488b542468      mov     rdx,qword ptr [rsp+68h]
fffff801`803d087b 4c8d442451      lea     r8,[rsp+51h]
fffff801`803d0880 488bcf          mov     rcx,rdi
fffff801`803d0883 e8f44afcff      call    pci!VmProxyCheckTearDown (fffff801`8039537c)
fffff801`803d0888 85c0            test    eax,eax
fffff801`803d088a 0f8874f80000    js      pci!PciScanBus+0xfc34 (fffff801`803e0104)  Branch

pci!PciScanBus+0x3c0:
fffff801`803d0890 4438642451      cmp     byte ptr [rsp+51h],r12b
fffff801`803d0895 0f858cfeffff    jne     pci!PciScanBus+0x257 (fffff801`803d0727)  Branch

pci!PciScanBus+0x3cb:
fffff801`803d089b f6c3e0          test    bl,0E0h
fffff801`803d089e 750d            jne     pci!PciScanBus+0x3dd (fffff801`803d08ad)  Branch

pci!PciScanBus+0x3d0:
fffff801`803d08a0 f6854c06000080  test    byte ptr [rbp+64Ch],80h
fffff801`803d08a7 0f8537010000    jne     pci!PciScanBus+0x514 (fffff801`803d09e4)  Branch

pci!PciScanBus+0x3dd:
fffff801`803d08ad f04881a738050000ffff7fff lock and qword ptr [rdi+538h],0FFFFFFFFFF7FFFFFh

pci!PciScanBus+0x3e9:
fffff801`803d08b9 f048818f3805000000010000 lock or qword ptr [rdi+538h],100h
fffff801`803d08c5 488b7c2458      mov     rdi,qword ptr [rsp+58h]
fffff801`803d08ca 4533ed          xor     r13d,r13d
fffff801`803d08cd e95ffdffff      jmp     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0x402:
fffff801`803d08d2 4c8d3daf1dfeff  lea     r15,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]

pci!PciScanBus+0x409:
fffff801`803d08d9 488b5e68        mov     rbx,qword ptr [rsi+68h]
fffff801`803d08dd 440fb6742450    movzx   r14d,byte ptr [rsp+50h]
fffff801`803d08e3 48895c2458      mov     qword ptr [rsp+58h],rbx
fffff801`803d08e8 4885db          test    rbx,rbx
fffff801`803d08eb 7428            je      pci!PciScanBus+0x445 (fffff801`803d0915)  Branch

pci!PciScanBus+0x41d:
fffff801`803d08ed 488bfb          mov     rdi,rbx

pci!PciScanBus+0x420:
fffff801`803d08f0 8b8338050000    mov     eax,dword ptr [rbx+538h]
fffff801`803d08f6 480fbae008      bt      rax,8
fffff801`803d08fb 0f8349010000    jae     pci!PciScanBus+0x57a (fffff801`803d0a4a)  Branch

pci!PciScanBus+0x431:
fffff801`803d0901 41ffc4          inc     r12d

pci!PciScanBus+0x434:
fffff801`803d0904 488b7b58        mov     rdi,qword ptr [rbx+58h]
fffff801`803d0908 488bdf          mov     rbx,rdi
fffff801`803d090b 48895c2458      mov     qword ptr [rsp+58h],rbx
fffff801`803d0910 4885ff          test    rdi,rdi
fffff801`803d0913 75db            jne     pci!PciScanBus+0x420 (fffff801`803d08f0)  Branch

pci!PciScanBus+0x445:
fffff801`803d0915 4533c0          xor     r8d,r8d
fffff801`803d0918 488d4e78        lea     rcx,[rsi+78h]
fffff801`803d091c 33d2            xor     edx,edx
fffff801`803d091e 48ff157b2dffff  call    qword ptr [pci!_imp_KeSetEvent (fffff801`803c36a0)]
fffff801`803d0925 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d092a 48ff15672dffff  call    qword ptr [pci!_imp_KeLeaveCriticalRegion (fffff801`803c3698)]
fffff801`803d0931 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803d0936 4584f6          test    r14b,r14b
fffff801`803d0939 0f85b6000000    jne     pci!PciScanBus+0x525 (fffff801`803d09f5)  Branch

pci!PciScanBus+0x46f:
fffff801`803d093f 4585e4          test    r12d,r12d
fffff801`803d0942 7457            je      pci!PciScanBus+0x4cb (fffff801`803d099b)  Branch

pci!PciScanBus+0x474:
fffff801`803d0944 488b442468      mov     rax,qword ptr [rsp+68h]
fffff801`803d0949 4885c0          test    rax,rax
fffff801`803d094c 0f85c8f80000    jne     pci!PciScanBus+0xfd4a (fffff801`803e021a)  Branch

pci!PciScanBus+0x482:
fffff801`803d0952 33d2            xor     edx,edx
fffff801`803d0954 488bce          mov     rcx,rsi
fffff801`803d0957 e89449fcff      call    pci!PciHibernateInfoLogTime (fffff801`803952f0)
fffff801`803d095c 33d2            xor     edx,edx
fffff801`803d095e 488bce          mov     rcx,rsi
fffff801`803d0961 e8064bfcff      call    pci!PciHibernateInfoUpdate (fffff801`8039546c)
fffff801`803d0966 488b442470      mov     rax,qword ptr [rsp+70h]
fffff801`803d096b 448920          mov     dword ptr [rax],r12d
fffff801`803d096e 418bc5          mov     eax,r13d
fffff801`803d0971 488b8d50060000  mov     rcx,qword ptr [rbp+650h]
fffff801`803d0978 4833cc          xor     rcx,rsp
fffff801`803d097b e8a0a9fcff      call    pci!_security_check_cookie (fffff801`8039b320)
fffff801`803d0980 488b9c24b0070000 mov     rbx,qword ptr [rsp+7B0h]
fffff801`803d0988 4881c460070000  add     rsp,760h
fffff801`803d098f 415f            pop     r15
fffff801`803d0991 415e            pop     r14
fffff801`803d0993 415d            pop     r13
fffff801`803d0995 415c            pop     r12
fffff801`803d0997 5f              pop     rdi
fffff801`803d0998 5e              pop     rsi
fffff801`803d0999 5d              pop     rbp
fffff801`803d099a c3              ret

pci!PciScanBus+0x4cb:
fffff801`803d099b f048818ea802000000000800 lock or qword ptr [rsi+2A8h],80000h
fffff801`803d09a7 488bce          mov     rcx,rsi
fffff801`803d09aa e8a54afcff      call    pci!PciBusAffectedByConsoleLock (fffff801`80395454)
fffff801`803d09af 84c0            test    al,al
fffff801`803d09b1 7491            je      pci!PciScanBus+0x474 (fffff801`803d0944)  Branch

pci!PciScanBus+0x4e3:
fffff801`803d09b3 e948f80000      jmp     pci!PciScanBus+0xfd30 (fffff801`803e0200)  Branch

pci!PciScanBus+0x4f0:
fffff801`803d09c0 f04881a038050000fffeffff lock and qword ptr [rax+538h],0FFFFFFFFFFFFFEFFh
fffff801`803d09cc 488b442458      mov     rax,qword ptr [rsp+58h]
fffff801`803d09d1 488b4058        mov     rax,qword ptr [rax+58h]
fffff801`803d09d5 4889442458      mov     qword ptr [rsp+58h],rax
fffff801`803d09da 4885c0          test    rax,rax
fffff801`803d09dd 75e1            jne     pci!PciScanBus+0x4f0 (fffff801`803d09c0)  Branch

pci!PciScanBus+0x50f:
fffff801`803d09df e921fcffff      jmp     pci!PciScanBus+0x135 (fffff801`803d0605)  Branch

pci!PciScanBus+0x514:
fffff801`803d09e4 f048818f3805000000008000 lock or qword ptr [rdi+538h],800000h
fffff801`803d09f0 e9c4feffff      jmp     pci!PciScanBus+0x3e9 (fffff801`803d08b9)  Branch

pci!PciScanBus+0x525:
fffff801`803d09f5 488bce          mov     rcx,rsi
fffff801`803d09f8 e897370000      call    pci!PciProcessBus (fffff801`803d4194)
fffff801`803d09fd e93dffffff      jmp     pci!PciScanBus+0x46f (fffff801`803d093f)  Branch

pci!PciScanBus+0x532:
fffff801`803d0a02 48897e70        mov     qword ptr [rsi+70h],rdi

pci!PciScanBus+0x536:
fffff801`803d0a06 48897e68        mov     qword ptr [rsi+68h],rdi
fffff801`803d0a0a e9d9fdffff      jmp     pci!PciScanBus+0x318 (fffff801`803d07e8)  Branch

pci!PciScanBus+0x53f:
fffff801`803d0a0f 0fba2529b8feff12 bt      dword ptr [pci!PciSystemWideHackFlags (fffff801`803bc240)],12h
fffff801`803d0a17 0f93c1          setae   cl
fffff801`803d0a1a 48f786a802000000000001 test qword ptr [rsi+2A8h],1000000h
fffff801`803d0a25 0f94c0          sete    al
fffff801`803d0a28 84c8            test    al,cl
fffff801`803d0a2a 0f848dfbffff    je      pci!PciScanBus+0xed (fffff801`803d05bd)  Branch

pci!PciScanBus+0x560:
fffff801`803d0a30 33d2            xor     edx,edx
fffff801`803d0a32 488bce          mov     rcx,rsi
fffff801`803d0a35 e88e570000      call    pci!PciPreScanBus (fffff801`803d61c8)
fffff801`803d0a3a 48818ea802000000000001 or qword ptr [rsi+2A8h],1000000h
fffff801`803d0a45 e973fbffff      jmp     pci!PciScanBus+0xed (fffff801`803d05bd)  Branch

pci!PciScanBus+0x57a:
fffff801`803d0a4a 41b601          mov     r14b,1
fffff801`803d0a4d f048818f3805000000020000 lock or qword ptr [rdi+538h],200h
fffff801`803d0a59 488b5c2458      mov     rbx,qword ptr [rsp+58h]
fffff801`803d0a5e 41b914000000    mov     r9d,14h
fffff801`803d0a64 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803d0a6b b203            mov     dl,3
fffff801`803d0a6d 48895c2428      mov     qword ptr [rsp+28h],rbx
fffff801`803d0a72 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`803d0a77 458d41ee        lea     r8d,[r9-12h]
fffff801`803d0a7b e85c58fcff      call    pci!WPP_RECORDER_SF_q (fffff801`803962dc)
fffff801`803d0a80 488b8e78030000  mov     rcx,qword ptr [rsi+378h]
fffff801`803d0a87 4885c9          test    rcx,rcx
fffff801`803d0a8a 0f8474feffff    je      pci!PciScanBus+0x434 (fffff801`803d0904)  Branch

pci!PciScanBus+0x5c0:
fffff801`803d0a90 8b571c          mov     edx,dword ptr [rdi+1Ch]
fffff801`803d0a93 e820b60000      call    pci!PciUnlinkResourceHint (fffff801`803dc0b8)
fffff801`803d0a98 e967feffff      jmp     pci!PciScanBus+0x434 (fffff801`803d0904)  Branch

pci!PciScanBus+0xf91c:
fffff801`803dfdec 41b90a000000    mov     r9d,0Ah
fffff801`803dfdf2 48894c2420      mov     qword ptr [rsp+20h],rcx
fffff801`803dfdf7 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803dfdfe b205            mov     dl,5
fffff801`803dfe00 458d41f8        lea     r8d,[r9-8]
fffff801`803dfe04 e87736fbff      call    pci!WPP_RECORDER_SF_ (fffff801`80393480)
fffff801`803dfe09 90              nop
fffff801`803dfe0a e91d07ffff      jmp     pci!PciScanBus+0x5c (fffff801`803d052c)  Branch

pci!PciScanBus+0xf93f:
fffff801`803dfe0f 48c7c1ffffffff  mov     rcx,0FFFFFFFFFFFFFFFFh

pci!PciScanBus+0xf946:
fffff801`803dfe16 48ffc1          inc     rcx
fffff801`803dfe19 6644392448      cmp     word ptr [rax+rcx*2],r12w
fffff801`803dfe1e 75f6            jne     pci!PciScanBus+0xf946 (fffff801`803dfe16)  Branch

pci!PciScanBus+0xf950:
fffff801`803dfe20 4885c9          test    rcx,rcx
fffff801`803dfe23 0f845107ffff    je      pci!PciScanBus+0xaa (fffff801`803d057a)  Branch

pci!PciScanBus+0xf959:
fffff801`803dfe29 8b5720          mov     edx,dword ptr [rdi+20h]
fffff801`803dfe2c b901000000      mov     ecx,1
fffff801`803dfe31 41b850636942    mov     r8d,42696350h
fffff801`803dfe37 48ff159a38feff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff801`803c36d8)]
fffff801`803dfe3e 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfe43 4889442468      mov     qword ptr [rsp+68h],rax
fffff801`803dfe48 4c8bf0          mov     r14,rax
fffff801`803dfe4b 4885c0          test    rax,rax
fffff801`803dfe4e 752c            jne     pci!PciScanBus+0xf9ac (fffff801`803dfe7c)  Branch

pci!PciScanBus+0xf980:
fffff801`803dfe50 4533c0          xor     r8d,r8d
fffff801`803dfe53 488d4f08        lea     rcx,[rdi+8]
fffff801`803dfe57 33d2            xor     edx,edx
fffff801`803dfe59 48ff154038feff  call    qword ptr [pci!_imp_KeSetEvent (fffff801`803c36a0)]
fffff801`803dfe60 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfe65 48ff152c38feff  call    qword ptr [pci!_imp_KeLeaveCriticalRegion (fffff801`803c3698)]
fffff801`803dfe6c 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfe71 41bd9a0000c0    mov     r13d,0C000009Ah
fffff801`803dfe77 e9d60affff      jmp     pci!PciScanBus+0x482 (fffff801`803d0952)  Branch

pci!PciScanBus+0xf9ac:
fffff801`803dfe7c 448b4720        mov     r8d,dword ptr [rdi+20h]
fffff801`803dfe80 488bc8          mov     rcx,rax
fffff801`803dfe83 488b5728        mov     rdx,qword ptr [rdi+28h]
fffff801`803dfe87 e874c2fbff      call    pci!memcpy (fffff801`8039c100)
fffff801`803dfe8c 90              nop
fffff801`803dfe8d e9e806ffff      jmp     pci!PciScanBus+0xaa (fffff801`803d057a)  Branch

pci!PciScanBus+0xf9c2:
fffff801`803dfe92 48ff151738feff  call    qword ptr [pci!_imp_KeEnterCriticalRegion (fffff801`803c36b0)]
fffff801`803dfe99 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfe9e 4533c9          xor     r9d,r9d
fffff801`803dfea1 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`803dfea6 4533c0          xor     r8d,r8d
fffff801`803dfea9 488d0d70c6fdff  lea     rcx,[pci!PciGlobalLock (fffff801`803bc520)]
fffff801`803dfeb0 33d2            xor     edx,edx
fffff801`803dfeb2 48ff15ef37feff  call    qword ptr [pci!_imp_KeWaitForSingleObject (fffff801`803c36a8)]
fffff801`803dfeb9 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfebe 488bce          mov     rcx,rsi
fffff801`803dfec1 e8226bfcff      call    pci!PciBusShouldBeDisabledByConsoleLock (fffff801`803a69e8)
fffff801`803dfec6 4533c0          xor     r8d,r8d
fffff801`803dfec9 488d0d50c6fdff  lea     rcx,[pci!PciGlobalLock (fffff801`803bc520)]
fffff801`803dfed0 33d2            xor     edx,edx
fffff801`803dfed2 0fb6d8          movzx   ebx,al
fffff801`803dfed5 48ff15c437feff  call    qword ptr [pci!_imp_KeSetEvent (fffff801`803c36a0)]
fffff801`803dfedc 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfee1 48ff15b037feff  call    qword ptr [pci!_imp_KeLeaveCriticalRegion (fffff801`803c3698)]
fffff801`803dfee8 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dfeed 84db            test    bl,bl
fffff801`803dfeef 7558            jne     pci!PciScanBus+0xfa79 (fffff801`803dff49)  Branch

pci!PciScanBus+0xfa21:
fffff801`803dfef1 33d2            xor     edx,edx
fffff801`803dfef3 488bce          mov     rcx,rsi
fffff801`803dfef6 e8d97a0000      call    pci!PciSetBusDisabledByConsoleLock (fffff801`803e79d4)
fffff801`803dfefb 90              nop
fffff801`803dfefc e9b206ffff      jmp     pci!PciScanBus+0xe3 (fffff801`803d05b3)  Branch

pci!PciScanBus+0xfa31:
fffff801`803dff01 4885c0          test    rax,rax
fffff801`803dff04 7422            je      pci!PciScanBus+0xfa58 (fffff801`803dff28)  Branch

pci!PciScanBus+0xfa36:
fffff801`803dff06 f04881883805000000010000 lock or qword ptr [rax+538h],100h
fffff801`803dff12 488b442458      mov     rax,qword ptr [rsp+58h]
fffff801`803dff17 41ffc4          inc     r12d
fffff801`803dff1a 488b4058        mov     rax,qword ptr [rax+58h]
fffff801`803dff1e 4889442458      mov     qword ptr [rsp+58h],rax
fffff801`803dff23 4885c0          test    rax,rax
fffff801`803dff26 75de            jne     pci!PciScanBus+0xfa36 (fffff801`803dff06)  Branch

pci!PciScanBus+0xfa58:
fffff801`803dff28 4533c0          xor     r8d,r8d
fffff801`803dff2b 488d4e78        lea     rcx,[rsi+78h]
fffff801`803dff2f 33d2            xor     edx,edx
fffff801`803dff31 48ff156837feff  call    qword ptr [pci!_imp_KeSetEvent (fffff801`803c36a0)]
fffff801`803dff38 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803dff3d 48ff155437feff  call    qword ptr [pci!_imp_KeLeaveCriticalRegion (fffff801`803c3698)]
fffff801`803dff44 0f1f440000      nop     dword ptr [rax+rax]

pci!PciScanBus+0xfa79:
fffff801`803dff49 458bef          mov     r13d,r15d
fffff801`803dff4c e9010affff      jmp     pci!PciScanBus+0x482 (fffff801`803d0952)  Branch

pci!PciScanBus+0xfa81:
fffff801`803dff51 448bc3          mov     r8d,ebx
fffff801`803dff54 400fb6cf        movzx   ecx,dil
fffff801`803dff58 41c1e805        shr     r8d,5
fffff801`803dff5c 8bd3            mov     edx,ebx
fffff801`803dff5e 4183e007        and     r8d,7
fffff801`803dff62 83e21f          and     edx,1Fh
fffff801`803dff65 4489442438      mov     dword ptr [rsp+38h],r8d
fffff801`803dff6a 89542430        mov     dword ptr [rsp+30h],edx
fffff801`803dff6e 894c2428        mov     dword ptr [rsp+28h],ecx
fffff801`803dff72 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803dff79 e8d27afcff      call    pci!WPP_RECORDER_SF_dDD (fffff801`803a7a50)
fffff801`803dff7e 90              nop
fffff801`803dff7f e9da06ffff      jmp     pci!PciScanBus+0x18e (fffff801`803d065e)  Branch

pci!PciScanBus+0xfab4:
fffff801`803dff84 8b8f3c040000    mov     ecx,dword ptr [rdi+43Ch]
fffff801`803dff8a 8bd0            mov     edx,eax
fffff801`803dff8c 894c2448        mov     dword ptr [rsp+48h],ecx
fffff801`803dff90 83e01f          and     eax,1Fh
fffff801`803dff93 8b8f08040000    mov     ecx,dword ptr [rdi+408h]
fffff801`803dff99 894c2440        mov     dword ptr [rsp+40h],ecx
fffff801`803dff9d 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803dffa4 c1ea05          shr     edx,5
fffff801`803dffa7 83e207          and     edx,7
fffff801`803dffaa 89542438        mov     dword ptr [rsp+38h],edx
fffff801`803dffae 89442430        mov     dword ptr [rsp+30h],eax
fffff801`803dffb2 48897c2428      mov     qword ptr [rsp+28h],rdi
fffff801`803dffb7 e8847bfcff      call    pci!WPP_RECORDER_SF_qDDLD (fffff801`803a7b40)
fffff801`803dffbc 90              nop
fffff801`803dffbd e96508ffff      jmp     pci!PciScanBus+0x357 (fffff801`803d0827)  Branch

pci!PciScanBus+0xfaf2:
fffff801`803dffc2 488b4750        mov     rax,qword ptr [rdi+50h]
fffff801`803dffc6 48b90000000080000000 mov rcx,8000000000h
fffff801`803dffd0 448b471c        mov     r8d,dword ptr [rdi+1Ch]
fffff801`803dffd4 8b90a8020000    mov     edx,dword ptr [rax+2A8h]
fffff801`803dffda 488d05cf54fdff  lea     rax,[pci!`string' (fffff801`803b54b0)]
fffff801`803dffe1 48c1ea1e        shr     rdx,1Eh
fffff801`803dffe5 83e201          and     edx,1
fffff801`803dffe8 48858f38050000  test    qword ptr [rdi+538h],rcx
fffff801`803dffef 488d0db254fdff  lea     rcx,[pci!`string' (fffff801`803b54a8)]
fffff801`803dfff6 4889542448      mov     qword ptr [rsp+48h],rdx
fffff801`803dfffb 480f45c8        cmovne  rcx,rax
fffff801`803dffff 418bc0          mov     eax,r8d
fffff801`803e0002 48894c2440      mov     qword ptr [rsp+40h],rcx
fffff801`803e0007 4183e01f        and     r8d,1Fh
fffff801`803e000b 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e0012 c1e805          shr     eax,5
fffff801`803e0015 83e007          and     eax,7
fffff801`803e0018 89442438        mov     dword ptr [rsp+38h],eax
fffff801`803e001c 8b4718          mov     eax,dword ptr [rdi+18h]
fffff801`803e001f 4489442430      mov     dword ptr [rsp+30h],r8d
fffff801`803e0024 89442428        mov     dword ptr [rsp+28h],eax
fffff801`803e0028 e85778fcff      call    pci!WPP_RECORDER_SF_DDDsI (fffff801`803a7884)
fffff801`803e002d f048818f3805000000010000 lock or qword ptr [rdi+538h],100h
fffff801`803e0039 488b7c2458      mov     rdi,qword ptr [rsp+58h]
fffff801`803e003e e9ee05ffff      jmp     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0xfb73:
fffff801`803e0043 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e004a 488d053726fdff  lea     rax,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803e0051 41b90f000000    mov     r9d,0Fh
fffff801`803e0057 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803e005c b205            mov     dl,5
fffff801`803e005e 458d41f3        lea     r8d,[r9-0Dh]
fffff801`803e0062 e81934fbff      call    pci!WPP_RECORDER_SF_ (fffff801`80393480)
fffff801`803e0067 90              nop
fffff801`803e0068 e9c405ffff      jmp     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0xfb9d:
fffff801`803e006d 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e0074 41b910000000    mov     r9d,10h
fffff801`803e007a 89442428        mov     dword ptr [rsp+28h],eax
fffff801`803e007e b203            mov     dl,3
fffff801`803e0080 488d050126fdff  lea     rax,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803e0087 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803e008c 458d41f2        lea     r8d,[r9-0Eh]
fffff801`803e0090 e82b3afbff      call    pci!WPP_RECORDER_SF_d (fffff801`80393ac0)
fffff801`803e0095 90              nop
fffff801`803e0096 e99605ffff      jmp     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0xfbcb:
fffff801`803e009b 8bcb            mov     ecx,ebx
fffff801`803e009d 8bc3            mov     eax,ebx
fffff801`803e009f c1e905          shr     ecx,5
fffff801`803e00a2 83e01f          and     eax,1Fh
fffff801`803e00a5 83e107          and     ecx,7
fffff801`803e00a8 41b911000000    mov     r9d,11h
fffff801`803e00ae 894c2430        mov     dword ptr [rsp+30h],ecx
fffff801`803e00b2 b205            mov     dl,5
fffff801`803e00b4 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e00bb 89442428        mov     dword ptr [rsp+28h],eax
fffff801`803e00bf 488d05c225fdff  lea     rax,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803e00c6 458d41f1        lea     r8d,[r9-0Fh]
fffff801`803e00ca 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803e00cf e86831fbff      call    pci!WPP_RECORDER_SF_DD (fffff801`8039323c)
fffff801`803e00d4 90              nop
fffff801`803e00d5 e92806ffff      jmp     pci!PciScanBus+0x232 (fffff801`803d0702)  Branch

pci!PciScanBus+0xfc0a:
fffff801`803e00da 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e00e1 488d05a025fdff  lea     rax,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803e00e8 41b912000000    mov     r9d,12h
fffff801`803e00ee 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803e00f3 b205            mov     dl,5
fffff801`803e00f5 458d41f0        lea     r8d,[r9-10h]
fffff801`803e00f9 e88233fbff      call    pci!WPP_RECORDER_SF_ (fffff801`80393480)
fffff801`803e00fe 90              nop
fffff801`803e00ff e97207ffff      jmp     pci!PciScanBus+0x3a6 (fffff801`803d0876)  Branch

pci!PciScanBus+0xfc34:
fffff801`803e0104 4488642451      mov     byte ptr [rsp+51h],r12b
fffff801`803e0109 e98d07ffff      jmp     pci!PciScanBus+0x3cb (fffff801`803d089b)  Branch

pci!PciScanBus+0xfc3e:
fffff801`803e010e 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e0115 488d056c25fdff  lea     rax,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803e011c 41b913000000    mov     r9d,13h
fffff801`803e0122 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`803e0127 b205            mov     dl,5
fffff801`803e0129 458d41ef        lea     r8d,[r9-11h]
fffff801`803e012d e84e33fbff      call    pci!WPP_RECORDER_SF_ (fffff801`80393480)
fffff801`803e0132 90              nop
fffff801`803e0133 e92206ffff      jmp     pci!PciScanBus+0x28a (fffff801`803d075a)  Branch

pci!PciScanBus+0xfc68:
fffff801`803e0138 488bd7          mov     rdx,rdi
fffff801`803e013b 498bc9          mov     rcx,r9
fffff801`803e013e e8395cfbff      call    pci!PciDeviceIsInHigherSlot (fffff801`80395d7c)
fffff801`803e0143 84c0            test    al,al
fffff801`803e0145 7409            je      pci!PciScanBus+0xfc80 (fffff801`803e0150)  Branch

pci!PciScanBus+0xfc77:
fffff801`803e0147 4c894f58        mov     qword ptr [rdi+58h],r9
fffff801`803e014b e9b608ffff      jmp     pci!PciScanBus+0x536 (fffff801`803d0a06)  Branch

pci!PciScanBus+0xfc80:
fffff801`803e0150 498b5158        mov     rdx,qword ptr [r9+58h]
fffff801`803e0154 4885d2          test    rdx,rdx
fffff801`803e0157 7418            je      pci!PciScanBus+0xfca1 (fffff801`803e0171)  Branch

pci!PciScanBus+0xfc89:
fffff801`803e0159 488bcf          mov     rcx,rdi
fffff801`803e015c e81b5cfbff      call    pci!PciDeviceIsInHigherSlot (fffff801`80395d7c)
fffff801`803e0161 84c0            test    al,al
fffff801`803e0163 740c            je      pci!PciScanBus+0xfca1 (fffff801`803e0171)  Branch

pci!PciScanBus+0xfc95:
fffff801`803e0165 4c8bca          mov     r9,rdx
fffff801`803e0168 488b5258        mov     rdx,qword ptr [rdx+58h]
fffff801`803e016c 4885d2          test    rdx,rdx
fffff801`803e016f 75e8            jne     pci!PciScanBus+0xfc89 (fffff801`803e0159)  Branch

pci!PciScanBus+0xfca1:
fffff801`803e0171 498b4158        mov     rax,qword ptr [r9+58h]
fffff801`803e0175 48894758        mov     qword ptr [rdi+58h],rax
fffff801`803e0179 49897958        mov     qword ptr [r9+58h],rdi
fffff801`803e017d 4c394e70        cmp     qword ptr [rsi+70h],r9
fffff801`803e0181 0f856106ffff    jne     pci!PciScanBus+0x318 (fffff801`803d07e8)  Branch

pci!PciScanBus+0xfcb7:
fffff801`803e0187 48897e70        mov     qword ptr [rsi+70h],rdi
fffff801`803e018b e95806ffff      jmp     pci!PciScanBus+0x318 (fffff801`803d07e8)  Branch

pci!PciScanBus+0xfcc0:
fffff801`803e0190 33d2            xor     edx,edx
fffff801`803e0192 488d4d80        lea     rcx,[rbp-80h]
fffff801`803e0196 41b8c0060000    mov     r8d,6C0h
fffff801`803e019c e89fc2fbff      call    pci!memset (fffff801`8039c440)
fffff801`803e01a1 f6854c06000080  test    byte ptr [rbp+64Ch],80h
fffff801`803e01a8 8b86f4000000    mov     eax,dword ptr [rsi+0F4h]
fffff801`803e01ae 894598          mov     dword ptr [rbp-68h],eax
fffff801`803e01b1 488b4658        mov     rax,qword ptr [rsi+58h]
fffff801`803e01b5 488945c8        mov     qword ptr [rbp-38h],rax
fffff801`803e01b9 895d9c          mov     dword ptr [rbp-64h],ebx
fffff801`803e01bc 488975d0        mov     qword ptr [rbp-30h],rsi
fffff801`803e01c0 740b            je      pci!PciScanBus+0xfcfd (fffff801`803e01cd)  Branch

pci!PciScanBus+0xfcf2:
fffff801`803e01c2 48818db804000000008000 or qword ptr [rbp+4B8h],800000h

pci!PciScanBus+0xfcfd:
fffff801`803e01cd 488d7d80        lea     rdi,[rbp-80h]
fffff801`803e01d1 e95b04ffff      jmp     pci!PciScanBus+0x161 (fffff801`803d0631)  Branch

pci!PciScanBus+0xfd06:
fffff801`803e01d6 488b8e28030000  mov     rcx,qword ptr [rsi+328h]
fffff801`803e01dd 4c8d3da424fdff  lea     r15,[pci!WPP_3156d917037e3c67601dfc4e477ca06a_Traceguids (fffff801`803b2688)]
fffff801`803e01e4 41b90c000000    mov     r9d,0Ch
fffff801`803e01ea 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`803e01ef b203            mov     dl,3
fffff801`803e01f1 458d41f6        lea     r8d,[r9-0Ah]
fffff801`803e01f5 e88632fbff      call    pci!WPP_RECORDER_SF_ (fffff801`80393480)
fffff801`803e01fa 90              nop
fffff801`803e01fb e9d906ffff      jmp     pci!PciScanBus+0x409 (fffff801`803d08d9)  Branch

pci!PciScanBus+0xfd30:
fffff801`803e0200 e8e367fcff      call    pci!PciBusShouldBeDisabledByConsoleLock (fffff801`803a69e8)
fffff801`803e0205 84c0            test    al,al
fffff801`803e0207 0f843707ffff    je      pci!PciScanBus+0x474 (fffff801`803d0944)  Branch

pci!PciScanBus+0xfd3d:
fffff801`803e020d b201            mov     dl,1
fffff801`803e020f e8c0770000      call    pci!PciSetBusDisabledByConsoleLock (fffff801`803e79d4)
fffff801`803e0214 90              nop
fffff801`803e0215 e92a07ffff      jmp     pci!PciScanBus+0x474 (fffff801`803d0944)  Branch

pci!PciScanBus+0xfd4a:
fffff801`803e021a ba50636942      mov     edx,42696350h
fffff801`803e021f 488bc8          mov     rcx,rax
fffff801`803e0222 48ff152f35feff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff801`803c3758)]
fffff801`803e0229 0f1f440000      nop     dword ptr [rax+rax]
fffff801`803e022e 90              nop
fffff801`803e022f e91e07ffff      jmp     pci!PciScanBus+0x482 (fffff801`803d0952)  Branch
