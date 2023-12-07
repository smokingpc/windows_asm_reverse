21: kd> uf GetRegistrySettings
stornvme!GetRegistrySettings:
fffff801`58b3756c 488bc4          mov     rax,rsp
fffff801`58b3756f 48895810        mov     qword ptr [rax+10h],rbx
fffff801`58b37573 48897018        mov     qword ptr [rax+18h],rsi
fffff801`58b37577 48897820        mov     qword ptr [rax+20h],rdi
fffff801`58b3757b 55              push    rbp
fffff801`58b3757c 4156            push    r14
fffff801`58b3757e 4157            push    r15
fffff801`58b37580 488d68a1        lea     rbp,[rax-5Fh]
fffff801`58b37584 4881ec90000000  sub     rsp,90h
fffff801`58b3758b 488b056e5a0000  mov     rax,qword ptr [stornvme!_security_cookie (fffff801`58b3d000)]
fffff801`58b37592 4833c4          xor     rax,rsp
fffff801`58b37595 4889453f        mov     qword ptr [rbp+3Fh],rax
fffff801`58b37599 0f1005f03d0000  movups  xmm0,xmmword ptr [stornvme!`string` (fffff801`58b3b390)]
fffff801`58b375a0 33f6            xor     esi,esi
fffff801`58b375a2 8a05003e0000    mov     al,byte ptr [stornvme!`string`+0x18 (fffff801`58b3b3a8)]
fffff801`58b375a8 f20f100df03d0000 movsd   xmm1,mmword ptr [stornvme!`string`+0x10 (fffff801`58b3b3a0)]
fffff801`58b375b0 488bd9          mov     rbx,rcx
fffff801`58b375b3 0f11451f        movups  xmmword ptr [rbp+1Fh],xmm0
fffff801`58b375b7 884537          mov     byte ptr [rbp+37h],al
fffff801`58b375ba f20f114d2f      movsd   mmword ptr [rbp+2Fh],xmm1
fffff801`58b375bf c7450b00020000  mov     dword ptr [rbp+0Bh],200h
fffff801`58b375c6 89750f          mov     dword ptr [rbp+0Fh],esi
fffff801`58b375c9 40387110        cmp     byte ptr [rcx+10h],sil
fffff801`58b375cd 0f85340e0000    jne     stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x67:
fffff801`58b375d3 836134e0        and     dword ptr [rcx+34h],0FFFFFFE0h
fffff801`58b375d7 488d550b        lea     rdx,[rbp+0Bh]
fffff801`58b375db 83c8ff          or      eax,0FFFFFFFFh
fffff801`58b375de 4889711c        mov     qword ptr [rcx+1Ch],rsi
fffff801`58b375e2 894150          mov     dword ptr [rcx+50h],eax
fffff801`58b375e5 41bfff000000    mov     r15d,0FFh
fffff801`58b375eb 894160          mov     dword ptr [rcx+60h],eax
fffff801`58b375ee 894164          mov     dword ptr [rcx+64h],eax
fffff801`58b375f1 894170          mov     dword ptr [rcx+70h],eax
fffff801`58b375f4 897124          mov     dword ptr [rcx+24h],esi
fffff801`58b375f7 c741280000ff00  mov     dword ptr [rcx+28h],0FF0000h
fffff801`58b375fe 4889712c        mov     qword ptr [rcx+2Ch],rsi
fffff801`58b37602 48c741381f070000 mov     qword ptr [rcx+38h],71Fh
fffff801`58b3760a 48c7414800400000 mov     qword ptr [rcx+48h],4000h
fffff801`58b37612 48897168        mov     qword ptr [rcx+68h],rsi
fffff801`58b37616 48897178        mov     qword ptr [rcx+78h],rsi
fffff801`58b3761a c7415432000000  mov     dword ptr [rcx+54h],32h
fffff801`58b37621 c74158b80b0000  mov     dword ptr [rcx+58h],0BB8h
fffff801`58b37628 c7415ce8030000  mov     dword ptr [rcx+5Ch],3E8h
fffff801`58b3762f 897140          mov     dword ptr [rcx+40h],esi
fffff801`58b37632 c7414464000000  mov     dword ptr [rcx+44h],64h
fffff801`58b37639 48ff15407a0000  call    qword ptr [stornvme!_imp_StorPortAllocateRegistryBuffer (fffff801`58b3f080)]
fffff801`58b37640 0f1f440000      nop     dword ptr [rax+rax]
fffff801`58b37645 48894517        mov     qword ptr [rbp+17h],rax
fffff801`58b37649 4c8bd0          mov     r10,rax
fffff801`58b3764c 4885c0          test    rax,rax
fffff801`58b3764f 0f84b20d0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xe9:
fffff801`58b37655 0fb75304        movzx   edx,word ptr [rbx+4]
fffff801`58b37659 448d4604        lea     r8d,[rsi+4]
fffff801`58b3765d 488d4d23        lea     rcx,[rbp+23h]
fffff801`58b37661 e89e0f0000      call    stornvme!UlongToHex (fffff801`58b38604)
fffff801`58b37666 0fb75306        movzx   edx,word ptr [rbx+6]
fffff801`58b3766a 448d4604        lea     r8d,[rsi+4]
fffff801`58b3766e 488d4d2c        lea     rcx,[rbp+2Ch]
fffff801`58b37672 e88d0f0000      call    stornvme!UlongToHex (fffff801`58b38604)
fffff801`58b37677 0fb65308        movzx   edx,byte ptr [rbx+8]
fffff801`58b3767b 448d4602        lea     r8d,[rsi+2]
fffff801`58b3767f 488d4d35        lea     rcx,[rbp+35h]
fffff801`58b37683 e87c0f0000      call    stornvme!UlongToHex (fffff801`58b38604)
fffff801`58b37688 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b3768c 8bce            mov     ecx,esi
fffff801`58b3768e 8d7e1d          lea     edi,[rsi+1Dh]
fffff801`58b37691 448d7601        lea     r14d,[rsi+1]

stornvme!GetRegistrySettings+0x129:
fffff801`58b37695 403830          cmp     byte ptr [rax],sil
fffff801`58b37698 740a            je      stornvme!GetRegistrySettings+0x138 (fffff801`58b376a4)  Branch

stornvme!GetRegistrySettings+0x12e:
fffff801`58b3769a 4103ce          add     ecx,r14d
fffff801`58b3769d 4903c6          add     rax,r14
fffff801`58b376a0 3bcf            cmp     ecx,edi
fffff801`58b376a2 72f1            jb      stornvme!GetRegistrySettings+0x129 (fffff801`58b37695)  Branch

stornvme!GetRegistrySettings+0x138:
fffff801`58b376a4 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b376a7 3bcf            cmp     ecx,edi
fffff801`58b376a9 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b376ac 0f42f9          cmovb   edi,ecx
fffff801`58b376af 498bca          mov     rcx,r10
fffff801`58b376b2 e899d8feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b376b7 488d4507        lea     rax,[rbp+7]
fffff801`58b376bb 897507          mov     dword ptr [rbp+7],esi
fffff801`58b376be 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b376c3 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b376c7 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b376cb 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b376cf 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b376d4 488d151d3f0000  lea     rdx,[stornvme!`string`+0x268 (fffff801`58b3b5f8)]     ;'MaxTransferSize'
fffff801`58b376db 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b376df 488bcb          mov     rcx,rbx
fffff801`58b376e2 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b376e7 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b376eb 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b376f0 e8430d0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b376f5 413ac6          cmp     al,r14b
fffff801`58b376f8 751e            jne     stornvme!GetRegistrySettings+0x1ac (fffff801`58b37718)  Branch

stornvme!GetRegistrySettings+0x18e:
fffff801`58b376fa 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b376fd 85c0            test    eax,eax
fffff801`58b376ff 7417            je      stornvme!GetRegistrySettings+0x1ac (fffff801`58b37718)  Branch

stornvme!GetRegistrySettings+0x195:
fffff801`58b37701 b900080000      mov     ecx,800h
fffff801`58b37706 89431c          mov     dword ptr [rbx+1Ch],eax
fffff801`58b37709 3bc1            cmp     eax,ecx
fffff801`58b3770b 7605            jbe     stornvme!GetRegistrySettings+0x1a6 (fffff801`58b37712)  Branch

stornvme!GetRegistrySettings+0x1a1:
fffff801`58b3770d 894b1c          mov     dword ptr [rbx+1Ch],ecx
fffff801`58b37710 8bc1            mov     eax,ecx

stornvme!GetRegistrySettings+0x1a6:
fffff801`58b37712 c1e00a          shl     eax,0Ah
fffff801`58b37715 89431c          mov     dword ptr [rbx+1Ch],eax

stornvme!GetRegistrySettings+0x1ac:
fffff801`58b37718 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b3771c 4885c9          test    rcx,rcx
fffff801`58b3771f 0f84e20c0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x1b9:
fffff801`58b37725 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37728 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b3772b e820d8feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37730 488d4507        lea     rax,[rbp+7]
fffff801`58b37734 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37737 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b3773c 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37740 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37744 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37748 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b3774d 488d15c43d0000  lea     rdx,[stornvme!`string`+0x188 (fffff801`58b3b518)]     ;'IoQueueDepth'
fffff801`58b37754 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37758 488bcb          mov     rcx,rbx
fffff801`58b3775b 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37760 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37764 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37769 e8ca0c0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b3776e 413ac6          cmp     al,r14b
fffff801`58b37771 750a            jne     stornvme!GetRegistrySettings+0x211 (fffff801`58b3777d)  Branch

stornvme!GetRegistrySettings+0x207:
fffff801`58b37773 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37776 85c0            test    eax,eax
fffff801`58b37778 7403            je      stornvme!GetRegistrySettings+0x211 (fffff801`58b3777d)  Branch

stornvme!GetRegistrySettings+0x20e:
fffff801`58b3777a 894320          mov     dword ptr [rbx+20h],eax

stornvme!GetRegistrySettings+0x211:
fffff801`58b3777d 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37781 4885c9          test    rcx,rcx
fffff801`58b37784 0f847d0c0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x21e:
fffff801`58b3778a 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b3778d 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37790 e8bbd7feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37795 488d4507        lea     rax,[rbp+7]
fffff801`58b37799 897507          mov     dword ptr [rbp+7],esi
fffff801`58b3779c 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b377a1 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b377a5 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b377a9 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b377ad 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b377b2 488d15273c0000  lea     rdx,[stornvme!`string`+0x50 (fffff801`58b3b3e0)]          ;'IoSubmissionQueueCount'
fffff801`58b377b9 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b377bd 488bcb          mov     rcx,rbx
fffff801`58b377c0 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b377c5 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b377c9 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b377ce e8650c0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b377d3 413ac6          cmp     al,r14b
fffff801`58b377d6 750b            jne     stornvme!GetRegistrySettings+0x277 (fffff801`58b377e3)  Branch

stornvme!GetRegistrySettings+0x26c:
fffff801`58b377d8 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b377db 85c0            test    eax,eax
fffff801`58b377dd 7404            je      stornvme!GetRegistrySettings+0x277 (fffff801`58b377e3)  Branch

stornvme!GetRegistrySettings+0x273:
fffff801`58b377df 66894324        mov     word ptr [rbx+24h],ax

stornvme!GetRegistrySettings+0x277:
fffff801`58b377e3 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b377e7 4885c9          test    rcx,rcx
fffff801`58b377ea 0f84170c0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x284:
fffff801`58b377f0 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b377f3 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b377f6 e855d7feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b377fb 488d4507        lea     rax,[rbp+7]
fffff801`58b377ff 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37802 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37807 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b3780b 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b3780f 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37813 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37818 488d15e13c0000  lea     rdx,[stornvme!`string`+0x170 (fffff801`58b3b500)]     ;'IoCompletionQueueCount'
fffff801`58b3781f 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37823 488bcb          mov     rcx,rbx
fffff801`58b37826 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b3782b 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b3782f 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37834 e8ff0b0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37839 413ac6          cmp     al,r14b
fffff801`58b3783c 750b            jne     stornvme!GetRegistrySettings+0x2dd (fffff801`58b37849)  Branch

stornvme!GetRegistrySettings+0x2d2:
fffff801`58b3783e 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37841 85c0            test    eax,eax
fffff801`58b37843 7404            je      stornvme!GetRegistrySettings+0x2dd (fffff801`58b37849)  Branch

stornvme!GetRegistrySettings+0x2d9:
fffff801`58b37845 66894326        mov     word ptr [rbx+26h],ax

stornvme!GetRegistrySettings+0x2dd:
fffff801`58b37849 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b3784d 4885c9          test    rcx,rcx
fffff801`58b37850 0f84b10b0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x2ea:
fffff801`58b37856 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37859 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b3785c e8efd6feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37861 488d4507        lea     rax,[rbp+7]
fffff801`58b37865 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37868 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b3786d 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37871 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37875 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37879 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b3787e 488d15333c0000  lea     rdx,[stornvme!`string`+0x128 (fffff801`58b3b4b8)]         ;'InterruptCoalescingTime'
fffff801`58b37885 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37889 488bcb          mov     rcx,rbx
fffff801`58b3788c 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37891 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37895 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b3789a e8990b0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b3789f 413ac6          cmp     al,r14b
fffff801`58b378a2 750a            jne     stornvme!GetRegistrySettings+0x342 (fffff801`58b378ae)  Branch

stornvme!GetRegistrySettings+0x338:
fffff801`58b378a4 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b378a7 85c0            test    eax,eax
fffff801`58b378a9 7403            je      stornvme!GetRegistrySettings+0x342 (fffff801`58b378ae)  Branch

stornvme!GetRegistrySettings+0x33f:
fffff801`58b378ab 884328          mov     byte ptr [rbx+28h],al

stornvme!GetRegistrySettings+0x342:
fffff801`58b378ae 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b378b2 4885c9          test    rcx,rcx
fffff801`58b378b5 0f844c0b0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x34f:
fffff801`58b378bb 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b378be 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b378c1 e88ad6feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b378c6 488d4507        lea     rax,[rbp+7]
fffff801`58b378ca 897507          mov     dword ptr [rbp+7],esi
fffff801`58b378cd 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b378d2 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b378d6 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b378da 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b378de 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b378e3 488d15263b0000  lea     rdx,[stornvme!`string`+0x80 (fffff801`58b3b410)]      ;'InterruptCoalescingEntry'
fffff801`58b378ea 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b378ee 488bcb          mov     rcx,rbx
fffff801`58b378f1 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b378f6 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b378fa 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b378ff e8340b0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37904 413ac6          cmp     al,r14b
fffff801`58b37907 750a            jne     stornvme!GetRegistrySettings+0x3a7 (fffff801`58b37913)  Branch

