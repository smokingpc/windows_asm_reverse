;從 RaUnitAsnycError()呼叫進來

0: kd> uf storport!RaidUnitHandleSpecialErrorConditions
storport!RaidUnitHandleSpecialErrorConditions:
fffff803`10deb72c 488bc4          mov     rax,rsp
fffff803`10deb72f 48895808        mov     qword ptr [rax+8],rbx
fffff803`10deb733 55              push    rbp
fffff803`10deb734 56              push    rsi
fffff803`10deb735 57              push    rdi
fffff803`10deb736 4156            push    r14
fffff803`10deb738 4157            push    r15
fffff803`10deb73a 4883ec40        sub     rsp,40h
fffff803`10deb73e 488b9aa8000000  mov     rbx,qword ptr [rdx+0A8h] ;PortContext+0xA8 這啥？ =>  SRB原始addr!!
fffff803`10deb745 4533c0          xor     r8d,r8d
fffff803`10deb748 4532c9          xor     r9b,r9b
fffff803`10deb74b 4c894018        mov     qword ptr [rax+18h],r8
fffff803`10deb74f 4032f6          xor     sil,sil
fffff803`10deb752 44884810        mov     byte ptr [rax+10h],r9b
fffff803`10deb756 4032ed          xor     bpl,bpl
fffff803`10deb759 4032ff          xor     dil,dil
fffff803`10deb75c 807b0228        cmp     byte ptr [rbx+2],28h
fffff803`10deb760 4c8bf2          mov     r14,rdx       ;PortContext of (SRB to complete)
fffff803`10deb763 4c8bf9          mov     r15,rcx       ;UnitExtension of VD
fffff803`10deb766 741f            je      storport!RaidUnitHandleSpecialErrorConditions+0x5b (fffff803`10deb787)  Branch;if SRB is _STORAGE_REQUEST_BLOCK , goto 0x5b

storport!RaidUnitHandleSpecialErrorConditions+0x3c: ;if SRB is _SCSI_REQUEST_BLOCK , =>
fffff803`10deb768 4c8b4320        mov     r8,qword ptr [rbx+20h]    ;SenseInfoBuffer ptr
fffff803`10deb76c 448a4b0b        mov     r9b,byte ptr [rbx+0Bh]    ;SenseInfoBufferLength

storport!RaidUnitHandleSpecialErrorConditions+0x44:
fffff803`10deb770 807b0300        cmp     byte ptr [rbx+3],0    ;if SRB_STATUS != SUCCESS, goto 0x94 (這段是 _SCSI_REQUEST_BLOCK 用)
fffff803`10deb774 7c4a            jl      storport!RaidUnitHandleSpecialErrorConditions+0x94 (fffff803`10deb7c0)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x4a:
fffff803`10deb776 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff803`10deb77b 4883c440        add     rsp,40h
fffff803`10deb77f 415f            pop     r15
fffff803`10deb781 415e            pop     r14
fffff803`10deb783 5f              pop     rdi
fffff803`10deb784 5e              pop     rsi
fffff803`10deb785 5d              pop     rbp
fffff803`10deb786 c3              ret

