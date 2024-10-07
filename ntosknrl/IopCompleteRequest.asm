;VOID NTAPI IopCompleteRequest	(	IN PKAPC 	Apc,
;    IN PKNORMAL_ROUTINE * 	NormalRoutine,
;    IN PVOID * 	NormalContext,
;    IN PVOID * 	SystemArgument1,
;    IN PVOID * 	SystemArgument2 )

;RCX == &Irp->Tail->Apc == _KAPC *
;All other arguments are also stored in KAPC

nt!IopCompleteRequest:
fffff803`3652fdf0 4053            push    rbx
fffff803`3652fdf2 56              push    rsi
fffff803`3652fdf3 57              push    rdi
fffff803`3652fdf4 4154            push    r12
fffff803`3652fdf6 4155            push    r13
fffff803`3652fdf8 4156            push    r14
fffff803`3652fdfa 4157            push    r15
fffff803`3652fdfc 4881ecb0000000  sub     rsp,0B0h
fffff803`3652fe03 488d5988        lea     rbx,[rcx-78h]     ;rbx == IRP
fffff803`3652fe07 48895c2448      mov     qword ptr [rsp+48h],rbx
fffff803`3652fe0c 48899c2480000000 mov     qword ptr [rsp+80h],rbx
fffff803`3652fe14 654c8b2c2588010000 mov   r13,qword ptr gs:[188h]
fffff803`3652fe1d 4c896c2440      mov     qword ptr [rsp+40h],r13
fffff803`3652fe22 498b31          mov     rsi,qword ptr [r9]        ;SystemArgument1
fffff803`3652fe25 4889742450      mov     qword ptr [rsp+50h],rsi
fffff803`3652fe2a 4c8be6          mov     r12,rsi
fffff803`3652fe2d 4d85c0          test    r8,r8         ;if(NormalContext == NULL), goto 0x4c
fffff803`3652fe30 740a            je      nt!IopCompleteRequest+0x4c (fffff803`3652fe3c)  Branch

nt!IopCompleteRequest+0x42:
fffff803`3652fe32 49833801        cmp     qword ptr [r8],1
fffff803`3652fe36 0f844c050000    je      nt!IopCompleteRequest+0x598 (fffff803`36530388)  Branch

nt!IopCompleteRequest+0x4c:
fffff803`3652fe3c c684240001000000 mov     byte ptr [rsp+100h],0

nt!IopCompleteRequest+0x54:
fffff803`3652fe44 488d7b10        lea     rdi,[rbx+10h]     ;Irp->Flags
fffff803`3652fe48 4889bc24f0000000 mov     qword ptr [rsp+0F0h],rdi
fffff803`3652fe50 8b07            mov     eax,dword ptr [rdi]
fffff803`3652fe52 84c0            test    al,al     ;?? if(Irp->Flags==IRP_CREATE_OPERATION) goto 0xa87???
fffff803`3652fe54 0f881d0a0000    js      nt!IopCompleteRequest+0xa87 (fffff803`36530877)  Branch

nt!IopCompleteRequest+0x6a:
fffff803`3652fe5a a810            test    al,10h        ;if (0 ==(irp->Flags & IRP_BUFFERED_IO)) goto 0x583
fffff803`3652fe5c 0f8411050000    je      nt!IopCompleteRequest+0x583 (fffff803`36530373)  Branch

nt!IopCompleteRequest+0x72:
fffff803`3652fe62 a840            test    al,40h        ;if (0 ==(irp->Flags & IRP_INPUT_OPERATION)) goto 0x5a5
fffff803`3652fe64 0f852b050000    jne     nt!IopCompleteRequest+0x5a5 (fffff803`36530395)  Branch

nt!IopCompleteRequest+0x7a:
fffff803`3652fe6a 4533f6          xor     r14d,r14d

nt!IopCompleteRequest+0x7d:
fffff803`3652fe6d 8b07            mov     eax,dword ptr [rdi]   ;EAX == irp->Flags
fffff803`3652fe6f a820            test    al,20h        ;if (0 ==(irp->Flags & IRP_DEALLOCATE_BUFFER)) goto 0x8e
fffff803`3652fe71 740b            je      nt!IopCompleteRequest+0x8e (fffff803`3652fe7e)  Branch

nt!IopCompleteRequest+0x83:
fffff803`3652fe73 33d2            xor     edx,edx
fffff803`3652fe75 488b4b18        mov     rcx,qword ptr [rbx+18h] ;ExFreePool(Irp->AssociatedIrp.SystemBuffer) 
fffff803`3652fe79 e8029e2c00      call    nt!ExFreePoolWithTag (fffff803`367f9c80)

nt!IopCompleteRequest+0x8e:
fffff803`3652fe7e 8327cf          and     dword ptr [rdi],0FFFFFFCFh
fffff803`3652fe81 4c8b7b08        mov     r15,qword ptr [rbx+8]
fffff803`3652fe85 4d85ff          test    r15,r15
fffff803`3652fe88 0f8561040000    jne     nt!IopCompleteRequest+0x4ff (fffff803`365302ef)  Branch

nt!IopCompleteRequest+0x9e:
fffff803`3652fe8e 4c897308        mov     qword ptr [rbx+8],r14
fffff803`3652fe92 8b4b30          mov     ecx,dword ptr [rbx+30h]
fffff803`3652fe95 8bc1            mov     eax,ecx
fffff803`3652fe97 25000000c0      and     eax,0C0000000h
fffff803`3652fe9c 3d000000c0      cmp     eax,0C0000000h
fffff803`3652fea1 0f847d080000    je      nt!IopCompleteRequest+0x934 (fffff803`36530724)  Branch

nt!IopCompleteRequest+0xb7:
fffff803`3652fea7 4c89b42490000000 mov     qword ptr [rsp+90h],r14
fffff803`3652feaf 4c89b42498000000 mov     qword ptr [rsp+98h],r14
fffff803`3652feb7 4885f6          test    rsi,rsi
fffff803`3652feba 7410            je      nt!IopCompleteRequest+0xdc (fffff803`3652fecc)  Branch

nt!IopCompleteRequest+0xcc:
fffff803`3652febc 488b86b0000000  mov     rax,qword ptr [rsi+0B0h]
fffff803`3652fec3 4885c0          test    rax,rax
fffff803`3652fec6 0f8510060000    jne     nt!IopCompleteRequest+0x6ec (fffff803`365304dc)  Branch

nt!IopCompleteRequest+0xdc:
fffff803`3652fecc 4489742470      mov     dword ptr [rsp+70h],r14d
fffff803`3652fed1 488b4b48        mov     rcx,qword ptr [rbx+48h]
fffff803`3652fed5 488b942480000000 mov     rdx,qword ptr [rsp+80h]
fffff803`3652fedd f6434710        test    byte ptr [rbx+47h],10h
fffff803`3652fee1 750a            jne     nt!IopCompleteRequest+0xfd (fffff803`3652feed)  Branch

nt!IopCompleteRequest+0xf3:
fffff803`3652fee3 488b4238        mov     rax,qword ptr [rdx+38h]
fffff803`3652fee7 48894108        mov     qword ptr [rcx+8],rax
fffff803`3652feeb eb06            jmp     nt!IopCompleteRequest+0x103 (fffff803`3652fef3)  Branch

nt!IopCompleteRequest+0xfd:
fffff803`3652feed 8b4238          mov     eax,dword ptr [rdx+38h]
fffff803`3652fef0 894104          mov     dword ptr [rcx+4],eax

nt!IopCompleteRequest+0x103:
fffff803`3652fef3 8b4330          mov     eax,dword ptr [rbx+30h]
fffff803`3652fef6 8901            mov     dword ptr [rcx],eax
fffff803`3652fef8 eb15            jmp     nt!IopCompleteRequest+0x11f (fffff803`3652ff0f)  Branch

nt!IopCompleteRequest+0x11f:
fffff803`3652ff0f 488b7b50        mov     rdi,qword ptr [rbx+50h]
fffff803`3652ff13 4885ff          test    rdi,rdi
fffff803`3652ff16 0f85da040000    jne     nt!IopCompleteRequest+0x606 (fffff803`365303f6)  Branch

nt!IopCompleteRequest+0x12c:
fffff803`3652ff1c 4885f6          test    rsi,rsi
fffff803`3652ff1f 0f84e3000000    je      nt!IopCompleteRequest+0x218 (fffff803`36530008)  Branch

nt!IopCompleteRequest+0x135:
fffff803`3652ff25 f7465000000004  test    dword ptr [rsi+50h],4000000h
fffff803`3652ff2c 0f85e7070000    jne     nt!IopCompleteRequest+0x929 (fffff803`36530719)  Branch

nt!IopCompleteRequest+0x142:
fffff803`3652ff32 f686980000007f  test    byte ptr [rsi+98h],7Fh
fffff803`3652ff39 0f85c10e0000    jne     nt!IopCompleteRequest+0x1010 (fffff803`36530e00)  Branch

nt!IopCompleteRequest+0x14f:
fffff803`3652ff3f 4183bc249c00000001 cmp   dword ptr [r12+9Ch],1
fffff803`3652ff48 0f84cb070000    je      nt!IopCompleteRequest+0x929 (fffff803`36530719)  Branch

nt!IopCompleteRequest+0x15e:
fffff803`3652ff4e b901000000      mov     ecx,1

nt!IopCompleteRequest+0x163:
fffff803`3652ff53 898c24f0000000  mov     dword ptr [rsp+0F0h],ecx
fffff803`3652ff5a 440f20c0        mov     rax,cr8
fffff803`3652ff5e 4889442450      mov     qword ptr [rsp+50h],rax
fffff803`3652ff63 41b802000000    mov     r8d,2
fffff803`3652ff69 450f22c0        mov     cr8,r8
fffff803`3652ff6d 8b0585254c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`3652ff73 85c0            test    eax,eax
fffff803`3652ff75 0f8595ee1700    jne     nt!IopCompleteRequest+0x17f020 (fffff803`366aee10)  Branch

nt!IopCompleteRequest+0x18b:
fffff803`3652ff7b 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`3652ff84 4889442448      mov     qword ptr [rsp+48h],rax
fffff803`3652ff89 4489b42488000000 mov     dword ptr [rsp+88h],r14d
fffff803`3652ff91 f00fbaae9800000007 lock bts dword ptr [rsi+98h],7
fffff803`3652ff9a 0f82200b0000    jb      nt!IopCompleteRequest+0xcd0 (fffff803`36530ac0)  Branch

nt!IopCompleteRequest+0x1b0:
fffff803`3652ffa0 418b84249c000000 mov     eax,dword ptr [r12+9Ch]
fffff803`3652ffa8 41c784249c00000001000000 mov dword ptr [r12+9Ch],1
fffff803`3652ffb4 85c0            test    eax,eax
fffff803`3652ffb6 7523            jne     nt!IopCompleteRequest+0x1eb (fffff803`3652ffdb)  Branch

nt!IopCompleteRequest+0x1c8:
fffff803`3652ffb8 498dbc24a0000000 lea     rdi,[r12+0A0h]
fffff803`3652ffc0 4c8b3f          mov     r15,qword ptr [rdi]
fffff803`3652ffc3 85c9            test    ecx,ecx
fffff803`3652ffc5 0f847bee1700    je      nt!IopCompleteRequest+0x17f056 (fffff803`366aee46)  Branch

nt!IopCompleteRequest+0x1db:
fffff803`3652ffcb 4c3bff          cmp     r15,rdi
fffff803`3652ffce 0f852c0b0000    jne     nt!IopCompleteRequest+0xd10 (fffff803`36530b00)  Branch

nt!IopCompleteRequest+0x1e4:
fffff803`3652ffd4 48897f08        mov     qword ptr [rdi+8],rdi
fffff803`3652ffd8 48893f          mov     qword ptr [rdi],rdi

nt!IopCompleteRequest+0x1eb:
fffff803`3652ffdb f081a6980000007fffffff lock and dword ptr [rsi+98h],0FFFFFF7Fh
fffff803`3652ffe6 488b442450      mov     rax,qword ptr [rsp+50h]
fffff803`3652ffeb 88442420        mov     byte ptr [rsp+20h],al
fffff803`3652ffef 4533c9          xor     r9d,r9d
fffff803`3652fff2 33d2            xor     edx,edx
fffff803`3652fff4 458d4101        lea     r8d,[r9+1]
fffff803`3652fff8 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`3652fffd e86e2d0000      call    nt!KiExitDispatcher (fffff803`36532d70)

nt!IopCompleteRequest+0x212:
fffff803`36530002 8b4330          mov     eax,dword ptr [rbx+30h]
fffff803`36530005 894638          mov     dword ptr [rsi+38h],eax

nt!IopCompleteRequest+0x218:
fffff803`36530008 41b802000000    mov     r8d,2
fffff803`3653000e 8b4310          mov     eax,dword ptr [rbx+10h]
fffff803`36530011 0fbae00d        bt      eax,0Dh
fffff803`36530015 0f823b050000    jb      nt!IopCompleteRequest+0x766 (fffff803`36530556)  Branch

nt!IopCompleteRequest+0x22b:
fffff803`3653001b 498bd6          mov     rdx,r14

nt!IopCompleteRequest+0x22e:
fffff803`3653001e 0fbae008        bt      eax,8
fffff803`36530022 0f829b060000    jb      nt!IopCompleteRequest+0x8d3 (fffff803`365306c3)  Branch

nt!IopCompleteRequest+0x238:
fffff803`36530028 0fbae009        bt      eax,9
fffff803`3653002c 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff803`36530034 0f8240070000    jb      nt!IopCompleteRequest+0x98a (fffff803`3653077a)  Branch

nt!IopCompleteRequest+0x24a:
fffff803`3653003a 488b4838        mov     rcx,qword ptr [rax+38h]
fffff803`3653003e 4885c9          test    rcx,rcx
fffff803`36530041 7824            js      nt!IopCompleteRequest+0x277 (fffff803`36530067)  Branch

nt!IopCompleteRequest+0x253:
fffff803`36530043 8bc9            mov     ecx,ecx
fffff803`36530045 4885d2          test    rdx,rdx
fffff803`36530048 0f8543060000    jne     nt!IopCompleteRequest+0x8a1 (fffff803`36530691)  Branch

nt!IopCompleteRequest+0x25e:
fffff803`3653004e 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff803`36530057 480188d0050000  add     qword ptr [rax+5D0h],rcx

nt!IopCompleteRequest+0x26e:
fffff803`3653005e 6548010c25f82e0000 add   qword ptr gs:[2EF8h],rcx

nt!IopCompleteRequest+0x277:
fffff803`36530067 f7431000200000  test    dword ptr [rbx+10h],2000h
fffff803`3653006e 0f85ef040000    jne     nt!IopCompleteRequest+0x773 (fffff803`36530563)  Branch

nt!IopCompleteRequest+0x284:
fffff803`36530074 4c89ab98000000  mov     qword ptr [rbx+98h],r13
fffff803`3653007b 4532ff          xor     r15b,r15b
fffff803`3653007e 4d85ed          test    r13,r13
fffff803`36530081 744d            je      nt!IopCompleteRequest+0x2e0 (fffff803`365300d0)  Branch

nt!IopCompleteRequest+0x293:
fffff803`36530083 450f20c7        mov     r15,cr8
fffff803`36530087 450f22c0        mov     cr8,r8
fffff803`3653008b 8b0567244c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`36530091 85c0            test    eax,eax
fffff803`36530093 0f85f7f01700    jne     nt!IopCompleteRequest+0x17f3a0 (fffff803`366af190)  Branch

nt!IopCompleteRequest+0x2a9:
fffff803`36530099 f605a6224c0021  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff803`369f2346)],21h
fffff803`365300a0 0f8518f11700    jne     nt!IopCompleteRequest+0x17f3ce (fffff803`366af1be)  Branch

nt!IopCompleteRequest+0x2b6:
fffff803`365300a6 654c8b242520000000 mov   r12,qword ptr gs:[20h]
fffff803`365300af 498b9424b8610000 mov     rdx,qword ptr [r12+61B8h]
fffff803`365300b7 4885d2          test    rdx,rdx
fffff803`365300ba 0f8510f11700    jne     nt!IopCompleteRequest+0x17f3e0 (fffff803`366af1d0)  Branch

nt!IopCompleteRequest+0x2d0:
fffff803`365300c0 f0490fbaad4007000000 lock bts qword ptr [r13+740h],0
fffff803`365300ca 0f8204080000    jb      nt!IopCompleteRequest+0xae4 (fffff803`365308d4)  Branch

nt!IopCompleteRequest+0x2e0:
fffff803`365300d0 488d4320        lea     rax,[rbx+20h]
fffff803`365300d4 488b10          mov     rdx,qword ptr [rax]
fffff803`365300d7 488b4808        mov     rcx,qword ptr [rax+8]
fffff803`365300db 48394208        cmp     qword ptr [rdx+8],rax
fffff803`365300df 0f850af21700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x2f5:
fffff803`365300e5 483901          cmp     qword ptr [rcx],rax
fffff803`365300e8 0f8501f21700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x2fe:
fffff803`365300ee 488911          mov     qword ptr [rcx],rdx
fffff803`365300f1 48894a08        mov     qword ptr [rdx+8],rcx
fffff803`365300f5 48894008        mov     qword ptr [rax+8],rax
fffff803`365300f9 488900          mov     qword ptr [rax],rax
fffff803`365300fc 4d85ed          test    r13,r13
fffff803`365300ff 7448            je      nt!IopCompleteRequest+0x359 (fffff803`36530149)  Branch

nt!IopCompleteRequest+0x311:
fffff803`36530101 498d8d40070000  lea     rcx,[r13+740h]
fffff803`36530108 f60537224c0001  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff803`369f2346)],1
fffff803`3653010f 0f85e4f01700    jne     nt!IopCompleteRequest+0x17f409 (fffff803`366af1f9)  Branch

nt!IopCompleteRequest+0x325:
fffff803`36530115 f048832100      lock and qword ptr [rcx],0

nt!IopCompleteRequest+0x32a:
fffff803`3653011a 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff803`36530123 488b91b8610000  mov     rdx,qword ptr [rcx+61B8h]
fffff803`3653012a 4885d2          test    rdx,rdx
fffff803`3653012d 0f85d9f01700    jne     nt!IopCompleteRequest+0x17f41c (fffff803`366af20c)  Branch

nt!IopCompleteRequest+0x343:
fffff803`36530133 8b05bf234c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`36530139 85c0            test    eax,eax
fffff803`3653013b 0f85eff01700    jne     nt!IopCompleteRequest+0x17f440 (fffff803`366af230)  Branch

nt!IopCompleteRequest+0x351:
fffff803`36530141 410fb6c7        movzx   eax,r15b

nt!IopCompleteRequest+0x355:
fffff803`36530145 440f22c0        mov     cr8,rax

nt!IopCompleteRequest+0x359:
fffff803`36530149 8b4b10          mov     ecx,dword ptr [rbx+10h]
fffff803`3653014c 81e100800000    and     ecx,8000h
fffff803`36530152 7505            jne     nt!IopCompleteRequest+0x369 (fffff803`36530159)  Branch

