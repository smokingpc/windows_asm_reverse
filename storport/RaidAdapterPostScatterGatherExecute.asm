5: kd> uf  RaidAdapterPostScatterGatherExecute
storport!RaidAdapterPostScatterGatherExecute:
fffff804`5daf49a0 4053            push    rbx
fffff804`5daf49a2 55              push    rbp
fffff804`5daf49a3 57              push    rdi
fffff804`5daf49a4 4154            push    r12
fffff804`5daf49a6 4155            push    r13
fffff804`5daf49a8 4156            push    r14
fffff804`5daf49aa 4157            push    r15
fffff804`5daf49ac 4883ec40        sub     rsp,40h
fffff804`5daf49b0 33ed            xor     ebp,ebp
fffff804`5daf49b2 48898ad8000000  mov     qword ptr [rdx+0D8h],rcx
fffff804`5daf49b9 488bda          mov     rbx,rdx                   ;RDX = RBX = Arg2 = PortContext == _EXTENDED_REQUEST_BLOCK (XRB)
fffff804`5daf49bc 4889ac2480000000 mov     qword ptr [rsp+80h],rbp
fffff804`5daf49c4 488b92e0000000  mov     rdx,qword ptr [rdx+0E0h]  ;RDX = RDX+0xE0 ==> XRB->Unit
fffff804`5daf49cb 488bf9          mov     rdi,rcx                   ;RCX = RDI = Arg1 (AdapterExt??)
fffff804`5daf49ce 448bfd          mov     r15d,ebp
fffff804`5daf49d1 4889ac2488000000 mov     qword ptr [rsp+88h],rbp
fffff804`5daf49d9 448be5          mov     r12d,ebp
fffff804`5daf49dc 448bed          mov     r13d,ebp
fffff804`5daf49df 488b8ba8000000  mov     rcx,qword ptr [rbx+0A8h]  ;RCX = RDX+0xA8 ==> SRB
fffff804`5daf49e6 0fb64102        movzx   eax,byte ptr [rcx+2]      ;DL = Srb->Function
fffff804`5daf49ea 3c28            cmp     al,28h        ;if Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK, goto 0x57 (SCSI_REQUEST_BLOCK)
fffff804`5daf49ec 7509            jne     storport!RaidAdapterPostScatterGatherExecute+0x57 (fffff804`5daf49f7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4e:
fffff804`5daf49ee 8b4114          mov     eax,dword ptr [rcx+14h]   ;EAX = Srb->SrbFunction
fffff804`5daf49f1 448b4118        mov     r8d,dword ptr [rcx+18h]   ;R8D = Srb->SrbFlags
fffff804`5daf49f5 eb07            jmp     storport!RaidAdapterPostScatterGatherExecute+0x5e (fffff804`5daf49fe)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x57:
fffff804`5daf49f7 448b410c        mov     r8d,dword ptr [rcx+0Ch]   ;R8D = Srb->Flags
fffff804`5daf49fb 0fb6c0          movzx   eax,al                    ;EAX = Srb->Function

storport!RaidAdapterPostScatterGatherExecute+0x5e:
fffff804`5daf49fe 41be01000000    mov     r14d,1
fffff804`5daf4a04 4885d2          test    rdx,rdx       ;if (XRB->Unit == NULL) goto 0x4e6
fffff804`5daf4a07 7469            je      storport!RaidAdapterPostScatterGatherExecute+0xd2 (fffff804`5daf4a72)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x69:
fffff804`5daf4a09 39aaac020000    cmp     dword ptr [rdx+2ACh],ebp  ;if(UnitExt->IoQueue->DeviceQueue->PauseCount <= 0 ) goto 0xb1
fffff804`5daf4a0f 7e40            jle     storport!RaidAdapterPostScatterGatherExecute+0xb1 (fffff804`5daf4a51)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x71:
fffff804`5daf4a11 83f820          cmp     eax,20h   ;if(Srb->SrbFunction == SRB_FUNCTION_RESET_LOGICAL_UNIT)  goto 0x7e
fffff804`5daf4a14 7408            je      storport!RaidAdapterPostScatterGatherExecute+0x7e (fffff804`5daf4a1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x76:
fffff804`5daf4a16 83f813          cmp     eax,13h   ;if(Srb->SrbFunction != SRB_FUNCTION_RESET_DEVICE) goto 0x80
fffff804`5daf4a19 418bc6          mov     eax,r14d  ;set EAX = 1
fffff804`5daf4a1c 7502            jne     storport!RaidAdapterPostScatterGatherExecute+0x80 (fffff804`5daf4a20)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x7e:
fffff804`5daf4a1e 8bc5            mov     eax,ebp   ;set EAX = 0

storport!RaidAdapterPostScatterGatherExecute+0x80:
fffff804`5daf4a20 85c0            test    eax,eax
fffff804`5daf4a22 7564            jne     storport!RaidAdapterPostScatterGatherExecute+0xe8 (fffff804`5daf4a88)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x84:
fffff804`5daf4a24 40382d65ce0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff804`5db51890)],bpl
fffff804`5daf4a2b 0f848d000000    je      storport!RaidAdapterPostScatterGatherExecute+0x11e (fffff804`5daf4abe)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x91:
fffff804`5daf4a31 40382d38ce0500  cmp     byte ptr [storport!UseQPCTime (fffff804`5db51870)],bpl

storport!RaidAdapterPostScatterGatherExecute+0x98:
fffff804`5daf4a38 0f849c000000    je      storport!RaidAdapterPostScatterGatherExecute+0x13a (fffff804`5daf4ada)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x9e:
fffff804`5daf4a3e 33c9            xor     ecx,ecx
fffff804`5daf4a40 48ff15b9250600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff804`5db57000)]
fffff804`5daf4a47 0f1f440000      nop     dword ptr [rax+rax]
fffff804`5daf4a4c e99a000000      jmp     storport!RaidAdapterPostScatterGatherExecute+0x14b (fffff804`5daf4aeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xb1:
fffff804`5daf4a51 4038aab4020000  cmp     byte ptr [rdx+2B4h],bpl   ;if(UnitExt->IoQueue->DeviceQueue->Frozen) goto 0xc0
fffff804`5daf4a58 7406            je      storport!RaidAdapterPostScatterGatherExecute+0xc0 (fffff804`5daf4a60)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xba:
fffff804`5daf4a5a 41f6c010        test    r8b,10h       ;if(SrbFlags == SRB_FLAGS_BYPASS_FROZEN_QUEUE) goto 0xe8
fffff804`5daf4a5e 7428            je      storport!RaidAdapterPostScatterGatherExecute+0xe8 (fffff804`5daf4a88)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xc0:
fffff804`5daf4a60 4038aab5020000  cmp     byte ptr [rdx+2B5h],bpl   ;if(UnitExt->IoQueue->DeviceQueue->Locked) goto 0x84
fffff804`5daf4a67 74bb            je      storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff804`5daf4a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xc9:
fffff804`5daf4a69 41f7c000000800  test    r8d,80000h    ;SRB_FLAGS_BYPASS_LOCKED_QUEUE
fffff804`5daf4a70 eb14            jmp     storport!RaidAdapterPostScatterGatherExecute+0xe6 (fffff804`5daf4a86)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xd2:
fffff804`5daf4a72 39af6c030000    cmp     dword ptr [rdi+36Ch],ebp  ;if(0==AdapterExt->IoGateway->PauseCount) goto 0x84
fffff804`5daf4a78 74aa            je      storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff804`5daf4a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xda:
fffff804`5daf4a7a 83c0dc          add     eax,0FFFFFFDCh
fffff804`5daf4a7d 413bc6          cmp     eax,r14d
fffff804`5daf4a80 76a2            jbe     storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff804`5daf4a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xe2:
fffff804`5daf4a82 f6431108        test    byte ptr [rbx+11h],8

storport!RaidAdapterPostScatterGatherExecute+0xe6:  ;if(SrbFlags != SRB_FLAGS_BYPASS_LOCKED_QUEUE) goto 0x84
fffff804`5daf4a86 759c            jne     storport!RaidAdapterPostScatterGatherExecute+0x84 (fffff804`5daf4a24)  Branch

storport!RaidAdapterPostScatterGatherExecute+0xe8:
fffff804`5daf4a88 c6410305        mov     byte ptr [rcx+3],5
fffff804`5daf4a8c 4c8bc3          mov     r8,rbx
fffff804`5daf4a8f 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff804`5daf4a96 33d2            xor     edx,edx
fffff804`5daf4a98 e87f260200      call    storport!RaidUpdateZoneIoMetadata (fffff804`5db1711c)
fffff804`5daf4a9d 450fb6c6        movzx   r8d,r14b
fffff804`5daf4aa1 488bd3          mov     rdx,rbx
fffff804`5daf4aa4 488bcf          mov     rcx,rdi
fffff804`5daf4aa7 e834130000      call    storport!RaidAdapterRequestComplete (fffff804`5daf5de0)
fffff804`5daf4aac 33c0            xor     eax,eax
fffff804`5daf4aae 4883c440        add     rsp,40h
fffff804`5daf4ab2 415f            pop     r15
fffff804`5daf4ab4 415e            pop     r14
fffff804`5daf4ab6 415d            pop     r13
fffff804`5daf4ab8 415c            pop     r12
fffff804`5daf4aba 5f              pop     rdi
fffff804`5daf4abb 5d              pop     rbp
fffff804`5daf4abc 5b              pop     rbx
fffff804`5daf4abd c3              ret

storport!RaidAdapterPostScatterGatherExecute+0x11e:
fffff804`5daf4abe 392d18c80500    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceEnabled (fffff804`5db512dc)],ebp
fffff804`5daf4ac4 7422            je      storport!RaidAdapterPostScatterGatherExecute+0x148 (fffff804`5daf4ae8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x126:
fffff804`5daf4ac6 40382da3cd0500  cmp     byte ptr [storport!UseQPCTime (fffff804`5db51870)],bpl
fffff804`5daf4acd 740b            je      storport!RaidAdapterPostScatterGatherExecute+0x13a (fffff804`5daf4ada)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x12f:
fffff804`5daf4acf 392d0bc80500    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceHighResolutionTimer (fffff804`5db512e0)],ebp
fffff804`5daf4ad5 e95effffff      jmp     storport!RaidAdapterPostScatterGatherExecute+0x98 (fffff804`5daf4a38)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x13a:
fffff804`5daf4ada 48ff15c7250600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff804`5db570a8)]
fffff804`5daf4ae1 0f1f440000      nop     dword ptr [rax+rax]
fffff804`5daf4ae6 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x14b (fffff804`5daf4aeb)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x148:
fffff804`5daf4ae8 488bc5          mov     rax,rbp

storport!RaidAdapterPostScatterGatherExecute+0x14b:
fffff804`5daf4aeb 40382d80cd0500  cmp     byte ptr [storport!FUAEnabled (fffff804`5db51872)],bpl
fffff804`5daf4af2 4c8b93a8000000  mov     r10,qword ptr [rbx+0A8h]  ;R10 = RBX+0xA8 ==> SRB
fffff804`5daf4af9 4889b42498000000 mov     qword ptr [rsp+98h],rsi  ;push RSI?
fffff804`5daf4b01 488983b8020000  mov     qword ptr [rbx+2B8h],rax  ;UnitExt->IoQueue->DeviceQueue->QuiescenceClients?
fffff804`5daf4b08 0f85ee000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff804`5daf4bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x16e:
fffff804`5daf4b0e 4d85d2          test    r10,r10   ;if(Srb is NULL) goto 0x25c
fffff804`5daf4b11 0f84e5000000    je      storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff804`5daf4bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x177:
fffff804`5daf4b17 410fb64202      movzx   eax,byte ptr [r10+2]
fffff804`5daf4b1c 3c28            cmp     al,28h    ;if Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK, goto 0x226 (SCSI_REQUEST_BLOCK)
fffff804`5daf4b1e 0f85a2000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x226 (fffff804`5daf4bc6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x184:
fffff804`5daf4b24 458b7a14        mov     r15d,dword ptr [r10+14h]
fffff804`5daf4b28 488bf5          mov     rsi,rbp
fffff804`5daf4b2b 4585ff          test    r15d,r15d
fffff804`5daf4b2e 0f859a000000    jne     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff804`5daf4bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x194:
fffff804`5daf4b34 458b7238        mov     r14d,dword ptr [r10+38h]
fffff804`5daf4b38 448bdd          mov     r11d,ebp
fffff804`5daf4b3b 4585f6          test    r14d,r14d
fffff804`5daf4b3e 744a            je      storport!RaidAdapterPostScatterGatherExecute+0x1ea (fffff804`5daf4b8a)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1a0:
fffff804`5daf4b40 418bc3          mov     eax,r11d
fffff804`5daf4b43 418b4c8278      mov     ecx,dword ptr [r10+rax*4+78h]
fffff804`5daf4b48 81f980000000    cmp     ecx,80h
fffff804`5daf4b4e 7254            jb      storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff804`5daf4ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1b0:
fffff804`5daf4b50 418b5210        mov     edx,dword ptr [r10+10h]
fffff804`5daf4b54 3bca            cmp     ecx,edx
fffff804`5daf4b56 734c            jae     storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff804`5daf4ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1b8:
fffff804`5daf4b58 4e8d0c11        lea     r9,[rcx+r10]
fffff804`5daf4b5c 448bc1          mov     r8d,ecx
fffff804`5daf4b5f 418b09          mov     ecx,dword ptr [r9]
fffff804`5daf4b62 83e940          sub     ecx,40h
fffff804`5daf4b65 7431            je      storport!RaidAdapterPostScatterGatherExecute+0x1f8 (fffff804`5daf4b98)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1c7:
fffff804`5daf4b67 83e901          sub     ecx,1
fffff804`5daf4b6a 7426            je      storport!RaidAdapterPostScatterGatherExecute+0x1f2 (fffff804`5daf4b92)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1cc:
fffff804`5daf4b6c 83f901          cmp     ecx,1
fffff804`5daf4b6f 7533            jne     storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff804`5daf4ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1d1:
fffff804`5daf4b71 498d4828        lea     rcx,[r8+28h]
fffff804`5daf4b75 8bc2            mov     eax,edx
fffff804`5daf4b77 483bca          cmp     rcx,rdx
fffff804`5daf4b7a 7728            ja      storport!RaidAdapterPostScatterGatherExecute+0x204 (fffff804`5daf4ba4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1dc:
fffff804`5daf4b7c 418b410c        mov     eax,dword ptr [r9+0Ch]
fffff804`5daf4b80 498d7120        lea     rsi,[r9+20h]
fffff804`5daf4b84 85c0            test    eax,eax
fffff804`5daf4b86 480f44f5        cmove   rsi,rbp

