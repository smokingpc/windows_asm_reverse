24: kd> uf storport!RaGetBusInterface
storport!RaGetBusInterface:
fffff80f`2d2dd684 4883ec58        sub     rsp,58h
fffff80f`2d2dd688 488b05013c0400  mov     rax,qword ptr [storport!_security_cookie (fffff80f`2d321290)]
fffff80f`2d2dd68f 4833c4          xor     rax,rsp
fffff80f`2d2dd692 4889442448      mov     qword ptr [rsp+48h],rax
fffff80f`2d2dd697 ba0c000000      mov     edx,0Ch                       ;DevicePropertyBusTypeGuid
fffff80f`2d2dd69c 488d442430      lea     rax,[rsp+30h]
fffff80f`2d2dd6a1 4c8d4c2438      lea     r9,[rsp+38h]
fffff80f`2d2dd6a6 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d2dd6ab 448d4204        lea     r8d,[rdx+4]
fffff80f`2d2dd6af 48ff15429b0400  call    qword ptr [storport!_imp_IoGetDeviceProperty (fffff80f`2d3271f8)]
fffff80f`2d2dd6b6 0f1f440000      nop     dword ptr [rax+rax]   ;取回  GUID_DEVCLASS_xxx 
fffff80f`2d2dd6bb 85c0            test    eax,eax
fffff80f`2d2dd6bd 0f88a7000000    js      storport!RaGetBusInterface+0xe6 (fffff80f`2d2dd76a)  Branch

storport!RaGetBusInterface+0x3f:
fffff80f`2d2dd6c3 488b442438      mov     rax,qword ptr [rsp+38h]
fffff80f`2d2dd6c8 488b542440      mov     rdx,qword ptr [rsp+40h]       ;?
fffff80f`2d2dd6cd 488bc8          mov     rcx,rax   ;這邊用tricky的方法比較：把guid前8bytes當作 ULONGLONG直接相減，等於0就是相同
fffff80f`2d2dd6d0 482b0df9790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_PCMCIA (fffff80f`2d3150d0)]
fffff80f`2d2dd6d7 750a            jne     storport!RaGetBusInterface+0x5f (fffff80f`2d2dd6e3)  Branch

storport!RaGetBusInterface+0x55:
fffff80f`2d2dd6d9 488bca          mov     rcx,rdx   ;繼續比後8bytes
fffff80f`2d2dd6dc 482b0df5790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_PCMCIA+0x8 (fffff80f`2d3150d8)]

storport!RaGetBusInterface+0x5f:
fffff80f`2d2dd6e3 4885c9          test    rcx,rcx
fffff80f`2d2dd6e6 0f8491000000    je      storport!RaGetBusInterface+0xf9 (fffff80f`2d2dd77d)  Branch

storport!RaGetBusInterface+0x68:
fffff80f`2d2dd6ec 488bc8          mov     rcx,rax
fffff80f`2d2dd6ef 482b0dca790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_PCI (fffff80f`2d3150c0)]
fffff80f`2d2dd6f6 750a            jne     storport!RaGetBusInterface+0x7e (fffff80f`2d2dd702)  Branch

storport!RaGetBusInterface+0x74:
fffff80f`2d2dd6f8 488bca          mov     rcx,rdx
fffff80f`2d2dd6fb 482b0dc6790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_PCI+0x8 (fffff80f`2d3150c8)]

storport!RaGetBusInterface+0x7e:
fffff80f`2d2dd702 4885c9          test    rcx,rcx
fffff80f`2d2dd705 7515            jne     storport!RaGetBusInterface+0x98 (fffff80f`2d2dd71c)  Branch

storport!RaGetBusInterface+0x83:
fffff80f`2d2dd707 8d4105          lea     eax,[rcx+5]

storport!RaGetBusInterface+0x86:
fffff80f`2d2dd70a 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff80f`2d2dd70f 4833cc          xor     rcx,rsp
fffff80f`2d2dd712 e849860000      call    storport!_security_check_cookie (fffff80f`2d2e5d60)
fffff80f`2d2dd717 4883c458        add     rsp,58h
fffff80f`2d2dd71b c3              ret

storport!RaGetBusInterface+0x98:
fffff80f`2d2dd71c 488bc8          mov     rcx,rax
fffff80f`2d2dd71f 482b0dda790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_ISAPNP (fffff80f`2d315100)]
fffff80f`2d2dd726 750a            jne     storport!RaGetBusInterface+0xae (fffff80f`2d2dd732)  Branch

storport!RaGetBusInterface+0xa4:
fffff80f`2d2dd728 488bca          mov     rcx,rdx
fffff80f`2d2dd72b 482b0dd6790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_ISAPNP+0x8 (fffff80f`2d315108)]

storport!RaGetBusInterface+0xae:
fffff80f`2d2dd732 4885c9          test    rcx,rcx
fffff80f`2d2dd735 7446            je      storport!RaGetBusInterface+0xf9 (fffff80f`2d2dd77d)  Branch

storport!RaGetBusInterface+0xb3:
fffff80f`2d2dd737 488bc8          mov     rcx,rax
fffff80f`2d2dd73a 482b0daf790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_EISA (fffff80f`2d3150f0)]
fffff80f`2d2dd741 750a            jne     storport!RaGetBusInterface+0xc9 (fffff80f`2d2dd74d)  Branch

