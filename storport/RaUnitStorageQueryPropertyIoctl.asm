1: kd> uf storport!RaUnitStorageQueryPropertyIoctl
storport!RaUnitStorageQueryPropertyIoctl:
fffff807`3da773a4 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff807`3da773a9 57              push    rdi
fffff807`3da773aa 4883ec50        sub     rsp,50h
fffff807`3da773ae 488b05db6effff  mov     rax,qword ptr [storport!_security_cookie (fffff807`3da6e290)]
fffff807`3da773b5 4833c4          xor     rax,rsp
fffff807`3da773b8 4889442440      mov     qword ptr [rsp+40h],rax
fffff807`3da773bd 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff807`3da773c4 488bf9          mov     rdi,rcx
fffff807`3da773c7 488b4a18        mov     rcx,qword ptr [rdx+18h]
fffff807`3da773cb 488bda          mov     rbx,rdx
fffff807`3da773ce 83780808        cmp     dword ptr [rax+8],8
fffff807`3da773d2 0f8296730000    jb      storport!RaUnitStorageQueryPropertyIoctl+0x73ca (fffff807`3da7e76e)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x34:
fffff807`3da773d8 8b01            mov     eax,dword ptr [rcx]
fffff807`3da773da 85c0            test    eax,eax
fffff807`3da773dc 7520            jne     storport!RaUnitStorageQueryPropertyIoctl+0x5a (fffff807`3da773fe)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x3a:
fffff807`3da773de 488bcf          mov     rcx,rdi
fffff807`3da773e1 e8da000000      call    storport!RaUnitStorageQueryDevicePropertyIoctl (fffff807`3da774c0)

storport!RaUnitStorageQueryPropertyIoctl+0x42:
fffff807`3da773e6 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff807`3da773eb 4833cc          xor     rcx,rsp
fffff807`3da773ee e8fdbbfbff      call    storport!_security_check_cookie (fffff807`3da32ff0)
fffff807`3da773f3 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff807`3da773f8 4883c450        add     rsp,50h
fffff807`3da773fc 5f              pop     rdi
fffff807`3da773fd c3              ret

storport!RaUnitStorageQueryPropertyIoctl+0x5a:
fffff807`3da773fe 83f802          cmp     eax,2
fffff807`3da77401 0f848a000000    je      storport!RaUnitStorageQueryPropertyIoctl+0xed (fffff807`3da77491)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x63:
fffff807`3da77407 83f80c          cmp     eax,0Ch
fffff807`3da7740a 0f849b000000    je      storport!RaUnitStorageQueryPropertyIoctl+0x107 (fffff807`3da774ab)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x6c:
fffff807`3da77410 83f830          cmp     eax,30h
fffff807`3da77413 0f8485000000    je      storport!RaUnitStorageQueryPropertyIoctl+0xfa (fffff807`3da7749e)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x75:
fffff807`3da77419 83f832          cmp     eax,32h
fffff807`3da7741c 0f84a4730000    je      storport!RaUnitStorageQueryPropertyIoctl+0x7422 (fffff807`3da7e7c6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x7e:
fffff807`3da77422 83f834          cmp     eax,34h
fffff807`3da77425 0f848d730000    je      storport!RaUnitStorageQueryPropertyIoctl+0x7414 (fffff807`3da7e7b8)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x87:
fffff807`3da7742b 83f836          cmp     eax,36h
fffff807`3da7742e 0f8476730000    je      storport!RaUnitStorageQueryPropertyIoctl+0x7406 (fffff807`3da7e7aa)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x90:
fffff807`3da77434 803d2574ffff00  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff807`3da6e860)],0
fffff807`3da7743b 742d            je      storport!RaUnitStorageQueryPropertyIoctl+0xc6 (fffff807`3da7746a)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x99:
fffff807`3da7743d 33c0            xor     eax,eax
fffff807`3da7743f 488d542430      lea     rdx,[rsp+30h]
fffff807`3da77444 488bcb          mov     rcx,rbx
fffff807`3da77447 4889442430      mov     qword ptr [rsp+30h],rax
fffff807`3da7744c 4889442438      mov     qword ptr [rsp+38h],rax
fffff807`3da77451 48ff15f8ccffff  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff807`3da74150)]
fffff807`3da77458 0f1f440000      nop     dword ptr [rax+rax]
fffff807`3da7745d f6055e73ffff08  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff807`3da6e7c2)],8
fffff807`3da77464 0f851f730000    jne     storport!RaUnitStorageQueryPropertyIoctl+0x73e5 (fffff807`3da7e789)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0xc6:
fffff807`3da7746a fe4343          inc     byte ptr [rbx+43h]
fffff807`3da7746d 488bd3          mov     rdx,rbx
fffff807`3da77470 488383b800000048 add     qword ptr [rbx+0B8h],48h
fffff807`3da77478 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff807`3da7747c 488b4908        mov     rcx,qword ptr [rcx+8]
fffff807`3da77480 48ff1591cdffff  call    qword ptr [storport!_imp_IofCallDriver (fffff807`3da74218)]
fffff807`3da77487 0f1f440000      nop     dword ptr [rax+rax]
fffff807`3da7748c e955ffffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0xed:
fffff807`3da77491 488bcf          mov     rcx,rdi
fffff807`3da77494 e833490000      call    storport!RaUnitStorageQueryDeviceIdPropertyIoctl (fffff807`3da7bdcc)
fffff807`3da77499 e948ffffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0xfa:
fffff807`3da7749e 488bcf          mov     rcx,rdi
fffff807`3da774a1 e8de610000      call    storport!RaUnitStorageQueryDeviceIoCapabilityPropertyIoctl (fffff807`3da7d684)
fffff807`3da774a6 e93bffffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x107:
fffff807`3da774ab 488bcf          mov     rcx,rdi
fffff807`3da774ae e81d5e0000      call    storport!RaUnitStorageQueryDevicePowerPropertyIoctl (fffff807`3da7d2d0)
fffff807`3da774b3 e92effffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x73ca:
fffff807`3da7e76e 4883623800      and     qword ptr [rdx+38h],0
fffff807`3da7e773 41b8ef0000c0    mov     r8d,0C00000EFh
fffff807`3da7e779 33d2            xor     edx,edx
fffff807`3da7e77b 488bcb          mov     rcx,rbx
fffff807`3da7e77e e82daef9ff      call    storport!RaidCompleteRequestEx (fffff807`3da195b0)
fffff807`3da7e783 90              nop
fffff807`3da7e784 e95d8cffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x73e5:
fffff807`3da7e789 8b4330          mov     eax,dword ptr [rbx+30h]
fffff807`3da7e78c 4c8d442430      lea     r8,[rsp+30h]
fffff807`3da7e791 4c8bcb          mov     r9,rbx
fffff807`3da7e794 89442420        mov     dword ptr [rsp+20h],eax
fffff807`3da7e798 488d15c988feff  lea     rdx,[storport!EventNonReadWriteRequestComplete (fffff807`3da67068)]
fffff807`3da7e79f e84c3bfcff      call    storport!McTemplateK0pd (fffff807`3da422f0)
fffff807`3da7e7a4 90              nop
fffff807`3da7e7a5 e9c08cffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0xc6 (fffff807`3da7746a)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x7406:
fffff807`3da7e7aa 488bcf          mov     rcx,rdi
fffff807`3da7e7ad e8a666fdff      call    storport!RaUnitStorageQueryDevicePhysicalTopologyPropertyIoctl (fffff807`3da54e58)
fffff807`3da7e7b2 90              nop
fffff807`3da7e7b3 e92e8cffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x7414:
fffff807`3da7e7b8 488bcf          mov     rcx,rdi
fffff807`3da7e7bb e8b069fdff      call    storport!RaUnitStorageQueryDeviceTemperaturePropertyIoctl (fffff807`3da55170)
fffff807`3da7e7c0 90              nop
fffff807`3da7e7c1 e9208cffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch

storport!RaUnitStorageQueryPropertyIoctl+0x7422:
fffff807`3da7e7c6 488bcf          mov     rcx,rdi
fffff807`3da7e7c9 e8da67fdff      call    storport!RaUnitStorageQueryDeviceProtocolSpecificPropertyIoctl (fffff807`3da54fa8)
fffff807`3da7e7ce 90              nop
fffff807`3da7e7cf e9128cffff      jmp     storport!RaUnitStorageQueryPropertyIoctl+0x42 (fffff807`3da773e6)  Branch