storport!RaidAdapterPostScatterGatherExecute+0x1ea:
fffff804`5daf4b8a 41be01000000    mov     r14d,1
fffff804`5daf4b90 eb3c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff804`5daf4bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1f2:
fffff804`5daf4b92 498d4838        lea     rcx,[r8+38h]
fffff804`5daf4b96 eb04            jmp     storport!RaidAdapterPostScatterGatherExecute+0x1fc (fffff804`5daf4b9c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x1f8:
fffff804`5daf4b98 498d4828        lea     rcx,[r8+28h]

storport!RaidAdapterPostScatterGatherExecute+0x1fc:
fffff804`5daf4b9c 488bc2          mov     rax,rdx
fffff804`5daf4b9f 483bca          cmp     rcx,rdx
fffff804`5daf4ba2 7610            jbe     storport!RaidAdapterPostScatterGatherExecute+0x214 (fffff804`5daf4bb4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x204:
fffff804`5daf4ba4 41ffc3          inc     r11d
fffff804`5daf4ba7 453bde          cmp     r11d,r14d
fffff804`5daf4baa 7294            jb      storport!RaidAdapterPostScatterGatherExecute+0x1a0 (fffff804`5daf4b40)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x20c:
fffff804`5daf4bac 41be01000000    mov     r14d,1
fffff804`5daf4bb2 eb1a            jmp     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff804`5daf4bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x214:
fffff804`5daf4bb4 41be01000000    mov     r14d,1
fffff804`5daf4bba 4138710a        cmp     byte ptr [r9+0Ah],sil
fffff804`5daf4bbe 760e            jbe     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff804`5daf4bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x220:
fffff804`5daf4bc0 498d7118        lea     rsi,[r9+18h]
fffff804`5daf4bc4 eb08            jmp     storport!RaidAdapterPostScatterGatherExecute+0x22e (fffff804`5daf4bce)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x226:
fffff804`5daf4bc6 440fb6f8        movzx   r15d,al
fffff804`5daf4bca 498d7248        lea     rsi,[r10+48h]

storport!RaidAdapterPostScatterGatherExecute+0x22e:
fffff804`5daf4bce 4885f6          test    rsi,rsi
fffff804`5daf4bd1 7426            je      storport!RaidAdapterPostScatterGatherExecute+0x259 (fffff804`5daf4bf9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x233:
fffff804`5daf4bd3 4585ff          test    r15d,r15d
fffff804`5daf4bd6 7521            jne     storport!RaidAdapterPostScatterGatherExecute+0x259 (fffff804`5daf4bf9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x238:
fffff804`5daf4bd8 0fb606          movzx   eax,byte ptr [rsi]
fffff804`5daf4bdb 3c2a            cmp     al,2Ah
fffff804`5daf4bdd 7408            je      storport!RaidAdapterPostScatterGatherExecute+0x247 (fffff804`5daf4be7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x23f:
fffff804`5daf4bdf 3caa            cmp     al,0AAh
fffff804`5daf4be1 7404            je      storport!RaidAdapterPostScatterGatherExecute+0x247 (fffff804`5daf4be7)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x243:
fffff804`5daf4be3 3c8a            cmp     al,8Ah
fffff804`5daf4be5 7512            jne     storport!RaidAdapterPostScatterGatherExecute+0x259 (fffff804`5daf4bf9)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x247:
fffff804`5daf4be7 0fb64601        movzx   eax,byte ptr [rsi+1]
fffff804`5daf4beb 4c8bfd          mov     r15,rbp
fffff804`5daf4bee a808            test    al,8
fffff804`5daf4bf0 740a            je      storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff804`5daf4bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x252:
fffff804`5daf4bf2 24f7            and     al,0F7h
fffff804`5daf4bf4 884601          mov     byte ptr [rsi+1],al
fffff804`5daf4bf7 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x25c (fffff804`5daf4bfc)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x259:
fffff804`5daf4bf9 4c8bfd          mov     r15,rbp

storport!RaidAdapterPostScatterGatherExecute+0x25c:
fffff804`5daf4bfc 4038afa2110000  cmp     byte ptr [rdi+11A2h],bpl
fffff804`5daf4c03 0f84d7010000    je      storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff804`5daf4de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x269:
fffff804`5daf4c09 488b05a8c60500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff804`5db512b8)]
fffff804`5daf4c10 a801            test    al,1
fffff804`5daf4c12 0f84a7000000    je      storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff804`5daf4cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x278:
fffff804`5daf4c18 488bcb          mov     rcx,rbx
fffff804`5daf4c1b e850060000      call    storport!RaidLogGetParm4 (fffff804`5daf5270)
fffff804`5daf4c20 4c8b93a0000000  mov     r10,qword ptr [rbx+0A0h]
fffff804`5daf4c27 488bf0          mov     rsi,rax
fffff804`5daf4c2a 4c8b83a8000000  mov     r8,qword ptr [rbx+0A8h]   ;R8 = RBX+0xA8 ==> SRB
fffff804`5daf4c31 4d85d2          test    r10,r10
fffff804`5daf4c34 7516            jne     storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff804`5daf4c4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x296:
fffff804`5daf4c36 4d85c0          test    r8,r8
fffff804`5daf4c39 7411            je      storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff804`5daf4c4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x29b:
fffff804`5daf4c3b 4180780228      cmp     byte ptr [r8+2],28h
fffff804`5daf4c40 7506            jne     storport!RaidAdapterPostScatterGatherExecute+0x2a8 (fffff804`5daf4c48)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2a2:
fffff804`5daf4c42 4d8b5050        mov     r10,qword ptr [r8+50h]
fffff804`5daf4c46 eb04            jmp     storport!RaidAdapterPostScatterGatherExecute+0x2ac (fffff804`5daf4c4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2a8:
fffff804`5daf4c48 4d8b5030        mov     r10,qword ptr [r8+30h]

storport!RaidAdapterPostScatterGatherExecute+0x2ac:
fffff804`5daf4c4c 488bcb          mov     rcx,rbx
fffff804`5daf4c4f e8f4140000      call    storport!DbgGetAddressLongFromXrb (fffff804`5daf6148)
fffff804`5daf4c54 4c8b8bd8000000  mov     r9,qword ptr [rbx+0D8h]
fffff804`5daf4c5b 448bd8          mov     r11d,eax
fffff804`5daf4c5e 4d85c9          test    r9,r9
fffff804`5daf4c61 745c            je      storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff804`5daf4cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2c3:
fffff804`5daf4c63 4139a904140000  cmp     dword ptr [r9+1404h],ebp
fffff804`5daf4c6a 7653            jbe     storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff804`5daf4cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2cc:
fffff804`5daf4c6c 4939a908140000  cmp     qword ptr [r9+1408h],rbp
fffff804`5daf4c73 744a            je      storport!RaidAdapterPostScatterGatherExecute+0x31f (fffff804`5daf4cbf)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x2d5:
fffff804`5daf4c75 418bc6          mov     eax,r14d
fffff804`5daf4c78 f0410fc18100140000 lock xadd dword ptr [r9+1400h],eax
fffff804`5daf4c81 ffc0            inc     eax
fffff804`5daf4c83 33d2            xor     edx,edx
fffff804`5daf4c85 41f7b104140000  div     eax,dword ptr [r9+1404h]
fffff804`5daf4c8c 488d0c52        lea     rcx,[rdx+rdx*2]
fffff804`5daf4c90 48c1e104        shl     rcx,4
fffff804`5daf4c94 49038908140000  add     rcx,qword ptr [r9+1408h]
fffff804`5daf4c9b c70124000000    mov     dword ptr [rcx],24h
fffff804`5daf4ca1 48a11400000080f7ffff mov rax,qword ptr [FFFFF78000000014h]
fffff804`5daf4cab 48894128        mov     qword ptr [rcx+28h],rax
fffff804`5daf4caf 4c895108        mov     qword ptr [rcx+8],r10
fffff804`5daf4cb3 4c895910        mov     qword ptr [rcx+10h],r11
fffff804`5daf4cb7 4c894118        mov     qword ptr [rcx+18h],r8
fffff804`5daf4cbb 48897120        mov     qword ptr [rcx+20h],rsi

storport!RaidAdapterPostScatterGatherExecute+0x31f:
fffff804`5daf4cbf 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff804`5daf4cc6 4885c0          test    rax,rax
fffff804`5daf4cc9 7407            je      storport!RaidAdapterPostScatterGatherExecute+0x332 (fffff804`5daf4cd2)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x32b:
fffff804`5daf4ccb c6808d000000ae  mov     byte ptr [rax+8Dh],0AEh

storport!RaidAdapterPostScatterGatherExecute+0x332:
fffff804`5daf4cd2 488b8bd8000000  mov     rcx,qword ptr [rbx+0D8h]  ;RCX = XRB->Adapter
fffff804`5daf4cd9 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]  ;RDX = XRB->0xA8 ==> SRB
fffff804`5daf4ce0 488b8120020000  mov     rax,qword ptr [rcx+220h]  ;RAX = AdapterExt->Miniport->HwInitializationData 
fffff804`5daf4ce7 488b8080000000  mov     rax,qword ptr [rax+80h]   ;RAX = HwBuildIo
fffff804`5daf4cee 4885c0          test    rax,rax       ;if(NULL == HwBuildIo) goto 0x369
fffff804`5daf4cf1 7416            je      storport!RaidAdapterPostScatterGatherExecute+0x369 (fffff804`5daf4d09)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x353:
fffff804`5daf4cf3 488b8928020000  mov     rcx,qword ptr [rcx+228h]  ;RCX=AdapterExt->Miniport->PrivateDeviceExt 
fffff804`5daf4cfa 4883c110        add     rcx,10h       ;RCX= PrivateDeviceExt->HwDeviceExtension , THEN call HwBuildIo
fffff804`5daf4cfe ff15242b0600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff804`5db57828)]
fffff804`5daf4d04 0fb6f0          movzx   esi,al
fffff804`5daf4d07 eb03            jmp     storport!RaidAdapterPostScatterGatherExecute+0x36c (fffff804`5daf4d0c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x369:
fffff804`5daf4d09 40b601          mov     sil,1

storport!RaidAdapterPostScatterGatherExecute+0x36c:
fffff804`5daf4d0c 40382d7dcb0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff804`5db51890)],bpl
fffff804`5daf4d13 743e            je      storport!RaidAdapterPostScatterGatherExecute+0x3b3 (fffff804`5daf4d53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x375:
fffff804`5daf4d15 f605c5ca050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff804`5db517e1)],1
fffff804`5daf4d1c 7509            jne     storport!RaidAdapterPostScatterGatherExecute+0x387 (fffff804`5daf4d27)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x37e:
fffff804`5daf4d1e f605beca050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff804`5db517e3)],2
fffff804`5daf4d25 742c            je      storport!RaidAdapterPostScatterGatherExecute+0x3b3 (fffff804`5daf4d53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x387:
fffff804`5daf4d27 40382d42cb0500  cmp     byte ptr [storport!UseQPCTime (fffff804`5db51870)],bpl
fffff804`5daf4d2e 7410            je      storport!RaidAdapterPostScatterGatherExecute+0x3a0 (fffff804`5daf4d40)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x390:
fffff804`5daf4d30 33c9            xor     ecx,ecx
fffff804`5daf4d32 48ff15c7220600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff804`5db57000)]
fffff804`5daf4d39 0f1f440000      nop     dword ptr [rax+rax]
fffff804`5daf4d3e eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x3ac (fffff804`5daf4d4c)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3a0:
fffff804`5daf4d40 48ff1561230600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff804`5db570a8)]
fffff804`5daf4d47 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x3ac:
fffff804`5daf4d4c 488983c0020000  mov     qword ptr [rbx+2C0h],rax

storport!RaidAdapterPostScatterGatherExecute+0x3b3:
fffff804`5daf4d53 4084f6          test    sil,sil
fffff804`5daf4d56 7518            jne     storport!RaidAdapterPostScatterGatherExecute+0x3d0 (fffff804`5daf4d70)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3b8:
fffff804`5daf4d58 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff804`5daf4d5f 4c8bc3          mov     r8,rbx
fffff804`5daf4d62 33d2            xor     edx,edx
fffff804`5daf4d64 e8b3230200      call    storport!RaidUpdateZoneIoMetadata (fffff804`5db1711c)
fffff804`5daf4d69 33c0            xor     eax,eax
fffff804`5daf4d6b e971020000      jmp     storport!RaidAdapterPostScatterGatherExecute+0x641 (fffff804`5daf4fe1)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3d0:
fffff804`5daf4d70 83bfc812000001  cmp     dword ptr [rdi+12C8h],1
fffff804`5daf4d77 7e39            jle     storport!RaidAdapterPostScatterGatherExecute+0x412 (fffff804`5daf4db2)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3d9:
fffff804`5daf4d79 b9ffff0000      mov     ecx,0FFFFh
fffff804`5daf4d7e 48ff1523250600  call    qword ptr [storport!_imp_KeQueryActiveProcessorCountEx (fffff804`5db572a8)]
fffff804`5daf4d85 0f1f440000      nop     dword ptr [rax+rax]
fffff804`5daf4d8a 3987c8120000    cmp     dword ptr [rdi+12C8h],eax
fffff804`5daf4d90 7313            jae     storport!RaidAdapterPostScatterGatherExecute+0x405 (fffff804`5daf4da5)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x3f2:
fffff804`5daf4d92 488bcf          mov     rcx,rdi
fffff804`5daf4d95 e8520b0200      call    storport!RaAllocateConcurrentChannelToken (fffff804`5db158ec)
fffff804`5daf4d9a 4c8bf8          mov     r15,rax
fffff804`5daf4d9d 8b4814          mov     ecx,dword ptr [rax+14h]
fffff804`5daf4da0 894b18          mov     dword ptr [rbx+18h],ecx
fffff804`5daf4da3 eb3b            jmp     storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff804`5daf4de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x405:
fffff804`5daf4da5 658b0425a4010000 mov     eax,dword ptr gs:[1A4h]
fffff804`5daf4dad 894318          mov     dword ptr [rbx+18h],eax
fffff804`5daf4db0 eb2e            jmp     storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff804`5daf4de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x412:
fffff804`5daf4db2 39afc8020000    cmp     dword ptr [rdi+2C8h],ebp
fffff804`5daf4db8 750e            jne     storport!RaidAdapterPostScatterGatherExecute+0x428 (fffff804`5daf4dc8)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x41a:
fffff804`5daf4dba 488bcf          mov     rcx,rdi
fffff804`5daf4dbd e89e200000      call    storport!RaidAdapterAcquireInterruptLock (fffff804`5daf6e60)
fffff804`5daf4dc2 88442420        mov     byte ptr [rsp+20h],al
fffff804`5daf4dc6 eb18            jmp     storport!RaidAdapterPostScatterGatherExecute+0x440 (fffff804`5daf4de0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x428:
fffff804`5daf4dc8 488d8fc0020000  lea     rcx,[rdi+2C0h]
fffff804`5daf4dcf 488d542420      lea     rdx,[rsp+20h]
fffff804`5daf4dd4 48ff15d5240600  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff804`5db572b0)]
fffff804`5daf4ddb 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x440:
fffff804`5daf4de0 488b05d1c40500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff804`5db512b8)]
fffff804`5daf4de7 a804            test    al,4
fffff804`5daf4de9 0f8482000000    je      storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff804`5daf4e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x44f:
fffff804`5daf4def 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff804`5daf4df6 4885c0          test    rax,rax
fffff804`5daf4df9 7423            je      storport!RaidAdapterPostScatterGatherExecute+0x47e (fffff804`5daf4e1e)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x45b:
fffff804`5daf4dfb 8b4860          mov     ecx,dword ptr [rax+60h]
fffff804`5daf4dfe 8bc1            mov     eax,ecx
fffff804`5daf4e00 c1e808          shr     eax,8
fffff804`5daf4e03 440fb6e0        movzx   r12d,al
fffff804`5daf4e07 0fb6c1          movzx   eax,cl
fffff804`5daf4e0a 48c1e008        shl     rax,8
fffff804`5daf4e0e 4c0be0          or      r12,rax
fffff804`5daf4e11 c1e910          shr     ecx,10h
fffff804`5daf4e14 49c1e408        shl     r12,8
fffff804`5daf4e18 0fb6c1          movzx   eax,cl
fffff804`5daf4e1b 4c0be0          or      r12,rax

storport!RaidAdapterPostScatterGatherExecute+0x47e:
fffff804`5daf4e1e 488bcb          mov     rcx,rbx
fffff804`5daf4e21 e84a040000      call    storport!RaidLogGetParm4 (fffff804`5daf5270)
fffff804`5daf4e26 488b8ba0000000  mov     rcx,qword ptr [rbx+0A0h]  ;RCX = RBX(XRB)+A0 = OriginalIRP
fffff804`5daf4e2d 4c8baba8000000  mov     r13,qword ptr [rbx+0A8h]  ;R13 = RBX+0xA8 ==> SRB
fffff804`5daf4e34 4889842488000000 mov     qword ptr [rsp+88h],rax
fffff804`5daf4e3c 4885c9          test    rcx,rcx
fffff804`5daf4e3f 740a            je      storport!RaidAdapterPostScatterGatherExecute+0x4ab (fffff804`5daf4e4b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4a1:
fffff804`5daf4e41 48898c2480000000 mov     qword ptr [rsp+80h],rcx
fffff804`5daf4e49 eb26            jmp     storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff804`5daf4e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4ab:
fffff804`5daf4e4b 4d85ed          test    r13,r13
fffff804`5daf4e4e 7421            je      storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff804`5daf4e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4b0:
fffff804`5daf4e50 41807d0228      cmp     byte ptr [r13+2],28h
fffff804`5daf4e55 750e            jne     storport!RaidAdapterPostScatterGatherExecute+0x4c5 (fffff804`5daf4e65)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4b7:
fffff804`5daf4e57 498b7550        mov     rsi,qword ptr [r13+50h]
fffff804`5daf4e5b 4889b42480000000 mov     qword ptr [rsp+80h],rsi
fffff804`5daf4e63 eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x4d1 (fffff804`5daf4e71)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4c5:
fffff804`5daf4e65 498b4530        mov     rax,qword ptr [r13+30h]
fffff804`5daf4e69 4889842480000000 mov     qword ptr [rsp+80h],rax

storport!RaidAdapterPostScatterGatherExecute+0x4d1:
fffff804`5daf4e71 488b8be0000000  mov     rcx,qword ptr [rbx+0E0h]
fffff804`5daf4e78 4c8bc3          mov     r8,rbx
fffff804`5daf4e7b 33d2            xor     edx,edx
fffff804`5daf4e7d e89a220200      call    storport!RaidUpdateZoneIoMetadata (fffff804`5db1711c)
fffff804`5daf4e82 488b83a0000000  mov     rax,qword ptr [rbx+0A0h]
fffff804`5daf4e89 4885c0          test    rax,rax
fffff804`5daf4e8c 7407            je      storport!RaidAdapterPostScatterGatherExecute+0x4f5 (fffff804`5daf4e95)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x4ee:
fffff804`5daf4e8e c6808d000000aa  mov     byte ptr [rax+8Dh],0AAh

storport!RaidAdapterPostScatterGatherExecute+0x4f5:
fffff804`5daf4e95 0fb64310        movzx   eax,byte ptr [rbx+10h]
fffff804`5daf4e99 24ef            and     al,0EFh
fffff804`5daf4e9b 0c0c            or      al,0Ch
fffff804`5daf4e9d 884310          mov     byte ptr [rbx+10h],al
fffff804`5daf4ea0 48b81400000080f7ffff mov rax,0FFFFF78000000014h
fffff804`5daf4eaa 488b00          mov     rax,qword ptr [rax]
fffff804`5daf4ead 488b8f28020000  mov     rcx,qword ptr [rdi+228h]  ;RCX=AdapterExt->Miniport->PrivateDeviceExt 
fffff804`5daf4eb4 488b93a8000000  mov     rdx,qword ptr [rbx+0A8h]  ;RDX = RBX+0xA8 ==> SRB
fffff804`5daf4ebb 4883c110        add     rcx,10h           ;RCX= PrivateDeviceExt->HwDeviceExtension
fffff804`5daf4ebf 4889842490000000 mov     qword ptr [rsp+90h],rax
fffff804`5daf4ec7 488b8720020000  mov     rax,qword ptr [rdi+220h]  ;RAX = AdapterExt->Miniport->HwInitializationData 
fffff804`5daf4ece 488b4010        mov     rax,qword ptr [rax+10h]   ;RAX = HwStartIo
fffff804`5daf4ed2 ff1550290600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff804`5db57828)]
fffff804`5daf4ed8 40382db1c90500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff804`5db51890)],bpl
fffff804`5daf4edf 0fb6f0          movzx   esi,al
fffff804`5daf4ee2 743e            je      storport!RaidAdapterPostScatterGatherExecute+0x582 (fffff804`5daf4f22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x544:
fffff804`5daf4ee4 f605f6c8050001  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff804`5db517e1)],1
fffff804`5daf4eeb 7509            jne     storport!RaidAdapterPostScatterGatherExecute+0x556 (fffff804`5daf4ef6)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x54d:
fffff804`5daf4eed f605efc8050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff804`5db517e3)],2
fffff804`5daf4ef4 742c            je      storport!RaidAdapterPostScatterGatherExecute+0x582 (fffff804`5daf4f22)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x556:
fffff804`5daf4ef6 40382d73c90500  cmp     byte ptr [storport!UseQPCTime (fffff804`5db51870)],bpl
fffff804`5daf4efd 7410            je      storport!RaidAdapterPostScatterGatherExecute+0x56f (fffff804`5daf4f0f)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x55f:
fffff804`5daf4eff 33c9            xor     ecx,ecx
fffff804`5daf4f01 48ff15f8200600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff804`5db57000)]
fffff804`5daf4f08 0f1f440000      nop     dword ptr [rax+rax]
fffff804`5daf4f0d eb0c            jmp     storport!RaidAdapterPostScatterGatherExecute+0x57b (fffff804`5daf4f1b)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x56f:
fffff804`5daf4f0f 48ff1592210600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff804`5db570a8)]
fffff804`5daf4f16 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPostScatterGatherExecute+0x57b:
fffff804`5daf4f1b 488983c8020000  mov     qword ptr [rbx+2C8h],rax

storport!RaidAdapterPostScatterGatherExecute+0x582:
fffff804`5daf4f22 4038afa2110000  cmp     byte ptr [rdi+11A2h],bpl
fffff804`5daf4f29 7428            je      storport!RaidAdapterPostScatterGatherExecute+0x5b3 (fffff804`5daf4f53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x58b:
fffff804`5daf4f2b 83bfc812000001  cmp     dword ptr [rdi+12C8h],1   ;if(AdapterExt->ConcurrentChannels <= 1) goto 0x5a6
fffff804`5daf4f32 7e12            jle     storport!RaidAdapterPostScatterGatherExecute+0x5a6 (fffff804`5daf4f46)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x594:
fffff804`5daf4f34 4d85ff          test    r15,r15
fffff804`5daf4f37 741a            je      storport!RaidAdapterPostScatterGatherExecute+0x5b3 (fffff804`5daf4f53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x599:
fffff804`5daf4f39 498bd7          mov     rdx,r15
fffff804`5daf4f3c 488bcf          mov     rcx,rdi
fffff804`5daf4f3f e880200300      call    storport!RaFreeConcurrentChannelToken (fffff804`5db26fc4)
fffff804`5daf4f44 eb0d            jmp     storport!RaidAdapterPostScatterGatherExecute+0x5b3 (fffff804`5daf4f53)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5a6:
fffff804`5daf4f46 488d542420      lea     rdx,[rsp+20h]
fffff804`5daf4f4b 488bcf          mov     rcx,rdi
fffff804`5daf4f4e e8ad000000      call    storport!RaidAdapterReleaseStartIoLock (fffff804`5daf5000)

storport!RaidAdapterPostScatterGatherExecute+0x5b3:
fffff804`5daf4f53 488b055ec30500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff804`5db512b8)]
fffff804`5daf4f5a a804            test    al,4
fffff804`5daf4f5c 0f8472000000    je      storport!RaidAdapterPostScatterGatherExecute+0x634 (fffff804`5daf4fd4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5c2:
fffff804`5daf4f62 39af04140000    cmp     dword ptr [rdi+1404h],ebp ;check AdapterExt->RaidLogListSize
fffff804`5daf4f68 766a            jbe     storport!RaidAdapterPostScatterGatherExecute+0x634 (fffff804`5daf4fd4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5ca:
fffff804`5daf4f6a 4839af08140000  cmp     qword ptr [rdi+1408h],rbp ;check AdapterExt->RaidLogList
fffff804`5daf4f71 7461            je      storport!RaidAdapterPostScatterGatherExecute+0x634 (fffff804`5daf4fd4)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x5d3:
fffff804`5daf4f73 f0440fc1b700140000 lock xadd dword ptr [rdi+1400h],r14d
fffff804`5daf4f7c 33d2            xor     edx,edx
fffff804`5daf4f7e 418d4601        lea     eax,[r14+1]
fffff804`5daf4f82 f7b704140000    div     eax,dword ptr [rdi+1404h]
fffff804`5daf4f88 488b842490000000 mov     rax,qword ptr [rsp+90h]
fffff804`5daf4f90 488d0c52        lea     rcx,[rdx+rdx*2]
fffff804`5daf4f94 48c1e104        shl     rcx,4
fffff804`5daf4f98 48038f08140000  add     rcx,qword ptr [rdi+1408h]
fffff804`5daf4f9f 8929            mov     dword ptr [rcx],ebp
fffff804`5daf4fa1 4885c0          test    rax,rax
fffff804`5daf4fa4 750a            jne     storport!RaidAdapterPostScatterGatherExecute+0x610 (fffff804`5daf4fb0)  Branch

storport!RaidAdapterPostScatterGatherExecute+0x606:
fffff804`5daf4fa6 48a11400000080f7ffff mov rax,qword ptr [FFFFF78000000014h]

storport!RaidAdapterPostScatterGatherExecute+0x610:
fffff804`5daf4fb0 48894128        mov     qword ptr [rcx+28h],rax
fffff804`5daf4fb4 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff804`5daf4fbc 48894108        mov     qword ptr [rcx+8],rax
fffff804`5daf4fc0 488b842488000000 mov     rax,qword ptr [rsp+88h]
fffff804`5daf4fc8 48894120        mov     qword ptr [rcx+20h],rax
fffff804`5daf4fcc 4c896110        mov     qword ptr [rcx+10h],r12
fffff804`5daf4fd0 4c896918        mov     qword ptr [rcx+18h],r13

storport!RaidAdapterPostScatterGatherExecute+0x634:
fffff804`5daf4fd4 b8010000c0      mov     eax,0C0000001h
fffff804`5daf4fd9 4084f6          test    sil,sil
fffff804`5daf4fdc 0f44e8          cmove   ebp,eax
fffff804`5daf4fdf 8bc5            mov     eax,ebp

storport!RaidAdapterPostScatterGatherExecute+0x641:
fffff804`5daf4fe1 488bb42498000000 mov     rsi,qword ptr [rsp+98h]
fffff804`5daf4fe9 4883c440        add     rsp,40h
fffff804`5daf4fed 415f            pop     r15
fffff804`5daf4fef 415e            pop     r14
fffff804`5daf4ff1 415d            pop     r13
fffff804`5daf4ff3 415c            pop     r12
fffff804`5daf4ff5 5f              pop     rdi
fffff804`5daf4ff6 5d              pop     rbp
fffff804`5daf4ff7 5b              pop     rbx
fffff804`5daf4ff8 c3              ret