stornvme!GetRegistrySettings+0x39d:
fffff801`58b37909 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b3790c 85c0            test    eax,eax
fffff801`58b3790e 7403            je      stornvme!GetRegistrySettings+0x3a7 (fffff801`58b37913)  Branch

stornvme!GetRegistrySettings+0x3a4:
fffff801`58b37910 884329          mov     byte ptr [rbx+29h],al

stornvme!GetRegistrySettings+0x3a7:
fffff801`58b37913 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37917 4885c9          test    rcx,rcx
fffff801`58b3791a 0f84e70a0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x3b4:
fffff801`58b37920 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37923 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37926 e825d6feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b3792b 488d4507        lea     rax,[rbp+7]
fffff801`58b3792f 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37932 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37937 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b3793b 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b3793f 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37943 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37948 488d15b93c0000  lea     rdx,[stornvme!`string`+0x278 (fffff801`58b3b608)]     ;'ArbitrationBurst'
fffff801`58b3794f 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37953 488bcb          mov     rcx,rbx
fffff801`58b37956 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b3795b 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b3795f 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37964 e8cf0a0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37969 413ac6          cmp     al,r14b
fffff801`58b3796c 750a            jne     stornvme!GetRegistrySettings+0x40c (fffff801`58b37978)  Branch

stornvme!GetRegistrySettings+0x402:
fffff801`58b3796e 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37971 85c0            test    eax,eax
fffff801`58b37973 7403            je      stornvme!GetRegistrySettings+0x40c (fffff801`58b37978)  Branch

stornvme!GetRegistrySettings+0x409:
fffff801`58b37975 88432a          mov     byte ptr [rbx+2Ah],al

stornvme!GetRegistrySettings+0x40c:
fffff801`58b37978 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b3797c 4885c9          test    rcx,rcx
fffff801`58b3797f 0f84820a0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x419:
fffff801`58b37985 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37988 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b3798b e8c0d5feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37990 488d4507        lea     rax,[rbp+7]
fffff801`58b37994 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37997 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b3799c 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b379a0 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b379a4 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b379a8 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b379ad 488d15d43b0000  lea     rdx,[stornvme!`string`+0x1f8 (fffff801`58b3b588)]     ;'ContiguousMemoryFromAnyNode'
fffff801`58b379b4 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b379b8 488bcb          mov     rcx,rbx
fffff801`58b379bb 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b379c0 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b379c4 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b379c9 e86a0a0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b379ce 413ac6          cmp     al,r14b
fffff801`58b379d1 7509            jne     stornvme!GetRegistrySettings+0x470 (fffff801`58b379dc)  Branch