storport!RaidUnitHandleSpecialErrorConditions+0x5b:
fffff803`10deb787 44394314        cmp     dword ptr [rbx+14h],r8d
fffff803`10deb78b 75e3            jne     storport!RaidUnitHandleSpecialErrorConditions+0x44 (fffff803`10deb770)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x61:
fffff803`10deb78d 488d442478      lea     rax,[rsp+78h]
fffff803`10deb792 4533c9          xor     r9d,r9d
fffff803`10deb795 4889442428      mov     qword ptr [rsp+28h],rax
fffff803`10deb79a 33d2            xor     edx,edx
fffff803`10deb79c 488d842480000000 lea     rax,[rsp+80h]
fffff803`10deb7a4 488bcb          mov     rcx,rbx
fffff803`10deb7a7 4889442420      mov     qword ptr [rsp+20h],rax
fffff803`10deb7ac e8275c0100      call    storport!GetSrbScsiData (fffff803`10e013d8)
fffff803`10deb7b1 4c8b842480000000 mov     r8,qword ptr [rsp+80h]   ;SenseInfoBuffer ptr
fffff803`10deb7b9 448a4c2478      mov     r9b,byte ptr [rsp+78h]    ;SenseInfoBufferLength
fffff803`10deb7be ebb0            jmp     storport!RaidUnitHandleSpecialErrorConditions+0x44 (fffff803`10deb770)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x94:
fffff803`10deb7c0 4d85c0          test    r8,r8     ;if NULL==SenseInfoBuffer, return
fffff803`10deb7c3 74b1            je      storport!RaidUnitHandleSpecialErrorConditions+0x4a (fffff803`10deb776)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x99:
fffff803`10deb7c5 32d2            xor     dl,dl
fffff803`10deb7c7 4584c9          test    r9b,r9b   ;if 0 == SenseInfoBufferLength, return
fffff803`10deb7ca 745f            je      storport!RaidUnitHandleSpecialErrorConditions+0xff (fffff803`10deb82b)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0xa0:
fffff803`10deb7cc 418a00          mov     al,byte ptr [r8]      ;read SENSE_DATA->ErrorCode
fffff803`10deb7cf 247f            and     al,7Fh                ;
fffff803`10deb7d1 410fb6c9        movzx   ecx,r9b               ;SenseInfoBufferLength
fffff803`10deb7d5 2c72            sub     al,72h        ;if ErrorCode == 
fffff803`10deb7d7 4903c8          add     rcx,r8        ;取 SenseInfoBuffer+SenseInfoBufferLength 的ptr?
fffff803`10deb7da 3c01            cmp     al,1      ;如果 SENSE_DATA::ErrorCode > 0x73 => 直接return不必處理了，正常值就去0x146
fffff803`10deb7dc 498d4008        lea     rax,[r8+8]    ;rax = SENSE_DATA::CommandSpecificInformation 
fffff803`10deb7e0 0f868c000000    jbe     storport!RaidUnitHandleSpecialErrorConditions+0x146 (fffff803`10deb872)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0xba: 
fffff803`10deb7e6 483bc1          cmp     rax,rcx
fffff803`10deb7e9 7740            ja      storport!RaidUnitHandleSpecialErrorConditions+0xff (fffff803`10deb82b)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0xbf:
fffff803`10deb7eb 410fb64807      movzx   ecx,byte ptr [r8+7]   ;RCX = AdditionalSenseLength
fffff803`10deb7f0 498d500d        lea     rdx,[r8+0Dh]          ;RDX = AdditionalSenseCodeQualifier address
fffff803`10deb7f4 418a7002        mov     sil,byte ptr [r8+2]   ;sil = SenseKey
fffff803`10deb7f8 83c108          add     ecx,8
fffff803`10deb7fb 410fb6c1        movzx   eax,r9b
fffff803`10deb7ff 4080e60f        and     sil,0Fh
fffff803`10deb803 3bc8            cmp     ecx,eax
fffff803`10deb805 0f46c1          cmovbe  eax,ecx
fffff803`10deb808 8bc8            mov     ecx,eax
fffff803`10deb80a 4903c0          add     rax,r8
fffff803`10deb80d 483bd0          cmp     rdx,rax
fffff803`10deb810 0f87ee2a0200    ja      storport!RaidUnitHandleSpecialErrorConditions+0x22bd8 (fffff803`10e0e304)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0xea:
fffff803`10deb816 418a680c        mov     bpl,byte ptr [r8+0Ch]

storport!RaidUnitHandleSpecialErrorConditions+0xee:
fffff803`10deb81a 4903c8          add     rcx,r8
fffff803`10deb81d 498d400e        lea     rax,[r8+0Eh]
fffff803`10deb821 483bc1          cmp     rax,rcx
fffff803`10deb824 7763            ja      storport!RaidUnitHandleSpecialErrorConditions+0x15d (fffff803`10deb889)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0xfa:
fffff803`10deb826 408a3a          mov     dil,byte ptr [rdx]

storport!RaidUnitHandleSpecialErrorConditions+0xfd:
fffff803`10deb829 b201            mov     dl,1

storport!RaidUnitHandleSpecialErrorConditions+0xff:
fffff803`10deb82b 84d2            test    dl,dl
fffff803`10deb82d 0f8443ffffff    je      storport!RaidUnitHandleSpecialErrorConditions+0x4a (fffff803`10deb776)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x107:
fffff803`10deb833 488b0dc6570500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb83a 488d05bf570500  lea     rax,[storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb841 483bc8          cmp     rcx,rax
fffff803`10deb844 740b            je      storport!RaidUnitHandleSpecialErrorConditions+0x125 (fffff803`10deb851)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x11a:
fffff803`10deb846 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff803`10deb849 a808            test    al,8
fffff803`10deb84b 0f85bb2a0200    jne     storport!RaidUnitHandleSpecialErrorConditions+0x22be0 (fffff803`10e0e30c)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x125:
fffff803`10deb851 488d05e8870400  lea     rax,[storport!RaidEnumAtaInformation+0x10 (fffff803`10e34040)]

