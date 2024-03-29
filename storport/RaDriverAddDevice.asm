10: kd> uf RaDriverAddDevice
storport!RaDriverAddDevice:
fffff80f`2d2dd800 48895c2408      mov     qword ptr [rsp+8],rbx
fffff80f`2d2dd805 4889742410      mov     qword ptr [rsp+10h],rsi
fffff80f`2d2dd80a 55              push    rbp
fffff80f`2d2dd80b 57              push    rdi
fffff80f`2d2dd80c 4154            push    r12
fffff80f`2d2dd80e 4156            push    r14
fffff80f`2d2dd810 4157            push    r15
fffff80f`2d2dd812 488bec          mov     rbp,rsp
fffff80f`2d2dd815 4883ec70        sub     rsp,70h
fffff80f`2d2dd819 33c0            xor     eax,eax
fffff80f`2d2dd81b 4c8bfa          mov     r15,rdx
fffff80f`2d2dd81e 488945d0        mov     qword ptr [rbp-30h],rax
fffff80f`2d2dd822 488bf9          mov     rdi,rcx
fffff80f`2d2dd825 488945d8        mov     qword ptr [rbp-28h],rax
fffff80f`2d2dd829 488b0dd0370400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80f`2d321000)]
fffff80f`2d2dd830 488d05c9370400  lea     rax,[storport!WPP_GLOBAL_Control (fffff80f`2d321000)]
fffff80f`2d2dd837 483bc8          cmp     rcx,rax
fffff80f`2d2dd83a 740b            je      storport!RaDriverAddDevice+0x47 (fffff80f`2d2dd847)  Branch

storport!RaDriverAddDevice+0x3c:
fffff80f`2d2dd83c 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80f`2d2dd83f a802            test    al,2
fffff80f`2d2dd841 0f8575300100    jne     storport!RaDriverAddDevice+0x130bc (fffff80f`2d2f08bc)  Branch

storport!RaDriverAddDevice+0x47:
fffff80f`2d2dd847 4533e4          xor     r12d,r12d
fffff80f`2d2dd84a 4c8d4540        lea     r8,[rbp+40h]
fffff80f`2d2dd84e 33c0            xor     eax,eax
fffff80f`2d2dd850 4c896548        mov     qword ptr [rbp+48h],r12
fffff80f`2d2dd854 488945d0        mov     qword ptr [rbp-30h],rax
fffff80f`2d2dd858 488d55d0        lea     rdx,[rbp-30h]
fffff80f`2d2dd85c 498bcf          mov     rcx,r15
fffff80f`2d2dd85f 66448965d2      mov     word ptr [rbp-2Eh],r12w
fffff80f`2d2dd864 4c8965d8        mov     qword ptr [rbp-28h],r12
fffff80f`2d2dd868 e873efffff      call    storport!RaidCreateDeviceName (fffff80f`2d2dc7e0)
fffff80f`2d2dd86d 8b052d3a0400    mov     eax,dword ptr [storport!RaidLogListSize (fffff80f`2d3212a0)]
fffff80f`2d2dd873 458d4c2404      lea     r9d,[r12+4]
fffff80f`2d2dd878 4c8d45d0        lea     r8,[rbp-30h]
fffff80f`2d2dd87c 488bcf          mov     rcx,rdi
fffff80f`2d2dd87f 8d1440          lea     edx,[rax+rax*2]
fffff80f`2d2dd882 488d4548        lea     rax,[rbp+48h]
fffff80f`2d2dd886 c1e204          shl     edx,4
fffff80f`2d2dd889 4889442430      mov     qword ptr [rsp+30h],rax
fffff80f`2d2dd88e 81c200170000    add     edx,1700h
fffff80f`2d2dd894 4488642428      mov     byte ptr [rsp+28h],r12b
fffff80f`2d2dd899 c744242000010000 mov     dword ptr [rsp+20h],100h
fffff80f`2d2dd8a1 48ff15a09a0400  call    qword ptr [storport!_imp_IoCreateDevice (fffff80f`2d327348)]
fffff80f`2d2dd8a8 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2dd8ad 448bf0          mov     r14d,eax
fffff80f`2d2dd8b0 85c0            test    eax,eax
fffff80f`2d2dd8b2 0f88e1000000    js      storport!RaDriverAddDevice+0x199 (fffff80f`2d2dd999)  Branch