stornvme!GetRegistrySettings+0x467:
fffff801`58b379d3 397507          cmp     dword ptr [rbp+7],esi
fffff801`58b379d6 7404            je      stornvme!GetRegistrySettings+0x470 (fffff801`58b379dc)  Branch

stornvme!GetRegistrySettings+0x46c:
fffff801`58b379d8 834b3402        or      dword ptr [rbx+34h],2

stornvme!GetRegistrySettings+0x470:
fffff801`58b379dc 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b379e0 4885c9          test    rcx,rcx
fffff801`58b379e3 0f841e0a0000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x47d:
fffff801`58b379e9 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b379ec 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b379ef e85cd5feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b379f4 488d4507        lea     rax,[rbp+7]
fffff801`58b379f8 897507          mov     dword ptr [rbp+7],esi
fffff801`58b379fb 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37a00 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37a04 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37a08 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37a0c 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37a11 488d15503b0000  lea     rdx,[stornvme!`string`+0x1d8 (fffff801`58b3b568)]         ;'ShutdownTimeout'
fffff801`58b37a18 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37a1c 488bcb          mov     rcx,rbx
fffff801`58b37a1f 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37a24 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37a28 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37a2d e8060a0000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37a32 413ac6          cmp     al,r14b
fffff801`58b37a35 7511            jne     stornvme!GetRegistrySettings+0x4dc (fffff801`58b37a48)  Branch