storport!RaidUnitHandleSpecialErrorConditions+0x12c:
fffff803`10deb858 403830          cmp     byte ptr [rax],sil
fffff803`10deb85b 0f84e52a0200    je      storport!RaidUnitHandleSpecialErrorConditions+0x22c1a (fffff803`10e0e346)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x135:
fffff803`10deb861 4883c010        add     rax,10h
fffff803`10deb865 4883780800      cmp     qword ptr [rax+8],0
fffff803`10deb86a 0f8406ffffff    je      storport!RaidUnitHandleSpecialErrorConditions+0x4a (fffff803`10deb776)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x144:
fffff803`10deb870 ebe6            jmp     storport!RaidUnitHandleSpecialErrorConditions+0x12c (fffff803`10deb858)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x146:
fffff803`10deb872 483bc1          cmp     rax,rcx
fffff803`10deb875 77b4            ja      storport!RaidUnitHandleSpecialErrorConditions+0xff (fffff803`10deb82b)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x14b:
fffff803`10deb877 418a7001        mov     sil,byte ptr [r8+1]
fffff803`10deb87b 418a6802        mov     bpl,byte ptr [r8+2]
fffff803`10deb87f 4080e60f        and     sil,0Fh
fffff803`10deb883 418a7803        mov     dil,byte ptr [r8+3]
fffff803`10deb887 eba0            jmp     storport!RaidUnitHandleSpecialErrorConditions+0xfd (fffff803`10deb829)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x15d:
fffff803`10deb889 4032ff          xor     dil,dil
fffff803`10deb88c eb9b            jmp     storport!RaidUnitHandleSpecialErrorConditions+0xfd (fffff803`10deb829)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x22bd8:
fffff803`10e0e304 4032ed          xor     bpl,bpl
fffff803`10e0e307 e90ed5fdff      jmp     storport!RaidUnitHandleSpecialErrorConditions+0xee (fffff803`10deb81a)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x22be0:
fffff803`10e0e30c 80792903        cmp     byte ptr [rcx+29h],3
fffff803`10e0e310 0f823bd5fdff    jb      storport!RaidUnitHandleSpecialErrorConditions+0x125 (fffff803`10deb851)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x22bea:
fffff803`10e0e316 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`10e0e31a 4d8bcf          mov     r9,r15
fffff803`10e0e31d 400fb6c7        movzx   eax,dil
fffff803`10e0e321 89442438        mov     dword ptr [rsp+38h],eax
fffff803`10e0e325 400fb6d5        movzx   edx,bpl
fffff803`10e0e329 89542430        mov     dword ptr [rsp+30h],edx
fffff803`10e0e32d 440fb6c6        movzx   r8d,sil
fffff803`10e0e331 4489442428      mov     dword ptr [rsp+28h],r8d
fffff803`10e0e336 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff803`10e0e33b e854d20100      call    storport!WPP_SF_qqDDD (fffff803`10e2b594)
fffff803`10e0e340 90              nop
fffff803`10e0e341 e90bd5fdff      jmp     storport!RaidUnitHandleSpecialErrorConditions+0x125 (fffff803`10deb851)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x22c1a:
fffff803`10e0e346 40386801        cmp     byte ptr [rax+1],bpl
fffff803`10e0e34a 0f8511d5fdff    jne     storport!RaidUnitHandleSpecialErrorConditions+0x135 (fffff803`10deb861)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x22c24:
fffff803`10e0e350 40387802        cmp     byte ptr [rax+2],dil
fffff803`10e0e354 0f8507d5fdff    jne     storport!RaidUnitHandleSpecialErrorConditions+0x135 (fffff803`10deb861)  Branch

storport!RaidUnitHandleSpecialErrorConditions+0x22c2e:
fffff803`10e0e35a 488b4008        mov     rax,qword ptr [rax+8]
fffff803`10e0e35e 498bd6          mov     rdx,r14
fffff803`10e0e361 498bcf          mov     rcx,r15
fffff803`10e0e364 ff15b6940300    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff803`10e47820)]
fffff803`10e0e36a 90              nop
fffff803`10e0e36b e906d4fdff      jmp     storport!RaidUnitHandleSpecialErrorConditions+0x4a (fffff803`10deb776)  Branch
