0: kd> uf storport!RaUnitAsyncError
storport!RaUnitAsyncError:
fffff803`10deb420 48895c2408      mov     qword ptr [rsp+8],rbx
fffff803`10deb425 55              push    rbp
fffff803`10deb426 56              push    rsi
fffff803`10deb427 57              push    rdi
fffff803`10deb428 4154            push    r12
fffff803`10deb42a 4155            push    r13
fffff803`10deb42c 4156            push    r14
fffff803`10deb42e 4157            push    r15
fffff803`10deb430 4883ec30        sub     rsp,30h
fffff803`10deb434 488b9aa8000000  mov     rbx,qword ptr [rdx+0A8h]
fffff803`10deb43b 4533ed          xor     r13d,r13d
fffff803`10deb43e 488baaa0000000  mov     rbp,qword ptr [rdx+0A0h]
fffff803`10deb445 4c8be2          mov     r12,rdx
fffff803`10deb448 488bf1          mov     rsi,rcx
fffff803`10deb44b 458ad5          mov     r10b,r13b
fffff803`10deb44e 458af5          mov     r14b,r13b
fffff803`10deb451 418bfd          mov     edi,r13d
fffff803`10deb454 807b0228        cmp     byte ptr [rbx+2],28h
fffff803`10deb458 0f841e010000    je      storport!RaUnitAsyncError+0x15c (fffff803`10deb57c)  Branch

storport!RaUnitAsyncError+0x3e:
fffff803`10deb45e 8b430c          mov     eax,dword ptr [rbx+0Ch]
fffff803`10deb461 488d7b04        lea     rdi,[rbx+4]
fffff803`10deb465 89442478        mov     dword ptr [rsp+78h],eax
fffff803`10deb469 8b4310          mov     eax,dword ptr [rbx+10h]
fffff803`10deb46c 89842480000000  mov     dword ptr [rsp+80h],eax

storport!RaUnitAsyncError+0x53:
fffff803`10deb473 448a37          mov     r14b,byte ptr [rdi]