stornvme!GetRegistrySettings+0x4cb:
fffff801`58b37a37 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37a3a 85c0            test    eax,eax
fffff801`58b37a3c 740a            je      stornvme!GetRegistrySettings+0x4dc (fffff801`58b37a48)  Branch

stornvme!GetRegistrySettings+0x4d2:
fffff801`58b37a3e 413bc7          cmp     eax,r15d
fffff801`58b37a41 410f47c7        cmova   eax,r15d
fffff801`58b37a45 88432b          mov     byte ptr [rbx+2Bh],al

stornvme!GetRegistrySettings+0x4dc:
fffff801`58b37a48 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37a4c 4885c9          test    rcx,rcx
fffff801`58b37a4f 0f84b2090000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x4e9:
fffff801`58b37a55 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37a58 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37a5b e8f0d4feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37a60 488d4507        lea     rax,[rbp+7]
fffff801`58b37a64 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37a67 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37a6c 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37a70 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37a74 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37a78 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37a7d 488d15cc3a0000  lea     rdx,[stornvme!`string`+0x1c0 (fffff801`58b3b550)]         ;'DeallocateMaxLbaCount'
fffff801`58b37a84 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37a88 488bcb          mov     rcx,rbx
fffff801`58b37a8b 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37a90 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37a94 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37a99 e89a090000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37a9e 413ac6          cmp     al,r14b
fffff801`58b37aa1 750a            jne     stornvme!GetRegistrySettings+0x541 (fffff801`58b37aad)  Branch

stornvme!GetRegistrySettings+0x537:
fffff801`58b37aa3 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37aa6 85c0            test    eax,eax
fffff801`58b37aa8 7403            je      stornvme!GetRegistrySettings+0x541 (fffff801`58b37aad)  Branch

stornvme!GetRegistrySettings+0x53e:
fffff801`58b37aaa 89432c          mov     dword ptr [rbx+2Ch],eax

stornvme!GetRegistrySettings+0x541:
fffff801`58b37aad 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37ab1 4885c9          test    rcx,rcx
fffff801`58b37ab4 0f844d090000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x54e:
fffff801`58b37aba 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37abd 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37ac0 e88bd4feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37ac5 488d4507        lea     rax,[rbp+7]
fffff801`58b37ac9 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37acc 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37ad1 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37ad5 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37ad9 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37add 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37ae2 488d15573b0000  lea     rdx,[stornvme!`string`+0x2b0 (fffff801`58b3b640)]             ;'DisableDeallocate'
fffff801`58b37ae9 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37aed 488bcb          mov     rcx,rbx
fffff801`58b37af0 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37af5 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37af9 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37afe e835090000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37b03 413ac6          cmp     al,r14b
fffff801`58b37b06 7509            jne     stornvme!GetRegistrySettings+0x5a5 (fffff801`58b37b11)  Branch

stornvme!GetRegistrySettings+0x59c:
fffff801`58b37b08 397507          cmp     dword ptr [rbp+7],esi
fffff801`58b37b0b 7404            je      stornvme!GetRegistrySettings+0x5a5 (fffff801`58b37b11)  Branch

stornvme!GetRegistrySettings+0x5a1:
fffff801`58b37b0d 44097334        or      dword ptr [rbx+34h],r14d

stornvme!GetRegistrySettings+0x5a5:
fffff801`58b37b11 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37b15 4885c9          test    rcx,rcx
fffff801`58b37b18 0f84e9080000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x5b2:
fffff801`58b37b1e 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37b21 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37b24 e827d4feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37b29 488d4507        lea     rax,[rbp+7]
fffff801`58b37b2d 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37b30 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37b35 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37b39 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37b3d 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37b41 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37b46 488d150b3b0000  lea     rdx,[stornvme!`string`+0x2c8 (fffff801`58b3b658)]         ;'ControllerBasicInit'
fffff801`58b37b4d 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37b51 488bcb          mov     rcx,rbx
fffff801`58b37b54 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37b59 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37b5d 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37b62 e8d1080000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37b67 413ac6          cmp     al,r14b
fffff801`58b37b6a 7509            jne     stornvme!GetRegistrySettings+0x609 (fffff801`58b37b75)  Branch

stornvme!GetRegistrySettings+0x600:
fffff801`58b37b6c 397507          cmp     dword ptr [rbp+7],esi
fffff801`58b37b6f 7404            je      stornvme!GetRegistrySettings+0x609 (fffff801`58b37b75)  Branch

stornvme!GetRegistrySettings+0x605:
fffff801`58b37b71 834b3404        or      dword ptr [rbx+34h],4

stornvme!GetRegistrySettings+0x609:
fffff801`58b37b75 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37b79 4885c9          test    rcx,rcx
fffff801`58b37b7c 0f8485080000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x616:
fffff801`58b37b82 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37b85 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37b88 e8c3d3feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37b8d 488d4507        lea     rax,[rbp+7]
fffff801`58b37b91 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37b94 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37b99 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37b9d 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37ba1 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37ba5 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37baa 488d15f7390000  lea     rdx,[stornvme!`string`+0x218 (fffff801`58b3b5a8)]             ;'AsyncEventMask'
fffff801`58b37bb1 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37bb5 488bcb          mov     rcx,rbx
fffff801`58b37bb8 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37bbd 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37bc1 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37bc6 e86d080000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37bcb 413ac6          cmp     al,r14b
fffff801`58b37bce 7510            jne     stornvme!GetRegistrySettings+0x674 (fffff801`58b37be0)  Branch

stornvme!GetRegistrySettings+0x664:
fffff801`58b37bd0 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37bd3 85c0            test    eax,eax
fffff801`58b37bd5 7409            je      stornvme!GetRegistrySettings+0x674 (fffff801`58b37be0)  Branch

stornvme!GetRegistrySettings+0x66b:
fffff801`58b37bd7 0fb6c0          movzx   eax,al
fffff801`58b37bda 83e01f          and     eax,1Fh
fffff801`58b37bdd 894338          mov     dword ptr [rbx+38h],eax

stornvme!GetRegistrySettings+0x674:
fffff801`58b37be0 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37be4 4885c9          test    rcx,rcx
fffff801`58b37be7 0f841a080000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x681:
fffff801`58b37bed 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37bf0 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37bf3 e858d3feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37bf8 488d4507        lea     rax,[rbp+7]
fffff801`58b37bfc 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37bff 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37c04 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37c08 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37c0c 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37c10 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37c15 488d15b4370000  lea     rdx,[stornvme!`string`+0x40 (fffff801`58b3b3d0)]              ;'IdlePowerMode'
fffff801`58b37c1c 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37c20 488bcb          mov     rcx,rbx
fffff801`58b37c23 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37c28 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37c2c 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37c31 e802080000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37c36 413ac6          cmp     al,r14b
fffff801`58b37c39 750b            jne     stornvme!GetRegistrySettings+0x6da (fffff801`58b37c46)  Branch

stornvme!GetRegistrySettings+0x6cf:
fffff801`58b37c3b 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37c3e 83f806          cmp     eax,6
fffff801`58b37c41 7303            jae     stornvme!GetRegistrySettings+0x6da (fffff801`58b37c46)  Branch

stornvme!GetRegistrySettings+0x6d7:
fffff801`58b37c43 89434c          mov     dword ptr [rbx+4Ch],eax

stornvme!GetRegistrySettings+0x6da:
fffff801`58b37c46 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37c4a 4885c9          test    rcx,rcx
fffff801`58b37c4d 0f84b4070000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x6e7:
fffff801`58b37c53 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37c56 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37c59 e8f2d2feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37c5e 488d4507        lea     rax,[rbp+7]
fffff801`58b37c62 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37c65 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37c6a 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37c6e 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37c72 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37c76 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37c7b 488d154e390000  lea     rdx,[stornvme!`string`+0x240 (fffff801`58b3b5d0)]             ;'DiagnosticFlags'
fffff801`58b37c82 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37c86 488bcb          mov     rcx,rbx
fffff801`58b37c89 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37c8e 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37c92 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37c97 e89c070000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37c9c 413ac6          cmp     al,r14b
fffff801`58b37c9f 750a            jne     stornvme!GetRegistrySettings+0x73f (fffff801`58b37cab)  Branch

