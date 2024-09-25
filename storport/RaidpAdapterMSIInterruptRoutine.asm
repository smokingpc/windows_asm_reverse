0: kd> uf storport!RaidpAdapterMSIInterruptRoutine
storport!RaidpAdapterMSIInterruptRoutine:
fffff806`474ffc20 48895c2408      mov     qword ptr [rsp+8],rbx
fffff806`474ffc25 4889742418      mov     qword ptr [rsp+18h],rsi
fffff806`474ffc2a 57              push    rdi
fffff806`474ffc2b 4883ec50        sub     rsp,50h
fffff806`474ffc2f 33db            xor     ebx,ebx
fffff806`474ffc31 418bf0          mov     esi,r8d                   ;MsgID
fffff806`474ffc34 488bfa          mov     rdi,rdx
fffff806`474ffc37 48895c2478      mov     qword ptr [rsp+78h],rbx
fffff806`474ffc3c 385a6b          cmp     byte ptr [rdx+6Bh],bl
fffff806`474ffc3f 7465            je      storport!RaidpAdapterMSIInterruptRoutine+0x86 (fffff806`474ffca6)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21:
fffff806`474ffc41 83ba1c01000001  cmp     dword ptr [rdx+11Ch],1    ;if AdapterExt->Power->DeviceState > 1(D0), return FALSE
fffff806`474ffc48 7f5c            jg      storport!RaidpAdapterMSIInterruptRoutine+0x86 (fffff806`474ffca6)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x2a:
fffff806`474ffc4a 381d401c0500    cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff806`47551890)],bl
fffff806`474ffc50 740d            je      storport!RaidpAdapterMSIInterruptRoutine+0x3f (fffff806`474ffc5f)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x32:
fffff806`474ffc52 f6058a1b050008  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff806`475517e3)],8
fffff806`474ffc59 0f85a51a0200    jne     storport!RaidpAdapterMSIInterruptRoutine+0x21ae4 (fffff806`47521704)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x3f:
fffff806`474ffc5f 488b8f28020000  mov     rcx,qword ptr [rdi+228h]          ;mov AdapterExt->Miniport->PrivateDeviceExt->HwDeviceExtension to rcx
fffff806`474ffc66 8bd6            mov     edx,esi                           ;MsgID
fffff806`474ffc68 488b87d8010000  mov     rax,qword ptr [rdi+1D8h]          ;mov HwMSInterruptRoutine ptr to rax
fffff806`474ffc6f 4883c110        add     rcx,10h
fffff806`474ffc73 ff15a77b0500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff806`47557820)] ;call rax to miniport's ISR
fffff806`474ffc79 803d101c050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff806`47551890)],0
fffff806`474ffc80 0fb6f0          movzx   esi,al
fffff806`474ffc83 740d            je      storport!RaidpAdapterMSIInterruptRoutine+0x72 (fffff806`474ffc92)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x65:
fffff806`474ffc85 f605571b050008  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff806`475517e3)],8
fffff806`474ffc8c 0f85a31a0200    jne     storport!RaidpAdapterMSIInterruptRoutine+0x21b15 (fffff806`47521735)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x72:
fffff806`474ffc92 400fb6c6        movzx   eax,sil

storport!RaidpAdapterMSIInterruptRoutine+0x76:
fffff806`474ffc96 488b5c2460      mov     rbx,qword ptr [rsp+60h]
fffff806`474ffc9b 488b742470      mov     rsi,qword ptr [rsp+70h]
fffff806`474ffca0 4883c450        add     rsp,50h
fffff806`474ffca4 5f              pop     rdi
fffff806`474ffca5 c3              ret

storport!RaidpAdapterMSIInterruptRoutine+0x86:
fffff806`474ffca6 32c0            xor     al,al
fffff806`474ffca8 ebec            jmp     storport!RaidpAdapterMSIInterruptRoutine+0x76 (fffff806`474ffc96)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21ae4:
fffff806`47521704 381d66010300    cmp     byte ptr [storport!UseQPCTime (fffff806`47551870)],bl
fffff806`4752170a 7410            je      storport!RaidpAdapterMSIInterruptRoutine+0x21afc (fffff806`4752171c)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21aec:
fffff806`4752170c 33c9            xor     ecx,ecx
fffff806`4752170e 48ff15eb580300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff806`47557000)]
fffff806`47521715 0f1f440000      nop     dword ptr [rax+rax]
fffff806`4752171a eb0c            jmp     storport!RaidpAdapterMSIInterruptRoutine+0x21b08 (fffff806`47521728)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21afc:
fffff806`4752171c 48ff1585590300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff806`475570a8)]
fffff806`47521723 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidpAdapterMSIInterruptRoutine+0x21b08:
fffff806`47521728 488bd8          mov     rbx,rax
fffff806`4752172b 4889442478      mov     qword ptr [rsp+78h],rax
fffff806`47521730 e92ae5fdff      jmp     storport!RaidpAdapterMSIInterruptRoutine+0x3f (fffff806`474ffc5f)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b15:
fffff806`47521735 803d3401030000  cmp     byte ptr [storport!UseQPCTime (fffff806`47551870)],0
fffff806`4752173c 48c744246801000000 mov   qword ptr [rsp+68h],1
fffff806`47521745 7413            je      storport!RaidpAdapterMSIInterruptRoutine+0x21b3a (fffff806`4752175a)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b27:
fffff806`47521747 488d4c2468      lea     rcx,[rsp+68h]
fffff806`4752174c 48ff15ad580300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff806`47557000)]
fffff806`47521753 0f1f440000      nop     dword ptr [rax+rax]
fffff806`47521758 eb0c            jmp     storport!RaidpAdapterMSIInterruptRoutine+0x21b46 (fffff806`47521766)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b3a:
fffff806`4752175a 48ff1547590300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff806`475570a8)]
fffff806`47521761 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidpAdapterMSIInterruptRoutine+0x21b46:
fffff806`47521766 4885c0          test    rax,rax
fffff806`47521769 7e0d            jle     storport!RaidpAdapterMSIInterruptRoutine+0x21b58 (fffff806`47521778)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b4b:
fffff806`4752176b 483bc3          cmp     rax,rbx
fffff806`4752176e 7d08            jge     storport!RaidpAdapterMSIInterruptRoutine+0x21b58 (fffff806`47521778)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b50:
fffff806`47521770 482bc3          sub     rax,rbx
fffff806`47521773 48ffc8          dec     rax
fffff806`47521776 eb03            jmp     storport!RaidpAdapterMSIInterruptRoutine+0x21b5b (fffff806`4752177b)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b58:
fffff806`47521778 482bc3          sub     rax,rbx

storport!RaidpAdapterMSIInterruptRoutine+0x21b5b:
fffff806`4752177b 803dee00030000  cmp     byte ptr [storport!UseQPCTime (fffff806`47551870)],0
fffff806`47521782 4889442440      mov     qword ptr [rsp+40h],rax
fffff806`47521787 7448            je      storport!RaidpAdapterMSIInterruptRoutine+0x21bb1 (fffff806`475217d1)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b69:
fffff806`47521789 488b4c2468      mov     rcx,qword ptr [rsp+68h]
fffff806`4752178e 4533c0          xor     r8d,r8d
fffff806`47521791 4885c9          test    rcx,rcx
fffff806`47521794 743e            je      storport!RaidpAdapterMSIInterruptRoutine+0x21bb4 (fffff806`475217d4)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b76:
fffff806`47521796 4885c0          test    rax,rax
fffff806`47521799 7439            je      storport!RaidpAdapterMSIInterruptRoutine+0x21bb4 (fffff806`475217d4)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21b7b:
fffff806`4752179b 33d2            xor     edx,edx
fffff806`4752179d 48f7f1          div     rax,rcx
fffff806`475217a0 4c8bc0          mov     r8,rax
fffff806`475217a3 4869c2e8030000  imul    rax,rdx,3E8h
fffff806`475217aa 4d69c0e8030000  imul    r8,r8,3E8h
fffff806`475217b1 33d2            xor     edx,edx
fffff806`475217b3 48f7f1          div     rax,rcx
fffff806`475217b6 4c03c0          add     r8,rax
fffff806`475217b9 4869c210270000  imul    rax,rdx,2710h
fffff806`475217c0 4d69c010270000  imul    r8,r8,2710h
fffff806`475217c7 33d2            xor     edx,edx
fffff806`475217c9 48f7f1          div     rax,rcx
fffff806`475217cc 4c03c0          add     r8,rax
fffff806`475217cf eb03            jmp     storport!RaidpAdapterMSIInterruptRoutine+0x21bb4 (fffff806`475217d4)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21bb1:
fffff806`475217d1 4c8bc0          mov     r8,rax

storport!RaidpAdapterMSIInterruptRoutine+0x21bb4:
fffff806`475217d4 33c9            xor     ecx,ecx
fffff806`475217d6 4c89442478      mov     qword ptr [rsp+78h],r8
fffff806`475217db 48ff15ee5a0300  call    qword ptr [storport!_imp_KeGetCurrentProcessorNumberEx (fffff806`475572d0)]
fffff806`475217e2 0f1f440000      nop     dword ptr [rax+rax]
fffff806`475217e7 f605f5ff020008  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff806`475517e3)],8
fffff806`475217ee 0f849ee4fdff    je      storport!RaidpAdapterMSIInterruptRoutine+0x72 (fffff806`474ffc92)  Branch

storport!RaidpAdapterMSIInterruptRoutine+0x21bd4:
fffff806`475217f4 488b4c2478      mov     rcx,qword ptr [rsp+78h]
fffff806`475217f9 4c8d0d20e4fdff  lea     r9,[storport!RaidpAdapterMSIInterruptRoutine (fffff806`474ffc20)]
fffff806`47521800 48894c2430      mov     qword ptr [rsp+30h],rcx
fffff806`47521805 89442428        mov     dword ptr [rsp+28h],eax
fffff806`47521809 8b4738          mov     eax,dword ptr [rdi+38h]
fffff806`4752180c 89442420        mov     dword ptr [rsp+20h],eax
fffff806`47521810 e8774d0000      call    storport!McTemplateK0pqqx (fffff806`4752658c)
fffff806`47521815 90              nop
fffff806`47521816 e977e4fdff      jmp     storport!RaidpAdapterMSIInterruptRoutine+0x72 (fffff806`474ffc92)  Branch
