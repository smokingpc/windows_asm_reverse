;PciBuildRequirementsList(PDO_DEVEXT, PVOID *ret_buffer)

0: kd> uf pci!PciBuildRequirementsList
pci!PciBuildRequirementsList:
fffff80f`dc10f640 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff80f`dc10f645 55              push    rbp
fffff80f`dc10f646 56              push    rsi
fffff80f`dc10f647 57              push    rdi
fffff80f`dc10f648 4154            push    r12
fffff80f`dc10f64a 4155            push    r13
fffff80f`dc10f64c 4156            push    r14
fffff80f`dc10f64e 4157            push    r15
fffff80f`dc10f650 488dac24c0feffff lea     rbp,[rsp-140h]
fffff80f`dc10f658 4881ec40020000  sub     rsp,240h
fffff80f`dc10f65f 488b05cacbfeff  mov     rax,qword ptr [pci!_security_cookie (fffff80f`dc0fc230)]
fffff80f`dc10f666 4833c4          xor     rax,rsp
fffff80f`dc10f669 48898530010000  mov     qword ptr [rbp+130h],rax
fffff80f`dc10f670 4533e4          xor     r12d,r12d
fffff80f`dc10f673 48894da0        mov     qword ptr [rbp-60h],rcx
fffff80f`dc10f677 4c8922          mov     qword ptr [rdx],r12
fffff80f`dc10f67a 4c8d4c2450      lea     r9,[rsp+50h]
fffff80f`dc10f67f 8b591c          mov     ebx,dword ptr [rcx+1Ch]
fffff80f`dc10f682 4c8be9          mov     r13,rcx
fffff80f`dc10f685 488b4950        mov     rcx,qword ptr [rcx+50h]
fffff80f`dc10f689 41b81f000200    mov     r8d,2001Fh
fffff80f`dc10f68f 488955b8        mov     qword ptr [rbp-48h],rdx
fffff80f`dc10f693 418d542401      lea     edx,[r12+1]   ;edx == 1 == PLUGPLAY_REGKEY_DEVICE
fffff80f`dc10f698 4c89642450      mov     qword ptr [rsp+50h],r12
fffff80f`dc10f69d 488b89e8000000  mov     rcx,qword ptr [rcx+0E8h]  ;devobj
fffff80f`dc10f6a4 48ff15753affff  call    qword ptr [pci!_imp_IoOpenDeviceRegistryKey (fffff80f`dc103120)] 
fffff80f`dc10f6ab 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f6b0 8bf8            mov     edi,eax
fffff80f`dc10f6b2 85c0            test    eax,eax
fffff80f`dc10f6b4 0f8803020000    js      pci!PciBuildRequirementsList+0x27d (fffff80f`dc10f8bd)  Branch

pci!PciBuildRequirementsList+0x7a:
fffff80f`dc10f6ba 8bc3            mov     eax,ebx
fffff80f`dc10f6bc 4c8d052d38feff  lea     r8,[pci!`string` (fffff80f`dc0f2ef0)]
fffff80f`dc10f6c3 c1e805          shr     eax,5
fffff80f`dc10f6c6 418d54241c      lea     edx,[r12+1Ch]
fffff80f`dc10f6cb 83e007          and     eax,7
fffff80f`dc10f6ce 488d8d10010000  lea     rcx,[rbp+110h]
fffff80f`dc10f6d5 83e31f          and     ebx,1Fh
fffff80f`dc10f6d8 89442420        mov     dword ptr [rsp+20h],eax
fffff80f`dc10f6dc 448bcb          mov     r9d,ebx
fffff80f`dc10f6df e84c3efcff      call    pci!RtlStringCbPrintfW (fffff80f`dc0d3530)
fffff80f`dc10f6e4 8bf8            mov     edi,eax
fffff80f`dc10f6e6 85c0            test    eax,eax
fffff80f`dc10f6e8 0f88cf010000    js      pci!PciBuildRequirementsList+0x27d (fffff80f`dc10f8bd)  Branch

pci!PciBuildRequirementsList+0xae:
fffff80f`dc10f6ee 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff80f`dc10f6f3 488d15be37feff  lea     rdx,[pci!`string` (fffff80f`dc0f2eb8)]
fffff80f`dc10f6fa 488d4da8        lea     rcx,[rbp-58h]
fffff80f`dc10f6fe 4c89642440      mov     qword ptr [rsp+40h],r12
fffff80f`dc10f703 458bfc          mov     r15d,r12d
fffff80f`dc10f706 4489642434      mov     dword ptr [rsp+34h],r12d
fffff80f`dc10f70b 4489642448      mov     dword ptr [rsp+48h],r12d
fffff80f`dc10f710 418bf4          mov     esi,r12d
fffff80f`dc10f713 458bf4          mov     r14d,r12d
fffff80f`dc10f716 48ff15b33bffff  call    qword ptr [pci!_imp_RtlInitUnicodeString (fffff80f`dc1032d0)]
fffff80f`dc10f71d 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f722 488d45a8        lea     rax,[rbp-58h]
fffff80f`dc10f726 c745c030000000  mov     dword ptr [rbp-40h],30h
fffff80f`dc10f72d 0f57c0          xorps   xmm0,xmm0
fffff80f`dc10f730 488945d0        mov     qword ptr [rbp-30h],rax
fffff80f`dc10f734 4c8d45c0        lea     r8,[rbp-40h]
fffff80f`dc10f738 48895dc8        mov     qword ptr [rbp-38h],rbx
fffff80f`dc10f73c ba19000200      mov     edx,20019h
fffff80f`dc10f741 c745d840020000  mov     dword ptr [rbp-28h],240h
fffff80f`dc10f748 488d4c2440      lea     rcx,[rsp+40h]
fffff80f`dc10f74d f30f7f45e0      movdqu  xmmword ptr [rbp-20h],xmm0
fffff80f`dc10f752 48ff15ff3bffff  call    qword ptr [pci!_imp_ZwOpenKey (fffff80f`dc103358)]
fffff80f`dc10f759 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f75e 8bf8            mov     edi,eax
fffff80f`dc10f760 85c0            test    eax,eax
fffff80f`dc10f762 0f88ff000000    js      pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x128:
fffff80f`dc10f768 488d9510010000  lea     rdx,[rbp+110h]
fffff80f`dc10f76f 488d4c2470      lea     rcx,[rsp+70h]
fffff80f`dc10f774 48ff15553bffff  call    qword ptr [pci!_imp_RtlInitUnicodeString (fffff80f`dc1032d0)]
fffff80f`dc10f77b 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f780 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff80f`dc10f785 488d442434      lea     rax,[rsp+34h]
fffff80f`dc10f78a 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`dc10f78f 458d442402      lea     r8d,[r12+2]
fffff80f`dc10f794 4533c9          xor     r9d,r9d
fffff80f`dc10f797 4489642420      mov     dword ptr [rsp+20h],r12d
fffff80f`dc10f79c 488d542470      lea     rdx,[rsp+70h]
fffff80f`dc10f7a1 48ff15c03dffff  call    qword ptr [pci!_imp_ZwQueryValueKey (fffff80f`dc103568)]
fffff80f`dc10f7a8 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f7ad 8bf8            mov     edi,eax
fffff80f`dc10f7af 3d230000c0      cmp     eax,0C0000023h
fffff80f`dc10f7b4 0f8532020100    jne     pci!PciBuildRequirementsList+0x103ac (fffff80f`dc11f9ec)  Branch