nt!IopCompleteRequest+0x364:
fffff803`36530154 48836358fe      and     qword ptr [rbx+58h],0FFFFFFFFFFFFFFFEh

nt!IopCompleteRequest+0x369:
fffff803`36530159 85c9            test    ecx,ecx
fffff803`3653015b 750d            jne     nt!IopCompleteRequest+0x37a (fffff803`3653016a)  Branch

nt!IopCompleteRequest+0x36d:
fffff803`3653015d 488b5358        mov     rdx,qword ptr [rbx+58h]
fffff803`36530161 4885d2          test    rdx,rdx
fffff803`36530164 0f859c070000    jne     nt!IopCompleteRequest+0xb16 (fffff803`36530906)  Branch

nt!IopCompleteRequest+0x37a:
fffff803`3653016a 4c8b942490000000 mov     r10,qword ptr [rsp+90h]
fffff803`36530172 4d85d2          test    r10,r10
fffff803`36530175 0f857d030000    jne     nt!IopCompleteRequest+0x708 (fffff803`365304f8)  Branch

nt!IopCompleteRequest+0x38b:
fffff803`3653017b 85c9            test    ecx,ecx
fffff803`3653017d 0f85bd040000    jne     nt!IopCompleteRequest+0x850 (fffff803`36530640)  Branch

nt!IopCompleteRequest+0x393:
fffff803`36530183 8b057b244c00    mov     eax,dword ptr [nt!IopDispatchFreeIrp (fffff803`369f2604)]
fffff803`36530189 85c0            test    eax,eax
fffff803`3653018b 0f8550f11700    jne     nt!IopCompleteRequest+0x17f4f1 (fffff803`366af2e1)  Branch

nt!IopCompleteRequest+0x3a1:
fffff803`36530191 66833b06        cmp     word ptr [rbx],6
fffff803`36530195 0f85e0f01700    jne     nt!IopCompleteRequest+0x17f48b (fffff803`366af27b)  Branch

nt!IopCompleteRequest+0x3ab:
fffff803`3653019b 66448933        mov     word ptr [rbx],r14w
fffff803`3653019f 0fb64347        movzx   eax,byte ptr [rbx+47h]
fffff803`365301a3 a840            test    al,40h
fffff803`365301a5 0f85ebf01700    jne     nt!IopCompleteRequest+0x17f4a6 (fffff803`366af296)  Branch

nt!IopCompleteRequest+0x3bb:
fffff803`365301ab 2421            and     al,21h
fffff803`365301ad 3c21            cmp     al,21h
fffff803`365301af 0f84faf01700    je      nt!IopCompleteRequest+0x17f4bf (fffff803`366af2af)  Branch

nt!IopCompleteRequest+0x3c5:
fffff803`365301b5 0fb74b04        movzx   ecx,word ptr [rbx+4]
fffff803`365301b9 8b0505214c00    mov     eax,dword ptr [nt!KeNumberProcessors (fffff803`369f22c4)]
fffff803`365301bf 3bc8            cmp     ecx,eax
fffff803`365301c1 0f83f6f01700    jae     nt!IopCompleteRequest+0x17f4cd (fffff803`366af2bd)  Branch

nt!IopCompleteRequest+0x3d7:
fffff803`365301c7 0faee8          lfence
fffff803`365301ca 8bc1            mov     eax,ecx
fffff803`365301cc 4c8d15ad3b4c00  lea     r10,[nt!KiProcessorBlock (fffff803`369f3d80)]
fffff803`365301d3 4d8b14ca        mov     r10,qword ptr [r10+rcx*8]

nt!IopCompleteRequest+0x3e7:
fffff803`365301d7 0fb64347        movzx   eax,byte ptr [rbx+47h]
fffff803`365301db a808            test    al,8
fffff803`365301dd 0f85e8f01700    jne     nt!IopCompleteRequest+0x17f4db (fffff803`366af2cb)  Branch

nt!IopCompleteRequest+0x3f3:
fffff803`365301e3 a804            test    al,4
fffff803`365301e5 0f846e060000    je      nt!IopCompleteRequest+0xa69 (fffff803`36530859)  Branch

nt!IopCompleteRequest+0x3fb:
fffff803`365301eb 440fb60d055f3b00 movzx   r9d,byte ptr [nt!IopLargeIrpStackLocations (fffff803`368e60f8)]
fffff803`365301f3 440fb61d015f3b00 movzx   r11d,byte ptr [nt!IopMediumIrpStackLocations (fffff803`368e60fc)]
fffff803`365301fb 8b0557583b00    mov     eax,dword ptr [nt!IopIrpStackProfilerFlags (fffff803`368e5a58)]
fffff803`36530201 bad0000000      mov     edx,0D0h
fffff803`36530206 a803            test    al,3
fffff803`36530208 743f            je      nt!IopCompleteRequest+0x459 (fffff803`36530249)  Branch

nt!IopCompleteRequest+0x41a:
fffff803`3653020a 440fb74302      movzx   r8d,word ptr [rbx+2]
fffff803`3653020f 410fbec9        movsx   ecx,r9b
fffff803`36530213 0fb7c1          movzx   eax,cx
fffff803`36530216 66c1e003        shl     ax,3
fffff803`3653021a 6603c8          add     cx,ax
fffff803`3653021d 66c1e103        shl     cx,3
fffff803`36530221 6603ca          add     cx,dx
fffff803`36530224 66443bc1        cmp     r8w,cx
fffff803`36530228 741f            je      nt!IopCompleteRequest+0x459 (fffff803`36530249)  Branch

nt!IopCompleteRequest+0x43a:
fffff803`3653022a 410fbecb        movsx   ecx,r11b
fffff803`3653022e 0fb7c1          movzx   eax,cx
fffff803`36530231 66c1e003        shl     ax,3
fffff803`36530235 6603c8          add     cx,ax
fffff803`36530238 66c1e103        shl     cx,3
fffff803`3653023c 6603ca          add     cx,dx
fffff803`3653023f 66443bc1        cmp     r8w,cx
fffff803`36530243 0f8559040000    jne     nt!IopCompleteRequest+0x8b2 (fffff803`365306a2)  Branch

nt!IopCompleteRequest+0x459:
fffff803`36530249 440fb74302      movzx   r8d,word ptr [rbx+2]
fffff803`3653024e 410fbec9        movsx   ecx,r9b
fffff803`36530252 0fb7c1          movzx   eax,cx
fffff803`36530255 66c1e003        shl     ax,3
fffff803`36530259 6603c8          add     cx,ax
fffff803`3653025c 66c1e103        shl     cx,3
fffff803`36530260 6603ca          add     cx,dx
fffff803`36530263 66443bc1        cmp     r8w,cx
fffff803`36530267 0f830e010000    jae     nt!IopCompleteRequest+0x58b (fffff803`3653037b)  Branch

nt!IopCompleteRequest+0x47d:
fffff803`3653026d 410fbecb        movsx   ecx,r11b
fffff803`36530271 0fb7c1          movzx   eax,cx
fffff803`36530274 66c1e003        shl     ax,3
fffff803`36530278 6603c8          add     cx,ax
fffff803`3653027b 66c1e103        shl     cx,3
fffff803`3653027f 6603ca          add     cx,dx
fffff803`36530282 66443bc1        cmp     r8w,cx
fffff803`36530286 0f822a040000    jb      nt!IopCompleteRequest+0x8c6 (fffff803`365306b6)  Branch

nt!IopCompleteRequest+0x49c:
fffff803`3653028c bf10080000      mov     edi,810h
fffff803`36530291 8d4f08          lea     ecx,[rdi+8]

nt!IopCompleteRequest+0x4a4:
fffff803`36530294 410fb7c0        movzx   eax,r8w
fffff803`36530298 488b942480000000 mov     rdx,qword ptr [rsp+80h]
fffff803`365302a0 48894238        mov     qword ptr [rdx+38h],rax
fffff803`365302a4 4a8b3c17        mov     rdi,qword ptr [rdi+r10]
fffff803`365302a8 ff471c          inc     dword ptr [rdi+1Ch]
fffff803`365302ab 0fb74710        movzx   eax,word ptr [rdi+10h]
fffff803`365302af 663907          cmp     word ptr [rdi],ax
fffff803`365302b2 0f8387050000    jae     nt!IopCompleteRequest+0xa4f (fffff803`3653083f)  Branch

nt!IopCompleteRequest+0x4c8:
fffff803`365302b8 0fb64347        movzx   eax,byte ptr [rbx+47h]
fffff803`365302bc a801            test    al,1
fffff803`365302be 0f85fe050000    jne     nt!IopCompleteRequest+0xad2 (fffff803`365308c2)  Branch

nt!IopCompleteRequest+0x4d4:
fffff803`365302c4 488bd3          mov     rdx,rbx
fffff803`365302c7 488bcf          mov     rcx,rdi
fffff803`365302ca e8b1aa1300      call    nt!ExpInterlockedPushEntrySList (fffff803`3666ad80)

nt!IopCompleteRequest+0x4df:
fffff803`365302cf 4885f6          test    rsi,rsi
fffff803`365302d2 7408            je      nt!IopCompleteRequest+0x4ec (fffff803`365302dc)  Branch

nt!IopCompleteRequest+0x4e4:
fffff803`365302d4 488bce          mov     rcx,rsi
fffff803`365302d7 e8840b0000      call    nt!ObDereferenceObjectDeferDelete (fffff803`36530e60)

nt!IopCompleteRequest+0x4ec:
fffff803`365302dc 4881c4b0000000  add     rsp,0B0h
fffff803`365302e3 415f            pop     r15
fffff803`365302e5 415e            pop     r14
fffff803`365302e7 415d            pop     r13
fffff803`365302e9 415c            pop     r12
fffff803`365302eb 5f              pop     rdi
fffff803`365302ec 5e              pop     rsi
fffff803`365302ed 5b              pop     rbx
fffff803`365302ee c3              ret

nt!IopCompleteRequest+0x4ff:
fffff803`365302ef 4c8d2d8a3a4c00  lea     r13,[nt!KiProcessorBlock (fffff803`369f3d80)]

nt!IopCompleteRequest+0x506:
fffff803`365302f6 498b07          mov     rax,qword ptr [r15]
fffff803`365302f9 48898424f0000000 mov     qword ptr [rsp+0F0h],rax
fffff803`36530301 410fb7470a      movzx   eax,word ptr [r15+0Ah]
fffff803`36530306 a820            test    al,20h
fffff803`36530308 0f8592e91700    jne     nt!IopCompleteRequest+0x17eeb0 (fffff803`366aeca0)  Branch

nt!IopCompleteRequest+0x51e:
fffff803`3653030e a808            test    al,8
fffff803`36530310 0f8452050000    je      nt!IopCompleteRequest+0xa78 (fffff803`36530868)  Branch

nt!IopCompleteRequest+0x526:
fffff803`36530316 410fb74f0c      movzx   ecx,word ptr [r15+0Ch]
fffff803`3653031b 8b05a31f4c00    mov     eax,dword ptr [nt!KeNumberProcessors (fffff803`369f22c4)]
fffff803`36530321 3bc8            cmp     ecx,eax
fffff803`36530323 0f838de91700    jae     nt!IopCompleteRequest+0x17eec6 (fffff803`366aecb6)  Branch

nt!IopCompleteRequest+0x539:
fffff803`36530329 0faee8          lfence
fffff803`3653032c 498b54cd00      mov     rdx,qword ptr [r13+rcx*8]

nt!IopCompleteRequest+0x541:
fffff803`36530331 4885d2          test    rdx,rdx
fffff803`36530334 0f8484e91700    je      nt!IopCompleteRequest+0x17eece (fffff803`366aecbe)  Branch

nt!IopCompleteRequest+0x54a:
fffff803`3653033a 488b8a30080000  mov     rcx,qword ptr [rdx+830h]
fffff803`36530341 ff411c          inc     dword ptr [rcx+1Ch]
fffff803`36530344 0fb74110        movzx   eax,word ptr [rcx+10h]
fffff803`36530348 663901          cmp     word ptr [rcx],ax
fffff803`3653034b 0f83a3040000    jae     nt!IopCompleteRequest+0xa04 (fffff803`365307f4)  Branch

nt!IopCompleteRequest+0x561:
fffff803`36530351 498bd7          mov     rdx,r15
fffff803`36530354 e827aa1300      call    nt!ExpInterlockedPushEntrySList (fffff803`3666ad80)

nt!IopCompleteRequest+0x569:
fffff803`36530359 488b8424f0000000 mov     rax,qword ptr [rsp+0F0h]
fffff803`36530361 4c8bf8          mov     r15,rax
fffff803`36530364 4885c0          test    rax,rax
fffff803`36530367 758d            jne     nt!IopCompleteRequest+0x506 (fffff803`365302f6)  Branch

nt!IopCompleteRequest+0x579:
fffff803`36530369 4c8b6c2440      mov     r13,qword ptr [rsp+40h]
fffff803`3653036e e91bfbffff      jmp     nt!IopCompleteRequest+0x9e (fffff803`3652fe8e)  Branch

nt!IopCompleteRequest+0x583:
fffff803`36530373 4533f6          xor     r14d,r14d
fffff803`36530376 e903fbffff      jmp     nt!IopCompleteRequest+0x8e (fffff803`3652fe7e)  Branch

