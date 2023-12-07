0: kd> uf stornvme!ControllerReset
stornvme!ControllerReset:
fffff804`9240a43c 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff804`9240a441 55              push    rbp
fffff804`9240a442 56              push    rsi
fffff804`9240a443 57              push    rdi
fffff804`9240a444 4883ec20        sub     rsp,20h
fffff804`9240a448 b8cdcccccc      mov     eax,0CCCCCCCDh
fffff804`9240a44d 488bd9          mov     rbx,rcx
fffff804`9240a450 f7a1a4000000    mul     eax,dword ptr [rcx+0A4h]      ;eax*[rcx+0xa4](uSecTimeout) => EDX:EAX => 18e70 : 0000639c
fffff804`9240a456 488b8188000000  mov     rax,qword ptr [rcx+88h]		;rcx+0x88 => nvme!_NVMe_CONTROLLER_REGISTERS*
fffff804`9240a45d 8bf2            mov     esi,edx
fffff804`9240a45f c1ee03          shr     esi,3                         ;esi = edx/8 => 102000/8 (0x18e70/8)
fffff804`9240a462 8b4014          mov     eax,dword ptr [rax+14h]		;read CC to eax
fffff804`9240a465 89442448        mov     dword ptr [rsp+48h],eax
fffff804`9240a469 488b8188000000  mov     rax,qword ptr [rcx+88h]       ;load PNVMe_CONTROLLER_REGISTERS to rax
fffff804`9240a470 8b401c          mov     eax,dword ptr [rax+1Ch]		;load CSTS to eax
fffff804`9240a473 8bc8            mov     ecx,eax
fffff804`9240a475 f6c101          test    cl,1					        ;check CSTS.RDY == 1?
fffff804`9240a478 89442440        mov     dword ptr [rsp+40h],eax       ;rsp+38 == ret addr
fffff804`9240a47c 8b442448        mov     eax,dword ptr [rsp+48h]
fffff804`9240a480 410f94c0        sete    r8b                           ;if CTCS.RDY==0, r8b = 1
fffff804`9240a484 a801            test    al,1                          ;al == CC.EN
fffff804`9240a486 0f95c2          setne   dl                            ;if (CC.EN & 1) != 0, set dl=1
fffff804`9240a489 33ff            xor     edi,edi
fffff804`9240a48b 4484c2          test    dl,r8b                        ;if(CC.EN==0 && CTCS.RDY==0) goto 0xaf
fffff804`9240a48e 745b            je      stornvme!ControllerReset+0xaf (fffff804`9240a4eb)  Branch

stornvme!ControllerReset+0x54:
fffff804`9240a490 8bef            mov     ebp,edi
fffff804`9240a492 85f6            test    esi,esi
fffff804`9240a494 7455            je      stornvme!ControllerReset+0xaf (fffff804`9240a4eb)  Branch