stornvme!GetRegistrySettings+0x735:
fffff801`58b37ca1 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37ca4 85c0            test    eax,eax
fffff801`58b37ca6 7403            je      stornvme!GetRegistrySettings+0x73f (fffff801`58b37cab)  Branch

stornvme!GetRegistrySettings+0x73c:
fffff801`58b37ca8 894368          mov     dword ptr [rbx+68h],eax

stornvme!GetRegistrySettings+0x73f:
fffff801`58b37cab 8b4368          mov     eax,dword ptr [rbx+68h]
fffff801`58b37cae a802            test    al,2
fffff801`58b37cb0 7407            je      stornvme!GetRegistrySettings+0x74d (fffff801`58b37cb9)  Branch

stornvme!GetRegistrySettings+0x746:
fffff801`58b37cb2 c7436c00001000  mov     dword ptr [rbx+6Ch],100000h

stornvme!GetRegistrySettings+0x74d:
fffff801`58b37cb9 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37cbd 4885c9          test    rcx,rcx
fffff801`58b37cc0 0f8441070000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x75a:
fffff801`58b37cc6 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37cc9 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37ccc e87fd2feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37cd1 488d4507        lea     rax,[rbp+7]
fffff801`58b37cd5 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37cd8 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37cdd 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37ce1 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37ce5 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37ce9 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37cee 488d1533380000  lea     rdx,[stornvme!`string`+0x198 (fffff801`58b3b528)]             ;'LogSize'
fffff801`58b37cf5 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37cf9 488bcb          mov     rcx,rbx
fffff801`58b37cfc 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37d01 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37d05 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37d0a e829070000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37d0f 413ac6          cmp     al,r14b
fffff801`58b37d12 750d            jne     stornvme!GetRegistrySettings+0x7b5 (fffff801`58b37d21)  Branch

stornvme!GetRegistrySettings+0x7a8:
fffff801`58b37d14 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37d17 85c0            test    eax,eax
fffff801`58b37d19 7406            je      stornvme!GetRegistrySettings+0x7b5 (fffff801`58b37d21)  Branch

stornvme!GetRegistrySettings+0x7af:
fffff801`58b37d1b c1e00a          shl     eax,0Ah
fffff801`58b37d1e 89436c          mov     dword ptr [rbx+6Ch],eax

stornvme!GetRegistrySettings+0x7b5:
fffff801`58b37d21 8b4b6c          mov     ecx,dword ptr [rbx+6Ch]
fffff801`58b37d24 48b8abaaaaaaaaaaaaaa mov rax,0AAAAAAAAAAAAAAABh
fffff801`58b37d2e 48f7e1          mul     rax,rcx
fffff801`58b37d31 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37d35 48c1ea04        shr     rdx,4
fffff801`58b37d39 8993bc0e0000    mov     dword ptr [rbx+0EBCh],edx
fffff801`58b37d3f 4885c9          test    rcx,rcx
fffff801`58b37d42 0f84bf060000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x7dc:
fffff801`58b37d48 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37d4b 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37d4e e8fdd1feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37d53 488d4507        lea     rax,[rbp+7]
fffff801`58b37d57 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37d5a 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37d5f 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37d63 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37d67 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37d6b 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37d70 488d1541380000  lea     rdx,[stornvme!`string`+0x228 (fffff801`58b3b5b8)]             ;'IoStripeAlignment'
fffff801`58b37d77 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37d7b 488bcb          mov     rcx,rbx
fffff801`58b37d7e 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37d83 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37d87 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37d8c e8a7060000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37d91 413ac6          cmp     al,r14b
fffff801`58b37d94 7514            jne     stornvme!GetRegistrySettings+0x83e (fffff801`58b37daa)  Branch

stornvme!GetRegistrySettings+0x82a:
fffff801`58b37d96 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37d99 85c0            test    eax,eax
fffff801`58b37d9b 740d            je      stornvme!GetRegistrySettings+0x83e (fffff801`58b37daa)  Branch

stornvme!GetRegistrySettings+0x831:
fffff801`58b37d9d c1e00a          shl     eax,0Ah
fffff801`58b37da0 a9ff0f0000      test    eax,0FFFh
fffff801`58b37da5 7503            jne     stornvme!GetRegistrySettings+0x83e (fffff801`58b37daa)  Branch

stornvme!GetRegistrySettings+0x83b:
fffff801`58b37da7 894330          mov     dword ptr [rbx+30h],eax

stornvme!GetRegistrySettings+0x83e:
fffff801`58b37daa 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37dae 4885c9          test    rcx,rcx
fffff801`58b37db1 0f8450060000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x84b:
fffff801`58b37db7 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37dba 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37dbd e88ed1feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37dc2 488d4507        lea     rax,[rbp+7]
fffff801`58b37dc6 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37dc9 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37dce 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37dd2 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37dd6 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37dda 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37ddf 488d15ea360000  lea     rdx,[stornvme!`string`+0x140 (fffff801`58b3b4d0)]
fffff801`58b37de6 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37dea 488bcb          mov     rcx,rbx
fffff801`58b37ded 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37df2 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37df6 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37dfb e838060000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37e00 413ac6          cmp     al,r14b
fffff801`58b37e03 7506            jne     stornvme!GetRegistrySettings+0x89f (fffff801`58b37e0b)  Branch

stornvme!GetRegistrySettings+0x899:
fffff801`58b37e05 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37e08 894350          mov     dword ptr [rbx+50h],eax

stornvme!GetRegistrySettings+0x89f:
fffff801`58b37e0b 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37e0f 4885c9          test    rcx,rcx
fffff801`58b37e12 0f84ef050000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x8ac:
fffff801`58b37e18 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37e1b 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37e1e e82dd1feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37e23 488d4507        lea     rax,[rbp+7]
fffff801`58b37e27 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37e2a 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37e2f 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37e33 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37e37 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37e3b 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37e40 488d15e9350000  lea     rdx,[stornvme!`string`+0xa0 (fffff801`58b3b430)]
fffff801`58b37e47 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37e4b 488bcb          mov     rcx,rbx
fffff801`58b37e4e 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37e53 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37e57 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37e5c e8d7050000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37e61 413ac6          cmp     al,r14b
fffff801`58b37e64 7506            jne     stornvme!GetRegistrySettings+0x900 (fffff801`58b37e6c)  Branch