nt!IopCompleteRequest+0x58b:
fffff803`3653037b bf20080000      mov     edi,820h
fffff803`36530380 8d4f08          lea     ecx,[rdi+8]
fffff803`36530383 e90cffffff      jmp     nt!IopCompleteRequest+0x4a4 (fffff803`36530294)  Branch

nt!IopCompleteRequest+0x598:
fffff803`36530388 c684240001000001 mov     byte ptr [rsp+100h],1
fffff803`36530390 e9affaffff      jmp     nt!IopCompleteRequest+0x54 (fffff803`3652fe44)  Branch

nt!IopCompleteRequest+0x5a5:
fffff803`36530395 8b4330          mov     eax,dword ptr [rbx+30h]
fffff803`36530398 3d16000080      cmp     eax,80000016h
fffff803`3653039d 0f84c7faffff    je      nt!IopCompleteRequest+0x7a (fffff803`3652fe6a)  Branch

nt!IopCompleteRequest+0x5b3:
fffff803`365303a3 25000000c0      and     eax,0C0000000h
fffff803`365303a8 4533f6          xor     r14d,r14d
fffff803`365303ab 3d000000c0      cmp     eax,0C0000000h
fffff803`365303b0 0f84b7faffff    je      nt!IopCompleteRequest+0x7d (fffff803`3652fe6d)  Branch

nt!IopCompleteRequest+0x5c6:
fffff803`365303b6 4489742470      mov     dword ptr [rsp+70h],r14d
fffff803`365303bb 4c8b4338        mov     r8,qword ptr [rbx+38h]
fffff803`365303bf 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff803`365303c3 488b4b70        mov     rcx,qword ptr [rbx+70h]
fffff803`365303c7 e8f4531400      call    nt!memcpy (fffff803`366757c0)
fffff803`365303cc e99cfaffff      jmp     nt!IopCompleteRequest+0x7d (fffff803`3652fe6d)  Branch

nt!IopCompleteRequest+0x606:
fffff803`365303f6 f6077f          test    byte ptr [rdi],7Fh
fffff803`365303f9 0f84f1020000    je      nt!IopCompleteRequest+0x900 (fffff803`365306f0)  Branch

nt!IopCompleteRequest+0x60f:
fffff803`365303ff 418bce          mov     ecx,r14d

nt!IopCompleteRequest+0x612:
fffff803`36530402 898c24f0000000  mov     dword ptr [rsp+0F0h],ecx
fffff803`36530409 440f20c0        mov     rax,cr8
fffff803`3653040d 4889442468      mov     qword ptr [rsp+68h],rax
fffff803`36530412 41b802000000    mov     r8d,2
fffff803`36530418 450f22c0        mov     cr8,r8
fffff803`3653041c 8b05d6204c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`36530422 85c0            test    eax,eax
fffff803`36530424 0f85a2e81700    jne     nt!IopCompleteRequest+0x17eedc (fffff803`366aeccc)  Branch

nt!IopCompleteRequest+0x63a:
fffff803`3653042a 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`36530433 4889442440      mov     qword ptr [rsp+40h],rax
fffff803`36530438 4489b42408010000 mov     dword ptr [rsp+108h],r14d
fffff803`36530440 f00fba2f07      lock bts dword ptr [rdi],7
fffff803`36530445 0f82b7e81700    jb      nt!IopCompleteRequest+0x17ef12 (fffff803`366aed02)  Branch

nt!IopCompleteRequest+0x65b:
fffff803`3653044b 8b4704          mov     eax,dword ptr [rdi+4]
fffff803`3653044e c7470401000000  mov     dword ptr [rdi+4],1
fffff803`36530455 85c0            test    eax,eax
fffff803`36530457 7518            jne     nt!IopCompleteRequest+0x681 (fffff803`36530471)  Branch

nt!IopCompleteRequest+0x669:
fffff803`36530459 4c8d7f08        lea     r15,[rdi+8]
fffff803`3653045d 4d8b27          mov     r12,qword ptr [r15]
fffff803`36530460 85c9            test    ecx,ecx
fffff803`36530462 0f859c020000    jne     nt!IopCompleteRequest+0x914 (fffff803`36530704)  Branch

nt!IopCompleteRequest+0x678:
fffff803`36530468 4d3be7          cmp     r12,r15
fffff803`3653046b 0f85df070000    jne     nt!IopCompleteRequest+0xe60 (fffff803`36530c50)  Branch

nt!IopCompleteRequest+0x681:
fffff803`36530471 f081277fffffff  lock and dword ptr [rdi],0FFFFFF7Fh
fffff803`36530478 488b442468      mov     rax,qword ptr [rsp+68h]
fffff803`3653047d 88442420        mov     byte ptr [rsp+20h],al
fffff803`36530481 4533c9          xor     r9d,r9d
fffff803`36530484 33d2            xor     edx,edx
fffff803`36530486 458d4101        lea     r8d,[r9+1]
fffff803`3653048a 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`3653048f e8dc280000      call    nt!KiExitDispatcher (fffff803`36532d70)

nt!IopCompleteRequest+0x6a4:
fffff803`36530494 4885f6          test    rsi,rsi
fffff803`36530497 0f846bfbffff    je      nt!IopCompleteRequest+0x218 (fffff803`36530008)  Branch

nt!IopCompleteRequest+0x6ad:
fffff803`3653049d 8b4310          mov     eax,dword ptr [rbx+10h]
fffff803`365304a0 a804            test    al,4
fffff803`365304a2 750c            jne     nt!IopCompleteRequest+0x6c0 (fffff803`365304b0)  Branch

nt!IopCompleteRequest+0x6b4:
fffff803`365304a4 488b4b50        mov     rcx,qword ptr [rbx+50h]
fffff803`365304a8 e8e3000500      call    nt!ObfDereferenceObject (fffff803`36580590)
fffff803`365304ad 8b4310          mov     eax,dword ptr [rbx+10h]

nt!IopCompleteRequest+0x6c0:
fffff803`365304b0 f6465002        test    byte ptr [rsi+50h],2
fffff803`365304b4 0f95c1          setne   cl
fffff803`365304b7 0fbae00c        bt      eax,0Ch
fffff803`365304bb 0f93c0          setae   al
fffff803`365304be 84c8            test    al,cl
fffff803`365304c0 0f8442fbffff    je      nt!IopCompleteRequest+0x218 (fffff803`36530008)  Branch

nt!IopCompleteRequest+0x6d6:
fffff803`365304c6 488d8e98000000  lea     rcx,[rsi+98h]
fffff803`365304cd 4533c0          xor     r8d,r8d
fffff803`365304d0 33d2            xor     edx,edx
fffff803`365304d2 e829240000      call    nt!KeSetEvent (fffff803`36532900)
fffff803`365304d7 e926fbffff      jmp     nt!IopCompleteRequest+0x212 (fffff803`36530002)  Branch

nt!IopCompleteRequest+0x6ec:
fffff803`365304dc 488b08          mov     rcx,qword ptr [rax]
fffff803`365304df 48898c2490000000 mov     qword ptr [rsp+90h],rcx
fffff803`365304e7 488b4008        mov     rax,qword ptr [rax+8]
fffff803`365304eb 4889842498000000 mov     qword ptr [rsp+98h],rax
fffff803`365304f3 e9d4f9ffff      jmp     nt!IopCompleteRequest+0xdc (fffff803`3652fecc)  Branch

nt!IopCompleteRequest+0x708:
fffff803`365304f8 48837b6000      cmp     qword ptr [rbx+60h],0
fffff803`365304fd 0f8478fcffff    je      nt!IopCompleteRequest+0x38b (fffff803`3653017b)  Branch

nt!IopCompleteRequest+0x713:
fffff803`36530503 f7465000000002  test    dword ptr [rsi+50h],2000000h
fffff803`3653050a 0f85ec060000    jne     nt!IopCompleteRequest+0xe0c (fffff803`36530bfc)  Branch

nt!IopCompleteRequest+0x720:
fffff803`36530510 458bc6          mov     r8d,r14d
fffff803`36530513 488b4608        mov     rax,qword ptr [rsi+8]
fffff803`36530517 8b5048          mov     edx,dword ptr [rax+48h]
fffff803`3653051a 83fa08          cmp     edx,8
fffff803`3653051d 0f844ded1700    je      nt!IopCompleteRequest+0x17f480 (fffff803`366af270)  Branch

