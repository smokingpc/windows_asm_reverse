4: kd> uf nt!PiProcessNewDeviceNode
nt!PiProcessNewDeviceNode:
fffff805`62104c80 488bc4          mov     rax,rsp
fffff805`62104c83 48895810        mov     qword ptr [rax+10h],rbx
fffff805`62104c87 48897018        mov     qword ptr [rax+18h],rsi
fffff805`62104c8b 48897820        mov     qword ptr [rax+20h],rdi
fffff805`62104c8f 55              push    rbp
fffff805`62104c90 4154            push    r12
fffff805`62104c92 4155            push    r13
fffff805`62104c94 4156            push    r14
fffff805`62104c96 4157            push    r15
fffff805`62104c98 488da828ffffff  lea     rbp,[rax-0D8h]
fffff805`62104c9f 4881ecb0010000  sub     rsp,1B0h
fffff805`62104ca6 488b05d3e0d1ff  mov     rax,qword ptr [nt!_security_cookie (fffff805`61e22d80)]
fffff805`62104cad 4833c4          xor     rax,rsp
fffff805`62104cb0 488985a0000000  mov     qword ptr [rbp+0A0h],rax
fffff805`62104cb7 33f6            xor     esi,esi
fffff805`62104cb9 488bf9          mov     rdi,rcx
fffff805`62104cbc f60544ead1ff08  test    byte ptr [nt!Microsoft_Windows_Kernel_PnPEnableBits+0x3 (fffff805`61e23707)],8
fffff805`62104cc3 488975e8        mov     qword ptr [rbp-18h],rsi
fffff805`62104cc7 0f85ffc90900    jne     nt!PiProcessNewDeviceNode+0x9ca4c (fffff805`621a16cc)  Branch

nt!PiProcessNewDeviceNode+0x4d:
fffff805`62104ccd 48b81400000080f7ffff mov rax,0FFFFF78000000014h
fffff805`62104cd7 4088742474      mov     byte ptr [rsp+74h],sil
fffff805`62104cdc 488d4de8        lea     rcx,[rbp-18h]
fffff805`62104ce0 4088742450      mov     byte ptr [rsp+50h],sil
fffff805`62104ce5 897580          mov     dword ptr [rbp-80h],esi
fffff805`62104ce8 448bee          mov     r13d,esi
fffff805`62104ceb 4c8be6          mov     r12,rsi
fffff805`62104cee 8974245c        mov     dword ptr [rsp+5Ch],esi
fffff805`62104cf2 488b00          mov     rax,qword ptr [rax]
fffff805`62104cf5 4c8b7f20        mov     r15,qword ptr [rdi+20h]
fffff805`62104cf9 48894500        mov     qword ptr [rbp],rax
fffff805`62104cfd 89742454        mov     dword ptr [rsp+54h],esi
fffff805`62104d01 89742478        mov     dword ptr [rsp+78h],esi
fffff805`62104d05 89742458        mov     dword ptr [rsp+58h],esi
fffff805`62104d09 4088742451      mov     byte ptr [rsp+51h],sil
fffff805`62104d0e 4889742468      mov     qword ptr [rsp+68h],rsi
fffff805`62104d13 e8a484f2ff      call    nt!PiPnpRtlBeginOperation (fffff805`6202d1bc)
fffff805`62104d18 ba00000002      mov     edx,2000000h
fffff805`62104d1d 488bcf          mov     rcx,rdi
fffff805`62104d20 e81b250000      call    nt!PipClearDevNodeFlags (fffff805`62107240)
fffff805`62104d25 4c8d4df0        lea     r9,[rbp-10h]
fffff805`62104d29 488975c0        mov     qword ptr [rbp-40h],rsi
fffff805`62104d2d 4c8d45f8        lea     r8,[rbp-8]
fffff805`62104d31 48897598        mov     qword ptr [rbp-68h],rsi
fffff805`62104d35 33d2            xor     edx,edx
fffff805`62104d37 488bcf          mov     rcx,rdi
fffff805`62104d3a e879830000      call    nt!PnpQueryID (fffff805`6210d0b8)
fffff805`62104d3f 85c0            test    eax,eax
fffff805`62104d41 0f889dc90900    js      nt!PiProcessNewDeviceNode+0x9ca64 (fffff805`621a16e4)  Branch

nt!PiProcessNewDeviceNode+0xc7:
fffff805`62104d47 488b75f8        mov     rsi,qword ptr [rbp-8]
fffff805`62104d4b ba5c000000      mov     edx,5Ch
fffff805`62104d50 488bce          mov     rcx,rsi
fffff805`62104d53 488975c0        mov     qword ptr [rbp-40h],rsi
fffff805`62104d57 e814faaaff      call    nt!wcschr (fffff805`61bb4770)
fffff805`62104d5c 33f6            xor     esi,esi
fffff805`62104d5e 668930          mov     word ptr [rax],si
fffff805`62104d61 4883c002        add     rax,2
fffff805`62104d65 48894598        mov     qword ptr [rbp-68h],rax

nt!PiProcessNewDeviceNode+0xe9:
fffff805`62104d69 488d5550        lea     rdx,[rbp+50h]
fffff805`62104d6d 498bcf          mov     rcx,r15
fffff805`62104d70 e88f760000      call    nt!PpIrpQueryCapabilities (fffff805`6210c404)
fffff805`62104d75 ba02000000      mov     edx,2
fffff805`62104d7a 488bcf          mov     rcx,rdi
fffff805`62104d7d 8bd8            mov     ebx,eax
fffff805`62104d7f e8785d0000      call    nt!PipClearDevNodeUserFlags (fffff805`6210aafc)
fffff805`62104d84 448af6          mov     r14b,sil
fffff805`62104d87 b900000200      mov     ecx,20000h
fffff805`62104d8c 85db            test    ebx,ebx
fffff805`62104d8e 0f8866c90900    js      nt!PiProcessNewDeviceNode+0x9ca7a (fffff805`621a16fa)  Branch

nt!PiProcessNewDeviceNode+0x114:
fffff805`62104d94 854d54          test    dword ptr [rbp+54h],ecx
fffff805`62104d97 0f85be0c0000    jne     nt!PiProcessNewDeviceNode+0xddb (fffff805`62105a5b)  Branch

nt!PiProcessNewDeviceNode+0x11d:
fffff805`62104d9d f6455440        test    byte ptr [rbp+54h],40h
fffff805`62104da1 bb01000000      mov     ebx,1
fffff805`62104da6 450fb6f6        movzx   r14d,r14b
fffff805`62104daa 440f45f3        cmovne  r14d,ebx

nt!PiProcessNewDeviceNode+0x12e:
fffff805`62104dae f6455420        test    byte ptr [rbp+54h],20h
fffff805`62104db2 0f854cc90900    jne     nt!PiProcessNewDeviceNode+0x9ca84 (fffff805`621a1704)  Branch

nt!PiProcessNewDeviceNode+0x138:
fffff805`62104db8 8bc6            mov     eax,esi

nt!PiProcessNewDeviceNode+0x13a:
fffff805`62104dba 898738020000    mov     dword ptr [rdi+238h],eax
fffff805`62104dc0 488d158113c7ff  lea     rdx,[nt!GUID_PNP_EXTENDED_ADDRESS_INTERFACE (fffff805`61d76148)]
fffff805`62104dc7 4883c8ff        or      rax,0FFFFFFFFFFFFFFFFh
fffff805`62104dcb 448bc3          mov     r8d,ebx
fffff805`62104dce 488945a8        mov     qword ptr [rbp-58h],rax
fffff805`62104dd2 498bcf          mov     rcx,r15
fffff805`62104dd5 448d4829        lea     r9d,[rax+29h]
fffff805`62104dd9 488d4520        lea     rax,[rbp+20h]
fffff805`62104ddd 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62104de2 4889742420      mov     qword ptr [rsp+20h],rsi
fffff805`62104de7 e8ac0c0100      call    nt!PnpQueryInterface (fffff805`62115a98)
fffff805`62104dec 85c0            test    eax,eax
fffff805`62104dee 0f8928c90900    jns     nt!PiProcessNewDeviceNode+0x9ca9c (fffff805`621a171c)  Branch

nt!PiProcessNewDeviceNode+0x174:
fffff805`62104df4 4883c9ff        or      rcx,0FFFFFFFFFFFFFFFFh
fffff805`62104df8 48894da8        mov     qword ptr [rbp-58h],rcx

nt!PiProcessNewDeviceNode+0x17c:
fffff805`62104dfc 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff805`62104e00 4c8d4db0        lea     r9,[rbp-50h]
fffff805`62104e04 33d2            xor     edx,edx
fffff805`62104e06 e889560100      call    nt!PnpQueryDeviceText (fffff805`6211a494)
fffff805`62104e0b 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff805`62104e0f 4c8d4de0        lea     r9,[rbp-20h]
fffff805`62104e13 8bd3            mov     edx,ebx
fffff805`62104e15 e87a560100      call    nt!PnpQueryDeviceText (fffff805`6211a494)
fffff805`62104e1a 4c8d4df4        lea     r9,[rbp-0Ch]
fffff805`62104e1e ba03000000      mov     edx,3
fffff805`62104e23 4c8d4590        lea     r8,[rbp-70h]
fffff805`62104e27 488bcf          mov     rcx,rdi
fffff805`62104e2a e889820000      call    nt!PnpQueryID (fffff805`6210d0b8)
fffff805`62104e2f 8bd8            mov     ebx,eax
fffff805`62104e31 4584f6          test    r14b,r14b
fffff805`62104e34 0f844e090000    je      nt!PiProcessNewDeviceNode+0xb08 (fffff805`62105788)  Branch

nt!PiProcessNewDeviceNode+0x1ba:
fffff805`62104e3a 41b8bb0000c0    mov     r8d,0C00000BBh
fffff805`62104e40 413bc0          cmp     eax,r8d
fffff805`62104e43 0f8425c90900    je      nt!PiProcessNewDeviceNode+0x9caee (fffff805`621a176e)  Branch

nt!PiProcessNewDeviceNode+0x1c9:
fffff805`62104e49 488b7590        mov     rsi,qword ptr [rbp-70h]

nt!PiProcessNewDeviceNode+0x1cd:
fffff805`62104e4d 85db            test    ebx,ebx
fffff805`62104e4f 0f8847c90900    js      nt!PiProcessNewDeviceNode+0x9cb1c (fffff805`621a179c)  Branch

nt!PiProcessNewDeviceNode+0x1d5:
fffff805`62104e55 4c8b4598        mov     r8,qword ptr [rbp-68h]
fffff805`62104e59 4c8bce          mov     r9,rsi
fffff805`62104e5c 488b55c0        mov     rdx,qword ptr [rbp-40h]
fffff805`62104e60 488bcf          mov     rcx,rdi
fffff805`62104e63 e8fc620100      call    nt!PiBuildDeviceNodeInstancePath (fffff805`6211b164)
fffff805`62104e68 8bd8            mov     ebx,eax
fffff805`62104e6a 85c0            test    eax,eax
fffff805`62104e6c 7843            js      nt!PiProcessNewDeviceNode+0x231 (fffff805`62104eb1)  Branch

nt!PiProcessNewDeviceNode+0x1ee:
fffff805`62104e6e f60592e8d1ff08  test    byte ptr [nt!Microsoft_Windows_Kernel_PnPEnableBits+0x3 (fffff805`61e23707)],8
fffff805`62104e75 0f8565c90900    jne     nt!PiProcessNewDeviceNode+0x9cb60 (fffff805`621a17e0)  Branch

nt!PiProcessNewDeviceNode+0x1fb:
fffff805`62104e7b 4c8d442458      lea     r8,[rsp+58h]
fffff805`62104e80 488bcf          mov     rcx,rdi
fffff805`62104e83 488d542468      lea     rdx,[rsp+68h]
fffff805`62104e88 e87b4c0100      call    nt!PiCreateDeviceInstanceKey (fffff805`62119b08)
fffff805`62104e8d 8bd8            mov     ebx,eax
fffff805`62104e8f 33c0            xor     eax,eax
fffff805`62104e91 85db            test    ebx,ebx
fffff805`62104e93 0f885ec90900    js      nt!PiProcessNewDeviceNode+0x9cb77 (fffff805`621a17f7)  Branch

nt!PiProcessNewDeviceNode+0x219:
fffff805`62104e99 8d4801          lea     ecx,[rax+1]
fffff805`62104e9c 394c2458        cmp     dword ptr [rsp+58h],ecx
fffff805`62104ea0 b900000200      mov     ecx,20000h
fffff805`62104ea5 0f44c1          cmove   eax,ecx
fffff805`62104ea8 8944245c        mov     dword ptr [rsp+5Ch],eax

nt!PiProcessNewDeviceNode+0x22c:
fffff805`62104eac 4c8b642468      mov     r12,qword ptr [rsp+68h]

nt!PiProcessNewDeviceNode+0x231:
fffff805`62104eb1 85db            test    ebx,ebx
fffff805`62104eb3 498bcf          mov     rcx,r15
fffff805`62104eb6 410f49dd        cmovns  ebx,r13d
fffff805`62104eba 448beb          mov     r13d,ebx
fffff805`62104ebd bb01000000      mov     ebx,1
fffff805`62104ec2 448ac3          mov     r8b,bl
fffff805`62104ec5 8d530f          lea     edx,[rbx+0Fh]
fffff805`62104ec8 e8d381a7ff      call    nt!PpMarkDeviceStackExtensionFlag (fffff805`61b7d0a0)
fffff805`62104ecd ba02030000      mov     edx,302h
fffff805`62104ed2 488bcf          mov     rcx,rdi
fffff805`62104ed5 e86e30a7ff      call    nt!PipSetDevNodeState (fffff805`61b77f48)
fffff805`62104eda f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`62104ee4 0f8523c90900    jne     nt!PiProcessNewDeviceNode+0x9cb8d (fffff805`621a180d)  Branch

nt!PiProcessNewDeviceNode+0x26a:
fffff805`62104eea 395c2458        cmp     dword ptr [rsp+58h],ebx
fffff805`62104eee 0f84f4090000    je      nt!PiProcessNewDeviceNode+0xc68 (fffff805`621058e8)  Branch

nt!PiProcessNewDeviceNode+0x274:
fffff805`62104ef4 488d4f28        lea     rcx,[rdi+28h]
fffff805`62104ef8 ba506e7065      mov     edx,65706E50h
fffff805`62104efd e8de89f9ff      call    nt!PnpDeviceObjectFromDeviceInstanceWithTag (fffff805`6209d8e0)
fffff805`62104f02 488bd8          mov     rbx,rax
fffff805`62104f05 4885c0          test    rax,rax
fffff805`62104f08 0f8521c90900    jne     nt!PiProcessNewDeviceNode+0x9cbaf (fffff805`621a182f)  Branch

nt!PiProcessNewDeviceNode+0x28e:
fffff805`62104f0e bb01000000      mov     ebx,1

nt!PiProcessNewDeviceNode+0x293:
fffff805`62104f13 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`62104f1d 0f85d7cb0900    jne     nt!PiProcessNewDeviceNode+0x9ce7a (fffff805`621a1afa)  Branch

nt!PiProcessNewDeviceNode+0x2a3:
fffff805`62104f23 8b74245c        mov     esi,dword ptr [rsp+5Ch]
fffff805`62104f27 4533f6          xor     r14d,r14d
fffff805`62104f2a 4d85e4          test    r12,r12
fffff805`62104f2d 0f8410010000    je      nt!PiProcessNewDeviceNode+0x3c3 (fffff805`62105043)  Branch

nt!PiProcessNewDeviceNode+0x2b3:
fffff805`62104f33 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff805`62104f37 4d8bcc          mov     r9,r12
fffff805`62104f3a 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62104f3e 448bc3          mov     r8d,ebx
fffff805`62104f41 89742448        mov     dword ptr [rsp+48h],esi
fffff805`62104f45 0fb74128        movzx   eax,word ptr [rcx+28h]
fffff805`62104f49 83c002          add     eax,2
fffff805`62104f4c 89442440        mov     dword ptr [rsp+40h],eax
fffff805`62104f50 488b4130        mov     rax,qword ptr [rcx+30h]
fffff805`62104f54 488b0d9d4ddfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62104f5b 4889442438      mov     qword ptr [rsp+38h],rax
fffff805`62104f60 488d05a902c7ff  lea     rax,[nt!DEVPKEY_Device_LastKnownParent (fffff805`61d75210)]
fffff805`62104f67 c744243012000000 mov     dword ptr [rsp+30h],12h
fffff805`62104f6f 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62104f74 4c89742420      mov     qword ptr [rsp+20h],r14
fffff805`62104f79 e806140000      call    nt!_PnpSetObjectProperty (fffff805`62106384)
fffff805`62104f7e 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62104f82 488d4500        lea     rax,[rbp]
fffff805`62104f86 488b0d6b4ddfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62104f8d 4d8bcc          mov     r9,r12
fffff805`62104f90 89742448        mov     dword ptr [rsp+48h],esi
fffff805`62104f94 448bc3          mov     r8d,ebx
fffff805`62104f97 c744244008000000 mov     dword ptr [rsp+40h],8
fffff805`62104f9f 4889442438      mov     qword ptr [rsp+38h],rax
fffff805`62104fa4 488d05c503c7ff  lea     rax,[nt!DEVPKEY_Device_LastArrivalDate (fffff805`61d75370)]
fffff805`62104fab c744243010000000 mov     dword ptr [rsp+30h],10h
fffff805`62104fb3 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62104fb8 4c89742420      mov     qword ptr [rsp+20h],r14
fffff805`62104fbd e8c2130000      call    nt!_PnpSetObjectProperty (fffff805`62106384)
fffff805`62104fc2 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62104fc6 488d05ab02c7ff  lea     rax,[nt!DEVPKEY_Device_LastRemovalDate (fffff805`61d75278)]
fffff805`62104fcd 488b0d244ddfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62104fd4 4d8bcc          mov     r9,r12
fffff805`62104fd7 89742448        mov     dword ptr [rsp+48h],esi
fffff805`62104fdb 448bc3          mov     r8d,ebx
fffff805`62104fde 4489742440      mov     dword ptr [rsp+40h],r14d
fffff805`62104fe3 4c89742438      mov     qword ptr [rsp+38h],r14
fffff805`62104fe8 4489742430      mov     dword ptr [rsp+30h],r14d
fffff805`62104fed 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62104ff2 4c89742420      mov     qword ptr [rsp+20h],r14
fffff805`62104ff7 e888130000      call    nt!_PnpSetObjectProperty (fffff805`62106384)
fffff805`62104ffc 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62105000 488d05c156d5ff  lea     rax,[nt!PnpCurrentHardwareConfigurationIndex (fffff805`61e5a6c8)]
fffff805`62105007 488b0dea4cdfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`6210500e 4d8bcc          mov     r9,r12
fffff805`62105011 89742448        mov     dword ptr [rsp+48h],esi
fffff805`62105015 448bc3          mov     r8d,ebx
fffff805`62105018 c744244004000000 mov     dword ptr [rsp+40h],4
fffff805`62105020 4889442438      mov     qword ptr [rsp+38h],rax
fffff805`62105025 488d052c03c7ff  lea     rax,[nt!DEVPKEY_Device_HardwareConfigurationIndex (fffff805`61d75358)]
fffff805`6210502c c744243007000000 mov     dword ptr [rsp+30h],7
fffff805`62105034 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62105039 4c89742420      mov     qword ptr [rsp+20h],r14
fffff805`6210503e e841130000      call    nt!_PnpSetObjectProperty (fffff805`62106384)

nt!PiProcessNewDeviceNode+0x3c3:
fffff805`62105043 f7455400400000  test    dword ptr [rbp+54h],4000h
fffff805`6210504a 0f85c5ca0900    jne     nt!PiProcessNewDeviceNode+0x9ce95 (fffff805`621a1b15)  Branch

nt!PiProcessNewDeviceNode+0x3d0:
fffff805`62105050 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`6210505a 0f85ebca0900    jne     nt!PiProcessNewDeviceNode+0x9cecb (fffff805`621a1b4b)  Branch

nt!PiProcessNewDeviceNode+0x3e0:
fffff805`62105060 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff805`62105069 4983ccff        or      r12,0FFFFFFFFFFFFFFFFh
fffff805`6210506d 664401a0e4010000 add     word ptr [rax+1E4h],r12w
fffff805`62105075 8ad3            mov     dl,bl
fffff805`62105077 488d0d82dcd4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`6210507e e8bd1497ff      call    nt!ExAcquireResourceSharedLite (fffff805`61a76540)
fffff805`62105083 488b5c2468      mov     rbx,qword ptr [rsp+68h]
fffff805`62105088 4885db          test    rbx,rbx
fffff805`6210508b 740d            je      nt!PiProcessNewDeviceNode+0x41a (fffff805`6210509a)  Branch

nt!PiProcessNewDeviceNode+0x40d:
fffff805`6210508d 488b4de0        mov     rcx,qword ptr [rbp-20h]
fffff805`62105091 4885c9          test    rcx,rcx
fffff805`62105094 0f85ad080000    jne     nt!PiProcessNewDeviceNode+0xcc7 (fffff805`62105947)  Branch

nt!PiProcessNewDeviceNode+0x41a:
fffff805`6210509a 41bc01000000    mov     r12d,1

nt!PiProcessNewDeviceNode+0x420:
fffff805`621050a0 4439642458      cmp     dword ptr [rsp+58h],r12d
fffff805`621050a5 488d5550        lea     rdx,[rbp+50h]
fffff805`621050a9 488bcf          mov     rcx,rdi
fffff805`621050ac 410f94c0        sete    r8b
fffff805`621050b0 e827e5ffff      call    nt!PnpSaveDeviceCapabilities (fffff805`621035dc)
fffff805`621050b5 4883c9ff        or      rcx,0FFFFFFFFFFFFFFFFh
fffff805`621050b9 48394da8        cmp     qword ptr [rbp-58h],rcx
fffff805`621050bd 0f85bdca0900    jne     nt!PiProcessNewDeviceNode+0x9cf00 (fffff805`621a1b80)  Branch

nt!PiProcessNewDeviceNode+0x443:
fffff805`621050c3 4439642458      cmp     dword ptr [rsp+58h],r12d
fffff805`621050c8 488d45a0        lea     rax,[rbp-60h]
fffff805`621050cc 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`621050d0 41b90b000000    mov     r9d,0Bh
fffff805`621050d6 488b0d1b4cdfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`621050dd 4c8bc3          mov     r8,rbx
fffff805`621050e0 4489742438      mov     dword ptr [rsp+38h],r14d
fffff805`621050e5 0f94442450      sete    byte ptr [rsp+50h]
fffff805`621050ea 4889442430      mov     qword ptr [rsp+30h],rax
fffff805`621050ef 488d442454      lea     rax,[rsp+54h]
fffff805`621050f4 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`621050f9 488d45d0        lea     rax,[rbp-30h]
fffff805`621050fd 4889442420      mov     qword ptr [rsp+20h],rax
fffff805`62105102 c745a004000000  mov     dword ptr [rbp-60h],4
fffff805`62105109 e85e46f2ff      call    nt!_CmGetDeviceRegProp (fffff805`6202976c)
fffff805`6210510e 85c0            test    eax,eax
fffff805`62105110 0f889d070000    js      nt!PiProcessNewDeviceNode+0xc33 (fffff805`621058b3)  Branch

nt!PiProcessNewDeviceNode+0x496:
fffff805`62105116 837dd004        cmp     dword ptr [rbp-30h],4
fffff805`6210511a 0f8593070000    jne     nt!PiProcessNewDeviceNode+0xc33 (fffff805`621058b3)  Branch

nt!PiProcessNewDeviceNode+0x4a0:
fffff805`62105120 837da004        cmp     dword ptr [rbp-60h],4
fffff805`62105124 0f8589070000    jne     nt!PiProcessNewDeviceNode+0xc33 (fffff805`621058b3)  Branch

nt!PiProcessNewDeviceNode+0x4aa:
fffff805`6210512a 8b442454        mov     eax,dword ptr [rsp+54h]
fffff805`6210512e a820            test    al,20h
fffff805`62105130 0f8537090000    jne     nt!PiProcessNewDeviceNode+0xded (fffff805`62105a6d)  Branch

nt!PiProcessNewDeviceNode+0x4b6:
fffff805`62105136 a840            test    al,40h
fffff805`62105138 0f858cca0900    jne     nt!PiProcessNewDeviceNode+0x9cf4a (fffff805`621a1bca)  Branch

nt!PiProcessNewDeviceNode+0x4be:
fffff805`6210513e 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff805`62105142 488d5728        lea     rdx,[rdi+28h]
fffff805`62105146 e8318b0100      call    nt!PnpMapDeviceObjectToDeviceInstance (fffff805`6211dc7c)
fffff805`6210514b 85c0            test    eax,eax
fffff805`6210514d 458bf5          mov     r14d,r13d
fffff805`62105150 440f48f0        cmovs   r14d,eax
fffff805`62105154 4489742470      mov     dword ptr [rsp+70h],r14d
fffff805`62105159 4533f6          xor     r14d,r14d
fffff805`6210515c 443835c9add1ff  cmp     byte ptr [nt!PnpBootMode (fffff805`61e1ff2c)],r14b
fffff805`62105163 0f850b060000    jne     nt!PiProcessNewDeviceNode+0xaf4 (fffff805`62105774)  Branch

nt!PiProcessNewDeviceNode+0x4e9:
fffff805`62105169 8b442474        mov     eax,dword ptr [rsp+74h]
fffff805`6210516d f744245400000400 test    dword ptr [rsp+54h],40000h
fffff805`62105175 0fb6c0          movzx   eax,al
fffff805`62105178 410f45c4        cmovne  eax,r12d
fffff805`6210517c 89442474        mov     dword ptr [rsp+74h],eax

nt!PiProcessNewDeviceNode+0x500:
fffff805`62105180 488d0d79dbd4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`62105187 e8e40097ff      call    nt!ExReleaseResourceLite (fffff805`61a75270)
fffff805`6210518c 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff805`62105195 e8c6209aff      call    nt!KiLeaveCriticalRegionUnsafe (fffff805`61aa7260)
fffff805`6210519a 4c8b642468      mov     r12,qword ptr [rsp+68h]

nt!PiProcessNewDeviceNode+0x51f:
fffff805`6210519f 41bd01000000    mov     r13d,1
fffff805`621051a5 4c8d4dd4        lea     r9,[rbp-2Ch]
fffff805`621051a9 418bd5          mov     edx,r13d
fffff805`621051ac 4c8d45d8        lea     r8,[rbp-28h]
fffff805`621051b0 488bcf          mov     rcx,rdi
fffff805`621051b3 e8007f0000      call    nt!PnpQueryID (fffff805`6210d0b8)
fffff805`621051b8 488b75d8        mov     rsi,qword ptr [rbp-28h]
fffff805`621051bc 488bce          mov     rcx,rsi
fffff805`621051bf e8c0640100      call    nt!KseAddHardwareId (fffff805`6211b684)
fffff805`621051c4 4c8d4da4        lea     r9,[rbp-5Ch]
fffff805`621051c8 488bcf          mov     rcx,rdi
fffff805`621051cb 4c8d45b8        lea     r8,[rbp-48h]
fffff805`621051cf 418d5501        lea     edx,[r13+1]
fffff805`621051d3 e8e07e0000      call    nt!PnpQueryID (fffff805`6210d0b8)
fffff805`621051d8 488b55b8        mov     rdx,qword ptr [rbp-48h]
fffff805`621051dc 4c8d87ac020000  lea     r8,[rdi+2ACh]
fffff805`621051e3 488bce          mov     rcx,rsi
fffff805`621051e6 e8ed510100      call    nt!PnpGenerateDeviceIdsHash (fffff805`6211a3d8)
fffff805`621051eb 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff805`621051ef 4c8d4588        lea     r8,[rbp-78h]
fffff805`621051f3 418d5504        lea     edx,[r13+4]
fffff805`621051f7 e8b47f0000      call    nt!PnpIrpQueryID (fffff805`6210d1b0)
fffff805`621051fc 488b5d88        mov     rbx,qword ptr [rbp-78h]
fffff805`62105200 4885db          test    rbx,rbx
fffff805`62105203 0f8593070000    jne     nt!PiProcessNewDeviceNode+0xd1c (fffff805`6210599c)  Branch

nt!PiProcessNewDeviceNode+0x589:
fffff805`62105209 4c8b45b8        mov     r8,qword ptr [rbp-48h]
fffff805`6210520d 4c8d4c2460      lea     r9,[rsp+60h]
fffff805`62105212 488bd6          mov     rdx,rsi
fffff805`62105215 488bcf          mov     rcx,rdi
fffff805`62105218 e8636d0100      call    nt!PiQueryRemovableDeviceOverride (fffff805`6211bf80)
fffff805`6210521d 85c0            test    eax,eax
fffff805`6210521f 0f89dec90900    jns     nt!PiProcessNewDeviceNode+0x9cf83 (fffff805`621a1c03)  Branch

nt!PiProcessNewDeviceNode+0x5a5:
fffff805`62105225 8b4554          mov     eax,dword ptr [rbp+54h]
fffff805`62105228 a820            test    al,20h
fffff805`6210522a 750d            jne     nt!PiProcessNewDeviceNode+0x5b9 (fffff805`62105239)  Branch

nt!PiProcessNewDeviceNode+0x5ac:
fffff805`6210522c 0fbae012        bt      eax,12h
fffff805`62105230 7207            jb      nt!PiProcessNewDeviceNode+0x5b9 (fffff805`62105239)  Branch

nt!PiProcessNewDeviceNode+0x5b2:
fffff805`62105232 458ac5          mov     r8b,r13b
fffff805`62105235 a810            test    al,10h
fffff805`62105237 7503            jne     nt!PiProcessNewDeviceNode+0x5bc (fffff805`6210523c)  Branch

nt!PiProcessNewDeviceNode+0x5b9:
fffff805`62105239 458ac6          mov     r8b,r14b

nt!PiProcessNewDeviceNode+0x5bc:
fffff805`6210523c 4885db          test    rbx,rbx
fffff805`6210523f 7535            jne     nt!PiProcessNewDeviceNode+0x5f6 (fffff805`62105276)  Branch

nt!PiProcessNewDeviceNode+0x5c1:
fffff805`62105241 44396c2458      cmp     dword ptr [rsp+58h],r13d
fffff805`62105246 488d4508        lea     rax,[rbp+8]
fffff805`6210524a 498bd6          mov     rdx,r14
fffff805`6210524d 4889442420      mov     qword ptr [rsp+20h],rax
fffff805`62105252 490f45d4        cmovne  rdx,r12
fffff805`62105256 4c8bcb          mov     r9,rbx
fffff805`62105259 488bcf          mov     rcx,rdi
fffff805`6210525c e8bb7e0100      call    nt!PipGenerateContainerID (fffff805`6211d11c)
fffff805`62105261 85c0            test    eax,eax
fffff805`62105263 7811            js      nt!PiProcessNewDeviceNode+0x5f6 (fffff805`62105276)  Branch

nt!PiProcessNewDeviceNode+0x5e5:
fffff805`62105265 4885db          test    rbx,rbx
fffff805`62105268 0f859fc90900    jne     nt!PiProcessNewDeviceNode+0x9cf8d (fffff805`621a1c0d)  Branch

nt!PiProcessNewDeviceNode+0x5ee:
fffff805`6210526e 488b5d08        mov     rbx,qword ptr [rbp+8]
fffff805`62105272 48895d88        mov     qword ptr [rbp-78h],rbx

nt!PiProcessNewDeviceNode+0x5f6:
fffff805`62105276 488db798020000  lea     rsi,[rdi+298h]
fffff805`6210527d 4885db          test    rbx,rbx
fffff805`62105280 0f8497c90900    je      nt!PiProcessNewDeviceNode+0x9cf9d (fffff805`621a1c1d)  Branch

nt!PiProcessNewDeviceNode+0x606:
fffff805`62105286 488bd3          mov     rdx,rbx
fffff805`62105289 488d4d10        lea     rcx,[rbp+10h]
fffff805`6210528d e8ce249bff      call    nt!RtlInitUnicodeString (fffff805`61ab7760)
fffff805`62105292 488bd6          mov     rdx,rsi
fffff805`62105295 488d4d10        lea     rcx,[rbp+10h]
fffff805`62105299 e8d268f2ff      call    nt!RtlGUIDFromString (fffff805`6202bb70)
fffff805`6210529e 85c0            test    eax,eax
fffff805`621052a0 0f8877c90900    js      nt!PiProcessNewDeviceNode+0x9cf9d (fffff805`621a1c1d)  Branch

nt!PiProcessNewDeviceNode+0x626:
fffff805`621052a6 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff805`621052af 4883ceff        or      rsi,0FFFFFFFFFFFFFFFFh
fffff805`621052b3 6601b0e4010000  add     word ptr [rax+1E4h],si
fffff805`621052ba 488d1d3fdad4ff  lea     rbx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`621052c1 418ad5          mov     dl,r13b
fffff805`621052c4 488bcb          mov     rcx,rbx
fffff805`621052c7 e8741297ff      call    nt!ExAcquireResourceSharedLite (fffff805`61a76540)
fffff805`621052cc 8d5621          lea     edx,[rsi+21h]
fffff805`621052cf 488bcf          mov     rcx,rdi
fffff805`621052d2 e8710b0000      call    nt!PipSetDevNodeFlags (fffff805`62105e48)
fffff805`621052d7 488bcb          mov     rcx,rbx
fffff805`621052da e891ff96ff      call    nt!ExReleaseResourceLite (fffff805`61a75270)
fffff805`621052df 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff805`621052e8 e8731f9aff      call    nt!KiLeaveCriticalRegionUnsafe (fffff805`61aa7260)
fffff805`621052ed 4c39742468      cmp     qword ptr [rsp+68h],r14
fffff805`621052f2 7449            je      nt!PiProcessNewDeviceNode+0x6bd (fffff805`6210533d)  Branch

nt!PiProcessNewDeviceNode+0x674:
fffff805`621052f4 4c397588        cmp     qword ptr [rbp-78h],r14
fffff805`621052f8 7443            je      nt!PiProcessNewDeviceNode+0x6bd (fffff805`6210533d)  Branch

nt!PiProcessNewDeviceNode+0x67a:
fffff805`621052fa 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff805`62105303 6601b0e4010000  add     word ptr [rax+1E4h],si
fffff805`6210530a 418ad5          mov     dl,r13b
fffff805`6210530d 488bcb          mov     rcx,rbx
fffff805`62105310 e8bb0f97ff      call    nt!ExAcquireResourceExclusiveLite (fffff805`61a762d0)
fffff805`62105315 4c8b4588        mov     r8,qword ptr [rbp-78h]
fffff805`62105319 488b542468      mov     rdx,qword ptr [rsp+68h]
fffff805`6210531e 488b4f30        mov     rcx,qword ptr [rdi+30h]
fffff805`62105322 e8156c0000      call    nt!PiDcUpdateDeviceContainerMembership (fffff805`6210bf3c)
fffff805`62105327 488bcb          mov     rcx,rbx
fffff805`6210532a e841ff96ff      call    nt!ExReleaseResourceLite (fffff805`61a75270)
fffff805`6210532f 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff805`62105338 e8231f9aff      call    nt!KiLeaveCriticalRegionUnsafe (fffff805`61aa7260)

nt!PiProcessNewDeviceNode+0x6bd:
fffff805`6210533d 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff805`62105346 6601b0e4010000  add     word ptr [rax+1E4h],si
fffff805`6210534d 418ad5          mov     dl,r13b
fffff805`62105350 488bcb          mov     rcx,rbx
fffff805`62105353 e8e81197ff      call    nt!ExAcquireResourceSharedLite (fffff805`61a76540)
fffff805`62105358 488b5c2468      mov     rbx,qword ptr [rsp+68h]
fffff805`6210535d 4885db          test    rbx,rbx
fffff805`62105360 0f8474c90900    je      nt!PiProcessNewDeviceNode+0x9d05a (fffff805`621a1cda)  Branch

nt!PiProcessNewDeviceNode+0x6e6:
fffff805`62105366 4c8b65b8        mov     r12,qword ptr [rbp-48h]
fffff805`6210536a 33d2            xor     edx,edx
fffff805`6210536c 448b6dd4        mov     r13d,dword ptr [rbp-2Ch]
fffff805`62105370 4c8b75d8        mov     r14,qword ptr [rbp-28h]
fffff805`62105374 38542450        cmp     byte ptr [rsp+50h],dl
fffff805`62105378 0f85f8040000    jne     nt!PiProcessNewDeviceNode+0xbf6 (fffff805`62105876)  Branch

nt!PiProcessNewDeviceNode+0x6fe:
fffff805`6210537e 8d4a01          lea     ecx,[rdx+1]
fffff805`62105381 394c2458        cmp     dword ptr [rsp+58h],ecx
fffff805`62105385 0f84eb040000    je      nt!PiProcessNewDeviceNode+0xbf6 (fffff805`62105876)  Branch

nt!PiProcessNewDeviceNode+0x70b:
fffff805`6210538b 488d442451      lea     rax,[rsp+51h]
fffff805`62105390 458bcd          mov     r9d,r13d
fffff805`62105393 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62105398 4d8bc6          mov     r8,r14
fffff805`6210539b 884c2420        mov     byte ptr [rsp+20h],cl
fffff805`6210539f 488bd3          mov     rdx,rbx
fffff805`621053a2 488bcf          mov     rcx,rdi
fffff805`621053a5 e8ba200200      call    nt!PnpCheckDeviceIdsChanged (fffff805`62127464)
fffff805`621053aa 0fb6742451      movzx   esi,byte ptr [rsp+51h]
fffff805`621053af 33d2            xor     edx,edx
fffff805`621053b1 85c0            test    eax,eax
fffff805`621053b3 0f48f2          cmovs   esi,edx
fffff805`621053b6 4088742451      mov     byte ptr [rsp+51h],sil
fffff805`621053bb 4084f6          test    sil,sil
fffff805`621053be 752c            jne     nt!PiProcessNewDeviceNode+0x76c (fffff805`621053ec)  Branch

nt!PiProcessNewDeviceNode+0x740:
fffff805`621053c0 448b4da4        mov     r9d,dword ptr [rbp-5Ch]
fffff805`621053c4 488d442451      lea     rax,[rsp+51h]
fffff805`621053c9 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`621053ce 4d8bc4          mov     r8,r12
fffff805`621053d1 88542420        mov     byte ptr [rsp+20h],dl
fffff805`621053d5 488bcf          mov     rcx,rdi
fffff805`621053d8 488bd3          mov     rdx,rbx
fffff805`621053db e884200200      call    nt!PnpCheckDeviceIdsChanged (fffff805`62127464)
fffff805`621053e0 0fb6742451      movzx   esi,byte ptr [rsp+51h]
fffff805`621053e5 33d2            xor     edx,edx
fffff805`621053e7 85c0            test    eax,eax
fffff805`621053e9 0f48f2          cmovs   esi,edx

nt!PiProcessNewDeviceNode+0x76c:
fffff805`621053ec 4d85f6          test    r14,r14
fffff805`621053ef 7433            je      nt!PiProcessNewDeviceNode+0x7a4 (fffff805`62105424)  Branch

nt!PiProcessNewDeviceNode+0x771:
fffff805`621053f1 8b54245c        mov     edx,dword ptr [rsp+5Ch]
fffff805`621053f5 41b902000000    mov     r9d,2
fffff805`621053fb 488b0df648dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62105402 4c8bc3          mov     r8,rbx
fffff805`62105405 89542438        mov     dword ptr [rsp+38h],edx
fffff805`62105409 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`6210540d 44896c2430      mov     dword ptr [rsp+30h],r13d
fffff805`62105412 4c89742428      mov     qword ptr [rsp+28h],r14
fffff805`62105417 c744242007000000 mov     dword ptr [rsp+20h],7
fffff805`6210541f e86ce3ffff      call    nt!_CmSetDeviceRegProp (fffff805`62103790)

nt!PiProcessNewDeviceNode+0x7a4:
fffff805`62105424 448b74245c      mov     r14d,dword ptr [rsp+5Ch]
fffff805`62105429 4d85e4          test    r12,r12
fffff805`6210542c 7432            je      nt!PiProcessNewDeviceNode+0x7e0 (fffff805`62105460)  Branch

nt!PiProcessNewDeviceNode+0x7ae:
fffff805`6210542e 8b45a4          mov     eax,dword ptr [rbp-5Ch]
fffff805`62105431 41b903000000    mov     r9d,3
fffff805`62105437 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`6210543b 4c8bc3          mov     r8,rbx
fffff805`6210543e 488b0db348dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62105445 4489742438      mov     dword ptr [rsp+38h],r14d
fffff805`6210544a 89442430        mov     dword ptr [rsp+30h],eax
fffff805`6210544e 4c89642428      mov     qword ptr [rsp+28h],r12
fffff805`62105453 c744242007000000 mov     dword ptr [rsp+20h],7
fffff805`6210545b e830e3ffff      call    nt!_CmSetDeviceRegProp (fffff805`62103790)

nt!PiProcessNewDeviceNode+0x7e0:
fffff805`62105460 4533e4          xor     r12d,r12d
fffff805`62105463 4084f6          test    sil,sil
fffff805`62105466 0f85bfc70900    jne     nt!PiProcessNewDeviceNode+0x9cfab (fffff805`621a1c2b)  Branch

nt!PiProcessNewDeviceNode+0x7ec:
fffff805`6210546c 4438642474      cmp     byte ptr [rsp+74h],r12b
fffff805`62105471 0f85b4c70900    jne     nt!PiProcessNewDeviceNode+0x9cfab (fffff805`621a1c2b)  Branch

nt!PiProcessNewDeviceNode+0x7f7:
fffff805`62105477 448a6c2450      mov     r13b,byte ptr [rsp+50h]

nt!PiProcessNewDeviceNode+0x7fc:
fffff805`6210547c 488d0d7dd8d4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`62105483 e8e8fd96ff      call    nt!ExReleaseResourceLite (fffff805`61a75270)
fffff805`62105488 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff805`62105491 e8ca1d9aff      call    nt!KiLeaveCriticalRegionUnsafe (fffff805`61aa7260)
fffff805`62105496 488b742468      mov     rsi,qword ptr [rsp+68h]
fffff805`6210549b 4c8b75b0        mov     r14,qword ptr [rbp-50h]
fffff805`6210549f 4885f6          test    rsi,rsi
fffff805`621054a2 747f            je      nt!PiProcessNewDeviceNode+0x8a3 (fffff805`62105523)  Branch

nt!PiProcessNewDeviceNode+0x824:
fffff805`621054a4 4c896598        mov     qword ptr [rbp-68h],r12
fffff805`621054a8 418bc4          mov     eax,r12d
fffff805`621054ab 448964247c      mov     dword ptr [rsp+7Ch],r12d
fffff805`621054b0 418bdc          mov     ebx,r12d
fffff805`621054b3 4d85f6          test    r14,r14
fffff805`621054b6 0f857e030000    jne     nt!PiProcessNewDeviceNode+0xbba (fffff805`6210583a)  Branch

nt!PiProcessNewDeviceNode+0x83c:
fffff805`621054bc 448b64245c      mov     r12d,dword ptr [rsp+5Ch]
fffff805`621054c1 f7d8            neg     eax
fffff805`621054c3 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`621054c7 4c8bce          mov     r9,rsi
fffff805`621054ca 488b0d2748dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`621054d1 1bc0            sbb     eax,eax
fffff805`621054d3 4489642448      mov     dword ptr [rsp+48h],r12d
fffff805`621054d8 83e007          and     eax,7
fffff805`621054db 895c2440        mov     dword ptr [rsp+40h],ebx
fffff805`621054df 83c012          add     eax,12h
fffff805`621054e2 4c89742438      mov     qword ptr [rsp+38h],r14
fffff805`621054e7 33db            xor     ebx,ebx
fffff805`621054e9 89442430        mov     dword ptr [rsp+30h],eax
fffff805`621054ed 488d0594fec6ff  lea     rax,[nt!DEVPKEY_Device_BusReportedDeviceDesc (fffff805`61d75388)]
fffff805`621054f4 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`621054f9 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff805`621054fe 448d4301        lea     r8d,[rbx+1]
fffff805`62105502 e87d0e0000      call    nt!_PnpSetObjectProperty (fffff805`62106384)
fffff805`62105507 4c8d44247c      lea     r8,[rsp+7Ch]
fffff805`6210550c 488bcf          mov     rcx,rdi
fffff805`6210550f 488d5598        lea     rdx,[rbp-68h]
fffff805`62105513 e838ff0000      call    nt!PnpGetDeviceLocationStrings (fffff805`62115450)
fffff805`62105518 85c0            test    eax,eax
fffff805`6210551a 0f89bf020000    jns     nt!PiProcessNewDeviceNode+0xb5f (fffff805`621057df)  Branch

nt!PiProcessNewDeviceNode+0x8a0:
fffff805`62105520 4533e4          xor     r12d,r12d

nt!PiProcessNewDeviceNode+0x8a3:
fffff805`62105523 488bcf          mov     rcx,rdi
fffff805`62105526 e8497a0100      call    nt!PnpQueryBusInformation (fffff805`6211cf74)
fffff805`6210552b 488bcf          mov     rcx,rdi
fffff805`6210552e e8cdfd0000      call    nt!PiDmaGuardProcessNewDeviceNode (fffff805`62115300)
fffff805`62105533 8b5c2470        mov     ebx,dword ptr [rsp+70h]
fffff805`62105537 85c0            test    eax,eax
fffff805`62105539 0f48d8          cmovs   ebx,eax
fffff805`6210553c f7455400400000  test    dword ptr [rbp+54h],4000h
fffff805`62105543 7524            jne     nt!PiProcessNewDeviceNode+0x8e9 (fffff805`62105569)  Branch

nt!PiProcessNewDeviceNode+0x8c5:
fffff805`62105545 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`6210554f 0f8570040000    jne     nt!PiProcessNewDeviceNode+0xd45 (fffff805`621059c5)  Branch

nt!PiProcessNewDeviceNode+0x8d5:
fffff805`62105555 4584ed          test    r13b,r13b
fffff805`62105558 0f8522030000    jne     nt!PiProcessNewDeviceNode+0xc00 (fffff805`62105880)  Branch

nt!PiProcessNewDeviceNode+0x8de:
fffff805`6210555e 488bd6          mov     rdx,rsi
fffff805`62105561 488bcf          mov     rcx,rdi
fffff805`62105564 e83f3d0200      call    nt!PpDevCfgProcessDeviceOperations (fffff805`621292a8)

nt!PiProcessNewDeviceNode+0x8e9:
fffff805`62105569 41bd01000000    mov     r13d,1

nt!PiProcessNewDeviceNode+0x8ef:
fffff805`6210556f 488bcf          mov     rcx,rdi   ;PDO of device
fffff805`62105572 e8a12f0100      call    nt!PiQueryResourceRequirements (fffff805`62118518)    ;IRP call to pci!PciDevice_QueryResourceRequirements()
fffff805`62105577 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h  ;rdi = PDEVICE_NODE, if (devnode->Flags & DNF_HAS_PROBLEM) goto 0xe00
fffff805`62105581 0f85f9040000    jne     nt!PiProcessNewDeviceNode+0xe00 (fffff805`62105a80)  Branch

nt!PiProcessNewDeviceNode+0x907:
fffff805`62105587 488d5728        lea     rdx,[rdi+28h]
fffff805`6210558b 458bc5          mov     r8d,r13d
fffff805`6210558e 488bce          mov     rcx,rsi
fffff805`62105591 e88e570100      call    nt!PnpIsDeviceInstanceEnabled (fffff805`6211ad24)

nt!PiProcessNewDeviceNode+0x916:
fffff805`62105596 4885f6          test    rsi,rsi
fffff805`62105599 7414            je      nt!PiProcessNewDeviceNode+0x92f (fffff805`621055af)  Branch

nt!PiProcessNewDeviceNode+0x91b:
fffff805`6210559b 44396c2458      cmp     dword ptr [rsp+58h],r13d
fffff805`621055a0 488bd6          mov     rdx,rsi
fffff805`621055a3 488bcf          mov     rcx,rdi
fffff805`621055a6 410f94c0        sete    r8b
fffff805`621055aa e8617e0100      call    nt!PnpInitializeSessionId (fffff805`6211d410)

nt!PiProcessNewDeviceNode+0x92f:
fffff805`621055af 488bcf          mov     rcx,rdi   ;PDO of device
fffff805`621055b2 e855260100      call    nt!PiQueryAndAllocateBootResources (fffff805`62117c0c) ;call to pci!PciDevice_QueryResources()
fffff805`621055b7 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h    ;rdi = PDEVICE_NODE, if (devnode->Flags & DNF_HAS_PROBLEM) goto 0xe22
fffff805`621055c1 0f85db040000    jne     nt!PiProcessNewDeviceNode+0xe22 (fffff805`62105aa2)  Branch

nt!PiProcessNewDeviceNode+0x947:
fffff805`621055c7 65488b042588010000 mov   rax,qword ptr gs:[188h]  ;CURRENT ETHREAD?
fffff805`621055d0 4883c9ff        or      rcx,0FFFFFFFFFFFFFFFFh
fffff805`621055d4 660188e4010000  add     word ptr [rax+1E4h],cx
fffff805`621055db 418ad5          mov     dl,r13b
fffff805`621055de 488d0d1bd7d4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`621055e5 e8560f97ff      call    nt!ExAcquireResourceSharedLite (fffff805`61a76540)
fffff805`621055ea 44396c2458      cmp     dword ptr [rsp+58h],r13d
fffff805`621055ef 488d5550        lea     rdx,[rbp+50h]
fffff805`621055f3 488bcf          mov     rcx,rdi
fffff805`621055f6 410f94c0        sete    r8b
fffff805`621055fa e8dddfffff      call    nt!PnpSaveDeviceCapabilities (fffff805`621035dc)
fffff805`621055ff 488d0dfad6d4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`62105606 e865fc96ff      call    nt!ExReleaseResourceLite (fffff805`61a75270)
fffff805`6210560b 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff805`62105614 e8471c9aff      call    nt!KiLeaveCriticalRegionUnsafe (fffff805`61aa7260)
fffff805`62105619 488bcf          mov     rcx,rdi
fffff805`6210561c e8bf730100      call    nt!PpHotSwapUpdateRemovalPolicy (fffff805`6211c9e0)
fffff805`62105621 4c8d4738        lea     r8,[rdi+38h]
fffff805`62105625 4533c9          xor     r9d,r9d
fffff805`62105628 488d4f28        lea     rcx,[rdi+28h]
fffff805`6210562c 418ad5          mov     dl,r13b
fffff805`6210562f e8f4990000      call    nt!PpDeviceRegistration (fffff805`6210f028)
fffff805`62105634 85c0            test    eax,eax
fffff805`62105636 0f88a6c60900    js      nt!PiProcessNewDeviceNode+0x9d062 (fffff805`621a1ce2)  Branch

nt!PiProcessNewDeviceNode+0x9bc:
fffff805`6210563c 4c8b75b0        mov     r14,qword ptr [rbp-50h]
fffff805`62105640 b908020800      mov     ecx,80208h
fffff805`62105645 488b742468      mov     rsi,qword ptr [rsp+68h]

nt!PiProcessNewDeviceNode+0x9ca:
fffff805`6210564a f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`62105654 0f856a040000    jne     nt!PiProcessNewDeviceNode+0xe44 (fffff805`62105ac4)  Branch

nt!PiProcessNewDeviceNode+0x9da:
fffff805`6210565a 498bcf          mov     rcx,r15
fffff805`6210565d e85683a7ff      call    nt!PnpIrpDeviceEnumerated (fffff805`61b7d9b8)
fffff805`62105662 4885f6          test    rsi,rsi
fffff805`62105665 740b            je      nt!PiProcessNewDeviceNode+0x9f2 (fffff805`62105672)  Branch

nt!PiProcessNewDeviceNode+0x9e7:
fffff805`62105667 488bd6          mov     rdx,rsi
fffff805`6210566a 488bcf          mov     rcx,rdi
fffff805`6210566d e80a510000      call    nt!PiUpdateDevicePanel (fffff805`6210a77c)

nt!PiProcessNewDeviceNode+0x9f2:
fffff805`62105672 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62105676 458bc5          mov     r8d,r13d
fffff805`62105679 e852110000      call    nt!_PnpRaiseNtPlugPlayDevicePropertyChangeEvent (fffff805`621067d0)
fffff805`6210567e 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62105682 41b80e000000    mov     r8d,0Eh
fffff805`62105688 e843110000      call    nt!_PnpRaiseNtPlugPlayDevicePropertyChangeEvent (fffff805`621067d0)
fffff805`6210568d 498bd7          mov     rdx,r15
fffff805`62105690 488d0de1fac6ff  lea     rcx,[nt!GUID_DEVICE_ENUMERATED (fffff805`61d75178)]
fffff805`62105697 e850660000      call    nt!PnpSetPlugPlayEvent (fffff805`6210bcec)
fffff805`6210569c 488bcf          mov     rcx,rdi
fffff805`6210569f e8e86d0000      call    nt!PnpNewDeviceNodeDependencyCheck (fffff805`6210c48c)

nt!PiProcessNewDeviceNode+0xa24:
fffff805`621056a4 488b4dd8        mov     rcx,qword ptr [rbp-28h]
fffff805`621056a8 4885c9          test    rcx,rcx
fffff805`621056ab 7407            je      nt!PiProcessNewDeviceNode+0xa34 (fffff805`621056b4)  Branch

nt!PiProcessNewDeviceNode+0xa2d:
fffff805`621056ad 33d2            xor     edx,edx
fffff805`621056af e8ac45c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)

nt!PiProcessNewDeviceNode+0xa34:
fffff805`621056b4 488b4db8        mov     rcx,qword ptr [rbp-48h]
fffff805`621056b8 4885c9          test    rcx,rcx
fffff805`621056bb 7407            je      nt!PiProcessNewDeviceNode+0xa44 (fffff805`621056c4)  Branch

nt!PiProcessNewDeviceNode+0xa3d:
fffff805`621056bd 33d2            xor     edx,edx
fffff805`621056bf e89c45c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)

nt!PiProcessNewDeviceNode+0xa44:
fffff805`621056c4 488b4d88        mov     rcx,qword ptr [rbp-78h]
fffff805`621056c8 4885c9          test    rcx,rcx
fffff805`621056cb 7407            je      nt!PiProcessNewDeviceNode+0xa54 (fffff805`621056d4)  Branch

nt!PiProcessNewDeviceNode+0xa4d:
fffff805`621056cd 33d2            xor     edx,edx
fffff805`621056cf e88c45c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)

nt!PiProcessNewDeviceNode+0xa54:
fffff805`621056d4 4885f6          test    rsi,rsi
fffff805`621056d7 7408            je      nt!PiProcessNewDeviceNode+0xa61 (fffff805`621056e1)  Branch

nt!PiProcessNewDeviceNode+0xa59:
fffff805`621056d9 488bce          mov     rcx,rsi
fffff805`621056dc e83ff8acff      call    nt!ZwClose (fffff805`61bd4f20)

nt!PiProcessNewDeviceNode+0xa61:
fffff805`621056e1 488b4d90        mov     rcx,qword ptr [rbp-70h]
fffff805`621056e5 4885c9          test    rcx,rcx
fffff805`621056e8 7407            je      nt!PiProcessNewDeviceNode+0xa71 (fffff805`621056f1)  Branch

nt!PiProcessNewDeviceNode+0xa6a:
fffff805`621056ea 33d2            xor     edx,edx
fffff805`621056ec e86f45c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)

nt!PiProcessNewDeviceNode+0xa71:
fffff805`621056f1 488b4de0        mov     rcx,qword ptr [rbp-20h]
fffff805`621056f5 4885c9          test    rcx,rcx
fffff805`621056f8 0f8592020000    jne     nt!PiProcessNewDeviceNode+0xd10 (fffff805`62105990)  Branch

nt!PiProcessNewDeviceNode+0xa7e:
fffff805`621056fe 4d85f6          test    r14,r14
fffff805`62105701 0f8560010000    jne     nt!PiProcessNewDeviceNode+0xbe7 (fffff805`62105867)  Branch

nt!PiProcessNewDeviceNode+0xa87:
fffff805`62105707 488b45c0        mov     rax,qword ptr [rbp-40h]
fffff805`6210570b 4885c0          test    rax,rax
fffff805`6210570e 740a            je      nt!PiProcessNewDeviceNode+0xa9a (fffff805`6210571a)  Branch

nt!PiProcessNewDeviceNode+0xa90:
fffff805`62105710 33d2            xor     edx,edx
fffff805`62105712 488bc8          mov     rcx,rax
fffff805`62105715 e84645c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)

nt!PiProcessNewDeviceNode+0xa9a:
fffff805`6210571a 488b4de8        mov     rcx,qword ptr [rbp-18h]
fffff805`6210571e 4885c9          test    rcx,rcx
fffff805`62105721 7405            je      nt!PiProcessNewDeviceNode+0xaa8 (fffff805`62105728)  Branch

nt!PiProcessNewDeviceNode+0xaa3:
fffff805`62105723 e818c4f2ff      call    nt!PiPnpRtlEndOperation (fffff805`62031b40)

nt!PiProcessNewDeviceNode+0xaa8:
fffff805`62105728 f605d8dfd1ff08  test    byte ptr [nt!Microsoft_Windows_Kernel_PnPEnableBits+0x3 (fffff805`61e23707)],8
fffff805`6210572f 0f85c3c50900    jne     nt!PiProcessNewDeviceNode+0x9d078 (fffff805`621a1cf8)  Branch

