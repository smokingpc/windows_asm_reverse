3: kd> uf storport!StorpLogPerAdapterStatistics
storport!StorpLogPerAdapterStatistics:
fffff809`efc053b4 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff809`efc053b9 4889742418      mov     qword ptr [rsp+18h],rsi
fffff809`efc053be 55              push    rbp
fffff809`efc053bf 57              push    rdi
fffff809`efc053c0 4156            push    r14
fffff809`efc053c2 488dac2450ffffff lea     rbp,[rsp-0B0h]
fffff809`efc053ca 4881ecb0010000  sub     rsp,1B0h
fffff809`efc053d1 488b05b88e0500  mov     rax,qword ptr [storport!_security_cookie (fffff809`efc5e290)]
fffff809`efc053d8 4833c4          xor     rax,rsp
fffff809`efc053db 488985a0000000  mov     qword ptr [rbp+0A0h],rax
fffff809`efc053e2 488bd9          mov     rbx,rcx
fffff809`efc053e5 33ff            xor     edi,edi
fffff809`efc053e7 8b895c140000    mov     ecx,dword ptr [rcx+145Ch] ;AdapterExt->TelemetryHierarchicalResetLunBucket[0]
fffff809`efc053ed 85c9            test    ecx,ecx
fffff809`efc053ef 0f8545590200    jne     storport!StorpLogPerAdapterStatistics+0x25986 (fffff809`efc2ad3a)  Branch

storport!StorpLogPerAdapterStatistics+0x41:
fffff809`efc053f5 39bb68140000    cmp     dword ptr [rbx+1468h],edi;AdapterExt->TelemetryHierarchicalResetLunBucket[1]
fffff809`efc053fb 0f8539590200    jne     storport!StorpLogPerAdapterStatistics+0x25986 (fffff809`efc2ad3a)  Branch

storport!StorpLogPerAdapterStatistics+0x4d:
fffff809`efc05401 39bb74140000    cmp     dword ptr [rbx+1474h],edi;AdapterExt->TelemetryHierarchicalResetLunBucket[2]
fffff809`efc05407 0f852d590200    jne     storport!StorpLogPerAdapterStatistics+0x25986 (fffff809`efc2ad3a)  Branch

storport!StorpLogPerAdapterStatistics+0x59:
fffff809`efc0540d 39bb80140000    cmp     dword ptr [rbx+1480h],edi;AdapterExt->TelemetryHierarchicalResetLunBucket[3]
fffff809`efc05413 0f8521590200    jne     storport!StorpLogPerAdapterStatistics+0x25986 (fffff809`efc2ad3a)  Branch

storport!StorpLogPerAdapterStatistics+0x65:
fffff809`efc05419 39bb8c140000    cmp     dword ptr [rbx+148Ch],edi;AdapterExt->TelemetryHierarchicalResetLunBucket[4]
fffff809`efc0541f 0f8515590200    jne     storport!StorpLogPerAdapterStatistics+0x25986 (fffff809`efc2ad3a)  Branch

storport!StorpLogPerAdapterStatistics+0x71:
fffff809`efc05425 8b8b98140000    mov     ecx,dword ptr [rbx+1498h];ApadterExt->TelemetryHierarchicalResetTargetBucket[0]
fffff809`efc0542b 85c9            test    ecx,ecx
fffff809`efc0542d 0f85155b0200    jne     storport!StorpLogPerAdapterStatistics+0x25b94 (fffff809`efc2af48)  Branch

storport!StorpLogPerAdapterStatistics+0x7f:
fffff809`efc05433 39bba4140000    cmp     dword ptr [rbx+14A4h],edi;ApadterExt->TelemetryHierarchicalResetTargetBucket[1]
fffff809`efc05439 0f85095b0200    jne     storport!StorpLogPerAdapterStatistics+0x25b94 (fffff809`efc2af48)  Branch

storport!StorpLogPerAdapterStatistics+0x8b:
fffff809`efc0543f 39bbb0140000    cmp     dword ptr [rbx+14B0h],edi;ApadterExt->TelemetryHierarchicalResetTargetBucket[2]
fffff809`efc05445 0f85fd5a0200    jne     storport!StorpLogPerAdapterStatistics+0x25b94 (fffff809`efc2af48)  Branch

storport!StorpLogPerAdapterStatistics+0x97:
fffff809`efc0544b 39bbbc140000    cmp     dword ptr [rbx+14BCh],edi;ApadterExt->TelemetryHierarchicalResetTargetBucket[3]
fffff809`efc05451 0f85f15a0200    jne     storport!StorpLogPerAdapterStatistics+0x25b94 (fffff809`efc2af48)  Branch

storport!StorpLogPerAdapterStatistics+0xa3:
fffff809`efc05457 39bbc8140000    cmp     dword ptr [rbx+14C8h],edi;ApadterExt->TelemetryHierarchicalResetTargetBucket[4]
fffff809`efc0545d 0f85e55a0200    jne     storport!StorpLogPerAdapterStatistics+0x25b94 (fffff809`efc2af48)  Branch

storport!StorpLogPerAdapterStatistics+0xaf:
fffff809`efc05463 488bcb          mov     rcx,rbx
fffff809`efc05466 e87d000000      call    storport!StorpInitializeHierarchicalResetBuckets (fffff809`efc054e8)
fffff809`efc0546b 4038bb3c150000  cmp     byte ptr [rbx+153Ch],dil  ;if (AdapterExt->TopologyInfoLogged) goto 0x104 (return)
fffff809`efc05472 7544            jne     storport!StorpLogPerAdapterStatistics+0x104 (fffff809`efc054b8)  Branch

storport!StorpLogPerAdapterStatistics+0xc0:
fffff809`efc05474 488bcb          mov     rcx,rbx
fffff809`efc05477 e864640000      call    storport!RaidAcquireAdapterRemoveLock (fffff809`efc0b8e0)
fffff809`efc0547c 85c0            test    eax,eax
fffff809`efc0547e 7838            js      storport!StorpLogPerAdapterStatistics+0x104 (fffff809`efc054b8)  Branch

storport!StorpLogPerAdapterStatistics+0xcc:
fffff809`efc05480 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff809`efc05484 48ff159deb0500  call    qword ptr [storport!_imp_IoAllocateWorkItem (fffff809`efc64028)]
fffff809`efc0548b 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc05490 4885c0          test    rax,rax
fffff809`efc05493 0f84bd5c0200    je      storport!StorpLogPerAdapterStatistics+0x25da2 (fffff809`efc2b156)  Branch

storport!StorpLogPerAdapterStatistics+0xe5:
fffff809`efc05499 4c8bc8          mov     r9,rax
fffff809`efc0549c 488d155df2ffff  lea     rdx,[storport!StorpAdapterTopologyWorkItemRoutine (fffff809`efc04700)]
fffff809`efc054a3 41b803000000    mov     r8d,3
fffff809`efc054a9 488bc8          mov     rcx,rax
fffff809`efc054ac 48ff153df00500  call    qword ptr [storport!_imp_IoQueueWorkItem (fffff809`efc644f0)]
fffff809`efc054b3 0f1f440000      nop     dword ptr [rax+rax]

storport!StorpLogPerAdapterStatistics+0x104:
fffff809`efc054b8 488b8da0000000  mov     rcx,qword ptr [rbp+0A0h]
fffff809`efc054bf 4833cc          xor     rcx,rsp
fffff809`efc054c2 e829db0100      call    storport!_security_check_cookie (fffff809`efc22ff0)
fffff809`efc054c7 4c8d9c24b0010000 lea     r11,[rsp+1B0h]
fffff809`efc054cf 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff809`efc054d3 498b7330        mov     rsi,qword ptr [r11+30h]
fffff809`efc054d7 498be3          mov     rsp,r11
fffff809`efc054da 415e            pop     r14
fffff809`efc054dc 5f              pop     rdi
fffff809`efc054dd 5d              pop     rbp
fffff809`efc054de c3              ret

storport!StorpLogPerAdapterStatistics+0x25986:
fffff809`efc2ad3a 833d1733030005  cmp     dword ptr [storport!StorPortEventProvider_Context+0x48 (fffff809`efc5e058)],5
fffff809`efc2ad41 0f86dea6fdff    jbe     storport!StorpLogPerAdapterStatistics+0x71 (fffff809`efc05425)  Branch

storport!StorpLogPerAdapterStatistics+0x25993:
fffff809`efc2ad47 48ba0000000000400000 mov rdx,400000000000h
fffff809`efc2ad51 e882a5fdff      call    storport!TlgKeywordOn (fffff809`efc052d8)
fffff809`efc2ad56 84c0            test    al,al
fffff809`efc2ad58 0f84c7a6fdff    je      storport!StorpLogPerAdapterStatistics+0x71 (fffff809`efc05425)  Branch

storport!StorpLogPerAdapterStatistics+0x259aa:
fffff809`efc2ad5e 8b4338          mov     eax,dword ptr [rbx+38h]
fffff809`efc2ad61 89442438        mov     dword ptr [rsp+38h],eax
fffff809`efc2ad65 8b8360140000    mov     eax,dword ptr [rbx+1460h]
fffff809`efc2ad6b 89442440        mov     dword ptr [rsp+40h],eax
fffff809`efc2ad6f 8a8364140000    mov     al,byte ptr [rbx+1464h]
fffff809`efc2ad75 88442430        mov     byte ptr [rsp+30h],al
fffff809`efc2ad79 8b8368140000    mov     eax,dword ptr [rbx+1468h]
fffff809`efc2ad7f 89442444        mov     dword ptr [rsp+44h],eax
fffff809`efc2ad83 8b836c140000    mov     eax,dword ptr [rbx+146Ch]
fffff809`efc2ad89 89442448        mov     dword ptr [rsp+48h],eax
fffff809`efc2ad8d 8a8370140000    mov     al,byte ptr [rbx+1470h]
fffff809`efc2ad93 88442431        mov     byte ptr [rsp+31h],al
fffff809`efc2ad97 8b8374140000    mov     eax,dword ptr [rbx+1474h]
fffff809`efc2ad9d 8944244c        mov     dword ptr [rsp+4Ch],eax
fffff809`efc2ada1 8b8378140000    mov     eax,dword ptr [rbx+1478h]
fffff809`efc2ada7 89442450        mov     dword ptr [rsp+50h],eax
fffff809`efc2adab 8a837c140000    mov     al,byte ptr [rbx+147Ch]
fffff809`efc2adb1 88442432        mov     byte ptr [rsp+32h],al
fffff809`efc2adb5 8b8380140000    mov     eax,dword ptr [rbx+1480h]
fffff809`efc2adbb 89442454        mov     dword ptr [rsp+54h],eax
fffff809`efc2adbf 8b8384140000    mov     eax,dword ptr [rbx+1484h]
fffff809`efc2adc5 89442458        mov     dword ptr [rsp+58h],eax
fffff809`efc2adc9 8a8388140000    mov     al,byte ptr [rbx+1488h]
fffff809`efc2adcf 88442433        mov     byte ptr [rsp+33h],al
fffff809`efc2add3 8b838c140000    mov     eax,dword ptr [rbx+148Ch]
fffff809`efc2add9 8944245c        mov     dword ptr [rsp+5Ch],eax
fffff809`efc2addd 8b8390140000    mov     eax,dword ptr [rbx+1490h]
fffff809`efc2ade3 89442460        mov     dword ptr [rsp+60h],eax
fffff809`efc2ade7 8a8394140000    mov     al,byte ptr [rbx+1494h]
fffff809`efc2aded 88442434        mov     byte ptr [rsp+34h],al
fffff809`efc2adf1 488d8348140000  lea     rax,[rbx+1448h]
fffff809`efc2adf8 48894590        mov     qword ptr [rbp-70h],rax
fffff809`efc2adfc 488d442438      lea     rax,[rsp+38h]
fffff809`efc2ae01 488945a0        mov     qword ptr [rbp-60h],rax
fffff809`efc2ae05 488d44243c      lea     rax,[rsp+3Ch]
fffff809`efc2ae0a 488945b0        mov     qword ptr [rbp-50h],rax
fffff809`efc2ae0e 488d442440      lea     rax,[rsp+40h]
fffff809`efc2ae13 488945c0        mov     qword ptr [rbp-40h],rax
fffff809`efc2ae17 488d442430      lea     rax,[rsp+30h]
fffff809`efc2ae1c 488945d0        mov     qword ptr [rbp-30h],rax
fffff809`efc2ae20 488d442444      lea     rax,[rsp+44h]
fffff809`efc2ae25 488945e0        mov     qword ptr [rbp-20h],rax
fffff809`efc2ae29 488d442448      lea     rax,[rsp+48h]
fffff809`efc2ae2e 488945f0        mov     qword ptr [rbp-10h],rax
fffff809`efc2ae32 488d442431      lea     rax,[rsp+31h]
fffff809`efc2ae37 48894500        mov     qword ptr [rbp],rax
fffff809`efc2ae3b 488d44244c      lea     rax,[rsp+4Ch]
fffff809`efc2ae40 48894510        mov     qword ptr [rbp+10h],rax
fffff809`efc2ae44 488d442450      lea     rax,[rsp+50h]
fffff809`efc2ae49 48894520        mov     qword ptr [rbp+20h],rax
fffff809`efc2ae4d 488d442432      lea     rax,[rsp+32h]
fffff809`efc2ae52 48894530        mov     qword ptr [rbp+30h],rax
fffff809`efc2ae56 488d442454      lea     rax,[rsp+54h]
fffff809`efc2ae5b 48894540        mov     qword ptr [rbp+40h],rax
fffff809`efc2ae5f 488d442458      lea     rax,[rsp+58h]
fffff809`efc2ae64 48894550        mov     qword ptr [rbp+50h],rax
fffff809`efc2ae68 488d442433      lea     rax,[rsp+33h]
fffff809`efc2ae6d 48894560        mov     qword ptr [rbp+60h],rax
fffff809`efc2ae71 488d44245c      lea     rax,[rsp+5Ch]
fffff809`efc2ae76 48894570        mov     qword ptr [rbp+70h],rax
fffff809`efc2ae7a 488d442460      lea     rax,[rsp+60h]
fffff809`efc2ae7f 48898580000000  mov     qword ptr [rbp+80h],rax
fffff809`efc2ae86 488d442434      lea     rax,[rsp+34h]
fffff809`efc2ae8b 48898590000000  mov     qword ptr [rbp+90h],rax
fffff809`efc2ae92 894c243c        mov     dword ptr [rsp+3Ch],ecx
fffff809`efc2ae96 48c7459810000000 mov     qword ptr [rbp-68h],10h
fffff809`efc2ae9e 48c745a804000000 mov     qword ptr [rbp-58h],4
fffff809`efc2aea6 48c745b804000000 mov     qword ptr [rbp-48h],4
fffff809`efc2aeae 48c745c804000000 mov     qword ptr [rbp-38h],4
fffff809`efc2aeb6 48c745d801000000 mov     qword ptr [rbp-28h],1
fffff809`efc2aebe 48c745e804000000 mov     qword ptr [rbp-18h],4
fffff809`efc2aec6 48c745f804000000 mov     qword ptr [rbp-8],4
fffff809`efc2aece 48c7450801000000 mov     qword ptr [rbp+8],1
fffff809`efc2aed6 48c7451804000000 mov     qword ptr [rbp+18h],4
fffff809`efc2aede 48c7452804000000 mov     qword ptr [rbp+28h],4
fffff809`efc2aee6 48c7453801000000 mov     qword ptr [rbp+38h],1
fffff809`efc2aeee 48c7454804000000 mov     qword ptr [rbp+48h],4
fffff809`efc2aef6 48c7455804000000 mov     qword ptr [rbp+58h],4
fffff809`efc2aefe 48c7456801000000 mov     qword ptr [rbp+68h],1
fffff809`efc2af06 48c7457804000000 mov     qword ptr [rbp+78h],4
fffff809`efc2af0e 48c7858800000004000000 mov qword ptr [rbp+88h],4
fffff809`efc2af19 48c7859800000001000000 mov qword ptr [rbp+98h],1
fffff809`efc2af24 488d442470      lea     rax,[rsp+70h]
fffff809`efc2af29 4889442428      mov     qword ptr [rsp+28h],rax
fffff809`efc2af2e 488d15d3af0200  lea     rdx,[storport!TraceLoggingMetadata+0x26e0 (fffff809`efc55f08)]
fffff809`efc2af35 c744242013000000 mov     dword ptr [rsp+20h],13h
fffff809`efc2af3d e8caa3fdff      call    storport!TlgWrite (fffff809`efc0530c)
fffff809`efc2af42 90              nop
fffff809`efc2af43 e9dda4fdff      jmp     storport!StorpLogPerAdapterStatistics+0x71 (fffff809`efc05425)  Branch

storport!StorpLogPerAdapterStatistics+0x25b94:
fffff809`efc2af48 833d0931030005  cmp     dword ptr [storport!StorPortEventProvider_Context+0x48 (fffff809`efc5e058)],5
fffff809`efc2af4f 0f860ea5fdff    jbe     storport!StorpLogPerAdapterStatistics+0xaf (fffff809`efc05463)  Branch

storport!StorpLogPerAdapterStatistics+0x25ba1:
fffff809`efc2af55 48ba0000000000400000 mov rdx,400000000000h
fffff809`efc2af5f e874a3fdff      call    storport!TlgKeywordOn (fffff809`efc052d8)
fffff809`efc2af64 84c0            test    al,al
fffff809`efc2af66 0f84f7a4fdff    je      storport!StorpLogPerAdapterStatistics+0xaf (fffff809`efc05463)  Branch

storport!StorpLogPerAdapterStatistics+0x25bb8:
fffff809`efc2af6c 8b4338          mov     eax,dword ptr [rbx+38h]
fffff809`efc2af6f 89442460        mov     dword ptr [rsp+60h],eax
fffff809`efc2af73 8b839c140000    mov     eax,dword ptr [rbx+149Ch]
fffff809`efc2af79 89442458        mov     dword ptr [rsp+58h],eax
fffff809`efc2af7d 8a83a0140000    mov     al,byte ptr [rbx+14A0h]
fffff809`efc2af83 88442434        mov     byte ptr [rsp+34h],al
fffff809`efc2af87 8b83a4140000    mov     eax,dword ptr [rbx+14A4h]
fffff809`efc2af8d 89442454        mov     dword ptr [rsp+54h],eax
fffff809`efc2af91 8b83a8140000    mov     eax,dword ptr [rbx+14A8h]
fffff809`efc2af97 89442450        mov     dword ptr [rsp+50h],eax
fffff809`efc2af9b 8a83ac140000    mov     al,byte ptr [rbx+14ACh]
fffff809`efc2afa1 88442433        mov     byte ptr [rsp+33h],al
fffff809`efc2afa5 8b83b0140000    mov     eax,dword ptr [rbx+14B0h]
fffff809`efc2afab 8944244c        mov     dword ptr [rsp+4Ch],eax
fffff809`efc2afaf 8b83b4140000    mov     eax,dword ptr [rbx+14B4h]
fffff809`efc2afb5 89442448        mov     dword ptr [rsp+48h],eax
fffff809`efc2afb9 8a83b8140000    mov     al,byte ptr [rbx+14B8h]
fffff809`efc2afbf 88442432        mov     byte ptr [rsp+32h],al
fffff809`efc2afc3 8b83bc140000    mov     eax,dword ptr [rbx+14BCh]
fffff809`efc2afc9 89442444        mov     dword ptr [rsp+44h],eax
fffff809`efc2afcd 8b83c0140000    mov     eax,dword ptr [rbx+14C0h]
fffff809`efc2afd3 89442440        mov     dword ptr [rsp+40h],eax
fffff809`efc2afd7 8a83c4140000    mov     al,byte ptr [rbx+14C4h]
fffff809`efc2afdd 88442431        mov     byte ptr [rsp+31h],al
fffff809`efc2afe1 8b83c8140000    mov     eax,dword ptr [rbx+14C8h]
fffff809`efc2afe7 8944243c        mov     dword ptr [rsp+3Ch],eax
fffff809`efc2afeb 8b83cc140000    mov     eax,dword ptr [rbx+14CCh]
fffff809`efc2aff1 89442438        mov     dword ptr [rsp+38h],eax
fffff809`efc2aff5 8a83d0140000    mov     al,byte ptr [rbx+14D0h]
fffff809`efc2affb 88442430        mov     byte ptr [rsp+30h],al
fffff809`efc2afff 488d8348140000  lea     rax,[rbx+1448h]
fffff809`efc2b006 48894590        mov     qword ptr [rbp-70h],rax
fffff809`efc2b00a 488d442460      lea     rax,[rsp+60h]
fffff809`efc2b00f 488945a0        mov     qword ptr [rbp-60h],rax
fffff809`efc2b013 488d44245c      lea     rax,[rsp+5Ch]
fffff809`efc2b018 488945b0        mov     qword ptr [rbp-50h],rax
fffff809`efc2b01c 488d442458      lea     rax,[rsp+58h]
fffff809`efc2b021 488945c0        mov     qword ptr [rbp-40h],rax
fffff809`efc2b025 488d442434      lea     rax,[rsp+34h]
fffff809`efc2b02a 488945d0        mov     qword ptr [rbp-30h],rax
fffff809`efc2b02e 488d442454      lea     rax,[rsp+54h]
fffff809`efc2b033 488945e0        mov     qword ptr [rbp-20h],rax
fffff809`efc2b037 488d442450      lea     rax,[rsp+50h]
fffff809`efc2b03c 488945f0        mov     qword ptr [rbp-10h],rax
fffff809`efc2b040 488d442433      lea     rax,[rsp+33h]
fffff809`efc2b045 48894500        mov     qword ptr [rbp],rax
fffff809`efc2b049 488d44244c      lea     rax,[rsp+4Ch]
fffff809`efc2b04e 48894510        mov     qword ptr [rbp+10h],rax
fffff809`efc2b052 488d442448      lea     rax,[rsp+48h]
fffff809`efc2b057 48894520        mov     qword ptr [rbp+20h],rax
fffff809`efc2b05b 488d442432      lea     rax,[rsp+32h]
fffff809`efc2b060 48894530        mov     qword ptr [rbp+30h],rax
fffff809`efc2b064 488d442444      lea     rax,[rsp+44h]
fffff809`efc2b069 48894540        mov     qword ptr [rbp+40h],rax
fffff809`efc2b06d 488d442440      lea     rax,[rsp+40h]
fffff809`efc2b072 48894550        mov     qword ptr [rbp+50h],rax
fffff809`efc2b076 488d442431      lea     rax,[rsp+31h]
fffff809`efc2b07b 48894560        mov     qword ptr [rbp+60h],rax
fffff809`efc2b07f 488d44243c      lea     rax,[rsp+3Ch]
fffff809`efc2b084 48894570        mov     qword ptr [rbp+70h],rax
fffff809`efc2b088 488d442438      lea     rax,[rsp+38h]
fffff809`efc2b08d 48898580000000  mov     qword ptr [rbp+80h],rax
fffff809`efc2b094 488d442430      lea     rax,[rsp+30h]
fffff809`efc2b099 48898590000000  mov     qword ptr [rbp+90h],rax
fffff809`efc2b0a0 894c245c        mov     dword ptr [rsp+5Ch],ecx
fffff809`efc2b0a4 48c7459810000000 mov     qword ptr [rbp-68h],10h
fffff809`efc2b0ac 48c745a804000000 mov     qword ptr [rbp-58h],4
fffff809`efc2b0b4 48c745b804000000 mov     qword ptr [rbp-48h],4
fffff809`efc2b0bc 48c745c804000000 mov     qword ptr [rbp-38h],4
fffff809`efc2b0c4 48c745d801000000 mov     qword ptr [rbp-28h],1
fffff809`efc2b0cc 48c745e804000000 mov     qword ptr [rbp-18h],4
fffff809`efc2b0d4 48c745f804000000 mov     qword ptr [rbp-8],4
fffff809`efc2b0dc 48c7450801000000 mov     qword ptr [rbp+8],1
fffff809`efc2b0e4 48c7451804000000 mov     qword ptr [rbp+18h],4
fffff809`efc2b0ec 48c7452804000000 mov     qword ptr [rbp+28h],4
fffff809`efc2b0f4 48c7453801000000 mov     qword ptr [rbp+38h],1
fffff809`efc2b0fc 48c7454804000000 mov     qword ptr [rbp+48h],4
fffff809`efc2b104 48c7455804000000 mov     qword ptr [rbp+58h],4
fffff809`efc2b10c 48c7456801000000 mov     qword ptr [rbp+68h],1
fffff809`efc2b114 48c7457804000000 mov     qword ptr [rbp+78h],4
fffff809`efc2b11c 48c7858800000004000000 mov qword ptr [rbp+88h],4
fffff809`efc2b127 48c7859800000001000000 mov qword ptr [rbp+98h],1
fffff809`efc2b132 488d442470      lea     rax,[rsp+70h]
fffff809`efc2b137 4889442428      mov     qword ptr [rsp+28h],rax
fffff809`efc2b13c 488d1581b70200  lea     rdx,[storport!TraceLoggingMetadata+0x309c (fffff809`efc568c4)]
fffff809`efc2b143 c744242013000000 mov     dword ptr [rsp+20h],13h
fffff809`efc2b14b e8bca1fdff      call    storport!TlgWrite (fffff809`efc0530c)
fffff809`efc2b150 90              nop
fffff809`efc2b151 e90da3fdff      jmp     storport!StorpLogPerAdapterStatistics+0xaf (fffff809`efc05463)  Branch

storport!StorpLogPerAdapterStatistics+0x25da2:
fffff809`efc2b156 488b8b00010000  mov     rcx,qword ptr [rbx+100h]
fffff809`efc2b15d 48ff152c910300  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff809`efc64290)]
fffff809`efc2b164 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc2b169 90              nop
fffff809`efc2b16a e949a3fdff      jmp     storport!StorpLogPerAdapterStatistics+0x104 (fffff809`efc054b8)  Branch
