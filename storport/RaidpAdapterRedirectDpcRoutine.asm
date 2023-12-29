0: kd> uf storport!RaidpAdapterRedirectDpcRoutine
storport!RaidpAdapterRedirectDpcRoutine:
fffff806`281db7a0 4c8bdc          mov     r11,rsp
fffff806`281db7a3 55              push    rbp
fffff806`281db7a4 56              push    rsi
fffff806`281db7a5 4881ec88000000  sub     rsp,88h
fffff806`281db7ac 33c0            xor     eax,eax
fffff806`281db7ae 49895b08        mov     qword ptr [r11+8],rbx
fffff806`281db7b2 4d8973e8        mov     qword ptr [r11-18h],r14
fffff806`281db7b6 488d5a40        lea     rbx,[rdx+40h]
fffff806`281db7ba 49be2003000080f7ffff mov r14,0FFFFF78000000320h
fffff806`281db7c4 498943c8        mov     qword ptr [r11-38h],rax
fffff806`281db7c8 33f6            xor     esi,esi
fffff806`281db7ca 498be8          mov     rbp,r8
fffff806`281db7cd 498b06          mov     rax,qword ptr [r14]
fffff806`281db7d0 403835b9600400  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff806`28221890)],sil
fffff806`281db7d7 4889442468      mov     qword ptr [rsp+68h],rax
fffff806`281db7dc 740d            je      storport!RaidpAdapterRedirectDpcRoutine+0x4b (fffff806`281db7eb)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x3e:
fffff806`281db7de f605fe5f040004  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff806`282217e3)],4
fffff806`281db7e5 0f855d630100    jne     storport!RaidpAdapterRedirectDpcRoutine+0x163a8 (fffff806`281f1b48)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x4b:
fffff806`281db7eb 488b6d40        mov     rbp,qword ptr [rbp+40h]
fffff806`281db7ef 488bcb          mov     rcx,rbx
fffff806`281db7f2 48ff1567b80400  call    qword ptr [storport!_imp_ExpInterlockedFlushSList (fffff806`28227060)]
fffff806`281db7f9 0f1f440000      nop     dword ptr [rax+rax]
fffff806`281db7fe 488bd8          mov     rbx,rax
fffff806`281db801 4885c0          test    rax,rax
fffff806`281db804 7438            je      storport!RaidpAdapterRedirectDpcRoutine+0x9e (fffff806`281db83e)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x66:
fffff806`281db806 4889bc24b8000000 mov     qword ptr [rsp+0B8h],rdi

;0x6e ~ 0x95 : loop check CompleteList until list empty...
storport!RaidpAdapterRedirectDpcRoutine+0x6e:
fffff806`281db80e f643f101        test    byte ptr [rbx-0Fh],1
fffff806`281db812 488d7be0        lea     rdi,[rbx-20h]                 ;rbx==XRB->CompleteList, rdi==XRB
fffff806`281db816 488b1b          mov     rbx,qword ptr [rbx]           ;if(XRB->DoExtraAdapterDereference) call RaidAdapterPoFxIdleComponent()
fffff806`281db819 0f8558630100    jne     storport!RaidpAdapterRedirectDpcRoutine+0x163d7 (fffff806`281f1b77)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x7f:
fffff806`281db81f 488b8790020000  mov     rax,qword ptr [rdi+290h]      ;XRB->CompletionRoutine => 多半呼叫 RaidUnitCompleteRequest()
fffff806`281db826 488bcf          mov     rcx,rdi                       ;XRB
fffff806`281db829 ff15f9bf0400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff806`28227828)]
fffff806`281db82f ffc6            inc     esi
fffff806`281db831 4885db          test    rbx,rbx
fffff806`281db834 75d8            jne     storport!RaidpAdapterRedirectDpcRoutine+0x6e (fffff806`281db80e)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x96:
fffff806`281db836 488bbc24b8000000 mov     rdi,qword ptr [rsp+0B8h]

storport!RaidpAdapterRedirectDpcRoutine+0x9e:
fffff806`281db83e 498b06          mov     rax,qword ptr [r14]
fffff806`281db841 4c8bb42480000000 mov     r14,qword ptr [rsp+80h]
fffff806`281db849 488b9c24a0000000 mov     rbx,qword ptr [rsp+0A0h]
fffff806`281db851 48898424a8000000 mov     qword ptr [rsp+0A8h],rax
fffff806`281db859 488b8c24a8000000 mov     rcx,qword ptr [rsp+0A8h]
fffff806`281db861 488b442468      mov     rax,qword ptr [rsp+68h]
fffff806`281db866 482bc8          sub     rcx,rax
fffff806`281db869 898c24a8000000  mov     dword ptr [rsp+0A8h],ecx
fffff806`281db870 8b8424a8000000  mov     eax,dword ptr [rsp+0A8h]
fffff806`281db877 3b85f8120000    cmp     eax,dword ptr [rbp+12F8h]
fffff806`281db87d 7728            ja      storport!RaidpAdapterRedirectDpcRoutine+0x107 (fffff806`281db8a7)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0xdf:
fffff806`281db87f 3bb5f4120000    cmp     esi,dword ptr [rbp+12F4h]
fffff806`281db885 7735            ja      storport!RaidpAdapterRedirectDpcRoutine+0x11c (fffff806`281db8bc)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0xe7:
fffff806`281db887 803d0260040000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff806`28221890)],0
fffff806`281db88e 740d            je      storport!RaidpAdapterRedirectDpcRoutine+0xfd (fffff806`281db89d)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0xf0:
fffff806`281db890 f6054c5f040004  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff806`282217e3)],4
fffff806`281db897 0f85f8620100    jne     storport!RaidpAdapterRedirectDpcRoutine+0x163f5 (fffff806`281f1b95)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0xfd:
fffff806`281db89d 4881c488000000  add     rsp,88h
fffff806`281db8a4 5e              pop     rsi
fffff806`281db8a5 5d              pop     rbp
fffff806`281db8a6 c3              ret

storport!RaidpAdapterRedirectDpcRoutine+0x107:
fffff806`281db8a7 8b8424a8000000  mov     eax,dword ptr [rsp+0A8h]
fffff806`281db8ae 8985f8120000    mov     dword ptr [rbp+12F8h],eax
fffff806`281db8b4 89b5fc120000    mov     dword ptr [rbp+12FCh],esi
fffff806`281db8ba ebc3            jmp     storport!RaidpAdapterRedirectDpcRoutine+0xdf (fffff806`281db87f)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x11c:
fffff806`281db8bc 89b5f4120000    mov     dword ptr [rbp+12F4h],esi
fffff806`281db8c2 ebc3            jmp     storport!RaidpAdapterRedirectDpcRoutine+0xe7 (fffff806`281db887)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x163a8:
fffff806`281f1b48 40383521fd0200  cmp     byte ptr [storport!UseQPCTime (fffff806`28221870)],sil
fffff806`281f1b4f 7410            je      storport!RaidpAdapterRedirectDpcRoutine+0x163c1 (fffff806`281f1b61)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x163b1:
fffff806`281f1b51 33c9            xor     ecx,ecx
fffff806`281f1b53 48ff15a6540300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff806`28227000)]
fffff806`281f1b5a 0f1f440000      nop     dword ptr [rax+rax]
fffff806`281f1b5f eb0c            jmp     storport!RaidpAdapterRedirectDpcRoutine+0x163cd (fffff806`281f1b6d)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x163c1:
fffff806`281f1b61 48ff1540550300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff806`282270a8)]
fffff806`281f1b68 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidpAdapterRedirectDpcRoutine+0x163cd:
fffff806`281f1b6d 4889442460      mov     qword ptr [rsp+60h],rax
fffff806`281f1b72 e9749cfeff      jmp     storport!RaidpAdapterRedirectDpcRoutine+0x4b (fffff806`281db7eb)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x163d7:
fffff806`281f1b77 8b97ec020000    mov     edx,dword ptr [rdi+2ECh]
fffff806`281f1b7d 4533c0          xor     r8d,r8d
fffff806`281f1b80 488b8fd8000000  mov     rcx,qword ptr [rdi+0D8h]
fffff806`281f1b87 e8e007ffff      call    storport!RaidAdapterPoFxIdleComponent (fffff806`281e236c)
fffff806`281f1b8c 806711fe        and     byte ptr [rdi+11h],0FEh
fffff806`281f1b90 e98a9cfeff      jmp     storport!RaidpAdapterRedirectDpcRoutine+0x7f (fffff806`281db81f)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x163f5:
fffff806`281f1b95 83fe19          cmp     esi,19h
fffff806`281f1b98 0f82ff9cfeff    jb      storport!RaidpAdapterRedirectDpcRoutine+0xfd (fffff806`281db89d)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x163fe:
fffff806`281f1b9e 803dcbfc020000  cmp     byte ptr [storport!UseQPCTime (fffff806`28221870)],0
fffff806`281f1ba5 48c78424b000000001000000 mov qword ptr [rsp+0B0h],1
fffff806`281f1bb1 7416            je      storport!RaidpAdapterRedirectDpcRoutine+0x16429 (fffff806`281f1bc9)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16413:
fffff806`281f1bb3 488d8c24b0000000 lea     rcx,[rsp+0B0h]
fffff806`281f1bbb 48ff153e540300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff806`28227000)]
fffff806`281f1bc2 0f1f440000      nop     dword ptr [rax+rax]
fffff806`281f1bc7 eb0c            jmp     storport!RaidpAdapterRedirectDpcRoutine+0x16435 (fffff806`281f1bd5)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16429:
fffff806`281f1bc9 48ff15d8540300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff806`282270a8)]
fffff806`281f1bd0 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidpAdapterRedirectDpcRoutine+0x16435:
fffff806`281f1bd5 4c8bc8          mov     r9,rax
fffff806`281f1bd8 488b442460      mov     rax,qword ptr [rsp+60h]
fffff806`281f1bdd 4d85c9          test    r9,r9
fffff806`281f1be0 7e0d            jle     storport!RaidpAdapterRedirectDpcRoutine+0x1644f (fffff806`281f1bef)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16442:
fffff806`281f1be2 4c3bc8          cmp     r9,rax
fffff806`281f1be5 7d08            jge     storport!RaidpAdapterRedirectDpcRoutine+0x1644f (fffff806`281f1bef)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16447:
fffff806`281f1be7 4c2bc8          sub     r9,rax
fffff806`281f1bea 49ffc9          dec     r9
fffff806`281f1bed eb03            jmp     storport!RaidpAdapterRedirectDpcRoutine+0x16452 (fffff806`281f1bf2)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x1644f:
fffff806`281f1bef 4c2bc8          sub     r9,rax

storport!RaidpAdapterRedirectDpcRoutine+0x16452:
fffff806`281f1bf2 803d77fc020000  cmp     byte ptr [storport!UseQPCTime (fffff806`28221870)],0
fffff806`281f1bf9 4c894c2470      mov     qword ptr [rsp+70h],r9
fffff806`281f1bfe 744e            je      storport!RaidpAdapterRedirectDpcRoutine+0x164ae (fffff806`281f1c4e)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16460:
fffff806`281f1c00 488b8c24b0000000 mov     rcx,qword ptr [rsp+0B0h]
fffff806`281f1c08 4533c0          xor     r8d,r8d
fffff806`281f1c0b 4885c9          test    rcx,rcx
fffff806`281f1c0e 7441            je      storport!RaidpAdapterRedirectDpcRoutine+0x164b1 (fffff806`281f1c51)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16470:
fffff806`281f1c10 4d85c9          test    r9,r9
fffff806`281f1c13 743c            je      storport!RaidpAdapterRedirectDpcRoutine+0x164b1 (fffff806`281f1c51)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x16475:
fffff806`281f1c15 33d2            xor     edx,edx
fffff806`281f1c17 498bc1          mov     rax,r9
fffff806`281f1c1a 48f7f1          div     rax,rcx
fffff806`281f1c1d 4c8bc0          mov     r8,rax
fffff806`281f1c20 4869c2e8030000  imul    rax,rdx,3E8h
fffff806`281f1c27 4d69c0e8030000  imul    r8,r8,3E8h
fffff806`281f1c2e 33d2            xor     edx,edx
fffff806`281f1c30 48f7f1          div     rax,rcx
fffff806`281f1c33 4c03c0          add     r8,rax
fffff806`281f1c36 4869c210270000  imul    rax,rdx,2710h
fffff806`281f1c3d 4d69c010270000  imul    r8,r8,2710h
fffff806`281f1c44 33d2            xor     edx,edx
fffff806`281f1c46 48f7f1          div     rax,rcx
fffff806`281f1c49 4c03c0          add     r8,rax
fffff806`281f1c4c eb03            jmp     storport!RaidpAdapterRedirectDpcRoutine+0x164b1 (fffff806`281f1c51)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x164ae:
fffff806`281f1c4e 4d8bc1          mov     r8,r9

storport!RaidpAdapterRedirectDpcRoutine+0x164b1:
fffff806`281f1c51 f6058bfb020004  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff806`282217e3)],4
fffff806`281f1c58 4c898424a8000000 mov     qword ptr [rsp+0A8h],r8
fffff806`281f1c60 0f84379cfeff    je      storport!RaidpAdapterRedirectDpcRoutine+0xfd (fffff806`281db89d)  Branch

storport!RaidpAdapterRedirectDpcRoutine+0x164c6:
fffff806`281f1c66 488b8424a8000000 mov     rax,qword ptr [rsp+0A8h]
fffff806`281f1c6e c744245000000000 mov     dword ptr [rsp+50h],0
fffff806`281f1c76 c744244800000000 mov     dword ptr [rsp+48h],0
fffff806`281f1c7e 4889442440      mov     qword ptr [rsp+40h],rax
fffff806`281f1c83 8b4538          mov     eax,dword ptr [rbp+38h]
fffff806`281f1c86 4c894c2438      mov     qword ptr [rsp+38h],r9
fffff806`281f1c8b 4c8d0d0e9bfeff  lea     r9,[storport!RaidpAdapterRedirectDpcRoutine (fffff806`281db7a0)]
fffff806`281f1c92 89742430        mov     dword ptr [rsp+30h],esi
fffff806`281f1c96 89442428        mov     dword ptr [rsp+28h],eax
fffff806`281f1c9a 488d056f840200  lea     rax,[storport!`string` (fffff806`2821a110)]
fffff806`281f1ca1 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`281f1ca6 e8b94c0000      call    storport!McTemplateK0pzqqxxtt (fffff806`281f6964)
fffff806`281f1cab 90              nop
fffff806`281f1cac e9ec9bfeff      jmp     storport!RaidpAdapterRedirectDpcRoutine+0xfd (fffff806`281db89d)  Branch