nt!IopCompleteRequest+0x733:
fffff803`36530523 83fa14          cmp     edx,14h
fffff803`36530526 0f8444ed1700    je      nt!IopCompleteRequest+0x17f480 (fffff803`366af270)  Branch

nt!IopCompleteRequest+0x73c:
fffff803`3653052c 488b842498000000 mov     rax,qword ptr [rsp+98h]
fffff803`36530534 48894378        mov     qword ptr [rbx+78h],rax
fffff803`36530538 4489b3b8000000  mov     dword ptr [rbx+0B8h],r14d
fffff803`3653053f 488d93a8000000  lea     rdx,[rbx+0A8h]
fffff803`36530546 4533c9          xor     r9d,r9d
fffff803`36530549 498bca          mov     rcx,r10
fffff803`3653054c e80faffcff      call    nt!KeInsertQueueEx (fffff803`364fb460)
fffff803`36530551 e979fdffff      jmp     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0x766:
fffff803`36530556 488b5358        mov     rdx,qword ptr [rbx+58h]
fffff803`3653055a 4883e2f9        and     rdx,0FFFFFFFFFFFFFFF9h
fffff803`3653055e e9bbfaffff      jmp     nt!IopCompleteRequest+0x22e (fffff803`3653001e)  Branch

nt!IopCompleteRequest+0x773:
fffff803`36530563 488dbeb8000000  lea     rdi,[rsi+0B8h]
fffff803`3653056a 450f20c4        mov     r12,cr8
fffff803`3653056e 450f22c0        mov     cr8,r8
fffff803`36530572 8b05801f4c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`36530578 85c0            test    eax,eax
fffff803`3653057a 0f8532eb1700    jne     nt!IopCompleteRequest+0x17f2c2 (fffff803`366af0b2)  Branch

nt!IopCompleteRequest+0x790:
fffff803`36530580 f605bf1d4c0021  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff803`369f2346)],21h
fffff803`36530587 0f8553eb1700    jne     nt!IopCompleteRequest+0x17f2f0 (fffff803`366af0e0)  Branch

nt!IopCompleteRequest+0x79d:
fffff803`3653058d 654c8b3c2520000000 mov   r15,qword ptr gs:[20h]
fffff803`36530596 498b97b8610000  mov     rdx,qword ptr [r15+61B8h]
fffff803`3653059d 4885d2          test    rdx,rdx
fffff803`365305a0 0f8548eb1700    jne     nt!IopCompleteRequest+0x17f2fe (fffff803`366af0ee)  Branch

nt!IopCompleteRequest+0x7b6:
fffff803`365305a6 f0480fba2f00    lock bts qword ptr [rdi],0
fffff803`365305ac 0f823d030000    jb      nt!IopCompleteRequest+0xaff (fffff803`365308ef)  Branch

nt!IopCompleteRequest+0x7c2:
fffff803`365305b2 488d4320        lea     rax,[rbx+20h]
fffff803`365305b6 488b10          mov     rdx,qword ptr [rax]
fffff803`365305b9 488b4808        mov     rcx,qword ptr [rax+8]
fffff803`365305bd 48394208        cmp     qword ptr [rdx+8],rax
fffff803`365305c1 0f8528ed1700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x7d7:
fffff803`365305c7 483901          cmp     qword ptr [rcx],rax
fffff803`365305ca 0f851fed1700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x7e0:
fffff803`365305d0 488911          mov     qword ptr [rcx],rdx
fffff803`365305d3 48894a08        mov     qword ptr [rdx+8],rcx
fffff803`365305d7 48894008        mov     qword ptr [rax+8],rax
fffff803`365305db 488900          mov     qword ptr [rax],rax
fffff803`365305de 488b4b58        mov     rcx,qword ptr [rbx+58h]
fffff803`365305e2 4883e1f9        and     rcx,0FFFFFFFFFFFFFFF9h
fffff803`365305e6 ba496f4370      mov     edx,70436F49h
fffff803`365305eb e850390500      call    nt!ObfDereferenceObjectWithTag (fffff803`36583f40)
fffff803`365305f0 8b4310          mov     eax,dword ptr [rbx+10h]
fffff803`365305f3 0fbaf00d        btr     eax,0Dh
fffff803`365305f7 0fbae80f        bts     eax,0Fh
fffff803`365305fb 894310          mov     dword ptr [rbx+10h],eax
fffff803`365305fe f605411d4c0001  test    byte ptr [nt!PerfGlobalGroupMask+0x6 (fffff803`369f2346)],1
fffff803`36530605 0f850beb1700    jne     nt!IopCompleteRequest+0x17f326 (fffff803`366af116)  Branch

nt!IopCompleteRequest+0x81b:
fffff803`3653060b f048832700      lock and qword ptr [rdi],0

nt!IopCompleteRequest+0x820:
fffff803`36530610 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff803`36530619 488b91b8610000  mov     rdx,qword ptr [rcx+61B8h]
fffff803`36530620 4885d2          test    rdx,rdx
fffff803`36530623 0f8503eb1700    jne     nt!IopCompleteRequest+0x17f33c (fffff803`366af12c)  Branch

nt!IopCompleteRequest+0x839:
fffff803`36530629 8b05c91e4c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`3653062f 85c0            test    eax,eax
fffff803`36530631 0f8519eb1700    jne     nt!IopCompleteRequest+0x17f360 (fffff803`366af150)  Branch

nt!IopCompleteRequest+0x847:
fffff803`36530637 410fb6c4        movzx   eax,r12b
fffff803`3653063b e905fbffff      jmp     nt!IopCompleteRequest+0x355 (fffff803`36530145)  Branch

nt!IopCompleteRequest+0x850:
fffff803`36530640 488b4358        mov     rax,qword ptr [rbx+58h]

nt!IopCompleteRequest+0x854:
fffff803`36530644 4c8bc0          mov     r8,rax
fffff803`36530647 4c8bc8          mov     r9,rax
fffff803`3653064a 49d1e9          shr     r9,1
fffff803`3653064d 4183e103        and     r9d,3
fffff803`36530651 49ffc9          dec     r9
fffff803`36530654 4b8d1409        lea     rdx,[r9+r9]
fffff803`36530658 488bc8          mov     rcx,rax
fffff803`3653065b 4883e1f9        and     rcx,0FFFFFFFFFFFFFFF9h
fffff803`3653065f 480bd1          or      rdx,rcx
fffff803`36530662 f0480fb15358    lock cmpxchg qword ptr [rbx+58h],rdx
fffff803`36530668 4c3bc0          cmp     r8,rax
fffff803`3653066b 75d7            jne     nt!IopCompleteRequest+0x854 (fffff803`36530644)  Branch

nt!IopCompleteRequest+0x87d:
fffff803`3653066d 4585c9          test    r9d,r9d
fffff803`36530670 0f8559fcffff    jne     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0x886:
fffff803`36530676 8b05881f4c00    mov     eax,dword ptr [nt!IopDispatchFreeIrp (fffff803`369f2604)]
fffff803`3653067c 488bcb          mov     rcx,rbx
fffff803`3653067f 85c0            test    eax,eax
fffff803`36530681 0f855dec1700    jne     nt!IopCompleteRequest+0x17f4f4 (fffff803`366af2e4)  Branch

nt!IopCompleteRequest+0x897:
fffff803`36530687 e8c490ffff      call    nt!IopFreeIrp (fffff803`36529750)
fffff803`3653068c e93efcffff      jmp     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0x8a1:
fffff803`36530691 488bc1          mov     rax,rcx
fffff803`36530694 f0480fc182e0040000 lock xadd qword ptr [rdx+4E0h],rax
fffff803`3653069d e9bcf9ffff      jmp     nt!IopCompleteRequest+0x26e (fffff803`3653005e)  Branch

nt!IopCompleteRequest+0x8b2:
fffff803`365306a2 b818010000      mov     eax,118h
fffff803`365306a7 66443bc0        cmp     r8w,ax
fffff803`365306ab 0f8498fbffff    je      nt!IopCompleteRequest+0x459 (fffff803`36530249)  Branch

nt!IopCompleteRequest+0x8c1:
fffff803`365306b1 e9a3010000      jmp     nt!IopCompleteRequest+0xa69 (fffff803`36530859)  Branch

nt!IopCompleteRequest+0x8c6:
fffff803`365306b6 bf00080000      mov     edi,800h
fffff803`365306bb 8d4f08          lea     ecx,[rdi+8]
fffff803`365306be e9d1fbffff      jmp     nt!IopCompleteRequest+0x4a4 (fffff803`36530294)  Branch

nt!IopCompleteRequest+0x8d3:
fffff803`365306c3 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff803`365306cb 8b4838          mov     ecx,dword ptr [rax+38h]
fffff803`365306ce 4885d2          test    rdx,rdx
fffff803`365306d1 0f84b0000000    je      nt!IopCompleteRequest+0x997 (fffff803`36530787)  Branch

nt!IopCompleteRequest+0x8e7:
fffff803`365306d7 8bc1            mov     eax,ecx
fffff803`365306d9 f0480fc182d0040000 lock xadd qword ptr [rdx+4D0h],rax
fffff803`365306e2 6548010c25e82e0000 add   qword ptr gs:[2EE8h],rcx
fffff803`365306eb e977f9ffff      jmp     nt!IopCompleteRequest+0x277 (fffff803`36530067)  Branch

nt!IopCompleteRequest+0x900:
fffff803`365306f0 837f0401        cmp     dword ptr [rdi+4],1
fffff803`365306f4 0f849afdffff    je      nt!IopCompleteRequest+0x6a4 (fffff803`36530494)  Branch

nt!IopCompleteRequest+0x90a:
fffff803`365306fa b901000000      mov     ecx,1
fffff803`365306ff e9fefcffff      jmp     nt!IopCompleteRequest+0x612 (fffff803`36530402)  Branch

nt!IopCompleteRequest+0x914:
fffff803`36530704 4d3be7          cmp     r12,r15
fffff803`36530707 0f8563020000    jne     nt!IopCompleteRequest+0xb80 (fffff803`36530970)  Branch

nt!IopCompleteRequest+0x91d:
fffff803`3653070d 4d897f08        mov     qword ptr [r15+8],r15
fffff803`36530711 4d893f          mov     qword ptr [r15],r15
fffff803`36530714 e958fdffff      jmp     nt!IopCompleteRequest+0x681 (fffff803`36530471)  Branch

nt!IopCompleteRequest+0x929:
fffff803`36530719 41bf02000000    mov     r15d,2
fffff803`3653071f e9def8ffff      jmp     nt!IopCompleteRequest+0x212 (fffff803`36530002)  Branch

nt!IopCompleteRequest+0x934:
fffff803`36530724 0fb65341        movzx   edx,byte ptr [rbx+41h]
fffff803`36530728 84d2            test    dl,dl
fffff803`3653072a 7579            jne     nt!IopCompleteRequest+0x9b5 (fffff803`365307a5)  Branch

nt!IopCompleteRequest+0x93c:
fffff803`3653072c f70700200000    test    dword ptr [rdi],2000h
fffff803`36530732 0f85e6040000    jne     nt!IopCompleteRequest+0xe2e (fffff803`36530c1e)  Branch

nt!IopCompleteRequest+0x948:
fffff803`36530738 4885f6          test    rsi,rsi
fffff803`3653073b 7408            je      nt!IopCompleteRequest+0x955 (fffff803`36530745)  Branch

nt!IopCompleteRequest+0x94d:
fffff803`3653073d 488bce          mov     rcx,rsi
fffff803`36530740 e81b070000      call    nt!ObDereferenceObjectDeferDelete (fffff803`36530e60)

nt!IopCompleteRequest+0x955:
fffff803`36530745 488b4b50        mov     rcx,qword ptr [rbx+50h]
fffff803`36530749 4885c9          test    rcx,rcx
fffff803`3653074c 0f85d0000000    jne     nt!IopCompleteRequest+0xa32 (fffff803`36530822)  Branch

nt!IopCompleteRequest+0x962:
fffff803`36530752 f70700800000    test    dword ptr [rdi],8000h
fffff803`36530758 0f85d0040000    jne     nt!IopCompleteRequest+0xe3e (fffff803`36530c2e)  Branch

nt!IopCompleteRequest+0x96e:
fffff803`3653075e 4c89ab98000000  mov     qword ptr [rbx+98h],r13
fffff803`36530765 488bcb          mov     rcx,rbx
fffff803`36530768 e83388ffff      call    nt!IopDequeueIrpFromThread (fffff803`36528fa0)

nt!IopCompleteRequest+0x97d:
fffff803`3653076d 488bcb          mov     rcx,rbx
fffff803`36530770 e8ab8fffff      call    nt!IoFreeIrp (fffff803`36529720)
fffff803`36530775 e962fbffff      jmp     nt!IopCompleteRequest+0x4ec (fffff803`365302dc)  Branch

nt!IopCompleteRequest+0x98a:
fffff803`3653077a 8b4838          mov     ecx,dword ptr [rax+38h]
fffff803`3653077d e866befaff      call    nt!IopUpdateWriteTransferCount (fffff803`364dc5e8)
fffff803`36530782 e9e0f8ffff      jmp     nt!IopCompleteRequest+0x277 (fffff803`36530067)  Branch

nt!IopCompleteRequest+0x997:
fffff803`36530787 65488b042588010000 mov   rax,qword ptr gs:[188h]
fffff803`36530790 480188c0050000  add     qword ptr [rax+5C0h],rcx
fffff803`36530797 6548010c25e82e0000 add   qword ptr gs:[2EE8h],rcx
fffff803`365307a0 e9c2f8ffff      jmp     nt!IopCompleteRequest+0x277 (fffff803`36530067)  Branch

nt!IopCompleteRequest+0x9b5:
fffff803`365307a5 8b07            mov     eax,dword ptr [rdi]
fffff803`365307a7 a804            test    al,4
fffff803`365307a9 7515            jne     nt!IopCompleteRequest+0x9d0 (fffff803`365307c0)  Branch

nt!IopCompleteRequest+0x9bb:
fffff803`365307ab 4885f6          test    rsi,rsi
fffff803`365307ae 0f84f3f6ffff    je      nt!IopCompleteRequest+0xb7 (fffff803`3652fea7)  Branch

nt!IopCompleteRequest+0x9c4:
fffff803`365307b4 8b4650          mov     eax,dword ptr [rsi+50h]
fffff803`365307b7 83e002          and     eax,2
fffff803`365307ba 0f84e7f6ffff    je      nt!IopCompleteRequest+0xb7 (fffff803`3652fea7)  Branch

nt!IopCompleteRequest+0x9d0:
fffff803`365307c0 84d2            test    dl,dl
fffff803`365307c2 0f8464ffffff    je      nt!IopCompleteRequest+0x93c (fffff803`3653072c)  Branch

nt!IopCompleteRequest+0x9d8:
fffff803`365307c8 4885f6          test    rsi,rsi
fffff803`365307cb 0f845bffffff    je      nt!IopCompleteRequest+0x93c (fffff803`3653072c)  Branch

nt!IopCompleteRequest+0x9e1:
fffff803`365307d1 8b07            mov     eax,dword ptr [rdi]
fffff803`365307d3 a804            test    al,4
fffff803`365307d5 0f85ca000000    jne     nt!IopCompleteRequest+0xab5 (fffff803`365308a5)  Branch

nt!IopCompleteRequest+0x9eb:
fffff803`365307db 894e38          mov     dword ptr [rsi+38h],ecx

nt!IopCompleteRequest+0x9ee:
fffff803`365307de 488d8e98000000  lea     rcx,[rsi+98h]

nt!IopCompleteRequest+0x9f5:
fffff803`365307e5 4533c0          xor     r8d,r8d
fffff803`365307e8 33d2            xor     edx,edx
fffff803`365307ea e811210000      call    nt!KeSetEvent (fffff803`36532900)
fffff803`365307ef e938ffffff      jmp     nt!IopCompleteRequest+0x93c (fffff803`3653072c)  Branch

nt!IopCompleteRequest+0xa04:
fffff803`365307f4 ff4120          inc     dword ptr [rcx+20h]
fffff803`365307f7 488b8a38080000  mov     rcx,qword ptr [rdx+838h]
fffff803`365307fe ff411c          inc     dword ptr [rcx+1Ch]
fffff803`36530801 0fb74110        movzx   eax,word ptr [rcx+10h]
fffff803`36530805 663901          cmp     word ptr [rcx],ax
fffff803`36530808 0f8243fbffff    jb      nt!IopCompleteRequest+0x561 (fffff803`36530351)  Branch

nt!IopCompleteRequest+0xa1e:
fffff803`3653080e ff4120          inc     dword ptr [rcx+20h]
fffff803`36530811 488b4138        mov     rax,qword ptr [rcx+38h]
fffff803`36530815 498bcf          mov     rcx,r15
fffff803`36530818 e823b01300      call    nt!guard_dispatch_icall (fffff803`3666b840)
fffff803`3653081d e937fbffff      jmp     nt!IopCompleteRequest+0x569 (fffff803`36530359)  Branch

nt!IopCompleteRequest+0xa32:
fffff803`36530822 4885f6          test    rsi,rsi
fffff803`36530825 0f8427ffffff    je      nt!IopCompleteRequest+0x962 (fffff803`36530752)  Branch

nt!IopCompleteRequest+0xa3b:
fffff803`3653082b 8b07            mov     eax,dword ptr [rdi]
fffff803`3653082d a804            test    al,4
fffff803`3653082f 0f851dffffff    jne     nt!IopCompleteRequest+0x962 (fffff803`36530752)  Branch

nt!IopCompleteRequest+0xa45:
fffff803`36530835 e856fd0400      call    nt!ObfDereferenceObject (fffff803`36580590)
fffff803`3653083a e913ffffff      jmp     nt!IopCompleteRequest+0x962 (fffff803`36530752)  Branch

nt!IopCompleteRequest+0xa4f:
fffff803`3653083f ff4720          inc     dword ptr [rdi+20h]
fffff803`36530842 4a8b3c11        mov     rdi,qword ptr [rcx+r10]
fffff803`36530846 ff471c          inc     dword ptr [rdi+1Ch]
fffff803`36530849 0fb74710        movzx   eax,word ptr [rdi+10h]
fffff803`3653084d 663907          cmp     word ptr [rdi],ax
fffff803`36530850 0f8262faffff    jb      nt!IopCompleteRequest+0x4c8 (fffff803`365302b8)  Branch

nt!IopCompleteRequest+0xa66:
fffff803`36530856 ff4720          inc     dword ptr [rdi+20h]

nt!IopCompleteRequest+0xa69:
fffff803`36530859 33d2            xor     edx,edx
fffff803`3653085b 488bcb          mov     rcx,rbx
fffff803`3653085e e81d942c00      call    nt!ExFreePoolWithTag (fffff803`367f9c80)
fffff803`36530863 e967faffff      jmp     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0xa78:
fffff803`36530868 33d2            xor     edx,edx
fffff803`3653086a 498bcf          mov     rcx,r15
fffff803`3653086d e80e942c00      call    nt!ExFreePoolWithTag (fffff803`367f9c80)
fffff803`36530872 e9e2faffff      jmp     nt!IopCompleteRequest+0x569 (fffff803`36530359)  Branch

nt!IopCompleteRequest+0xa87:
fffff803`36530877 8b4330          mov     eax,dword ptr [rbx+30h]
fffff803`3653087a 894638          mov     dword ptr [rsi+38h],eax
fffff803`3653087d 488b842410010000 mov     rax,qword ptr [rsp+110h]
fffff803`36530885 488b08          mov     rcx,qword ptr [rax]
fffff803`36530888 48898ba0000000  mov     qword ptr [rbx+0A0h],rcx
fffff803`3653088f 488d8e98000000  lea     rcx,[rsi+98h]
fffff803`36530896 4533c0          xor     r8d,r8d
fffff803`36530899 33d2            xor     edx,edx
fffff803`3653089b e860200000      call    nt!KeSetEvent (fffff803`36532900)
fffff803`365308a0 e937faffff      jmp     nt!IopCompleteRequest+0x4ec (fffff803`365302dc)  Branch

nt!IopCompleteRequest+0xab5:
fffff803`365308a5 488b4348        mov     rax,qword ptr [rbx+48h]
fffff803`365308a9 0f104330        movups  xmm0,xmmword ptr [rbx+30h]
fffff803`365308ad 0f1100          movups  xmmword ptr [rax],xmm0
fffff803`365308b0 488b4b50        mov     rcx,qword ptr [rbx+50h]
fffff803`365308b4 4885c9          test    rcx,rcx
fffff803`365308b7 0f8528ffffff    jne     nt!IopCompleteRequest+0x9f5 (fffff803`365307e5)  Branch

nt!IopCompleteRequest+0xacd:
fffff803`365308bd e91cffffff      jmp     nt!IopCompleteRequest+0x9ee (fffff803`365307de)  Branch

nt!IopCompleteRequest+0xad2:
fffff803`365308c2 3401            xor     al,1
fffff803`365308c4 884347          mov     byte ptr [rbx+47h],al
fffff803`365308c7 488bcb          mov     rcx,rbx
fffff803`365308ca e84dc4faff      call    nt!ExReturnPoolQuota (fffff803`364dcd1c)
fffff803`365308cf e9f0f9ffff      jmp     nt!IopCompleteRequest+0x4d4 (fffff803`365302c4)  Branch

nt!IopCompleteRequest+0xae4:
fffff803`365308d4 33d2            xor     edx,edx
fffff803`365308d6 498bcc          mov     rcx,r12
fffff803`365308d9 e8e2bfffff      call    nt!KiSetVpThreadSpinLockCount (fffff803`3652c8c0)
fffff803`365308de 498d8d40070000  lea     rcx,[r13+740h]
fffff803`365308e5 e8e6960900      call    nt!KxWaitForSpinLockAndAcquire (fffff803`365c9fd0)
fffff803`365308ea e9e1f7ffff      jmp     nt!IopCompleteRequest+0x2e0 (fffff803`365300d0)  Branch

nt!IopCompleteRequest+0xaff:
fffff803`365308ef 33d2            xor     edx,edx
fffff803`365308f1 498bcf          mov     rcx,r15
fffff803`365308f4 e8c7bfffff      call    nt!KiSetVpThreadSpinLockCount (fffff803`3652c8c0)
fffff803`365308f9 488bcf          mov     rcx,rdi
fffff803`365308fc e8cf960900      call    nt!KxWaitForSpinLockAndAcquire (fffff803`365c9fd0)
fffff803`36530901 e9acfcffff      jmp     nt!IopCompleteRequest+0x7c2 (fffff803`365305b2)  Branch

nt!IopCompleteRequest+0xb16:
fffff803`36530906 41bf02000000    mov     r15d,2
fffff803`3653090c 80bc240001000000 cmp     byte ptr [rsp+100h],0
fffff803`36530914 0f8551040000    jne     nt!IopCompleteRequest+0xf7b (fffff803`36530d6b)  Branch

nt!IopCompleteRequest+0xb2a:
fffff803`3653091a 458bc7          mov     r8d,r15d

nt!IopCompleteRequest+0xb2d:
fffff803`3653091d 488b4360        mov     rax,qword ptr [rbx+60h]
fffff803`36530921 4889442438      mov     qword ptr [rsp+38h],rax
fffff803`36530926 0fb64340        movzx   eax,byte ptr [rbx+40h]
fffff803`3653092a 88442430        mov     byte ptr [rsp+30h],al
fffff803`3653092e 4889542428      mov     qword ptr [rsp+28h],rdx
fffff803`36530933 488d05d6e95400  lea     rax,[nt!IopUserCompletion (fffff803`36a7f310)]
fffff803`3653093a 4889442420      mov     qword ptr [rsp+20h],rax
fffff803`3653093f 4c8d0dcae95400  lea     r9,[nt!IopUserCompletion (fffff803`36a7f310)]
fffff803`36530946 498bd5          mov     rdx,r13
fffff803`36530949 488d4b78        lea     rcx,[rbx+78h]
fffff803`3653094d e81e750900      call    nt!KeInitializeApc (fffff803`365c7e70)
fffff803`36530952 458bcf          mov     r9d,r15d
fffff803`36530955 4533c0          xor     r8d,r8d
fffff803`36530958 488b5348        mov     rdx,qword ptr [rbx+48h]
fffff803`3653095c 488d4b78        lea     rcx,[rbx+78h]
fffff803`36530960 e83bce0a00      call    nt!KeInsertQueueApc (fffff803`365dd7a0)
fffff803`36530965 e965f9ffff      jmp     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0xb80:
fffff803`36530970 498bd4          mov     rdx,r12
fffff803`36530973 4889542458      mov     qword ptr [rsp+58h],rdx
fffff803`36530978 4d8b2424        mov     r12,qword ptr [r12]
fffff803`3653097c 0fb64210        movzx   eax,byte ptr [rdx+10h]
fffff803`36530980 3c01            cmp     al,1
fffff803`36530982 0f8497040000    je      nt!IopCompleteRequest+0x102f (fffff803`36530e1f)  Branch

nt!IopCompleteRequest+0xb98:
fffff803`36530988 3c02            cmp     al,2
fffff803`3653098a 0f8575e41700    jne     nt!IopCompleteRequest+0x17f015 (fffff803`366aee05)  Branch

nt!IopCompleteRequest+0xba0:
fffff803`36530990 c6421105        mov     byte ptr [rdx+11h],5
fffff803`36530994 488b4218        mov     rax,qword ptr [rdx+18h]
fffff803`36530998 4889442448      mov     qword ptr [rsp+48h],rax
fffff803`3653099d 4c8932          mov     qword ptr [rdx],r14
fffff803`365309a0 4883c008        add     rax,8
fffff803`365309a4 4889442460      mov     qword ptr [rsp+60h],rax
fffff803`365309a9 c68424f000000000 mov     byte ptr [rsp+0F0h],0
fffff803`365309b1 440f20c1        mov     rcx,cr8
fffff803`365309b5 450f22c0        mov     cr8,r8
fffff803`365309b9 8b05391b4c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`365309bf 85c0            test    eax,eax
fffff803`365309c1 0f85f7e31700    jne     nt!IopCompleteRequest+0x17efce (fffff803`366aedbe)  Branch

nt!IopCompleteRequest+0xbd7:
fffff803`365309c7 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`365309d0 4889442450      mov     qword ptr [rsp+50h],rax
fffff803`365309d5 4c8b4808        mov     r9,qword ptr [rax+8]
fffff803`365309d9 4c894c2478      mov     qword ptr [rsp+78h],r9
fffff803`365309de 8b0560194c00    mov     eax,dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff803`369f2344)]
fffff803`365309e4 0fbae018        bt      eax,18h
fffff803`365309e8 0f82fde31700    jb      nt!IopCompleteRequest+0x17effb (fffff803`366aedeb)  Branch

nt!IopCompleteRequest+0xbfe:
fffff803`365309ee 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`365309f3 e868c70600      call    nt!KiAcquireKobjectLockSafe (fffff803`3659d160)
fffff803`365309f8 4c8b542460      mov     r10,qword ptr [rsp+60h]
fffff803`365309fd 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530a02 4d3912          cmp     qword ptr [r10],r10
fffff803`36530a05 7422            je      nt!IopCompleteRequest+0xc39 (fffff803`36530a29)  Branch

nt!IopCompleteRequest+0xc17:
fffff803`36530a07 8b4128          mov     eax,dword ptr [rcx+28h]
fffff803`36530a0a 3b412c          cmp     eax,dword ptr [rcx+2Ch]
fffff803`36530a0d 731a            jae     nt!IopCompleteRequest+0xc39 (fffff803`36530a29)  Branch

nt!IopCompleteRequest+0xc1f:
fffff803`36530a0f 488b542478      mov     rdx,qword ptr [rsp+78h]
fffff803`36530a14 488b82e8000000  mov     rax,qword ptr [rdx+0E8h]
fffff803`36530a1b 483bc1          cmp     rax,rcx
fffff803`36530a1e 7513            jne     nt!IopCompleteRequest+0xc43 (fffff803`36530a33)  Branch

nt!IopCompleteRequest+0xc30:
fffff803`36530a20 80ba830200000f  cmp     byte ptr [rdx+283h],0Fh
fffff803`36530a27 750a            jne     nt!IopCompleteRequest+0xc43 (fffff803`36530a33)  Branch

nt!IopCompleteRequest+0xc39:
fffff803`36530a29 0fb68424f0000000 movzx   eax,byte ptr [rsp+0F0h]
fffff803`36530a31 eb1c            jmp     nt!IopCompleteRequest+0xc5f (fffff803`36530a4f)  Branch

nt!IopCompleteRequest+0xc43:
fffff803`36530a33 4c8b442458      mov     r8,qword ptr [rsp+58h]
fffff803`36530a38 488bd1          mov     rdx,rcx
fffff803`36530a3b 488b4c2450      mov     rcx,qword ptr [rsp+50h]
fffff803`36530a40 e81b940100      call    nt!KiWakeQueueWaiter (fffff803`36549e60)
fffff803`36530a45 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530a4a 4c8b542460      mov     r10,qword ptr [rsp+60h]

nt!IopCompleteRequest+0xc5f:
fffff803`36530a4f 84c0            test    al,al
fffff803`36530a51 741b            je      nt!IopCompleteRequest+0xc7e (fffff803`36530a6e)  Branch

nt!IopCompleteRequest+0xc63:
fffff803`36530a53 f081217fffffff  lock and dword ptr [rcx],0FFFFFF7Fh

nt!IopCompleteRequest+0xc6a:
fffff803`36530a5a 4d3be7          cmp     r12,r15
fffff803`36530a5d 41b802000000    mov     r8d,2
fffff803`36530a63 0f84a4fcffff    je      nt!IopCompleteRequest+0x91d (fffff803`3653070d)  Branch

nt!IopCompleteRequest+0xc79:
fffff803`36530a69 e902ffffff      jmp     nt!IopCompleteRequest+0xb80 (fffff803`36530970)  Branch

nt!IopCompleteRequest+0xc7e:
fffff803`36530a6e 448b4904        mov     r9d,dword ptr [rcx+4]
fffff803`36530a72 418d4101        lea     eax,[r9+1]
fffff803`36530a76 894104          mov     dword ptr [rcx+4],eax
fffff803`36530a79 488d5118        lea     rdx,[rcx+18h]
fffff803`36530a7d 4c8b4208        mov     r8,qword ptr [rdx+8]
fffff803`36530a81 493910          cmp     qword ptr [r8],rdx
fffff803`36530a84 0f8565e81700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0xc9a:
fffff803`36530a8a 488b442458      mov     rax,qword ptr [rsp+58h]
fffff803`36530a8f 488910          mov     qword ptr [rax],rdx
fffff803`36530a92 4c894008        mov     qword ptr [rax+8],r8
fffff803`36530a96 498900          mov     qword ptr [r8],rax
fffff803`36530a99 48894208        mov     qword ptr [rdx+8],rax
fffff803`36530a9d 4585c9          test    r9d,r9d
fffff803`36530aa0 75b1            jne     nt!IopCompleteRequest+0xc63 (fffff803`36530a53)  Branch

nt!IopCompleteRequest+0xcb2:
fffff803`36530aa2 4d3912          cmp     qword ptr [r10],r10
fffff803`36530aa5 74ac            je      nt!IopCompleteRequest+0xc63 (fffff803`36530a53)  Branch

nt!IopCompleteRequest+0xcb7:
fffff803`36530aa7 488bd1          mov     rdx,rcx
fffff803`36530aaa 488b4c2450      mov     rcx,qword ptr [rsp+50h]
fffff803`36530aaf e88c0affff      call    nt!KiWakeOtherQueueWaiters (fffff803`36521540)
fffff803`36530ab4 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530ab9 eb98            jmp     nt!IopCompleteRequest+0xc63 (fffff803`36530a53)  Branch

nt!IopCompleteRequest+0xcd0:
fffff803`36530ac0 488d8c2488000000 lea     rcx,[rsp+88h]
fffff803`36530ac8 e873f90200      call    nt!KeYieldProcessorEx (fffff803`36560440)
fffff803`36530acd 8b8698000000    mov     eax,dword ptr [rsi+98h]
fffff803`36530ad3 84c0            test    al,al
fffff803`36530ad5 78e9            js      nt!IopCompleteRequest+0xcd0 (fffff803`36530ac0)  Branch

nt!IopCompleteRequest+0xce7:
fffff803`36530ad7 f00fbaae9800000007 lock bts dword ptr [rsi+98h],7
fffff803`36530ae0 72de            jb      nt!IopCompleteRequest+0xcd0 (fffff803`36530ac0)  Branch

nt!IopCompleteRequest+0xcf2:
fffff803`36530ae2 8b8c24f0000000  mov     ecx,dword ptr [rsp+0F0h]
fffff803`36530ae9 41b802000000    mov     r8d,2
fffff803`36530aef e9acf4ffff      jmp     nt!IopCompleteRequest+0x1b0 (fffff803`3652ffa0)  Branch

nt!IopCompleteRequest+0xd10:
fffff803`36530b00 4d8be7          mov     r12,r15
fffff803`36530b03 4d8b3f          mov     r15,qword ptr [r15]
fffff803`36530b06 410fb6442410    movzx   eax,byte ptr [r12+10h]
fffff803`36530b0c 3c01            cmp     al,1
fffff803`36530b0e 0f841ee51700    je      nt!IopCompleteRequest+0x17f242 (fffff803`366af032)  Branch

nt!IopCompleteRequest+0xd24:
fffff803`36530b14 3c02            cmp     al,2
fffff803`36530b16 0f857ae51700    jne     nt!IopCompleteRequest+0x17f2a6 (fffff803`366af096)  Branch

nt!IopCompleteRequest+0xd2c:
fffff803`36530b1c 41c644241105    mov     byte ptr [r12+11h],5
fffff803`36530b22 498b442418      mov     rax,qword ptr [r12+18h]
fffff803`36530b27 4889442440      mov     qword ptr [rsp+40h],rax
fffff803`36530b2c 4d893424        mov     qword ptr [r12],r14
fffff803`36530b30 4883c008        add     rax,8
fffff803`36530b34 4889442468      mov     qword ptr [rsp+68h],rax
fffff803`36530b39 c68424f000000000 mov     byte ptr [rsp+0F0h],0
fffff803`36530b41 440f20c1        mov     rcx,cr8
fffff803`36530b45 450f22c0        mov     cr8,r8
fffff803`36530b49 8b05a9194c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`36530b4f 85c0            test    eax,eax
fffff803`36530b51 0f85e3e41700    jne     nt!IopCompleteRequest+0x17f24a (fffff803`366af03a)  Branch

nt!IopCompleteRequest+0xd67:
fffff803`36530b57 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`36530b60 4889442460      mov     qword ptr [rsp+60h],rax
fffff803`36530b65 4c8b4808        mov     r9,qword ptr [rax+8]
fffff803`36530b69 4c894c2478      mov     qword ptr [rsp+78h],r9
fffff803`36530b6e 8b05d0174c00    mov     eax,dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff803`369f2344)]
fffff803`36530b74 0fbae018        bt      eax,18h
fffff803`36530b78 0f82e9e41700    jb      nt!IopCompleteRequest+0x17f277 (fffff803`366af067)  Branch

nt!IopCompleteRequest+0xd8e:
fffff803`36530b7e 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`36530b83 e8d8c50600      call    nt!KiAcquireKobjectLockSafe (fffff803`3659d160)
fffff803`36530b88 4c8b4c2468      mov     r9,qword ptr [rsp+68h]
fffff803`36530b8d 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`36530b92 4d3909          cmp     qword ptr [r9],r9
fffff803`36530b95 0f85da010000    jne     nt!IopCompleteRequest+0xf85 (fffff803`36530d75)  Branch

nt!IopCompleteRequest+0xdab:
fffff803`36530b9b 0fb68424f0000000 movzx   eax,byte ptr [rsp+0F0h]

nt!IopCompleteRequest+0xdb3:
fffff803`36530ba3 84c0            test    al,al
fffff803`36530ba5 753a            jne     nt!IopCompleteRequest+0xdf1 (fffff803`36530be1)  Branch

nt!IopCompleteRequest+0xdb7:
fffff803`36530ba7 448b4104        mov     r8d,dword ptr [rcx+4]
fffff803`36530bab 418d4001        lea     eax,[r8+1]
fffff803`36530baf 894104          mov     dword ptr [rcx+4],eax
fffff803`36530bb2 488d4118        lea     rax,[rcx+18h]
fffff803`36530bb6 488b5008        mov     rdx,qword ptr [rax+8]
fffff803`36530bba 483902          cmp     qword ptr [rdx],rax
fffff803`36530bbd 0f852ce71700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0xdd3:
fffff803`36530bc3 49890424        mov     qword ptr [r12],rax
fffff803`36530bc7 4989542408      mov     qword ptr [r12+8],rdx
fffff803`36530bcc 4c8922          mov     qword ptr [rdx],r12
fffff803`36530bcf 4c896008        mov     qword ptr [rax+8],r12
fffff803`36530bd3 4585c0          test    r8d,r8d
fffff803`36530bd6 7509            jne     nt!IopCompleteRequest+0xdf1 (fffff803`36530be1)  Branch

nt!IopCompleteRequest+0xde8:
fffff803`36530bd8 4d3909          cmp     qword ptr [r9],r9
fffff803`36530bdb 0f8555020000    jne     nt!IopCompleteRequest+0x1046 (fffff803`36530e36)  Branch

nt!IopCompleteRequest+0xdf1:
fffff803`36530be1 f081217fffffff  lock and dword ptr [rcx],0FFFFFF7Fh

nt!IopCompleteRequest+0xdf8:
fffff803`36530be8 4c3bff          cmp     r15,rdi
fffff803`36530beb 41b802000000    mov     r8d,2
fffff803`36530bf1 0f84ddf3ffff    je      nt!IopCompleteRequest+0x1e4 (fffff803`3652ffd4)  Branch

nt!IopCompleteRequest+0xe07:
fffff803`36530bf7 e904ffffff      jmp     nt!IopCompleteRequest+0xd10 (fffff803`36530b00)  Branch

nt!IopCompleteRequest+0xe0c:
fffff803`36530bfc 807b4100        cmp     byte ptr [rbx+41h],0
fffff803`36530c00 0f850af9ffff    jne     nt!IopCompleteRequest+0x720 (fffff803`36530510)  Branch

nt!IopCompleteRequest+0xe16:
fffff803`36530c06 8b4330          mov     eax,dword ptr [rbx+30h]
fffff803`36530c09 25000000c0      and     eax,0C0000000h
fffff803`36530c0e 3d00000080      cmp     eax,80000000h
fffff803`36530c13 0f8562f5ffff    jne     nt!IopCompleteRequest+0x38b (fffff803`3653017b)  Branch

nt!IopCompleteRequest+0xe29:
fffff803`36530c19 e9f2f8ffff      jmp     nt!IopCompleteRequest+0x720 (fffff803`36530510)  Branch

nt!IopCompleteRequest+0xe2e:
fffff803`36530c1e 488bd6          mov     rdx,rsi
fffff803`36530c21 488bcb          mov     rcx,rbx
fffff803`36530c24 e837100800      call    nt!IopDequeueIrpFromFileObject (fffff803`365b1c60)
fffff803`36530c29 e90afbffff      jmp     nt!IopCompleteRequest+0x948 (fffff803`36530738)  Branch

nt!IopCompleteRequest+0xe3e:
fffff803`36530c2e 488d4b58        lea     rcx,[rbx+58h]
fffff803`36530c32 baffffffff      mov     edx,0FFFFFFFFh
fffff803`36530c37 e81c98fbff      call    nt!IopInterlockedAdd (fffff803`364ea458)
fffff803`36530c3c 85c0            test    eax,eax
fffff803`36530c3e 0f8429fbffff    je      nt!IopCompleteRequest+0x97d (fffff803`3653076d)  Branch

nt!IopCompleteRequest+0xe54:
fffff803`36530c44 e993f6ffff      jmp     nt!IopCompleteRequest+0x4ec (fffff803`365302dc)  Branch

nt!IopCompleteRequest+0xe60:
fffff803`36530c50 498bd4          mov     rdx,r12
fffff803`36530c53 4889542450      mov     qword ptr [rsp+50h],rdx
fffff803`36530c58 498b0424        mov     rax,qword ptr [r12]
fffff803`36530c5c 4c8be0          mov     r12,rax
fffff803`36530c5f 488b4a08        mov     rcx,qword ptr [rdx+8]
fffff803`36530c63 48395008        cmp     qword ptr [rax+8],rdx
fffff803`36530c67 0f8582e61700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0xe7d:
fffff803`36530c6d 483911          cmp     qword ptr [rcx],rdx
fffff803`36530c70 0f8579e61700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0xe86:
fffff803`36530c76 488901          mov     qword ptr [rcx],rax
fffff803`36530c79 48894808        mov     qword ptr [rax+8],rcx
fffff803`36530c7d 0fb64210        movzx   eax,byte ptr [rdx+10h]
fffff803`36530c81 3c01            cmp     al,1
fffff803`36530c83 0f84a5e01700    je      nt!IopCompleteRequest+0x17ef3e (fffff803`366aed2e)  Branch

nt!IopCompleteRequest+0xe99:
fffff803`36530c89 3c02            cmp     al,2
fffff803`36530c8b 0f8506e11700    jne     nt!IopCompleteRequest+0x17efa7 (fffff803`366aed97)  Branch

nt!IopCompleteRequest+0xea1:
fffff803`36530c91 c6421105        mov     byte ptr [rdx+11h],5
fffff803`36530c95 488b4218        mov     rax,qword ptr [rdx+18h]
fffff803`36530c99 4889442448      mov     qword ptr [rsp+48h],rax
fffff803`36530c9e 4c8932          mov     qword ptr [rdx],r14
fffff803`36530ca1 4883c008        add     rax,8
fffff803`36530ca5 4889442458      mov     qword ptr [rsp+58h],rax
fffff803`36530caa c68424f000000000 mov     byte ptr [rsp+0F0h],0
fffff803`36530cb2 440f20c1        mov     rcx,cr8
fffff803`36530cb6 450f22c0        mov     cr8,r8
fffff803`36530cba 8b0538184c00    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`36530cc0 85c0            test    eax,eax
fffff803`36530cc2 0f8588e01700    jne     nt!IopCompleteRequest+0x17ef60 (fffff803`366aed50)  Branch

nt!IopCompleteRequest+0xed8:
fffff803`36530cc8 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`36530cd1 4889442460      mov     qword ptr [rsp+60h],rax
fffff803`36530cd6 4c8b4808        mov     r9,qword ptr [rax+8]
fffff803`36530cda 4c894c2478      mov     qword ptr [rsp+78h],r9
fffff803`36530cdf 8b055f164c00    mov     eax,dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff803`369f2344)]
fffff803`36530ce5 0fbae018        bt      eax,18h
fffff803`36530ce9 0f828ee01700    jb      nt!IopCompleteRequest+0x17ef8d (fffff803`366aed7d)  Branch

nt!IopCompleteRequest+0xeff:
fffff803`36530cef 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530cf4 e867c40600      call    nt!KiAcquireKobjectLockSafe (fffff803`3659d160)
fffff803`36530cf9 4c8b542458      mov     r10,qword ptr [rsp+58h]
fffff803`36530cfe 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530d03 4d3912          cmp     qword ptr [r10],r10
fffff803`36530d06 0f85a9000000    jne     nt!IopCompleteRequest+0xfc5 (fffff803`36530db5)  Branch

nt!IopCompleteRequest+0xf1c:
fffff803`36530d0c 0fb68424f0000000 movzx   eax,byte ptr [rsp+0F0h]

nt!IopCompleteRequest+0xf24:
fffff803`36530d14 84c0            test    al,al
fffff803`36530d16 753d            jne     nt!IopCompleteRequest+0xf65 (fffff803`36530d55)  Branch

nt!IopCompleteRequest+0xf28:
fffff803`36530d18 448b4904        mov     r9d,dword ptr [rcx+4]
fffff803`36530d1c 418d4101        lea     eax,[r9+1]
fffff803`36530d20 894104          mov     dword ptr [rcx+4],eax
fffff803`36530d23 488d5118        lea     rdx,[rcx+18h]
fffff803`36530d27 4c8b4208        mov     r8,qword ptr [rdx+8]
fffff803`36530d2b 493910          cmp     qword ptr [r8],rdx
fffff803`36530d2e 0f85bbe51700    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0xf44:
fffff803`36530d34 488b442450      mov     rax,qword ptr [rsp+50h]
fffff803`36530d39 488910          mov     qword ptr [rax],rdx
fffff803`36530d3c 4c894008        mov     qword ptr [rax+8],r8
fffff803`36530d40 498900          mov     qword ptr [r8],rax
fffff803`36530d43 48894208        mov     qword ptr [rdx+8],rax
fffff803`36530d47 4585c9          test    r9d,r9d
fffff803`36530d4a 7509            jne     nt!IopCompleteRequest+0xf65 (fffff803`36530d55)  Branch

nt!IopCompleteRequest+0xf5c:
fffff803`36530d4c 4d3912          cmp     qword ptr [r10],r10
fffff803`36530d4f 0f85b3000000    jne     nt!IopCompleteRequest+0x1018 (fffff803`36530e08)  Branch

nt!IopCompleteRequest+0xf65:
fffff803`36530d55 f081217fffffff  lock and dword ptr [rcx],0FFFFFF7Fh
fffff803`36530d5c 836f0401        sub     dword ptr [rdi+4],1
fffff803`36530d60 0f840bf7ffff    je      nt!IopCompleteRequest+0x681 (fffff803`36530471)  Branch

nt!IopCompleteRequest+0xf76:
fffff803`36530d66 e93fe01700      jmp     nt!IopCompleteRequest+0x17efba (fffff803`366aedaa)  Branch

nt!IopCompleteRequest+0xf7b:
fffff803`36530d6b 440fbe4346      movsx   r8d,byte ptr [rbx+46h]
fffff803`36530d70 e9a8fbffff      jmp     nt!IopCompleteRequest+0xb2d (fffff803`3653091d)  Branch

nt!IopCompleteRequest+0xf85:
fffff803`36530d75 8b4128          mov     eax,dword ptr [rcx+28h]
fffff803`36530d78 3b412c          cmp     eax,dword ptr [rcx+2Ch]
fffff803`36530d7b 0f831afeffff    jae     nt!IopCompleteRequest+0xdab (fffff803`36530b9b)  Branch

nt!IopCompleteRequest+0xf91:
fffff803`36530d81 488b542478      mov     rdx,qword ptr [rsp+78h]
fffff803`36530d86 488b82e8000000  mov     rax,qword ptr [rdx+0E8h]
fffff803`36530d8d 483bc1          cmp     rax,rcx
fffff803`36530d90 0f84eee21700    je      nt!IopCompleteRequest+0x17f294 (fffff803`366af084)  Branch

nt!IopCompleteRequest+0xfa6:
fffff803`36530d96 4d8bc4          mov     r8,r12
fffff803`36530d99 488bd1          mov     rdx,rcx
fffff803`36530d9c 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff803`36530da1 e8ba900100      call    nt!KiWakeQueueWaiter (fffff803`36549e60)
fffff803`36530da6 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`36530dab 4c8b4c2468      mov     r9,qword ptr [rsp+68h]
fffff803`36530db0 e9eefdffff      jmp     nt!IopCompleteRequest+0xdb3 (fffff803`36530ba3)  Branch

nt!IopCompleteRequest+0xfc5:
fffff803`36530db5 8b4128          mov     eax,dword ptr [rcx+28h]
fffff803`36530db8 3b412c          cmp     eax,dword ptr [rcx+2Ch]
fffff803`36530dbb 0f834bffffff    jae     nt!IopCompleteRequest+0xf1c (fffff803`36530d0c)  Branch

nt!IopCompleteRequest+0xfd1:
fffff803`36530dc1 488b542478      mov     rdx,qword ptr [rsp+78h]
fffff803`36530dc6 488b82e8000000  mov     rax,qword ptr [rdx+0E8h]
fffff803`36530dcd 483bc1          cmp     rax,rcx
fffff803`36530dd0 750d            jne     nt!IopCompleteRequest+0xfef (fffff803`36530ddf)  Branch

nt!IopCompleteRequest+0xfe2:
fffff803`36530dd2 80ba830200000f  cmp     byte ptr [rdx+283h],0Fh
fffff803`36530dd9 0f842dffffff    je      nt!IopCompleteRequest+0xf1c (fffff803`36530d0c)  Branch

nt!IopCompleteRequest+0xfef:
fffff803`36530ddf 4c8b442450      mov     r8,qword ptr [rsp+50h]
fffff803`36530de4 488bd1          mov     rdx,rcx
fffff803`36530de7 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff803`36530dec e86f900100      call    nt!KiWakeQueueWaiter (fffff803`36549e60)
fffff803`36530df1 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530df6 4c8b542458      mov     r10,qword ptr [rsp+58h]
fffff803`36530dfb e914ffffff      jmp     nt!IopCompleteRequest+0xf24 (fffff803`36530d14)  Branch

nt!IopCompleteRequest+0x1010:
fffff803`36530e00 418bce          mov     ecx,r14d
fffff803`36530e03 e94bf1ffff      jmp     nt!IopCompleteRequest+0x163 (fffff803`3652ff53)  Branch

nt!IopCompleteRequest+0x1018:
fffff803`36530e08 488bd1          mov     rdx,rcx
fffff803`36530e0b 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff803`36530e10 e82b07ffff      call    nt!KiWakeOtherQueueWaiters (fffff803`36521540)
fffff803`36530e15 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`36530e1a e936ffffff      jmp     nt!IopCompleteRequest+0xf65 (fffff803`36530d55)  Branch

nt!IopCompleteRequest+0x102f:
fffff803`36530e1f 440fb74212      movzx   r8d,word ptr [rdx+12h]

nt!IopCompleteRequest+0x1034:
fffff803`36530e24 4533c9          xor     r9d,r9d
fffff803`36530e27 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`36530e2c e89f3d0000      call    nt!KiTryUnwaitThread (fffff803`36534bd0)
fffff803`36530e31 e924fcffff      jmp     nt!IopCompleteRequest+0xc6a (fffff803`36530a5a)  Branch

nt!IopCompleteRequest+0x1046:
fffff803`36530e36 488bd1          mov     rdx,rcx
fffff803`36530e39 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff803`36530e3e e8fd06ffff      call    nt!KiWakeOtherQueueWaiters (fffff803`36521540)
fffff803`36530e43 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`36530e48 e994fdffff      jmp     nt!IopCompleteRequest+0xdf1 (fffff803`36530be1)  Branch

nt!IopCompleteRequest+0x17eeb0:
fffff803`366aeca0 498bd7          mov     rdx,r15
fffff803`366aeca3 498b4f18        mov     rcx,qword ptr [r15+18h]
fffff803`366aeca7 e8349eebff      call    nt!MmUnmapLockedPages (fffff803`36568ae0)
fffff803`366aecac 410fb7470a      movzx   eax,word ptr [r15+0Ah]
fffff803`366aecb1 e95816e8ff      jmp     nt!IopCompleteRequest+0x51e (fffff803`3653030e)  Branch

nt!IopCompleteRequest+0x17eec6:
fffff803`366aecb6 498bd6          mov     rdx,r14
fffff803`366aecb9 e97316e8ff      jmp     nt!IopCompleteRequest+0x541 (fffff803`36530331)  Branch

nt!IopCompleteRequest+0x17eece:
fffff803`366aecbe 65488b142520000000 mov   rdx,qword ptr gs:[20h]
fffff803`366aecc7 e96e16e8ff      jmp     nt!IopCompleteRequest+0x54a (fffff803`3653033a)  Branch

nt!IopCompleteRequest+0x17eedc:
fffff803`366aeccc a801            test    al,1
fffff803`366aecce 0f845617e8ff    je      nt!IopCompleteRequest+0x63a (fffff803`3653042a)  Branch

nt!IopCompleteRequest+0x17eee4:
fffff803`366aecd4 4438442468      cmp     byte ptr [rsp+68h],r8b
fffff803`366aecd9 0f834b17e8ff    jae     nt!IopCompleteRequest+0x63a (fffff803`3653042a)  Branch

nt!IopCompleteRequest+0x17eeef:
fffff803`366aecdf 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366aece8 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366aecef f0810900000100  lock or dword ptr [rcx],10000h
fffff803`366aecf6 8b8c24f0000000  mov     ecx,dword ptr [rsp+0F0h]
fffff803`366aecfd e92817e8ff      jmp     nt!IopCompleteRequest+0x63a (fffff803`3653042a)  Branch

nt!IopCompleteRequest+0x17ef12:
fffff803`366aed02 488d8c2408010000 lea     rcx,[rsp+108h]
fffff803`366aed0a e83117ebff      call    nt!KeYieldProcessorEx (fffff803`36560440)
fffff803`366aed0f 8b07            mov     eax,dword ptr [rdi]
fffff803`366aed11 84c0            test    al,al
fffff803`366aed13 78ed            js      nt!IopCompleteRequest+0x17ef12 (fffff803`366aed02)  Branch

nt!IopCompleteRequest+0x17ef25:
fffff803`366aed15 f00fba2f07      lock bts dword ptr [rdi],7
fffff803`366aed1a 72e6            jb      nt!IopCompleteRequest+0x17ef12 (fffff803`366aed02)  Branch

nt!IopCompleteRequest+0x17ef2c:
fffff803`366aed1c 8b8c24f0000000  mov     ecx,dword ptr [rsp+0F0h]
fffff803`366aed23 41b802000000    mov     r8d,2
fffff803`366aed29 e91d17e8ff      jmp     nt!IopCompleteRequest+0x65b (fffff803`3653044b)  Branch

nt!IopCompleteRequest+0x17ef3e:
fffff803`366aed2e 440fb74212      movzx   r8d,word ptr [rdx+12h]
fffff803`366aed33 4533c9          xor     r9d,r9d
fffff803`366aed36 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`366aed3b e8905ee8ff      call    nt!KiTryUnwaitThread (fffff803`36534bd0)
fffff803`366aed40 84c0            test    al,al
fffff803`366aed42 7466            je      nt!IopCompleteRequest+0x17efba (fffff803`366aedaa)  Branch

nt!IopCompleteRequest+0x17ef54:
fffff803`366aed44 836f0401        sub     dword ptr [rdi+4],1
fffff803`366aed48 0f842317e8ff    je      nt!IopCompleteRequest+0x681 (fffff803`36530471)  Branch

nt!IopCompleteRequest+0x17ef5e:
fffff803`366aed4e eb5a            jmp     nt!IopCompleteRequest+0x17efba (fffff803`366aedaa)  Branch

nt!IopCompleteRequest+0x17ef60:
fffff803`366aed50 a801            test    al,1
fffff803`366aed52 0f84701fe8ff    je      nt!IopCompleteRequest+0xed8 (fffff803`36530cc8)  Branch

nt!IopCompleteRequest+0x17ef68:
fffff803`366aed58 80f902          cmp     cl,2
fffff803`366aed5b 0f83671fe8ff    jae     nt!IopCompleteRequest+0xed8 (fffff803`36530cc8)  Branch

nt!IopCompleteRequest+0x17ef71:
fffff803`366aed61 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366aed6a 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366aed71 f0810900000100  lock or dword ptr [rcx],10000h
fffff803`366aed78 e94b1fe8ff      jmp     nt!IopCompleteRequest+0xed8 (fffff803`36530cc8)  Branch

nt!IopCompleteRequest+0x17ef8d:
fffff803`366aed7d 498bc9          mov     rcx,r9
fffff803`366aed80 e823cd0800      call    nt!KeIsThreadRunning (fffff803`3673baa8)
fffff803`366aed85 440fb6c0        movzx   r8d,al
fffff803`366aed89 498bc9          mov     rcx,r9
fffff803`366aed8c e80beb1000      call    nt!EtwTraceEnqueueWork (fffff803`367bd89c)
fffff803`366aed91 90              nop
fffff803`366aed92 e9581fe8ff      jmp     nt!IopCompleteRequest+0xeff (fffff803`36530cef)  Branch

nt!IopCompleteRequest+0x17efa7:
fffff803`366aed97 4533c9          xor     r9d,r9d
fffff803`366aed9a 41b800010000    mov     r8d,100h
fffff803`366aeda0 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`366aeda5 e8265ee8ff      call    nt!KiTryUnwaitThread (fffff803`36534bd0)

nt!IopCompleteRequest+0x17efba:
fffff803`366aedaa 4d3be7          cmp     r12,r15
fffff803`366aedad 0f84be16e8ff    je      nt!IopCompleteRequest+0x681 (fffff803`36530471)  Branch

nt!IopCompleteRequest+0x17efc3:
fffff803`366aedb3 41b802000000    mov     r8d,2
fffff803`366aedb9 e9921ee8ff      jmp     nt!IopCompleteRequest+0xe60 (fffff803`36530c50)  Branch

nt!IopCompleteRequest+0x17efce:
fffff803`366aedbe a801            test    al,1
fffff803`366aedc0 0f84011ce8ff    je      nt!IopCompleteRequest+0xbd7 (fffff803`365309c7)  Branch

nt!IopCompleteRequest+0x17efd6:
fffff803`366aedc6 80f902          cmp     cl,2
fffff803`366aedc9 0f83f81be8ff    jae     nt!IopCompleteRequest+0xbd7 (fffff803`365309c7)  Branch

nt!IopCompleteRequest+0x17efdf:
fffff803`366aedcf 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366aedd8 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366aeddf f0810900000100  lock or dword ptr [rcx],10000h
fffff803`366aede6 e9dc1be8ff      jmp     nt!IopCompleteRequest+0xbd7 (fffff803`365309c7)  Branch

nt!IopCompleteRequest+0x17effb:
fffff803`366aedeb 498bc9          mov     rcx,r9
fffff803`366aedee e8b5cc0800      call    nt!KeIsThreadRunning (fffff803`3673baa8)
fffff803`366aedf3 440fb6c0        movzx   r8d,al
fffff803`366aedf7 498bc9          mov     rcx,r9
fffff803`366aedfa e89dea1000      call    nt!EtwTraceEnqueueWork (fffff803`367bd89c)
fffff803`366aedff 90              nop
fffff803`366aee00 e9e91be8ff      jmp     nt!IopCompleteRequest+0xbfe (fffff803`365309ee)  Branch

nt!IopCompleteRequest+0x17f015:
fffff803`366aee05 41b800010000    mov     r8d,100h
fffff803`366aee0b e91420e8ff      jmp     nt!IopCompleteRequest+0x1034 (fffff803`36530e24)  Branch

nt!IopCompleteRequest+0x17f020:
fffff803`366aee10 a801            test    al,1
fffff803`366aee12 0f846311e8ff    je      nt!IopCompleteRequest+0x18b (fffff803`3652ff7b)  Branch

nt!IopCompleteRequest+0x17f028:
fffff803`366aee18 4438442450      cmp     byte ptr [rsp+50h],r8b
fffff803`366aee1d 0f835811e8ff    jae     nt!IopCompleteRequest+0x18b (fffff803`3652ff7b)  Branch

nt!IopCompleteRequest+0x17f033:
fffff803`366aee23 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366aee2c 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366aee33 f0810900000100  lock or dword ptr [rcx],10000h
fffff803`366aee3a 8b8c24f0000000  mov     ecx,dword ptr [rsp+0F0h]
fffff803`366aee41 e93511e8ff      jmp     nt!IopCompleteRequest+0x18b (fffff803`3652ff7b)  Branch

nt!IopCompleteRequest+0x17f056:
fffff803`366aee46 4c3bff          cmp     r15,rdi
fffff803`366aee49 0f848c11e8ff    je      nt!IopCompleteRequest+0x1eb (fffff803`3652ffdb)  Branch

nt!IopCompleteRequest+0x17f05f:
fffff803`366aee4f 498bd7          mov     rdx,r15
fffff803`366aee52 4889542460      mov     qword ptr [rsp+60h],rdx
fffff803`366aee57 498b07          mov     rax,qword ptr [r15]
fffff803`366aee5a 4c8bf8          mov     r15,rax
fffff803`366aee5d 488b4a08        mov     rcx,qword ptr [rdx+8]
fffff803`366aee61 48395008        cmp     qword ptr [rax+8],rdx
fffff803`366aee65 0f8584040000    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x17f07b:
fffff803`366aee6b 483911          cmp     qword ptr [rcx],rdx
fffff803`366aee6e 0f857b040000    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x17f084:
fffff803`366aee74 488901          mov     qword ptr [rcx],rax
fffff803`366aee77 48894808        mov     qword ptr [rax+8],rcx
fffff803`366aee7b 0fb64210        movzx   eax,byte ptr [rdx+10h]
fffff803`366aee7f 3c01            cmp     al,1
fffff803`366aee81 752e            jne     nt!IopCompleteRequest+0x17f0c1 (fffff803`366aeeb1)  Branch

nt!IopCompleteRequest+0x17f093:
fffff803`366aee83 440fb74212      movzx   r8d,word ptr [rdx+12h]
fffff803`366aee88 4533c9          xor     r9d,r9d
fffff803`366aee8b 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`366aee90 e83b5de8ff      call    nt!KiTryUnwaitThread (fffff803`36534bd0)
fffff803`366aee95 84c0            test    al,al
fffff803`366aee97 0f8481010000    je      nt!IopCompleteRequest+0x17f22e (fffff803`366af01e)  Branch

nt!IopCompleteRequest+0x17f0ad:
fffff803`366aee9d 4183ac249c00000001 sub   dword ptr [r12+9Ch],1
fffff803`366aeea6 0f842f11e8ff    je      nt!IopCompleteRequest+0x1eb (fffff803`3652ffdb)  Branch

nt!IopCompleteRequest+0x17f0bc:
fffff803`366aeeac e96d010000      jmp     nt!IopCompleteRequest+0x17f22e (fffff803`366af01e)  Branch

nt!IopCompleteRequest+0x17f0c1:
fffff803`366aeeb1 3c02            cmp     al,2
fffff803`366aeeb3 0f8552010000    jne     nt!IopCompleteRequest+0x17f21b (fffff803`366af00b)  Branch

nt!IopCompleteRequest+0x17f0c9:
fffff803`366aeeb9 c6421105        mov     byte ptr [rdx+11h],5
fffff803`366aeebd 488b4218        mov     rax,qword ptr [rdx+18h]
fffff803`366aeec1 4889442440      mov     qword ptr [rsp+40h],rax
fffff803`366aeec6 4c8932          mov     qword ptr [rdx],r14
fffff803`366aeec9 4883c008        add     rax,8
fffff803`366aeecd 4889442468      mov     qword ptr [rsp+68h],rax
fffff803`366aeed2 c68424f000000000 mov     byte ptr [rsp+0F0h],0
fffff803`366aeeda 440f20c1        mov     rcx,cr8
fffff803`366aeede 450f22c0        mov     cr8,r8
fffff803`366aeee2 8b0510363400    mov     eax,dword ptr [nt!KiIrqlFlags (fffff803`369f24f8)]
fffff803`366aeee8 85c0            test    eax,eax
fffff803`366aeeea 7420            je      nt!IopCompleteRequest+0x17f11c (fffff803`366aef0c)  Branch

nt!IopCompleteRequest+0x17f0fc:
fffff803`366aeeec a801            test    al,1
fffff803`366aeeee 741c            je      nt!IopCompleteRequest+0x17f11c (fffff803`366aef0c)  Branch

nt!IopCompleteRequest+0x17f100:
fffff803`366aeef0 80f902          cmp     cl,2
fffff803`366aeef3 7317            jae     nt!IopCompleteRequest+0x17f11c (fffff803`366aef0c)  Branch

nt!IopCompleteRequest+0x17f105:
fffff803`366aeef5 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366aeefe 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366aef05 f0810900000100  lock or dword ptr [rcx],10000h

nt!IopCompleteRequest+0x17f11c:
fffff803`366aef0c 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366aef15 4889442458      mov     qword ptr [rsp+58h],rax
fffff803`366aef1a 4c8b4808        mov     r9,qword ptr [rax+8]
fffff803`366aef1e 4c894c2478      mov     qword ptr [rsp+78h],r9
fffff803`366aef23 8b051b343400    mov     eax,dword ptr [nt!PerfGlobalGroupMask+0x4 (fffff803`369f2344)]
fffff803`366aef29 0fbae018        bt      eax,18h
fffff803`366aef2d 7314            jae     nt!IopCompleteRequest+0x17f153 (fffff803`366aef43)  Branch

nt!IopCompleteRequest+0x17f13f:
fffff803`366aef2f 498bc9          mov     rcx,r9
fffff803`366aef32 e871cb0800      call    nt!KeIsThreadRunning (fffff803`3673baa8)
fffff803`366aef37 440fb6c0        movzx   r8d,al
fffff803`366aef3b 498bc9          mov     rcx,r9
fffff803`366aef3e e859e91000      call    nt!EtwTraceEnqueueWork (fffff803`367bd89c)