storport!RaUnitAsyncError+0x56:
fffff803`10deb476 488b0d835b0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb47d 488d057c5b0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb484 ba3fffffff      mov     edx,0FFFFFF3Fh
fffff803`10deb489 41b708          mov     r15b,8
fffff803`10deb48c 483bc8          cmp     rcx,rax
fffff803`10deb48f 740c            je      storport!RaUnitAsyncError+0x7d (fffff803`10deb49d)  Branch

storport!RaUnitAsyncError+0x71:
fffff803`10deb491 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff803`10deb494 4184c7          test    r15b,al
fffff803`10deb497 0f85072d0200    jne     storport!RaUnitAsyncError+0x22d84 (fffff803`10e0e1a4)  Branch

storport!RaUnitAsyncError+0x7d:
fffff803`10deb49d 0fb64b03        movzx   ecx,byte ptr [rbx+3]
fffff803`10deb4a1 23ca            and     ecx,edx
fffff803`10deb4a3 83f905          cmp     ecx,5     ;if SRB_STATUS_BUSY , goto 0x1dc
fffff803`10deb4a6 0f8450010000    je      storport!RaUnitAsyncError+0x1dc (fffff803`10deb5fc)  Branch

storport!RaUnitAsyncError+0x8c:
fffff803`10deb4ac 418ac6          mov     al,r14b
fffff803`10deb4af 412ac7          sub     al,r15b   ;SCSISTAT_CHECK_CONDITION - 0x08 ==> 0xFA
fffff803`10deb4b2 a8df            test    al,0DFh   ;** why check SCSI_STATE == e7 ?
fffff803`10deb4b4 0f8442010000    je      storport!RaUnitAsyncError+0x1dc (fffff803`10deb5fc)  Branch

storport!RaUnitAsyncError+0x9a:
fffff803`10deb4ba 83f925          cmp     ecx,25h   ;if SRB_STATUS_LINK_DOWN, goto 0x1dc => SRB_STATUS_LINK_DOWN 跟 SRB_STATUS_BUSY 等效
fffff803`10deb4bd 0f8439010000    je      storport!RaUnitAsyncError+0x1dc (fffff803`10deb5fc)  Branch

storport!RaUnitAsyncError+0xa3:
fffff803`10deb4c3 f744247800010000 test    dword ptr [rsp+78h],100h
fffff803`10deb4cb 0f84b42d0200    je      storport!RaUnitAsyncError+0x22e65 (fffff803`10e0e285)  Branch

storport!RaUnitAsyncError+0xb1:
fffff803`10deb4d1 498bd4          mov     rdx,r12
fffff803`10deb4d4 488bce          mov     rcx,rsi
fffff803`10deb4d7 e850020000      call    storport!RaidUnitHandleSpecialErrorConditions (fffff803`10deb72c)
fffff803`10deb4dc 0fb64b03        movzx   ecx,byte ptr [rbx+3]
fffff803`10deb4e0 41b83fffffff    mov     r8d,0FFFFFF3Fh
fffff803`10deb4e6 8bc1            mov     eax,ecx
fffff803`10deb4e8 4123c0          and     eax,r8d
fffff803`10deb4eb 3c05            cmp     al,5      ;if SRB_STATUS_BUSY , goto 0x275
fffff803`10deb4ed 0f84a2010000    je      storport!RaUnitAsyncError+0x275 (fffff803`10deb695)  Branch

storport!RaUnitAsyncError+0xd3:
fffff803`10deb4f3 452af7          sub     r14b,r15b
fffff803`10deb4f6 41f6c6df        test    r14b,0DFh
fffff803`10deb4fa 0f8495010000    je      storport!RaUnitAsyncError+0x275 (fffff803`10deb695)  Branch

storport!RaUnitAsyncError+0xe0:
fffff803`10deb500 e8a3010000      call    storport!RaidSrbStatusToNtStatus (fffff803`10deb6a8)
fffff803`10deb505 894530          mov     dword ptr [rbp+30h],eax

storport!RaUnitAsyncError+0xe8:
fffff803`10deb508 0fb64303        movzx   eax,byte ptr [rbx+3]
fffff803`10deb50c 8b8c2480000000  mov     ecx,dword ptr [rsp+80h]
fffff803`10deb513 4123c0          and     eax,r8d
fffff803`10deb516 3c12            cmp     al,12h
fffff803`10deb518 490f45cd        cmovne  rcx,r13
fffff803`10deb51c 48894d38        mov     qword ptr [rbp+38h],rcx
fffff803`10deb520 488bcd          mov     rcx,rbp
fffff803`10deb523 e810b5ffff      call    storport!RaidUnitReleaseIrp (fffff803`10de6a38)
fffff803`10deb528 488b0dd15a0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb52f 488d05ca5a0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb536 483bc8          cmp     rcx,rax
fffff803`10deb539 740c            je      storport!RaUnitAsyncError+0x127 (fffff803`10deb547)  Branch

storport!RaUnitAsyncError+0x11b:
fffff803`10deb53b 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff803`10deb53e 4184c7          test    r15b,al
fffff803`10deb541 0f855b2d0200    jne     storport!RaUnitAsyncError+0x22e82 (fffff803`10e0e2a2)  Branch

storport!RaUnitAsyncError+0x127:
fffff803`10deb547 488b15625d0500  mov     rdx,qword ptr [storport!g_RaidLogControl+0x8 (fffff803`10e412b0)]
fffff803`10deb54e f6c210          test    dl,10h
fffff803`10deb551 0f857f2d0200    jne     storport!RaUnitAsyncError+0x22eb6 (fffff803`10e0e2d6)  Branch

storport!RaUnitAsyncError+0x137:
fffff803`10deb557 448b4530        mov     r8d,dword ptr [rbp+30h]
fffff803`10deb55b 33d2            xor     edx,edx
fffff803`10deb55d 488bcd          mov     rcx,rbp
fffff803`10deb560 e80bf4ffff      call    storport!RaidCompleteRequestEx (fffff803`10dea970)
fffff803`10deb565 b001            mov     al,1

storport!RaUnitAsyncError+0x147:
fffff803`10deb567 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff803`10deb56c 4883c430        add     rsp,30h
fffff803`10deb570 415f            pop     r15
fffff803`10deb572 415e            pop     r14
fffff803`10deb574 415d            pop     r13
fffff803`10deb576 415c            pop     r12
fffff803`10deb578 5f              pop     rdi
fffff803`10deb579 5e              pop     rsi
fffff803`10deb57a 5d              pop     rbp
fffff803`10deb57b c3              ret

storport!RaUnitAsyncError+0x15c:
fffff803`10deb57c 8b4318          mov     eax,dword ptr [rbx+18h]
fffff803`10deb57f 89442478        mov     dword ptr [rsp+78h],eax
fffff803`10deb583 8b433c          mov     eax,dword ptr [rbx+3Ch]
fffff803`10deb586 89842480000000  mov     dword ptr [rsp+80h],eax
fffff803`10deb58d 44396b14        cmp     dword ptr [rbx+14h],r13d
fffff803`10deb591 0f85dffeffff    jne     storport!RaUnitAsyncError+0x56 (fffff803`10deb476)  Branch

storport!RaUnitAsyncError+0x177:
fffff803`10deb597 448b5b38        mov     r11d,dword ptr [rbx+38h]
fffff803`10deb59b 458bcd          mov     r9d,r13d
fffff803`10deb59e 4585db          test    r11d,r11d
fffff803`10deb5a1 0f84cffeffff    je      storport!RaUnitAsyncError+0x56 (fffff803`10deb476)  Branch

storport!RaUnitAsyncError+0x187:
fffff803`10deb5a7 418bc1          mov     eax,r9d
fffff803`10deb5aa 4c8bff          mov     r15,rdi
fffff803`10deb5ad 8b4c8378        mov     ecx,dword ptr [rbx+rax*4+78h]
fffff803`10deb5b1 81f980000000    cmp     ecx,80h
fffff803`10deb5b7 0f82d62b0200    jb      storport!RaUnitAsyncError+0x22d73 (fffff803`10e0e193)  Branch

storport!RaUnitAsyncError+0x19d:
fffff803`10deb5bd 448b4310        mov     r8d,dword ptr [rbx+10h]
fffff803`10deb5c1 413bc8          cmp     ecx,r8d
fffff803`10deb5c4 0f87c92b0200    ja      storport!RaUnitAsyncError+0x22d73 (fffff803`10e0e193)  Branch

storport!RaUnitAsyncError+0x1aa:
fffff803`10deb5ca 8bd1            mov     edx,ecx
fffff803`10deb5cc 8b0c19          mov     ecx,dword ptr [rcx+rbx]
fffff803`10deb5cf 83e940          sub     ecx,40h
fffff803`10deb5d2 0f85702b0200    jne     storport!RaUnitAsyncError+0x22d28 (fffff803`10e0e148)  Branch

storport!RaUnitAsyncError+0x1b8:
fffff803`10deb5d8 488d4a28        lea     rcx,[rdx+28h]
fffff803`10deb5dc 493bc8          cmp     rcx,r8
fffff803`10deb5df 770d            ja      storport!RaUnitAsyncError+0x1ce (fffff803`10deb5ee)  Branch

storport!RaUnitAsyncError+0x1c1:
fffff803`10deb5e1 488d7b08        lea     rdi,[rbx+8]
fffff803`10deb5e5 41b201          mov     r10b,1
fffff803`10deb5e8 4803fa          add     rdi,rdx
fffff803`10deb5eb 448a37          mov     r14b,byte ptr [rdi]   ;讀取 SRB 的 ScsiStat 欄位

storport!RaUnitAsyncError+0x1ce:
fffff803`10deb5ee 4584d2          test    r10b,r10b
fffff803`10deb5f1 0f857ffeffff    jne     storport!RaUnitAsyncError+0x56 (fffff803`10deb476)  Branch

storport!RaUnitAsyncError+0x1d7:
fffff803`10deb5f7 e9972b0200      jmp     storport!RaUnitAsyncError+0x22d73 (fffff803`10e0e193)  Branch

storport!RaUnitAsyncError+0x1dc:
fffff803`10deb5fc 4533c9          xor     r9d,r9d
fffff803`10deb5ff 4d8bc4          mov     r8,r12
fffff803`10deb602 33d2            xor     edx,edx
fffff803`10deb604 488bce          mov     rcx,rsi
fffff803`10deb607 e87cec0000      call    storport!IsZonedWriteRequest (fffff803`10dfa288)
fffff803`10deb60c 84c0            test    al,al
fffff803`10deb60e 0f85affeffff    jne     storport!RaUnitAsyncError+0xa3 (fffff803`10deb4c3)  Branch

storport!RaUnitAsyncError+0x1f4:
fffff803`10deb614 0fb64303        movzx   eax,byte ptr [rbx+3]
fffff803`10deb618 ba3fffffff      mov     edx,0FFFFFF3Fh
fffff803`10deb61d 23c2            and     eax,edx
fffff803`10deb61f 3c05            cmp     al,5
fffff803`10deb621 740a            je      storport!RaUnitAsyncError+0x20d (fffff803`10deb62d)  Branch

storport!RaUnitAsyncError+0x203:
fffff803`10deb623 418ac6          mov     al,r14b
fffff803`10deb626 412ac7          sub     al,r15b
fffff803`10deb629 a8df            test    al,0DFh
fffff803`10deb62b 7506            jne     storport!RaUnitAsyncError+0x213 (fffff803`10deb633)  Branch

storport!RaUnitAsyncError+0x20d:
fffff803`10deb62d ff8650080000    inc     dword ptr [rsi+850h]

storport!RaUnitAsyncError+0x213:
fffff803`10deb633 80be780c000000  cmp     byte ptr [rsi+0C78h],0
fffff803`10deb63a 4c8badb8000000  mov     r13,qword ptr [rbp+0B8h]
fffff803`10deb641 4d8b7d18        mov     r15,qword ptr [r13+18h]
fffff803`10deb645 0f85942b0200    jne     storport!RaUnitAsyncError+0x22dbf (fffff803`10e0e1df)  Branch

storport!RaUnitAsyncError+0x22b:
fffff803`10deb64b 8b8608070000    mov     eax,dword ptr [rsi+708h]
fffff803`10deb651 443bf8          cmp     r15d,eax
fffff803`10deb654 0f83942b0200    jae     storport!RaUnitAsyncError+0x22dce (fffff803`10e0e1ee)  Branch

