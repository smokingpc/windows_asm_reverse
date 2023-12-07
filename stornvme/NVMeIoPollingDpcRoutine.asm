1: kd> uf NVMeIoPollingDpcRoutine
stornvme!NVMeIoPollingDpcRoutine:
fffff801`58b34800 48895c2408      mov     qword ptr [rsp+8],rbx
fffff801`58b34805 4889742418      mov     qword ptr [rsp+18h],rsi
fffff801`58b3480a 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff801`58b3480f 55              push    rbp
fffff801`58b34810 488bec          mov     rbp,rsp
fffff801`58b34813 4881ec80000000  sub     rsp,80h
fffff801`58b3481a 33c0            xor     eax,eax
fffff801`58b3481c 488bda          mov     rbx,rdx
fffff801`58b3481f 488b12          mov     rdx,qword ptr [rdx]
fffff801`58b34822 498bf8          mov     rdi,r8
fffff801`58b34825 488bf1          mov     rsi,rcx
fffff801`58b34828 488945c8        mov     qword ptr [rbp-38h],rax
fffff801`58b3482c 41b804000000    mov     r8d,4
fffff801`58b34832 488945d0        mov     qword ptr [rbp-30h],rax
fffff801`58b34836 8d4805          lea     ecx,[rax+5]
fffff801`58b34839 448945c0        mov     dword ptr [rbp-40h],r8d
fffff801`58b3483d 894de0          mov     dword ptr [rbp-20h],ecx
fffff801`58b34840 488945d8        mov     qword ptr [rbp-28h],rax
fffff801`58b34844 488945e8        mov     qword ptr [rbp-18h],rax
fffff801`58b34848 488945f0        mov     qword ptr [rbp-10h],rax
fffff801`58b3484c 488945f8        mov     qword ptr [rbp-8],rax
fffff801`58b34850 8b829c0e0000    mov     eax,dword ptr [rdx+0E9Ch]
fffff801`58b34856 a820            test    al,20h
fffff801`58b34858 752f            jne     stornvme!NVMeIoPollingDpcRoutine+0x89 (fffff801`58b34889)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x5a:
fffff801`58b3485a 4c8b4b08        mov     r9,qword ptr [rbx+8]
fffff801`58b3485e 4983c160        add     r9,60h
fffff801`58b34862 a802            test    al,2
fffff801`58b34864 7506            jne     stornvme!NVMeIoPollingDpcRoutine+0x6c (fffff801`58b3486c)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x66:
fffff801`58b34866 488d45c0        lea     rax,[rbp-40h]
fffff801`58b3486a eb07            jmp     stornvme!NVMeIoPollingDpcRoutine+0x73 (fffff801`58b34873)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x6c:
fffff801`58b3486c 488d45e0        lea     rax,[rbp-20h]
fffff801`58b34870 448bc1          mov     r8d,ecx

stornvme!NVMeIoPollingDpcRoutine+0x73:
fffff801`58b34873 b95d000000      mov     ecx,5Dh
fffff801`58b34878 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b3487d 48ff15a4a70000  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`58b3f028)]
fffff801`58b34884 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeIoPollingDpcRoutine+0x89:
fffff801`58b34889 488b13          mov     rdx,qword ptr [rbx]
fffff801`58b3488c 488bce          mov     rcx,rsi
fffff801`58b3488f 4c8b4308        mov     r8,qword ptr [rbx+8]
fffff801`58b34893 448b8a9c0e0000  mov     r9d,dword ptr [rdx+0E9Ch]
fffff801`58b3489a 41f7d1          not     r9d
fffff801`58b3489d 49c1e903        shr     r9,3
fffff801`58b348a1 4183e101        and     r9d,1
fffff801`58b348a5 e856cffeff      call    stornvme!NVMeCompletionDpcRoutine (fffff801`58b21800)
fffff801`58b348aa 488b13          mov     rdx,qword ptr [rbx]
fffff801`58b348ad 8b829c0e0000    mov     eax,dword ptr [rdx+0E9Ch]
fffff801`58b348b3 a820            test    al,20h
fffff801`58b348b5 751d            jne     stornvme!NVMeIoPollingDpcRoutine+0xd4 (fffff801`58b348d4)  Branch

stornvme!NVMeIoPollingDpcRoutine+0xb7:
fffff801`58b348b7 4c8d45c0        lea     r8,[rbp-40h]
fffff801`58b348bb b904100000      mov     ecx,1004h
fffff801`58b348c0 a802            test    al,2
fffff801`58b348c2 7404            je      stornvme!NVMeIoPollingDpcRoutine+0xc8 (fffff801`58b348c8)  Branch