storport!RaGetBusInterface+0xbf:
fffff80f`2d2dd743 488bca          mov     rcx,rdx
fffff80f`2d2dd746 482b0dab790300  sub     rcx,qword ptr [storport!GUID_BUS_TYPE_EISA+0x8 (fffff80f`2d3150f8)]

storport!RaGetBusInterface+0xc9:
fffff80f`2d2dd74d 4885c9          test    rcx,rcx
fffff80f`2d2dd750 741d            je      storport!RaGetBusInterface+0xeb (fffff80f`2d2dd76f)  Branch

storport!RaGetBusInterface+0xce:
fffff80f`2d2dd752 482b0587790300  sub     rax,qword ptr [storport!GUID_BUS_TYPE_ACPI (fffff80f`2d3150e0)]
fffff80f`2d2dd759 750a            jne     storport!RaGetBusInterface+0xe1 (fffff80f`2d2dd765)  Branch

storport!RaGetBusInterface+0xd7:
fffff80f`2d2dd75b 488bc2          mov     rax,rdx
fffff80f`2d2dd75e 482b0583790300  sub     rax,qword ptr [storport!GUID_BUS_TYPE_ACPI+0x8 (fffff80f`2d3150e8)]

storport!RaGetBusInterface+0xe1:
fffff80f`2d2dd765 4885c0          test    rax,rax
fffff80f`2d2dd768 740c            je      storport!RaGetBusInterface+0xf2 (fffff80f`2d2dd776)  Branch

storport!RaGetBusInterface+0xe6:
fffff80f`2d2dd76a 83c8ff          or      eax,0FFFFFFFFh
fffff80f`2d2dd76d eb9b            jmp     storport!RaGetBusInterface+0x86 (fffff80f`2d2dd70a)  Branch

storport!RaGetBusInterface+0xeb:
fffff80f`2d2dd76f b802000000      mov     eax,2
fffff80f`2d2dd774 eb94            jmp     storport!RaGetBusInterface+0x86 (fffff80f`2d2dd70a)  Branch

storport!RaGetBusInterface+0xf2:
fffff80f`2d2dd776 b811000000      mov     eax,11h
fffff80f`2d2dd77b eb8d            jmp     storport!RaGetBusInterface+0x86 (fffff80f`2d2dd70a)  Branch

storport!RaGetBusInterface+0xf9:
fffff80f`2d2dd77d b801000000      mov     eax,1
fffff80f`2d2dd782 eb86            jmp     storport!RaGetBusInterface+0x86 (fffff80f`2d2dd70a)  Branch