nt!PiProcessNewDeviceNode+0xab5:
fffff805`62105735 4439a738020000  cmp     dword ptr [rdi+238h],r12d
fffff805`6210573c 0f85cec50900    jne     nt!PiProcessNewDeviceNode+0x9d090 (fffff805`621a1d10)  Branch

nt!PiProcessNewDeviceNode+0xac2:
fffff805`62105742 8bc3            mov     eax,ebx
fffff805`62105744 488b8da0000000  mov     rcx,qword ptr [rbp+0A0h]
fffff805`6210574b 4833cc          xor     rcx,rsp
fffff805`6210574e e85db9aaff      call    nt!_security_check_cookie (fffff805`61bb10b0)
fffff805`62105753 4c8d9c24b0010000 lea     r11,[rsp+1B0h]
fffff805`6210575b 498b5b38        mov     rbx,qword ptr [r11+38h]
fffff805`6210575f 498b7340        mov     rsi,qword ptr [r11+40h]
fffff805`62105763 498b7b48        mov     rdi,qword ptr [r11+48h]
fffff805`62105767 498be3          mov     rsp,r11
fffff805`6210576a 415f            pop     r15
fffff805`6210576c 415e            pop     r14
fffff805`6210576e 415d            pop     r13
fffff805`62105770 415c            pop     r12
fffff805`62105772 5d              pop     rbp
fffff805`62105773 c3              ret

nt!PiProcessNewDeviceNode+0xaf4:
fffff805`62105774 0fbaafc00200000c bts     dword ptr [rdi+2C0h],0Ch
fffff805`6210577c c7458002000000  mov     dword ptr [rbp-80h],2
fffff805`62105783 e9f8f9ffff      jmp     nt!PiProcessNewDeviceNode+0x500 (fffff805`62105180)  Branch

nt!PiProcessNewDeviceNode+0xb08:
fffff805`62105788 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`62105792 0f85c4bf0900    jne     nt!PiProcessNewDeviceNode+0x9cadc (fffff805`621a175c)  Branch