storport!RaUnitAsyncError+0x23a:
fffff803`10deb65a 488b0d9f590500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb661 488d0598590500  lea     rax,[storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10deb668 483bc8          cmp     rcx,rax
fffff803`10deb66b 740b            je      storport!RaUnitAsyncError+0x258 (fffff803`10deb678)  Branch

storport!RaUnitAsyncError+0x24d:
fffff803`10deb66d 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff803`10deb670 a808            test    al,8
fffff803`10deb672 0f85e22b0200    jne     storport!RaUnitAsyncError+0x22e3a (fffff803`10e0e25a)  Branch

storport!RaUnitAsyncError+0x258:
fffff803`10deb678 498d4701        lea     rax,[r15+1]
fffff803`10deb67c 4c8bc7          mov     r8,rdi
fffff803`10deb67f 498bd4          mov     rdx,r12
fffff803`10deb682 49894518        mov     qword ptr [r13+18h],rax
fffff803`10deb686 488bce          mov     rcx,rsi
fffff803`10deb689 e836e00000      call    storport!RaidUnitProcessBusyRequest (fffff803`10df96c4)
fffff803`10deb68e 32c0            xor     al,al
fffff803`10deb690 e9d2feffff      jmp     storport!RaUnitAsyncError+0x147 (fffff803`10deb567)  Branch

storport!RaUnitAsyncError+0x275:
fffff803`10deb695 c74530a30000c0  mov     dword ptr [rbp+30h],0C00000A3h
fffff803`10deb69c e967feffff      jmp     storport!RaUnitAsyncError+0xe8 (fffff803`10deb508)  Branch

storport!RaUnitAsyncError+0x22d28:
fffff803`10e0e148 83e901          sub     ecx,1
fffff803`10e0e14b 7422            je      storport!RaUnitAsyncError+0x22d4f (fffff803`10e0e16f)  Branch

storport!RaUnitAsyncError+0x22d2d:
fffff803`10e0e14d 83f901          cmp     ecx,1
fffff803`10e0e150 0f8598d4fdff    jne     storport!RaUnitAsyncError+0x1ce (fffff803`10deb5ee)  Branch

storport!RaUnitAsyncError+0x22d36:
fffff803`10e0e156 488d4a28        lea     rcx,[rdx+28h]
fffff803`10e0e15a 493bc8          cmp     rcx,r8
fffff803`10e0e15d 0f878bd4fdff    ja      storport!RaUnitAsyncError+0x1ce (fffff803`10deb5ee)  Branch