stornvme!GetRegistrySettings+0x8fa:
fffff801`58b37e66 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37e69 894354          mov     dword ptr [rbx+54h],eax

stornvme!GetRegistrySettings+0x900:
fffff801`58b37e6c 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37e70 4885c9          test    rcx,rcx
fffff801`58b37e73 0f848e050000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x90d:
fffff801`58b37e79 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37e7c 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37e7f e8ccd0feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37e84 488d4507        lea     rax,[rbp+7]
fffff801`58b37e88 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37e8b 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37e90 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37e94 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37e98 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37e9c 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37ea1 488d1550350000  lea     rdx,[stornvme!`string`+0x68 (fffff801`58b3b3f8)]
fffff801`58b37ea8 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37eac 488bcb          mov     rcx,rbx
fffff801`58b37eaf 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37eb4 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37eb8 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37ebd e876050000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37ec2 413ac6          cmp     al,r14b
fffff801`58b37ec5 7506            jne     stornvme!GetRegistrySettings+0x961 (fffff801`58b37ecd)  Branch

stornvme!GetRegistrySettings+0x95b:
fffff801`58b37ec7 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37eca 894358          mov     dword ptr [rbx+58h],eax

stornvme!GetRegistrySettings+0x961:
fffff801`58b37ecd 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37ed1 4885c9          test    rcx,rcx
fffff801`58b37ed4 0f842d050000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x96e:
fffff801`58b37eda 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37edd 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37ee0 e86bd0feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37ee5 488d4507        lea     rax,[rbp+7]
fffff801`58b37ee9 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37eec 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37ef1 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37ef5 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37ef9 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37efd 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37f02 488d157f350000  lea     rdx,[stornvme!`string`+0xf8 (fffff801`58b3b488)]
fffff801`58b37f09 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37f0d 488bcb          mov     rcx,rbx
fffff801`58b37f10 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37f15 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37f19 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37f1e e815050000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37f23 413ac6          cmp     al,r14b
fffff801`58b37f26 7506            jne     stornvme!GetRegistrySettings+0x9c2 (fffff801`58b37f2e)  Branch

stornvme!GetRegistrySettings+0x9bc:
fffff801`58b37f28 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37f2b 89435c          mov     dword ptr [rbx+5Ch],eax

stornvme!GetRegistrySettings+0x9c2:
fffff801`58b37f2e 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37f32 4885c9          test    rcx,rcx
fffff801`58b37f35 0f84cc040000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0x9cf:
fffff801`58b37f3b 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37f3e 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37f41 e80ad0feff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37f46 488d4507        lea     rax,[rbp+7]
fffff801`58b37f4a 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37f4d 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37f52 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37f56 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37f5a 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37f5e 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37f63 488d157e350000  lea     rdx,[stornvme!`string`+0x158 (fffff801`58b3b4e8)]
fffff801`58b37f6a 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37f6e 488bcb          mov     rcx,rbx
fffff801`58b37f71 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37f76 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37f7a 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37f7f e8b4040000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37f84 413ac6          cmp     al,r14b
fffff801`58b37f87 7506            jne     stornvme!GetRegistrySettings+0xa23 (fffff801`58b37f8f)  Branch

stornvme!GetRegistrySettings+0xa1d:
fffff801`58b37f89 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37f8c 894360          mov     dword ptr [rbx+60h],eax

stornvme!GetRegistrySettings+0xa23:
fffff801`58b37f8f 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37f93 4885c9          test    rcx,rcx
fffff801`58b37f96 0f846b040000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xa30:
fffff801`58b37f9c 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b37f9f 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b37fa2 e8a9cffeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b37fa7 488d4507        lea     rax,[rbp+7]
fffff801`58b37fab 897507          mov     dword ptr [rbp+7],esi
fffff801`58b37fae 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b37fb3 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b37fb7 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b37fbb 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b37fbf 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b37fc4 488d15e5330000  lea     rdx,[stornvme!`string`+0x20 (fffff801`58b3b3b0)]
fffff801`58b37fcb 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b37fcf 488bcb          mov     rcx,rbx
fffff801`58b37fd2 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b37fd7 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b37fdb 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b37fe0 e853040000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b37fe5 413ac6          cmp     al,r14b
fffff801`58b37fe8 7506            jne     stornvme!GetRegistrySettings+0xa84 (fffff801`58b37ff0)  Branch

stornvme!GetRegistrySettings+0xa7e:
fffff801`58b37fea 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b37fed 894364          mov     dword ptr [rbx+64h],eax

stornvme!GetRegistrySettings+0xa84:
fffff801`58b37ff0 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b37ff4 4885c9          test    rcx,rcx
fffff801`58b37ff7 0f840a040000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xa91:
fffff801`58b37ffd 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b38000 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b38003 e848cffeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b38008 488d4507        lea     rax,[rbp+7]
fffff801`58b3800c 897507          mov     dword ptr [rbp+7],esi
fffff801`58b3800f 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b38014 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b38018 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b3801c 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b38020 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b38025 488d1534340000  lea     rdx,[stornvme!`string`+0xd0 (fffff801`58b3b460)]
fffff801`58b3802c 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b38030 488bcb          mov     rcx,rbx
fffff801`58b38033 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b38038 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b3803c 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b38041 e8f2030000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b38046 413ac6          cmp     al,r14b
fffff801`58b38049 7506            jne     stornvme!GetRegistrySettings+0xae5 (fffff801`58b38051)  Branch

