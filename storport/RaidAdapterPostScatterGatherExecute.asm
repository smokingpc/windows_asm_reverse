0: kd> uf RaidAdapterPostScatterGatherExecute
storport!RaidAdapterPostScatterGatherExecute:
fffff80e`6c5ed980 4055            push    rbp
fffff80e`6c5ed982 53              push    rbx
fffff80e`6c5ed983 56              push    rsi
fffff80e`6c5ed984 57              push    rdi
fffff80e`6c5ed985 4154            push    r12
fffff80e`6c5ed987 4155            push    r13
fffff80e`6c5ed989 4156            push    r14
fffff80e`6c5ed98b 4157            push    r15
fffff80e`6c5ed98d 488d6c24e1      lea     rbp,[rsp-1Fh]
fffff80e`6c5ed992 4881ece8000000  sub     rsp,0E8h
fffff80e`6c5ed999 33f6            xor     esi,esi
fffff80e`6c5ed99b 48898ad8000000  mov     qword ptr [rdx+0D8h],rcx
fffff80e`6c5ed9a2 33c0            xor     eax,eax
fffff80e`6c5ed9a4 488975b7        mov     qword ptr [rbp-49h],rsi
fffff80e`6c5ed9a8 488bf9          mov     rdi,rcx                   ;RCX = RDI = Arg1
fffff80e`6c5ed9ab 488945bf        mov     qword ptr [rbp-41h],rax
fffff80e`6c5ed9af 488b8aa8000000  mov     rcx,qword ptr [rdx+0A8h]  ;RCX = RDX+0xA8 ==> SRB
fffff80e`6c5ed9b6 488bda          mov     rbx,rdx                   ;RDX = RBX = Arg2 = PortContext
fffff80e`6c5ed9b9 488b82e0000000  mov     rax,qword ptr [rdx+0E0h]  ;RAX = RDX+0xE0 ==> XRB->Unit
fffff80e`6c5ed9c0 448bfe          mov     r15d,esi
fffff80e`6c5ed9c3 488975c7        mov     qword ptr [rbp-39h],rsi
fffff80e`6c5ed9c7 448bee          mov     r13d,esi
fffff80e`6c5ed9ca 488975a7        mov     qword ptr [rbp-59h],rsi
fffff80e`6c5ed9ce 448bf6          mov     r14d,esi
fffff80e`6c5ed9d1 0fb65102        movzx   edx,byte ptr [rcx+2]      ;DL = Srb->Function
fffff80e`6c5ed9d5 488975cf        mov     qword ptr [rbp-31h],rsi
fffff80e`6c5ed9d9 488975d7        mov     qword ptr [rbp-29h],rsi
fffff80e`6c5ed9dd 80fa28          cmp     dl,28h            ;if Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK, goto 0X2fd (SCSI_REQUEST_BLOCK)
fffff80e`6c5ed9e0 0f8597020000    jne     storport!RaidAdapterPostScatterGatherExecute+0x2fd (fffff80e`6c5edc7d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x66:
fffff80e`6c5ed9e6 8b5114          mov     edx,dword ptr [rcx+14h]   ;EDX = Srb->SrbFunction
fffff80e`6c5ed9e9 448b4118        mov     r8d,dword ptr [rcx+18h]   ;R8D = Srb->SrgFlags