pci!PciBuildRequirementsList+0x17a:
fffff80f`dc10f7ba 8b542434        mov     edx,dword ptr [rsp+34h]
fffff80f`dc10f7be b901010000      mov     ecx,101h
fffff80f`dc10f7c3 41b850636942    mov     r8d,42696350h
fffff80f`dc10f7c9 48ff15083fffff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff80f`dc1036d8)]
fffff80f`dc10f7d0 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f7d5 488bf0          mov     rsi,rax
fffff80f`dc10f7d8 4885c0          test    rax,rax
fffff80f`dc10f7db 0f841d020100    je      pci!PciBuildRequirementsList+0x103be (fffff80f`dc11f9fe)  Branch

pci!PciBuildRequirementsList+0x1a1:
fffff80f`dc10f7e1 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff80f`dc10f7e6 488d442448      lea     rax,[rsp+48h]
fffff80f`dc10f7eb 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`dc10f7f0 458d442402      lea     r8d,[r12+2]
fffff80f`dc10f7f5 8b442434        mov     eax,dword ptr [rsp+34h]
fffff80f`dc10f7f9 488d542470      lea     rdx,[rsp+70h]
fffff80f`dc10f7fe 4c8bce          mov     r9,rsi
fffff80f`dc10f801 89442420        mov     dword ptr [rsp+20h],eax
fffff80f`dc10f805 48ff155c3dffff  call    qword ptr [pci!_imp_ZwQueryValueKey (fffff80f`dc103568)]
fffff80f`dc10f80c 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f811 8bf8            mov     edi,eax
fffff80f`dc10f813 85c0            test    eax,eax
fffff80f`dc10f815 7850            js      pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x1d7:
fffff80f`dc10f817 837e0403        cmp     dword ptr [rsi+4],3
fffff80f`dc10f81b 0f85e7010100    jne     pci!PciBuildRequirementsList+0x103c8 (fffff80f`dc11fa08)  Branch

pci!PciBuildRequirementsList+0x1e1:
fffff80f`dc10f821 8b442434        mov     eax,dword ptr [rsp+34h]
fffff80f`dc10f825 b901010000      mov     ecx,101h
fffff80f`dc10f82a 83c0f4          add     eax,0FFFFFFF4h
fffff80f`dc10f82d 41b850636942    mov     r8d,42696350h
fffff80f`dc10f833 8bd0            mov     edx,eax
fffff80f`dc10f835 89442434        mov     dword ptr [rsp+34h],eax
fffff80f`dc10f839 48ff15983effff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff80f`dc1036d8)]
fffff80f`dc10f840 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10f845 4c8bf0          mov     r14,rax
fffff80f`dc10f848 4885c0          test    rax,rax
fffff80f`dc10f84b 0f84c1010100    je      pci!PciBuildRequirementsList+0x103d2 (fffff80f`dc11fa12)  Branch

pci!PciBuildRequirementsList+0x211:
fffff80f`dc10f851 448b442434      mov     r8d,dword ptr [rsp+34h]
fffff80f`dc10f856 488d560c        lea     rdx,[rsi+0Ch]
fffff80f`dc10f85a 488bc8          mov     rcx,rax
fffff80f`dc10f85d e89ec8fcff      call    pci!memcpy (fffff80f`dc0dc100)
fffff80f`dc10f862 448b7c2434      mov     r15d,dword ptr [rsp+34h]

pci!PciBuildRequirementsList+0x227:
fffff80f`dc10f867 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff80f`dc10f86c 4885c9          test    rcx,rcx
fffff80f`dc10f86f 740c            je      pci!PciBuildRequirementsList+0x23d (fffff80f`dc10f87d)  Branch

pci!PciBuildRequirementsList+0x231:
fffff80f`dc10f871 48ff15b038ffff  call    qword ptr [pci!_imp_ZwClose (fffff80f`dc103128)]
fffff80f`dc10f878 0f1f440000      nop     dword ptr [rax+rax]

pci!PciBuildRequirementsList+0x23d:
fffff80f`dc10f87d 4885f6          test    rsi,rsi
fffff80f`dc10f880 7414            je      pci!PciBuildRequirementsList+0x256 (fffff80f`dc10f896)  Branch

pci!PciBuildRequirementsList+0x242:
fffff80f`dc10f882 ba50636942      mov     edx,42696350h
fffff80f`dc10f887 488bce          mov     rcx,rsi
fffff80f`dc10f88a 48ff15c73effff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff80f`dc103758)]
fffff80f`dc10f891 0f1f440000      nop     dword ptr [rax+rax]

pci!PciBuildRequirementsList+0x256:
fffff80f`dc10f896 85ff            test    edi,edi
fffff80f`dc10f898 7823            js      pci!PciBuildRequirementsList+0x27d (fffff80f`dc10f8bd)  Branch

pci!PciBuildRequirementsList+0x25a:
fffff80f`dc10f89a 458bc7          mov     r8d,r15d
fffff80f`dc10f89d 488d4df0        lea     rcx,[rbp-10h]
fffff80f`dc10f8a1 498bd6          mov     rdx,r14
fffff80f`dc10f8a4 e857c8fcff      call    pci!memcpy (fffff80f`dc0dc100)
fffff80f`dc10f8a9 ba50636942      mov     edx,42696350h
fffff80f`dc10f8ae 498bce          mov     rcx,r14
fffff80f`dc10f8b1 48ff15a03effff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff80f`dc103758)]
fffff80f`dc10f8b8 0f1f440000      nop     dword ptr [rax+rax]

pci!PciBuildRequirementsList+0x27d:
fffff80f`dc10f8bd 488b4c2450      mov     rcx,qword ptr [rsp+50h]
fffff80f`dc10f8c2 4885c9          test    rcx,rcx
fffff80f`dc10f8c5 740c            je      pci!PciBuildRequirementsList+0x293 (fffff80f`dc10f8d3)  Branch

pci!PciBuildRequirementsList+0x287:
fffff80f`dc10f8c7 48ff155a38ffff  call    qword ptr [pci!_imp_ZwClose (fffff80f`dc103128)]
fffff80f`dc10f8ce 0f1f440000      nop     dword ptr [rax+rax]

pci!PciBuildRequirementsList+0x293:
fffff80f`dc10f8d3 85ff            test    edi,edi
fffff80f`dc10f8d5 0f8838040100    js      pci!PciBuildRequirementsList+0x106d3 (fffff80f`dc11fd13)  Branch

pci!PciBuildRequirementsList+0x29b:
fffff80f`dc10f8db 488d7d08        lea     rdi,[rbp+8]
fffff80f`dc10f8df 458bf4          mov     r14d,r12d
fffff80f`dc10f8e2 48897c2440      mov     qword ptr [rsp+40h],rdi
fffff80f`dc10f8e7 4489642458      mov     dword ptr [rsp+58h],r12d
fffff80f`dc10f8ec 4489642450      mov     dword ptr [rsp+50h],r12d
fffff80f`dc10f8f1 4539a5d0030000  cmp     dword ptr [r13+3D0h],r12d
fffff80f`dc10f8f8 741f            je      pci!PciBuildRequirementsList+0x2d9 (fffff80f`dc10f919)  Branch

pci!PciBuildRequirementsList+0x2ba:
fffff80f`dc10f8fa 488d542450      lea     rdx,[rsp+50h]
fffff80f`dc10f8ff 498bcd          mov     rcx,r13
fffff80f`dc10f902 e8a1aaffff      call    pci!PciGetMessageCount (fffff80f`dc10a3a8)
fffff80f`dc10f907 85c0            test    eax,eax
fffff80f`dc10f909 0f889c060000    js      pci!PciBuildRequirementsList+0x96b (fffff80f`dc10ffab)  Branch

pci!PciBuildRequirementsList+0x2cf:
fffff80f`dc10f90f 448b742450      mov     r14d,dword ptr [rsp+50h]
fffff80f`dc10f914 4489742458      mov     dword ptr [rsp+58h],r14d

pci!PciBuildRequirementsList+0x2d9:
fffff80f`dc10f919 41b201          mov     r10b,1
fffff80f`dc10f91c 4488542430      mov     byte ptr [rsp+30h],r10b
fffff80f`dc10f921 4538652c        cmp     byte ptr [r13+2Ch],r12b
fffff80f`dc10f925 7510            jne     pci!PciBuildRequirementsList+0x2f7 (fffff80f`dc10f937)  Branch

pci!PciBuildRequirementsList+0x2e7:
fffff80f`dc10f927 f7050fc9feff00800000 test dword ptr [pci!PciSystemWideHackFlags (fffff80f`dc0fc240)],8000h
fffff80f`dc10f931 0f84e5000100    je      pci!PciBuildRequirementsList+0x103dc (fffff80f`dc11fa1c)  Branch

pci!PciBuildRequirementsList+0x2f7:
fffff80f`dc10f937 48b90000000020000000 mov rcx,2000000000h
fffff80f`dc10f941 49858d38050000  test    qword ptr [r13+538h],rcx
fffff80f`dc10f948 0f85fd000100    jne     pci!PciBuildRequirementsList+0x1040b (fffff80f`dc11fa4b)  Branch

pci!PciBuildRequirementsList+0x30e:
fffff80f`dc10f94e 488d157b36feff  lea     rdx,[pci!`string` (fffff80f`dc0f2fd0)]
fffff80f`dc10f955 498bcd          mov     rcx,r13
fffff80f`dc10f958 e863c0ffff      call    pci!PciIsDeviceFeatureEnabled (fffff80f`dc10b9c0)
fffff80f`dc10f95d 440fb6542430    movzx   r10d,byte ptr [rsp+30h]
fffff80f`dc10f963 83f802          cmp     eax,2
fffff80f`dc10f966 410f94c3        sete    r11b

pci!PciBuildRequirementsList+0x32a:
fffff80f`dc10f96a 44885c243b      mov     byte ptr [rsp+3Bh],r11b
fffff80f`dc10f96f 4c8d4508        lea     r8,[rbp+8]
fffff80f`dc10f973 498d85ac010000  lea     rax,[r13+1ACh]
fffff80f`dc10f97a 418bd4          mov     edx,r12d
fffff80f`dc10f97d bb00100000      mov     ebx,1000h

pci!PciBuildRequirementsList+0x342:
fffff80f`dc10f982 440fb648fd      movzx   r9d,byte ptr [rax-3]
fffff80f`dc10f987 4584c9          test    r9b,r9b
fffff80f`dc10f98a 0f85ed040000    jne     pci!PciBuildRequirementsList+0x83d (fffff80f`dc10fe7d)  Branch

pci!PciBuildRequirementsList+0x350:
fffff80f`dc10f990 ffc2            inc     edx
fffff80f`dc10f992 4983c014        add     r8,14h
fffff80f`dc10f996 4883c020        add     rax,20h
fffff80f`dc10f99a 83fa0d          cmp     edx,0Dh
fffff80f`dc10f99d 72e3            jb      pci!PciBuildRequirementsList+0x342 (fffff80f`dc10f982)  Branch

pci!PciBuildRequirementsList+0x35f:
fffff80f`dc10f99f 48b90000000080000000 mov rcx,8000000000h
fffff80f`dc10f9a9 49858d38050000  test    qword ptr [r13+538h],rcx
fffff80f`dc10f9b0 0f859d000100    jne     pci!PciBuildRequirementsList+0x10413 (fffff80f`dc11fa53)  Branch

pci!PciBuildRequirementsList+0x376:
fffff80f`dc10f9b6 498bcd          mov     rcx,r13
fffff80f`dc10f9b9 bb27000000      mov     ebx,27h
fffff80f`dc10f9be e80153fcff      call    pci!PciResizableBarGetInfoPtr (fffff80f`dc0d4cc4)
fffff80f`dc10f9c3 4885c0          test    rax,rax
fffff80f`dc10f9c6 0f8527050000    jne     pci!PciBuildRequirementsList+0x8b3 (fffff80f`dc10fef3)  Branch

pci!PciBuildRequirementsList+0x38c:
fffff80f`dc10f9cc 418d4e05        lea     ecx,[r14+5]
fffff80f`dc10f9d0 b201            mov     dl,1
fffff80f`dc10f9d2 03cb            add     ecx,ebx
fffff80f`dc10f9d4 88542438        mov     byte ptr [rsp+38h],dl
fffff80f`dc10f9d8 4183bdd003000003 cmp     dword ptr [r13+3D0h],3
fffff80f`dc10f9e0 0f8480050000    je      pci!PciBuildRequirementsList+0x926 (fffff80f`dc10ff66)  Branch

pci!PciBuildRequirementsList+0x3a6:
fffff80f`dc10f9e6 4584d2          test    r10b,r10b
fffff80f`dc10f9e9 0f84d6000100    je      pci!PciBuildRequirementsList+0x10485 (fffff80f`dc11fac5)  Branch

pci!PciBuildRequirementsList+0x3af:
fffff80f`dc10f9ef 8854243a        mov     byte ptr [rsp+3Ah],dl
fffff80f`dc10f9f3 4584d2          test    r10b,r10b
fffff80f`dc10f9f6 0f84d4000100    je      pci!PciBuildRequirementsList+0x10490 (fffff80f`dc11fad0)  Branch

pci!PciBuildRequirementsList+0x3bc:
fffff80f`dc10f9fc 418b4518        mov     eax,dword ptr [r13+18h]
fffff80f`dc10fa00 458b7d1c        mov     r15d,dword ptr [r13+1Ch]
fffff80f`dc10fa04 0fb6da          movzx   ebx,dl
fffff80f`dc10fa07 448bc3          mov     r8d,ebx
fffff80f`dc10fa0a 89442448        mov     dword ptr [rsp+48h],eax
fffff80f`dc10fa0e 440fafc1        imul    r8d,ecx
fffff80f`dc10fa12 4585c0          test    r8d,r8d
fffff80f`dc10fa15 0f84f3020100    je      pci!PciBuildRequirementsList+0x106ce (fffff80f`dc11fd0e)  Branch

pci!PciBuildRequirementsList+0x3db:
fffff80f`dc10fa1b 84d2            test    dl,dl
fffff80f`dc10fa1d 0f84eb020100    je      pci!PciBuildRequirementsList+0x106ce (fffff80f`dc11fd0e)  Branch

pci!PciBuildRequirementsList+0x3e3:
fffff80f`dc10fa23 443bc3          cmp     r8d,ebx
fffff80f`dc10fa26 0f82e2020100    jb      pci!PciBuildRequirementsList+0x106ce (fffff80f`dc11fd0e)  Branch

pci!PciBuildRequirementsList+0x3ec:
fffff80f`dc10fa2c 8d43ff          lea     eax,[rbx-1]
fffff80f`dc10fa2f 442bc3          sub     r8d,ebx
fffff80f`dc10fa32 8d148509000000  lea     edx,[rax*4+9]
fffff80f`dc10fa39 41c1e005        shl     r8d,5
fffff80f`dc10fa3d 03d0            add     edx,eax
fffff80f`dc10fa3f b901010000      mov     ecx,101h
fffff80f`dc10fa44 418d3cd0        lea     edi,[r8+rdx*8]
fffff80f`dc10fa48 41b850636942    mov     r8d,42696350h
fffff80f`dc10fa4e 8bd7            mov     edx,edi
fffff80f`dc10fa50 448bf7          mov     r14d,edi
fffff80f`dc10fa53 48ff157e3cffff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff80f`dc1036d8)]
fffff80f`dc10fa5a 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10fa5f 4889442470      mov     qword ptr [rsp+70h],rax
fffff80f`dc10fa64 488bf0          mov     rsi,rax
fffff80f`dc10fa67 4885c0          test    rax,rax
fffff80f`dc10fa6a 0f849e020100    je      pci!PciBuildRequirementsList+0x106ce (fffff80f`dc11fd0e)  Branch

pci!PciBuildRequirementsList+0x430:
fffff80f`dc10fa70 458bc6          mov     r8d,r14d
fffff80f`dc10fa73 33d2            xor     edx,edx
fffff80f`dc10fa75 488bc8          mov     rcx,rax
fffff80f`dc10fa78 e8c3c9fcff      call    pci!memset (fffff80f`dc0dc440)
fffff80f`dc10fa7d 8b442448        mov     eax,dword ptr [rsp+48h]
fffff80f`dc10fa81 488d5620        lea     rdx,[rsi+20h]
fffff80f`dc10fa85 4532c0          xor     r8b,r8b
fffff80f`dc10fa88 894608          mov     dword ptr [rsi+8],eax
fffff80f`dc10fa8b 0fb644243a      movzx   eax,byte ptr [rsp+3Ah]
fffff80f`dc10fa90 418bcc          mov     ecx,r12d
fffff80f`dc10fa93 c7460405000000  mov     dword ptr [rsi+4],5
fffff80f`dc10fa9a 895e1c          mov     dword ptr [rsi+1Ch],ebx
fffff80f`dc10fa9d 44897e0c        mov     dword ptr [rsi+0Ch],r15d
fffff80f`dc10faa1 893e            mov     dword ptr [rsi],edi
fffff80f`dc10faa3 894c2448        mov     dword ptr [rsp+48h],ecx
fffff80f`dc10faa7 4889542468      mov     qword ptr [rsp+68h],rdx
fffff80f`dc10faac 4488442439      mov     byte ptr [rsp+39h],r8b
fffff80f`dc10fab1 84c0            test    al,al
fffff80f`dc10fab3 0f8476010000    je      pci!PciBuildRequirementsList+0x5ef (fffff80f`dc10fc2f)  Branch

pci!PciBuildRequirementsList+0x479:
fffff80f`dc10fab9 4c8b5c2440      mov     r11,qword ptr [rsp+40h]
fffff80f`dc10fabe 49ffc3          inc     r11
fffff80f`dc10fac1 4c895da8        mov     qword ptr [rbp-58h],r11

pci!PciBuildRequirementsList+0x485:
fffff80f`dc10fac5 498d85a8010000  lea     rax,[r13+1A8h]
fffff80f`dc10facc c70201000100    mov     dword ptr [rdx],10001h
fffff80f`dc10fad2 4c8d5208        lea     r10,[rdx+8]
fffff80f`dc10fad6 4889442460      mov     qword ptr [rsp+60h],rax
fffff80f`dc10fadb 4c89542440      mov     qword ptr [rsp+40h],r10
fffff80f`dc10fae0 488bd8          mov     rbx,rax
fffff80f`dc10fae3 4c8bf0          mov     r14,rax
fffff80f`dc10fae6 4489642434      mov     dword ptr [rsp+34h],r12d
fffff80f`dc10faeb 458bcc          mov     r9d,r12d
fffff80f`dc10faee 418bfc          mov     edi,r12d
fffff80f`dc10faf1 4d8bfc          mov     r15,r12
fffff80f`dc10faf4 498bf3          mov     rsi,r11
fffff80f`dc10faf7 660f1f840000000000 nop   word ptr [rax+rax]

pci!PciBuildRequirementsList+0x4c0:
fffff80f`dc10fb00 0fb64b01        movzx   ecx,byte ptr [rbx+1]
fffff80f`dc10fb04 84c9            test    cl,cl
fffff80f`dc10fb06 0f85b7010000    jne     pci!PciBuildRequirementsList+0x683 (fffff80f`dc10fcc3)  Branch

pci!PciBuildRequirementsList+0x4cc:
fffff80f`dc10fb0c 4983c620        add     r14,20h
fffff80f`dc10fb10 ffc7            inc     edi
fffff80f`dc10fb12 4983c704        add     r15,4
fffff80f`dc10fb16 4c89742460      mov     qword ptr [rsp+60h],r14
fffff80f`dc10fb1b 4883c614        add     rsi,14h
fffff80f`dc10fb1f 4883c320        add     rbx,20h
fffff80f`dc10fb23 83ff0d          cmp     edi,0Dh
fffff80f`dc10fb26 72d8            jb      pci!PciBuildRequirementsList+0x4c0 (fffff80f`dc10fb00)  Branch

pci!PciBuildRequirementsList+0x4e8:
fffff80f`dc10fb28 448b5c2458      mov     r11d,dword ptr [rsp+58h]
fffff80f`dc10fb2d 32db            xor     bl,bl
fffff80f`dc10fb2f 4585db          test    r11d,r11d
fffff80f`dc10fb32 7471            je      pci!PciBuildRequirementsList+0x565 (fffff80f`dc10fba5)  Branch

pci!PciBuildRequirementsList+0x4f4:
fffff80f`dc10fb34 418b8dd0030000  mov     ecx,dword ptr [r13+3D0h]
fffff80f`dc10fb3b b301            mov     bl,1
fffff80f`dc10fb3d 83f903          cmp     ecx,3
fffff80f`dc10fb40 0f84da030000    je      pci!PciBuildRequirementsList+0x8e0 (fffff80f`dc10ff20)  Branch

pci!PciBuildRequirementsList+0x506:
fffff80f`dc10fb46 83e902          sub     ecx,2
fffff80f`dc10fb49 0f852c040000    jne     pci!PciBuildRequirementsList+0x93b (fffff80f`dc10ff7b)  Branch

pci!PciBuildRequirementsList+0x50f:
fffff80f`dc10fb4f b902000000      mov     ecx,2
fffff80f`dc10fb54 4183fb01        cmp     r11d,1
fffff80f`dc10fb58 0f8757040000    ja      pci!PciBuildRequirementsList+0x975 (fffff80f`dc10ffb5)  Branch

pci!PciBuildRequirementsList+0x51e:
fffff80f`dc10fb5e 418bd4          mov     edx,r12d
fffff80f`dc10fb61 83e902          sub     ecx,2
fffff80f`dc10fb64 0f85b2000100    jne     pci!PciBuildRequirementsList+0x105dc (fffff80f`dc11fc1c)  Branch

pci!PciBuildRequirementsList+0x52a:
fffff80f`dc10fb6a 410f1085d8030000 movups  xmm0,xmmword ptr [r13+3D8h]
fffff80f`dc10fb72 410f1102        movups  xmmword ptr [r10],xmm0
fffff80f`dc10fb76 410f108de8030000 movups  xmm1,xmmword ptr [r13+3E8h]
fffff80f`dc10fb7e 410f114a10      movups  xmmword ptr [r10+10h],xmm1
fffff80f`dc10fb83 41c74208feffffff mov     dword ptr [r10+8],0FFFFFFFEh

pci!PciBuildRequirementsList+0x54b:
fffff80f`dc10fb8b ba01000000      mov     edx,1

pci!PciBuildRequirementsList+0x550:
fffff80f`dc10fb90 89542450        mov     dword ptr [rsp+50h],edx
fffff80f`dc10fb94 4183fb01        cmp     r11d,1
fffff80f`dc10fb98 0f874c040000    ja      pci!PciBuildRequirementsList+0x9aa (fffff80f`dc10ffea)  Branch

pci!PciBuildRequirementsList+0x55e:
fffff80f`dc10fb9e 4983c220        add     r10,20h
fffff80f`dc10fba2 41ffc1          inc     r9d

pci!PciBuildRequirementsList+0x565:
fffff80f`dc10fba5 4180bdb103000002 cmp     byte ptr [r13+3B1h],2
fffff80f`dc10fbad 7528            jne     pci!PciBuildRequirementsList+0x597 (fffff80f`dc10fbd7)  Branch

pci!PciBuildRequirementsList+0x56f:
fffff80f`dc10fbaf 410f1085b0030000 movups  xmm0,xmmword ptr [r13+3B0h]
fffff80f`dc10fbb7 410f1102        movups  xmmword ptr [r10],xmm0
fffff80f`dc10fbbb 410f108dc0030000 movups  xmm1,xmmword ptr [r13+3C0h]
fffff80f`dc10fbc3 410f114a10      movups  xmmword ptr [r10+10h],xmm1
fffff80f`dc10fbc8 84db            test    bl,bl
fffff80f`dc10fbca 7404            je      pci!PciBuildRequirementsList+0x590 (fffff80f`dc10fbd0)  Branch

pci!PciBuildRequirementsList+0x58c:
fffff80f`dc10fbcc 41c60208        mov     byte ptr [r10],8

pci!PciBuildRequirementsList+0x590:
fffff80f`dc10fbd0 4983c220        add     r10,20h
fffff80f`dc10fbd4 41ffc1          inc     r9d

pci!PciBuildRequirementsList+0x597:
fffff80f`dc10fbd7 410fb6452c      movzx   eax,byte ptr [r13+2Ch]
fffff80f`dc10fbdc 410fb795fe030000 movzx   edx,word ptr [r13+3FEh]
fffff80f`dc10fbe4 fec8            dec     al
fffff80f`dc10fbe6 3c01            cmp     al,1
fffff80f`dc10fbe8 0f8614030000    jbe     pci!PciBuildRequirementsList+0x8c2 (fffff80f`dc10ff02)  Branch

pci!PciBuildRequirementsList+0x5ae:
fffff80f`dc10fbee 488b442468      mov     rax,qword ptr [rsp+68h]
fffff80f`dc10fbf3 498bd2          mov     rdx,r10
fffff80f`dc10fbf6 8b4c2448        mov     ecx,dword ptr [rsp+48h]
fffff80f`dc10fbfa 440fb6442439    movzx   r8d,byte ptr [rsp+39h]
fffff80f`dc10fc00 4103c9          add     ecx,r9d
fffff80f`dc10fc03 4c8b5da8        mov     r11,qword ptr [rbp-58h]
fffff80f`dc10fc07 41fec0          inc     r8b
fffff80f`dc10fc0a 44894804        mov     dword ptr [rax+4],r9d
fffff80f`dc10fc0e 0fb644243a      movzx   eax,byte ptr [rsp+3Ah]
fffff80f`dc10fc13 894c2448        mov     dword ptr [rsp+48h],ecx
fffff80f`dc10fc17 4889542468      mov     qword ptr [rsp+68h],rdx
fffff80f`dc10fc1c 4488442439      mov     byte ptr [rsp+39h],r8b
fffff80f`dc10fc21 443ac0          cmp     r8b,al
fffff80f`dc10fc24 0f829bfeffff    jb      pci!PciBuildRequirementsList+0x485 (fffff80f`dc10fac5)  Branch

pci!PciBuildRequirementsList+0x5ea:
fffff80f`dc10fc2a 488b742470      mov     rsi,qword ptr [rsp+70h]

pci!PciBuildRequirementsList+0x5ef:
fffff80f`dc10fc2f 0fb6c0          movzx   eax,al
fffff80f`dc10fc32 89461c          mov     dword ptr [rsi+1Ch],eax
fffff80f`dc10fc35 8d1480          lea     edx,[rax+rax*4]
fffff80f`dc10fc38 8bc1            mov     eax,ecx
fffff80f`dc10fc3a c1e005          shl     eax,5
fffff80f`dc10fc3d 448d04d0        lea     r8d,[rax+rdx*8]
fffff80f`dc10fc41 448906          mov     dword ptr [rsi],r8d
fffff80f`dc10fc44 85c9            test    ecx,ecx
fffff80f`dc10fc46 7434            je      pci!PciBuildRequirementsList+0x63c (fffff80f`dc10fc7c)  Branch

pci!PciBuildRequirementsList+0x608:
fffff80f`dc10fc48 418bd0          mov     edx,r8d
fffff80f`dc10fc4b b901000000      mov     ecx,1
fffff80f`dc10fc50 41b850636942    mov     r8d,42696350h
fffff80f`dc10fc56 48ff157b3affff  call    qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff80f`dc1036d8)]
fffff80f`dc10fc5d 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10fc62 4c8be0          mov     r12,rax
fffff80f`dc10fc65 4885c0          test    rax,rax
fffff80f`dc10fc68 0f8485000100    je      pci!PciBuildRequirementsList+0x106b3 (fffff80f`dc11fcf3)  Branch

pci!PciBuildRequirementsList+0x62e:
fffff80f`dc10fc6e 448b06          mov     r8d,dword ptr [rsi]
fffff80f`dc10fc71 488bd6          mov     rdx,rsi
fffff80f`dc10fc74 488bc8          mov     rcx,rax
fffff80f`dc10fc77 e884c4fcff      call    pci!memcpy (fffff80f`dc0dc100)

pci!PciBuildRequirementsList+0x63c:
fffff80f`dc10fc7c ba50636942      mov     edx,42696350h
fffff80f`dc10fc81 488bce          mov     rcx,rsi
fffff80f`dc10fc84 48ff15cd3affff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff80f`dc103758)]
fffff80f`dc10fc8b 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10fc90 488b45b8        mov     rax,qword ptr [rbp-48h]
fffff80f`dc10fc94 4c8920          mov     qword ptr [rax],r12
fffff80f`dc10fc97 33c0            xor     eax,eax

pci!PciBuildRequirementsList+0x659:
fffff80f`dc10fc99 488b8d30010000  mov     rcx,qword ptr [rbp+130h]
fffff80f`dc10fca0 4833cc          xor     rcx,rsp
fffff80f`dc10fca3 e878b6fcff      call    pci!_security_check_cookie (fffff80f`dc0db320)
fffff80f`dc10fca8 488b9c2490020000 mov     rbx,qword ptr [rsp+290h]
fffff80f`dc10fcb0 4881c440020000  add     rsp,240h
fffff80f`dc10fcb7 415f            pop     r15
fffff80f`dc10fcb9 415e            pop     r14
fffff80f`dc10fcbb 415d            pop     r13
fffff80f`dc10fcbd 415c            pop     r12
fffff80f`dc10fcbf 5f              pop     rdi
fffff80f`dc10fcc0 5e              pop     rsi
fffff80f`dc10fcc1 5d              pop     rbp
fffff80f`dc10fcc2 c3              ret

pci!PciBuildRequirementsList+0x683:
fffff80f`dc10fcc3 0fb74304        movzx   eax,word ptr [rbx+4]
fffff80f`dc10fcc7 ba00100000      mov     edx,1000h
fffff80f`dc10fccc 6685c2          test    dx,ax
fffff80f`dc10fccf 0f8537feffff    jne     pci!PciBuildRequirementsList+0x4cc (fffff80f`dc10fb0c)  Branch

pci!PciBuildRequirementsList+0x695:
fffff80f`dc10fcd5 807c243b00      cmp     byte ptr [rsp+3Bh],0
fffff80f`dc10fcda 0f85c8010000    jne     pci!PciBuildRequirementsList+0x868 (fffff80f`dc10fea8)  Branch

pci!PciBuildRequirementsList+0x6a0:
fffff80f`dc10fce0 41807d2c00      cmp     byte ptr [r13+2Ch],0
fffff80f`dc10fce5 751b            jne     pci!PciBuildRequirementsList+0x6c2 (fffff80f`dc10fd02)  Branch

pci!PciBuildRequirementsList+0x6a7:
fffff80f`dc10fce7 807c243000      cmp     byte ptr [rsp+30h],0
fffff80f`dc10fcec 0f8403fe0000    je      pci!PciBuildRequirementsList+0x104b5 (fffff80f`dc11faf5)  Branch

pci!PciBuildRequirementsList+0x6b2:
fffff80f`dc10fcf2 498d8588020000  lea     rax,[r13+288h]
fffff80f`dc10fcf9 4c3bf0          cmp     r14,rax
fffff80f`dc10fcfc 0f830afeffff    jae     pci!PciBuildRequirementsList+0x4cc (fffff80f`dc10fb0c)  Branch

pci!PciBuildRequirementsList+0x6c2:
fffff80f`dc10fd02 418bd4          mov     edx,r12d
fffff80f`dc10fd05 8954243c        mov     dword ptr [rsp+3Ch],edx
fffff80f`dc10fd09 83ff06          cmp     edi,6
fffff80f`dc10fd0c 731a            jae     pci!PciBuildRequirementsList+0x6e8 (fffff80f`dc10fd28)  Branch

pci!PciBuildRequirementsList+0x6ce:
fffff80f`dc10fd0e 807b0103        cmp     byte ptr [rbx+1],3
fffff80f`dc10fd12 7514            jne     pci!PciBuildRequirementsList+0x6e8 (fffff80f`dc10fd28)  Branch

pci!PciBuildRequirementsList+0x6d4:
fffff80f`dc10fd14 498bcd          mov     rcx,r13
fffff80f`dc10fd17 e8a84ffcff      call    pci!PciResizableBarGetInfoPtr (fffff80f`dc0d4cc4)
fffff80f`dc10fd1c 4885c0          test    rax,rax
fffff80f`dc10fd1f 0f85b5010000    jne     pci!PciBuildRequirementsList+0x89a (fffff80f`dc10feda)  Branch

pci!PciBuildRequirementsList+0x6e5:
fffff80f`dc10fd25 418bd4          mov     edx,r12d

pci!PciBuildRequirementsList+0x6e8:
fffff80f`dc10fd28 0fb646ff        movzx   eax,byte ptr [rsi-1]
fffff80f`dc10fd2c 488d4eff        lea     rcx,[rsi-1]
fffff80f`dc10fd30 84c0            test    al,al
fffff80f`dc10fd32 0f848a000000    je      pci!PciBuildRequirementsList+0x782 (fffff80f`dc10fdc2)  Branch

pci!PciBuildRequirementsList+0x6f8:
fffff80f`dc10fd38 888511010000    mov     byte ptr [rbp+111h],al
fffff80f`dc10fd3e 33d2            xor     edx,edx
fffff80f`dc10fd40 0fb74601        movzx   eax,word ptr [rsi+1]
fffff80f`dc10fd44 66898514010000  mov     word ptr [rbp+114h],ax
fffff80f`dc10fd4b 0fb606          movzx   eax,byte ptr [rsi]
fffff80f`dc10fd4e 888512010000    mov     byte ptr [rbp+112h],al
fffff80f`dc10fd54 8b460b          mov     eax,dword ptr [rsi+0Bh]
fffff80f`dc10fd57 898518010000    mov     dword ptr [rbp+118h],eax
fffff80f`dc10fd5d 488b4603        mov     rax,qword ptr [rsi+3]
fffff80f`dc10fd61 48898520010000  mov     qword ptr [rbp+120h],rax
fffff80f`dc10fd68 c6851001000001  mov     byte ptr [rbp+110h],1
fffff80f`dc10fd6f c7851c01000001000000 mov dword ptr [rbp+11Ch],1
fffff80f`dc10fd79 48ff156839ffff  call    qword ptr [pci!_imp_RtlCmDecodeMemIoResource (fffff80f`dc1036e8)]
fffff80f`dc10fd80 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc10fd85 8b54243c        mov     edx,dword ptr [rsp+3Ch]
fffff80f`dc10fd89 48ffc8          dec     rax
fffff80f`dc10fd8c 48034603        add     rax,qword ptr [rsi+3]
fffff80f`dc10fd90 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff80f`dc10fd95 0f108510010000  movups  xmm0,xmmword ptr [rbp+110h]
fffff80f`dc10fd9c 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff80f`dc10fda1 48898528010000  mov     qword ptr [rbp+128h],rax
fffff80f`dc10fda8 8bc2            mov     eax,edx
fffff80f`dc10fdaa 0f108d20010000  movups  xmm1,xmmword ptr [rbp+120h]
fffff80f`dc10fdb1 48c1e005        shl     rax,5
fffff80f`dc10fdb5 ffc2            inc     edx
fffff80f`dc10fdb7 420f110410      movups  xmmword ptr [rax+r10],xmm0
fffff80f`dc10fdbc 420f114c1010    movups  xmmword ptr [rax+r10+10h],xmm1

pci!PciBuildRequirementsList+0x782:
fffff80f`dc10fdc2 803dc7c6feff01  cmp     byte ptr [pci!PciLockDeviceResources (fffff80f`dc0fc490)],1
fffff80f`dc10fdc9 744c            je      pci!PciBuildRequirementsList+0x7d7 (fffff80f`dc10fe17)  Branch

pci!PciBuildRequirementsList+0x78b:
fffff80f`dc10fdcb 4d8b8538050000  mov     r8,qword ptr [r13+538h]
fffff80f`dc10fdd2 41f6c010        test    r8b,10h
fffff80f`dc10fdd6 753f            jne     pci!PciBuildRequirementsList+0x7d7 (fffff80f`dc10fe17)  Branch

pci!PciBuildRequirementsList+0x798:
fffff80f`dc10fdd8 498b4550        mov     rax,qword ptr [r13+50h]
fffff80f`dc10fddc 8b88b0020000    mov     ecx,dword ptr [rax+2B0h]
fffff80f`dc10fde2 f6c101          test    cl,1
fffff80f`dc10fde5 7530            jne     pci!PciBuildRequirementsList+0x7d7 (fffff80f`dc10fe17)  Branch

pci!PciBuildRequirementsList+0x7a7:
fffff80f`dc10fde7 410fb68548050000 movzx   eax,byte ptr [r13+548h]
fffff80f`dc10fdef a804            test    al,4
fffff80f`dc10fdf1 7524            jne     pci!PciBuildRequirementsList+0x7d7 (fffff80f`dc10fe17)  Branch

pci!PciBuildRequirementsList+0x7b3:
fffff80f`dc10fdf3 41f6c004        test    r8b,4
fffff80f`dc10fdf7 0f85dcfd0000    jne     pci!PciBuildRequirementsList+0x10599 (fffff80f`dc11fbd9)  Branch

pci!PciBuildRequirementsList+0x7bd:
fffff80f`dc10fdfd 0f1003          movups  xmm0,xmmword ptr [rbx]
fffff80f`dc10fe00 8bc2            mov     eax,edx
fffff80f`dc10fe02 48c1e005        shl     rax,5
fffff80f`dc10fe06 ffc2            inc     edx
fffff80f`dc10fe08 420f110410      movups  xmmword ptr [rax+r10],xmm0
fffff80f`dc10fe0d 0f104b10        movups  xmm1,xmmword ptr [rbx+10h]
fffff80f`dc10fe11 420f114c1010    movups  xmmword ptr [rax+r10+10h],xmm1

pci!PciBuildRequirementsList+0x7d7:
fffff80f`dc10fe17 85d2            test    edx,edx
fffff80f`dc10fe19 0f84ebfd0000    je      pci!PciBuildRequirementsList+0x105ca (fffff80f`dc11fc0a)  Branch

pci!PciBuildRequirementsList+0x7df:
fffff80f`dc10fe1f 41800a01        or      byte ptr [r10],1
fffff80f`dc10fe23 83fa01          cmp     edx,1
fffff80f`dc10fe26 7615            jbe     pci!PciBuildRequirementsList+0x7fd (fffff80f`dc10fe3d)  Branch

pci!PciBuildRequirementsList+0x7e8:
fffff80f`dc10fe28 498d4a20        lea     rcx,[r10+20h]
fffff80f`dc10fe2c 448d42ff        lea     r8d,[rdx-1]

pci!PciBuildRequirementsList+0x7f0:
fffff80f`dc10fe30 800908          or      byte ptr [rcx],8
fffff80f`dc10fe33 488d4920        lea     rcx,[rcx+20h]
fffff80f`dc10fe37 4983e801        sub     r8,1
fffff80f`dc10fe3b 75f3            jne     pci!PciBuildRequirementsList+0x7f0 (fffff80f`dc10fe30)  Branch

pci!PciBuildRequirementsList+0x7fd:
fffff80f`dc10fe3d 440fb6442439    movzx   r8d,byte ptr [rsp+39h]
fffff80f`dc10fe43 8d4a01          lea     ecx,[rdx+1]
fffff80f`dc10fe46 8bc2            mov     eax,edx
fffff80f`dc10fe48 48c1e005        shl     rax,5
fffff80f`dc10fe4c 6642c74410018101 mov     word ptr [rax+r10+1],181h
fffff80f`dc10fe54 42c744100801000000 mov   dword ptr [rax+r10+8],1
fffff80f`dc10fe5d 42897c100c      mov     dword ptr [rax+r10+0Ch],edi
fffff80f`dc10fe62 8bc1            mov     eax,ecx
fffff80f`dc10fe64 48c1e005        shl     rax,5
fffff80f`dc10fe68 4c03d0          add     r10,rax
fffff80f`dc10fe6b 4403c9          add     r9d,ecx
fffff80f`dc10fe6e 4c89542440      mov     qword ptr [rsp+40h],r10
fffff80f`dc10fe73 44894c2434      mov     dword ptr [rsp+34h],r9d
fffff80f`dc10fe78 e98ffcffff      jmp     pci!PciBuildRequirementsList+0x4cc (fffff80f`dc10fb0c)  Branch

pci!PciBuildRequirementsList+0x83d:
fffff80f`dc10fe7d 0fb708          movzx   ecx,word ptr [rax]
fffff80f`dc10fe80 6685cb          test    bx,cx
fffff80f`dc10fe83 0f8507fbffff    jne     pci!PciBuildRequirementsList+0x350 (fffff80f`dc10f990)  Branch

pci!PciBuildRequirementsList+0x849:
fffff80f`dc10fe89 4584db          test    r11b,r11b
fffff80f`dc10fe8c 7541            jne     pci!PciBuildRequirementsList+0x88f (fffff80f`dc10fecf)  Branch

pci!PciBuildRequirementsList+0x84e:
fffff80f`dc10fe8e 410fb608        movzx   ecx,byte ptr [r8]
fffff80f`dc10fe92 443ac9          cmp     r9b,cl
fffff80f`dc10fe95 0f84f5faffff    je      pci!PciBuildRequirementsList+0x350 (fffff80f`dc10f990)  Branch

pci!PciBuildRequirementsList+0x85b:
fffff80f`dc10fe9b 84c9            test    cl,cl
fffff80f`dc10fe9d 0f84edfaffff    je      pci!PciBuildRequirementsList+0x350 (fffff80f`dc10f990)  Branch

pci!PciBuildRequirementsList+0x863:
fffff80f`dc10fea3 e9abfb0000      jmp     pci!PciBuildRequirementsList+0x10413 (fffff80f`dc11fa53)  Branch

pci!PciBuildRequirementsList+0x868:
fffff80f`dc10fea8 80f901          cmp     cl,1
fffff80f`dc10feab 0f852ffeffff    jne     pci!PciBuildRequirementsList+0x6a0 (fffff80f`dc10fce0)  Branch

pci!PciBuildRequirementsList+0x871:
fffff80f`dc10feb1 498bca          mov     rcx,r10
fffff80f`dc10feb4 e88b14fcff      call    pci!NullResourceRequirement (fffff80f`dc0d1344)
fffff80f`dc10feb9 4983c220        add     r10,20h
fffff80f`dc10febd 41ffc1          inc     r9d
fffff80f`dc10fec0 4c89542440      mov     qword ptr [rsp+40h],r10
fffff80f`dc10fec5 44894c2434      mov     dword ptr [rsp+34h],r9d
fffff80f`dc10feca e93dfcffff      jmp     pci!PciBuildRequirementsList+0x4cc (fffff80f`dc10fb0c)  Branch

pci!PciBuildRequirementsList+0x88f:
fffff80f`dc10fecf 4180f901        cmp     r9b,1
fffff80f`dc10fed3 75b9            jne     pci!PciBuildRequirementsList+0x84e (fffff80f`dc10fe8e)  Branch

pci!PciBuildRequirementsList+0x895:
fffff80f`dc10fed5 e9b6faffff      jmp     pci!PciBuildRequirementsList+0x350 (fffff80f`dc10f990)  Branch

pci!PciBuildRequirementsList+0x89a:
fffff80f`dc10feda 4883c004        add     rax,4
fffff80f`dc10fede 4903c7          add     rax,r15
fffff80f`dc10fee1 48894580        mov     qword ptr [rbp-80h],rax
fffff80f`dc10fee5 833800          cmp     dword ptr [rax],0
fffff80f`dc10fee8 0f8437feffff    je      pci!PciBuildRequirementsList+0x6e5 (fffff80f`dc10fd25)  Branch

pci!PciBuildRequirementsList+0x8ae:
fffff80f`dc10feee e917fc0000      jmp     pci!PciBuildRequirementsList+0x104ca (fffff80f`dc11fb0a)  Branch

pci!PciBuildRequirementsList+0x8b3:
fffff80f`dc10fef3 66443920        cmp     word ptr [rax],r12w
fffff80f`dc10fef7 0f84cffaffff    je      pci!PciBuildRequirementsList+0x38c (fffff80f`dc10f9cc)  Branch

pci!PciBuildRequirementsList+0x8bd:
fffff80f`dc10fefd e995fb0000      jmp     pci!PciBuildRequirementsList+0x10457 (fffff80f`dc11fa97)  Branch

pci!PciBuildRequirementsList+0x8c2:
fffff80f`dc10ff02 498bcd          mov     rcx,r13
fffff80f`dc10ff05 e83e2dfcff      call    pci!PciSubtractiveDecodeBridge (fffff80f`dc0d2c48)
fffff80f`dc10ff0a 84c0            test    al,al
fffff80f`dc10ff0c 0f85dcfcffff    jne     pci!PciBuildRequirementsList+0x5ae (fffff80f`dc10fbee)  Branch

pci!PciBuildRequirementsList+0x8d2:
fffff80f`dc10ff12 f6c208          test    dl,8
fffff80f`dc10ff15 0f84d3fcffff    je      pci!PciBuildRequirementsList+0x5ae (fffff80f`dc10fbee)  Branch

pci!PciBuildRequirementsList+0x8db:
fffff80f`dc10ff1b e923fd0000      jmp     pci!PciBuildRequirementsList+0x10603 (fffff80f`dc11fc43)  Branch

pci!PciBuildRequirementsList+0x8e0:
fffff80f`dc10ff20 41f6c001        test    r8b,1
fffff80f`dc10ff24 0f851cfcffff    jne     pci!PciBuildRequirementsList+0x506 (fffff80f`dc10fb46)  Branch

pci!PciBuildRequirementsList+0x8ea:
fffff80f`dc10ff2a 4183fb01        cmp     r11d,1
fffff80f`dc10ff2e 0f8612fcffff    jbe     pci!PciBuildRequirementsList+0x506 (fffff80f`dc10fb46)  Branch

pci!PciBuildRequirementsList+0x8f4:
fffff80f`dc10ff34 4c8d4c2450      lea     r9,[rsp+50h]
fffff80f`dc10ff39 4d8bc2          mov     r8,r10
fffff80f`dc10ff3c 418bd3          mov     edx,r11d
fffff80f`dc10ff3f 498bcd          mov     rcx,r13
fffff80f`dc10ff42 e8e584ffff      call    pci!PciPopulateMsiRequirements (fffff80f`dc10842c)
fffff80f`dc10ff47 8b4c2450        mov     ecx,dword ptr [rsp+50h]
fffff80f`dc10ff4b 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff80f`dc10ff50 8bc1            mov     eax,ecx
fffff80f`dc10ff52 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff80f`dc10ff57 48c1e005        shl     rax,5
fffff80f`dc10ff5b 4c03d0          add     r10,rax
fffff80f`dc10ff5e 4403c9          add     r9d,ecx
fffff80f`dc10ff61 e971fcffff      jmp     pci!PciBuildRequirementsList+0x597 (fffff80f`dc10fbd7)  Branch

pci!PciBuildRequirementsList+0x926:
fffff80f`dc10ff66 4183fe01        cmp     r14d,1
fffff80f`dc10ff6a 0f8676faffff    jbe     pci!PciBuildRequirementsList+0x3a6 (fffff80f`dc10f9e6)  Branch

pci!PciBuildRequirementsList+0x930:
fffff80f`dc10ff70 b202            mov     dl,2
fffff80f`dc10ff72 88542438        mov     byte ptr [rsp+38h],dl
fffff80f`dc10ff76 e96bfaffff      jmp     pci!PciBuildRequirementsList+0x3a6 (fffff80f`dc10f9e6)  Branch

pci!PciBuildRequirementsList+0x93b:
fffff80f`dc10ff7b 83f901          cmp     ecx,1
fffff80f`dc10ff7e 7573            jne     pci!PciBuildRequirementsList+0x9b3 (fffff80f`dc10fff3)  Branch

pci!PciBuildRequirementsList+0x940:
fffff80f`dc10ff80 8bd1            mov     edx,ecx
fffff80f`dc10ff82 4c8d4c2450      lea     r9,[rsp+50h]
fffff80f`dc10ff87 498bcd          mov     rcx,r13
fffff80f`dc10ff8a 4d8bc2          mov     r8,r10
fffff80f`dc10ff8d e89a84ffff      call    pci!PciPopulateMsiRequirements (fffff80f`dc10842c)
fffff80f`dc10ff92 4180bdb103000002 cmp     byte ptr [r13+3B1h],2
fffff80f`dc10ff9a 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff80f`dc10ff9f 7559            jne     pci!PciBuildRequirementsList+0x9ba (fffff80f`dc10fffa)  Branch

pci!PciBuildRequirementsList+0x961:
fffff80f`dc10ffa1 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff80f`dc10ffa6 e9f3fbffff      jmp     pci!PciBuildRequirementsList+0x55e (fffff80f`dc10fb9e)  Branch

pci!PciBuildRequirementsList+0x96b:
fffff80f`dc10ffab 4489642458      mov     dword ptr [rsp+58h],r12d
fffff80f`dc10ffb0 e964f9ffff      jmp     pci!PciBuildRequirementsList+0x2d9 (fffff80f`dc10f919)  Branch

pci!PciBuildRequirementsList+0x975:
fffff80f`dc10ffb5 4c8d4c2450      lea     r9,[rsp+50h]
fffff80f`dc10ffba 4d8bc2          mov     r8,r10
fffff80f`dc10ffbd 418bd3          mov     edx,r11d
fffff80f`dc10ffc0 498bcd          mov     rcx,r13
fffff80f`dc10ffc3 e86484ffff      call    pci!PciPopulateMsiRequirements (fffff80f`dc10842c)
fffff80f`dc10ffc8 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff80f`dc10ffcd 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff80f`dc10ffd2 4983c220        add     r10,20h
fffff80f`dc10ffd6 418b8dd0030000  mov     ecx,dword ptr [r13+3D0h]
fffff80f`dc10ffdd 41ffc1          inc     r9d
fffff80f`dc10ffe0 448b5c2458      mov     r11d,dword ptr [rsp+58h]
fffff80f`dc10ffe5 e974fbffff      jmp     pci!PciBuildRequirementsList+0x51e (fffff80f`dc10fb5e)  Branch

pci!PciBuildRequirementsList+0x9aa:
fffff80f`dc10ffea 41c60208        mov     byte ptr [r10],8
fffff80f`dc10ffee e9abfbffff      jmp     pci!PciBuildRequirementsList+0x55e (fffff80f`dc10fb9e)  Branch

pci!PciBuildRequirementsList+0x9b3:
fffff80f`dc10fff3 32db            xor     bl,bl
fffff80f`dc10fff5 e9abfbffff      jmp     pci!PciBuildRequirementsList+0x565 (fffff80f`dc10fba5)  Branch

pci!PciBuildRequirementsList+0x9ba:
fffff80f`dc10fffa 418022fe        and     byte ptr [r10],0FEh
fffff80f`dc10fffe eba1            jmp     pci!PciBuildRequirementsList+0x961 (fffff80f`dc10ffa1)  Branch

pci!PciBuildRequirementsList+0x103ac:
fffff80f`dc11f9ec 85c0            test    eax,eax
fffff80f`dc11f9ee 0f8873fefeff    js      pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x103b4:
fffff80f`dc11f9f4 bf010000c0      mov     edi,0C0000001h
fffff80f`dc11f9f9 e969fefeff      jmp     pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x103be:
fffff80f`dc11f9fe bf9a0000c0      mov     edi,0C000009Ah
fffff80f`dc11fa03 e95ffefeff      jmp     pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x103c8:
fffff80f`dc11fa08 bf0d0000c0      mov     edi,0C000000Dh
fffff80f`dc11fa0d e955fefeff      jmp     pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x103d2:
fffff80f`dc11fa12 bf9a0000c0      mov     edi,0C000009Ah
fffff80f`dc11fa17 e94bfefeff      jmp     pci!PciBuildRequirementsList+0x227 (fffff80f`dc10f867)  Branch

pci!PciBuildRequirementsList+0x103dc:
fffff80f`dc11fa1c 498bcd          mov     rcx,r13
fffff80f`dc11fa1f e8a8fa0000      call    pci!PciIsSriovDriverAvailable (fffff80f`dc12f4cc)
fffff80f`dc11fa24 85c0            test    eax,eax
fffff80f`dc11fa26 741b            je      pci!PciBuildRequirementsList+0x10403 (fffff80f`dc11fa43)  Branch

pci!PciBuildRequirementsList+0x103e8:
fffff80f`dc11fa28 498b8588000000  mov     rax,qword ptr [r13+88h]
fffff80f`dc11fa2f 4532d2          xor     r10b,r10b
fffff80f`dc11fa32 4488542430      mov     byte ptr [rsp+30h],r10b
fffff80f`dc11fa37 c680fe00000001  mov     byte ptr [rax+0FEh],1
fffff80f`dc11fa3e e9f4fefeff      jmp     pci!PciBuildRequirementsList+0x2f7 (fffff80f`dc10f937)  Branch

pci!PciBuildRequirementsList+0x10403:
fffff80f`dc11fa43 41b201          mov     r10b,1
fffff80f`dc11fa46 e9ecfefeff      jmp     pci!PciBuildRequirementsList+0x2f7 (fffff80f`dc10f937)  Branch

pci!PciBuildRequirementsList+0x1040b:
fffff80f`dc11fa4b 41b301          mov     r11b,1
fffff80f`dc11fa4e e917fffeff      jmp     pci!PciBuildRequirementsList+0x32a (fffff80f`dc10f96a)  Branch

pci!PciBuildRequirementsList+0x10413:
fffff80f`dc11fa53 498b4d50        mov     rcx,qword ptr [r13+50h]
fffff80f`dc11fa57 488d05aa5cfdff  lea     rax,[pci!WPP_ae0cc2ea388932372cff1929a8dfa700_Traceguids (fffff80f`dc0f5708)]
fffff80f`dc11fa5e 41b90a000000    mov     r9d,0Ah
fffff80f`dc11fa64 4c896c2428      mov     qword ptr [rsp+28h],r13
fffff80f`dc11fa69 b203            mov     dl,3
fffff80f`dc11fa6b 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`dc11fa70 488b8928030000  mov     rcx,qword ptr [rcx+328h]
fffff80f`dc11fa77 458d41f8        lea     r8d,[r9-8]
fffff80f`dc11fa7b e85c68fbff      call    pci!WPP_RECORDER_SF_q (fffff80f`dc0d62dc)
fffff80f`dc11fa80 440fb6542430    movzx   r10d,byte ptr [rsp+30h]
fffff80f`dc11fa86 498d85a0000000  lea     rax,[r13+0A0h]
fffff80f`dc11fa8d 4889442440      mov     qword ptr [rsp+40h],rax
fffff80f`dc11fa92 e91ffffeff      jmp     pci!PciBuildRequirementsList+0x376 (fffff80f`dc10f9b6)  Branch

pci!PciBuildRequirementsList+0x10457:
fffff80f`dc11fa97 488d7804        lea     rdi,[rax+4]
fffff80f`dc11fa9b be06000000      mov     esi,6

pci!PciBuildRequirementsList+0x10460:
fffff80f`dc11faa0 8b0f            mov     ecx,dword ptr [rdi]
fffff80f`dc11faa2 48ff15773afeff  call    qword ptr [pci!_imp_RtlNumberOfSetBitsUlongPtr (fffff80f`dc103520)]
fffff80f`dc11faa9 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc11faae 03d8            add     ebx,eax
fffff80f`dc11fab0 488d7f04        lea     rdi,[rdi+4]
fffff80f`dc11fab4 4883ee01        sub     rsi,1
fffff80f`dc11fab8 75e6            jne     pci!PciBuildRequirementsList+0x10460 (fffff80f`dc11faa0)  Branch

pci!PciBuildRequirementsList+0x1047a:
fffff80f`dc11faba 440fb6542430    movzx   r10d,byte ptr [rsp+30h]
fffff80f`dc11fac0 e907fffeff      jmp     pci!PciBuildRequirementsList+0x38c (fffff80f`dc10f9cc)  Branch

pci!PciBuildRequirementsList+0x10485:
fffff80f`dc11fac5 02d2            add     dl,dl
fffff80f`dc11fac7 88542438        mov     byte ptr [rsp+38h],dl
fffff80f`dc11facb e91ffffeff      jmp     pci!PciBuildRequirementsList+0x3af (fffff80f`dc10f9ef)  Branch

pci!PciBuildRequirementsList+0x10490:
fffff80f`dc11fad0 49b80000000000200000 mov r8,200000000000h
fffff80f`dc11fada 4d858548050000  test    qword ptr [r13+548h],r8
fffff80f`dc11fae1 0f8415fffeff    je      pci!PciBuildRequirementsList+0x3bc (fffff80f`dc10f9fc)  Branch

pci!PciBuildRequirementsList+0x104a7:
fffff80f`dc11fae7 0fb6c2          movzx   eax,dl
fffff80f`dc11faea d0e8            shr     al,1
fffff80f`dc11faec 8844243a        mov     byte ptr [rsp+3Ah],al
fffff80f`dc11faf0 e907fffeff      jmp     pci!PciBuildRequirementsList+0x3bc (fffff80f`dc10f9fc)  Branch

pci!PciBuildRequirementsList+0x104b5:
fffff80f`dc11faf5 0fb6442438      movzx   eax,byte ptr [rsp+38h]
fffff80f`dc11fafa d0e8            shr     al,1
fffff80f`dc11fafc 443ac0          cmp     r8b,al
fffff80f`dc11faff 0f82fd01ffff    jb      pci!PciBuildRequirementsList+0x6c2 (fffff80f`dc10fd02)  Branch

pci!PciBuildRequirementsList+0x104c5:
fffff80f`dc11fb05 e9e801ffff      jmp     pci!PciBuildRequirementsList+0x6b2 (fffff80f`dc10fcf2)  Branch

pci!PciBuildRequirementsList+0x104ca:
fffff80f`dc11fb0a 4c8d4d90        lea     r9,[rbp-70h]
fffff80f`dc11fb0e 33d2            xor     edx,edx
fffff80f`dc11fb10 4c8d4598        lea     r8,[rbp-68h]
fffff80f`dc11fb14 488bcb          mov     rcx,rbx
fffff80f`dc11fb17 48ff15c23bfeff  call    qword ptr [pci!_imp_RtlIoDecodeMemIoResource (fffff80f`dc1036e0)]
fffff80f`dc11fb1e 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc11fb23 488b4d80        mov     rcx,qword ptr [rbp-80h]
fffff80f`dc11fb27 48894588        mov     qword ptr [rbp-78h],rax
fffff80f`dc11fb2b 8b01            mov     eax,dword ptr [rcx]
fffff80f`dc11fb2d 0fbdc8          bsr     ecx,eax
fffff80f`dc11fb30 0f8491000000    je      pci!PciBuildRequirementsList+0x10587 (fffff80f`dc11fbc7)  Branch