stornvme!GetRegistrySettings+0xadf:
fffff801`58b3804b 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b3804e 894370          mov     dword ptr [rbx+70h],eax

stornvme!GetRegistrySettings+0xae5:
fffff801`58b38051 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b38055 4885c9          test    rcx,rcx
fffff801`58b38058 0f84a9030000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xaf2:
fffff801`58b3805e 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b38061 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b38064 e8e7cefeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b38069 488d4507        lea     rax,[rbp+7]
fffff801`58b3806d 897507          mov     dword ptr [rbp+7],esi
fffff801`58b38070 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b38075 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b38079 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b3807d 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b38081 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b38086 488d15eb340000  lea     rdx,[stornvme!`string`+0x1e8 (fffff801`58b3b578)]
fffff801`58b3808d 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b38091 488bcb          mov     rcx,rbx
fffff801`58b38094 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b38099 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b3809d 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b380a2 e891030000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b380a7 413ac6          cmp     al,r14b
fffff801`58b380aa 750f            jne     stornvme!GetRegistrySettings+0xb4f (fffff801`58b380bb)  Branch

stornvme!GetRegistrySettings+0xb40:
fffff801`58b380ac 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b380af c1e003          shl     eax,3
fffff801`58b380b2 334334          xor     eax,dword ptr [rbx+34h]
fffff801`58b380b5 83e008          and     eax,8
fffff801`58b380b8 314334          xor     dword ptr [rbx+34h],eax

stornvme!GetRegistrySettings+0xb4f:
fffff801`58b380bb 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b380bf 4885c9          test    rcx,rcx
fffff801`58b380c2 0f843f030000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xb5c:
fffff801`58b380c8 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b380cb 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b380ce e87dcefeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b380d3 488d4507        lea     rax,[rbp+7]
fffff801`58b380d7 897507          mov     dword ptr [rbp+7],esi
fffff801`58b380da 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b380df 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b380e3 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b380e7 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b380eb 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b380f0 488d1539340000  lea     rdx,[stornvme!`string`+0x1a0 (fffff801`58b3b530)]
fffff801`58b380f7 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b380fb 488bcb          mov     rcx,rbx
fffff801`58b380fe 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b38103 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b38107 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b3810c e827030000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b38111 413ac6          cmp     al,r14b
fffff801`58b38114 7506            jne     stornvme!GetRegistrySettings+0xbb0 (fffff801`58b3811c)  Branch

stornvme!GetRegistrySettings+0xbaa:
fffff801`58b38116 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b38119 894374          mov     dword ptr [rbx+74h],eax

stornvme!GetRegistrySettings+0xbb0:
fffff801`58b3811c 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b38120 4885c9          test    rcx,rcx
fffff801`58b38123 0f84de020000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xbbd:
fffff801`58b38129 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b3812c 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b3812f e81ccefeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b38134 4889742440      mov     qword ptr [rsp+40h],rsi
fffff801`58b38139 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b3813d 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b38141 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b38145 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b3814a 488d15ff320000  lea     rdx,[stornvme!`string`+0xc0 (fffff801`58b3b450)]
fffff801`58b38151 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b38155 488bcb          mov     rcx,rbx
fffff801`58b38158 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b3815d 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b38161 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b38166 e8cd020000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b3816b 413ac6          cmp     al,r14b
fffff801`58b3816e 7504            jne     stornvme!GetRegistrySettings+0xc08 (fffff801`58b38174)  Branch

stornvme!GetRegistrySettings+0xc04:
fffff801`58b38170 834b3410        or      dword ptr [rbx+34h],10h

stornvme!GetRegistrySettings+0xc08:
fffff801`58b38174 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b38178 4885c9          test    rcx,rcx
fffff801`58b3817b 0f8486020000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xc15:
fffff801`58b38181 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b38184 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b38187 e8c4cdfeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b3818c 488d4507        lea     rax,[rbp+7]
fffff801`58b38190 897507          mov     dword ptr [rbp+7],esi
fffff801`58b38193 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b38198 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b3819c 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b381a0 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b381a4 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b381a9 488d1530340000  lea     rdx,[stornvme!`string`+0x250 (fffff801`58b3b5e0)]
fffff801`58b381b0 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b381b4 488bcb          mov     rcx,rbx
fffff801`58b381b7 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b381bc 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b381c0 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b381c5 e86e020000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b381ca 413ac6          cmp     al,r14b
fffff801`58b381cd 7510            jne     stornvme!GetRegistrySettings+0xc73 (fffff801`58b381df)  Branch

stornvme!GetRegistrySettings+0xc63:
fffff801`58b381cf 8b4d07          mov     ecx,dword ptr [rbp+7]
fffff801`58b381d2 8d41ff          lea     eax,[rcx-1]
fffff801`58b381d5 3dfeff0000      cmp     eax,0FFFEh
fffff801`58b381da 7703            ja      stornvme!GetRegistrySettings+0xc73 (fffff801`58b381df)  Branch

stornvme!GetRegistrySettings+0xc70:
fffff801`58b381dc 894b78          mov     dword ptr [rbx+78h],ecx

stornvme!GetRegistrySettings+0xc73:
fffff801`58b381df 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b381e3 4885c9          test    rcx,rcx
fffff801`58b381e6 0f841b020000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xc80:
fffff801`58b381ec 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b381ef 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b381f2 e859cdfeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b381f7 488d4507        lea     rax,[rbp+7]
fffff801`58b381fb 897507          mov     dword ptr [rbp+7],esi
fffff801`58b381fe 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b38203 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b38207 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b3820b 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b3820f 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b38214 488d155d320000  lea     rdx,[stornvme!`string`+0xe8 (fffff801`58b3b478)]
fffff801`58b3821b 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b3821f 488bcb          mov     rcx,rbx
fffff801`58b38222 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b38227 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b3822b 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b38230 e803020000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b38235 413ac6          cmp     al,r14b
fffff801`58b38238 750a            jne     stornvme!GetRegistrySettings+0xcd8 (fffff801`58b38244)  Branch

stornvme!GetRegistrySettings+0xcce:
fffff801`58b3823a 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b3823d 85c0            test    eax,eax
fffff801`58b3823f 7403            je      stornvme!GetRegistrySettings+0xcd8 (fffff801`58b38244)  Branch

stornvme!GetRegistrySettings+0xcd5:
fffff801`58b38241 89437c          mov     dword ptr [rbx+7Ch],eax

stornvme!GetRegistrySettings+0xcd8:
fffff801`58b38244 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b38248 4885c9          test    rcx,rcx
fffff801`58b3824b 0f84b6010000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xce5:
fffff801`58b38251 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b38254 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b38257 e8f4ccfeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b3825c 488d4507        lea     rax,[rbp+7]
fffff801`58b38260 897507          mov     dword ptr [rbp+7],esi
fffff801`58b38263 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b38268 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b3826c 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b38270 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b38274 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b38279 488d15a0330000  lea     rdx,[stornvme!`string`+0x290 (fffff801`58b3b620)]
fffff801`58b38280 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b38284 488bcb          mov     rcx,rbx
fffff801`58b38287 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b3828c 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b38290 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b38295 e89e010000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b3829a 413ac6          cmp     al,r14b
fffff801`58b3829d 7516            jne     stornvme!GetRegistrySettings+0xd49 (fffff801`58b382b5)  Branch

stornvme!GetRegistrySettings+0xd33:
fffff801`58b3829f 837d0764        cmp     dword ptr [rbp+7],64h
fffff801`58b382a3 7609            jbe     stornvme!GetRegistrySettings+0xd42 (fffff801`58b382ae)  Branch

stornvme!GetRegistrySettings+0xd39:
fffff801`58b382a5 c7433c64000000  mov     dword ptr [rbx+3Ch],64h
fffff801`58b382ac eb07            jmp     stornvme!GetRegistrySettings+0xd49 (fffff801`58b382b5)  Branch

stornvme!GetRegistrySettings+0xd42:
fffff801`58b382ae 0fb74507        movzx   eax,word ptr [rbp+7]
fffff801`58b382b2 89433c          mov     dword ptr [rbx+3Ch],eax

stornvme!GetRegistrySettings+0xd49:
fffff801`58b382b5 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b382b9 4885c9          test    rcx,rcx
fffff801`58b382bc 0f8445010000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xd56:
fffff801`58b382c2 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b382c5 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b382c8 e883ccfeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b382cd 488d4507        lea     rax,[rbp+7]
fffff801`58b382d1 897507          mov     dword ptr [rbp+7],esi
fffff801`58b382d4 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b382d9 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b382dd 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b382e1 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b382e5 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b382ea 488d157f330000  lea     rdx,[stornvme!`string`+0x2e0 (fffff801`58b3b670)]
fffff801`58b382f1 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b382f5 488bcb          mov     rcx,rbx
fffff801`58b382f8 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b382fd 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b38301 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b38306 e82d010000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b3830b 413ac6          cmp     al,r14b
fffff801`58b3830e 750f            jne     stornvme!GetRegistrySettings+0xdb3 (fffff801`58b3831f)  Branch