nt!IopCompleteRequest+0x17f153:
fffff803`366aef43 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`366aef48 e813e2eeff      call    nt!KiAcquireKobjectLockSafe (fffff803`3659d160)
fffff803`366aef4d 4c8b542468      mov     r10,qword ptr [rsp+68h]
fffff803`366aef52 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`366aef57 4d3912          cmp     qword ptr [r10],r10
fffff803`366aef5a 7440            je      nt!IopCompleteRequest+0x17f1ac (fffff803`366aef9c)  Branch

nt!IopCompleteRequest+0x17f16c:
fffff803`366aef5c 8b4128          mov     eax,dword ptr [rcx+28h]
fffff803`366aef5f 3b412c          cmp     eax,dword ptr [rcx+2Ch]
fffff803`366aef62 7338            jae     nt!IopCompleteRequest+0x17f1ac (fffff803`366aef9c)  Branch

nt!IopCompleteRequest+0x17f174:
fffff803`366aef64 488b542478      mov     rdx,qword ptr [rsp+78h]
fffff803`366aef69 488b82e8000000  mov     rax,qword ptr [rdx+0E8h]
fffff803`366aef70 483bc1          cmp     rax,rcx
fffff803`366aef73 7509            jne     nt!IopCompleteRequest+0x17f18e (fffff803`366aef7e)  Branch

nt!IopCompleteRequest+0x17f185:
fffff803`366aef75 80ba830200000f  cmp     byte ptr [rdx+283h],0Fh
fffff803`366aef7c 741e            je      nt!IopCompleteRequest+0x17f1ac (fffff803`366aef9c)  Branch