storport!RaUnitAsyncError+0x22d43:
fffff803`10e0e163 488d7b08        lea     rdi,[rbx+8]
fffff803`10e0e167 4803fa          add     rdi,rdx
fffff803`10e0e16a e904d3fdff      jmp     storport!RaUnitAsyncError+0x53 (fffff803`10deb473)  Branch

storport!RaUnitAsyncError+0x22d4f:
fffff803`10e0e16f 488d4238        lea     rax,[rdx+38h]
fffff803`10e0e173 493bc0          cmp     rax,r8
fffff803`10e0e176 7708            ja      storport!RaUnitAsyncError+0x22d60 (fffff803`10e0e180)  Branch

storport!RaUnitAsyncError+0x22d58:
fffff803`10e0e178 448a741a08      mov     r14b,byte ptr [rdx+rbx+8]
fffff803`10e0e17d 41b201          mov     r10b,1

storport!RaUnitAsyncError+0x22d60:
fffff803`10e0e180 488d7b08        lea     rdi,[rbx+8]
fffff803`10e0e184 4803fa          add     rdi,rdx
fffff803`10e0e187 493bc0          cmp     rax,r8
fffff803`10e0e18a 490f47ff        cmova   rdi,r15
fffff803`10e0e18e e95bd4fdff      jmp     storport!RaUnitAsyncError+0x1ce (fffff803`10deb5ee)  Branch