storport!RaDriverAddDevice+0xb8:
fffff80f`2d2dd8b8 488b4548        mov     rax,qword ptr [rbp+48h]
fffff80f`2d2dd8bc 488b5840        mov     rbx,qword ptr [rax+40h]
fffff80f`2d2dd8c0 488bcb          mov     rcx,rbx
fffff80f`2d2dd8c3 e854020000      call    storport!RaidCreateAdapter (fffff80f`2d2ddb1c)
fffff80f`2d2dd8c8 488d1591f20100  lea     rdx,[storport!DriverEntry (fffff80f`2d2fcb60)]
fffff80f`2d2dd8cf 488bcf          mov     rcx,rdi
fffff80f`2d2dd8d2 48ff15579a0400  call    qword ptr [storport!_imp_IoGetDriverObjectExtension (fffff80f`2d327330)]
fffff80f`2d2dd8d9 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2dd8de 488b4d48        mov     rcx,qword ptr [rbp+48h]
fffff80f`2d2dd8e2 498bd7          mov     rdx,r15
fffff80f`2d2dd8e5 488bf0          mov     rsi,rax
fffff80f`2d2dd8e8 48ff15499a0400  call    qword ptr [storport!_imp_IoAttachDeviceToDeviceStack (fffff80f`2d327338)]
fffff80f`2d2dd8ef 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2dd8f4 488bf8          mov     rdi,rax
fffff80f`2d2dd8f7 4885c0          test    rax,rax
fffff80f`2d2dd8fa 0f84e92f0100    je      storport!RaDriverAddDevice+0x130e9 (fffff80f`2d2f08e9)  Branch

storport!RaDriverAddDevice+0x100:
fffff80f`2d2dd900 8b4540          mov     eax,dword ptr [rbp+40h]
fffff80f`2d2dd903 4c8bcf          mov     r9,rdi
fffff80f`2d2dd906 488b5548        mov     rdx,qword ptr [rbp+48h]
fffff80f`2d2dd90a 4c8bc6          mov     r8,rsi
fffff80f`2d2dd90d 89442430        mov     dword ptr [rsp+30h],eax
fffff80f`2d2dd911 488bcb          mov     rcx,rbx
fffff80f`2d2dd914 488d45d0        lea     rax,[rbp-30h]
fffff80f`2d2dd918 4889442428      mov     qword ptr [rsp+28h],rax
fffff80f`2d2dd91d 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff80f`2d2dd922 e8c1f90400      call    storport!RaidInitializeAdapter (fffff80f`2d32d2e8)
fffff80f`2d2dd927 4c8965d8        mov     qword ptr [rbp-28h],r12
fffff80f`2d2dd92b 448bf0          mov     r14d,eax
fffff80f`2d2dd92e 85c0            test    eax,eax
fffff80f`2d2dd930 0f88b92f0100    js      storport!RaDriverAddDevice+0x130ef (fffff80f`2d2f08ef)  Branch

storport!RaDriverAddDevice+0x136:
fffff80f`2d2dd936 488d4e50        lea     rcx,[rsi+50h]
fffff80f`2d2dd93a 488d55e0        lea     rdx,[rbp-20h]
fffff80f`2d2dd93e 48ff156b990400  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff80f`2d3272b0)]
fffff80f`2d2dd945 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2dd94a 488d4638        lea     rax,[rsi+38h]
fffff80f`2d2dd94e 488b10          mov     rdx,qword ptr [rax]
fffff80f`2d2dd951 488d4b40        lea     rcx,[rbx+40h]
fffff80f`2d2dd955 48394208        cmp     qword ptr [rdx+8],rax
fffff80f`2d2dd959 0f85cb2f0100    jne     storport!RaDriverAddDevice+0x1312a (fffff80f`2d2f092a)  Branch

storport!RaDriverAddDevice+0x15f:
fffff80f`2d2dd95f 488911          mov     qword ptr [rcx],rdx
fffff80f`2d2dd962 48894108        mov     qword ptr [rcx+8],rax
fffff80f`2d2dd966 48894a08        mov     qword ptr [rdx+8],rcx
fffff80f`2d2dd96a 488908          mov     qword ptr [rax],rcx
fffff80f`2d2dd96d 488d4de0        lea     rcx,[rbp-20h]
fffff80f`2d2dd971 ff4648          inc     dword ptr [rsi+48h]
fffff80f`2d2dd974 48ff15b5960400  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff80f`2d327030)]
fffff80f`2d2dd97b 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2dd980 488bcb          mov     rcx,rbx
fffff80f`2d2dd983 e840000000      call    storport!RaidAdapterHack (fffff80f`2d2dd9c8)
fffff80f`2d2dd988 488b4548        mov     rax,qword ptr [rbp+48h]
fffff80f`2d2dd98c 83483010        or      dword ptr [rax+30h],10h
fffff80f`2d2dd990 488b4548        mov     rax,qword ptr [rbp+48h]
fffff80f`2d2dd994 0fba703007      btr     dword ptr [rax+30h],7

storport!RaDriverAddDevice+0x199:
fffff80f`2d2dd999 488b4dd8        mov     rcx,qword ptr [rbp-28h]
fffff80f`2d2dd99d 4885c9          test    rcx,rcx
fffff80f`2d2dd9a0 0f858b2f0100    jne     storport!RaDriverAddDevice+0x13131 (fffff80f`2d2f0931)  Branch

storport!RaDriverAddDevice+0x1a6:
fffff80f`2d2dd9a6 4c8d5c2470      lea     r11,[rsp+70h]
fffff80f`2d2dd9ab 418bc6          mov     eax,r14d
fffff80f`2d2dd9ae 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff80f`2d2dd9b2 498b7338        mov     rsi,qword ptr [r11+38h]
fffff80f`2d2dd9b6 498be3          mov     rsp,r11
fffff80f`2d2dd9b9 415f            pop     r15
fffff80f`2d2dd9bb 415e            pop     r14
fffff80f`2d2dd9bd 415c            pop     r12
fffff80f`2d2dd9bf 5f              pop     rdi
fffff80f`2d2dd9c0 5d              pop     rbp
fffff80f`2d2dd9c1 c3              ret

storport!RaDriverAddDevice+0x130bc:
fffff80f`2d2f08bc 80792904        cmp     byte ptr [rcx+29h],4
fffff80f`2d2f08c0 0f8281cffeff    jb      storport!RaDriverAddDevice+0x47 (fffff80f`2d2dd847)  Branch

storport!RaDriverAddDevice+0x130c6:
fffff80f`2d2f08c6 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80f`2d2f08ca 4c8d055f9d0200  lea     r8,[storport!WPP_fca335724287372554e4fcd7cdd207c8_Traceguids (fffff80f`2d31a630)]
fffff80f`2d2f08d1 ba0b000000      mov     edx,0Bh
fffff80f`2d2f08d6 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff80f`2d2f08db 4c8bcf          mov     r9,rdi
fffff80f`2d2f08de e845b00000      call    storport!WPP_SF_qq (fffff80f`2d2fb928)
fffff80f`2d2f08e3 90              nop
fffff80f`2d2f08e4 e95ecffeff      jmp     storport!RaDriverAddDevice+0x47 (fffff80f`2d2dd847)  Branch

storport!RaDriverAddDevice+0x130e9:
fffff80f`2d2f08e9 41be010000c0    mov     r14d,0C0000001h

storport!RaDriverAddDevice+0x130ef:
fffff80f`2d2f08ef 4885db          test    rbx,rbx
fffff80f`2d2f08f2 0f84a1d0feff    je      storport!RaDriverAddDevice+0x199 (fffff80f`2d2dd999)  Branch

storport!RaDriverAddDevice+0x130f8:
fffff80f`2d2f08f8 4885ff          test    rdi,rdi
fffff80f`2d2f08fb 740f            je      storport!RaDriverAddDevice+0x1310c (fffff80f`2d2f090c)  Branch

storport!RaDriverAddDevice+0x130fd:
fffff80f`2d2f08fd 488bcf          mov     rcx,rdi
fffff80f`2d2f0900 48ff1589670300  call    qword ptr [storport!_imp_IoDetachDevice (fffff80f`2d327090)]
fffff80f`2d2f0907 0f1f440000      nop     dword ptr [rax+rax]

storport!RaDriverAddDevice+0x1310c:
fffff80f`2d2f090c 488bcb          mov     rcx,rbx
fffff80f`2d2f090f e8dc9d0000      call    storport!RaidDeleteAdapter (fffff80f`2d2fa6f0)
fffff80f`2d2f0914 488b4d48        mov     rcx,qword ptr [rbp+48h]
fffff80f`2d2f0918 48ff1509680300  call    qword ptr [storport!_imp_IoDeleteDevice (fffff80f`2d327128)]
fffff80f`2d2f091f 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2f0924 90              nop
fffff80f`2d2f0925 e96fd0feff      jmp     storport!RaDriverAddDevice+0x199 (fffff80f`2d2dd999)  Branch

storport!RaDriverAddDevice+0x1312a:
fffff80f`2d2f092a b903000000      mov     ecx,3
fffff80f`2d2f092f cd29            int     29h

storport!RaDriverAddDevice+0x13131:
fffff80f`2d2f0931 33d2            xor     edx,edx
fffff80f`2d2f0933 48ff15ee680300  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff80f`2d327228)]
fffff80f`2d2f093a 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2f093f 90              nop
fffff80f`2d2f0940 e961d0feff      jmp     storport!RaDriverAddDevice+0x1a6 (fffff80f`2d2dd9a6)  Branch