stornvme!GetRegistrySettings+0xda4:
fffff801`58b38310 b8a0860100      mov     eax,186A0h
fffff801`58b38315 394507          cmp     dword ptr [rbp+7],eax
fffff801`58b38318 0f424507        cmovb   eax,dword ptr [rbp+7]
fffff801`58b3831c 894340          mov     dword ptr [rbx+40h],eax

stornvme!GetRegistrySettings+0xdb3:
fffff801`58b3831f 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b38323 4885c9          test    rcx,rcx
fffff801`58b38326 0f84db000000    je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xdc0:
fffff801`58b3832c 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b3832f 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b38332 e819ccfeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b38337 488d4507        lea     rax,[rbp+7]
fffff801`58b3833b 897507          mov     dword ptr [rbp+7],esi
fffff801`58b3833e 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b38343 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b38347 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b3834b 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b3834f 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b38354 488d152d330000  lea     rdx,[stornvme!`string`+0x2f8 (fffff801`58b3b688)]
fffff801`58b3835b 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b3835f 488bcb          mov     rcx,rbx
fffff801`58b38362 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b38367 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b3836b 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b38370 e8c3000000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b38375 413ac6          cmp     al,r14b
fffff801`58b38378 7514            jne     stornvme!GetRegistrySettings+0xe22 (fffff801`58b3838e)  Branch

stornvme!GetRegistrySettings+0xe0e:
fffff801`58b3837a 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b3837d 85c0            test    eax,eax
fffff801`58b3837f 740d            je      stornvme!GetRegistrySettings+0xe22 (fffff801`58b3838e)  Branch

stornvme!GetRegistrySettings+0xe15:
fffff801`58b38381 b980000000      mov     ecx,80h
fffff801`58b38386 3bc1            cmp     eax,ecx
fffff801`58b38388 0f47c1          cmova   eax,ecx
fffff801`58b3838b 894344          mov     dword ptr [rbx+44h],eax

stornvme!GetRegistrySettings+0xe22:
fffff801`58b3838e 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff801`58b38392 4885c9          test    rcx,rcx
fffff801`58b38395 7470            je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xe2b:
fffff801`58b38397 8b550b          mov     edx,dword ptr [rbp+0Bh]
fffff801`58b3839a 89550f          mov     dword ptr [rbp+0Fh],edx
fffff801`58b3839d e8aecbfeff      call    stornvme!NVMeZeroMemory (fffff801`58b24f50)
fffff801`58b383a2 488d4507        lea     rax,[rbp+7]
fffff801`58b383a6 897507          mov     dword ptr [rbp+7],esi
fffff801`58b383a9 4889442440      mov     qword ptr [rsp+40h],rax
fffff801`58b383ae 4c8d4d17        lea     r9,[rbp+17h]
fffff801`58b383b2 897c2438        mov     dword ptr [rsp+38h],edi
fffff801`58b383b6 488d451f        lea     rax,[rbp+1Fh]
fffff801`58b383ba 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`58b383bf 488d15e2300000  lea     rdx,[stornvme!`string`+0x118 (fffff801`58b3b4a8)]
fffff801`58b383c6 488d450f        lea     rax,[rbp+0Fh]
fffff801`58b383ca 488bcb          mov     rcx,rbx
fffff801`58b383cd 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`58b383d2 488d450b        lea     rax,[rbp+0Bh]
fffff801`58b383d6 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`58b383db e858000000      call    stornvme!ReadMultiSzRegistryValueAndCompareId (fffff801`58b38438)
fffff801`58b383e0 413ac6          cmp     al,r14b
fffff801`58b383e3 750a            jne     stornvme!GetRegistrySettings+0xe83 (fffff801`58b383ef)  Branch

stornvme!GetRegistrySettings+0xe79:
fffff801`58b383e5 8b4507          mov     eax,dword ptr [rbp+7]
fffff801`58b383e8 85c0            test    eax,eax
fffff801`58b383ea 7403            je      stornvme!GetRegistrySettings+0xe83 (fffff801`58b383ef)  Branch

stornvme!GetRegistrySettings+0xe80:
fffff801`58b383ec 894348          mov     dword ptr [rbx+48h],eax

stornvme!GetRegistrySettings+0xe83:
fffff801`58b383ef 488b5517        mov     rdx,qword ptr [rbp+17h]
fffff801`58b383f3 4885d2          test    rdx,rdx
fffff801`58b383f6 740f            je      stornvme!GetRegistrySettings+0xe9b (fffff801`58b38407)  Branch

stornvme!GetRegistrySettings+0xe8c:
fffff801`58b383f8 488bcb          mov     rcx,rbx
fffff801`58b383fb 48ff15766c0000  call    qword ptr [stornvme!_imp_StorPortFreeRegistryBuffer (fffff801`58b3f078)]
fffff801`58b38402 0f1f440000      nop     dword ptr [rax+rax]

stornvme!GetRegistrySettings+0xe9b:
fffff801`58b38407 488b4d3f        mov     rcx,qword ptr [rbp+3Fh]
fffff801`58b3840b 4833cc          xor     rcx,rsp
fffff801`58b3840e e85ddcfeff      call    stornvme!_security_check_cookie (fffff801`58b26070)
fffff801`58b38413 4c8d9c2490000000 lea     r11,[rsp+90h]
fffff801`58b3841b 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff801`58b3841f 498b7330        mov     rsi,qword ptr [r11+30h]
fffff801`58b38423 498b7b38        mov     rdi,qword ptr [r11+38h]
fffff801`58b38427 498be3          mov     rsp,r11
fffff801`58b3842a 415f            pop     r15
fffff801`58b3842c 415e            pop     r14
fffff801`58b3842e 5d              pop     rbp
fffff801`58b3842f c3              ret