storport!RaUnitAsyncError+0x22d73:
fffff803`10e0e193 41ffc1          inc     r9d
fffff803`10e0e196 453bcb          cmp     r9d,r11d
fffff803`10e0e199 0f8208d4fdff    jb      storport!RaUnitAsyncError+0x187 (fffff803`10deb5a7)  Branch

storport!RaUnitAsyncError+0x22d7f:
fffff803`10e0e19f e9d2d2fdff      jmp     storport!RaUnitAsyncError+0x56 (fffff803`10deb476)  Branch

storport!RaUnitAsyncError+0x22d84:
fffff803`10e0e1a4 80792902        cmp     byte ptr [rcx+29h],2
fffff803`10e0e1a8 0f82efd2fdff    jb      storport!RaUnitAsyncError+0x7d (fffff803`10deb49d)  Branch

storport!RaUnitAsyncError+0x22d8e:
fffff803`10e0e1ae 0fb64303        movzx   eax,byte ptr [rbx+3]
fffff803`10e0e1b2 4c8d05277a0200  lea     r8,[storport!WPP_d6831b3a5b933a01bb909582e3b1c70f_Traceguids (fffff803`10e35be0)]
fffff803`10e0e1b9 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`10e0e1bd 23c2            and     eax,edx
fffff803`10e0e1bf 89442428        mov     dword ptr [rsp+28h],eax
fffff803`10e0e1c3 ba3a000000      mov     edx,3Ah
fffff803`10e0e1c8 4c8bce          mov     r9,rsi
fffff803`10e0e1cb 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff803`10e0e1d0 e8a3d70000      call    storport!WPP_SF_qqD (fffff803`10e1b978)
fffff803`10e0e1d5 ba3fffffff      mov     edx,0FFFFFF3Fh
fffff803`10e0e1da e9bed2fdff      jmp     storport!RaUnitAsyncError+0x7d (fffff803`10deb49d)  Branch

storport!RaUnitAsyncError+0x22dbf:
fffff803`10e0e1df 8b05f3330300    mov     eax,dword ptr [storport!g_QosFlags (fffff803`10e415d8)]
fffff803`10e0e1e5 a801            test    al,1
fffff803`10e0e1e7 741b            je      storport!RaUnitAsyncError+0x22de4 (fffff803`10e0e204)  Branch

storport!RaUnitAsyncError+0x22dc9:
fffff803`10e0e1e9 e95dd4fdff      jmp     storport!RaUnitAsyncError+0x22b (fffff803`10deb64b)  Branch

storport!RaUnitAsyncError+0x22dce:
fffff803`10e0e1ee 85c0            test    eax,eax
fffff803`10e0e1f0 0f8464d4fdff    je      storport!RaUnitAsyncError+0x23a (fffff803`10deb65a)  Branch

storport!RaUnitAsyncError+0x22dd6:
fffff803`10e0e1f6 0fb64303        movzx   eax,byte ptr [rbx+3]
fffff803`10e0e1fa 23c2            and     eax,edx
fffff803`10e0e1fc 3c25            cmp     al,25h
fffff803`10e0e1fe 0f8456d4fdff    je      storport!RaUnitAsyncError+0x23a (fffff803`10deb65a)  Branch

storport!RaUnitAsyncError+0x22de4:
fffff803`10e0e204 488b0df52d0300  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10e0e20b 488d05ee2d0300  lea     rax,[storport!WPP_GLOBAL_Control (fffff803`10e41000)]
fffff803`10e0e212 483bc8          cmp     rcx,rax
fffff803`10e0e215 7428            je      storport!RaUnitAsyncError+0x22e1f (fffff803`10e0e23f)  Branch

storport!RaUnitAsyncError+0x22df7:
fffff803`10e0e217 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff803`10e0e21a a808            test    al,8
fffff803`10e0e21c 7421            je      storport!RaUnitAsyncError+0x22e1f (fffff803`10e0e23f)  Branch

storport!RaUnitAsyncError+0x22dfe:
fffff803`10e0e21e 80792903        cmp     byte ptr [rcx+29h],3
fffff803`10e0e222 721b            jb      storport!RaUnitAsyncError+0x22e1f (fffff803`10e0e23f)  Branch

storport!RaUnitAsyncError+0x22e04:
fffff803`10e0e224 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`10e0e228 ba3c000000      mov     edx,3Ch
fffff803`10e0e22d 48895c2428      mov     qword ptr [rsp+28h],rbx
fffff803`10e0e232 4c8bce          mov     r9,rsi
fffff803`10e0e235 44897c2420      mov     dword ptr [rsp+20h],r15d
fffff803`10e0e23a e8edd20100      call    storport!WPP_SF_qdq (fffff803`10e2b52c)

storport!RaUnitAsyncError+0x22e1f:
fffff803`10e0e23f 41b708          mov     r15b,8
fffff803`10e0e242 c6430304        mov     byte ptr [rbx+3],4
fffff803`10e0e246 4533ed          xor     r13d,r13d
fffff803`10e0e249 453af7          cmp     r14b,r15b
fffff803`10e0e24c 0f8571d2fdff    jne     storport!RaUnitAsyncError+0xa3 (fffff803`10deb4c3)  Branch

storport!RaUnitAsyncError+0x22e32:
fffff803`10e0e252 c60728          mov     byte ptr [rdi],28h
fffff803`10e0e255 e969d2fdff      jmp     storport!RaUnitAsyncError+0xa3 (fffff803`10deb4c3)  Branch

storport!RaUnitAsyncError+0x22e3a:
fffff803`10e0e25a 80792904        cmp     byte ptr [rcx+29h],4
fffff803`10e0e25e 0f8214d4fdff    jb      storport!RaUnitAsyncError+0x258 (fffff803`10deb678)  Branch

storport!RaUnitAsyncError+0x22e44:
fffff803`10e0e264 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`10e0e268 ba3b000000      mov     edx,3Bh
fffff803`10e0e26d 48895c2428      mov     qword ptr [rsp+28h],rbx
fffff803`10e0e272 4c8bce          mov     r9,rsi
fffff803`10e0e275 44897c2420      mov     dword ptr [rsp+20h],r15d
fffff803`10e0e27a e8add20100      call    storport!WPP_SF_qdq (fffff803`10e2b52c)
fffff803`10e0e27f 90              nop
fffff803`10e0e280 e9f3d3fdff      jmp     storport!RaUnitAsyncError+0x258 (fffff803`10deb678)  Branch

storport!RaUnitAsyncError+0x22e65:
fffff803`10e0e285 4438aeb4020000  cmp     byte ptr [rsi+2B4h],r13b
fffff803`10e0e28c 0f853fd2fdff    jne     storport!RaUnitAsyncError+0xb1 (fffff803`10deb4d1)  Branch

storport!RaUnitAsyncError+0x22e72:
fffff803`10e0e292 c686b402000001  mov     byte ptr [rsi+2B4h],1
fffff803`10e0e299 804b0340        or      byte ptr [rbx+3],40h
fffff803`10e0e29d e92fd2fdff      jmp     storport!RaUnitAsyncError+0xb1 (fffff803`10deb4d1)  Branch

storport!RaUnitAsyncError+0x22e82:
fffff803`10e0e2a2 80792902        cmp     byte ptr [rcx+29h],2
fffff803`10e0e2a6 0f829bd2fdff    jb      storport!RaUnitAsyncError+0x127 (fffff803`10deb547)  Branch

storport!RaUnitAsyncError+0x22e8c:
fffff803`10e0e2ac 8b4530          mov     eax,dword ptr [rbp+30h]
fffff803`10e0e2af 4c8d052a790200  lea     r8,[storport!WPP_d6831b3a5b933a01bb909582e3b1c70f_Traceguids (fffff803`10e35be0)]
fffff803`10e0e2b6 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`10e0e2ba ba3d000000      mov     edx,3Dh
fffff803`10e0e2bf 89442428        mov     dword ptr [rsp+28h],eax
fffff803`10e0e2c3 4c8bce          mov     r9,rsi
fffff803`10e0e2c6 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff803`10e0e2cb e8a8d60000      call    storport!WPP_SF_qqD (fffff803`10e1b978)
fffff803`10e0e2d0 90              nop
fffff803`10e0e2d1 e971d2fdff      jmp     storport!RaUnitAsyncError+0x127 (fffff803`10deb547)  Branch

storport!RaUnitAsyncError+0x22eb6:
fffff803`10e0e2d6 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff803`10e0e2da 4c8bc3          mov     r8,rbx
fffff803`10e0e2dd 488bd5          mov     rdx,rbp
fffff803`10e0e2e0 e84fac0100      call    storport!RaidLogRequestComplete (fffff803`10e28f34)
fffff803`10e0e2e5 90              nop
fffff803`10e0e2e6 e96cd2fdff      jmp     storport!RaUnitAsyncError+0x137 (fffff803`10deb557)  Branch