nt!IopCompleteRequest+0x17f18e:
fffff803`366aef7e 4c8b442460      mov     r8,qword ptr [rsp+60h]
fffff803`366aef83 488bd1          mov     rdx,rcx
fffff803`366aef86 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff803`366aef8b e8d0aee9ff      call    nt!KiWakeQueueWaiter (fffff803`36549e60)
fffff803`366aef90 488b4c2440      mov     rcx,qword ptr [rsp+40h]
fffff803`366aef95 4c8b542468      mov     r10,qword ptr [rsp+68h]
fffff803`366aef9a eb08            jmp     nt!IopCompleteRequest+0x17f1b4 (fffff803`366aefa4)  Branch

nt!IopCompleteRequest+0x17f1ac:
fffff803`366aef9c 0fb68424f0000000 movzx   eax,byte ptr [rsp+0F0h]

nt!IopCompleteRequest+0x17f1b4:
fffff803`366aefa4 84c0            test    al,al
fffff803`366aefa6 754b            jne     nt!IopCompleteRequest+0x17f203 (fffff803`366aeff3)  Branch

nt!IopCompleteRequest+0x17f1b8:
fffff803`366aefa8 448b4904        mov     r9d,dword ptr [rcx+4]
fffff803`366aefac 418d4101        lea     eax,[r9+1]
fffff803`366aefb0 894104          mov     dword ptr [rcx+4],eax
fffff803`366aefb3 488d5118        lea     rdx,[rcx+18h]
fffff803`366aefb7 4c8b4208        mov     r8,qword ptr [rdx+8]
fffff803`366aefbb 493910          cmp     qword ptr [r8],rdx
fffff803`366aefbe 0f852b030000    jne     nt!IopCompleteRequest+0x17f4ff (fffff803`366af2ef)  Branch

nt!IopCompleteRequest+0x17f1d4:
fffff803`366aefc4 488b442460      mov     rax,qword ptr [rsp+60h]
fffff803`366aefc9 488910          mov     qword ptr [rax],rdx
fffff803`366aefcc 4c894008        mov     qword ptr [rax+8],r8
fffff803`366aefd0 498900          mov     qword ptr [r8],rax
fffff803`366aefd3 48894208        mov     qword ptr [rdx+8],rax
fffff803`366aefd7 4585c9          test    r9d,r9d
fffff803`366aefda 7517            jne     nt!IopCompleteRequest+0x17f203 (fffff803`366aeff3)  Branch

nt!IopCompleteRequest+0x17f1ec:
fffff803`366aefdc 4d3912          cmp     qword ptr [r10],r10
fffff803`366aefdf 7412            je      nt!IopCompleteRequest+0x17f203 (fffff803`366aeff3)  Branch

nt!IopCompleteRequest+0x17f1f1:
fffff803`366aefe1 488bd1          mov     rdx,rcx
fffff803`366aefe4 488b4c2458      mov     rcx,qword ptr [rsp+58h]
fffff803`366aefe9 e85225e7ff      call    nt!KiWakeOtherQueueWaiters (fffff803`36521540)
fffff803`366aefee 488b4c2440      mov     rcx,qword ptr [rsp+40h]

nt!IopCompleteRequest+0x17f203:
fffff803`366aeff3 f081217fffffff  lock and dword ptr [rcx],0FFFFFF7Fh
fffff803`366aeffa 4183ac249c00000001 sub   dword ptr [r12+9Ch],1
fffff803`366af003 0f84d20fe8ff    je      nt!IopCompleteRequest+0x1eb (fffff803`3652ffdb)  Branch

nt!IopCompleteRequest+0x17f219:
fffff803`366af009 eb13            jmp     nt!IopCompleteRequest+0x17f22e (fffff803`366af01e)  Branch

nt!IopCompleteRequest+0x17f21b:
fffff803`366af00b 4533c9          xor     r9d,r9d
fffff803`366af00e 41b800010000    mov     r8d,100h
fffff803`366af014 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`366af019 e8b25be8ff      call    nt!KiTryUnwaitThread (fffff803`36534bd0)

nt!IopCompleteRequest+0x17f22e:
fffff803`366af01e 4c3bff          cmp     r15,rdi
fffff803`366af021 0f84b40fe8ff    je      nt!IopCompleteRequest+0x1eb (fffff803`3652ffdb)  Branch

nt!IopCompleteRequest+0x17f237:
fffff803`366af027 41b802000000    mov     r8d,2
fffff803`366af02d e91dfeffff      jmp     nt!IopCompleteRequest+0x17f05f (fffff803`366aee4f)  Branch

nt!IopCompleteRequest+0x17f242:
fffff803`366af032 450fb7442412    movzx   r8d,word ptr [r12+12h]
fffff803`366af038 eb62            jmp     nt!IopCompleteRequest+0x17f2ac (fffff803`366af09c)  Branch

nt!IopCompleteRequest+0x17f24a:
fffff803`366af03a a801            test    al,1
fffff803`366af03c 0f84151be8ff    je      nt!IopCompleteRequest+0xd67 (fffff803`36530b57)  Branch

nt!IopCompleteRequest+0x17f252:
fffff803`366af042 80f902          cmp     cl,2
fffff803`366af045 0f830c1be8ff    jae     nt!IopCompleteRequest+0xd67 (fffff803`36530b57)  Branch

nt!IopCompleteRequest+0x17f25b:
fffff803`366af04b 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366af054 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366af05b f0810900000100  lock or dword ptr [rcx],10000h
fffff803`366af062 e9f01ae8ff      jmp     nt!IopCompleteRequest+0xd67 (fffff803`36530b57)  Branch

nt!IopCompleteRequest+0x17f277:
fffff803`366af067 498bc9          mov     rcx,r9
fffff803`366af06a e839ca0800      call    nt!KeIsThreadRunning (fffff803`3673baa8)
fffff803`366af06f 440fb6c0        movzx   r8d,al
fffff803`366af073 498bd4          mov     rdx,r12
fffff803`366af076 498bc9          mov     rcx,r9
fffff803`366af079 e81ee81000      call    nt!EtwTraceEnqueueWork (fffff803`367bd89c)
fffff803`366af07e 90              nop
fffff803`366af07f e9fa1ae8ff      jmp     nt!IopCompleteRequest+0xd8e (fffff803`36530b7e)  Branch

nt!IopCompleteRequest+0x17f294:
fffff803`366af084 80ba830200000f  cmp     byte ptr [rdx+283h],0Fh
fffff803`366af08b 0f840a1be8ff    je      nt!IopCompleteRequest+0xdab (fffff803`36530b9b)  Branch

nt!IopCompleteRequest+0x17f2a1:
fffff803`366af091 e9001de8ff      jmp     nt!IopCompleteRequest+0xfa6 (fffff803`36530d96)  Branch

nt!IopCompleteRequest+0x17f2a6:
fffff803`366af096 41b800010000    mov     r8d,100h

nt!IopCompleteRequest+0x17f2ac:
fffff803`366af09c 4533c9          xor     r9d,r9d
fffff803`366af09f 498bd4          mov     rdx,r12
fffff803`366af0a2 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff803`366af0a7 e8245be8ff      call    nt!KiTryUnwaitThread (fffff803`36534bd0)
fffff803`366af0ac 90              nop
fffff803`366af0ad e9361be8ff      jmp     nt!IopCompleteRequest+0xdf8 (fffff803`36530be8)  Branch

nt!IopCompleteRequest+0x17f2c2:
fffff803`366af0b2 a801            test    al,1
fffff803`366af0b4 0f84c614e8ff    je      nt!IopCompleteRequest+0x790 (fffff803`36530580)  Branch

nt!IopCompleteRequest+0x17f2ca:
fffff803`366af0ba 4180fc02        cmp     r12b,2
fffff803`366af0be 0f83bc14e8ff    jae     nt!IopCompleteRequest+0x790 (fffff803`36530580)  Branch

nt!IopCompleteRequest+0x17f2d4:
fffff803`366af0c4 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366af0cd 488b88b8610000  mov     rcx,qword ptr [rax+61B8h]
fffff803`366af0d4 f0810900000100  lock or dword ptr [rcx],10000h
fffff803`366af0db e9a014e8ff      jmp     nt!IopCompleteRequest+0x790 (fffff803`36530580)  Branch

nt!IopCompleteRequest+0x17f2f0:
fffff803`366af0e0 488bcf          mov     rcx,rdi
fffff803`366af0e3 e8b0f70800      call    nt!KiAcquireSpinLockInstrumented (fffff803`3673e898)
fffff803`366af0e8 90              nop
fffff803`366af0e9 e9c414e8ff      jmp     nt!IopCompleteRequest+0x7c2 (fffff803`365305b2)  Branch

nt!IopCompleteRequest+0x17f2fe:
fffff803`366af0ee 41807f2001      cmp     byte ptr [r15+20h],1
fffff803`366af0f3 0f87ad14e8ff    ja      nt!IopCompleteRequest+0x7b6 (fffff803`365305a6)  Branch

nt!IopCompleteRequest+0x17f309:
fffff803`366af0f9 8b4214          mov     eax,dword ptr [rdx+14h]
fffff803`366af0fc 83c001          add     eax,1
fffff803`366af0ff 894214          mov     dword ptr [rdx+14h],eax
fffff803`366af102 0f859e14e8ff    jne     nt!IopCompleteRequest+0x7b6 (fffff803`365305a6)  Branch

nt!IopCompleteRequest+0x17f318:
fffff803`366af108 498bcf          mov     rcx,r15
fffff803`366af10b e85cd8faff      call    nt!KiRemoveSystemWorkPriorityKick (fffff803`3665c96c)
fffff803`366af110 90              nop
fffff803`366af111 e99014e8ff      jmp     nt!IopCompleteRequest+0x7b6 (fffff803`365305a6)  Branch

nt!IopCompleteRequest+0x17f326:
fffff803`366af116 488b9424e8000000 mov     rdx,qword ptr [rsp+0E8h]
fffff803`366af11e 488bcf          mov     rcx,rdi
fffff803`366af121 e882f80800      call    nt!KiReleaseSpinLockInstrumented (fffff803`3673e9a8)
fffff803`366af126 90              nop
fffff803`366af127 e9e414e8ff      jmp     nt!IopCompleteRequest+0x820 (fffff803`36530610)  Branch

nt!IopCompleteRequest+0x17f33c:
fffff803`366af12c 80792001        cmp     byte ptr [rcx+20h],1
fffff803`366af130 0f87f314e8ff    ja      nt!IopCompleteRequest+0x839 (fffff803`36530629)  Branch

nt!IopCompleteRequest+0x17f346:
fffff803`366af136 8b4214          mov     eax,dword ptr [rdx+14h]
fffff803`366af139 83e801          sub     eax,1
fffff803`366af13c 894214          mov     dword ptr [rdx+14h],eax
fffff803`366af13f 0f85e414e8ff    jne     nt!IopCompleteRequest+0x839 (fffff803`36530629)  Branch

nt!IopCompleteRequest+0x17f355:
fffff803`366af145 e822d8faff      call    nt!KiRemoveSystemWorkPriorityKick (fffff803`3665c96c)
fffff803`366af14a 90              nop
fffff803`366af14b e9d914e8ff      jmp     nt!IopCompleteRequest+0x839 (fffff803`36530629)  Branch

nt!IopCompleteRequest+0x17f360:
fffff803`366af150 a801            test    al,1
fffff803`366af152 0f84df14e8ff    je      nt!IopCompleteRequest+0x847 (fffff803`36530637)  Branch

nt!IopCompleteRequest+0x17f368:
fffff803`366af158 440f20c0        mov     rax,cr8
fffff803`366af15c 3c02            cmp     al,2
fffff803`366af15e 0f82d314e8ff    jb      nt!IopCompleteRequest+0x847 (fffff803`36530637)  Branch

nt!IopCompleteRequest+0x17f374:
fffff803`366af164 4180fc02        cmp     r12b,2
fffff803`366af168 0f83c914e8ff    jae     nt!IopCompleteRequest+0x847 (fffff803`36530637)  Branch

nt!IopCompleteRequest+0x17f37e:
fffff803`366af16e 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff803`366af177 488b81b8610000  mov     rax,qword ptr [rcx+61B8h]
fffff803`366af17e f08120fffffeff  lock and dword ptr [rax],0FFFEFFFFh
fffff803`366af185 e8e2d7faff      call    nt!KiRemoveSystemWorkPriorityKick (fffff803`3665c96c)
fffff803`366af18a 90              nop
fffff803`366af18b e9a714e8ff      jmp     nt!IopCompleteRequest+0x847 (fffff803`36530637)  Branch

nt!IopCompleteRequest+0x17f3a0:
fffff803`366af190 a801            test    al,1
fffff803`366af192 0f84010fe8ff    je      nt!IopCompleteRequest+0x2a9 (fffff803`36530099)  Branch

nt!IopCompleteRequest+0x17f3a8:
fffff803`366af198 4180ff02        cmp     r15b,2
fffff803`366af19c 0f83f70ee8ff    jae     nt!IopCompleteRequest+0x2a9 (fffff803`36530099)  Branch

nt!IopCompleteRequest+0x17f3b2:
fffff803`366af1a2 65488b042520000000 mov   rax,qword ptr gs:[20h]
fffff803`366af1ab 488b90b8610000  mov     rdx,qword ptr [rax+61B8h]
fffff803`366af1b2 f0810a00000100  lock or dword ptr [rdx],10000h
fffff803`366af1b9 e9db0ee8ff      jmp     nt!IopCompleteRequest+0x2a9 (fffff803`36530099)  Branch

nt!IopCompleteRequest+0x17f3ce:
fffff803`366af1be 498d8d40070000  lea     rcx,[r13+740h]
fffff803`366af1c5 e8cef60800      call    nt!KiAcquireSpinLockInstrumented (fffff803`3673e898)
fffff803`366af1ca 90              nop
fffff803`366af1cb e9000fe8ff      jmp     nt!IopCompleteRequest+0x2e0 (fffff803`365300d0)  Branch

nt!IopCompleteRequest+0x17f3e0:
fffff803`366af1d0 41807c242001    cmp     byte ptr [r12+20h],1
fffff803`366af1d6 0f87e40ee8ff    ja      nt!IopCompleteRequest+0x2d0 (fffff803`365300c0)  Branch

nt!IopCompleteRequest+0x17f3ec:
fffff803`366af1dc 8b4214          mov     eax,dword ptr [rdx+14h]
fffff803`366af1df 83c001          add     eax,1
fffff803`366af1e2 894214          mov     dword ptr [rdx+14h],eax
fffff803`366af1e5 0f85d50ee8ff    jne     nt!IopCompleteRequest+0x2d0 (fffff803`365300c0)  Branch

nt!IopCompleteRequest+0x17f3fb:
fffff803`366af1eb 498bcc          mov     rcx,r12
fffff803`366af1ee e879d7faff      call    nt!KiRemoveSystemWorkPriorityKick (fffff803`3665c96c)
fffff803`366af1f3 90              nop
fffff803`366af1f4 e9c70ee8ff      jmp     nt!IopCompleteRequest+0x2d0 (fffff803`365300c0)  Branch

nt!IopCompleteRequest+0x17f409:
fffff803`366af1f9 488b9424e8000000 mov     rdx,qword ptr [rsp+0E8h]
fffff803`366af201 e8a2f70800      call    nt!KiReleaseSpinLockInstrumented (fffff803`3673e9a8)
fffff803`366af206 90              nop
fffff803`366af207 e90e0fe8ff      jmp     nt!IopCompleteRequest+0x32a (fffff803`3653011a)  Branch

nt!IopCompleteRequest+0x17f41c:
fffff803`366af20c 80792001        cmp     byte ptr [rcx+20h],1
fffff803`366af210 0f871d0fe8ff    ja      nt!IopCompleteRequest+0x343 (fffff803`36530133)  Branch

nt!IopCompleteRequest+0x17f426:
fffff803`366af216 8b4214          mov     eax,dword ptr [rdx+14h]
fffff803`366af219 83e801          sub     eax,1
fffff803`366af21c 894214          mov     dword ptr [rdx+14h],eax
fffff803`366af21f 0f850e0fe8ff    jne     nt!IopCompleteRequest+0x343 (fffff803`36530133)  Branch

nt!IopCompleteRequest+0x17f435:
fffff803`366af225 e842d7faff      call    nt!KiRemoveSystemWorkPriorityKick (fffff803`3665c96c)
fffff803`366af22a 90              nop
fffff803`366af22b e9030fe8ff      jmp     nt!IopCompleteRequest+0x343 (fffff803`36530133)  Branch

nt!IopCompleteRequest+0x17f440:
fffff803`366af230 a801            test    al,1
fffff803`366af232 0f84090fe8ff    je      nt!IopCompleteRequest+0x351 (fffff803`36530141)  Branch

nt!IopCompleteRequest+0x17f448:
fffff803`366af238 440f20c0        mov     rax,cr8
fffff803`366af23c 3c02            cmp     al,2
fffff803`366af23e 0f82fd0ee8ff    jb      nt!IopCompleteRequest+0x351 (fffff803`36530141)  Branch