stornvme!NVMeIoPollingDpcRoutine+0xc4:
fffff801`58b348c4 4c8d45e0        lea     r8,[rbp-20h]

stornvme!NVMeIoPollingDpcRoutine+0xc8:
fffff801`58b348c8 48ff1541a70000  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`58b3f010)]
fffff801`58b348cf 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeIoPollingDpcRoutine+0xd4:
fffff801`58b348d4 488b5308        mov     rdx,qword ptr [rbx+8]
fffff801`58b348d8 4533db          xor     r11d,r11d
fffff801`58b348db 458bc3          mov     r8d,r11d
fffff801`58b348de 448b8ab4000000  mov     r9d,dword ptr [rdx+0B4h]
fffff801`58b348e5 4585c9          test    r9d,r9d
fffff801`58b348e8 0f84a5000000    je      stornvme!NVMeIoPollingDpcRoutine+0x193 (fffff801`58b34993)  Branch

stornvme!NVMeIoPollingDpcRoutine+0xee:
fffff801`58b348ee 4c8b92c0000000  mov     r10,qword ptr [rdx+0C0h]

stornvme!NVMeIoPollingDpcRoutine+0xf5:
fffff801`58b348f5 418bc0          mov     eax,r8d
fffff801`58b348f8 498b0cc2        mov     rcx,qword ptr [r10+rax*8]
fffff801`58b348fc 6644399980000000 cmp     word ptr [rcx+80h],r11w
fffff801`58b34904 770d            ja      stornvme!NVMeIoPollingDpcRoutine+0x113 (fffff801`58b34913)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x106:
fffff801`58b34906 41ffc0          inc     r8d
fffff801`58b34909 453bc1          cmp     r8d,r9d
fffff801`58b3490c 72e7            jb      stornvme!NVMeIoPollingDpcRoutine+0xf5 (fffff801`58b348f5)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x10e:
fffff801`58b3490e e980000000      jmp     stornvme!NVMeIoPollingDpcRoutine+0x193 (fffff801`58b34993)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x113:
fffff801`58b34913 488b0b          mov     rcx,qword ptr [rbx]
fffff801`58b34916 8b4114          mov     eax,dword ptr [rcx+14h]
fffff801`58b34919 a810            test    al,10h
fffff801`58b3491b 7576            jne     stornvme!NVMeIoPollingDpcRoutine+0x193 (fffff801`58b34993)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x11d:
fffff801`58b3491d 4c8b82d0000000  mov     r8,qword ptr [rdx+0D0h]
fffff801`58b34924 448bd7          mov     r10d,edi
fffff801`58b34927 4d85c0          test    r8,r8
fffff801`58b3492a 7532            jne     stornvme!NVMeIoPollingDpcRoutine+0x15e (fffff801`58b3495e)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x12c:
fffff801`58b3492c 4c8d82d8000000  lea     r8,[rdx+0D8h]
fffff801`58b34933 44895d18        mov     dword ptr [rbp+18h],r11d
fffff801`58b34937 488d4518        lea     rax,[rbp+18h]
fffff801`58b3493b 488bd1          mov     rdx,rcx
fffff801`58b3493e 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b34943 b902100000      mov     ecx,1002h
fffff801`58b34948 458bca          mov     r9d,r10d
fffff801`58b3494b 4c895c2420      mov     qword ptr [rsp+20h],r11
fffff801`58b34950 48ff15b9a60000  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`58b3f010)]
fffff801`58b34957 0f1f440000      nop     dword ptr [rax+rax]
fffff801`58b3495c eb35            jmp     stornvme!NVMeIoPollingDpcRoutine+0x193 (fffff801`58b34993)  Branch

stornvme!NVMeIoPollingDpcRoutine+0x15e:
fffff801`58b3495e 8b82cc000000    mov     eax,dword ptr [rdx+0CCh]
fffff801`58b34964 488bd1          mov     rdx,rcx
fffff801`58b34967 4f8b04d0        mov     r8,qword ptr [r8+r10*8]
fffff801`58b3496b b959000000      mov     ecx,59h
fffff801`58b34970 4c6bc8f6        imul    r9,rax,0FFFFFFFFFFFFFFF6h
fffff801`58b34974 488d4518        lea     rax,[rbp+18h]
fffff801`58b34978 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b3497d 4c895c2428      mov     qword ptr [rsp+28h],r11
fffff801`58b34982 4c895c2420      mov     qword ptr [rsp+20h],r11
fffff801`58b34987 48ff159aa60000  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`58b3f028)]
fffff801`58b3498e 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeIoPollingDpcRoutine+0x193:
fffff801`58b34993 4c8d9c2480000000 lea     r11,[rsp+80h]
fffff801`58b3499b 498b5b10        mov     rbx,qword ptr [r11+10h]
fffff801`58b3499f 498b7320        mov     rsi,qword ptr [r11+20h]
fffff801`58b349a3 498b7b28        mov     rdi,qword ptr [r11+28h]
fffff801`58b349a7 498be3          mov     rsp,r11
fffff801`58b349aa 5d              pop     rbp
fffff801`58b349ab c3              ret