pci!PciBuildRequirementsList+0x104f6:
fffff80f`dc11fb36 4c8b6c2440      mov     r13,qword ptr [rsp+40h]
fffff80f`dc11fb3b 4c8b7588        mov     r14,qword ptr [rbp-78h]

pci!PciBuildRequirementsList+0x104ff:
fffff80f`dc11fb3f 0fb3c8          btr     eax,ecx
fffff80f`dc11fb42 41b801000000    mov     r8d,1
fffff80f`dc11fb48 83c114          add     ecx,14h
fffff80f`dc11fb4b 8944243c        mov     dword ptr [rsp+3Ch],eax
fffff80f`dc11fb4f 49d3e0          shl     r8,cl
fffff80f`dc11fb52 4d3bc6          cmp     r8,r14
fffff80f`dc11fb55 7659            jbe     pci!PciBuildRequirementsList+0x10570 (fffff80f`dc11fbb0)  Branch

pci!PciBuildRequirementsList+0x10517:
fffff80f`dc11fb57 0f1003          movups  xmm0,xmmword ptr [rbx]
fffff80f`dc11fb5a 418bcc          mov     ecx,r12d
fffff80f`dc11fb5d 4d8bc8          mov     r9,r8
fffff80f`dc11fb60 48c1e105        shl     rcx,5
fffff80f`dc11fb64 b203            mov     dl,3
fffff80f`dc11fb66 4903cd          add     rcx,r13
fffff80f`dc11fb69 0f1101          movups  xmmword ptr [rcx],xmm0
fffff80f`dc11fb6c 0f104b10        movups  xmm1,xmmword ptr [rbx+10h]
fffff80f`dc11fb70 0f114910        movups  xmmword ptr [rcx+10h],xmm1
fffff80f`dc11fb74 488b4590        mov     rax,qword ptr [rbp-70h]
fffff80f`dc11fb78 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`dc11fb7d 488b4598        mov     rax,qword ptr [rbp-68h]
fffff80f`dc11fb81 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`dc11fb86 48ff15333afeff  call    qword ptr [pci!_imp_RtlIoEncodeMemIoResource (fffff80f`dc1035c0)]
fffff80f`dc11fb8d 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc11fb92 85c0            test    eax,eax
fffff80f`dc11fb94 7803            js      pci!PciBuildRequirementsList+0x10559 (fffff80f`dc11fb99)  Branch

pci!PciBuildRequirementsList+0x10556:
fffff80f`dc11fb96 41ffc4          inc     r12d

pci!PciBuildRequirementsList+0x10559:
fffff80f`dc11fb99 8b44243c        mov     eax,dword ptr [rsp+3Ch]
fffff80f`dc11fb9d 85c0            test    eax,eax
fffff80f`dc11fb9f 740a            je      pci!PciBuildRequirementsList+0x1056b (fffff80f`dc11fbab)  Branch

pci!PciBuildRequirementsList+0x10561:
fffff80f`dc11fba1 0fbcc8          bsf     ecx,eax
fffff80f`dc11fba4 b801000000      mov     eax,1
fffff80f`dc11fba9 d3e0            shl     eax,cl

pci!PciBuildRequirementsList+0x1056b:
fffff80f`dc11fbab 0fbdc8          bsr     ecx,eax
fffff80f`dc11fbae 758f            jne     pci!PciBuildRequirementsList+0x104ff (fffff80f`dc11fb3f)  Branch

pci!PciBuildRequirementsList+0x10570:
fffff80f`dc11fbb0 4c8b742460      mov     r14,qword ptr [rsp+60h]
fffff80f`dc11fbb5 4c8b6da0        mov     r13,qword ptr [rbp-60h]
fffff80f`dc11fbb9 448964243c      mov     dword ptr [rsp+3Ch],r12d
fffff80f`dc11fbbe 4533e4          xor     r12d,r12d
fffff80f`dc11fbc1 8b54243c        mov     edx,dword ptr [rsp+3Ch]
fffff80f`dc11fbc5 eb03            jmp     pci!PciBuildRequirementsList+0x1058a (fffff80f`dc11fbca)  Branch

pci!PciBuildRequirementsList+0x10587:
fffff80f`dc11fbc7 418bd4          mov     edx,r12d

pci!PciBuildRequirementsList+0x1058a:
fffff80f`dc11fbca 448b4c2434      mov     r9d,dword ptr [rsp+34h]
fffff80f`dc11fbcf 4c8b542440      mov     r10,qword ptr [rsp+40h]
fffff80f`dc11fbd4 e94f01ffff      jmp     pci!PciBuildRequirementsList+0x6e8 (fffff80f`dc10fd28)  Branch

pci!PciBuildRequirementsList+0x10599:
fffff80f`dc11fbd9 410fb785f8030000 movzx   eax,word ptr [r13+3F8h]
fffff80f`dc11fbe1 a801            test    al,1
fffff80f`dc11fbe3 740a            je      pci!PciBuildRequirementsList+0x105af (fffff80f`dc11fbef)  Branch

pci!PciBuildRequirementsList+0x105a5:
fffff80f`dc11fbe5 807b0101        cmp     byte ptr [rbx+1],1
fffff80f`dc11fbe9 0f842802ffff    je      pci!PciBuildRequirementsList+0x7d7 (fffff80f`dc10fe17)  Branch

pci!PciBuildRequirementsList+0x105af:
fffff80f`dc11fbef a802            test    al,2
fffff80f`dc11fbf1 0f840602ffff    je      pci!PciBuildRequirementsList+0x7bd (fffff80f`dc10fdfd)  Branch

pci!PciBuildRequirementsList+0x105b7:
fffff80f`dc11fbf7 0fb64301        movzx   eax,byte ptr [rbx+1]
fffff80f`dc11fbfb 2c03            sub     al,3
fffff80f`dc11fbfd a8fb            test    al,0FBh
fffff80f`dc11fbff 0f841202ffff    je      pci!PciBuildRequirementsList+0x7d7 (fffff80f`dc10fe17)  Branch

pci!PciBuildRequirementsList+0x105c5:
fffff80f`dc11fc05 e9f301ffff      jmp     pci!PciBuildRequirementsList+0x7bd (fffff80f`dc10fdfd)  Branch

pci!PciBuildRequirementsList+0x105ca:
fffff80f`dc11fc0a 498bca          mov     rcx,r10
fffff80f`dc11fc0d e83217fbff      call    pci!NullResourceRequirement (fffff80f`dc0d1344)
fffff80f`dc11fc12 ba01000000      mov     edx,1
fffff80f`dc11fc17 e92102ffff      jmp     pci!PciBuildRequirementsList+0x7fd (fffff80f`dc10fe3d)  Branch

pci!PciBuildRequirementsList+0x105dc:
fffff80f`dc11fc1c 83f901          cmp     ecx,1
fffff80f`dc11fc1f 0f856bfffeff    jne     pci!PciBuildRequirementsList+0x550 (fffff80f`dc10fb90)  Branch

pci!PciBuildRequirementsList+0x105e5:
fffff80f`dc11fc25 410f1085d8030000 movups  xmm0,xmmword ptr [r13+3D8h]
fffff80f`dc11fc2d 410f1102        movups  xmmword ptr [r10],xmm0
fffff80f`dc11fc31 410f108de8030000 movups  xmm1,xmmword ptr [r13+3E8h]
fffff80f`dc11fc39 410f114a10      movups  xmmword ptr [r10+10h],xmm1
fffff80f`dc11fc3e e948fffeff      jmp     pci!PciBuildRequirementsList+0x54b (fffff80f`dc10fb8b)  Branch

pci!PciBuildRequirementsList+0x10603:
fffff80f`dc11fc43 41c6420181      mov     byte ptr [r10+1],81h
fffff80f`dc11fc48 bb01000000      mov     ebx,1
fffff80f`dc11fc4d 41c7420803000000 mov     dword ptr [r10+8],3
fffff80f`dc11fc55 b820000000      mov     eax,20h
fffff80f`dc11fc5a 41c7420c03000000 mov     dword ptr [r10+0Ch],3
fffff80f`dc11fc62 41c6422103      mov     byte ptr [r10+21h],3
fffff80f`dc11fc67 6645896224      mov     word ptr [r10+24h],r12w
fffff80f`dc11fc6c 8d4b23          lea     ecx,[rbx+23h]
fffff80f`dc11fc6f 49c7423000000a00 mov     qword ptr [r10+30h],0A0000h
fffff80f`dc11fc77 49c74238ffff0b00 mov     qword ptr [r10+38h],0BFFFFh
fffff80f`dc11fc7f 41c7422800000200 mov     dword ptr [r10+28h],20000h
fffff80f`dc11fc87 41895a2c        mov     dword ptr [r10+2Ch],ebx
fffff80f`dc11fc8b 41885a41        mov     byte ptr [r10+41h],bl
fffff80f`dc11fc8f 6641894244      mov     word ptr [r10+44h],ax
fffff80f`dc11fc94 6683e210        and     dx,10h
fffff80f`dc11fc98 7505            jne     pci!PciBuildRequirementsList+0x1065f (fffff80f`dc11fc9f)  Branch

pci!PciBuildRequirementsList+0x1065a:
fffff80f`dc11fc9a 6641894a44      mov     word ptr [r10+44h],cx

pci!PciBuildRequirementsList+0x1065f:
fffff80f`dc11fc9f 49c74250b0030000 mov     qword ptr [r10+50h],3B0h
fffff80f`dc11fca7 49c74258bb030000 mov     qword ptr [r10+58h],3BBh
fffff80f`dc11fcaf 41c742480c000000 mov     dword ptr [r10+48h],0Ch
fffff80f`dc11fcb7 41895a4c        mov     dword ptr [r10+4Ch],ebx
fffff80f`dc11fcbb 41885a61        mov     byte ptr [r10+61h],bl
fffff80f`dc11fcbf 6641894264      mov     word ptr [r10+64h],ax
fffff80f`dc11fcc4 6685d2          test    dx,dx
fffff80f`dc11fcc7 7505            jne     pci!PciBuildRequirementsList+0x1068e (fffff80f`dc11fcce)  Branch

pci!PciBuildRequirementsList+0x10689:
fffff80f`dc11fcc9 6641894a64      mov     word ptr [r10+64h],cx

pci!PciBuildRequirementsList+0x1068e:
fffff80f`dc11fcce 4183c104        add     r9d,4
fffff80f`dc11fcd2 49c74270c0030000 mov     qword ptr [r10+70h],3C0h
fffff80f`dc11fcda 49c74278df030000 mov     qword ptr [r10+78h],3DFh
fffff80f`dc11fce2 41894268        mov     dword ptr [r10+68h],eax
fffff80f`dc11fce6 41895a6c        mov     dword ptr [r10+6Ch],ebx
fffff80f`dc11fcea 4983ea80        sub     r10,0FFFFFFFFFFFFFF80h
fffff80f`dc11fcee e9fbfefeff      jmp     pci!PciBuildRequirementsList+0x5ae (fffff80f`dc10fbee)  Branch

pci!PciBuildRequirementsList+0x106b3:
fffff80f`dc11fcf3 bf9a0000c0      mov     edi,0C000009Ah
fffff80f`dc11fcf8 ba50636942      mov     edx,42696350h
fffff80f`dc11fcfd 488bce          mov     rcx,rsi
fffff80f`dc11fd00 48ff15513afeff  call    qword ptr [pci!_imp_ExFreePoolWithTag (fffff80f`dc103758)]
fffff80f`dc11fd07 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`dc11fd0c eb05            jmp     pci!PciBuildRequirementsList+0x106d3 (fffff80f`dc11fd13)  Branch

pci!PciBuildRequirementsList+0x106ce:
fffff80f`dc11fd0e bf9a0000c0      mov     edi,0C000009Ah

pci!PciBuildRequirementsList+0x106d3:
fffff80f`dc11fd13 8bc7            mov     eax,edi
fffff80f`dc11fd15 e97ffffeff      jmp     pci!PciBuildRequirementsList+0x659 (fffff80f`dc10fc99)  Branch