nt!IopCompleteRequest+0x17f454:
fffff803`366af244 4180ff02        cmp     r15b,2
fffff803`366af248 0f83f30ee8ff    jae     nt!IopCompleteRequest+0x351 (fffff803`36530141)  Branch

nt!IopCompleteRequest+0x17f45e:
fffff803`366af24e 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff803`366af257 488b81b8610000  mov     rax,qword ptr [rcx+61B8h]
fffff803`366af25e f08120fffffeff  lock and dword ptr [rax],0FFFEFFFFh
fffff803`366af265 e802d7faff      call    nt!KiRemoveSystemWorkPriorityKick (fffff803`3665c96c)
fffff803`366af26a 90              nop
fffff803`366af26b e9d10ee8ff      jmp     nt!IopCompleteRequest+0x351 (fffff803`36530141)  Branch

nt!IopCompleteRequest+0x17f480:
fffff803`366af270 41b801000000    mov     r8d,1
fffff803`366af276 e9b112e8ff      jmp     nt!IopCompleteRequest+0x73c (fffff803`3653052c)  Branch

nt!IopCompleteRequest+0x17f48b:
fffff803`366af27b 4c89742420      mov     qword ptr [rsp+20h],r14
fffff803`366af280 4533c9          xor     r9d,r9d
fffff803`366af283 41b843250000    mov     r8d,2543h
fffff803`366af289 488bd3          mov     rdx,rbx
fffff803`366af28c 418d4944        lea     ecx,[r9+44h]
fffff803`366af290 e8ab3dfbff      call    nt!KeBugCheckEx (fffff803`36663040)
fffff803`366af295 cc              int     3

nt!IopCompleteRequest+0x17f4a6:
fffff803`366af296 41b001          mov     r8b,1
fffff803`366af299 baffffffff      mov     edx,0FFFFFFFFh
fffff803`366af29e 488bcb          mov     rcx,rbx
fffff803`366af2a1 e8b60ef2ff      call    nt!IopFreeIrpExtension (fffff803`365d015c)
fffff803`366af2a6 0fb64347        movzx   eax,byte ptr [rbx+47h]
fffff803`366af2aa e9fc0ee8ff      jmp     nt!IopCompleteRequest+0x3bb (fffff803`365301ab)  Branch

nt!IopCompleteRequest+0x17f4bf:
fffff803`366af2af 488bcb          mov     rcx,rbx
fffff803`366af2b2 e8edd50700      call    nt!IopFreeReserveIrp (fffff803`3672c8a4)
fffff803`366af2b7 90              nop
fffff803`366af2b8 e91210e8ff      jmp     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0x17f4cd:
fffff803`366af2bd 654c8b142520000000 mov   r10,qword ptr gs:[20h]
fffff803`366af2c6 e90c0fe8ff      jmp     nt!IopCompleteRequest+0x3e7 (fffff803`365301d7)  Branch

nt!IopCompleteRequest+0x17f4db:
fffff803`366af2cb 3408            xor     al,8
fffff803`366af2cd 884347          mov     byte ptr [rbx+47h],al
fffff803`366af2d0 f041ff829c2d0000 lock inc dword ptr [r10+2D9Ch]
fffff803`366af2d8 0fb64347        movzx   eax,byte ptr [rbx+47h]
fffff803`366af2dc e9020fe8ff      jmp     nt!IopCompleteRequest+0x3f3 (fffff803`365301e3)  Branch

