0: kd> uf stornvme!WaitForCommandCompleteWithCustomTimeout
stornvme!WaitForCommandCompleteWithCustomTimeout:       ;WaitForCommandCompleteWithCustomTimeout(pAE, pAE+0x328, BOOL , DWORD timeout)
fffff806`a39180c4 48895c2408      mov     qword ptr [rsp+8],rbx
fffff806`a39180c9 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff806`a39180ce 4889742418      mov     qword ptr [rsp+18h],rsi
fffff806`a39180d3 57              push    rdi
fffff806`a39180d4 4154            push    r12
fffff806`a39180d6 4155            push    r13
fffff806`a39180d8 4156            push    r14
fffff806`a39180da 4157            push    r15
fffff806`a39180dc 4883ec20        sub     rsp,20h
fffff806`a39180e0 488bd9          mov     rbx,rcx
fffff806`a39180e3 418be9          mov     ebp,r9d
fffff806`a39180e6 488bca          mov     rcx,rdx
fffff806`a39180e9 458af0          mov     r14b,r8b
fffff806`a39180ec 488bfa          mov     rdi,rdx
fffff806`a39180ef e824d0feff      call    stornvme!GetSrbExtension (fffff806`a3905118)
fffff806`a39180f4 4c8b9388000000  mov     r10,qword ptr [rbx+88h]               ;rbx == pAE, rbx+88 == CtrlReg
fffff806`a39180fb 4532ff          xor     r15b,r15b
fffff806`a39180fe 4532e4          xor     r12b,r12b
fffff806`a3918101 4c8be8          mov     r13,rax
fffff806`a3918104 41b301          mov     r11b,1
fffff806`a3918107 418b5228        mov     edx,dword ptr [r10+28h]               ;ASQ.LowPart
fffff806`a391810b 418b4a2c        mov     ecx,dword ptr [r10+2Ch]               ;ASQ.HighPart
fffff806`a391810f 48c1e120        shl     rcx,20h
fffff806`a3918113 480bca          or      rcx,rdx                               ;combine ULONGLONG number =>
fffff806`a3918116 4883f9ff        cmp     rcx,0FFFFFFFFFFFFFFFFh
fffff806`a391811a 7509            jne     stornvme!WaitForCommandCompleteWithCustomTimeout+0x61 (fffff806`a3918125)  Branch ;if(ASQ==NULL) goto end(0x14b) => return;

stornvme!WaitForCommandCompleteWithCustomTimeout+0x58:
fffff806`a391811c c6470308        mov     byte ptr [rdi+3],8
fffff806`a3918120 e9ea000000      jmp     stornvme!WaitForCommandCompleteWithCustomTimeout+0x14b (fffff806`a391820f)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x61:
fffff806`a3918125 33f6            xor     esi,esi
fffff806`a3918127 85ed            test    ebp,ebp                       ;if arg4(wait timeout) == 0, goto 0x104
fffff806`a3918129 0f8499000000    je      stornvme!WaitForCommandCompleteWithCustomTimeout+0x104 (fffff806`a39181c8)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x6b:
fffff806`a391812f 4584db          test    r11b,r11b
fffff806`a3918132 0f848c000000    je      stornvme!WaitForCommandCompleteWithCustomTimeout+0x100 (fffff806`a39181c4)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x74:
fffff806`a3918138 4584f6          test    r14b,r14b         ;IF (BYTE arg3==FALSE) goto 0x9c
fffff806`a391813b 7423            je      stornvme!WaitForCommandCompleteWithCustomTimeout+0x9c (fffff806`a3918160)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x79:
fffff806`a391813d 4584ff          test    r15b,r15b         ;if (r15b!=FALSE) goto 0x9c
fffff806`a3918140 751e            jne     stornvme!WaitForCommandCompleteWithCustomTimeout+0x9c (fffff806`a3918160)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x7e:
fffff806`a3918142 33d2            xor     edx,edx
fffff806`a3918144 488bcb          mov     rcx,rbx
fffff806`a3918147 e884dffeff      call    stornvme!RequestPendingCompletion (fffff806`a39060d0)
fffff806`a391814c 84c0            test    al,al
fffff806`a391814e 7410            je      stornvme!WaitForCommandCompleteWithCustomTimeout+0x9c (fffff806`a3918160)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x8c:
fffff806`a3918150 33d2            xor     edx,edx
fffff806`a3918152 458ac6          mov     r8b,r14b      ;TRUE or FALSE <== 
fffff806`a3918155 488bcb          mov     rcx,rbx
fffff806`a3918158 e84ffbffff      call    stornvme!ProcessCompletionQueues (fffff806`a3917cac)  ;ProcessCompletionQueues(pAE, QID==0, ???);
fffff806`a391815d 41b701          mov     r15b,1

stornvme!WaitForCommandCompleteWithCustomTimeout+0x9c:
fffff806`a3918160 41b8e8030000    mov     r8d,3E8h                      ;1000 us
fffff806`a3918166 488bd3          mov     rdx,rbx
fffff806`a3918169 b951000000      mov     ecx,51h                       ;ExtFunctionDelayExecution
fffff806`a391816e 48ff15b37e0000  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`a3920028)]    ;StorPortDelayExecution()
fffff806`a3918175 0f1f440000      nop     dword ptr [rax+rax]
fffff806`a391817a 488bd7          mov     rdx,rdi
fffff806`a391817d 488bcb          mov     rcx,rbx
fffff806`a3918180 e8772affff      call    stornvme!IsInternalSrb (fffff806`a390abfc)
fffff806`a3918185 84c0            test    al,al
fffff806`a3918187 741f            je      stornvme!WaitForCommandCompleteWithCustomTimeout+0xe4 (fffff806`a39181a8)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0xc5:
fffff806`a3918189 488bd7          mov     rdx,rdi
fffff806`a391818c 488bcb          mov     rcx,rbx
fffff806`a391818f e86493feff      call    stornvme!GetLocalCommand (fffff806`a39014f8)
fffff806`a3918194 4885c0          test    rax,rax
fffff806`a3918197 740a            je      stornvme!WaitForCommandCompleteWithCustomTimeout+0xdf (fffff806`a39181a3)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0xd5:
fffff806`a3918199 833801          cmp     dword ptr [rax],1
fffff806`a391819c 7505            jne     stornvme!WaitForCommandCompleteWithCustomTimeout+0xdf (fffff806`a39181a3)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0xda:
fffff806`a391819e 41b301          mov     r11b,1
fffff806`a39181a1 eb17            jmp     stornvme!WaitForCommandCompleteWithCustomTimeout+0xf6 (fffff806`a39181ba)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0xdf:
fffff806`a39181a3 4532db          xor     r11b,r11b
fffff806`a39181a6 eb12            jmp     stornvme!WaitForCommandCompleteWithCustomTimeout+0xf6 (fffff806`a39181ba)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0xe4:
fffff806`a39181a8 458a9d9d100000  mov     r11b,byte ptr [r13+109Dh]
fffff806`a39181af 41c0eb03        shr     r11b,3
fffff806`a39181b3 41f6d3          not     r11b
fffff806`a39181b6 4180e301        and     r11b,1

