storport!StorPortGetDeviceBase:
fffff807`3295f8e0 4c8bdc          mov     r11,rsp
fffff807`3295f8e3 49895b10        mov     qword ptr [r11+10h],rbx
fffff807`3295f8e7 49896b18        mov     qword ptr [r11+18h],rbp
fffff807`3295f8eb 56              push    rsi
fffff807`3295f8ec 57              push    rdi
fffff807`3295f8ed 4156            push    r14
fffff807`3295f8ef 4883ec40        sub     rsp,40h
fffff807`3295f8f3 488b41f0        mov     rax,qword ptr [rcx-10h]
fffff807`3295f8f7 498bd9          mov     rbx,r9
fffff807`3295f8fa 8bb42480000000  mov     esi,dword ptr [rsp+80h]
fffff807`3295f901 458bf0          mov     r14d,r8d
fffff807`3295f904 488b28          mov     rbp,qword ptr [rax]
fffff807`3295f907 498d4308        lea     rax,[r11+8]
fffff807`3295f90b 498943d8        mov     qword ptr [r11-28h],rax
fffff807`3295f90f 89742420        mov     dword ptr [rsp+20h],esi
fffff807`3295f913 488d8d28010000  lea     rcx,[rbp+128h]
fffff807`3295f91a e81d010000      call    storport!RaidTranslateResourceListAddress (fffff807`3295fa3c)
fffff807`3295f91f 85c0            test    eax,eax
fffff807`3295f921 0f884f1c0100    js      storport!StorPortGetDeviceBase+0x11c96 (fffff807`32971576)  Branch

storport!StorPortGetDeviceBase+0x47:
fffff807`3295f927 80bc248800000000 cmp     byte ptr [rsp+88h],0
fffff807`3295f92f 7562            jne     storport!StorPortGetDeviceBase+0xb3 (fffff807`3295f993)  Branch

storport!StorPortGetDeviceBase+0x51:
fffff807`3295f931 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff807`3295f936 8bd6            mov     edx,esi
fffff807`3295f938 41b804020000    mov     r8d,204h
fffff807`3295f93e 48ff15ab7b0400  call    qword ptr [storport!_imp_MmMapIoSpaceEx (fffff807`329a74f0)]
fffff807`3295f945 0f1f440000      nop     dword ptr [rax+rax]
fffff807`3295f94a 488bf8          mov     rdi,rax
fffff807`3295f94d 4885c0          test    rax,rax
fffff807`3295f950 7427            je      storport!StorPortGetDeviceBase+0x99 (fffff807`3295f979)  Branch

storport!StorPortGetDeviceBase+0x72:
fffff807`3295f952 488b5508        mov     rdx,qword ptr [rbp+8]
fffff807`3295f956 488d8d10030000  lea     rcx,[rbp+310h]
fffff807`3295f95d 4889542428      mov     qword ptr [rsp+28h],rdx
fffff807`3295f962 448bce          mov     r9d,esi
fffff807`3295f965 488bd3          mov     rdx,rbx
fffff807`3295f968 4489742420      mov     dword ptr [rsp+20h],r14d
fffff807`3295f96d 4c8bc0          mov     r8,rax
fffff807`3295f970 e82b000000      call    storport!RaidAllocateAddressMapping (fffff807`3295f9a0)
fffff807`3295f975 85c0            test    eax,eax
fffff807`3295f977 7816            js      storport!StorPortGetDeviceBase+0xaf (fffff807`3295f98f)  Branch

storport!StorPortGetDeviceBase+0x99:
fffff807`3295f979 488bc7          mov     rax,rdi

storport!StorPortGetDeviceBase+0x9c:
fffff807`3295f97c 488b5c2468      mov     rbx,qword ptr [rsp+68h]
fffff807`3295f981 488b6c2470      mov     rbp,qword ptr [rsp+70h]
fffff807`3295f986 4883c440        add     rsp,40h
fffff807`3295f98a 415e            pop     r14
fffff807`3295f98c 5f              pop     rdi
fffff807`3295f98d 5e              pop     rsi
fffff807`3295f98e c3              ret

storport!StorPortGetDeviceBase+0xaf:
fffff807`3295f98f 33c0            xor     eax,eax
fffff807`3295f991 ebe9            jmp     storport!StorPortGetDeviceBase+0x9c (fffff807`3295f97c)  Branch

storport!StorPortGetDeviceBase+0xb3:
fffff807`3295f993 488b7c2460      mov     rdi,qword ptr [rsp+60h]
fffff807`3295f998 ebdf            jmp     storport!StorPortGetDeviceBase+0x99 (fffff807`3295f979)  Branch

storport!StorPortGetDeviceBase+0x11c96:
fffff807`32971576 488b0d83fa0200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff807`329a1000)]
fffff807`3297157d 488d057cfa0200  lea     rax,[storport!WPP_GLOBAL_Control (fffff807`329a1000)]
fffff807`32971584 483bc8          cmp     rcx,rax
fffff807`32971587 0f8402e4feff    je      storport!StorPortGetDeviceBase+0xaf (fffff807`3295f98f)  Branch

storport!StorPortGetDeviceBase+0x11cad:
fffff807`3297158d 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff807`32971590 a808            test    al,8
fffff807`32971592 0f84f7e3feff    je      storport!StorPortGetDeviceBase+0xaf (fffff807`3295f98f)  Branch

storport!StorPortGetDeviceBase+0x11cb8:
fffff807`32971598 80792902        cmp     byte ptr [rcx+29h],2
fffff807`3297159c 0f82ede3feff    jb      storport!StorPortGetDeviceBase+0xaf (fffff807`3295f98f)  Branch

storport!StorPortGetDeviceBase+0x11cc2:
fffff807`329715a2 80bc248800000000 cmp     byte ptr [rsp+88h],0
fffff807`329715aa 488d1583910200  lea     rdx,[storport!`string` (fffff807`3299a734)]
fffff807`329715b1 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`329715b5 488d0574910200  lea     rax,[storport!`string` (fffff807`3299a730)]
fffff807`329715bc 480f44c2        cmove   rax,rdx
fffff807`329715c0 4c8bcb          mov     r9,rbx
fffff807`329715c3 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`329715c8 e827000100      call    storport!WPP_SF_is (fffff807`329815f4)
fffff807`329715cd 90              nop
fffff807`329715ce e9bce3feff      jmp     storport!StorPortGetDeviceBase+0xaf (fffff807`3295f98f)  Branch