storport!RaidAdapterPostScatterGatherExecute+0x6d:
fffff80e`6c5ed9ed 41bc01000000    mov     r12d,1
fffff80e`6c5ed9f3 4885c0          test    rax,rax   ;if (XRB->Unit == NULL) goto 0x4e6
fffff80e`6c5ed9f6 0f846a040000    je      storport!RaidAdapterPostScatterGatherExecute+0x4e6 (fffff80e`6c5ede66)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x7c:
fffff80e`6c5ed9fc 39b0ac010000    cmp     dword ptr [rax+1ACh],esi
fffff80e`6c5eda02 0f8f08120200    jg      storport!RaidAdapterPostScatterGatherExecute+0x21290 (fffff80e`6c60ec10)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x88:
fffff80e`6c5eda08 4038b0b4010000  cmp     byte ptr [rax+1B4h],sil
fffff80e`6c5eda0f 0f8513120200    jne     storport!RaidAdapterPostScatterGatherExecute+0x212a8 (fffff80e`6c60ec28)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x95:
fffff80e`6c5eda15 4038b0b5010000  cmp     byte ptr [rax+1B5h],sil
fffff80e`6c5eda1c 0f85f0040000    jne     storport!RaidAdapterPostScatterGatherExecute+0x592 (fffff80e`6c5edf12)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xa2:
fffff80e`6c5eda22 403835370e0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80e`6c63e860)],sil
fffff80e`6c5eda29 0f8492040000    je      storport!RaidAdapterPostScatterGatherExecute+0x541 (fffff80e`6c5edec1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xaf:
fffff80e`6c5eda2f 4038350a0e0500  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],sil

storport!RaidAdapterPostScatterGatherExecute+0xb6:
fffff80e`6c5eda36 0f84df010000    je      storport!RaidAdapterPostScatterGatherExecute+0x29b (fffff80e`6c5edc1b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xbc:
fffff80e`6c5eda3c 33c9            xor     ecx,ecx
fffff80e`6c5eda3e 48ff15bb650500  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff80e`6c644000)]
fffff80e`6c5eda45 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0xca:
fffff80e`6c5eda4a 403835f10d0500  cmp     byte ptr [storport!FUAEnabled (fffff80e`6c63e842)],sil
fffff80e`6c5eda51 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]      ;RDX = XRB->Srb
fffff80e`6c5eda58 488983b8020000  mov     qword ptr [rbx+2B8h],rax      ;set XRB->RequestStartTimeStamp = KeQueryUnbiasedInterruptTime()
fffff80e`6c5eda5f 0f8424020000    je      storport!RaidAdapterPostScatterGatherExecute+0x309 (fffff80e`6c5edc89)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xe5:
fffff80e`6c5eda65 4038b762110000  cmp     byte ptr [rdi+1162h],sil      ;if(AdapterExt->Contiguous == 0) goto 0x1af
fffff80e`6c5eda6c 0f84bd000000    je      storport!RaidAdapterPostScatterGatherExecute+0x1af (fffff80e`6c5edb2f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xf2:
fffff80e`6c5eda72 488b0537080500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c5eda79 a801            test    al,1
fffff80e`6c5eda7b 0f8563020000    jne     storport!RaidAdapterPostScatterGatherExecute+0x364 (fffff80e`6c5edce4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x101:
fffff80e`6c5eda81 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff80e`6c5eda88 4885c0          test    rax,rax           ;if (XRB->IRP == 0) goto 0x114
fffff80e`6c5eda8b 7407            je      storport!RaidAdapterPostScatterGatherExecute+0x114 (fffff80e`6c5eda94)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x10d:
fffff80e`6c5eda8d c6808d000000ae  mov     byte ptr [rax+8Dh],0AEh

storport!RaidAdapterPostScatterGatherExecute+0x114:                 ;RBX == XRB (port content)
fffff80e`6c5eda94 488b8bd8000000  mov     rcx,qword ptr [rbx+0D8h]  ;RCX = AdapterExt = XRB->Adapter
fffff80e`6c5eda9b 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]  ;RDX = SRB
fffff80e`6c5edaa2 488b8110020000  mov     rax,qword ptr [rcx+210h]  ;RAX = AdapterExt->Miniport->HwInitializationData
fffff80e`6c5edaa9 488b8080000000  mov     rax,qword ptr [rax+80h]       ;RAX+0x80 ==> HwBuildIo
fffff80e`6c5edab0 4885c0          test    rax,rax                   ;if HwBuildIo == NULL, goto 0x2f5, then back to 0x14e
fffff80e`6c5edab3 0f84bc010000    je      storport!RaidAdapterPostScatterGatherExecute+0x2f5 (fffff80e`6c5edc75)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x139:
fffff80e`6c5edab9 488b8918020000  mov     rcx,qword ptr [rcx+218h]  ;RCX = AdapterExt->Miniport->PrivateDeviceExt
fffff80e`6c5edac0 4883c110        add     rcx,10h                   ;RCX == AdapterExt->Miniport->PrivateDeviceExt+0x10 == PrivateDeviceExt->HwDeviceExtension =>DevExt of HBA
fffff80e`6c5edac4 ff150e6d0500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`6c6447d8)]   ;call to HwBuildIo()
fffff80e`6c5edaca 440fb6f0        movzx   r14d,al

storport!RaidAdapterPostScatterGatherExecute+0x14e:
fffff80e`6c5edace 4038358b0d0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80e`6c63e860)],sil
fffff80e`6c5edad5 741a            je      storport!RaidAdapterPostScatterGatherExecute+0x171 (fffff80e`6c5edaf1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x157:
fffff80e`6c5edad7 f605e30c050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff80e`6c63e7c1)],1
fffff80e`6c5edade 0f854c120200    jne     storport!RaidAdapterPostScatterGatherExecute+0x213b0 (fffff80e`6c60ed30)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x164:
fffff80e`6c5edae4 f605d80c050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff80e`6c63e7c3)],2
fffff80e`6c5edaeb 0f853f120200    jne     storport!RaidAdapterPostScatterGatherExecute+0x213b0 (fffff80e`6c60ed30)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x171:
fffff80e`6c5edaf1 4584f6          test    r14b,r14b
fffff80e`6c5edaf4 0f8465030000    je      storport!RaidAdapterPostScatterGatherExecute+0x4df (fffff80e`6c5ede5f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x17a:
fffff80e`6c5edafa 83bf8812000001  cmp     dword ptr [rdi+1288h],1   ;If AdapterExt->ConcurrentChannel <= 1, goto 0x2ac to check XRB->RequestWaitDuration == NULL
fffff80e`6c5edb01 0f8e25010000    jle     storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff80e`6c5edc2c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x187:
fffff80e`6c5edb07 b9ffff0000      mov     ecx,0FFFFh
fffff80e`6c5edb0c 48ff1595670500  call    qword ptr [storport!_imp_KeQueryActiveProcessorCountEx (fffff80e`6c6442a8)]
fffff80e`6c5edb13 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5edb18 398788120000    cmp     dword ptr [rdi+1288h],eax
fffff80e`6c5edb1e 0f82b1030000    jb      storport!RaidAdapterPostScatterGatherExecute+0x555 (fffff80e`6c5eded5)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1a4:
fffff80e`6c5edb24 658b0425a4010000 mov     eax,dword ptr gs:[1A4h]
fffff80e`6c5edb2c 894318          mov     dword ptr [rbx+18h],eax

storport!RaidAdapterPostScatterGatherExecute+0x1af:
fffff80e`6c5edb2f 488b057a070500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c5edb36 a804            test    al,4
fffff80e`6c5edb38 0f854c020000    jne     storport!RaidAdapterPostScatterGatherExecute+0x40a (fffff80e`6c5edd8a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1be:
fffff80e`6c5edb3e 4c8b8be0000000  mov     r9,qword ptr [rbx+0E0h]
fffff80e`6c5edb45 4d85c9          test    r9,r9     ;if XRB->Unit == NULL, goto 0x1d7
fffff80e`6c5edb48 740d            je      storport!RaidAdapterPostScatterGatherExecute+0x1d7 (fffff80e`6c5edb57)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1ca:
fffff80e`6c5edb4a 4138b181000000  cmp     byte ptr [r9+81h],sil
fffff80e`6c5edb51 0f8523120200    jne     storport!RaidAdapterPostScatterGatherExecute+0x213fa (fffff80e`6c60ed7a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1d7:
fffff80e`6c5edb57 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff80e`6c5edb5e 4885c0          test    rax,rax       ;if(XRB->Irp == NULL) goto 0x1ea
fffff80e`6c5edb61 7407            je      storport!RaidAdapterPostScatterGatherExecute+0x1ea (fffff80e`6c5edb6a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1e3:
fffff80e`6c5edb63 c6808d000000aa  mov     byte ptr [rax+8Dh],0AAh

storport!RaidAdapterPostScatterGatherExecute+0x1ea:
fffff80e`6c5edb6a 0fb64310        movzx   eax,byte ptr [rbx+10h]
fffff80e`6c5edb6e 24ef            and     al,0EFh
fffff80e`6c5edb70 0c0c            or      al,0Ch
fffff80e`6c5edb72 884310          mov     byte ptr [rbx+10h],al
fffff80e`6c5edb75 48b81400000080f7ffff mov rax,0FFFFF78000000014h
fffff80e`6c5edb7f 488b00          mov     rax,qword ptr [rax]
fffff80e`6c5edb82 488b8f18020000  mov     rcx,qword ptr [rdi+218h]
fffff80e`6c5edb89 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]
fffff80e`6c5edb90 4883c110        add     rcx,10h
fffff80e`6c5edb94 488945bf        mov     qword ptr [rbp-41h],rax
fffff80e`6c5edb98 488b8710020000  mov     rax,qword ptr [rdi+210h]
fffff80e`6c5edb9f 488b4010        mov     rax,qword ptr [rax+10h]
fffff80e`6c5edba3 ff152f6c0500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`6c6447d8)]      ;call HwStartIo()
fffff80e`6c5edba9 403835b00c0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80e`6c63e860)],sil
fffff80e`6c5edbb0 440fb6f0        movzx   r14d,al
fffff80e`6c5edbb4 741a            je      storport!RaidAdapterPostScatterGatherExecute+0x250 (fffff80e`6c5edbd0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x236:
fffff80e`6c5edbb6 f605040c050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff80e`6c63e7c1)],1
fffff80e`6c5edbbd 0f85b3160200    jne     storport!RaidAdapterPostScatterGatherExecute+0x218f6 (fffff80e`6c60f276)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x243:
fffff80e`6c5edbc3 f605f90b050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff80e`6c63e7c3)],2
fffff80e`6c5edbca 0f85a6160200    jne     storport!RaidAdapterPostScatterGatherExecute+0x218f6 (fffff80e`6c60f276)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x250:
fffff80e`6c5edbd0 4038b762110000  cmp     byte ptr [rdi+1162h],sil  ;if(AdapterExt->Contiguous == sil) goto 0x26b
fffff80e`6c5edbd7 7412            je      storport!RaidAdapterPostScatterGatherExecute+0x26b (fffff80e`6c5edbeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x259:
fffff80e`6c5edbd9 83bf8812000001  cmp     dword ptr [rdi+1288h],1       ;ConcurrentChannels
fffff80e`6c5edbe0 7e72            jle     storport!RaidAdapterPostScatterGatherExecute+0x2d4 (fffff80e`6c5edc54)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x262:
fffff80e`6c5edbe2 4d85ff          test    r15,r15
fffff80e`6c5edbe5 0f8504030000    jne     storport!RaidAdapterPostScatterGatherExecute+0x56f (fffff80e`6c5edeef)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x26b:
fffff80e`6c5edbeb 488b05be060500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c5edbf2 a804            test    al,4
fffff80e`6c5edbf4 0f85f3010000    jne     storport!RaidAdapterPostScatterGatherExecute+0x46d (fffff80e`6c5edded)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x27a:
fffff80e`6c5edbfa b8010000c0      mov     eax,0C0000001h
fffff80e`6c5edbff 4584f6          test    r14b,r14b
fffff80e`6c5edc02 0f44f0          cmove   esi,eax
fffff80e`6c5edc05 8bc6            mov     eax,esi

storport!RaidAdapterPostScatterGatherExecute+0x287:
fffff80e`6c5edc07 4881c4e8000000  add     rsp,0E8h
fffff80e`6c5edc0e 415f            pop     r15
fffff80e`6c5edc10 415e            pop     r14
fffff80e`6c5edc12 415d            pop     r13
fffff80e`6c5edc14 415c            pop     r12
fffff80e`6c5edc16 5f              pop     rdi
fffff80e`6c5edc17 5e              pop     rsi
fffff80e`6c5edc18 5b              pop     rbx
fffff80e`6c5edc19 5d              pop     rbp
fffff80e`6c5edc1a c3              ret

storport!RaidAdapterPostScatterGatherExecute+0x29b:
fffff80e`6c5edc1b 48ff1586640500  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`6c6440a8)]
fffff80e`6c5edc22 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5edc27 e91efeffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0xca (fffff80e`6c5eda4a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2ac:
fffff80e`6c5edc2c 39b7b0020000    cmp     dword ptr [rdi+2B0h],esi  ;;if XRB->RequestWaitDuration == 0, goto 0x213e1
fffff80e`6c5edc32 0f8429110200    je      storport!RaidAdapterPostScatterGatherExecute+0x213e1 (fffff80e`6c60ed61)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2b8:
fffff80e`6c5edc38 488d8fa8020000  lea     rcx,[rdi+2A8h]    ;accquire AdapterExt->StartIoLock
fffff80e`6c5edc3f 488d55df        lea     rdx,[rbp-21h]     
fffff80e`6c5edc43 48ff1566660500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff80e`6c6442b0)]
fffff80e`6c5edc4a 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5edc4f e9dbfeffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x1af (fffff80e`6c5edb2f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2d4:
fffff80e`6c5edc54 39b7b0020000    cmp     dword ptr [rdi+2B0h],esi  ;if XRB->RequestWaitDuration == 0, goto 0x21927
fffff80e`6c5edc5a 0f8447160200    je      storport!RaidAdapterPostScatterGatherExecute+0x21927 (fffff80e`6c60f2a7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2e0:
fffff80e`6c5edc60 488d4ddf        lea     rcx,[rbp-21h]
fffff80e`6c5edc64 48ff15c5630500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff80e`6c644030)]
fffff80e`6c5edc6b 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5edc70 e976ffffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x26b (fffff80e`6c5edbeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2f5:
fffff80e`6c5edc75 41b601          mov     r14b,1
fffff80e`6c5edc78 e951feffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x14e (fffff80e`6c5edace)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2fd:
fffff80e`6c5edc7d 448b410c        mov     r8d,dword ptr [rcx+0Ch]
fffff80e`6c5edc81 0fb6d2          movzx   edx,dl
fffff80e`6c5edc84 e964fdffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x6d (fffff80e`6c5ed9ed)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x309:
fffff80e`6c5edc89 4885d2          test    rdx,rdx
fffff80e`6c5edc8c 0f84d3fdffff    je      storport!RaidAdapterPostScatterGatherExecute+0xe5 (fffff80e`6c5eda65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x312:
fffff80e`6c5edc92 0fb64202        movzx   eax,byte ptr [rdx+2]
fffff80e`6c5edc96 3c28            cmp     al,28h
fffff80e`6c5edc98 0f84d10f0200    je      storport!RaidAdapterPostScatterGatherExecute+0x212ef (fffff80e`6c60ec6f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x31e:
fffff80e`6c5edc9e 440fb6c8        movzx   r9d,al
fffff80e`6c5edca2 4c8d4248        lea     r8,[rdx+48h]

storport!RaidAdapterPostScatterGatherExecute+0x326:
fffff80e`6c5edca6 4d85c0          test    r8,r8
fffff80e`6c5edca9 0f84b6fdffff    je      storport!RaidAdapterPostScatterGatherExecute+0xe5 (fffff80e`6c5eda65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x32f:
fffff80e`6c5edcaf 4585c9          test    r9d,r9d
fffff80e`6c5edcb2 0f85adfdffff    jne     storport!RaidAdapterPostScatterGatherExecute+0xe5 (fffff80e`6c5eda65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x338:
fffff80e`6c5edcb8 410fb600        movzx   eax,byte ptr [r8]
fffff80e`6c5edcbc 3c2a            cmp     al,2Ah
fffff80e`6c5edcbe 740c            je      storport!RaidAdapterPostScatterGatherExecute+0x34c (fffff80e`6c5edccc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x340:
fffff80e`6c5edcc0 3caa            cmp     al,0AAh
fffff80e`6c5edcc2 7408            je      storport!RaidAdapterPostScatterGatherExecute+0x34c (fffff80e`6c5edccc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x344:
fffff80e`6c5edcc4 3c8a            cmp     al,8Ah
fffff80e`6c5edcc6 0f8599fdffff    jne     storport!RaidAdapterPostScatterGatherExecute+0xe5 (fffff80e`6c5eda65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x34c:
fffff80e`6c5edccc 410fb64001      movzx   eax,byte ptr [r8+1]
fffff80e`6c5edcd1 a808            test    al,8
fffff80e`6c5edcd3 0f848cfdffff    je      storport!RaidAdapterPostScatterGatherExecute+0xe5 (fffff80e`6c5eda65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x359:
fffff80e`6c5edcd9 24f7            and     al,0F7h
fffff80e`6c5edcdb 41884001        mov     byte ptr [r8+1],al
fffff80e`6c5edcdf e981fdffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0xe5 (fffff80e`6c5eda65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x364:
fffff80e`6c5edce4 488bcb          mov     rcx,rbx
fffff80e`6c5edce7 e894040000      call    storport!RaidLogGetParm4 (fffff80e`6c5ee180)
fffff80e`6c5edcec 4c8b8ba0000000  mov     r9,qword ptr [rbx+0A0h]
fffff80e`6c5edcf3 4c8bf0          mov     r14,rax
fffff80e`6c5edcf6 4c8b93a8000000  mov     r10,qword ptr [rbx+0A8h]
fffff80e`6c5edcfd 4d85c9          test    r9,r9
fffff80e`6c5edd00 0f847d010000    je      storport!RaidAdapterPostScatterGatherExecute+0x503 (fffff80e`6c5ede83)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x386:
fffff80e`6c5edd06 488bcb          mov     rcx,rbx
fffff80e`6c5edd09 e84a130000      call    storport!DbgGetAddressLongFromXrb (fffff80e`6c5ef058)
fffff80e`6c5edd0e 4c8b83d8000000  mov     r8,qword ptr [rbx+0D8h]
fffff80e`6c5edd15 448bd8          mov     r11d,eax
fffff80e`6c5edd18 4d85c0          test    r8,r8
fffff80e`6c5edd1b 0f8460fdffff    je      storport!RaidAdapterPostScatterGatherExecute+0x101 (fffff80e`6c5eda81)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3a1:
fffff80e`6c5edd21 4139b0c4130000  cmp     dword ptr [r8+13C4h],esi
fffff80e`6c5edd28 0f8653fdffff    jbe     storport!RaidAdapterPostScatterGatherExecute+0x101 (fffff80e`6c5eda81)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3ae:
fffff80e`6c5edd2e 4939b0c8130000  cmp     qword ptr [r8+13C8h],rsi
fffff80e`6c5edd35 0f8446fdffff    je      storport!RaidAdapterPostScatterGatherExecute+0x101 (fffff80e`6c5eda81)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3bb:
fffff80e`6c5edd3b 418bc4          mov     eax,r12d
fffff80e`6c5edd3e f0410fc180c0130000 lock xadd dword ptr [r8+13C0h],eax
fffff80e`6c5edd47 ffc0            inc     eax
fffff80e`6c5edd49 33d2            xor     edx,edx
fffff80e`6c5edd4b 41f7b0c4130000  div     eax,dword ptr [r8+13C4h]
fffff80e`6c5edd52 488d0c52        lea     rcx,[rdx+rdx*2]
fffff80e`6c5edd56 48c1e104        shl     rcx,4
fffff80e`6c5edd5a 490388c8130000  add     rcx,qword ptr [r8+13C8h]
fffff80e`6c5edd61 c70124000000    mov     dword ptr [rcx],24h
fffff80e`6c5edd67 48a11400000080f7ffff mov rax,qword ptr [FFFFF78000000014h]
fffff80e`6c5edd71 48894128        mov     qword ptr [rcx+28h],rax
fffff80e`6c5edd75 4c894908        mov     qword ptr [rcx+8],r9
fffff80e`6c5edd79 4c895910        mov     qword ptr [rcx+10h],r11
fffff80e`6c5edd7d 4c895118        mov     qword ptr [rcx+18h],r10
fffff80e`6c5edd81 4c897120        mov     qword ptr [rcx+20h],r14
fffff80e`6c5edd85 e9f7fcffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x101 (fffff80e`6c5eda81)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x40a:
fffff80e`6c5edd8a 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff80e`6c5edd91 4885c0          test    rax,rax       ;if XRB->Unit == NULL, goto 0x439
fffff80e`6c5edd94 7423            je      storport!RaidAdapterPostScatterGatherExecute+0x439 (fffff80e`6c5eddb9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x416:
fffff80e`6c5edd96 8b4860          mov     ecx,dword ptr [rax+60h]
fffff80e`6c5edd99 8bc1            mov     eax,ecx
fffff80e`6c5edd9b c1e808          shr     eax,8
fffff80e`6c5edd9e 440fb6e8        movzx   r13d,al
fffff80e`6c5edda2 0fb6c1          movzx   eax,cl
fffff80e`6c5edda5 48c1e008        shl     rax,8
fffff80e`6c5edda9 4c0be8          or      r13,rax
fffff80e`6c5eddac c1e910          shr     ecx,10h
fffff80e`6c5eddaf 49c1e508        shl     r13,8
fffff80e`6c5eddb3 0fb6c1          movzx   eax,cl
fffff80e`6c5eddb6 4c0be8          or      r13,rax

storport!RaidAdapterPostScatterGatherExecute+0x439:
fffff80e`6c5eddb9 488bcb          mov     rcx,rbx
fffff80e`6c5eddbc 4c896da7        mov     qword ptr [rbp-59h],r13
fffff80e`6c5eddc0 e8bb030000      call    storport!RaidLogGetParm4 (fffff80e`6c5ee180)*fffff80e`6c5eddc5 488b8ba0000000  mov     rcx,qword ptr [rbx+0A0h]      ;XRB->Irp
fffff80e`6c5eddcc 4c8bb3a8000000  mov     r14,qword ptr [rbx+0A8h]      ;XRB->Srb
fffff80e`6c5eddd3 488945d7        mov     qword ptr [rbp-29h],rax
fffff80e`6c5eddd7 4c8975cf        mov     qword ptr [rbp-31h],r14
fffff80e`6c5edddb 4885c9          test    rcx,rcx
fffff80e`6c5eddde 0f84bc000000    je      storport!RaidAdapterPostScatterGatherExecute+0x520 (fffff80e`6c5edea0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x464:
fffff80e`6c5edde4 48894dc7        mov     qword ptr [rbp-39h],rcx
fffff80e`6c5edde8 e951fdffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x1be (fffff80e`6c5edb3e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x46d:
fffff80e`6c5edded 39b7c4130000    cmp     dword ptr [rdi+13C4h],esi
fffff80e`6c5eddf3 0f8601feffff    jbe     storport!RaidAdapterPostScatterGatherExecute+0x27a (fffff80e`6c5edbfa)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x479:
fffff80e`6c5eddf9 4839b7c8130000  cmp     qword ptr [rdi+13C8h],rsi
fffff80e`6c5ede00 0f84f4fdffff    je      storport!RaidAdapterPostScatterGatherExecute+0x27a (fffff80e`6c5edbfa)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x486:
fffff80e`6c5ede06 f0440fc1a7c0130000 lock xadd dword ptr [rdi+13C0h],r12d
fffff80e`6c5ede0f 33d2            xor     edx,edx
fffff80e`6c5ede11 418d442401      lea     eax,[r12+1]
fffff80e`6c5ede16 f7b7c4130000    div     eax,dword ptr [rdi+13C4h]
fffff80e`6c5ede1c 488b45bf        mov     rax,qword ptr [rbp-41h]
fffff80e`6c5ede20 488d0c52        lea     rcx,[rdx+rdx*2]
fffff80e`6c5ede24 48c1e104        shl     rcx,4
fffff80e`6c5ede28 48038fc8130000  add     rcx,qword ptr [rdi+13C8h]
fffff80e`6c5ede2f 8931            mov     dword ptr [rcx],esi
fffff80e`6c5ede31 4885c0          test    rax,rax
fffff80e`6c5ede34 0f847f140200    je      storport!RaidAdapterPostScatterGatherExecute+0x21939 (fffff80e`6c60f2b9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4ba:
fffff80e`6c5ede3a 48894128        mov     qword ptr [rcx+28h],rax
fffff80e`6c5ede3e 488b45c7        mov     rax,qword ptr [rbp-39h]
fffff80e`6c5ede42 48894108        mov     qword ptr [rcx+8],rax
fffff80e`6c5ede46 488b45cf        mov     rax,qword ptr [rbp-31h]
fffff80e`6c5ede4a 48894118        mov     qword ptr [rcx+18h],rax
fffff80e`6c5ede4e 488b45d7        mov     rax,qword ptr [rbp-29h]
fffff80e`6c5ede52 48894120        mov     qword ptr [rcx+20h],rax
fffff80e`6c5ede56 4c896910        mov     qword ptr [rcx+10h],r13
fffff80e`6c5ede5a e99bfdffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x27a (fffff80e`6c5edbfa)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4df:
fffff80e`6c5ede5f 33c0            xor     eax,eax
fffff80e`6c5ede61 e9a1fdffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x287 (fffff80e`6c5edc07)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4e6:
fffff80e`6c5ede66 39b72c030000    cmp     dword ptr [rdi+32Ch],esi ; if (0==AdapterExt->Gateway->PauseCount) goto 0xa2
fffff80e`6c5ede6c 0f84b0fbffff    je      storport!RaidAdapterPostScatterGatherExecute+0xa2 (fffff80e`6c5eda22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4f2: ;if (AdapterExt->Gateway->PauseCount > 0), 
fffff80e`6c5ede72 8d42dc          lea     eax,[rdx-24h]
fffff80e`6c5ede75 413bc4          cmp     eax,r12d
fffff80e`6c5ede78 0f86a4fbffff    jbe     storport!RaidAdapterPostScatterGatherExecute+0xa2 (fffff80e`6c5eda22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4fe:
fffff80e`6c5ede7e e9b00d0200      jmp     storport!RaidAdapterPostScatterGatherExecute+0x212b3 (fffff80e`6c60ec33)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x503:
fffff80e`6c5ede83 4d85d2          test    r10,r10
fffff80e`6c5ede86 0f847afeffff    je      storport!RaidAdapterPostScatterGatherExecute+0x386 (fffff80e`6c5edd06)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x50c:
fffff80e`6c5ede8c 41807a0228      cmp     byte ptr [r10+2],28h
fffff80e`6c5ede91 0f84900e0200    je      storport!RaidAdapterPostScatterGatherExecute+0x213a7 (fffff80e`6c60ed27)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x517:
fffff80e`6c5ede97 4d8b4a30        mov     r9,qword ptr [r10+30h]
fffff80e`6c5ede9b e966feffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x386 (fffff80e`6c5edd06)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x520:
fffff80e`6c5edea0 4d85f6          test    r14,r14       ;if XRB->Srb == NULL, goto 0x1be
fffff80e`6c5edea3 0f8495fcffff    je      storport!RaidAdapterPostScatterGatherExecute+0x1be (fffff80e`6c5edb3e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x529:
fffff80e`6c5edea9 41807e0228      cmp     byte ptr [r14+2],28h
fffff80e`6c5edeae 0f84bd0e0200    je      storport!RaidAdapterPostScatterGatherExecute+0x213f1 (fffff80e`6c60ed71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x534:
fffff80e`6c5edeb4 498b4630        mov     rax,qword ptr [r14+30h]

storport!RaidAdapterPostScatterGatherExecute+0x538:
fffff80e`6c5edeb8 488945c7        mov     qword ptr [rbp-39h],rax
fffff80e`6c5edebc e97dfcffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x1be (fffff80e`6c5edb3e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x541:
fffff80e`6c5edec1 393509040500    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceEnabled (fffff80e`6c63e2d0)],esi
fffff80e`6c5edec7 0f858a0d0200    jne     storport!RaidAdapterPostScatterGatherExecute+0x212d7 (fffff80e`6c60ec57)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x54d:
fffff80e`6c5edecd 488bc6          mov     rax,rsi
fffff80e`6c5eded0 e975fbffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0xca (fffff80e`6c5eda4a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x555:
fffff80e`6c5eded5 488bcf          mov     rcx,rdi
fffff80e`6c5eded8 e82f490100      call    storport!RaAllocateConcurrentChannelToken (fffff80e`6c60280c)
fffff80e`6c5ededd 4c8bf8          mov     r15,rax
fffff80e`6c5edee0 488945b7        mov     qword ptr [rbp-49h],rax
fffff80e`6c5edee4 8b4814          mov     ecx,dword ptr [rax+14h]
fffff80e`6c5edee7 894b18          mov     dword ptr [rbx+18h],ecx
fffff80e`6c5edeea e940fcffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x1af (fffff80e`6c5edb2f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x56f:
fffff80e`6c5edeef 418b4f10        mov     ecx,dword ptr [r15+10h]
fffff80e`6c5edef3 498bd7          mov     rdx,r15
fffff80e`6c5edef6 48c1e106        shl     rcx,6
fffff80e`6c5edefa 48038f90120000  add     rcx,qword ptr [rdi+1290h]     ;push back to AdapterExt-> ???   這很有嫌疑...
fffff80e`6c5edf01 48ff15c8610500  call    qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff80e`6c6440d0)]
fffff80e`6c5edf08 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5edf0d e9d9fcffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x26b (fffff80e`6c5edbeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x592:
fffff80e`6c5edf12 410fbae013      bt      r8d,13h
fffff80e`6c5edf17 0f8205fbffff    jb      storport!RaidAdapterPostScatterGatherExecute+0xa2 (fffff80e`6c5eda22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x59d:
fffff80e`6c5edf1d e91b0d0200      jmp     storport!RaidAdapterPostScatterGatherExecute+0x212bd (fffff80e`6c60ec3d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5a2:
fffff80e`6c5edf22 85c0            test    eax,eax
fffff80e`6c5edf24 0f84f8faffff    je      storport!RaidAdapterPostScatterGatherExecute+0xa2 (fffff80e`6c5eda22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5aa:
fffff80e`6c5edf2a e90e0d0200      jmp     storport!RaidAdapterPostScatterGatherExecute+0x212bd (fffff80e`6c60ec3d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21290:
fffff80e`6c60ec10 83fa20          cmp     edx,20h
fffff80e`6c60ec13 740c            je      storport!RaidAdapterPostScatterGatherExecute+0x212a1 (fffff80e`6c60ec21)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21295:
fffff80e`6c60ec15 418bc4          mov     eax,r12d
fffff80e`6c60ec18 83fa13          cmp     edx,13h
fffff80e`6c60ec1b 0f8501f3fdff    jne     storport!RaidAdapterPostScatterGatherExecute+0x5a2 (fffff80e`6c5edf22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212a1:
fffff80e`6c60ec21 8bc6            mov     eax,esi
fffff80e`6c60ec23 e9faf2fdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x5a2 (fffff80e`6c5edf22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212a8:
fffff80e`6c60ec28 41f6c010        test    r8b,10h
fffff80e`6c60ec2c 740f            je      storport!RaidAdapterPostScatterGatherExecute+0x212bd (fffff80e`6c60ec3d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212ae:
fffff80e`6c60ec2e e9e2edfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x95 (fffff80e`6c5eda15)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212b3:
fffff80e`6c60ec33 f6431108        test    byte ptr [rbx+11h],8  ;if(!XRB->ByPassPausedGateway) goto 0xa2
fffff80e`6c60ec37 0f85e5edfdff    jne     storport!RaidAdapterPostScatterGatherExecute+0xa2 (fffff80e`6c5eda22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212bd:
fffff80e`6c60ec3d c6410305        mov     byte ptr [rcx+3],5        ;Srb->SrbStatus=SRB_STATUS_BUSY ??
fffff80e`6c60ec41 450fb6c4        movzx   r8d,r12b
fffff80e`6c60ec45 488bcf          mov     rcx,rdi
fffff80e`6c60ec48 488bd3          mov     rdx,rbx
fffff80e`6c60ec4b e8a000feff      call    storport!RaidAdapterRequestComplete (fffff80e`6c5eecf0)
fffff80e`6c60ec50 33c0            xor     eax,eax
fffff80e`6c60ec52 e9b0effdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x287 (fffff80e`6c5edc07)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212d7:
fffff80e`6c60ec57 403835e2fb0200  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],sil
fffff80e`6c60ec5e 0f84b7effdff    je      storport!RaidAdapterPostScatterGatherExecute+0x29b (fffff80e`6c5edc1b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212e4:
fffff80e`6c60ec64 39356af60200    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceHighResolutionTimer (fffff80e`6c63e2d4)],esi
fffff80e`6c60ec6a e9c7edfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0xb6 (fffff80e`6c5eda36)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212ef:
fffff80e`6c60ec6f 448b4a14        mov     r9d,dword ptr [rdx+14h]
fffff80e`6c60ec73 4c8bc6          mov     r8,rsi
fffff80e`6c60ec76 4585c9          test    r9d,r9d
fffff80e`6c60ec79 0f8527f0fdff    jne     storport!RaidAdapterPostScatterGatherExecute+0x326 (fffff80e`6c5edca6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x212ff:
fffff80e`6c60ec7f 448b6238        mov     r12d,dword ptr [rdx+38h]
fffff80e`6c60ec83 4585e4          test    r12d,r12d
fffff80e`6c60ec86 0f8490000000    je      storport!RaidAdapterPostScatterGatherExecute+0x2139c (fffff80e`6c60ed1c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2130c:
fffff80e`6c60ec8c 418bc7          mov     eax,r15d
fffff80e`6c60ec8f 8b4c8278        mov     ecx,dword ptr [rdx+rax*4+78h]
fffff80e`6c60ec93 81f980000000    cmp     ecx,80h
fffff80e`6c60ec99 7272            jb      storport!RaidAdapterPostScatterGatherExecute+0x2138d (fffff80e`6c60ed0d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2131b:
fffff80e`6c60ec9b 448b5a10        mov     r11d,dword ptr [rdx+10h]
fffff80e`6c60ec9f 413bcb          cmp     ecx,r11d
fffff80e`6c60eca2 7369            jae     storport!RaidAdapterPostScatterGatherExecute+0x2138d (fffff80e`6c60ed0d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21324:
fffff80e`6c60eca4 4c8d1411        lea     r10,[rcx+rdx]
fffff80e`6c60eca8 448bf1          mov     r14d,ecx
fffff80e`6c60ecab 418b0a          mov     ecx,dword ptr [r10]
fffff80e`6c60ecae 83e940          sub     ecx,40h
fffff80e`6c60ecb1 744e            je      storport!RaidAdapterPostScatterGatherExecute+0x21381 (fffff80e`6c60ed01)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21333:
fffff80e`6c60ecb3 83e901          sub     ecx,1
fffff80e`6c60ecb6 7421            je      storport!RaidAdapterPostScatterGatherExecute+0x21359 (fffff80e`6c60ecd9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21338:
fffff80e`6c60ecb8 83f901          cmp     ecx,1
fffff80e`6c60ecbb 7550            jne     storport!RaidAdapterPostScatterGatherExecute+0x2138d (fffff80e`6c60ed0d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2133d:
fffff80e`6c60ecbd 498d4e28        lea     rcx,[r14+28h]
fffff80e`6c60ecc1 418bc3          mov     eax,r11d
fffff80e`6c60ecc4 493bcb          cmp     rcx,r11
fffff80e`6c60ecc7 7744            ja      storport!RaidAdapterPostScatterGatherExecute+0x2138d (fffff80e`6c60ed0d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21349:
fffff80e`6c60ecc9 418b420c        mov     eax,dword ptr [r10+0Ch]
fffff80e`6c60eccd 4d8d4220        lea     r8,[r10+20h]
fffff80e`6c60ecd1 85c0            test    eax,eax
fffff80e`6c60ecd3 4c0f44c6        cmove   r8,rsi
fffff80e`6c60ecd7 eb40            jmp     storport!RaidAdapterPostScatterGatherExecute+0x21399 (fffff80e`6c60ed19)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21359:
fffff80e`6c60ecd9 498d4e38        lea     rcx,[r14+38h]
fffff80e`6c60ecdd 498bc3          mov     rax,r11
fffff80e`6c60ece0 493bcb          cmp     rcx,r11
fffff80e`6c60ece3 7728            ja      storport!RaidAdapterPostScatterGatherExecute+0x2138d (fffff80e`6c60ed0d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21365:
fffff80e`6c60ece5 4c8bfe          mov     r15,rsi
fffff80e`6c60ece8 41bc01000000    mov     r12d,1
fffff80e`6c60ecee 4138720a        cmp     byte ptr [r10+0Ah],sil
fffff80e`6c60ecf2 0f86aeeffdff    jbe     storport!RaidAdapterPostScatterGatherExecute+0x326 (fffff80e`6c5edca6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21378:
fffff80e`6c60ecf8 4d8d4218        lea     r8,[r10+18h]
fffff80e`6c60ecfc e9a5effdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x326 (fffff80e`6c5edca6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21381:
fffff80e`6c60ed01 498d4e28        lea     rcx,[r14+28h]
fffff80e`6c60ed05 498bc3          mov     rax,r11
fffff80e`6c60ed08 493bcb          cmp     rcx,r11
fffff80e`6c60ed0b 76d8            jbe     storport!RaidAdapterPostScatterGatherExecute+0x21365 (fffff80e`6c60ece5)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2138d:
fffff80e`6c60ed0d 41ffc7          inc     r15d
fffff80e`6c60ed10 453bfc          cmp     r15d,r12d
fffff80e`6c60ed13 0f8273ffffff    jb      storport!RaidAdapterPostScatterGatherExecute+0x2130c (fffff80e`6c60ec8c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21399:
fffff80e`6c60ed19 4c8bfe          mov     r15,rsi

storport!RaidAdapterPostScatterGatherExecute+0x2139c:
fffff80e`6c60ed1c 41bc01000000    mov     r12d,1
fffff80e`6c60ed22 e97feffdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x326 (fffff80e`6c5edca6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213a7:
fffff80e`6c60ed27 4d8b4a50        mov     r9,qword ptr [r10+50h]
fffff80e`6c60ed2b e9d6effdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x386 (fffff80e`6c5edd06)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213b0:
fffff80e`6c60ed30 40383509fb0200  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],sil
fffff80e`6c60ed37 7410            je      storport!RaidAdapterPostScatterGatherExecute+0x213c9 (fffff80e`6c60ed49)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213b9:
fffff80e`6c60ed39 33c9            xor     ecx,ecx
fffff80e`6c60ed3b 48ff15be520300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff80e`6c644000)]
fffff80e`6c60ed42 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60ed47 eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x213d5 (fffff80e`6c60ed55)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213c9:
fffff80e`6c60ed49 48ff1558530300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`6c6440a8)]
fffff80e`6c60ed50 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x213d5:
fffff80e`6c60ed55 488983c0020000  mov     qword ptr [rbx+2C0h],rax      ;set SRB->RequestAfterBuildIoTimeStamp
fffff80e`6c60ed5c e990edfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x171 (fffff80e`6c5edaf1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213e1:
fffff80e`6c60ed61 488bcf          mov     rcx,rdi
fffff80e`6c60ed64 e8c7dbfdff      call    storport!RaidAdapterAcquireInterruptLock (fffff80e`6c5ec930)
fffff80e`6c60ed69 8845df          mov     byte ptr [rbp-21h],al
fffff80e`6c60ed6c e9beedfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x1af (fffff80e`6c5edb2f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213f1:
fffff80e`6c60ed71 498b4650        mov     rax,qword ptr [r14+50h]
fffff80e`6c60ed75 e93ef1fdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x538 (fffff80e`6c5edeb8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x213fa:
fffff80e`6c60ed7a 4c8baba8000000  mov     r13,qword ptr [rbx+0A8h]
fffff80e`6c60ed81 41807d0228      cmp     byte ptr [r13+2],28h      ;if(Srb->Function != SRB_EX), goto 0x2149a
fffff80e`6c60ed86 0f858e000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x2149a (fffff80e`6c60ee1a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2140c:
fffff80e`6c60ed8c 4c8bf6          mov     r14,rsi
fffff80e`6c60ed8f 41397514        cmp     dword ptr [r13+14h],esi       ;if ( Srb->SrbFunction != EXECUTE_SCSI) goto 0x2149e
fffff80e`6c60ed93 0f8585000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x2149e (fffff80e`6c60ee1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21419:
fffff80e`6c60ed99 458b5d38        mov     r11d,dword ptr [r13+38h]      ;read R11D=Srb->NumSrbExData
fffff80e`6c60ed9d 448bd6          mov     r10d,esi
fffff80e`6c60eda0 4585db          test    r11d,r11d
fffff80e`6c60eda3 7479            je      storport!RaidAdapterPostScatterGatherExecute+0x2149e (fffff80e`6c60ee1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21425:
fffff80e`6c60eda5 418bc2          mov     eax,r10d
fffff80e`6c60eda8 418b4c8578      mov     ecx,dword ptr [r13+rax*4+78h]
fffff80e`6c60edad 81f980000000    cmp     ecx,80h
fffff80e`6c60edb3 725b            jb      storport!RaidAdapterPostScatterGatherExecute+0x21490 (fffff80e`6c60ee10)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21435:
fffff80e`6c60edb5 418b5510        mov     edx,dword ptr [r13+10h]
fffff80e`6c60edb9 3bca            cmp     ecx,edx
fffff80e`6c60edbb 7353            jae     storport!RaidAdapterPostScatterGatherExecute+0x21490 (fffff80e`6c60ee10)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2143d:
fffff80e`6c60edbd 448bc1          mov     r8d,ecx
fffff80e`6c60edc0 428b0c29        mov     ecx,dword ptr [rcx+r13]
fffff80e`6c60edc4 83e940          sub     ecx,40h
fffff80e`6c60edc7 743e            je      storport!RaidAdapterPostScatterGatherExecute+0x21487 (fffff80e`6c60ee07)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21449:
fffff80e`6c60edc9 83e901          sub     ecx,1
fffff80e`6c60edcc 7420            je      storport!RaidAdapterPostScatterGatherExecute+0x2146e (fffff80e`6c60edee)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2144e:
fffff80e`6c60edce 83f901          cmp     ecx,1
fffff80e`6c60edd1 753d            jne     storport!RaidAdapterPostScatterGatherExecute+0x21490 (fffff80e`6c60ee10)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21453:
fffff80e`6c60edd3 498d4828        lea     rcx,[r8+28h]
fffff80e`6c60edd7 483bca          cmp     rcx,rdx
fffff80e`6c60edda 7734            ja      storport!RaidAdapterPostScatterGatherExecute+0x21490 (fffff80e`6c60ee10)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2145c:
fffff80e`6c60eddc 4d8d7520        lea     r14,[r13+20h]
fffff80e`6c60ede0 4d03f0          add     r14,r8
fffff80e`6c60ede3 433974280c      cmp     dword ptr [r8+r13+0Ch],esi
fffff80e`6c60ede8 4c0f44f6        cmove   r14,rsi
fffff80e`6c60edec eb30            jmp     storport!RaidAdapterPostScatterGatherExecute+0x2149e (fffff80e`6c60ee1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2146e:
fffff80e`6c60edee 498d4838        lea     rcx,[r8+38h]
fffff80e`6c60edf2 483bca          cmp     rcx,rdx
fffff80e`6c60edf5 7719            ja      storport!RaidAdapterPostScatterGatherExecute+0x21490 (fffff80e`6c60ee10)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21477:
fffff80e`6c60edf7 433874280a      cmp     byte ptr [r8+r13+0Ah],sil
fffff80e`6c60edfc 7620            jbe     storport!RaidAdapterPostScatterGatherExecute+0x2149e (fffff80e`6c60ee1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2147e:
fffff80e`6c60edfe 4d8d7518        lea     r14,[r13+18h]
fffff80e`6c60ee02 4d03f0          add     r14,r8
fffff80e`6c60ee05 eb17            jmp     storport!RaidAdapterPostScatterGatherExecute+0x2149e (fffff80e`6c60ee1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21487:
fffff80e`6c60ee07 498d4828        lea     rcx,[r8+28h]
fffff80e`6c60ee0b 483bca          cmp     rcx,rdx
fffff80e`6c60ee0e 76e7            jbe     storport!RaidAdapterPostScatterGatherExecute+0x21477 (fffff80e`6c60edf7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21490:
fffff80e`6c60ee10 41ffc2          inc     r10d
fffff80e`6c60ee13 453bd3          cmp     r10d,r11d
fffff80e`6c60ee16 728d            jb      storport!RaidAdapterPostScatterGatherExecute+0x21425 (fffff80e`6c60eda5)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21498:
fffff80e`6c60ee18 eb04            jmp     storport!RaidAdapterPostScatterGatherExecute+0x2149e (fffff80e`6c60ee1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2149a:
fffff80e`6c60ee1a 4d8d7548        lea     r14,[r13+48h]

storport!RaidAdapterPostScatterGatherExecute+0x2149e:
fffff80e`6c60ee1e 4c8bc3          mov     r8,rbx
fffff80e`6c60ee21 33d2            xor     edx,edx
fffff80e`6c60ee23 498bc9          mov     rcx,r9
fffff80e`6c60ee26 e83d95feff      call    storport!IsZonedWriteRequest (fffff80e`6c5f8368)
fffff80e`6c60ee2b 84c0            test    al,al
fffff80e`6c60ee2d 0f84ed010000    je      storport!RaidAdapterPostScatterGatherExecute+0x216a0 (fffff80e`6c60f020)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x214b3:
fffff80e`6c60ee33 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff80e`6c60ee3a 4c8bc3          mov     r8,rbx
fffff80e`6c60ee3d 33d2            xor     edx,edx
fffff80e`6c60ee3f 488975af        mov     qword ptr [rbp-51h],rsi
fffff80e`6c60ee43 897577          mov     dword ptr [rbp+77h],esi
fffff80e`6c60ee46 4088742420      mov     byte ptr [rsp+20h],sil
fffff80e`6c60ee4b 448b8844020000  mov     r9d,dword ptr [rax+244h]
fffff80e`6c60ee52 488d8890010000  lea     rcx,[rax+190h]
fffff80e`6c60ee59 e822a00000      call    storport!RaidZoneWriteGroupListSearchRequest (fffff80e`6c618e80)
fffff80e`6c60ee5e 4c8d4577        lea     r8,[rbp+77h]
fffff80e`6c60ee62 498bce          mov     rcx,r14
fffff80e`6c60ee65 488d55af        lea     rdx,[rbp-51h]
fffff80e`6c60ee69 4c8bf8          mov     r15,rax
fffff80e`6c60ee6c e8377e0000      call    storport!RaidGetIoStartingLbaAndLength (fffff80e`6c616ca8)
fffff80e`6c60ee71 33c0            xor     eax,eax
fffff80e`6c60ee73 f0490fb17728    lock cmpxchg qword ptr [r15+28h],rsi
fffff80e`6c60ee79 4c8bf0          mov     r14,rax
fffff80e`6c60ee7c 483945af        cmp     qword ptr [rbp-51h],rax
fffff80e`6c60ee80 7514            jne     storport!RaidAdapterPostScatterGatherExecute+0x21516 (fffff80e`6c60ee96)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21502:
fffff80e`6c60ee82 8b4577          mov     eax,dword ptr [rbp+77h]
fffff80e`6c60ee85 448bf0          mov     r14d,eax
fffff80e`6c60ee88 f04d0fc17728    lock xadd qword ptr [r15+28h],r14
fffff80e`6c60ee8e 4c03f0          add     r14,rax
fffff80e`6c60ee91 e9b9000000      jmp     storport!RaidAdapterPostScatterGatherExecute+0x215cf (fffff80e`6c60ef4f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21516:
fffff80e`6c60ee96 4c8b93e0000000  mov     r10,qword ptr [rbx+0E0h]
fffff80e`6c60ee9d 41b3ff          mov     r11b,0FFh
fffff80e`6c60eea0 450fb6e3        movzx   r12d,r11b
fffff80e`6c60eea4 418b4260        mov     eax,dword ptr [r10+60h]
fffff80e`6c60eea8 448bc0          mov     r8d,eax
fffff80e`6c60eeab 41c1e808        shr     r8d,8
fffff80e`6c60eeaf 448bc8          mov     r9d,eax
fffff80e`6c60eeb2 410fb6c8        movzx   ecx,r8b
fffff80e`6c60eeb6 41c1e910        shr     r9d,10h
fffff80e`6c60eeba 0fb6d0          movzx   edx,al
fffff80e`6c60eebd c1e208          shl     edx,8
fffff80e`6c60eec0 0bd1            or      edx,ecx
fffff80e`6c60eec2 410fb6c9        movzx   ecx,r9b
fffff80e`6c60eec6 c1e208          shl     edx,8
fffff80e`6c60eec9 0bd1            or      edx,ecx
fffff80e`6c60eecb 81faffffff00    cmp     edx,0FFFFFFh
fffff80e`6c60eed1 740e            je      storport!RaidAdapterPostScatterGatherExecute+0x21561 (fffff80e`6c60eee1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21553:
fffff80e`6c60eed3 450fb6e0        movzx   r12d,r8b
fffff80e`6c60eed7 440fb6d8        movzx   r11d,al
fffff80e`6c60eedb 450fb6c1        movzx   r8d,r9b
fffff80e`6c60eedf eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x21564 (fffff80e`6c60eee4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21561:
fffff80e`6c60eee1 41b0ff          mov     r8b,0FFh

storport!RaidAdapterPostScatterGatherExecute+0x21564:
fffff80e`6c60eee4 f605d9f8020020  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x4 (fffff80e`6c63e7c4)],20h
fffff80e`6c60eeeb 7456            je      storport!RaidAdapterPostScatterGatherExecute+0x215c3 (fffff80e`6c60ef43)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2156d:
fffff80e`6c60eeed 4c8b4daf        mov     r9,qword ptr [rbp-51h]
fffff80e`6c60eef1 498d8ab8060000  lea     rcx,[r10+6B8h]
fffff80e`6c60eef8 8b4577          mov     eax,dword ptr [rbp+77h]
fffff80e`6c60eefb 498b5218        mov     rdx,qword ptr [r10+18h]
fffff80e`6c60eeff 4c89742460      mov     qword ptr [rsp+60h],r14
fffff80e`6c60ef04 4c894c2458      mov     qword ptr [rsp+58h],r9
fffff80e`6c60ef09 4889442450      mov     qword ptr [rsp+50h],rax
fffff80e`6c60ef0e 488b8300030000  mov     rax,qword ptr [rbx+300h]
fffff80e`6c60ef15 448b4a38        mov     r9d,dword ptr [rdx+38h]
fffff80e`6c60ef19 4889442448      mov     qword ptr [rsp+48h],rax
fffff80e`6c60ef1e 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff80e`6c60ef25 4889442440      mov     qword ptr [rsp+40h],rax
fffff80e`6c60ef2a 48894c2438      mov     qword ptr [rsp+38h],rcx
fffff80e`6c60ef2f 4488442430      mov     byte ptr [rsp+30h],r8b
fffff80e`6c60ef34 4488642428      mov     byte ptr [rsp+28h],r12b
fffff80e`6c60ef39 44885c2420      mov     byte ptr [rsp+20h],r11b
fffff80e`6c60ef3e e8593b0000      call    storport!McTemplateK0quuujppxii (fffff80e`6c612a9c)

storport!RaidAdapterPostScatterGatherExecute+0x215c3:
fffff80e`6c60ef43 ff8770160000    inc     dword ptr [rdi+1670h]
fffff80e`6c60ef49 41bc01000000    mov     r12d,1

storport!RaidAdapterPostScatterGatherExecute+0x215cf:
fffff80e`6c60ef4f 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff80e`6c60ef56 488d55f7        lea     rdx,[rbp-9]
fffff80e`6c60ef5a 4881c120020000  add     rcx,220h
fffff80e`6c60ef61 48ff1548530300  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff80e`6c6442b0)]
fffff80e`6c60ef68 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60ef6d 41ff4f38        dec     dword ptr [r15+38h]
fffff80e`6c60ef71 498bc6          mov     rax,r14
fffff80e`6c60ef74 492b4710        sub     rax,qword ptr [r15+10h]
fffff80e`6c60ef78 493b4720        cmp     rax,qword ptr [r15+20h]
fffff80e`6c60ef7c 7253            jb      storport!RaidAdapterPostScatterGatherExecute+0x21651 (fffff80e`6c60efd1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x215fe:
fffff80e`6c60ef7e 488b052bf30200  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c60ef85 480fbae00c      bt      rax,0Ch
fffff80e`6c60ef8a 732c            jae     storport!RaidAdapterPostScatterGatherExecute+0x21638 (fffff80e`6c60efb8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2160c:
fffff80e`6c60ef8c 488b45bf        mov     rax,qword ptr [rbp-41h]
fffff80e`6c60ef90 ba29000000      mov     edx,29h
fffff80e`6c60ef95 448b4d77        mov     r9d,dword ptr [rbp+77h]
fffff80e`6c60ef99 488bcf          mov     rcx,rdi
fffff80e`6c60ef9c 4c8b45af        mov     r8,qword ptr [rbp-51h]
fffff80e`6c60efa0 4889442430      mov     qword ptr [rsp+30h],rax
fffff80e`6c60efa5 498b4710        mov     rax,qword ptr [r15+10h]
fffff80e`6c60efa9 4889442428      mov     qword ptr [rsp+28h],rax
fffff80e`6c60efae 4c89742420      mov     qword ptr [rsp+20h],r14
fffff80e`6c60efb3 e84c09feff      call    storport!DbgLogRequest (fffff80e`6c5ef904)

storport!RaidAdapterPostScatterGatherExecute+0x21638:
fffff80e`6c60efb8 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff80e`6c60efbf 4533c0          xor     r8d,r8d
fffff80e`6c60efc2 4881c190010000  add     rcx,190h
fffff80e`6c60efc9 498bd7          mov     rdx,r15
fffff80e`6c60efcc e84b9e0000      call    storport!RaidZoneWriteGroupListRemoveRequest (fffff80e`6c618e1c)

storport!RaidAdapterPostScatterGatherExecute+0x21651:
fffff80e`6c60efd1 488d4df7        lea     rcx,[rbp-9]
fffff80e`6c60efd5 48ff1554500300  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff80e`6c644030)]
fffff80e`6c60efdc 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60efe1 488b05c8f20200  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c60efe8 480fbae00c      bt      rax,0Ch
fffff80e`6c60efed 0f8376020000    jae     storport!RaidAdapterPostScatterGatherExecute+0x218e9 (fffff80e`6c60f269)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21673:
fffff80e`6c60eff3 488b45bf        mov     rax,qword ptr [rbp-41h]
fffff80e`6c60eff7 ba28000000      mov     edx,28h
fffff80e`6c60effc 448b4d77        mov     r9d,dword ptr [rbp+77h]
fffff80e`6c60f000 488bcf          mov     rcx,rdi
fffff80e`6c60f003 4c8b45af        mov     r8,qword ptr [rbp-51h]
fffff80e`6c60f007 4889442430      mov     qword ptr [rsp+30h],rax
fffff80e`6c60f00c 4c896c2428      mov     qword ptr [rsp+28h],r13
fffff80e`6c60f011 4c89742420      mov     qword ptr [rsp+20h],r14
fffff80e`6c60f016 e8e908feff      call    storport!DbgLogRequest (fffff80e`6c5ef904)
fffff80e`6c60f01b e949020000      jmp     storport!RaidAdapterPostScatterGatherExecute+0x218e9 (fffff80e`6c60f269)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216a0:
fffff80e`6c60f020 4889757f        mov     qword ptr [rbp+7Fh],rsi
fffff80e`6c60f024 4d85f6          test    r14,r14
fffff80e`6c60f027 0f8440020000    je      storport!RaidAdapterPostScatterGatherExecute+0x218ed (fffff80e`6c60f26d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216ad:
fffff80e`6c60f02d 410fb64502      movzx   eax,byte ptr [r13+2]
fffff80e`6c60f032 3c28            cmp     al,28h
fffff80e`6c60f034 7506            jne     storport!RaidAdapterPostScatterGatherExecute+0x216bc (fffff80e`6c60f03c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216b6:
fffff80e`6c60f036 418b4514        mov     eax,dword ptr [r13+14h]
fffff80e`6c60f03a eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x216bf (fffff80e`6c60f03f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216bc:
fffff80e`6c60f03c 0fb6c0          movzx   eax,al

storport!RaidAdapterPostScatterGatherExecute+0x216bf:
fffff80e`6c60f03f 85c0            test    eax,eax
fffff80e`6c60f041 0f8526020000    jne     storport!RaidAdapterPostScatterGatherExecute+0x218ed (fffff80e`6c60f26d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216c7:
fffff80e`6c60f047 41803e94        cmp     byte ptr [r14],94h
fffff80e`6c60f04b 0f851c020000    jne     storport!RaidAdapterPostScatterGatherExecute+0x218ed (fffff80e`6c60f26d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216d1:
fffff80e`6c60f051 41807e0104      cmp     byte ptr [r14+1],4
fffff80e`6c60f056 0f8511020000    jne     storport!RaidAdapterPostScatterGatherExecute+0x218ed (fffff80e`6c60f26d)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x216dc:
fffff80e`6c60f05c 4c8b8be0000000  mov     r9,qword ptr [rbx+0E0h]
fffff80e`6c60f063 41b4ff          mov     r12b,0FFh
fffff80e`6c60f066 4488656f        mov     byte ptr [rbp+6Fh],r12b
fffff80e`6c60f06a 44886567        mov     byte ptr [rbp+67h],r12b
fffff80e`6c60f06e 418b4160        mov     eax,dword ptr [r9+60h]
fffff80e`6c60f072 448bc0          mov     r8d,eax
fffff80e`6c60f075 41c1e808        shr     r8d,8
fffff80e`6c60f079 448bd0          mov     r10d,eax
fffff80e`6c60f07c 410fb6c8        movzx   ecx,r8b
fffff80e`6c60f080 41c1ea10        shr     r10d,10h
fffff80e`6c60f084 0fb6d0          movzx   edx,al
fffff80e`6c60f087 c1e208          shl     edx,8
fffff80e`6c60f08a 0bd1            or      edx,ecx
fffff80e`6c60f08c 410fb6ca        movzx   ecx,r10b
fffff80e`6c60f090 c1e208          shl     edx,8
fffff80e`6c60f093 0bd1            or      edx,ecx
fffff80e`6c60f095 81faffffff00    cmp     edx,0FFFFFFh
fffff80e`6c60f09b 740c            je      storport!RaidAdapterPostScatterGatherExecute+0x21729 (fffff80e`6c60f0a9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2171d:
fffff80e`6c60f09d 440fb6e0        movzx   r12d,al
fffff80e`6c60f0a1 4488456f        mov     byte ptr [rbp+6Fh],r8b
fffff80e`6c60f0a5 44885567        mov     byte ptr [rbp+67h],r10b

storport!RaidAdapterPostScatterGatherExecute+0x21729:
fffff80e`6c60f0a9 41f6460e01      test    byte ptr [r14+0Eh],1
fffff80e`6c60f0ae 498d8990010000  lea     rcx,[r9+190h]
fffff80e`6c60f0b5 752f            jne     storport!RaidAdapterPostScatterGatherExecute+0x21766 (fffff80e`6c60f0e6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21737:
fffff80e`6c60f0b7 458b8944020000  mov     r9d,dword ptr [r9+244h]
fffff80e`6c60f0be 4c8bc3          mov     r8,rbx
fffff80e`6c60f0c1 33d2            xor     edx,edx
fffff80e`6c60f0c3 4088742420      mov     byte ptr [rsp+20h],sil
fffff80e`6c60f0c8 e8b39d0000      call    storport!RaidZoneWriteGroupListSearchRequest (fffff80e`6c618e80)
fffff80e`6c60f0cd 4885c0          test    rax,rax
fffff80e`6c60f0d0 0f8484000000    je      storport!RaidAdapterPostScatterGatherExecute+0x217da (fffff80e`6c60f15a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21756:
fffff80e`6c60f0d6 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff80e`6c60f0dd 4881c190010000  add     rcx,190h
fffff80e`6c60f0e4 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x21769 (fffff80e`6c60f0e9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21766:
fffff80e`6c60f0e6 488bc6          mov     rax,rsi

storport!RaidAdapterPostScatterGatherExecute+0x21769:
fffff80e`6c60f0e9 488bd0          mov     rdx,rax
fffff80e`6c60f0ec e8bf9c0000      call    storport!RaidZoneWriteGroupListPendingIoCount (fffff80e`6c618db0)
fffff80e`6c60f0f1 85c0            test    eax,eax
fffff80e`6c60f0f3 7465            je      storport!RaidAdapterPostScatterGatherExecute+0x217da (fffff80e`6c60f15a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21775:
fffff80e`6c60f0f5 488b83a8000000  mov     rax,qword ptr [rbx+0A8h]
fffff80e`6c60f0fc 41b001          mov     r8b,1
fffff80e`6c60f0ff 488bd3          mov     rdx,rbx
fffff80e`6c60f102 488bcf          mov     rcx,rdi
fffff80e`6c60f105 c6400304        mov     byte ptr [rax+3],4    ;Srb->SrbStatus = SRB_STATUS_ERROR??
fffff80e`6c60f109 e8e2fbfdff      call    storport!RaidAdapterRequestComplete (fffff80e`6c5eecf0)
fffff80e`6c60f10e 4038b762110000  cmp     byte ptr [rdi+1162h],sil
fffff80e`6c60f115 0f8444edfdff    je      storport!RaidAdapterPostScatterGatherExecute+0x4df (fffff80e`6c5ede5f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2179b:
fffff80e`6c60f11b 83bf8812000001  cmp     dword ptr [rdi+1288h],1   ;if (AdapterExt->ConcurrentChannels <=1) goto 0x217c8
fffff80e`6c60f122 7e24            jle     storport!RaidAdapterPostScatterGatherExecute+0x217c8 (fffff80e`6c60f148)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x217a4:
fffff80e`6c60f124 418b4f10        mov     ecx,dword ptr [r15+10h]
fffff80e`6c60f128 498bd7          mov     rdx,r15
fffff80e`6c60f12b 48c1e106        shl     rcx,6
fffff80e`6c60f12f 48038f90120000  add     rcx,qword ptr [rdi+1290h]     ;push back to AdapterExt-> ???   這很有嫌疑...
fffff80e`6c60f136 48ff15934f0300  call    qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff80e`6c6440d0)]
fffff80e`6c60f13d 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60f142 90              nop
fffff80e`6c60f143 e917edfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x4df (fffff80e`6c5ede5f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x217c8:
fffff80e`6c60f148 488d55df        lea     rdx,[rbp-21h]
fffff80e`6c60f14c 488bcf          mov     rcx,rdi
fffff80e`6c60f14f e820c7fdff      call    storport!RaidAdapterReleaseStartIoLock (fffff80e`6c5eb874)
fffff80e`6c60f154 90              nop
fffff80e`6c60f155 e905edfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x4df (fffff80e`6c5ede5f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x217da:
fffff80e`6c60f15a 488b054ff10200  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c60f161 480fbae00c      bt      rax,0Ch
fffff80e`6c60f166 0f8388000000    jae     storport!RaidAdapterPostScatterGatherExecute+0x21874 (fffff80e`6c60f1f4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x217ec:
fffff80e`6c60f16c 410fb64602      movzx   eax,byte ptr [r14+2]
fffff80e`6c60f171 4533c9          xor     r9d,r9d
fffff80e`6c60f174 410fb64e0e      movzx   ecx,byte ptr [r14+0Eh]
fffff80e`6c60f179 888586000000    mov     byte ptr [rbp+86h],al
fffff80e`6c60f17f 83e101          and     ecx,1
fffff80e`6c60f182 410fb64603      movzx   eax,byte ptr [r14+3]
fffff80e`6c60f187 888585000000    mov     byte ptr [rbp+85h],al
fffff80e`6c60f18d 418d512a        lea     edx,[r9+2Ah]
fffff80e`6c60f191 410fb64604      movzx   eax,byte ptr [r14+4]
fffff80e`6c60f196 888584000000    mov     byte ptr [rbp+84h],al
fffff80e`6c60f19c 410fb64605      movzx   eax,byte ptr [r14+5]
fffff80e`6c60f1a1 888583000000    mov     byte ptr [rbp+83h],al
fffff80e`6c60f1a7 410fb64606      movzx   eax,byte ptr [r14+6]
fffff80e`6c60f1ac 888582000000    mov     byte ptr [rbp+82h],al
fffff80e`6c60f1b2 410fb64607      movzx   eax,byte ptr [r14+7]
fffff80e`6c60f1b7 888581000000    mov     byte ptr [rbp+81h],al
fffff80e`6c60f1bd 410fb64608      movzx   eax,byte ptr [r14+8]
fffff80e`6c60f1c2 888580000000    mov     byte ptr [rbp+80h],al
fffff80e`6c60f1c8 410fb64609      movzx   eax,byte ptr [r14+9]
fffff80e`6c60f1cd 88457f          mov     byte ptr [rbp+7Fh],al
fffff80e`6c60f1d0 488b45bf        mov     rax,qword ptr [rbp-41h]
fffff80e`6c60f1d4 4c8b7d7f        mov     r15,qword ptr [rbp+7Fh]
fffff80e`6c60f1d8 4889442430      mov     qword ptr [rsp+30h],rax
fffff80e`6c60f1dd 4d8bc7          mov     r8,r15
fffff80e`6c60f1e0 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff80e`6c60f1e5 488bcf          mov     rcx,rdi
fffff80e`6c60f1e8 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff80e`6c60f1ed e81207feff      call    storport!DbgLogRequest (fffff80e`6c5ef904)
fffff80e`6c60f1f2 eb04            jmp     storport!RaidAdapterPostScatterGatherExecute+0x21878 (fffff80e`6c60f1f8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21874:
fffff80e`6c60f1f4 4c8b7d7f        mov     r15,qword ptr [rbp+7Fh]

storport!RaidAdapterPostScatterGatherExecute+0x21878:
fffff80e`6c60f1f8 f605c5f5020040  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x4 (fffff80e`6c63e7c4)],40h
fffff80e`6c60f1ff 7462            je      storport!RaidAdapterPostScatterGatherExecute+0x218e3 (fffff80e`6c60f263)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21881:
fffff80e`6c60f201 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff80e`6c60f208 410fb64e0e      movzx   ecx,byte ptr [r14+0Eh]
fffff80e`6c60f20d 83e101          and     ecx,1
fffff80e`6c60f210 894c2460        mov     dword ptr [rsp+60h],ecx
fffff80e`6c60f214 4c8b4018        mov     r8,qword ptr [rax+18h]
fffff80e`6c60f218 488d90b8060000  lea     rdx,[rax+6B8h]
fffff80e`6c60f21f 488b8300030000  mov     rax,qword ptr [rbx+300h]
fffff80e`6c60f226 89742458        mov     dword ptr [rsp+58h],esi
fffff80e`6c60f22a 4c897c2450      mov     qword ptr [rsp+50h],r15
fffff80e`6c60f22f 458b4838        mov     r9d,dword ptr [r8+38h]
fffff80e`6c60f233 4889442448      mov     qword ptr [rsp+48h],rax
fffff80e`6c60f238 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff80e`6c60f23f 4889442440      mov     qword ptr [rsp+40h],rax
fffff80e`6c60f244 0fb64567        movzx   eax,byte ptr [rbp+67h]
fffff80e`6c60f248 4889542438      mov     qword ptr [rsp+38h],rdx
fffff80e`6c60f24d 88442430        mov     byte ptr [rsp+30h],al
fffff80e`6c60f251 0fb6456f        movzx   eax,byte ptr [rbp+6Fh]
fffff80e`6c60f255 88442428        mov     byte ptr [rsp+28h],al
fffff80e`6c60f259 4488642420      mov     byte ptr [rsp+20h],r12b
fffff80e`6c60f25e e839370000      call    storport!McTemplateK0quuujppiqt (fffff80e`6c61299c)

storport!RaidAdapterPostScatterGatherExecute+0x218e3:
fffff80e`6c60f263 41bc01000000    mov     r12d,1

storport!RaidAdapterPostScatterGatherExecute+0x218e9:
fffff80e`6c60f269 4c8b7db7        mov     r15,qword ptr [rbp-49h]

storport!RaidAdapterPostScatterGatherExecute+0x218ed:
fffff80e`6c60f26d 4c8b6da7        mov     r13,qword ptr [rbp-59h]
fffff80e`6c60f271 e9e1e8fdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x1d7 (fffff80e`6c5edb57)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x218f6:
fffff80e`6c60f276 403835c3f50200  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],sil
fffff80e`6c60f27d 7410            je      storport!RaidAdapterPostScatterGatherExecute+0x2190f (fffff80e`6c60f28f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x218ff:
fffff80e`6c60f27f 33c9            xor     ecx,ecx
fffff80e`6c60f281 48ff15784d0300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff80e`6c644000)]
fffff80e`6c60f288 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60f28d eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x2191b (fffff80e`6c60f29b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2190f:
fffff80e`6c60f28f 48ff15124e0300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`6c6440a8)]
fffff80e`6c60f296 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x2191b:
fffff80e`6c60f29b 488983c8020000  mov     qword ptr [rbx+2C8h],rax      ;;set SRB->RequestAfterStartIoTimeStamp
fffff80e`6c60f2a2 e929e9fdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x250 (fffff80e`6c5edbd0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21927:
fffff80e`6c60f2a7 0fb655df        movzx   edx,byte ptr [rbp-21h]
fffff80e`6c60f2ab 488bcf          mov     rcx,rdi
fffff80e`6c60f2ae e8ddd4fdff      call    storport!RaidAdapterReleaseInterruptLock (fffff80e`6c5ec790)
fffff80e`6c60f2b3 90              nop
fffff80e`6c60f2b4 e932e9fdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x26b (fffff80e`6c5edbeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x21939:
fffff80e`6c60f2b9 48a11400000080f7ffff mov rax,qword ptr [FFFFF78000000014h]
fffff80e`6c60f2c3 e972ebfdff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x4ba (fffff80e`6c5ede3a)  Branch