stornvme!WaitForCommandCompleteWithCustomTimeout+0xf6:
fffff806`a39181ba ffc6            inc     esi
fffff806`a39181bc 3bf5            cmp     esi,ebp
fffff806`a39181be 0f826bffffff    jb      stornvme!WaitForCommandCompleteWithCustomTimeout+0x6b (fffff806`a391812f)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x100:
fffff806`a39181c4 3bf5            cmp     esi,ebp
fffff806`a39181c6 7223            jb      stornvme!WaitForCommandCompleteWithCustomTimeout+0x127 (fffff806`a39181eb)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x104:
fffff806`a39181c8 41b401          mov     r12b,1
fffff806`a39181cb 488b8b88000000  mov     rcx,qword ptr [rbx+88h]       ;pick pCtrlRegister to rcx
fffff806`a39181d2 8b4128          mov     eax,dword ptr [rcx+28h]       ;ASQ.LowPart
fffff806`a39181d5 8b492c          mov     ecx,dword ptr [rcx+2Ch]       ;ASQ.HighPart
fffff806`a39181d8 48c1e120        shl     rcx,20h
fffff806`a39181dc 480bc8          or      rcx,rax
fffff806`a39181df 4883f9ff        cmp     rcx,0FFFFFFFFFFFFFFFFh        ;read ASQ.AsULongULong to rcx
fffff806`a39181e3 0f95c0          setne   al                            ;set al to 1 if rcx != 0, else set al to 0
fffff806`a39181e6 0408            add     al,8
fffff806`a39181e8 884703          mov     byte ptr [rdi+3],al

stornvme!WaitForCommandCompleteWithCustomTimeout+0x127:
fffff806`a39181eb 448bce          mov     r9d,esi
fffff806`a39181ee 448bc5          mov     r8d,ebp
fffff806`a39181f1 488bd7          mov     rdx,rdi
fffff806`a39181f4 488bcb          mov     rcx,rbx
fffff806`a39181f7 e8c0e0ffff      call    stornvme!NVMeLogTelemetryWaitForCmdComplete (fffff806`a39162bc)
fffff806`a39181fc 4584e4          test    r12b,r12b
fffff806`a39181ff 740e            je      stornvme!WaitForCommandCompleteWithCustomTimeout+0x14b (fffff806`a391820f)  Branch

stornvme!WaitForCommandCompleteWithCustomTimeout+0x13d:
fffff806`a3918201 4533c0          xor     r8d,r8d
fffff806`a3918204 488bd7          mov     rdx,rdi
fffff806`a3918207 488bcb          mov     rcx,rbx
fffff806`a391820a e89d75ffff      call    stornvme!NVMeRequestComplete (fffff806`a390f7ac)  ;NVMeRequestComplete(rcx, rdi, 0);

stornvme!WaitForCommandCompleteWithCustomTimeout+0x14b:
fffff806`a391820f 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff806`a3918214 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff806`a3918219 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff806`a391821e 4883c420        add     rsp,20h
fffff806`a3918222 415f            pop     r15
fffff806`a3918224 415e            pop     r14
fffff806`a3918226 415d            pop     r13
fffff806`a3918228 415c            pop     r12
fffff806`a391822a 5f              pop     rdi
fffff806`a391822b c3              ret