nt!PiProcessNewDeviceNode+0xb18:
fffff805`62105798 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff805`6210579c 483b0d25d5d4ff  cmp     rcx,qword ptr [nt!IopRootDeviceNode (fffff805`61e52cc8)]
fffff805`621057a3 0f84a0f6ffff    je      nt!PiProcessNewDeviceNode+0x1c9 (fffff805`62104e49)  Branch

nt!PiProcessNewDeviceNode+0xb29:
fffff805`621057a9 488975c8        mov     qword ptr [rbp-38h],rsi
fffff805`621057ad 488b7590        mov     rsi,qword ptr [rbp-70h]

nt!PiProcessNewDeviceNode+0xb31:
fffff805`621057b1 488b4920        mov     rcx,qword ptr [rcx+20h]
fffff805`621057b5 4c8d45c8        lea     r8,[rbp-38h]
fffff805`621057b9 488bd6          mov     rdx,rsi
fffff805`621057bc e81f2b0200      call    nt!PipMakeGloballyUniqueId (fffff805`621282e0)
fffff805`621057c1 8bd8            mov     ebx,eax
fffff805`621057c3 4885f6          test    rsi,rsi
fffff805`621057c6 740a            je      nt!PiProcessNewDeviceNode+0xb52 (fffff805`621057d2)  Branch

nt!PiProcessNewDeviceNode+0xb48:
fffff805`621057c8 33d2            xor     edx,edx
fffff805`621057ca 488bce          mov     rcx,rsi
fffff805`621057cd e88e44c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)

nt!PiProcessNewDeviceNode+0xb52:
fffff805`621057d2 488b75c8        mov     rsi,qword ptr [rbp-38h]
fffff805`621057d6 48897590        mov     qword ptr [rbp-70h],rsi
fffff805`621057da e96ef6ffff      jmp     nt!PiProcessNewDeviceNode+0x1cd (fffff805`62104e4d)  Branch

nt!PiProcessNewDeviceNode+0xb5f:
fffff805`621057df 8b44247c        mov     eax,dword ptr [rsp+7Ch]
fffff805`621057e3 4c8bce          mov     r9,rsi
fffff805`621057e6 488b5d98        mov     rbx,qword ptr [rbp-68h]
fffff805`621057ea 03c0            add     eax,eax
fffff805`621057ec 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`621057f0 488b0d0145dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`621057f7 4489642448      mov     dword ptr [rsp+48h],r12d
fffff805`621057fc 4533e4          xor     r12d,r12d
fffff805`621057ff 89442440        mov     dword ptr [rsp+40h],eax
fffff805`62105803 488d0516fcc6ff  lea     rax,[nt!DEVPKEY_Device_LocationPaths (fffff805`61d75420)]
fffff805`6210580a 48895c2438      mov     qword ptr [rsp+38h],rbx
fffff805`6210580f c744243012200000 mov     dword ptr [rsp+30h],2012h
fffff805`62105817 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`6210581c 458d442401      lea     r8d,[r12+1]
fffff805`62105821 4c89642420      mov     qword ptr [rsp+20h],r12
fffff805`62105826 e8590b0000      call    nt!_PnpSetObjectProperty (fffff805`62106384)
fffff805`6210582b 33d2            xor     edx,edx
fffff805`6210582d 488bcb          mov     rcx,rbx
fffff805`62105830 e82b44c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)
fffff805`62105835 e9e9fcffff      jmp     nt!PiProcessNewDeviceNode+0x8a3 (fffff805`62105523)  Branch