nt!IopCompleteRequest+0x17f4f1:
fffff803`366af2e1 488bcb          mov     rcx,rbx

nt!IopCompleteRequest+0x17f4f4:
fffff803`366af2e4 e8034f7200      call    nt!IovFreeIrpPrivate (fffff803`36dd41ec)
fffff803`366af2e9 90              nop
fffff803`366af2ea e9e00fe8ff      jmp     nt!IopCompleteRequest+0x4df (fffff803`365302cf)  Branch

nt!IopCompleteRequest+0x17f4ff:
fffff803`366af2ef b903000000      mov     ecx,3
fffff803`366af2f4 cd29            int     29h
fffff803`366af2f6 83f803          cmp     eax,3
fffff803`366af2f9 750b            jne     nt!IofCompleteRequest+0x17e446 (fffff803`366af306)  Branch

nt!IofCompleteRequest+0x17:
fffff803`36530ed7 4883c428        add     rsp,28h
fffff803`36530edb c3              ret

nt!IofCompleteRequest+0x17e43b:
fffff803`366af2fb e8cc3a0800      call    nt!IopPerfCompleteRequest (fffff803`36732dcc)
fffff803`366af300 90              nop
fffff803`366af301 e9d11be8ff      jmp     nt!IofCompleteRequest+0x17 (fffff803`36530ed7)  Branch

nt!IofCompleteRequest+0x17e446:
fffff803`366af306 e8c94c7200      call    nt!IovCompleteRequest (fffff803`36dd3fd4)
fffff803`366af30b 90              nop
fffff803`366af30c e9c61be8ff      jmp     nt!IofCompleteRequest+0x17 (fffff803`36530ed7)  Branch