stornvme!ControllerReset+0x5a:
fffff804`9240a496 f6c101          test    cl,1					;if((CSTS.RDY & 1) !=0 ) goto 0xab //LOOP fffff804`9240a49b ~ fffff804`9240a4e5
fffff804`9240a499 754c            jne     stornvme!ControllerReset+0xab (fffff804`9240a4e7)  Branch

stornvme!ControllerReset+0x5f:
fffff804`9240a49b 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff804`9240a4a2 8b4128          mov     eax,dword ptr [rcx+28h]   ;read ASQ low part
fffff804`9240a4a5 8b492c          mov     ecx,dword ptr [rcx+2Ch]   ;read ASQ high part
fffff804`9240a4a8 48c1e120        shl     rcx,20h
fffff804`9240a4ac 480bc8          or      rcx,rax
fffff804`9240a4af 4883f9ff        cmp     rcx,0FFFFFFFFFFFFFFFFh    ;combine ASQ AsLongLong, if it is 0 goto 0x124
fffff804`9240a4b3 0f84a7000000    je      stornvme!ControllerReset+0x124 (fffff804`9240a560)  Branch

stornvme!ControllerReset+0x7d:
fffff804`9240a4b9 41b810270000    mov     r8d,2710h		;10000 microseconds
fffff804`9240a4bf 488bd3          mov     rdx,rbx
fffff804`9240a4c2 b951000000      mov     ecx,51h			;ExtFunctionDelayExecution
fffff804`9240a4c7 48ff155a4b0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff804`9241f028)]
fffff804`9240a4ce 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240a4d3 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff804`9240a4da 8b481c          mov     ecx,dword ptr [rax+1Ch]			;read CSTS.RDY
fffff804`9240a4dd ffc5            inc     ebp
fffff804`9240a4df 894c2440        mov     dword ptr [rsp+40h],ecx
fffff804`9240a4e3 3bee            cmp     ebp,esi
fffff804`9240a4e5 72af            jb      stornvme!ControllerReset+0x5a (fffff804`9240a496)  Branch   ;wait until CSTS.RDY == 0

stornvme!ControllerReset+0xab:
fffff804`9240a4e7 8b442448        mov     eax,dword ptr [rsp+48h]   ;Load previous CC to eax

stornvme!ControllerReset+0xaf:
fffff804`9240a4eb 488b8b88000000  mov     rcx,qword ptr [rbx+88h]   ;rbx+0x88 => nvme!_NVMe_CONTROLLER_REGISTERS*
fffff804`9240a4f2 83e0fe          and     eax,0FFFFFFFEh			;modify previous CC, only set CC.EN = 0 . leave all other fields unmodified.
fffff804`9240a4f5 89442448        mov     dword ptr [rsp+48h],eax
fffff804`9240a4f9 894114          mov     dword ptr [rcx+14h],eax		;write CC
fffff804`9240a4fc f0093c24        lock or dword ptr [rsp],edi
fffff804`9240a500 488b8388000000  mov     rax,qword ptr [rbx+88h]       ;load PNVMe_CONTROLLER_REGISTERS to rax
fffff804`9240a507 8b401c          mov     eax,dword ptr [rax+1Ch]		;read CSTS.RDY
fffff804`9240a50a 89442440        mov     dword ptr [rsp+40h],eax
fffff804`9240a50e 85f6            test    esi,esi
fffff804`9240a510 7452            je      stornvme!ControllerReset+0x128 (fffff804`9240a564)  Branch

stornvme!ControllerReset+0xd6:
fffff804`9240a512 a801            test    al,1				;if (0 == CSTS.RDY) break to 0x137
fffff804`9240a514 745d            je      stornvme!ControllerReset+0x137 (fffff804`9240a573)  Branch

stornvme!ControllerReset+0xda:
fffff804`9240a516 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff804`9240a51d 8b4128          mov     eax,dword ptr [rcx+28h]
fffff804`9240a520 8b492c          mov     ecx,dword ptr [rcx+2Ch]
fffff804`9240a523 48c1e120        shl     rcx,20h
fffff804`9240a527 480bc8          or      rcx,rax                   ;Load ASQ from register to rcx
fffff804`9240a52a 4883f9ff        cmp     rcx,0FFFFFFFFFFFFFFFFh    ;if ASQ == 0 goto 0x124  ==> if ASQ is deleted, goto 0x124
fffff804`9240a52e 7430            je      stornvme!ControllerReset+0x124 (fffff804`9240a560)  Branch

stornvme!ControllerReset+0xf4:
fffff804`9240a530 41b810270000    mov     r8d,2710h			;10000 microseconds
fffff804`9240a536 488bd3          mov     rdx,rbx
fffff804`9240a539 b951000000      mov     ecx,51h				;ExtFunctionDelayExecution
fffff804`9240a53e 48ff15e34a0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff804`9241f028)]
fffff804`9240a545 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240a54a 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff804`9240a551 8b401c          mov     eax,dword ptr [rax+1Ch]				;read CSTS.RDY
fffff804`9240a554 ffc7            inc     edi                                   ;edi == loop i
fffff804`9240a556 89442440        mov     dword ptr [rsp+40h],eax
fffff804`9240a55a 3bfe            cmp     edi,esi
fffff804`9240a55c 72b4            jb      stornvme!ControllerReset+0xd6 (fffff804`9240a512)  Branch     ;loop to wait CSTS.RDY drop to 0

stornvme!ControllerReset+0x122:
fffff804`9240a55e eb04            jmp     stornvme!ControllerReset+0x128 (fffff804`9240a564)  Branch

stornvme!ControllerReset+0x124:
fffff804`9240a560 8b442440        mov     eax,dword ptr [rsp+40h]   ;load previously read CSTS (refer to fffff804`9240a4df / fffff804`9240a50a / fffff804`9240a556)

stornvme!ControllerReset+0x128:
fffff804`9240a564 a801            test    al,1
fffff804`9240a566 740b            je      stornvme!ControllerReset+0x137 (fffff804`9240a573)  Branch

stornvme!ControllerReset+0x12c:
fffff804`9240a568 c7431805000000  mov     dword ptr [rbx+18h],5
fffff804`9240a56f 32c0            xor     al,al
fffff804`9240a571 eb02            jmp     stornvme!ControllerReset+0x139 (fffff804`9240a575)  Branch

stornvme!ControllerReset+0x137:
fffff804`9240a573 b001            mov     al,1

stornvme!ControllerReset+0x139:
fffff804`9240a575 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff804`9240a57a 4883c420        add     rsp,20h
fffff804`9240a57e 5f              pop     rdi
fffff804`9240a57f 5e              pop     rsi
fffff804`9240a580 5d              pop     rbp
fffff804`9240a581 c3              ret