nt!PiProcessNewDeviceNode+0xbba:
fffff805`6210583a 4883c8ff        or      rax,0FFFFFFFFFFFFFFFFh

nt!PiProcessNewDeviceNode+0xbbe:
fffff805`6210583e 48ffc0          inc     rax
fffff805`62105841 6645392446      cmp     word ptr [r14+rax*2],r12w
fffff805`62105846 75f6            jne     nt!PiProcessNewDeviceNode+0xbbe (fffff805`6210583e)  Branch

nt!PiProcessNewDeviceNode+0xbc8:
fffff805`62105848 8d1c4502000000  lea     ebx,[rax*2+2]
fffff805`6210584f 498bce          mov     rcx,r14
fffff805`62105852 8bd3            mov     edx,ebx
fffff805`62105854 4c8d4c247c      lea     r9,[rsp+7Ch]
fffff805`62105859 4c8d4598        lea     r8,[rbp-68h]
fffff805`6210585d e8a2ebf7ff      call    nt!PnpFindAlternateStringData (fffff805`62084404)
fffff805`62105862 e955fcffff      jmp     nt!PiProcessNewDeviceNode+0x83c (fffff805`621054bc)  Branch

nt!PiProcessNewDeviceNode+0xbe7:
fffff805`62105867 33d2            xor     edx,edx
fffff805`62105869 498bce          mov     rcx,r14
fffff805`6210586c e8ef43c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)
fffff805`62105871 e991feffff      jmp     nt!PiProcessNewDeviceNode+0xa87 (fffff805`62105707)  Branch

nt!PiProcessNewDeviceNode+0xbf6:
fffff805`62105876 408a742451      mov     sil,byte ptr [rsp+51h]
fffff805`6210587b e96cfbffff      jmp     nt!PiProcessNewDeviceNode+0x76c (fffff805`621053ec)  Branch

