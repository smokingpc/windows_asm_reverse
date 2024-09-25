0: kd> uf storport!RaAdapterProtocolCommandIoctl
storport!RaAdapterProtocolCommandIoctl:
fffff80a`52386e3c 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff80a`52386e41 57              push    rdi
fffff80a`52386e42 4883ec20        sub     rsp,20h
fffff80a`52386e46 4883b92002000000 cmp     qword ptr [rcx+220h],0
fffff80a`52386e4e 488bda          mov     rbx,rdx   ;IRP
fffff80a`52386e51 488bf9          mov     rdi,rcx   ;AdapterExt
fffff80a`52386e54 c644243000      mov     byte ptr [rsp+30h],0
fffff80a`52386e59 c644243800      mov     byte ptr [rsp+38h],0
fffff80a`52386e5e 743f            je      storport!RaAdapterProtocolCommandIoctl+0x63 (fffff80a`52386e9f)  Branch

storport!RaAdapterProtocolCommandIoctl+0x24:
fffff80a`52386e60 4883b92802000000 cmp     qword ptr [rcx+228h],0
fffff80a`52386e68 7435            je      storport!RaAdapterProtocolCommandIoctl+0x63 (fffff80a`52386e9f)  Branch

storport!RaAdapterProtocolCommandIoctl+0x2e:
fffff80a`52386e6a e865ed0000      call    storport!RaValidateProtocolCommandIoctl (fffff80a`52395bd4)
fffff80a`52386e6f 85c0            test    eax,eax
fffff80a`52386e71 7835            js      storport!RaAdapterProtocolCommandIoctl+0x6c (fffff80a`52386ea8)  Branch

storport!RaAdapterProtocolCommandIoctl+0x37:
fffff80a`52386e73 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80a`52386e77 4c8d4c2438      lea     r9,[rsp+38h]
fffff80a`52386e7c 4c8d442430      lea     r8,[rsp+30h]
fffff80a`52386e81 488bd3          mov     rdx,rbx
fffff80a`52386e84 e867010000      call    storport!RaGetProtocolCommandEffects (fffff80a`52386ff0)
fffff80a`52386e89 85c0            test    eax,eax
fffff80a`52386e8b 781b            js      storport!RaAdapterProtocolCommandIoctl+0x6c (fffff80a`52386ea8)  Branch

storport!RaAdapterProtocolCommandIoctl+0x51:
fffff80a`52386e8d 448a442430      mov     r8b,byte ptr [rsp+30h]
fffff80a`52386e92 488bd3          mov     rdx,rbx
fffff80a`52386e95 488bcf          mov     rcx,rdi
fffff80a`52386e98 e837300000      call    storport!RaidAdapterSendSrbProtocolCommandSynchronously (fffff80a`52389ed4)
fffff80a`52386e9d eb05            jmp     storport!RaAdapterProtocolCommandIoctl+0x68 (fffff80a`52386ea4)  Branch

storport!RaAdapterProtocolCommandIoctl+0x63:
fffff80a`52386e9f b8010000c0      mov     eax,0C0000001h

storport!RaAdapterProtocolCommandIoctl+0x68:
fffff80a`52386ea4 85c0            test    eax,eax
fffff80a`52386ea6 7905            jns     storport!RaAdapterProtocolCommandIoctl+0x71 (fffff80a`52386ead)  Branch

storport!RaAdapterProtocolCommandIoctl+0x6c:
fffff80a`52386ea8 4883633800      and     qword ptr [rbx+38h],0

storport!RaAdapterProtocolCommandIoctl+0x71:
fffff80a`52386ead 448bc0          mov     r8d,eax
fffff80a`52386eb0 33d2            xor     edx,edx
fffff80a`52386eb2 488bcb          mov     rcx,rbx
fffff80a`52386eb5 e80660fdff      call    storport!RaidCompleteRequestEx (fffff80a`5235cec0)
fffff80a`52386eba 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff80a`52386ebf 4883c420        add     rsp,20h
fffff80a`52386ec3 5f              pop     rdi
fffff80a`52386ec4 c3              ret