nt!PiProcessNewDeviceNode+0xc00:
fffff805`62105880 8b4580          mov     eax,dword ptr [rbp-80h]
fffff805`62105883 41bd01000000    mov     r13d,1
fffff805`62105889 44396c2458      cmp     dword ptr [rsp+58h],r13d
fffff805`6210588e 7503            jne     nt!PiProcessNewDeviceNode+0xc13 (fffff805`62105893)  Branch

nt!PiProcessNewDeviceNode+0xc10:
fffff805`62105890 410bc5          or      eax,r13d

nt!PiProcessNewDeviceNode+0xc13:
fffff805`62105893 443925b6572800  cmp     dword ptr [nt!PiDevCfgMode (fffff805`6238b050)],r12d
fffff805`6210589a 0f84cffcffff    je      nt!PiProcessNewDeviceNode+0x8ef (fffff805`6210556f)  Branch

nt!PiProcessNewDeviceNode+0xc20:
fffff805`621058a0 448bc0          mov     r8d,eax
fffff805`621058a3 488bd6          mov     rdx,rsi
fffff805`621058a6 488bcf          mov     rcx,rdi
fffff805`621058a9 e8c6adffff      call    nt!PiDevCfgProcessDevice (fffff805`62100674)
fffff805`621058ae e9bcfcffff      jmp     nt!PiProcessNewDeviceNode+0x8ef (fffff805`6210556f)  Branch

nt!PiProcessNewDeviceNode+0xc33:
fffff805`621058b3 418bc6          mov     eax,r14d
fffff805`621058b6 418bd4          mov     edx,r12d
fffff805`621058b9 89442454        mov     dword ptr [rsp+54h],eax

nt!PiProcessNewDeviceNode+0xc3d:
fffff805`621058bd 4488642450      mov     byte ptr [rsp+50h],r12b

nt!PiProcessNewDeviceNode+0xc42:
fffff805`621058c2 f7455400010000  test    dword ptr [rbp+54h],100h
fffff805`621058c9 0f8548010000    jne     nt!PiProcessNewDeviceNode+0xd97 (fffff805`62105a17)  Branch

nt!PiProcessNewDeviceNode+0xc4f:
fffff805`621058cf 83fa1c          cmp     edx,1Ch
fffff805`621058d2 0f84fcc20900    je      nt!PiProcessNewDeviceNode+0x9cf54 (fffff805`621a1bd4)  Branch

nt!PiProcessNewDeviceNode+0xc58:
fffff805`621058d8 4533c0          xor     r8d,r8d

nt!PiProcessNewDeviceNode+0xc5b:
fffff805`621058db 488bcf          mov     rcx,rdi
fffff805`621058de e8dda90000      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621058e3 e956f8ffff      jmp     nt!PiProcessNewDeviceNode+0x4be (fffff805`6210513e)  Branch

nt!PiProcessNewDeviceNode+0xc68:
fffff805`621058e8 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff805`621058f1 4883ceff        or      rsi,0FFFFFFFFFFFFFFFFh
fffff805`621058f5 6601b0e4010000  add     word ptr [rax+1E4h],si
fffff805`621058fc 8ad3            mov     dl,bl
fffff805`621058fe 488d0dfbd3d4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`62105905 e8360c97ff      call    nt!ExAcquireResourceSharedLite (fffff805`61a76540)
fffff805`6210590a 4c8b442468      mov     r8,qword ptr [rsp+68h]
fffff805`6210590f 33d2            xor     edx,edx
fffff805`62105911 4d85c0          test    r8,r8
fffff805`62105914 740d            je      nt!PiProcessNewDeviceNode+0xca3 (fffff805`62105923)  Branch

nt!PiProcessNewDeviceNode+0xc96:
fffff805`62105916 488b4db0        mov     rcx,qword ptr [rbp-50h]
fffff805`6210591a 4885c9          test    rcx,rcx
fffff805`6210591d 0f85b4000000    jne     nt!PiProcessNewDeviceNode+0xd57 (fffff805`621059d7)  Branch

nt!PiProcessNewDeviceNode+0xca3:
fffff805`62105923 488d0dd6d3d4ff  lea     rcx,[nt!PnpRegistryDeviceResource (fffff805`61e52d00)]
fffff805`6210592a e841f996ff      call    nt!ExReleaseResourceLite (fffff805`61a75270)
fffff805`6210592f 65488b0c2588010000 mov   rcx,qword ptr gs:[188h]
fffff805`62105938 e823199aff      call    nt!KiLeaveCriticalRegionUnsafe (fffff805`61aa7260)
fffff805`6210593d 4c8b642468      mov     r12,qword ptr [rsp+68h]
fffff805`62105942 e9ccf5ffff      jmp     nt!PiProcessNewDeviceNode+0x293 (fffff805`62104f13)  Branch

nt!PiProcessNewDeviceNode+0xcc7:
fffff805`62105947 498bc4          mov     rax,r12

nt!PiProcessNewDeviceNode+0xcca:
fffff805`6210594a 48ffc0          inc     rax
fffff805`6210594d 6644393441      cmp     word ptr [rcx+rax*2],r14w
fffff805`62105952 75f6            jne     nt!PiProcessNewDeviceNode+0xcca (fffff805`6210594a)  Branch

nt!PiProcessNewDeviceNode+0xcd4:
fffff805`62105954 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62105958 8d044502000000  lea     eax,[rax*2+2]
fffff805`6210595f 89742438        mov     dword ptr [rsp+38h],esi
fffff805`62105963 41bc01000000    mov     r12d,1
fffff805`62105969 89442430        mov     dword ptr [rsp+30h],eax
fffff805`6210596d 4c8bc3          mov     r8,rbx
fffff805`62105970 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff805`62105975 488b0d7c43dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`6210597c 458d4c240d      lea     r9d,[r12+0Dh]
fffff805`62105981 4489642420      mov     dword ptr [rsp+20h],r12d
fffff805`62105986 e805deffff      call    nt!_CmSetDeviceRegProp (fffff805`62103790)
fffff805`6210598b e910f7ffff      jmp     nt!PiProcessNewDeviceNode+0x420 (fffff805`621050a0)  Branch

nt!PiProcessNewDeviceNode+0xd10:
fffff805`62105990 33d2            xor     edx,edx
fffff805`62105992 e8c942c6ff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)
fffff805`62105997 e962fdffff      jmp     nt!PiProcessNewDeviceNode+0xa7e (fffff805`621056fe)  Branch

nt!PiProcessNewDeviceNode+0xd1c:
fffff805`6210599c 488bd3          mov     rdx,rbx
fffff805`6210599f 488d4d10        lea     rcx,[rbp+10h]
fffff805`621059a3 e8b81d9bff      call    nt!RtlInitUnicodeString (fffff805`61ab7760)
fffff805`621059a8 488d9590000000  lea     rdx,[rbp+90h]
fffff805`621059af 488d4d10        lea     rcx,[rbp+10h]
fffff805`621059b3 e8b861f2ff      call    nt!RtlGUIDFromString (fffff805`6202bb70)
fffff805`621059b8 85c0            test    eax,eax
fffff805`621059ba 0f8949f8ffff    jns     nt!PiProcessNewDeviceNode+0x589 (fffff805`62105209)  Branch

nt!PiProcessNewDeviceNode+0xd40:
fffff805`621059c0 e928c20900      jmp     nt!PiProcessNewDeviceNode+0x9cf6d (fffff805`621a1bed)  Branch

nt!PiProcessNewDeviceNode+0xd45:
fffff805`621059c5 83bf940100000e  cmp     dword ptr [rdi+194h],0Eh
fffff805`621059cc 0f8583fbffff    jne     nt!PiProcessNewDeviceNode+0x8d5 (fffff805`62105555)  Branch

nt!PiProcessNewDeviceNode+0xd52:
fffff805`621059d2 e992fbffff      jmp     nt!PiProcessNewDeviceNode+0x8e9 (fffff805`62105569)  Branch

nt!PiProcessNewDeviceNode+0xd57:
fffff805`621059d7 488bc6          mov     rax,rsi

nt!PiProcessNewDeviceNode+0xd5a:
fffff805`621059da 48ffc0          inc     rax
fffff805`621059dd 66391441        cmp     word ptr [rcx+rax*2],dx
fffff805`621059e1 75f7            jne     nt!PiProcessNewDeviceNode+0xd5a (fffff805`621059da)  Branch

nt!PiProcessNewDeviceNode+0xd63:
fffff805`621059e3 8b54245c        mov     edx,dword ptr [rsp+5Ch]
fffff805`621059e7 8d044502000000  lea     eax,[rax*2+2]
fffff805`621059ee 89542438        mov     dword ptr [rsp+38h],edx
fffff805`621059f2 448bcb          mov     r9d,ebx
fffff805`621059f5 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`621059f9 89442430        mov     dword ptr [rsp+30h],eax
fffff805`621059fd 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff805`62105a02 488b0def42dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62105a09 895c2420        mov     dword ptr [rsp+20h],ebx
fffff805`62105a0d e87eddffff      call    nt!_CmSetDeviceRegProp (fffff805`62103790)
fffff805`62105a12 e90cffffff      jmp     nt!PiProcessNewDeviceNode+0xca3 (fffff805`62105923)  Branch

nt!PiProcessNewDeviceNode+0xd97:
fffff805`62105a17 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`62105a1b 0fbae80a        bts     eax,0Ah
fffff805`62105a1f 488b0dd242dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`62105a26 41b90b000000    mov     r9d,0Bh
fffff805`62105a2c 89742438        mov     dword ptr [rsp+38h],esi
fffff805`62105a30 4c8bc3          mov     r8,rbx
fffff805`62105a33 89442454        mov     dword ptr [rsp+54h],eax
fffff805`62105a37 488d442454      lea     rax,[rsp+54h]
fffff805`62105a3c c744243004000000 mov     dword ptr [rsp+30h],4
fffff805`62105a44 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`62105a49 c744242004000000 mov     dword ptr [rsp+20h],4
fffff805`62105a51 e83addffff      call    nt!_CmSetDeviceRegProp (fffff805`62103790)
fffff805`62105a56 e9e3f6ffff      jmp     nt!PiProcessNewDeviceNode+0x4be (fffff805`6210513e)  Branch

nt!PiProcessNewDeviceNode+0xddb:
fffff805`62105a5b ba02000000      mov     edx,2
fffff805`62105a60 488bcf          mov     rcx,rdi
fffff805`62105a63 e8c84b0200      call    nt!PipSetDevNodeUserFlags (fffff805`6212a630)
fffff805`62105a68 e930f3ffff      jmp     nt!PiProcessNewDeviceNode+0x11d (fffff805`62104d9d)  Branch

nt!PiProcessNewDeviceNode+0xded:
fffff805`62105a6d ba12000000      mov     edx,12h
fffff805`62105a72 4184c4          test    r12b,al
fffff805`62105a75 0f8442feffff    je      nt!PiProcessNewDeviceNode+0xc3d (fffff805`621058bd)  Branch

nt!PiProcessNewDeviceNode+0xdfb:
fffff805`62105a7b e942feffff      jmp     nt!PiProcessNewDeviceNode+0xc42 (fffff805`621058c2)  Branch

nt!PiProcessNewDeviceNode+0xe00:
fffff805`62105a80 8b8794010000    mov     eax,dword ptr [rdi+194h]  ;rdi = devnode,  DEVICE_NODE->Problem
fffff805`62105a86 83f81d          cmp     eax,1Dh
fffff805`62105a89 0f87f8faffff    ja      nt!PiProcessNewDeviceNode+0x907 (fffff805`62105587)  Branch

nt!PiProcessNewDeviceNode+0xe0f:
fffff805`62105a8f b908424820      mov     ecx,20484208h
fffff805`62105a94 0fa3c1          bt      ecx,eax
fffff805`62105a97 0f83eafaffff    jae     nt!PiProcessNewDeviceNode+0x907 (fffff805`62105587)  Branch

nt!PiProcessNewDeviceNode+0xe1d:
fffff805`62105a9d e9f4faffff      jmp     nt!PiProcessNewDeviceNode+0x916 (fffff805`62105596)  Branch

nt!PiProcessNewDeviceNode+0xe22:
fffff805`62105aa2 8b8794010000    mov     eax,dword ptr [rdi+194h]
fffff805`62105aa8 83f813          cmp     eax,13h
fffff805`62105aab 0f8716fbffff    ja      nt!PiProcessNewDeviceNode+0x947 (fffff805`621055c7)  Branch

nt!PiProcessNewDeviceNode+0xe31:
fffff805`62105ab1 b908020800      mov     ecx,80208h
fffff805`62105ab6 0fa3c1          bt      ecx,eax
fffff805`62105ab9 0f8308fbffff    jae     nt!PiProcessNewDeviceNode+0x947 (fffff805`621055c7)  Branch

nt!PiProcessNewDeviceNode+0xe3f:
fffff805`62105abf e986fbffff      jmp     nt!PiProcessNewDeviceNode+0x9ca (fffff805`6210564a)  Branch

nt!PiProcessNewDeviceNode+0xe44:
fffff805`62105ac4 8b8794010000    mov     eax,dword ptr [rdi+194h]
fffff805`62105aca 83f813          cmp     eax,13h
fffff805`62105acd 0f8787fbffff    ja      nt!PiProcessNewDeviceNode+0x9da (fffff805`6210565a)  Branch

nt!PiProcessNewDeviceNode+0xe53:
fffff805`62105ad3 0fa3c1          bt      ecx,eax
fffff805`62105ad6 0f837efbffff    jae     nt!PiProcessNewDeviceNode+0x9da (fffff805`6210565a)  Branch

nt!PiProcessNewDeviceNode+0xe5c:
fffff805`62105adc e9c3fbffff      jmp     nt!PiProcessNewDeviceNode+0xa24 (fffff805`621056a4)  Branch

nt!PiProcessNewDeviceNode+0x9ca4c:
fffff805`621a16cc 4c8bcf          mov     r9,rdi
fffff805`621a16cf 488d154a2dbfff  lea     rdx,[nt!KMPnPEvt_ProcessNewDevice_Start (fffff805`61d94420)]
fffff805`621a16d6 4533c0          xor     r8d,r8d
fffff805`621a16d9 e8e253b0ff      call    nt!McTemplateK0p (fffff805`61ca6ac0)
fffff805`621a16de 90              nop
fffff805`621a16df e9e935f6ff      jmp     nt!PiProcessNewDeviceNode+0x4d (fffff805`62104ccd)  Branch

nt!PiProcessNewDeviceNode+0x9ca64:
fffff805`621a16e4 3d380004c0      cmp     eax,0C0040038h
fffff805`621a16e9 448be8          mov     r13d,eax
fffff805`621a16ec b9010000c0      mov     ecx,0C0000001h
fffff805`621a16f1 440f44e9        cmove   r13d,ecx
fffff805`621a16f5 e96f36f6ff      jmp     nt!PiProcessNewDeviceNode+0xe9 (fffff805`62104d69)  Branch

nt!PiProcessNewDeviceNode+0x9ca7a:
fffff805`621a16fa bb01000000      mov     ebx,1
fffff805`621a16ff e9aa36f6ff      jmp     nt!PiProcessNewDeviceNode+0x12e (fffff805`62104dae)  Branch

nt!PiProcessNewDeviceNode+0x9ca84:
fffff805`621a1704 83bf3802000004  cmp     dword ptr [rdi+238h],4
fffff805`621a170b 7508            jne     nt!PiProcessNewDeviceNode+0x9ca95 (fffff805`621a1715)  Branch

nt!PiProcessNewDeviceNode+0x9ca8d:
fffff805`621a170d 488bcf          mov     rcx,rdi
fffff805`621a1710 e837f50a00      call    nt!PpProfileCancelTransitioningDock (fffff805`62250c4c)

nt!PiProcessNewDeviceNode+0x9ca95:
fffff805`621a1715 8bc3            mov     eax,ebx
fffff805`621a1717 e99e36f6ff      jmp     nt!PiProcessNewDeviceNode+0x13a (fffff805`62104dba)  Branch

nt!PiProcessNewDeviceNode+0x9ca9c:
fffff805`621a171c 488b4540        mov     rax,qword ptr [rbp+40h]
fffff805`621a1720 4885c0          test    rax,rax
fffff805`621a1723 0f84d336f6ff    je      nt!PiProcessNewDeviceNode+0x17c (fffff805`62104dfc)  Branch

nt!PiProcessNewDeviceNode+0x9caa9:
fffff805`621a1729 66395d22        cmp     word ptr [rbp+22h],bx
fffff805`621a172d 0f85c936f6ff    jne     nt!PiProcessNewDeviceNode+0x17c (fffff805`62104dfc)  Branch

nt!PiProcessNewDeviceNode+0x9cab3:
fffff805`621a1733 488b4d28        mov     rcx,qword ptr [rbp+28h]
fffff805`621a1737 488d55a8        lea     rdx,[rbp-58h]
fffff805`621a173b e81011a4ff      call    nt!guard_dispatch_icall (fffff805`61be2850)
fffff805`621a1740 488b4538        mov     rax,qword ptr [rbp+38h]
fffff805`621a1744 4885c0          test    rax,rax
fffff805`621a1747 0f84af36f6ff    je      nt!PiProcessNewDeviceNode+0x17c (fffff805`62104dfc)  Branch

nt!PiProcessNewDeviceNode+0x9cacd:
fffff805`621a174d 488b4d28        mov     rcx,qword ptr [rbp+28h]
fffff805`621a1751 e8fa10a4ff      call    nt!guard_dispatch_icall (fffff805`61be2850)
fffff805`621a1756 90              nop
fffff805`621a1757 e9a036f6ff      jmp     nt!PiProcessNewDeviceNode+0x17c (fffff805`62104dfc)  Branch

nt!PiProcessNewDeviceNode+0x9cadc:
fffff805`621a175c 83bf9401000009  cmp     dword ptr [rdi+194h],9
fffff805`621a1763 0f84e036f6ff    je      nt!PiProcessNewDeviceNode+0x1c9 (fffff805`62104e49)  Branch

nt!PiProcessNewDeviceNode+0x9cae9:
fffff805`621a1769 e92a40f6ff      jmp     nt!PiProcessNewDeviceNode+0xb18 (fffff805`62105798)  Branch

nt!PiProcessNewDeviceNode+0x9caee:
fffff805`621a176e ba09000000      mov     edx,9
fffff805`621a1773 488bcf          mov     rcx,rdi
fffff805`621a1776 e845ebf6ff      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621a177b 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff805`621a177f ba00002000      mov     edx,200000h
fffff805`621a1784 e8bf46f6ff      call    nt!PipSetDevNodeFlags (fffff805`62105e48)
fffff805`621a1789 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff805`621a178d 4883c128        add     rcx,28h
fffff805`621a1791 e842010b00      call    nt!PnpSetInvalidIDEvent (fffff805`622518d8)
fffff805`621a1796 90              nop
fffff805`621a1797 e9ad36f6ff      jmp     nt!PiProcessNewDeviceNode+0x1c9 (fffff805`62104e49)  Branch

nt!PiProcessNewDeviceNode+0x9cb1c:
fffff805`621a179c f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`621a17a6 448beb          mov     r13d,ebx
fffff805`621a17a9 740d            je      nt!PiProcessNewDeviceNode+0x9cb38 (fffff805`621a17b8)  Branch

nt!PiProcessNewDeviceNode+0x9cb2b:
fffff805`621a17ab 83bf9401000009  cmp     dword ptr [rdi+194h],9
fffff805`621a17b2 0f849d36f6ff    je      nt!PiProcessNewDeviceNode+0x1d5 (fffff805`62104e55)  Branch

nt!PiProcessNewDeviceNode+0x9cb38:
fffff805`621a17b8 488bcf          mov     rcx,rdi
fffff805`621a17bb 81fb9a0000c0    cmp     ebx,0C000009Ah
fffff805`621a17c1 750a            jne     nt!PiProcessNewDeviceNode+0x9cb4d (fffff805`621a17cd)  Branch

nt!PiProcessNewDeviceNode+0x9cb43:
fffff805`621a17c3 ba03000000      mov     edx,3
fffff805`621a17c8 448bc3          mov     r8d,ebx
fffff805`621a17cb eb08            jmp     nt!PiProcessNewDeviceNode+0x9cb55 (fffff805`621a17d5)  Branch

nt!PiProcessNewDeviceNode+0x9cb4d:
fffff805`621a17cd 448bc3          mov     r8d,ebx
fffff805`621a17d0 ba13000000      mov     edx,13h

nt!PiProcessNewDeviceNode+0x9cb55:
fffff805`621a17d5 e8e6eaf6ff      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621a17da 90              nop
fffff805`621a17db e97536f6ff      jmp     nt!PiProcessNewDeviceNode+0x1d5 (fffff805`62104e55)  Branch

nt!PiProcessNewDeviceNode+0x9cb60:
fffff805`621a17e0 488b4730        mov     rax,qword ptr [rdi+30h]
fffff805`621a17e4 4c8bcf          mov     r9,rdi
fffff805`621a17e7 4889442420      mov     qword ptr [rsp+20h],rax
fffff805`621a17ec e8eb76b0ff      call    nt!McTemplateK0pz (fffff805`61ca8edc)
fffff805`621a17f1 90              nop
fffff805`621a17f2 e98436f6ff      jmp     nt!PiProcessNewDeviceNode+0x1fb (fffff805`62104e7b)  Branch

nt!PiProcessNewDeviceNode+0x9cb77:
fffff805`621a17f7 448bc3          mov     r8d,ebx
fffff805`621a17fa ba13000000      mov     edx,13h
fffff805`621a17ff 488bcf          mov     rcx,rdi
fffff805`621a1802 e8b9eaf6ff      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621a1807 90              nop
fffff805`621a1808 e99f36f6ff      jmp     nt!PiProcessNewDeviceNode+0x22c (fffff805`62104eac)  Branch

nt!PiProcessNewDeviceNode+0x9cb8d:
fffff805`621a180d 8b8794010000    mov     eax,dword ptr [rdi+194h]
fffff805`621a1813 83f813          cmp     eax,13h
fffff805`621a1816 0f87ce36f6ff    ja      nt!PiProcessNewDeviceNode+0x26a (fffff805`62104eea)  Branch

nt!PiProcessNewDeviceNode+0x9cb9c:
fffff805`621a181c b908020800      mov     ecx,80208h
fffff805`621a1821 0fa3c1          bt      ecx,eax
fffff805`621a1824 0f82f936f6ff    jb      nt!PiProcessNewDeviceNode+0x2a3 (fffff805`62104f23)  Branch

nt!PiProcessNewDeviceNode+0x9cbaa:
fffff805`621a182a e9bb36f6ff      jmp     nt!PiProcessNewDeviceNode+0x26a (fffff805`62104eea)  Branch

nt!PiProcessNewDeviceNode+0x9cbaf:
fffff805`621a182f 493bdf          cmp     rbx,r15
fffff805`621a1832 0f84af020000    je      nt!PiProcessNewDeviceNode+0x9ce67 (fffff805`621a1ae7)  Branch

nt!PiProcessNewDeviceNode+0x9cbb8:
fffff805`621a1838 4584f6          test    r14b,r14b
fffff805`621a183b 7476            je      nt!PiProcessNewDeviceNode+0x9cc33 (fffff805`621a18b3)  Branch

nt!PiProcessNewDeviceNode+0x9cbbd:
fffff805`621a183d 498bcc          mov     rcx,r12
fffff805`621a1840 e8db36a3ff      call    nt!ZwClose (fffff805`61bd4f20)
fffff805`621a1845 836554bf        and     dword ptr [rbp+54h],0FFFFFFBFh
fffff805`621a1849 33c0            xor     eax,eax
fffff805`621a184b 4533c0          xor     r8d,r8d
fffff805`621a184e 4889442468      mov     qword ptr [rsp+68h],rax
fffff805`621a1853 488bcf          mov     rcx,rdi
fffff805`621a1856 448be0          mov     r12d,eax
fffff805`621a1859 448af0          mov     r14b,al
fffff805`621a185c 8d502a          lea     edx,[rax+2Ah]
fffff805`621a185f e85ceaf6ff      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621a1864 488b4dc0        mov     rcx,qword ptr [rbp-40h]
fffff805`621a1868 488bd6          mov     rdx,rsi
fffff805`621a186b e8fc710b00      call    nt!PnpLogDuplicateDevice (fffff805`62258a6c)
fffff805`621a1870 488b8338010000  mov     rax,qword ptr [rbx+138h]
fffff805`621a1877 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a187b 488b4710        mov     rax,qword ptr [rdi+10h]
fffff805`621a187f 48394110        cmp     qword ptr [rcx+10h],rax
fffff805`621a1883 7518            jne     nt!PiProcessNewDeviceNode+0x9cc1d (fffff805`621a189d)  Branch

nt!PiProcessNewDeviceNode+0x9cc05:
fffff805`621a1885 498b5708        mov     rdx,qword ptr [r15+8]
fffff805`621a1889 4c8bcb          mov     r9,rbx
fffff805`621a188c 4d8bc7          mov     r8,r15
fffff805`621a188f 33c9            xor     ecx,ecx
fffff805`621a1891 488b9248010000  mov     rdx,qword ptr [rdx+148h]
fffff805`621a1898 e82f78b0ff      call    nt!PpvUtilFailDriver (fffff805`61ca90cc)

nt!PiProcessNewDeviceNode+0x9cc1d:
fffff805`621a189d ba506e7065      mov     edx,65706E50h
fffff805`621a18a2 488bcb          mov     rcx,rbx
fffff805`621a18a5 e8b6598dff      call    nt!ObfDereferenceObjectWithTag (fffff805`61a77260)
fffff805`621a18aa 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff805`621a18ae e9fe3ef6ff      jmp     nt!PiProcessNewDeviceNode+0xb31 (fffff805`621057b1)  Branch

nt!PiProcessNewDeviceNode+0x9cc33:
fffff805`621a18b3 498b5708        mov     rdx,qword ptr [r15+8]
fffff805`621a18b7 4c8bcb          mov     r9,rbx
fffff805`621a18ba 4d8bc7          mov     r8,r15
fffff805`621a18bd 33c9            xor     ecx,ecx
fffff805`621a18bf 488b9248010000  mov     rdx,qword ptr [rdx+148h]
fffff805`621a18c6 e80178b0ff      call    nt!PpvUtilFailDriver (fffff805`61ca90cc)
fffff805`621a18cb 410fb75702      movzx   edx,word ptr [r15+2]
fffff805`621a18d0 498bcf          mov     rcx,r15
fffff805`621a18d3 e8b4d4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a18d8 498b4f08        mov     rcx,qword ptr [r15+8]
fffff805`621a18dc 33f6            xor     esi,esi
fffff805`621a18de 4885c9          test    rcx,rcx
fffff805`621a18e1 7435            je      nt!PiProcessNewDeviceNode+0x9cc98 (fffff805`621a1918)  Branch

nt!PiProcessNewDeviceNode+0x9cc63:
fffff805`621a18e3 0fbf5102        movsx   edx,word ptr [rcx+2]
fffff805`621a18e7 e8a0d4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a18ec 498b4f08        mov     rcx,qword ptr [r15+8]
fffff805`621a18f0 448d6602        lea     r12d,[rsi+2]
fffff805`621a18f4 4883c138        add     rcx,38h
fffff805`621a18f8 663931          cmp     word ptr [rcx],si
fffff805`621a18fb 7421            je      nt!PiProcessNewDeviceNode+0x9cc9e (fffff805`621a191e)  Branch

nt!PiProcessNewDeviceNode+0x9cc7d:
fffff805`621a18fd 418bd4          mov     edx,r12d
fffff805`621a1900 e887d4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1905 498b4f08        mov     rcx,qword ptr [r15+8]
fffff805`621a1909 0fb75138        movzx   edx,word ptr [rcx+38h]
fffff805`621a190d 488b4940        mov     rcx,qword ptr [rcx+40h]
fffff805`621a1911 e876d4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1916 eb06            jmp     nt!PiProcessNewDeviceNode+0x9cc9e (fffff805`621a191e)  Branch

nt!PiProcessNewDeviceNode+0x9cc98:
fffff805`621a1918 41bc02000000    mov     r12d,2

nt!PiProcessNewDeviceNode+0x9cc9e:
fffff805`621a191e 498b8738010000  mov     rax,qword ptr [r15+138h]
fffff805`621a1925 41be10030000    mov     r14d,310h
fffff805`621a192b 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a192f 4885c9          test    rcx,rcx
fffff805`621a1932 0f849e000000    je      nt!PiProcessNewDeviceNode+0x9cd56 (fffff805`621a19d6)  Branch

nt!PiProcessNewDeviceNode+0x9ccb8:
fffff805`621a1938 418bd6          mov     edx,r14d
fffff805`621a193b 488d7928        lea     rdi,[rcx+28h]
fffff805`621a193f e848d4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1944 663937          cmp     word ptr [rdi],si
fffff805`621a1947 7417            je      nt!PiProcessNewDeviceNode+0x9cce0 (fffff805`621a1960)  Branch

nt!PiProcessNewDeviceNode+0x9ccc9:
fffff805`621a1949 418bd4          mov     edx,r12d
fffff805`621a194c 488bcf          mov     rcx,rdi
fffff805`621a194f e838d4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1954 0fb717          movzx   edx,word ptr [rdi]
fffff805`621a1957 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff805`621a195b e82cd4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)

nt!PiProcessNewDeviceNode+0x9cce0:
fffff805`621a1960 498b8f38010000  mov     rcx,qword ptr [r15+138h]
fffff805`621a1967 488b4128        mov     rax,qword ptr [rcx+28h]
fffff805`621a196b 66397038        cmp     word ptr [rax+38h],si
fffff805`621a196f 742b            je      nt!PiProcessNewDeviceNode+0x9cd1c (fffff805`621a199c)  Branch

nt!PiProcessNewDeviceNode+0x9ccf1:
fffff805`621a1971 418bd4          mov     edx,r12d
fffff805`621a1974 488d4838        lea     rcx,[rax+38h]
fffff805`621a1978 e80fd4a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a197d 498b8738010000  mov     rax,qword ptr [r15+138h]
fffff805`621a1984 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a1988 0fb75138        movzx   edx,word ptr [rcx+38h]
fffff805`621a198c 488b4940        mov     rcx,qword ptr [rcx+40h]
fffff805`621a1990 e8f7d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1995 498b8f38010000  mov     rcx,qword ptr [r15+138h]

nt!PiProcessNewDeviceNode+0x9cd1c:
fffff805`621a199c 488b4128        mov     rax,qword ptr [rcx+28h]
fffff805`621a19a0 488b4810        mov     rcx,qword ptr [rax+10h]
fffff805`621a19a4 4885c9          test    rcx,rcx
fffff805`621a19a7 742d            je      nt!PiProcessNewDeviceNode+0x9cd56 (fffff805`621a19d6)  Branch

nt!PiProcessNewDeviceNode+0x9cd29:
fffff805`621a19a9 4883c138        add     rcx,38h
fffff805`621a19ad 663931          cmp     word ptr [rcx],si
fffff805`621a19b0 7424            je      nt!PiProcessNewDeviceNode+0x9cd56 (fffff805`621a19d6)  Branch

nt!PiProcessNewDeviceNode+0x9cd32:
fffff805`621a19b2 418bd4          mov     edx,r12d
fffff805`621a19b5 e8d2d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a19ba 498b8738010000  mov     rax,qword ptr [r15+138h]
fffff805`621a19c1 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a19c5 488b4910        mov     rcx,qword ptr [rcx+10h]
fffff805`621a19c9 0fb75138        movzx   edx,word ptr [rcx+38h]
fffff805`621a19cd 488b4940        mov     rcx,qword ptr [rcx+40h]
fffff805`621a19d1 e8b6d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)

nt!PiProcessNewDeviceNode+0x9cd56:
fffff805`621a19d6 0fb75302        movzx   edx,word ptr [rbx+2]
fffff805`621a19da 488bcb          mov     rcx,rbx
fffff805`621a19dd e8aad3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a19e2 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff805`621a19e6 4885c9          test    rcx,rcx
fffff805`621a19e9 742f            je      nt!PiProcessNewDeviceNode+0x9cd9a (fffff805`621a1a1a)  Branch

nt!PiProcessNewDeviceNode+0x9cd6b:
fffff805`621a19eb 0fbf5102        movsx   edx,word ptr [rcx+2]
fffff805`621a19ef e898d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a19f4 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff805`621a19f8 4883c138        add     rcx,38h
fffff805`621a19fc 663931          cmp     word ptr [rcx],si
fffff805`621a19ff 7419            je      nt!PiProcessNewDeviceNode+0x9cd9a (fffff805`621a1a1a)  Branch

nt!PiProcessNewDeviceNode+0x9cd81:
fffff805`621a1a01 418bd4          mov     edx,r12d
fffff805`621a1a04 e883d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1a09 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff805`621a1a0d 0fb75138        movzx   edx,word ptr [rcx+38h]
fffff805`621a1a11 488b4940        mov     rcx,qword ptr [rcx+40h]
fffff805`621a1a15 e872d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)

nt!PiProcessNewDeviceNode+0x9cd9a:
fffff805`621a1a1a 488b8338010000  mov     rax,qword ptr [rbx+138h]
fffff805`621a1a21 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a1a25 4885c9          test    rcx,rcx
fffff805`621a1a28 0f849e000000    je      nt!PiProcessNewDeviceNode+0x9ce4c (fffff805`621a1acc)  Branch

nt!PiProcessNewDeviceNode+0x9cdae:
fffff805`621a1a2e 418bd6          mov     edx,r14d
fffff805`621a1a31 488d7928        lea     rdi,[rcx+28h]
fffff805`621a1a35 e852d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1a3a 663937          cmp     word ptr [rdi],si
fffff805`621a1a3d 7417            je      nt!PiProcessNewDeviceNode+0x9cdd6 (fffff805`621a1a56)  Branch

nt!PiProcessNewDeviceNode+0x9cdbf:
fffff805`621a1a3f 418bd4          mov     edx,r12d
fffff805`621a1a42 488bcf          mov     rcx,rdi
fffff805`621a1a45 e842d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1a4a 0fb717          movzx   edx,word ptr [rdi]
fffff805`621a1a4d 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff805`621a1a51 e836d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)

nt!PiProcessNewDeviceNode+0x9cdd6:
fffff805`621a1a56 488b8b38010000  mov     rcx,qword ptr [rbx+138h]
fffff805`621a1a5d 488b4128        mov     rax,qword ptr [rcx+28h]
fffff805`621a1a61 66397038        cmp     word ptr [rax+38h],si
fffff805`621a1a65 742b            je      nt!PiProcessNewDeviceNode+0x9ce12 (fffff805`621a1a92)  Branch

nt!PiProcessNewDeviceNode+0x9cde7:
fffff805`621a1a67 418bd4          mov     edx,r12d
fffff805`621a1a6a 488d4838        lea     rcx,[rax+38h]
fffff805`621a1a6e e819d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1a73 488b8338010000  mov     rax,qword ptr [rbx+138h]
fffff805`621a1a7a 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a1a7e 0fb75138        movzx   edx,word ptr [rcx+38h]
fffff805`621a1a82 488b4940        mov     rcx,qword ptr [rcx+40h]
fffff805`621a1a86 e801d3a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1a8b 488b8b38010000  mov     rcx,qword ptr [rbx+138h]

nt!PiProcessNewDeviceNode+0x9ce12:
fffff805`621a1a92 488b4128        mov     rax,qword ptr [rcx+28h]
fffff805`621a1a96 488b4810        mov     rcx,qword ptr [rax+10h]
fffff805`621a1a9a 4885c9          test    rcx,rcx
fffff805`621a1a9d 742d            je      nt!PiProcessNewDeviceNode+0x9ce4c (fffff805`621a1acc)  Branch

nt!PiProcessNewDeviceNode+0x9ce1f:
fffff805`621a1a9f 4883c138        add     rcx,38h
fffff805`621a1aa3 663931          cmp     word ptr [rcx],si
fffff805`621a1aa6 7424            je      nt!PiProcessNewDeviceNode+0x9ce4c (fffff805`621a1acc)  Branch

nt!PiProcessNewDeviceNode+0x9ce28:
fffff805`621a1aa8 418bd4          mov     edx,r12d
fffff805`621a1aab e8dcd2a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)
fffff805`621a1ab0 488b8338010000  mov     rax,qword ptr [rbx+138h]
fffff805`621a1ab7 488b4828        mov     rcx,qword ptr [rax+28h]
fffff805`621a1abb 488b4910        mov     rcx,qword ptr [rcx+10h]
fffff805`621a1abf 0fb75138        movzx   edx,word ptr [rcx+38h]
fffff805`621a1ac3 488b4940        mov     rcx,qword ptr [rcx+40h]
fffff805`621a1ac7 e8c0d2a0ff      call    nt!IoAddTriageDumpDataBlock (fffff805`61baed8c)

nt!PiProcessNewDeviceNode+0x9ce4c:
fffff805`621a1acc 4c8bcb          mov     r9,rbx
fffff805`621a1acf 4889742420      mov     qword ptr [rsp+20h],rsi
fffff805`621a1ad4 4d8bc7          mov     r8,r15
fffff805`621a1ad7 ba01000000      mov     edx,1
fffff805`621a1adc b9ca000000      mov     ecx,0CAh
fffff805`621a1ae1 e88a6ca3ff      call    nt!KeBugCheckEx (fffff805`61bd8770)
fffff805`621a1ae6 cc              int     3

nt!PiProcessNewDeviceNode+0x9ce67:
fffff805`621a1ae7 ba506e7065      mov     edx,65706E50h
fffff805`621a1aec 488bcb          mov     rcx,rbx
fffff805`621a1aef e86c578dff      call    nt!ObfDereferenceObjectWithTag (fffff805`61a77260)
fffff805`621a1af4 90              nop
fffff805`621a1af5 e91434f6ff      jmp     nt!PiProcessNewDeviceNode+0x28e (fffff805`62104f0e)  Branch

nt!PiProcessNewDeviceNode+0x9ce7a:
fffff805`621a1afa 83bf940100002a  cmp     dword ptr [rdi+194h],2Ah
fffff805`621a1b01 0f851c34f6ff    jne     nt!PiProcessNewDeviceNode+0x2a3 (fffff805`62104f23)  Branch

nt!PiProcessNewDeviceNode+0x9ce87:
fffff805`621a1b07 488bcf          mov     rcx,rdi
fffff805`621a1b0a e849e2f5ff      call    nt!PipClearDevNodeProblem (fffff805`620ffd58)
fffff805`621a1b0f 90              nop
fffff805`621a1b10 e90e34f6ff      jmp     nt!PiProcessNewDeviceNode+0x2a3 (fffff805`62104f23)  Branch

nt!PiProcessNewDeviceNode+0x9ce95:
fffff805`621a1b15 f7878c01000000200000 test dword ptr [rdi+18Ch],2000h
fffff805`621a1b1f 7417            je      nt!PiProcessNewDeviceNode+0x9ceb8 (fffff805`621a1b38)  Branch

nt!PiProcessNewDeviceNode+0x9cea1:
fffff805`621a1b21 8b8794010000    mov     eax,dword ptr [rdi+194h]
fffff805`621a1b27 3bc3            cmp     eax,ebx
fffff805`621a1b29 0f842135f6ff    je      nt!PiProcessNewDeviceNode+0x3d0 (fffff805`62105050)  Branch

nt!PiProcessNewDeviceNode+0x9ceaf:
fffff805`621a1b2f 83f80e          cmp     eax,0Eh
fffff805`621a1b32 0f841835f6ff    je      nt!PiProcessNewDeviceNode+0x3d0 (fffff805`62105050)  Branch

nt!PiProcessNewDeviceNode+0x9ceb8:
fffff805`621a1b38 ba1d000000      mov     edx,1Dh
fffff805`621a1b3d 488bcf          mov     rcx,rdi
fffff805`621a1b40 e853450a00      call    nt!PnpDisableDevice (fffff805`62246098)
fffff805`621a1b45 90              nop
fffff805`621a1b46 e90535f6ff      jmp     nt!PiProcessNewDeviceNode+0x3d0 (fffff805`62105050)  Branch

nt!PiProcessNewDeviceNode+0x9cecb:
fffff805`621a1b4b 8b8794010000    mov     eax,dword ptr [rdi+194h]
fffff805`621a1b51 44896c2470      mov     dword ptr [rsp+70h],r13d
fffff805`621a1b56 83f809          cmp     eax,9
fffff805`621a1b59 0f844036f6ff    je      nt!PiProcessNewDeviceNode+0x51f (fffff805`6210519f)  Branch

nt!PiProcessNewDeviceNode+0x9cedf:
fffff805`621a1b5f 44896c2470      mov     dword ptr [rsp+70h],r13d
fffff805`621a1b64 83f803          cmp     eax,3
fffff805`621a1b67 0f843236f6ff    je      nt!PiProcessNewDeviceNode+0x51f (fffff805`6210519f)  Branch

nt!PiProcessNewDeviceNode+0x9ceed:
fffff805`621a1b6d 44896c2470      mov     dword ptr [rsp+70h],r13d
fffff805`621a1b72 83f813          cmp     eax,13h
fffff805`621a1b75 0f842436f6ff    je      nt!PiProcessNewDeviceNode+0x51f (fffff805`6210519f)  Branch

nt!PiProcessNewDeviceNode+0x9cefb:
fffff805`621a1b7b e9e034f6ff      jmp     nt!PiProcessNewDeviceNode+0x3e0 (fffff805`62105060)  Branch

nt!PiProcessNewDeviceNode+0x9cf00:
fffff805`621a1b80 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`621a1b84 488d45a8        lea     rax,[rbp-58h]
fffff805`621a1b88 488b0d6981d5ff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`621a1b8f 4c8bcb          mov     r9,rbx
fffff805`621a1b92 89742448        mov     dword ptr [rsp+48h],esi
fffff805`621a1b96 458bc4          mov     r8d,r12d
fffff805`621a1b99 c744244008000000 mov     dword ptr [rsp+40h],8
fffff805`621a1ba1 4889442438      mov     qword ptr [rsp+38h],rax
fffff805`621a1ba6 488d052b38beff  lea     rax,[nt!DEVPKEY_Device_ExtendedAddress (fffff805`61d853d8)]
fffff805`621a1bad c744243009000000 mov     dword ptr [rsp+30h],9
fffff805`621a1bb5 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`621a1bba 4c89742420      mov     qword ptr [rsp+20h],r14
fffff805`621a1bbf e8c047f6ff      call    nt!_PnpSetObjectProperty (fffff805`62106384)
fffff805`621a1bc4 90              nop
fffff805`621a1bc5 e9f934f6ff      jmp     nt!PiProcessNewDeviceNode+0x443 (fffff805`621050c3)  Branch

nt!PiProcessNewDeviceNode+0x9cf4a:
fffff805`621a1bca ba1c000000      mov     edx,1Ch
fffff805`621a1bcf e9ee3cf6ff      jmp     nt!PiProcessNewDeviceNode+0xc42 (fffff805`621058c2)  Branch

nt!PiProcessNewDeviceNode+0x9cf54:
fffff805`621a1bd4 488b4f30        mov     rcx,qword ptr [rdi+30h]
fffff805`621a1bd8 488bd3          mov     rdx,rbx
fffff805`621a1bdb e8e8980a00      call    nt!PiDevCfgGetFailedInstallProblemStatus (fffff805`6224b4c8)
fffff805`621a1be0 448bc0          mov     r8d,eax
fffff805`621a1be3 ba1c000000      mov     edx,1Ch
fffff805`621a1be8 e9ee3cf6ff      jmp     nt!PiProcessNewDeviceNode+0xc5b (fffff805`621058db)  Branch

nt!PiProcessNewDeviceNode+0x9cf6d:
fffff805`621a1bed 33d2            xor     edx,edx
fffff805`621a1bef 488bcb          mov     rcx,rbx
fffff805`621a1bf2 e86980bcff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)
fffff805`621a1bf7 498bde          mov     rbx,r14
fffff805`621a1bfa 48895d88        mov     qword ptr [rbp-78h],rbx
fffff805`621a1bfe e90636f6ff      jmp     nt!PiProcessNewDeviceNode+0x589 (fffff805`62105209)  Branch

nt!PiProcessNewDeviceNode+0x9cf83:
fffff805`621a1c03 448a442460      mov     r8b,byte ptr [rsp+60h]
fffff805`621a1c08 e93436f6ff      jmp     nt!PiProcessNewDeviceNode+0x5c1 (fffff805`62105241)  Branch

nt!PiProcessNewDeviceNode+0x9cf8d:
fffff805`621a1c0d 33d2            xor     edx,edx
fffff805`621a1c0f 488bcb          mov     rcx,rbx
fffff805`621a1c12 e84980bcff      call    nt!ExFreePoolWithTag (fffff805`61d69c60)
fffff805`621a1c17 90              nop
fffff805`621a1c18 e95136f6ff      jmp     nt!PiProcessNewDeviceNode+0x5ee (fffff805`6210526e)  Branch

nt!PiProcessNewDeviceNode+0x9cf9d:
fffff805`621a1c1d 33c0            xor     eax,eax
fffff805`621a1c1f 488906          mov     qword ptr [rsi],rax
fffff805`621a1c22 48894608        mov     qword ptr [rsi+8],rax
fffff805`621a1c26 e97b36f6ff      jmp     nt!PiProcessNewDeviceNode+0x626 (fffff805`621052a6)  Branch

nt!PiProcessNewDeviceNode+0x9cfab:
fffff805`621a1c2b 448a6c2450      mov     r13b,byte ptr [rsp+50h]
fffff805`621a1c30 4584ed          test    r13b,r13b
fffff805`621a1c33 752a            jne     nt!PiProcessNewDeviceNode+0x9cfdf (fffff805`621a1c5f)  Branch

nt!PiProcessNewDeviceNode+0x9cfb5:
fffff805`621a1c35 488b4f30        mov     rcx,qword ptr [rdi+30h]
fffff805`621a1c39 4c8d442478      lea     r8,[rsp+78h]
fffff805`621a1c3e 488bd3          mov     rdx,rbx
fffff805`621a1c41 e8f6dd0a00      call    nt!PpDevCfgCheckDeviceNeedsUpdate (fffff805`6224fa3c)
fffff805`621a1c46 8b542454        mov     edx,dword ptr [rsp+54h]
fffff805`621a1c4a 85c0            test    eax,eax
fffff805`621a1c4c 780c            js      nt!PiProcessNewDeviceNode+0x9cfda (fffff805`621a1c5a)  Branch

nt!PiProcessNewDeviceNode+0x9cfce:
fffff805`621a1c4e 8b442478        mov     eax,dword ptr [rsp+78h]
fffff805`621a1c52 0bd0            or      edx,eax
fffff805`621a1c54 89542454        mov     dword ptr [rsp+54h],edx
fffff805`621a1c58 eb0d            jmp     nt!PiProcessNewDeviceNode+0x9cfe7 (fffff805`621a1c67)  Branch

nt!PiProcessNewDeviceNode+0x9cfda:
fffff805`621a1c5a 418bc4          mov     eax,r12d
fffff805`621a1c5d eb08            jmp     nt!PiProcessNewDeviceNode+0x9cfe7 (fffff805`621a1c67)  Branch

nt!PiProcessNewDeviceNode+0x9cfdf:
fffff805`621a1c5f 8b542454        mov     edx,dword ptr [rsp+54h]
fffff805`621a1c63 8b442478        mov     eax,dword ptr [rsp+78h]

nt!PiProcessNewDeviceNode+0x9cfe7:
fffff805`621a1c67 a820            test    al,20h
fffff805`621a1c69 0f94c1          sete    cl
fffff805`621a1c6c 0fbae212        bt      edx,12h
fffff805`621a1c70 0f93c0          setae   al
fffff805`621a1c73 84c8            test    al,cl
fffff805`621a1c75 753f            jne     nt!PiProcessNewDeviceNode+0x9d036 (fffff805`621a1cb6)  Branch

nt!PiProcessNewDeviceNode+0x9cff7:
fffff805`621a1c77 b904000000      mov     ecx,4
fffff805`621a1c7c 4489742438      mov     dword ptr [rsp+38h],r14d
fffff805`621a1c81 894c2430        mov     dword ptr [rsp+30h],ecx
fffff805`621a1c85 488d442454      lea     rax,[rsp+54h]
fffff805`621a1c8a 0fbaf212        btr     edx,12h
fffff805`621a1c8e 4889442428      mov     qword ptr [rsp+28h],rax
fffff805`621a1c93 89542454        mov     dword ptr [rsp+54h],edx
fffff805`621a1c97 4c8bc3          mov     r8,rbx
fffff805`621a1c9a 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff805`621a1c9e 448d4907        lea     r9d,[rcx+7]
fffff805`621a1ca2 894c2420        mov     dword ptr [rsp+20h],ecx
fffff805`621a1ca6 488b0d4b80d5ff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff805`61ef9cf8)]
fffff805`621a1cad e8de1af6ff      call    nt!_CmSetDeviceRegProp (fffff805`62103790)
fffff805`621a1cb2 8b542454        mov     edx,dword ptr [rsp+54h]

nt!PiProcessNewDeviceNode+0x9d036:
fffff805`621a1cb6 f6c220          test    dl,20h
fffff805`621a1cb9 0f84bd37f6ff    je      nt!PiProcessNewDeviceNode+0x7fc (fffff805`6210547c)  Branch

nt!PiProcessNewDeviceNode+0x9d03f:
fffff805`621a1cbf 41bd01000000    mov     r13d,1
fffff805`621a1cc5 4533c0          xor     r8d,r8d
fffff805`621a1cc8 488bcf          mov     rcx,rdi
fffff805`621a1ccb 418d5511        lea     edx,[r13+11h]
fffff805`621a1ccf e8ece5f6ff      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621a1cd4 90              nop
fffff805`621a1cd5 e9a237f6ff      jmp     nt!PiProcessNewDeviceNode+0x7fc (fffff805`6210547c)  Branch

nt!PiProcessNewDeviceNode+0x9d05a:
fffff805`621a1cda 4533e4          xor     r12d,r12d
fffff805`621a1cdd e99537f6ff      jmp     nt!PiProcessNewDeviceNode+0x7f7 (fffff805`62105477)  Branch

nt!PiProcessNewDeviceNode+0x9d062:
fffff805`621a1ce2 448bc0          mov     r8d,eax
fffff805`621a1ce5 ba13000000      mov     edx,13h
fffff805`621a1cea 488bcf          mov     rcx,rdi
fffff805`621a1ced e8cee5f6ff      call    nt!PipSetDevNodeProblem (fffff805`621102c0)
fffff805`621a1cf2 90              nop
fffff805`621a1cf3 e94439f6ff      jmp     nt!PiProcessNewDeviceNode+0x9bc (fffff805`6210563c)  Branch

nt!PiProcessNewDeviceNode+0x9d078:
fffff805`621a1cf8 4c8bcf          mov     r9,rdi
fffff805`621a1cfb 488d157e29bfff  lea     rdx,[nt!KMPnPEvt_ProcessNewDevice_Stop (fffff805`61d94680)]
fffff805`621a1d02 4533c0          xor     r8d,r8d
fffff805`621a1d05 e8b64db0ff      call    nt!McTemplateK0p (fffff805`61ca6ac0)
fffff805`621a1d0a 90              nop
fffff805`621a1d0b e9253af6ff      jmp     nt!PiProcessNewDeviceNode+0xab5 (fffff805`62105735)  Branch

nt!PiProcessNewDeviceNode+0x9d090:
fffff805`621a1d10 8bd3            mov     edx,ebx
fffff805`621a1d12 488bcf          mov     rcx,rdi
fffff805`621a1d15 e82e610b00      call    nt!PnpTraceDockDeviceEnumeration (fffff805`62257e48)
fffff805`621a1d1a 90              nop
fffff805`621a1d1b e9223af6ff      jmp     nt!PiProcessNewDeviceNode+0xac2 (fffff805`62105742)  Branch
