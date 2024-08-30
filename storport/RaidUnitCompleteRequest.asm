;arg1 == XRB of completed request

0: kd> uf storport!RaidUnitCompleteRequest
storport!RaidUnitCompleteRequest:
fffff808`de9db8d0 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff808`de9db8d5 55              push    rbp
fffff808`de9db8d6 56              push    rsi
fffff808`de9db8d7 4154            push    r12
fffff808`de9db8d9 4155            push    r13
fffff808`de9db8db 4156            push    r14
fffff808`de9db8dd 488d6c2490      lea     rbp,[rsp-70h]
fffff808`de9db8e2 4881ec70010000  sub     rsp,170h
fffff808`de9db8e9 488b05a0590500  mov     rax,qword ptr [storport!_security_cookie (fffff808`dea31290)]
fffff808`de9db8f0 4833c4          xor     rax,rsp
fffff808`de9db8f3 48894568        mov     qword ptr [rbp+68h],rax
fffff808`de9db8f7 0fb64110        movzx   eax,byte ptr [rcx+10h]  ;state flag 1 bytes
fffff808`de9db8fb 4c8be1          mov     r12,rcx
fffff808`de9db8fe 4c8bb1a8000000  mov     r14,qword ptr [rcx+0A8h]  ;XRB->Srb
fffff808`de9db905 4c8ba9a0000000  mov     r13,qword ptr [rcx+0A0h]  ;XRB->Irp
fffff808`de9db90c 488bb1e0000000  mov     rsi,qword ptr [rcx+0E0h]  ;XRB->Unit
fffff808`de9db913 48894dd8        mov     qword ptr [rbp-28h],rcx
fffff808`de9db917 884580          mov     byte ptr [rbp-80h],al
fffff808`de9db91a 410fb64602      movzx   eax,byte ptr [r14+2]      ;get Srb->Function
fffff808`de9db91f 48894da8        mov     qword ptr [rbp-58h],rcx
fffff808`de9db923 4c896d98        mov     qword ptr [rbp-68h],r13
fffff808`de9db927 3c28            cmp     al,28h                    ;if Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK, goto 0x90
fffff808`de9db929 7535            jne     storport!RaidUnitCompleteRequest+0x90 (fffff808`de9db960)  Branch

storport!RaidUnitCompleteRequest+0x5b:
fffff808`de9db92b 498b4668        mov     rax,qword ptr [r14+68h]       ;Srb->MiniportContext => SRB EXTENSION
fffff808`de9db92f 458b4e14        mov     r9d,dword ptr [r14+14h]       ;Srb->TimeoutValue
fffff808`de9db933 488945d0        mov     qword ptr [rbp-30h],rax       ;SRB EXTENSION
fffff808`de9db937 488d8120030000  lea     rax,[rcx+320h]                ;XRB+0x320 ?
fffff808`de9db93e 488945e0        mov     qword ptr [rbp-20h],rax
fffff808`de9db942 418b5618        mov     edx,dword ptr [r14+18h]       ;Srb->SrbFlags
fffff808`de9db946 458b4620        mov     r8d,dword ptr [r14+20h]       ;Srb->RequestTag
fffff808`de9db94a 8954247c        mov     dword ptr [rsp+7Ch],edx
fffff808`de9db94e 418b563c        mov     edx,dword ptr [r14+3Ch]       ;Srb->DataTransferLength
fffff808`de9db952 895588          mov     dword ptr [rbp-78h],edx
fffff808`de9db955 44894c2478      mov     dword ptr [rsp+78h],r9d
fffff808`de9db95a 44894584        mov     dword ptr [rbp-7Ch],r8d
fffff808`de9db95e eb2e            jmp     storport!RaidUnitCompleteRequest+0xbe (fffff808`de9db98e)  Branch

storport!RaidUnitCompleteRequest+0x90:
fffff808`de9db960 0fb6c0          movzx   eax,al
fffff808`de9db963 89442478        mov     dword ptr [rsp+78h],eax
fffff808`de9db967 498b4638        mov     rax,qword ptr [r14+38h]
fffff808`de9db96b 488945d0        mov     qword ptr [rbp-30h],rax
fffff808`de9db96f 498b4620        mov     rax,qword ptr [r14+20h]
fffff808`de9db973 488945e0        mov     qword ptr [rbp-20h],rax
fffff808`de9db977 410fb64608      movzx   eax,byte ptr [r14+8]
fffff808`de9db97c 894584          mov     dword ptr [rbp-7Ch],eax
fffff808`de9db97f 418b460c        mov     eax,dword ptr [r14+0Ch]
fffff808`de9db983 8944247c        mov     dword ptr [rsp+7Ch],eax
fffff808`de9db987 418b4610        mov     eax,dword ptr [r14+10h]
fffff808`de9db98b 894588          mov     dword ptr [rbp-78h],eax

storport!RaidUnitCompleteRequest+0xbe:
fffff808`de9db98e 498b85b8000000  mov     rax,qword ptr [r13+0B8h]      ;Irp->Tail->Overlay->CurrentStackLocation
fffff808`de9db995 488b4808        mov     rcx,qword ptr [rax+8]         ;CurrentStackLocation->Parameters->Scsi->Srb  pointer
fffff808`de9db999 80790228        cmp     byte ptr [rcx+2],28h          ;if (Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0xd5
fffff808`de9db99d 7506            jne     storport!RaidUnitCompleteRequest+0xd5 (fffff808`de9db9a5)  Branch

storport!RaidUnitCompleteRequest+0xcf:
fffff808`de9db99f 488b5960        mov     rbx,qword ptr [rcx+60h]       ;Srb->PortContext => XRB
fffff808`de9db9a3 eb04            jmp     storport!RaidUnitCompleteRequest+0xd9 (fffff808`de9db9a9)  Branch

storport!RaidUnitCompleteRequest+0xd5:
fffff808`de9db9a5 488b5930        mov     rbx,qword ptr [rcx+30h]

storport!RaidUnitCompleteRequest+0xd9:
fffff808`de9db9a9 0fb64310        movzx   eax,byte ptr [rbx+10h]        ;XRB+0x10 flag byte
fffff808`de9db9ad 4889bc24a8010000 mov     qword ptr [rsp+1A8h],rdi
fffff808`de9db9b5 4c89bc24b0010000 mov     qword ptr [rsp+1B0h],r15
fffff808`de9db9bd a802            test    al,2      ;if(XRB->RemoveFromEventQueue) goto 0x232
fffff808`de9db9bf 0f843d010000    je      storport!RaidUnitCompleteRequest+0x232 (fffff808`de9dbb02)  Branch

storport!RaidUnitCompleteRequest+0xf5:  ;rcx=SRB, rbx=XRB, rsi=XRB->Unit, 
fffff808`de9db9c5 8b7b54          mov     edi,dword ptr [rbx+54h]       ;XRB->PendingLink->QueueIndex
fffff808`de9db9c8 4883c330        add     rbx,30h
fffff808`de9db9cc 4c8bbef8010000  mov     r15,qword ptr [rsi+1F8h]      ;XRB->Unit->PendingQueue
fffff808`de9db9d3 48ffc7          inc     rdi               ;QueueIndex++
fffff808`de9db9d6 48c1e706        shl     rdi,6             ;很Tricky的array access => PendingQueue 到 PendingQueue ->ProcessorQueue之間offset剛好等於 sizeof(ProcessorQueue)
fffff808`de9db9da 4903ff          add     rdi,r15           ;rdi =PendingQueue + i*64 => i==0時為PendingQueue，i==1時 rdi=PendingQueue->ProcessorQueues[i-1] 
fffff808`de9db9dd 488d4f28        lea     rcx,[rdi+28h]     ;rcx = &PendingQueue->ProcessorQueues[i].Lock
fffff808`de9db9e1 440f20c0        mov     rax,tmm           ; get current IRQL
fffff808`de9db9e5 488d55e8        lea     rdx,[rbp-18h]     ;KeAcquireInStackQueuedSpinLockAtDpcLevel 的 LockHandle
fffff808`de9db9e9 3c02            cmp     al,2              ;if IRQL != DISPATCH_LEVEL, goto 0x1c9
fffff808`de9db9eb 0f85a8000000    jne     storport!RaidUnitCompleteRequest+0x1c9 (fffff808`de9dba99)  Branch

storport!RaidUnitCompleteRequest+0x121:
fffff808`de9db9f1 48ff1578b90500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLockAtDpcLevel (fffff808`dea37370)]
fffff808`de9db9f8 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9db9fd 0fb643e0        movzx   eax,byte ptr [rbx-20h]    ;rbx= XRB+0x10
fffff808`de9dba01 458b0f          mov     r9d,dword ptr [r15]
fffff808`de9dba04 a802            test    al,2                      ;if(XRB->RemoveFromEventQueue) goto 0x1a8
fffff808`de9dba06 7470            je      storport!RaidUnitCompleteRequest+0x1a8 (fffff808`de9dba78)  Branch

storport!RaidUnitCompleteRequest+0x138:
fffff808`de9dba08 24fd            and     al,0FDh
fffff808`de9dba0a 8843e0          mov     byte ptr [rbx-20h],al
fffff808`de9dba0d 488b0b          mov     rcx,qword ptr [rbx]
fffff808`de9dba10 4c8b07          mov     r8,qword ptr [rdi]
fffff808`de9dba13 48395908        cmp     qword ptr [rcx+8],rbx
fffff808`de9dba17 7579            jne     storport!RaidUnitCompleteRequest+0x1c2 (fffff808`de9dba92)  Branch

storport!RaidUnitCompleteRequest+0x149:
fffff808`de9dba19 488b4308        mov     rax,qword ptr [rbx+8]
fffff808`de9dba1d 483918          cmp     qword ptr [rax],rbx
fffff808`de9dba20 7570            jne     storport!RaidUnitCompleteRequest+0x1c2 (fffff808`de9dba92)  Branch

storport!RaidUnitCompleteRequest+0x152:
fffff808`de9dba22 488908          mov     qword ptr [rax],rcx
fffff808`de9dba25 48894108        mov     qword ptr [rcx+8],rax
fffff808`de9dba29 8b4330          mov     eax,dword ptr [rbx+30h]
fffff808`de9dba2c a801            test    al,1
fffff808`de9dba2e 742e            je      storport!RaidUnitCompleteRequest+0x18e (fffff808`de9dba5e)  Branch

storport!RaidUnitCompleteRequest+0x160:
fffff808`de9dba30 488d4b10        lea     rcx,[rbx+10h]
fffff808`de9dba34 48394f20        cmp     qword ptr [rdi+20h],rcx
fffff808`de9dba38 7507            jne     storport!RaidUnitCompleteRequest+0x171 (fffff808`de9dba41)  Branch

storport!RaidUnitCompleteRequest+0x16a:
fffff808`de9dba3a 488b01          mov     rax,qword ptr [rcx]
fffff808`de9dba3d 48894720        mov     qword ptr [rdi+20h],rax

storport!RaidUnitCompleteRequest+0x171:
fffff808`de9dba41 488b11          mov     rdx,qword ptr [rcx]
fffff808`de9dba44 48394a08        cmp     qword ptr [rdx+8],rcx
fffff808`de9dba48 7548            jne     storport!RaidUnitCompleteRequest+0x1c2 (fffff808`de9dba92)  Branch

storport!RaidUnitCompleteRequest+0x17a:
fffff808`de9dba4a 488b4108        mov     rax,qword ptr [rcx+8]
fffff808`de9dba4e 483908          cmp     qword ptr [rax],rcx
fffff808`de9dba51 753f            jne     storport!RaidUnitCompleteRequest+0x1c2 (fffff808`de9dba92)  Branch

storport!RaidUnitCompleteRequest+0x183:
fffff808`de9dba53 488910          mov     qword ptr [rax],rdx
fffff808`de9dba56 48894208        mov     qword ptr [rdx+8],rax
fffff808`de9dba5a 836330fe        and     dword ptr [rbx+30h],0FFFFFFFEh

storport!RaidUnitCompleteRequest+0x18e:
fffff808`de9dba5e 41f6c104        test    r9b,4
fffff808`de9dba62 7514            jne     storport!RaidUnitCompleteRequest+0x1a8 (fffff808`de9dba78)  Branch

storport!RaidUnitCompleteRequest+0x194:
fffff808`de9dba64 4c3bc3          cmp     r8,rbx
fffff808`de9dba67 750f            jne     storport!RaidUnitCompleteRequest+0x1a8 (fffff808`de9dba78)  Branch

storport!RaidUnitCompleteRequest+0x199:
fffff808`de9dba69 488b07          mov     rax,qword ptr [rdi]
fffff808`de9dba6c 483bc7          cmp     rax,rdi
fffff808`de9dba6f 7519            jne     storport!RaidUnitCompleteRequest+0x1ba (fffff808`de9dba8a)  Branch

storport!RaidUnitCompleteRequest+0x1a1:
fffff808`de9dba71 c74730ffffffff  mov     dword ptr [rdi+30h],0FFFFFFFFh

storport!RaidUnitCompleteRequest+0x1a8:
fffff808`de9dba78 488d4de8        lea     rcx,[rbp-18h]
fffff808`de9dba7c 48ff15f5b80500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLockFromDpcLevel (fffff808`dea37378)]
fffff808`de9dba83 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dba88 eb39            jmp     storport!RaidUnitCompleteRequest+0x1f3 (fffff808`de9dbac3)  Branch

storport!RaidUnitCompleteRequest+0x1ba:
fffff808`de9dba8a 8b4020          mov     eax,dword ptr [rax+20h]
fffff808`de9dba8d 894730          mov     dword ptr [rdi+30h],eax
fffff808`de9dba90 ebe6            jmp     storport!RaidUnitCompleteRequest+0x1a8 (fffff808`de9dba78)  Branch

storport!RaidUnitCompleteRequest+0x1c2:
fffff808`de9dba92 b903000000      mov     ecx,3
fffff808`de9dba97 cd29            int     29h

storport!RaidUnitCompleteRequest+0x1c9:
fffff808`de9dba99 48ff1510b80500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff808`dea372b0)]
fffff808`de9dbaa0 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dbaa5 418b17          mov     edx,dword ptr [r15]
fffff808`de9dbaa8 4c8bc3          mov     r8,rbx
fffff808`de9dbaab 488bcf          mov     rcx,rdi
fffff808`de9dbaae e83d0f0300      call    storport!StorRemoveEventQueueInternal (fffff808`dea0c9f0)
fffff808`de9dbab3 488d4de8        lea     rcx,[rbp-18h]
fffff808`de9dbab7 48ff1572b50500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff808`dea37030)]
fffff808`de9dbabe 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x1f3:
fffff808`de9dbac3 803dc65d050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff808`dea31890)],0
fffff808`de9dbaca 7478            je      storport!RaidUnitCompleteRequest+0x274 (fffff808`de9dbb44)  Branch

storport!RaidUnitCompleteRequest+0x1fc:
fffff808`de9dbacc 33c0            xor     eax,eax
fffff808`de9dbace 488d5538        lea     rdx,[rbp+38h]
fffff808`de9dbad2 498bcd          mov     rcx,r13
fffff808`de9dbad5 48894538        mov     qword ptr [rbp+38h],rax
fffff808`de9dbad9 48894540        mov     qword ptr [rbp+40h],rax
fffff808`de9dbadd 48ff156cb60500  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff808`dea37150)]
fffff808`de9dbae4 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dbae9 0fb605f25c0500  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff808`dea317e2)]
fffff808`de9dbaf0 84c0            test    al,al
fffff808`de9dbaf2 790e            jns     storport!RaidUnitCompleteRequest+0x232 (fffff808`de9dbb02)  Branch

storport!RaidUnitCompleteRequest+0x224:
fffff808`de9dbaf4 4c8d4538        lea     r8,[rbp+38h]
fffff808`de9dbaf8 c644242004      mov     byte ptr [rsp+20h],4
fffff808`de9dbafd e866a90300      call    storport!McTemplateK0dud (fffff808`dea16468)

storport!RaidUnitCompleteRequest+0x232:
fffff808`de9dbb02 803d875d050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff808`dea31890)],0
fffff808`de9dbb09 7439            je      storport!RaidUnitCompleteRequest+0x274 (fffff808`de9dbb44)  Branch

storport!RaidUnitCompleteRequest+0x23b:
fffff808`de9dbb0b 0fb605cf5c0500  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff808`dea317e1)]
fffff808`de9dbb12 a801            test    al,1
fffff808`de9dbb14 740d            je      storport!RaidUnitCompleteRequest+0x253 (fffff808`de9dbb23)  Branch

storport!RaidUnitCompleteRequest+0x246:
fffff808`de9dbb16 4533c0          xor     r8d,r8d
fffff808`de9dbb19 33d2            xor     edx,edx
fffff808`de9dbb1b 498bcc          mov     rcx,r12
fffff808`de9dbb1e e835120400      call    storport!StorEtwIORequestServiceTimeEventData (fffff808`dea1cd58)

storport!RaidUnitCompleteRequest+0x253:
fffff808`de9dbb23 83be1407000000  cmp     dword ptr [rsi+714h],0
fffff808`de9dbb2a 7418            je      storport!RaidUnitCompleteRequest+0x274 (fffff808`de9dbb44)  Branch

storport!RaidUnitCompleteRequest+0x25c:
fffff808`de9dbb2c 0fb605b05c0500  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff808`dea317e3)]
fffff808`de9dbb33 a802            test    al,2
fffff808`de9dbb35 740d            je      storport!RaidUnitCompleteRequest+0x274 (fffff808`de9dbb44)  Branch

storport!RaidUnitCompleteRequest+0x267:
fffff808`de9dbb37 4533c0          xor     r8d,r8d
fffff808`de9dbb3a 33d2            xor     edx,edx
fffff808`de9dbb3c 498bcc          mov     rcx,r12
fffff808`de9dbb3f e808150400      call    storport!StorEtwLogoRequestServiceTimeEventData (fffff808`dea1d04c)

storport!RaidUnitCompleteRequest+0x274:
fffff808`de9dbb44 4533ed          xor     r13d,r13d
fffff808`de9dbb47 41807e0228      cmp     byte ptr [r14+2],28h
fffff808`de9dbb4c 0f85a5000000    jne     storport!RaidUnitCompleteRequest+0x327 (fffff808`de9dbbf7)  Branch

storport!RaidUnitCompleteRequest+0x282:
fffff808`de9dbb52 418bcd          mov     ecx,r13d
fffff808`de9dbb55 48894da0        mov     qword ptr [rbp-60h],rcx
fffff808`de9dbb59 41394e14        cmp     dword ptr [r14+14h],ecx
fffff808`de9dbb5d 0f859c000000    jne     storport!RaidUnitCompleteRequest+0x32f (fffff808`de9dbbff)  Branch

storport!RaidUnitCompleteRequest+0x293:
fffff808`de9dbb63 458b5e38        mov     r11d,dword ptr [r14+38h]
fffff808`de9dbb67 458bd5          mov     r10d,r13d
fffff808`de9dbb6a 4585db          test    r11d,r11d
fffff808`de9dbb6d 0f848c000000    je      storport!RaidUnitCompleteRequest+0x32f (fffff808`de9dbbff)  Branch

storport!RaidUnitCompleteRequest+0x2a3:
fffff808`de9dbb73 0f1f4000        nop     dword ptr [rax]
fffff808`de9dbb77 660f1f840000000000 nop   word ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x2b0:
fffff808`de9dbb80 418bc2          mov     eax,r10d
fffff808`de9dbb83 418b4c8678      mov     ecx,dword ptr [r14+rax*4+78h]
fffff808`de9dbb88 81f980000000    cmp     ecx,80h
fffff808`de9dbb8e 724e            jb      storport!RaidUnitCompleteRequest+0x30e (fffff808`de9dbbde)  Branch

storport!RaidUnitCompleteRequest+0x2c0:
fffff808`de9dbb90 418b5610        mov     edx,dword ptr [r14+10h]
fffff808`de9dbb94 3bca            cmp     ecx,edx
fffff808`de9dbb96 7346            jae     storport!RaidUnitCompleteRequest+0x30e (fffff808`de9dbbde)  Branch

storport!RaidUnitCompleteRequest+0x2c8:
fffff808`de9dbb98 4e8d0c31        lea     r9,[rcx+r14]
fffff808`de9dbb9c 448bc1          mov     r8d,ecx
fffff808`de9dbb9f 418b09          mov     ecx,dword ptr [r9]
fffff808`de9dbba2 83e940          sub     ecx,40h
fffff808`de9dbba5 742b            je      storport!RaidUnitCompleteRequest+0x302 (fffff808`de9dbbd2)  Branch

storport!RaidUnitCompleteRequest+0x2d7:
fffff808`de9dbba7 83e901          sub     ecx,1
fffff808`de9dbbaa 7420            je      storport!RaidUnitCompleteRequest+0x2fc (fffff808`de9dbbcc)  Branch

storport!RaidUnitCompleteRequest+0x2dc:
fffff808`de9dbbac 83f901          cmp     ecx,1
fffff808`de9dbbaf 752d            jne     storport!RaidUnitCompleteRequest+0x30e (fffff808`de9dbbde)  Branch

storport!RaidUnitCompleteRequest+0x2e1:
fffff808`de9dbbb1 498d4828        lea     rcx,[r8+28h]
fffff808`de9dbbb5 8bc2            mov     eax,edx
fffff808`de9dbbb7 483bca          cmp     rcx,rdx
fffff808`de9dbbba 7722            ja      storport!RaidUnitCompleteRequest+0x30e (fffff808`de9dbbde)  Branch

storport!RaidUnitCompleteRequest+0x2ec:
fffff808`de9dbbbc 418b410c        mov     eax,dword ptr [r9+0Ch]
fffff808`de9dbbc0 498d4920        lea     rcx,[r9+20h]
fffff808`de9dbbc4 85c0            test    eax,eax
fffff808`de9dbbc6 490f44cd        cmove   rcx,r13
fffff808`de9dbbca eb2f            jmp     storport!RaidUnitCompleteRequest+0x32b (fffff808`de9dbbfb)  Branch

storport!RaidUnitCompleteRequest+0x2fc:
fffff808`de9dbbcc 498d4838        lea     rcx,[r8+38h]
fffff808`de9dbbd0 eb04            jmp     storport!RaidUnitCompleteRequest+0x306 (fffff808`de9dbbd6)  Branch

storport!RaidUnitCompleteRequest+0x302:
fffff808`de9dbbd2 498d4828        lea     rcx,[r8+28h]

storport!RaidUnitCompleteRequest+0x306:
fffff808`de9dbbd6 488bc2          mov     rax,rdx
fffff808`de9dbbd9 483bca          cmp     rcx,rdx
fffff808`de9dbbdc 760d            jbe     storport!RaidUnitCompleteRequest+0x31b (fffff808`de9dbbeb)  Branch

storport!RaidUnitCompleteRequest+0x30e:
fffff808`de9dbbde 41ffc2          inc     r10d
fffff808`de9dbbe1 453bd3          cmp     r10d,r11d
fffff808`de9dbbe4 729a            jb      storport!RaidUnitCompleteRequest+0x2b0 (fffff808`de9dbb80)  Branch

storport!RaidUnitCompleteRequest+0x316:
fffff808`de9dbbe6 498bcd          mov     rcx,r13
fffff808`de9dbbe9 eb14            jmp     storport!RaidUnitCompleteRequest+0x32f (fffff808`de9dbbff)  Branch

storport!RaidUnitCompleteRequest+0x31b:
fffff808`de9dbbeb 4538690a        cmp     byte ptr [r9+0Ah],r13b
fffff808`de9dbbef 76f5            jbe     storport!RaidUnitCompleteRequest+0x316 (fffff808`de9dbbe6)  Branch

storport!RaidUnitCompleteRequest+0x321:
fffff808`de9dbbf1 498d4918        lea     rcx,[r9+18h]
fffff808`de9dbbf5 eb04            jmp     storport!RaidUnitCompleteRequest+0x32b (fffff808`de9dbbfb)  Branch

storport!RaidUnitCompleteRequest+0x327:
fffff808`de9dbbf7 498d4e48        lea     rcx,[r14+48h]

storport!RaidUnitCompleteRequest+0x32b:
fffff808`de9dbbfb 48894da0        mov     qword ptr [rbp-60h],rcx

storport!RaidUnitCompleteRequest+0x32f:
fffff808`de9dbbff 4439aeac080000  cmp     dword ptr [rsi+8ACh],r13d
fffff808`de9dbc06 7459            je      storport!RaidUnitCompleteRequest+0x391 (fffff808`de9dbc61)  Branch

storport!RaidUnitCompleteRequest+0x338:
fffff808`de9dbc08 4885c9          test    rcx,rcx
fffff808`de9dbc0b 7454            je      storport!RaidUnitCompleteRequest+0x391 (fffff808`de9dbc61)  Branch

storport!RaidUnitCompleteRequest+0x33d:
fffff808`de9dbc0d 0fb609          movzx   ecx,byte ptr [rcx]
fffff808`de9dbc10 44396c2478      cmp     dword ptr [rsp+78h],r13d
fffff808`de9dbc15 7546            jne     storport!RaidUnitCompleteRequest+0x38d (fffff808`de9dbc5d)  Branch

storport!RaidUnitCompleteRequest+0x347:
fffff808`de9dbc17 8d41f8          lea     eax,[rcx-8]
fffff808`de9dbc1a 3c3a            cmp     al,3Ah
fffff808`de9dbc1c 7713            ja      storport!RaidUnitCompleteRequest+0x361 (fffff808`de9dbc31)  Branch

storport!RaidUnitCompleteRequest+0x34e:
fffff808`de9dbc1e 0fb6c0          movzx   eax,al
fffff808`de9dbc21 48ba0500000005200004 mov rdx,400200500000005h
fffff808`de9dbc2b 480fa3c2        bt      rdx,rax
fffff808`de9dbc2f 721a            jb      storport!RaidUnitCompleteRequest+0x37b (fffff808`de9dbc4b)  Branch

storport!RaidUnitCompleteRequest+0x361:
fffff808`de9dbc31 8d4178          lea     eax,[rcx+78h]
fffff808`de9dbc34 3c22            cmp     al,22h
fffff808`de9dbc36 7725            ja      storport!RaidUnitCompleteRequest+0x38d (fffff808`de9dbc5d)  Branch

storport!RaidUnitCompleteRequest+0x368:
fffff808`de9dbc38 0fb6c0          movzx   eax,al
fffff808`de9dbc3b 48ba0502000005000000 mov rdx,500000205h
fffff808`de9dbc45 480fa3c2        bt      rdx,rax
fffff808`de9dbc49 7312            jae     storport!RaidUnitCompleteRequest+0x38d (fffff808`de9dbc5d)  Branch

storport!RaidUnitCompleteRequest+0x37b:
fffff808`de9dbc4b 884c2420        mov     byte ptr [rsp+20h],cl
fffff808`de9dbc4f 4c8bc6          mov     r8,rsi
fffff808`de9dbc52 498bcc          mov     rcx,r12
fffff808`de9dbc55 498bd6          mov     rdx,r14
fffff808`de9dbc58 e8f3f2ffff      call    storport!StorpTelemetryCollectPerfData (fffff808`de9daf50)

storport!RaidUnitCompleteRequest+0x38d:
fffff808`de9dbc5d 488b4da0        mov     rcx,qword ptr [rbp-60h]

storport!RaidUnitCompleteRequest+0x391:
fffff808`de9dbc61 44392d74560500  cmp     dword ptr [storport!g_StorpTraceLoggingErrorDataEnabled (fffff808`dea312dc)],r13d
fffff808`de9dbc68 0f84c0010000    je      storport!RaidUnitCompleteRequest+0x55e (fffff808`de9dbe2e)  Branch

storport!RaidUnitCompleteRequest+0x39e:
fffff808`de9dbc6e 4885c9          test    rcx,rcx
fffff808`de9dbc71 0f84b7010000    je      storport!RaidUnitCompleteRequest+0x55e (fffff808`de9dbe2e)  Branch

storport!RaidUnitCompleteRequest+0x3a7:
fffff808`de9dbc77 410fb65e02      movzx   ebx,byte ptr [r14+2]      ;ebx = Srb->Function
fffff808`de9dbc7c 4532e4          xor     r12b,r12b
fffff808`de9dbc7f 410fb67e03      movzx   edi,byte ptr [r14+3]      ;edi = Srb->SrbStataus
fffff808`de9dbc84 4d8bfd          mov     r15,r13                   ;R13 is zero
fffff808`de9dbc87 4c896db8        mov     qword ptr [rbp-48h],r13
fffff808`de9dbc8b 4488642471      mov     byte ptr [rsp+71h],r12b
fffff808`de9dbc90 40887c2472      mov     byte ptr [rsp+72h],dil
fffff808`de9dbc95 44886c2470      mov     byte ptr [rsp+70h],r13b
fffff808`de9dbc9a 80fb28          cmp     bl,28h
fffff808`de9dbc9d 757c            jne     storport!RaidUnitCompleteRequest+0x44b (fffff808`de9dbd1b)  Branch

storport!RaidUnitCompleteRequest+0x3cf:
fffff808`de9dbc9f 45397e14        cmp     dword ptr [r14+14h],r15d  ;if (Srb->SrbFunction != SRB_EXECUTE_SCSI) goto 0x444
fffff808`de9dbca3 756f            jne     storport!RaidUnitCompleteRequest+0x444 (fffff808`de9dbd14)  Branch

storport!RaidUnitCompleteRequest+0x3d5:
fffff808`de9dbca5 458b5e38        mov     r11d,dword ptr [r14+38h]  ;r11d = Srb->NumSrbExData
fffff808`de9dbca9 4533d2          xor     r10d,r10d
fffff808`de9dbcac 4585db          test    r11d,r11d     ;if (0==Srb->NumSrbExData) goto 0x455
fffff808`de9dbcaf 7474            je      storport!RaidUnitCompleteRequest+0x455 (fffff808`de9dbd25)  Branch

storport!RaidUnitCompleteRequest+0x3e1:
fffff808`de9dbcb1 0f1f4000        nop     dword ptr [rax]
fffff808`de9dbcb5 6666660f1f840000000000 nop word ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x3f0:
fffff808`de9dbcc0 438b4c9678      mov     ecx,dword ptr [r14+r10*4+78h]     ;ecx = Srb->SrbExDataOffset[0] , it is usually 0x98
fffff808`de9dbcc5 418bc2          mov     eax,r10d
fffff808`de9dbcc8 81f980000000    cmp     ecx,80h
fffff808`de9dbcce 722d            jb      storport!RaidUnitCompleteRequest+0x42d (fffff808`de9dbcfd)  Branch

storport!RaidUnitCompleteRequest+0x400:
fffff808`de9dbcd0 418b5610        mov     edx,dword ptr [r14+10h]   ;Srb->SrbLength
fffff808`de9dbcd4 3bca            cmp     ecx,edx
fffff808`de9dbcd6 7325            jae     storport!RaidUnitCompleteRequest+0x42d (fffff808`de9dbcfd)  Branch

storport!RaidUnitCompleteRequest+0x408:
fffff808`de9dbcd8 4e8d0c31        lea     r9,[rcx+r14]  ;取SrbEx data ptr. rcx == Srb->SrbExDataOffset[0]
fffff808`de9dbcdc 448bc1          mov     r8d,ecx
fffff808`de9dbcdf 418b09          mov     ecx,dword ptr [r9]
fffff808`de9dbce2 83e940          sub     ecx,40h
fffff808`de9dbce5 740a            je      storport!RaidUnitCompleteRequest+0x421 (fffff808`de9dbcf1)  Branch

storport!RaidUnitCompleteRequest+0x417:
fffff808`de9dbce7 83e901          sub     ecx,1
fffff808`de9dbcea 741b            je      storport!RaidUnitCompleteRequest+0x437 (fffff808`de9dbd07)  Branch

storport!RaidUnitCompleteRequest+0x41c:
fffff808`de9dbcec 83e901          sub     ecx,1
fffff808`de9dbcef 750c            jne     storport!RaidUnitCompleteRequest+0x42d (fffff808`de9dbcfd)  Branch

storport!RaidUnitCompleteRequest+0x421:
fffff808`de9dbcf1 498d4828        lea     rcx,[r8+28h]

storport!RaidUnitCompleteRequest+0x425:
fffff808`de9dbcf5 488bc2          mov     rax,rdx
fffff808`de9dbcf8 483bca          cmp     rcx,rdx
fffff808`de9dbcfb 7610            jbe     storport!RaidUnitCompleteRequest+0x43d (fffff808`de9dbd0d)  Branch

storport!RaidUnitCompleteRequest+0x42d:
fffff808`de9dbcfd 41ffc2          inc     r10d
fffff808`de9dbd00 453bd3          cmp     r10d,r11d
fffff808`de9dbd03 72bb            jb      storport!RaidUnitCompleteRequest+0x3f0 (fffff808`de9dbcc0)  Branch

storport!RaidUnitCompleteRequest+0x435:
fffff808`de9dbd05 eb1e            jmp     storport!RaidUnitCompleteRequest+0x455 (fffff808`de9dbd25)  Branch

storport!RaidUnitCompleteRequest+0x437:
fffff808`de9dbd07 498d4838        lea     rcx,[r8+38h]
fffff808`de9dbd0b ebe8            jmp     storport!RaidUnitCompleteRequest+0x425 (fffff808`de9dbcf5)  Branch

storport!RaidUnitCompleteRequest+0x43d:
fffff808`de9dbd0d 450fb66908      movzx   r13d,byte ptr [r9+8]
fffff808`de9dbd12 eb0c            jmp     storport!RaidUnitCompleteRequest+0x450 (fffff808`de9dbd20)  Branch

storport!RaidUnitCompleteRequest+0x444:
fffff808`de9dbd14 4532ed          xor     r13b,r13b
fffff808`de9dbd17 b328            mov     bl,28h
fffff808`de9dbd19 eb05            jmp     storport!RaidUnitCompleteRequest+0x450 (fffff808`de9dbd20)  Branch

storport!RaidUnitCompleteRequest+0x44b:
fffff808`de9dbd1b 450fb66e04      movzx   r13d,byte ptr [r14+4]

storport!RaidUnitCompleteRequest+0x450:
fffff808`de9dbd20 44886c2470      mov     byte ptr [rsp+70h],r13b

storport!RaidUnitCompleteRequest+0x455:
fffff808`de9dbd25 4080e73f        and     dil,3Fh
fffff808`de9dbd29 80fb28          cmp     bl,28h
fffff808`de9dbd2c 0f8591000000    jne     storport!RaidUnitCompleteRequest+0x4f3 (fffff808`de9dbdc3)  Branch

storport!RaidUnitCompleteRequest+0x462:
fffff808`de9dbd32 45397e14        cmp     dword ptr [r14+14h],r15d
fffff808`de9dbd36 0f8582000000    jne     storport!RaidUnitCompleteRequest+0x4ee (fffff808`de9dbdbe)  Branch

storport!RaidUnitCompleteRequest+0x46c:
fffff808`de9dbd3c 458b5e38        mov     r11d,dword ptr [r14+38h]
fffff808`de9dbd40 4533d2          xor     r10d,r10d
fffff808`de9dbd43 4585db          test    r11d,r11d
fffff808`de9dbd46 0f848d000000    je      storport!RaidUnitCompleteRequest+0x509 (fffff808`de9dbdd9)  Branch

storport!RaidUnitCompleteRequest+0x47c:
fffff808`de9dbd4c 0f1f4000        nop     dword ptr [rax]

storport!RaidUnitCompleteRequest+0x480:
fffff808`de9dbd50 438b4c9678      mov     ecx,dword ptr [r14+r10*4+78h]
fffff808`de9dbd55 418bc2          mov     eax,r10d
fffff808`de9dbd58 81f980000000    cmp     ecx,80h
fffff808`de9dbd5e 7249            jb      storport!RaidUnitCompleteRequest+0x4d9 (fffff808`de9dbda9)  Branch

storport!RaidUnitCompleteRequest+0x490:
fffff808`de9dbd60 418b5610        mov     edx,dword ptr [r14+10h]
fffff808`de9dbd64 3bca            cmp     ecx,edx
fffff808`de9dbd66 7341            jae     storport!RaidUnitCompleteRequest+0x4d9 (fffff808`de9dbda9)  Branch

storport!RaidUnitCompleteRequest+0x498:
fffff808`de9dbd68 4e8d0c31        lea     r9,[rcx+r14]
fffff808`de9dbd6c 448bc1          mov     r8d,ecx
fffff808`de9dbd6f 418b09          mov     ecx,dword ptr [r9]
fffff808`de9dbd72 83e940          sub     ecx,40h
fffff808`de9dbd75 7426            je      storport!RaidUnitCompleteRequest+0x4cd (fffff808`de9dbd9d)  Branch

storport!RaidUnitCompleteRequest+0x4a7:
fffff808`de9dbd77 83e901          sub     ecx,1
fffff808`de9dbd7a 741b            je      storport!RaidUnitCompleteRequest+0x4c7 (fffff808`de9dbd97)  Branch

storport!RaidUnitCompleteRequest+0x4ac:
fffff808`de9dbd7c 83e901          sub     ecx,1
fffff808`de9dbd7f 7528            jne     storport!RaidUnitCompleteRequest+0x4d9 (fffff808`de9dbda9)  Branch

storport!RaidUnitCompleteRequest+0x4b1:
fffff808`de9dbd81 498d4828        lea     rcx,[r8+28h]
fffff808`de9dbd85 8bc2            mov     eax,edx
fffff808`de9dbd87 483bca          cmp     rcx,rdx
fffff808`de9dbd8a 771d            ja      storport!RaidUnitCompleteRequest+0x4d9 (fffff808`de9dbda9)  Branch

storport!RaidUnitCompleteRequest+0x4bc:
fffff808`de9dbd8c 4d8b7918        mov     r15,qword ptr [r9+18h]
fffff808`de9dbd90 450fb66109      movzx   r12d,byte ptr [r9+9]
fffff808`de9dbd95 eb39            jmp     storport!RaidUnitCompleteRequest+0x500 (fffff808`de9dbdd0)  Branch

storport!RaidUnitCompleteRequest+0x4c7:
fffff808`de9dbd97 498d4838        lea     rcx,[r8+38h]
fffff808`de9dbd9b eb04            jmp     storport!RaidUnitCompleteRequest+0x4d1 (fffff808`de9dbda1)  Branch

storport!RaidUnitCompleteRequest+0x4cd:
fffff808`de9dbd9d 498d4828        lea     rcx,[r8+28h]

storport!RaidUnitCompleteRequest+0x4d1:
fffff808`de9dbda1 488bc2          mov     rax,rdx
fffff808`de9dbda4 483bca          cmp     rcx,rdx
fffff808`de9dbda7 760a            jbe     storport!RaidUnitCompleteRequest+0x4e3 (fffff808`de9dbdb3)  Branch

storport!RaidUnitCompleteRequest+0x4d9:
fffff808`de9dbda9 41ffc2          inc     r10d
fffff808`de9dbdac 453bd3          cmp     r10d,r11d
fffff808`de9dbdaf 729f            jb      storport!RaidUnitCompleteRequest+0x480 (fffff808`de9dbd50)  Branch

storport!RaidUnitCompleteRequest+0x4e1:
fffff808`de9dbdb1 eb26            jmp     storport!RaidUnitCompleteRequest+0x509 (fffff808`de9dbdd9)  Branch

storport!RaidUnitCompleteRequest+0x4e3:
fffff808`de9dbdb3 4d8b7910        mov     r15,qword ptr [r9+10h]
fffff808`de9dbdb7 450fb66109      movzx   r12d,byte ptr [r9+9]
fffff808`de9dbdbc eb12            jmp     storport!RaidUnitCompleteRequest+0x500 (fffff808`de9dbdd0)  Branch

storport!RaidUnitCompleteRequest+0x4ee:
fffff808`de9dbdbe 4532e4          xor     r12b,r12b
fffff808`de9dbdc1 eb0d            jmp     storport!RaidUnitCompleteRequest+0x500 (fffff808`de9dbdd0)  Branch

storport!RaidUnitCompleteRequest+0x4f3:
fffff808`de9dbdc3 84db            test    bl,bl
fffff808`de9dbdc5 7512            jne     storport!RaidUnitCompleteRequest+0x509 (fffff808`de9dbdd9)  Branch

storport!RaidUnitCompleteRequest+0x4f7:
fffff808`de9dbdc7 4d8b7e20        mov     r15,qword ptr [r14+20h]
fffff808`de9dbdcb 450fb6660b      movzx   r12d,byte ptr [r14+0Bh]

storport!RaidUnitCompleteRequest+0x500:
fffff808`de9dbdd0 4c897db8        mov     qword ptr [rbp-48h],r15
fffff808`de9dbdd4 4488642471      mov     byte ptr [rsp+71h],r12b

storport!RaidUnitCompleteRequest+0x509:
fffff808`de9dbdd9 807c247200      cmp     byte ptr [rsp+72h],0
fffff808`de9dbdde 0f8d87010000    jge     storport!RaidUnitCompleteRequest+0x69b (fffff808`de9dbf6b)  Branch

storport!RaidUnitCompleteRequest+0x514:
fffff808`de9dbde4 4d85ff          test    r15,r15
fffff808`de9dbde7 7420            je      storport!RaidUnitCompleteRequest+0x539 (fffff808`de9dbe09)  Branch

storport!RaidUnitCompleteRequest+0x519:
fffff808`de9dbde9 4180fc08        cmp     r12b,8
fffff808`de9dbded 721a            jb      storport!RaidUnitCompleteRequest+0x539 (fffff808`de9dbe09)  Branch

storport!RaidUnitCompleteRequest+0x51f:
fffff808`de9dbdef 410fb607        movzx   eax,byte ptr [r15]
fffff808`de9dbdf3 247f            and     al,7Fh
fffff808`de9dbdf5 2c70            sub     al,70h
fffff808`de9dbdf7 3c01            cmp     al,1
fffff808`de9dbdf9 770e            ja      storport!RaidUnitCompleteRequest+0x539 (fffff808`de9dbe09)  Branch

storport!RaidUnitCompleteRequest+0x52b:
fffff808`de9dbdfb 410fb64702      movzx   eax,byte ptr [r15+2]
fffff808`de9dbe00 410fb64f0c      movzx   ecx,byte ptr [r15+0Ch]
fffff808`de9dbe05 240f            and     al,0Fh
fffff808`de9dbe07 eb04            jmp     storport!RaidUnitCompleteRequest+0x53d (fffff808`de9dbe0d)  Branch

storport!RaidUnitCompleteRequest+0x539:
fffff808`de9dbe09 32c0            xor     al,al
fffff808`de9dbe0b 32c9            xor     cl,cl

storport!RaidUnitCompleteRequest+0x53d:
fffff808`de9dbe0d 4080ff01        cmp     dil,1
fffff808`de9dbe11 0f856e010000    jne     storport!RaidUnitCompleteRequest+0x6b5 (fffff808`de9dbf85)  Branch

storport!RaidUnitCompleteRequest+0x547:
fffff808`de9dbe17 84c0            test    al,al
fffff808`de9dbe19 0f8566010000    jne     storport!RaidUnitCompleteRequest+0x6b5 (fffff808`de9dbf85)  Branch

storport!RaidUnitCompleteRequest+0x54f:
fffff808`de9dbe1f 84c9            test    cl,cl
fffff808`de9dbe21 0f855e010000    jne     storport!RaidUnitCompleteRequest+0x6b5 (fffff808`de9dbf85)  Branch

storport!RaidUnitCompleteRequest+0x557:
fffff808`de9dbe27 4c8b65a8        mov     r12,qword ptr [rbp-58h]
fffff808`de9dbe2b 4533ed          xor     r13d,r13d

storport!RaidUnitCompleteRequest+0x55e:
fffff808`de9dbe2e 488b5d98        mov     rbx,qword ptr [rbp-68h]

storport!RaidUnitCompleteRequest+0x562:
fffff808`de9dbe32 41f644241102    test    byte ptr [r12+11h],2
fffff808`de9dbe38 7416            je      storport!RaidUnitCompleteRequest+0x580 (fffff808`de9dbe50)  Branch

storport!RaidUnitCompleteRequest+0x56a:
fffff808`de9dbe3a 418b9424ec020000 mov     edx,dword ptr [r12+2ECh]
fffff808`de9dbe42 488bce          mov     rcx,rsi
fffff808`de9dbe45 e866f60200      call    storport!RaidUnitPoFxIdleComponentFromMiniport (fffff808`dea0b4b0)
fffff808`de9dbe4a 4180642411fd    and     byte ptr [r12+11h],0FDh

storport!RaidUnitCompleteRequest+0x580:
fffff808`de9dbe50 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff808`de9dbe57 0fb65810        movzx   ebx,byte ptr [rax+10h]
fffff808`de9dbe5b 4c896810        mov     qword ptr [rax+10h],r13
fffff808`de9dbe5f 80e303          and     bl,3
fffff808`de9dbe62 488b7e18        mov     rdi,qword ptr [rsi+18h]
fffff808`de9dbe66 0fb6c3          movzx   eax,bl
fffff808`de9dbe69 2401            and     al,1
fffff808`de9dbe6b 744e            je      storport!RaidUnitCompleteRequest+0x5eb (fffff808`de9dbebb)  Branch

storport!RaidUnitCompleteRequest+0x59d:
fffff808`de9dbe6d 80bec101000000  cmp     byte ptr [rsi+1C1h],0
fffff808`de9dbe74 7d45            jge     storport!RaidUnitCompleteRequest+0x5eb (fffff808`de9dbebb)  Branch

storport!RaidUnitCompleteRequest+0x5a6:
fffff808`de9dbe76 488b8ec8060000  mov     rcx,qword ptr [rsi+6C8h]
fffff808`de9dbe7d 48ff15fcb20500  call    qword ptr [storport!_imp_ExAcquireRundownProtectionCacheAware (fffff808`dea37180)]
fffff808`de9dbe84 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dbe89 84c0            test    al,al
fffff808`de9dbe8b 742e            je      storport!RaidUnitCompleteRequest+0x5eb (fffff808`de9dbebb)  Branch

storport!RaidUnitCompleteRequest+0x5bd:
fffff808`de9dbe8d 488b8ed0060000  mov     rcx,qword ptr [rsi+6D0h]
fffff808`de9dbe94 4533c0          xor     r8d,r8d
fffff808`de9dbe97 33d2            xor     edx,edx
fffff808`de9dbe99 488b09          mov     rcx,qword ptr [rcx]
fffff808`de9dbe9c 48ff1565b20500  call    qword ptr [storport!_imp_PoFxIdleComponent (fffff808`dea37108)]
fffff808`de9dbea3 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dbea8 488b8ec8060000  mov     rcx,qword ptr [rsi+6C8h]
fffff808`de9dbeaf 48ff15dab30500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff808`dea37290)]
fffff808`de9dbeb6 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x5eb:
fffff808`de9dbebb 80fb02          cmp     bl,2
fffff808`de9dbebe 7220            jb      storport!RaidUnitCompleteRequest+0x610 (fffff808`de9dbee0)  Branch

storport!RaidUnitCompleteRequest+0x5f0:
fffff808`de9dbec0 488b8f20140000  mov     rcx,qword ptr [rdi+1420h]
fffff808`de9dbec7 4885c9          test    rcx,rcx
fffff808`de9dbeca 7414            je      storport!RaidUnitCompleteRequest+0x610 (fffff808`de9dbee0)  Branch

storport!RaidUnitCompleteRequest+0x5fc:
fffff808`de9dbecc 488b09          mov     rcx,qword ptr [rcx]
fffff808`de9dbecf 4533c0          xor     r8d,r8d
fffff808`de9dbed2 33d2            xor     edx,edx
fffff808`de9dbed4 48ff152db20500  call    qword ptr [storport!_imp_PoFxIdleComponent (fffff808`dea37108)]
fffff808`de9dbedb 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x610:
fffff808`de9dbee0 48ff15a1b20500  call    qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff808`dea37188)]
fffff808`de9dbee7 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dbeec 8b4d84          mov     ecx,dword ptr [rbp-7Ch]
fffff808`de9dbeef 33d2            xor     edx,edx
fffff808`de9dbef1 440fb7c0        movzx   r8d,ax
fffff808`de9dbef5 8bc1            mov     eax,ecx
fffff808`de9dbef7 f7b648020000    div     eax,dword ptr [rsi+248h]
fffff808`de9dbefd 8bd1            mov     edx,ecx
fffff808`de9dbeff 418d4801        lea     ecx,[r8+1]
fffff808`de9dbf03 48c1e204        shl     rdx,4
fffff808`de9dbf07 48039640020000  add     rdx,qword ptr [rsi+240h]
fffff808`de9dbf0e 3bc1            cmp     eax,ecx
fffff808`de9dbf10 440f42c0        cmovb   r8d,eax
fffff808`de9dbf14 418bc8          mov     ecx,r8d
fffff808`de9dbf17 48c1e106        shl     rcx,6
fffff808`de9dbf1b 48038e00020000  add     rcx,qword ptr [rsi+200h]
fffff808`de9dbf22 48ff15a7b10500  call    qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff808`dea370d0)]
fffff808`de9dbf29 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dbf2e 8b4c247c        mov     ecx,dword ptr [rsp+7Ch]
fffff808`de9dbf32 bf01000000      mov     edi,1
fffff808`de9dbf37 8bc1            mov     eax,ecx
fffff808`de9dbf39 2502010000      and     eax,102h
fffff808`de9dbf3e 3d02010000      cmp     eax,102h
fffff808`de9dbf43 7461            je      storport!RaidUnitCompleteRequest+0x6d6 (fffff808`de9dbfa6)  Branch

storport!RaidUnitCompleteRequest+0x675:
fffff808`de9dbf45 f7c110000800    test    ecx,80010h
fffff808`de9dbf4b 7559            jne     storport!RaidUnitCompleteRequest+0x6d6 (fffff808`de9dbfa6)  Branch

storport!RaidUnitCompleteRequest+0x67d:
fffff808`de9dbf4d 8b442478        mov     eax,dword ptr [rsp+78h]
fffff808`de9dbf51 83f820          cmp     eax,20h
fffff808`de9dbf54 7710            ja      storport!RaidUnitCompleteRequest+0x696 (fffff808`de9dbf66)  Branch

storport!RaidUnitCompleteRequest+0x686:
fffff808`de9dbf56 48b900000d0001000000 mov rcx,1000D0000h
fffff808`de9dbf60 480fa3c1        bt      rcx,rax
fffff808`de9dbf64 7240            jb      storport!RaidUnitCompleteRequest+0x6d6 (fffff808`de9dbfa6)  Branch

storport!RaidUnitCompleteRequest+0x696:
fffff808`de9dbf66 897d84          mov     dword ptr [rbp-7Ch],edi
fffff808`de9dbf69 eb3f            jmp     storport!RaidUnitCompleteRequest+0x6da (fffff808`de9dbfaa)  Branch

storport!RaidUnitCompleteRequest+0x69b:
fffff808`de9dbf6b 4180fd02        cmp     r13b,2    
fffff808`de9dbf6f 7414            je      storport!RaidUnitCompleteRequest+0x6b5 (fffff808`de9dbf85)  Branch

storport!RaidUnitCompleteRequest+0x6a1:
fffff808`de9dbf71 4080ff12        cmp     dil,12h
fffff808`de9dbf75 770e            ja      storport!RaidUnitCompleteRequest+0x6b5 (fffff808`de9dbf85)  Branch

storport!RaidUnitCompleteRequest+0x6a7:
fffff808`de9dbf77 b943000400      mov     ecx,40043h
fffff808`de9dbf7c 0fa3f9          bt      ecx,edi
fffff808`de9dbf7f 0f82a2feffff    jb      storport!RaidUnitCompleteRequest+0x557 (fffff808`de9dbe27)  Branch

storport!RaidUnitCompleteRequest+0x6b5:
fffff808`de9dbf85 4c8b65a8        mov     r12,qword ptr [rbp-58h]
fffff808`de9dbf89 4d8bce          mov     r9,r14
fffff808`de9dbf8c 488b5d98        mov     rbx,qword ptr [rbp-68h]
fffff808`de9dbf90 4d8bc4          mov     r8,r12
fffff808`de9dbf93 488bd3          mov     rdx,rbx
fffff808`de9dbf96 488bce          mov     rcx,rsi
fffff808`de9dbf99 e8dac8ffff      call    storport!StorpTelemetryCollectErrorData (fffff808`de9d8878)
fffff808`de9dbf9e 4533ed          xor     r13d,r13d
fffff808`de9dbfa1 e98cfeffff      jmp     storport!RaidUnitCompleteRequest+0x562 (fffff808`de9dbe32)  Branch

storport!RaidUnitCompleteRequest+0x6d6:
fffff808`de9dbfa6 44896d84        mov     dword ptr [rbp-7Ch],r13d

storport!RaidUnitCompleteRequest+0x6da:
fffff808`de9dbfaa f686c201000002  test    byte ptr [rsi+1C2h],2
fffff808`de9dbfb1 0f8495000000    je      storport!RaidUnitCompleteRequest+0x77c (fffff808`de9dc04c)  Branch

storport!RaidUnitCompleteRequest+0x6e7:
fffff808`de9dbfb7 498bce          mov     rcx,r14
fffff808`de9dbfba e8a5130300      call    storport!RaidIsUnresponsiveBlockedCmd (fffff808`dea0d364)
fffff808`de9dbfbf 84c0            test    al,al
fffff808`de9dbfc1 0f8485000000    je      storport!RaidUnitCompleteRequest+0x77c (fffff808`de9dc04c)  Branch

storport!RaidUnitCompleteRequest+0x6f7:
fffff808`de9dbfc7 41807e0228      cmp     byte ptr [r14+2],28h
fffff808`de9dbfcc 41c6460338      mov     byte ptr [r14+3],38h
fffff808`de9dbfd1 756c            jne     storport!RaidUnitCompleteRequest+0x76f (fffff808`de9dc03f)  Branch

storport!RaidUnitCompleteRequest+0x703:
fffff808`de9dbfd3 41837e1400      cmp     dword ptr [r14+14h],0
fffff808`de9dbfd8 756a            jne     storport!RaidUnitCompleteRequest+0x774 (fffff808`de9dc044)  Branch

storport!RaidUnitCompleteRequest+0x70a:
fffff808`de9dbfda 458b5e38        mov     r11d,dword ptr [r14+38h]
fffff808`de9dbfde 458bcd          mov     r9d,r13d
fffff808`de9dbfe1 4585db          test    r11d,r11d
fffff808`de9dbfe4 745e            je      storport!RaidUnitCompleteRequest+0x774 (fffff808`de9dc044)  Branch

storport!RaidUnitCompleteRequest+0x716:
fffff808`de9dbfe6 66660f1f840000000000 nop word ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x720:
fffff808`de9dbff0 418bc1          mov     eax,r9d
fffff808`de9dbff3 418b4c8678      mov     ecx,dword ptr [r14+rax*4+78h]
fffff808`de9dbff8 81f980000000    cmp     ecx,80h
fffff808`de9dbffe 7228            jb      storport!RaidUnitCompleteRequest+0x758 (fffff808`de9dc028)  Branch

storport!RaidUnitCompleteRequest+0x730:
fffff808`de9dc000 418b5610        mov     edx,dword ptr [r14+10h]
fffff808`de9dc004 3bca            cmp     ecx,edx
fffff808`de9dc006 7320            jae     storport!RaidUnitCompleteRequest+0x758 (fffff808`de9dc028)  Branch

storport!RaidUnitCompleteRequest+0x738:
fffff808`de9dc008 4e8d1431        lea     r10,[rcx+r14]
fffff808`de9dc00c 448bc1          mov     r8d,ecx
fffff808`de9dc00f 418b0a          mov     ecx,dword ptr [r10]
fffff808`de9dc012 83e940          sub     ecx,40h
fffff808`de9dc015 7408            je      storport!RaidUnitCompleteRequest+0x74f (fffff808`de9dc01f)  Branch

storport!RaidUnitCompleteRequest+0x747:
fffff808`de9dc017 2bcf            sub     ecx,edi
fffff808`de9dc019 7417            je      storport!RaidUnitCompleteRequest+0x762 (fffff808`de9dc032)  Branch

storport!RaidUnitCompleteRequest+0x74b:
fffff808`de9dc01b 3bcf            cmp     ecx,edi
fffff808`de9dc01d 7509            jne     storport!RaidUnitCompleteRequest+0x758 (fffff808`de9dc028)  Branch

storport!RaidUnitCompleteRequest+0x74f:
fffff808`de9dc01f 498d4828        lea     rcx,[r8+28h]

storport!RaidUnitCompleteRequest+0x753:
fffff808`de9dc023 483bca          cmp     rcx,rdx
fffff808`de9dc026 7610            jbe     storport!RaidUnitCompleteRequest+0x768 (fffff808`de9dc038)  Branch

storport!RaidUnitCompleteRequest+0x758:
fffff808`de9dc028 41ffc1          inc     r9d
fffff808`de9dc02b 453bcb          cmp     r9d,r11d
fffff808`de9dc02e 72c0            jb      storport!RaidUnitCompleteRequest+0x720 (fffff808`de9dbff0)  Branch

storport!RaidUnitCompleteRequest+0x760:
fffff808`de9dc030 eb12            jmp     storport!RaidUnitCompleteRequest+0x774 (fffff808`de9dc044)  Branch

storport!RaidUnitCompleteRequest+0x762:
fffff808`de9dc032 498d4838        lea     rcx,[r8+38h]
fffff808`de9dc036 ebeb            jmp     storport!RaidUnitCompleteRequest+0x753 (fffff808`de9dc023)  Branch

storport!RaidUnitCompleteRequest+0x768:
fffff808`de9dc038 41c6420800      mov     byte ptr [r10+8],0
fffff808`de9dc03d eb05            jmp     storport!RaidUnitCompleteRequest+0x774 (fffff808`de9dc044)  Branch

storport!RaidUnitCompleteRequest+0x76f:
fffff808`de9dc03f 41c6460400      mov     byte ptr [r14+4],0

storport!RaidUnitCompleteRequest+0x774:
fffff808`de9dc044 f048ff8620080000 lock inc qword ptr [rsi+820h]

storport!RaidUnitCompleteRequest+0x77c:
fffff808`de9dc04c 410fb64603      movzx   eax,byte ptr [r14+3]
fffff808`de9dc051 49c7c7ffffffff  mov     r15,0FFFFFFFFFFFFFFFFh
fffff808`de9dc058 243f            and     al,3Fh
fffff808`de9dc05a 403ac7          cmp     al,dil
fffff808`de9dc05d 0f85b4080000    jne     storport!RaidUnitCompleteRequest+0x1047 (fffff808`de9dc917)  Branch

storport!RaidUnitCompleteRequest+0x793:
fffff808`de9dc063 488b45a0        mov     rax,qword ptr [rbp-60h]
fffff808`de9dc067 4532e4          xor     r12b,r12b
fffff808`de9dc06a 448964247c      mov     dword ptr [rsp+7Ch],r12d
fffff808`de9dc06f 4885c0          test    rax,rax
fffff808`de9dc072 744e            je      storport!RaidUnitCompleteRequest+0x7f2 (fffff808`de9dc0c2)  Branch

storport!RaidUnitCompleteRequest+0x7a4:
fffff808`de9dc074 80381d          cmp     byte ptr [rax],1Dh
fffff808`de9dc077 7549            jne     storport!RaidUnitCompleteRequest+0x7f2 (fffff808`de9dc0c2)  Branch

storport!RaidUnitCompleteRequest+0x7a9:
fffff808`de9dc079 41807e0228      cmp     byte ptr [r14+2],28h
fffff808`de9dc07e 7506            jne     storport!RaidUnitCompleteRequest+0x7b6 (fffff808`de9dc086)  Branch

storport!RaidUnitCompleteRequest+0x7b0:
fffff808`de9dc080 498b5e40        mov     rbx,qword ptr [r14+40h]
fffff808`de9dc084 eb04            jmp     storport!RaidUnitCompleteRequest+0x7ba (fffff808`de9dc08a)  Branch

storport!RaidUnitCompleteRequest+0x7b6:
fffff808`de9dc086 498b5e18        mov     rbx,qword ptr [r14+18h]

storport!RaidUnitCompleteRequest+0x7ba:
fffff808`de9dc08a 4885db          test    rbx,rbx
fffff808`de9dc08d 7433            je      storport!RaidUnitCompleteRequest+0x7f2 (fffff808`de9dc0c2)  Branch

storport!RaidUnitCompleteRequest+0x7bf:
fffff808`de9dc08f 488bcb          mov     rcx,rbx
fffff808`de9dc092 48ff1577b50500  call    qword ptr [storport!_imp_MmIsAddressValid (fffff808`dea37610)]
fffff808`de9dc099 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc09e 84c0            test    al,al
fffff808`de9dc0a0 8b4588          mov     eax,dword ptr [rbp-78h]
fffff808`de9dc0a3 7420            je      storport!RaidUnitCompleteRequest+0x7f5 (fffff808`de9dc0c5)  Branch

storport!RaidUnitCompleteRequest+0x7d5:
fffff808`de9dc0a5 83f809          cmp     eax,9
fffff808`de9dc0a8 721b            jb      storport!RaidUnitCompleteRequest+0x7f5 (fffff808`de9dc0c5)  Branch

storport!RaidUnitCompleteRequest+0x7da:
fffff808`de9dc0aa 803b0e          cmp     byte ptr [rbx],0Eh
fffff808`de9dc0ad 7516            jne     storport!RaidUnitCompleteRequest+0x7f5 (fffff808`de9dc0c5)  Branch

storport!RaidUnitCompleteRequest+0x7df:
fffff808`de9dc0af 807b080f        cmp     byte ptr [rbx+8],0Fh
fffff808`de9dc0b3 450fb6e4        movzx   r12d,r12b
fffff808`de9dc0b7 440f44e7        cmove   r12d,edi
fffff808`de9dc0bb 448964247c      mov     dword ptr [rsp+7Ch],r12d
fffff808`de9dc0c0 eb03            jmp     storport!RaidUnitCompleteRequest+0x7f5 (fffff808`de9dc0c5)  Branch

storport!RaidUnitCompleteRequest+0x7f2:
fffff808`de9dc0c2 8b4588          mov     eax,dword ptr [rbp-78h]

storport!RaidUnitCompleteRequest+0x7f5:
fffff808`de9dc0c5 488b4d98        mov     rcx,qword ptr [rbp-68h]
fffff808`de9dc0c9 48894138        mov     qword ptr [rcx+38h],rax
fffff808`de9dc0cd 488b81b8000000  mov     rax,qword ptr [rcx+0B8h]
fffff808`de9dc0d4 44896930        mov     dword ptr [rcx+30h],r13d
fffff808`de9dc0d8 488b7808        mov     rdi,qword ptr [rax+8]
fffff808`de9dc0dc 0fb64702        movzx   eax,byte ptr [rdi+2]
fffff808`de9dc0e0 3c28            cmp     al,28h
fffff808`de9dc0e2 7506            jne     storport!RaidUnitCompleteRequest+0x81a (fffff808`de9dc0ea)  Branch

storport!RaidUnitCompleteRequest+0x814:
fffff808`de9dc0e4 488b5f60        mov     rbx,qword ptr [rdi+60h]
fffff808`de9dc0e8 eb04            jmp     storport!RaidUnitCompleteRequest+0x81e (fffff808`de9dc0ee)  Branch

storport!RaidUnitCompleteRequest+0x81a:
fffff808`de9dc0ea 488b5f30        mov     rbx,qword ptr [rdi+30h]

storport!RaidUnitCompleteRequest+0x81e:
fffff808`de9dc0ee 4c8babe0000000  mov     r13,qword ptr [rbx+0E0h]
fffff808`de9dc0f5 3c28            cmp     al,28h
fffff808`de9dc0f7 7506            jne     storport!RaidUnitCompleteRequest+0x82f (fffff808`de9dc0ff)  Branch

storport!RaidUnitCompleteRequest+0x829:
fffff808`de9dc0f9 488b5760        mov     rdx,qword ptr [rdi+60h]
fffff808`de9dc0fd eb04            jmp     storport!RaidUnitCompleteRequest+0x833 (fffff808`de9dc103)  Branch

storport!RaidUnitCompleteRequest+0x82f:
fffff808`de9dc0ff 488b5730        mov     rdx,qword ptr [rdi+30h]

storport!RaidUnitCompleteRequest+0x833:
fffff808`de9dc103 f6421002        test    byte ptr [rdx+10h],2
fffff808`de9dc107 7450            je      storport!RaidUnitCompleteRequest+0x889 (fffff808`de9dc159)  Branch

storport!RaidUnitCompleteRequest+0x839:
fffff808`de9dc109 498b8df8010000  mov     rcx,qword ptr [r13+1F8h]
fffff808`de9dc110 4883c230        add     rdx,30h
fffff808`de9dc114 e82b080300      call    storport!StorRemoveEventQueue (fffff808`dea0c944)
fffff808`de9dc119 803d7057050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff808`dea31890)],0
fffff808`de9dc120 7437            je      storport!RaidUnitCompleteRequest+0x889 (fffff808`de9dc159)  Branch

storport!RaidUnitCompleteRequest+0x852:
fffff808`de9dc122 488b4d98        mov     rcx,qword ptr [rbp-68h]
fffff808`de9dc126 488d5548        lea     rdx,[rbp+48h]
fffff808`de9dc12a 33c0            xor     eax,eax
fffff808`de9dc12c 48894548        mov     qword ptr [rbp+48h],rax
fffff808`de9dc130 48894550        mov     qword ptr [rbp+50h],rax
fffff808`de9dc134 48ff1515b00500  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff808`dea37150)]
fffff808`de9dc13b 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc140 0fb6059b560500  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff808`dea317e2)]
fffff808`de9dc147 84c0            test    al,al
fffff808`de9dc149 790e            jns     storport!RaidUnitCompleteRequest+0x889 (fffff808`de9dc159)  Branch

storport!RaidUnitCompleteRequest+0x87b:
fffff808`de9dc14b 4c8d4548        lea     r8,[rbp+48h]
fffff808`de9dc14f c644242004      mov     byte ptr [rsp+20h],4
fffff808`de9dc154 e80fa30300      call    storport!McTemplateK0dud (fffff808`dea16468)

storport!RaidUnitCompleteRequest+0x889:
fffff808`de9dc159 498b5518        mov     rdx,qword ptr [r13+18h]
fffff808`de9dc15d 488bcb          mov     rcx,rbx
fffff808`de9dc160 488b5208        mov     rdx,qword ptr [rdx+8]
fffff808`de9dc164 e8370e0000      call    storport!StorUnmapSenseInfo (fffff808`de9dcfa0)
fffff808`de9dc169 498b4d18        mov     rcx,qword ptr [r13+18h]
fffff808`de9dc16d 4883b98816000000 cmp     qword ptr [rcx+1688h],0
fffff808`de9dc175 7408            je      storport!RaidUnitCompleteRequest+0x8af (fffff808`de9dc17f)  Branch

storport!RaidUnitCompleteRequest+0x8a7:
fffff808`de9dc177 488bd3          mov     rdx,rbx
fffff808`de9dc17a e899c90200      call    storport!RaidAdapterReleaseCryptoKeyResources (fffff808`dea08b18)

storport!RaidUnitCompleteRequest+0x8af:
fffff808`de9dc17f 807f0228        cmp     byte ptr [rdi+2],28h
fffff808`de9dc183 0f85aa000000    jne     storport!RaidUnitCompleteRequest+0x963 (fffff808`de9dc233)  Branch

storport!RaidUnitCompleteRequest+0x8b9:
fffff808`de9dc189 f6431040        test    byte ptr [rbx+10h],40h
fffff808`de9dc18d 746e            je      storport!RaidUnitCompleteRequest+0x92d (fffff808`de9dc1fd)  Branch

storport!RaidUnitCompleteRequest+0x8bf:
fffff808`de9dc18f 488b8bf0020000  mov     rcx,qword ptr [rbx+2F0h]
fffff808`de9dc196 488bd7          mov     rdx,rdi
fffff808`de9dc199 e8e6670100      call    storport!TranslateResultToScsiRequestBlock (fffff808`de9f2984)
fffff808`de9dc19e 488b8bf0020000  mov     rcx,qword ptr [rbx+2F0h]
fffff808`de9dc1a5 33ff            xor     edi,edi
fffff808`de9dc1a7 488b83b0000000  mov     rax,qword ptr [rbx+0B0h]
fffff808`de9dc1ae 48894130        mov     qword ptr [rcx+30h],rax
fffff808`de9dc1b2 488b8bf0020000  mov     rcx,qword ptr [rbx+2F0h]
fffff808`de9dc1b9 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff808`de9dc1c0 48894118        mov     qword ptr [rcx+18h],rax
fffff808`de9dc1c4 488b83f0020000  mov     rax,qword ptr [rbx+2F0h]
fffff808`de9dc1cb 48897838        mov     qword ptr [rax+38h],rdi
fffff808`de9dc1cf 488b83f0020000  mov     rax,qword ptr [rbx+2F0h]
fffff808`de9dc1d6 48897828        mov     qword ptr [rax+28h],rdi
fffff808`de9dc1da 488b4598        mov     rax,qword ptr [rbp-68h]
fffff808`de9dc1de 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff808`de9dc1e5 488b83f0020000  mov     rax,qword ptr [rbx+2F0h]
fffff808`de9dc1ec 48894108        mov     qword ptr [rcx+8],rax
fffff808`de9dc1f0 806310bf        and     byte ptr [rbx+10h],0BFh
fffff808`de9dc1f4 4889bbf0020000  mov     qword ptr [rbx+2F0h],rdi
fffff808`de9dc1fb eb61            jmp     storport!RaidUnitCompleteRequest+0x98e (fffff808`de9dc25e)  Branch

storport!RaidUnitCompleteRequest+0x92d:
fffff808`de9dc1fd 33c9            xor     ecx,ecx
fffff808`de9dc1ff 48894f60        mov     qword ptr [rdi+60h],rcx
fffff808`de9dc203 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff808`de9dc20a 48894740        mov     qword ptr [rdi+40h],rax
fffff808`de9dc20e 48894f68        mov     qword ptr [rdi+68h],rcx
fffff808`de9dc212 4c8ba3c0000000  mov     r12,qword ptr [rbx+0C0h]
fffff808`de9dc219 4d85e4          test    r12,r12
fffff808`de9dc21c 7439            je      storport!RaidUnitCompleteRequest+0x987 (fffff808`de9dc257)  Branch

storport!RaidUnitCompleteRequest+0x94e:
fffff808`de9dc21e 488bcf          mov     rcx,rdi
fffff808`de9dc221 e882890300      call    storport!RaidSrbExGetBidirectionalData (fffff808`dea14ba8)
fffff808`de9dc226 33ff            xor     edi,edi
fffff808`de9dc228 4885c0          test    rax,rax
fffff808`de9dc22b 742c            je      storport!RaidUnitCompleteRequest+0x989 (fffff808`de9dc259)  Branch

storport!RaidUnitCompleteRequest+0x95d:
fffff808`de9dc22d 4c896010        mov     qword ptr [rax+10h],r12
fffff808`de9dc231 eb26            jmp     storport!RaidUnitCompleteRequest+0x989 (fffff808`de9dc259)  Branch

storport!RaidUnitCompleteRequest+0x963:
fffff808`de9dc233 488b83b0000000  mov     rax,qword ptr [rbx+0B0h]
fffff808`de9dc23a 48894730        mov     qword ptr [rdi+30h],rax
fffff808`de9dc23e 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff808`de9dc245 48894718        mov     qword ptr [rdi+18h],rax
fffff808`de9dc249 33c0            xor     eax,eax
fffff808`de9dc24b 48894738        mov     qword ptr [rdi+38h],rax
fffff808`de9dc24f 48894728        mov     qword ptr [rdi+28h],rax
fffff808`de9dc253 33ff            xor     edi,edi
fffff808`de9dc255 eb07            jmp     storport!RaidUnitCompleteRequest+0x98e (fffff808`de9dc25e)  Branch

storport!RaidUnitCompleteRequest+0x987:
fffff808`de9dc257 33ff            xor     edi,edi

storport!RaidUnitCompleteRequest+0x989:
fffff808`de9dc259 448b64247c      mov     r12d,dword ptr [rsp+7Ch]

storport!RaidUnitCompleteRequest+0x98e:
fffff808`de9dc25e 48837b7000      cmp     qword ptr [rbx+70h],0
fffff808`de9dc263 0f84a2000000    je      storport!RaidUnitCompleteRequest+0xa3b (fffff808`de9dc30b)  Branch

storport!RaidUnitCompleteRequest+0x999:
fffff808`de9dc269 488b83a8000000  mov     rax,qword ptr [rbx+0A8h]
fffff808`de9dc270 80780228        cmp     byte ptr [rax+2],28h
fffff808`de9dc274 7508            jne     storport!RaidUnitCompleteRequest+0x9ae (fffff808`de9dc27e)  Branch

storport!RaidUnitCompleteRequest+0x9a6:
fffff808`de9dc276 8b7818          mov     edi,dword ptr [rax+18h]
fffff808`de9dc279 c1ef06          shr     edi,6
fffff808`de9dc27c eb08            jmp     storport!RaidUnitCompleteRequest+0x9b6 (fffff808`de9dc286)  Branch

storport!RaidUnitCompleteRequest+0x9ae:
fffff808`de9dc27e 0fb6780c        movzx   edi,byte ptr [rax+0Ch]
fffff808`de9dc282 40c0ef06        shr     dil,6

storport!RaidUnitCompleteRequest+0x9b6:
fffff808`de9dc286 40f6d7          not     dil
fffff808`de9dc289 4080e701        and     dil,1
fffff808`de9dc28d 833df055050000  cmp     dword ptr [storport!RaidVerifierEnabled (fffff808`dea31884)],0
fffff808`de9dc294 7408            je      storport!RaidUnitCompleteRequest+0x9ce (fffff808`de9dc29e)  Branch

storport!RaidUnitCompleteRequest+0x9c6:
fffff808`de9dc296 488bcb          mov     rcx,rbx
fffff808`de9dc299 e86ef60300      call    storport!RaidFreeRemappedScatterGatherListMdl (fffff808`dea1b90c)

storport!RaidUnitCompleteRequest+0x9ce:
fffff808`de9dc29e 488b83d8000000  mov     rax,qword ptr [rbx+0D8h]
fffff808`de9dc2a5 4805d0020000    add     rax,2D0h
fffff808`de9dc2ab 7428            je      storport!RaidUnitCompleteRequest+0xa05 (fffff808`de9dc2d5)  Branch

storport!RaidUnitCompleteRequest+0x9dd:
fffff808`de9dc2ad 488b08          mov     rcx,qword ptr [rax]
fffff808`de9dc2b0 4885c9          test    rcx,rcx
fffff808`de9dc2b3 7420            je      storport!RaidUnitCompleteRequest+0xa05 (fffff808`de9dc2d5)  Branch

storport!RaidUnitCompleteRequest+0x9e5:
fffff808`de9dc2b5 488b4108        mov     rax,qword ptr [rcx+8]
fffff808`de9dc2b9 4885c0          test    rax,rax
fffff808`de9dc2bc 7417            je      storport!RaidUnitCompleteRequest+0xa05 (fffff808`de9dc2d5)  Branch

storport!RaidUnitCompleteRequest+0x9ee:
fffff808`de9dc2be 488b4060        mov     rax,qword ptr [rax+60h]
fffff808`de9dc2c2 4885c0          test    rax,rax
fffff808`de9dc2c5 740e            je      storport!RaidUnitCompleteRequest+0xa05 (fffff808`de9dc2d5)  Branch

storport!RaidUnitCompleteRequest+0x9f7:
fffff808`de9dc2c7 488b5370        mov     rdx,qword ptr [rbx+70h]
fffff808`de9dc2cb 440fb6c7        movzx   r8d,dil
fffff808`de9dc2cf ff1553b50500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff808`dea37828)]

storport!RaidUnitCompleteRequest+0xa05:
fffff808`de9dc2d5 488b9398000000  mov     rdx,qword ptr [rbx+98h]
fffff808`de9dc2dc 33ff            xor     edi,edi
fffff808`de9dc2de 48897b70        mov     qword ptr [rbx+70h],rdi
fffff808`de9dc2e2 4889bb90000000  mov     qword ptr [rbx+90h],rdi
fffff808`de9dc2e9 4885d2          test    rdx,rdx
fffff808`de9dc2ec 741d            je      storport!RaidUnitCompleteRequest+0xa3b (fffff808`de9dc30b)  Branch

storport!RaidUnitCompleteRequest+0xa1e:
fffff808`de9dc2ee 488b8bd8000000  mov     rcx,qword ptr [rbx+0D8h]
fffff808`de9dc2f5 4533c0          xor     r8d,r8d
fffff808`de9dc2f8 4881c1d0020000  add     rcx,2D0h
fffff808`de9dc2ff e898c8ffff      call    storport!RaidDmaPutScatterGatherList (fffff808`de9d8b9c)
fffff808`de9dc304 4889bb98000000  mov     qword ptr [rbx+98h],rdi

storport!RaidUnitCompleteRequest+0xa3b:
fffff808`de9dc30b 488b4b68        mov     rcx,qword ptr [rbx+68h]
fffff808`de9dc30f 4885c9          test    rcx,rcx
fffff808`de9dc312 7430            je      storport!RaidUnitCompleteRequest+0xa74 (fffff808`de9dc344)  Branch

storport!RaidUnitCompleteRequest+0xa44:
fffff808`de9dc314 f6431001        test    byte ptr [rbx+10h],1
fffff808`de9dc318 742a            je      storport!RaidUnitCompleteRequest+0xa74 (fffff808`de9dc344)  Branch

storport!RaidUnitCompleteRequest+0xa4a:
fffff808`de9dc31a f6410a02        test    byte ptr [rcx+0Ah],2
fffff808`de9dc31e 7410            je      storport!RaidUnitCompleteRequest+0xa60 (fffff808`de9dc330)  Branch

storport!RaidUnitCompleteRequest+0xa50:
fffff808`de9dc320 48ff15b1b20500  call    qword ptr [storport!_imp_MmUnlockPages (fffff808`dea375d8)]
fffff808`de9dc327 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc32c 488b4b68        mov     rcx,qword ptr [rbx+68h]

storport!RaidUnitCompleteRequest+0xa60:
fffff808`de9dc330 48ff15c9af0500  call    qword ptr [storport!_imp_IoFreeMdl (fffff808`dea37300)]
fffff808`de9dc337 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc33c 806310fe        and     byte ptr [rbx+10h],0FEh
fffff808`de9dc340 48897b68        mov     qword ptr [rbx+68h],rdi

storport!RaidUnitCompleteRequest+0xa74:
fffff808`de9dc344 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff808`de9dc34b 4885c9          test    rcx,rcx
fffff808`de9dc34e 7426            je      storport!RaidUnitCompleteRequest+0xaa6 (fffff808`de9dc376)  Branch

storport!RaidUnitCompleteRequest+0xa80:
fffff808`de9dc350 48ff1581b20500  call    qword ptr [storport!_imp_MmUnlockPages (fffff808`dea375d8)]
fffff808`de9dc357 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc35c 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff808`de9dc363 48ff1596af0500  call    qword ptr [storport!_imp_IoFreeMdl (fffff808`dea37300)]
fffff808`de9dc36a 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc36f 4889bb88000000  mov     qword ptr [rbx+88h],rdi

storport!RaidUnitCompleteRequest+0xaa6:
fffff808`de9dc376 658b0425a4010000 mov     eax,dword ptr gs:[1A4h]
fffff808`de9dc37e 448bc0          mov     r8d,eax
fffff808`de9dc381 498b4520        mov     rax,qword ptr [r13+20h]
fffff808`de9dc385 49c1e006        shl     r8,6
fffff808`de9dc389 418b0400        mov     eax,dword ptr [r8+rax]
fffff808`de9dc38d a801            test    al,1
fffff808`de9dc38f 7513            jne     storport!RaidUnitCompleteRequest+0xad4 (fffff808`de9dc3a4)  Branch

storport!RaidUnitCompleteRequest+0xac1:
fffff808`de9dc391 8d50fe          lea     edx,[rax-2]
fffff808`de9dc394 498b4d20        mov     rcx,qword ptr [r13+20h]
fffff808`de9dc398 f0410fb11408    lock cmpxchg dword ptr [r8+rcx],edx
fffff808`de9dc39e 742d            je      storport!RaidUnitCompleteRequest+0xafd (fffff808`de9dc3cd)  Branch

storport!RaidUnitCompleteRequest+0xad0:
fffff808`de9dc3a0 a801            test    al,1
fffff808`de9dc3a2 74ed            je      storport!RaidUnitCompleteRequest+0xac1 (fffff808`de9dc391)  Branch

storport!RaidUnitCompleteRequest+0xad4:
fffff808`de9dc3a4 418bc7          mov     eax,r15d
fffff808`de9dc3a7 f0410fc18590030000 lock xadd dword ptr [r13+390h],eax
fffff808`de9dc3b0 83f801          cmp     eax,1
fffff808`de9dc3b3 7518            jne     storport!RaidUnitCompleteRequest+0xafd (fffff808`de9dc3cd)  Branch

storport!RaidUnitCompleteRequest+0xae5:
fffff808`de9dc3b5 498d8dd0010000  lea     rcx,[r13+1D0h]
fffff808`de9dc3bc 4533c0          xor     r8d,r8d
fffff808`de9dc3bf 33d2            xor     edx,edx
fffff808`de9dc3c1 48ff15d0af0500  call    qword ptr [storport!_imp_KeSetEvent (fffff808`dea37398)]
fffff808`de9dc3c8 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0xafd:
fffff808`de9dc3cd 488b5da0        mov     rbx,qword ptr [rbp-60h]
fffff808`de9dc3d1 4885db          test    rbx,rbx
fffff808`de9dc3d4 740f            je      storport!RaidUnitCompleteRequest+0xb15 (fffff808`de9dc3e5)  Branch

storport!RaidUnitCompleteRequest+0xb06:
fffff808`de9dc3d6 803b3b          cmp     byte ptr [rbx],3Bh
fffff808`de9dc3d9 750a            jne     storport!RaidUnitCompleteRequest+0xb15 (fffff808`de9dc3e5)  Branch

storport!RaidUnitCompleteRequest+0xb0b:
fffff808`de9dc3db 0fb64301        movzx   eax,byte ptr [rbx+1]
fffff808`de9dc3df 241f            and     al,1Fh
fffff808`de9dc3e1 3c0f            cmp     al,0Fh
fffff808`de9dc3e3 7409            je      storport!RaidUnitCompleteRequest+0xb1e (fffff808`de9dc3ee)  Branch

storport!RaidUnitCompleteRequest+0xb15:
fffff808`de9dc3e5 4584e4          test    r12b,r12b
fffff808`de9dc3e8 0f84fd000000    je      storport!RaidUnitCompleteRequest+0xc1b (fffff808`de9dc4eb)  Branch

storport!RaidUnitCompleteRequest+0xb1e:
fffff808`de9dc3ee 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff808`de9dc3f2 ba10000000      mov     edx,10h
fffff808`de9dc3f7 b900020000      mov     ecx,200h
fffff808`de9dc3fc 41b852615749    mov     r8d,49576152h
fffff808`de9dc402 e835bdffff      call    storport!RaidAllocatePool (fffff808`de9d813c)
fffff808`de9dc407 488bd8          mov     rbx,rax
fffff808`de9dc40a 4885c0          test    rax,rax
fffff808`de9dc40d 746a            je      storport!RaidUnitCompleteRequest+0xba9 (fffff808`de9dc479)  Branch

storport!RaidUnitCompleteRequest+0xb3f:
fffff808`de9dc40f 33c0            xor     eax,eax
fffff808`de9dc411 488903          mov     qword ptr [rbx],rax
fffff808`de9dc414 48894308        mov     qword ptr [rbx+8],rax
fffff808`de9dc418 488b4e08        mov     rcx,qword ptr [rsi+8]
fffff808`de9dc41c 48ff1505ac0500  call    qword ptr [storport!_imp_IoAllocateWorkItem (fffff808`dea37028)]
fffff808`de9dc423 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc428 488903          mov     qword ptr [rbx],rax
fffff808`de9dc42b 4885c0          test    rax,rax
fffff808`de9dc42e 7435            je      storport!RaidUnitCompleteRequest+0xb95 (fffff808`de9dc465)  Branch

storport!RaidUnitCompleteRequest+0xb60:
fffff808`de9dc430 488b4598        mov     rax,qword ptr [rbp-68h]
fffff808`de9dc434 48894308        mov     qword ptr [rbx+8],rax
fffff808`de9dc438 f0ff8690030000  lock inc dword ptr [rsi+390h]
fffff808`de9dc43f 488b0b          mov     rcx,qword ptr [rbx]
fffff808`de9dc442 488d1507de0300  lea     rdx,[storport!RaidUnitIdentityUpdateWorkRoutine (fffff808`dea1a250)]
fffff808`de9dc449 4c8bcb          mov     r9,rbx
fffff808`de9dc44c 4533c0          xor     r8d,r8d
fffff808`de9dc44f 48ff15d2b00500  call    qword ptr [storport!_imp_IoQueueWorkItem (fffff808`dea37528)]
fffff808`de9dc456 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc45b 4533ed          xor     r13d,r13d
fffff808`de9dc45e b101            mov     cl,1
fffff808`de9dc460 e9f5040000      jmp     storport!RaidUnitCompleteRequest+0x108a (fffff808`de9dc95a)  Branch

storport!RaidUnitCompleteRequest+0xb95:
fffff808`de9dc465 ba52615749      mov     edx,49576152h
fffff808`de9dc46a 488bcb          mov     rcx,rbx
fffff808`de9dc46d 48ff15b4ad0500  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff808`dea37228)]
fffff808`de9dc474 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0xba9:
fffff808`de9dc479 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dc47d 33d2            xor     edx,edx
fffff808`de9dc47f 488b4920        mov     rcx,qword ptr [rcx+20h]
fffff808`de9dc483 48ff152eae0500  call    qword ptr [storport!_imp_IoInvalidateDeviceRelations (fffff808`dea372b8)]
fffff808`de9dc48a 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0xbbf:
fffff808`de9dc48f 4533ed          xor     r13d,r13d

storport!RaidUnitCompleteRequest+0xbc2:
fffff808`de9dc492 488b0d674b0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff808`dea31000)]
fffff808`de9dc499 488d05604b0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff808`dea31000)]
fffff808`de9dc4a0 483bc8          cmp     rcx,rax
fffff808`de9dc4a3 0f843e040000    je      storport!RaidUnitCompleteRequest+0x1017 (fffff808`de9dc8e7)  Branch

storport!RaidUnitCompleteRequest+0xbd9:
fffff808`de9dc4a9 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff808`de9dc4ac a808            test    al,8
fffff808`de9dc4ae 0f8433040000    je      storport!RaidUnitCompleteRequest+0x1017 (fffff808`de9dc8e7)  Branch

storport!RaidUnitCompleteRequest+0xbe4:
fffff808`de9dc4b4 80792904        cmp     byte ptr [rcx+29h],4
fffff808`de9dc4b8 488b5d98        mov     rbx,qword ptr [rbp-68h]
fffff808`de9dc4bc 0f8229040000    jb      storport!RaidUnitCompleteRequest+0x101b (fffff808`de9dc8eb)  Branch

storport!RaidUnitCompleteRequest+0xbf2:
fffff808`de9dc4c2 8b4330          mov     eax,dword ptr [rbx+30h]
fffff808`de9dc4c5 4c8d05f4970400  lea     r8,[storport!WPP_99c9bf4d7da4363d93328a929abc4697_Traceguids (fffff808`dea25cc0)]
fffff808`de9dc4cc 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff808`de9dc4d0 ba18000000      mov     edx,18h
fffff808`de9dc4d5 89442428        mov     dword ptr [rsp+28h],eax
fffff808`de9dc4d9 4c8bce          mov     r9,rsi
fffff808`de9dc4dc 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff808`de9dc4e1 e862f70200      call    storport!WPP_SF_qqD (fffff808`dea0bc48)
fffff808`de9dc4e6 e900040000      jmp     storport!RaidUnitCompleteRequest+0x101b (fffff808`de9dc8eb)  Branch

storport!RaidUnitCompleteRequest+0xc1b:
fffff808`de9dc4eb 80be8100000000  cmp     byte ptr [rsi+81h],0
fffff808`de9dc4f2 8b442478        mov     eax,dword ptr [rsp+78h]
fffff808`de9dc4f6 0f844c010000    je      storport!RaidUnitCompleteRequest+0xd78 (fffff808`de9dc648)  Branch

storport!RaidUnitCompleteRequest+0xc2c:
fffff808`de9dc4fc 4885db          test    rbx,rbx
fffff808`de9dc4ff 0f8443010000    je      storport!RaidUnitCompleteRequest+0xd78 (fffff808`de9dc648)  Branch

storport!RaidUnitCompleteRequest+0xc35:
fffff808`de9dc505 85c0            test    eax,eax
fffff808`de9dc507 0f853b010000    jne     storport!RaidUnitCompleteRequest+0xd78 (fffff808`de9dc648)  Branch

storport!RaidUnitCompleteRequest+0xc3d:
fffff808`de9dc50d 0fb603          movzx   eax,byte ptr [rbx]
fffff808`de9dc510 3c25            cmp     al,25h
fffff808`de9dc512 7408            je      storport!RaidUnitCompleteRequest+0xc4c (fffff808`de9dc51c)  Branch

storport!RaidUnitCompleteRequest+0xc44:
fffff808`de9dc514 3c9e            cmp     al,9Eh
fffff808`de9dc516 0f8532010000    jne     storport!RaidUnitCompleteRequest+0xd7e (fffff808`de9dc64e)  Branch

storport!RaidUnitCompleteRequest+0xc4c:
fffff808`de9dc51c 83be2c03000000  cmp     dword ptr [rsi+32Ch],0
fffff808`de9dc523 0f8525010000    jne     storport!RaidUnitCompleteRequest+0xd7e (fffff808`de9dc64e)  Branch

storport!RaidUnitCompleteRequest+0xc59:
fffff808`de9dc529 41807e0228      cmp     byte ptr [r14+2],28h
fffff808`de9dc52e 7506            jne     storport!RaidUnitCompleteRequest+0xc66 (fffff808`de9dc536)  Branch

storport!RaidUnitCompleteRequest+0xc60:
fffff808`de9dc530 498b4640        mov     rax,qword ptr [r14+40h]
fffff808`de9dc534 eb04            jmp     storport!RaidUnitCompleteRequest+0xc6a (fffff808`de9dc53a)  Branch

storport!RaidUnitCompleteRequest+0xc66:
fffff808`de9dc536 498b4618        mov     rax,qword ptr [r14+18h]

storport!RaidUnitCompleteRequest+0xc6a:
fffff808`de9dc53a 488b7da8        mov     rdi,qword ptr [rbp-58h]
fffff808`de9dc53e 4885c0          test    rax,rax
fffff808`de9dc541 0f840b010000    je      storport!RaidUnitCompleteRequest+0xd82 (fffff808`de9dc652)  Branch

storport!RaidUnitCompleteRequest+0xc77:
fffff808`de9dc547 488b8fb8000000  mov     rcx,qword ptr [rdi+0B8h]
fffff808`de9dc54e 48ff15bbb00500  call    qword ptr [storport!_imp_MmIsAddressValid (fffff808`dea37610)]
fffff808`de9dc555 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc55a 84c0            test    al,al
fffff808`de9dc55c 0f84f0000000    je      storport!RaidUnitCompleteRequest+0xd82 (fffff808`de9dc652)  Branch

storport!RaidUnitCompleteRequest+0xc92:
fffff808`de9dc562 488b8fb8000000  mov     rcx,qword ptr [rdi+0B8h]
fffff808`de9dc569 4533ed          xor     r13d,r13d
fffff808`de9dc56c 803b25          cmp     byte ptr [rbx],25h
fffff808`de9dc56f 44896c2474      mov     dword ptr [rsp+74h],r13d
fffff808`de9dc574 4c896d90        mov     qword ptr [rbp-70h],r13
fffff808`de9dc578 753a            jne     storport!RaidUnitCompleteRequest+0xce4 (fffff808`de9dc5b4)  Branch

storport!RaidUnitCompleteRequest+0xcaa:
fffff808`de9dc57a 0fb64104        movzx   eax,byte ptr [rcx+4]
fffff808`de9dc57e 88442477        mov     byte ptr [rsp+77h],al
fffff808`de9dc582 0fb64105        movzx   eax,byte ptr [rcx+5]
fffff808`de9dc586 88442476        mov     byte ptr [rsp+76h],al
fffff808`de9dc58a 0fb64106        movzx   eax,byte ptr [rcx+6]
fffff808`de9dc58e 88442475        mov     byte ptr [rsp+75h],al
fffff808`de9dc592 0fb64107        movzx   eax,byte ptr [rcx+7]
fffff808`de9dc596 88442474        mov     byte ptr [rsp+74h],al
fffff808`de9dc59a 0fb601          movzx   eax,byte ptr [rcx]
fffff808`de9dc59d 884593          mov     byte ptr [rbp-6Dh],al
fffff808`de9dc5a0 0fb64101        movzx   eax,byte ptr [rcx+1]
fffff808`de9dc5a4 884592          mov     byte ptr [rbp-6Eh],al
fffff808`de9dc5a7 0fb64102        movzx   eax,byte ptr [rcx+2]
fffff808`de9dc5ab 884591          mov     byte ptr [rbp-6Fh],al
fffff808`de9dc5ae 0fb64103        movzx   eax,byte ptr [rcx+3]
fffff808`de9dc5b2 eb54            jmp     storport!RaidUnitCompleteRequest+0xd38 (fffff808`de9dc608)  Branch

storport!RaidUnitCompleteRequest+0xce4:
fffff808`de9dc5b4 0fb64108        movzx   eax,byte ptr [rcx+8]
fffff808`de9dc5b8 88442477        mov     byte ptr [rsp+77h],al
fffff808`de9dc5bc 0fb64109        movzx   eax,byte ptr [rcx+9]
fffff808`de9dc5c0 88442476        mov     byte ptr [rsp+76h],al
fffff808`de9dc5c4 0fb6410a        movzx   eax,byte ptr [rcx+0Ah]
fffff808`de9dc5c8 88442475        mov     byte ptr [rsp+75h],al
fffff808`de9dc5cc 0fb6410b        movzx   eax,byte ptr [rcx+0Bh]
fffff808`de9dc5d0 88442474        mov     byte ptr [rsp+74h],al
fffff808`de9dc5d4 0fb601          movzx   eax,byte ptr [rcx]
fffff808`de9dc5d7 884597          mov     byte ptr [rbp-69h],al
fffff808`de9dc5da 0fb64101        movzx   eax,byte ptr [rcx+1]
fffff808`de9dc5de 884596          mov     byte ptr [rbp-6Ah],al
fffff808`de9dc5e1 0fb64102        movzx   eax,byte ptr [rcx+2]
fffff808`de9dc5e5 884595          mov     byte ptr [rbp-6Bh],al
fffff808`de9dc5e8 0fb64103        movzx   eax,byte ptr [rcx+3]
fffff808`de9dc5ec 884594          mov     byte ptr [rbp-6Ch],al
fffff808`de9dc5ef 0fb64104        movzx   eax,byte ptr [rcx+4]
fffff808`de9dc5f3 884593          mov     byte ptr [rbp-6Dh],al
fffff808`de9dc5f6 0fb64105        movzx   eax,byte ptr [rcx+5]
fffff808`de9dc5fa 884592          mov     byte ptr [rbp-6Eh],al
fffff808`de9dc5fd 0fb64106        movzx   eax,byte ptr [rcx+6]
fffff808`de9dc601 884591          mov     byte ptr [rbp-6Fh],al
fffff808`de9dc604 0fb64107        movzx   eax,byte ptr [rcx+7]

storport!RaidUnitCompleteRequest+0xd38:
fffff808`de9dc608 8b5c2474        mov     ebx,dword ptr [rsp+74h]
fffff808`de9dc60c 884590          mov     byte ptr [rbp-70h],al
fffff808`de9dc60f 85db            test    ebx,ebx
fffff808`de9dc611 7507            jne     storport!RaidUnitCompleteRequest+0xd4a (fffff808`de9dc61a)  Branch

storport!RaidUnitCompleteRequest+0xd43:
fffff808`de9dc613 bb00020000      mov     ebx,200h
fffff808`de9dc618 eb14            jmp     storport!RaidUnitCompleteRequest+0xd5e (fffff808`de9dc62e)  Branch

storport!RaidUnitCompleteRequest+0xd4a:
fffff808`de9dc61a 8d43ff          lea     eax,[rbx-1]
fffff808`de9dc61d 85c3            test    ebx,eax
fffff808`de9dc61f 7411            je      storport!RaidUnitCompleteRequest+0xd62 (fffff808`de9dc632)  Branch

storport!RaidUnitCompleteRequest+0xd51:
fffff808`de9dc621 8d43ff          lea     eax,[rbx-1]
fffff808`de9dc624 23c3            and     eax,ebx
fffff808`de9dc626 8bd8            mov     ebx,eax
fffff808`de9dc628 ffc8            dec     eax
fffff808`de9dc62a 85c3            test    ebx,eax
fffff808`de9dc62c 75f3            jne     storport!RaidUnitCompleteRequest+0xd51 (fffff808`de9dc621)  Branch

storport!RaidUnitCompleteRequest+0xd5e:
fffff808`de9dc62e 895c2474        mov     dword ptr [rsp+74h],ebx

storport!RaidUnitCompleteRequest+0xd62:
fffff808`de9dc632 488b4590        mov     rax,qword ptr [rbp-70h]
fffff808`de9dc636 488986e80c0000  mov     qword ptr [rsi+0CE8h],rax
fffff808`de9dc63d 899e2c030000    mov     dword ptr [rsi+32Ch],ebx
fffff808`de9dc643 e94afeffff      jmp     storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0xd78:
fffff808`de9dc648 488b7da8        mov     rdi,qword ptr [rbp-58h]
fffff808`de9dc64c eb08            jmp     storport!RaidUnitCompleteRequest+0xd86 (fffff808`de9dc656)  Branch

storport!RaidUnitCompleteRequest+0xd7e:
fffff808`de9dc64e 488b7da8        mov     rdi,qword ptr [rbp-58h]

storport!RaidUnitCompleteRequest+0xd82:
fffff808`de9dc652 8b442478        mov     eax,dword ptr [rsp+78h]

storport!RaidUnitCompleteRequest+0xd86:
fffff808`de9dc656 80be8100000000  cmp     byte ptr [rsi+81h],0
fffff808`de9dc65d 0f842cfeffff    je      storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xd93:
fffff808`de9dc663 4885db          test    rbx,rbx
fffff808`de9dc666 0f8423feffff    je      storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xd9c:
fffff808`de9dc66c 85c0            test    eax,eax
fffff808`de9dc66e 0f851bfeffff    jne     storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xda4:
fffff808`de9dc674 803b95          cmp     byte ptr [rbx],95h
fffff808`de9dc677 0f8512feffff    jne     storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xdad:
fffff808`de9dc67d 384301          cmp     byte ptr [rbx+1],al
fffff808`de9dc680 0f8509feffff    jne     storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xdb6:
fffff808`de9dc686 39862c030000    cmp     dword ptr [rsi+32Ch],eax
fffff808`de9dc68c 0f84fdfdffff    je      storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xdc2:
fffff808`de9dc692 41807e0228      cmp     byte ptr [r14+2],28h
fffff808`de9dc697 7506            jne     storport!RaidUnitCompleteRequest+0xdcf (fffff808`de9dc69f)  Branch

storport!RaidUnitCompleteRequest+0xdc9:
fffff808`de9dc699 498b4640        mov     rax,qword ptr [r14+40h]
fffff808`de9dc69d eb04            jmp     storport!RaidUnitCompleteRequest+0xdd3 (fffff808`de9dc6a3)  Branch

storport!RaidUnitCompleteRequest+0xdcf:
fffff808`de9dc69f 498b4618        mov     rax,qword ptr [r14+18h]

storport!RaidUnitCompleteRequest+0xdd3:
fffff808`de9dc6a3 4885c0          test    rax,rax
fffff808`de9dc6a6 0f84e3fdffff    je      storport!RaidUnitCompleteRequest+0xbbf (fffff808`de9dc48f)  Branch

storport!RaidUnitCompleteRequest+0xddc:
fffff808`de9dc6ac 488b8fb8000000  mov     rcx,qword ptr [rdi+0B8h]
fffff808`de9dc6b3 48ff1556af0500  call    qword ptr [storport!_imp_MmIsAddressValid (fffff808`dea37610)]
fffff808`de9dc6ba 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc6bf 4533ed          xor     r13d,r13d
fffff808`de9dc6c2 84c0            test    al,al
fffff808`de9dc6c4 0f84c8fdffff    je      storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0xdfa:
fffff808`de9dc6ca 488b8fb8000000  mov     rcx,qword ptr [rdi+0B8h]
fffff808`de9dc6d1 8b962c030000    mov     edx,dword ptr [rsi+32Ch]
fffff808`de9dc6d7 4c896db0        mov     qword ptr [rbp-50h],r13
fffff808`de9dc6db 0fb64148        movzx   eax,byte ptr [rcx+48h]
fffff808`de9dc6df 8845b7          mov     byte ptr [rbp-49h],al
fffff808`de9dc6e2 0fb64149        movzx   eax,byte ptr [rcx+49h]
fffff808`de9dc6e6 8845b6          mov     byte ptr [rbp-4Ah],al
fffff808`de9dc6e9 0fb6414a        movzx   eax,byte ptr [rcx+4Ah]
fffff808`de9dc6ed 8845b5          mov     byte ptr [rbp-4Bh],al
fffff808`de9dc6f0 0fb6414b        movzx   eax,byte ptr [rcx+4Bh]
fffff808`de9dc6f4 8845b4          mov     byte ptr [rbp-4Ch],al
fffff808`de9dc6f7 0fb6414c        movzx   eax,byte ptr [rcx+4Ch]
fffff808`de9dc6fb 8845b3          mov     byte ptr [rbp-4Dh],al
fffff808`de9dc6fe 0fb6414d        movzx   eax,byte ptr [rcx+4Dh]
fffff808`de9dc702 8845b2          mov     byte ptr [rbp-4Eh],al
fffff808`de9dc705 0fb6414e        movzx   eax,byte ptr [rcx+4Eh]
fffff808`de9dc709 8845b1          mov     byte ptr [rbp-4Fh],al
fffff808`de9dc70c 0fb6414f        movzx   eax,byte ptr [rcx+4Fh]
fffff808`de9dc710 488b8eb80c0000  mov     rcx,qword ptr [rsi+0CB8h]
fffff808`de9dc717 8845b0          mov     byte ptr [rbp-50h],al
fffff808`de9dc71a 8bc2            mov     eax,edx
fffff808`de9dc71c 480faf45b0      imul    rax,qword ptr [rbp-50h]
fffff808`de9dc721 483bc8          cmp     rcx,rax
fffff808`de9dc724 740a            je      storport!RaidUnitCompleteRequest+0xe60 (fffff808`de9dc730)  Branch

storport!RaidUnitCompleteRequest+0xe56:
fffff808`de9dc726 488986b80c0000  mov     qword ptr [rsi+0CB8h],rax
fffff808`de9dc72d 488bc8          mov     rcx,rax

storport!RaidUnitCompleteRequest+0xe60:
fffff808`de9dc730 4885c9          test    rcx,rcx
fffff808`de9dc733 0f85c8000000    jne     storport!RaidUnitCompleteRequest+0xf31 (fffff808`de9dc801)  Branch

storport!RaidUnitCompleteRequest+0xe69:
fffff808`de9dc739 488b8e98000000  mov     rcx,qword ptr [rsi+98h]
fffff808`de9dc740 4d8bc5          mov     r8,r13
fffff808`de9dc743 8b4660          mov     eax,dword ptr [rsi+60h]
fffff808`de9dc746 4885c9          test    rcx,rcx
fffff808`de9dc749 7406            je      storport!RaidUnitCompleteRequest+0xe81 (fffff808`de9dc751)  Branch

storport!RaidUnitCompleteRequest+0xe7b:
fffff808`de9dc74b 4c8d415a        lea     r8,[rcx+5Ah]
fffff808`de9dc74f eb26            jmp     storport!RaidUnitCompleteRequest+0xea7 (fffff808`de9dc777)  Branch

storport!RaidUnitCompleteRequest+0xe81:
fffff808`de9dc751 4c8b8e90000000  mov     r9,qword ptr [rsi+90h]
fffff808`de9dc758 4d85c9          test    r9,r9
fffff808`de9dc75b 741a            je      storport!RaidUnitCompleteRequest+0xea7 (fffff808`de9dc777)  Branch

storport!RaidUnitCompleteRequest+0xe8d:
fffff808`de9dc75d 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dc761 488b9120020000  mov     rdx,qword ptr [rcx+220h]
fffff808`de9dc768 8b8ab8000000    mov     ecx,dword ptr [rdx+0B8h]
fffff808`de9dc76e f6c140          test    cl,40h
fffff808`de9dc771 7404            je      storport!RaidUnitCompleteRequest+0xea7 (fffff808`de9dc777)  Branch

storport!RaidUnitCompleteRequest+0xea3:
fffff808`de9dc773 4d8d4129        lea     r8,[r9+29h]

storport!RaidUnitCompleteRequest+0xea7:
fffff808`de9dc777 0fb60d65500500  movzx   ecx,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff808`dea317e3)]
fffff808`de9dc77e 84c9            test    cl,cl
fffff808`de9dc780 0f890cfdffff    jns     storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0xeb6:
fffff808`de9dc786 4c8b4e18        mov     r9,qword ptr [rsi+18h]
fffff808`de9dc78a 4c8d96a9000000  lea     r10,[rsi+0A9h]
fffff808`de9dc791 4c896c2468      mov     qword ptr [rsp+68h],r13
fffff808`de9dc796 4c8d9ea0000000  lea     r11,[rsi+0A0h]
fffff808`de9dc79d 4d85c0          test    r8,r8
fffff808`de9dc7a0 488d3d05870400  lea     rdi,[storport!`string` (fffff808`dea24eac)]
fffff808`de9dc7a7 8bd8            mov     ebx,eax
fffff808`de9dc7a9 8bc8            mov     ecx,eax
fffff808`de9dc7ab 490f45f8        cmovne  rdi,r8
fffff808`de9dc7af 498d9188140000  lea     rdx,[r9+1488h]
fffff808`de9dc7b6 48897c2460      mov     qword ptr [rsp+60h],rdi
fffff808`de9dc7bb 4c8d86ba000000  lea     r8,[rsi+0BAh]
fffff808`de9dc7c2 4c89442458      mov     qword ptr [rsp+58h],r8
fffff808`de9dc7c7 4c89542450      mov     qword ptr [rsp+50h],r10
fffff808`de9dc7cc 4c895c2448      mov     qword ptr [rsp+48h],r11
fffff808`de9dc7d1 c1eb10          shr     ebx,10h
fffff808`de9dc7d4 885c2440        mov     byte ptr [rsp+40h],bl
fffff808`de9dc7d8 c1e908          shr     ecx,8
fffff808`de9dc7db 884c2438        mov     byte ptr [rsp+38h],cl
fffff808`de9dc7df 88442430        mov     byte ptr [rsp+30h],al
fffff808`de9dc7e3 418b4138        mov     eax,dword ptr [r9+38h]
fffff808`de9dc7e7 4d8b8900130000  mov     r9,qword ptr [r9+1300h]
fffff808`de9dc7ee 4889542428      mov     qword ptr [rsp+28h],rdx
fffff808`de9dc7f3 89442420        mov     dword ptr [rsp+20h],eax
fffff808`de9dc7f7 e834b50100      call    storport!McTemplateK0zqjuuussssx (fffff808`de9f7d30)
fffff808`de9dc7fc e991fcffff      jmp     storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0xf31:
fffff808`de9dc801 4c39aed00c0000  cmp     qword ptr [rsi+0CD0h],r13
fffff808`de9dc808 0f8584fcffff    jne     storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0xf3e:
fffff808`de9dc80e 488b86e80c0000  mov     rax,qword ptr [rsi+0CE8h]
fffff808`de9dc815 bb00020000      mov     ebx,200h
fffff808`de9dc81a 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff808`de9dc81e 41b852615a52    mov     r8d,525A6152h
fffff808`de9dc824 480fafc2        imul    rax,rdx
fffff808`de9dc828 33d2            xor     edx,edx
fffff808`de9dc82a 48f7f1          div     rax,rcx
fffff808`de9dc82d 8bcb            mov     ecx,ebx
fffff808`de9dc82f 8bd0            mov     edx,eax
fffff808`de9dc831 488bf8          mov     rdi,rax
fffff808`de9dc834 448be0          mov     r12d,eax
fffff808`de9dc837 e800b9ffff      call    storport!RaidAllocatePool (fffff808`de9d813c)
fffff808`de9dc83c 488986d00c0000  mov     qword ptr [rsi+0CD0h],rax
fffff808`de9dc843 4885c0          test    rax,rax
fffff808`de9dc846 745f            je      storport!RaidUnitCompleteRequest+0xfd7 (fffff808`de9dc8a7)  Branch

storport!RaidUnitCompleteRequest+0xf78:
fffff808`de9dc848 458bc4          mov     r8d,r12d
fffff808`de9dc84b 33d2            xor     edx,edx
fffff808`de9dc84d 488bc8          mov     rcx,rax
fffff808`de9dc850 e8abfa0100      call    storport!memset (fffff808`de9fc300)
fffff808`de9dc855 4c8b4e08        mov     r9,qword ptr [rsi+8]
fffff808`de9dc859 8d5703          lea     edx,[rdi+3]
fffff808`de9dc85c b8fcffffff      mov     eax,0FFFFFFFCh
fffff808`de9dc861 41b852615a52    mov     r8d,525A6152h
fffff808`de9dc867 4823d0          and     rdx,rax
fffff808`de9dc86a 8bcb            mov     ecx,ebx
fffff808`de9dc86c e8cbb8ffff      call    storport!RaidAllocatePool (fffff808`de9d813c)
fffff808`de9dc871 4885c0          test    rax,rax
fffff808`de9dc874 7431            je      storport!RaidUnitCompleteRequest+0xfd7 (fffff808`de9dc8a7)  Branch

storport!RaidUnitCompleteRequest+0xfa6:
fffff808`de9dc876 448bc7          mov     r8d,edi
fffff808`de9dc879 488d8ed80c0000  lea     rcx,[rsi+0CD8h]
fffff808`de9dc880 488bd0          mov     rdx,rax
fffff808`de9dc883 48ff1596a90500  call    qword ptr [storport!_imp_RtlInitializeBitMap (fffff808`dea37220)]
fffff808`de9dc88a 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc88f 488d8ed80c0000  lea     rcx,[rsi+0CD8h]
fffff808`de9dc896 48ff15e3ad0500  call    qword ptr [storport!_imp_RtlClearAllBits (fffff808`dea37680)]
fffff808`de9dc89d 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc8a2 e9ebfbffff      jmp     storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0xfd7:
fffff808`de9dc8a7 488b8ed00c0000  mov     rcx,qword ptr [rsi+0CD0h]
fffff808`de9dc8ae 4885c9          test    rcx,rcx
fffff808`de9dc8b1 7418            je      storport!RaidUnitCompleteRequest+0xffb (fffff808`de9dc8cb)  Branch

storport!RaidUnitCompleteRequest+0xfe3:
fffff808`de9dc8b3 ba52615a52      mov     edx,525A6152h
fffff808`de9dc8b8 48ff1569a90500  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff808`dea37228)]
fffff808`de9dc8bf 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc8c4 4c89aed00c0000  mov     qword ptr [rsi+0CD0h],r13

storport!RaidUnitCompleteRequest+0xffb:
fffff808`de9dc8cb 808ec201000020  or      byte ptr [rsi+1C2h],20h
fffff808`de9dc8d2 488b4e08        mov     rcx,qword ptr [rsi+8]
fffff808`de9dc8d6 48ff15a3a70500  call    qword ptr [storport!_imp_IoInvalidateDeviceState (fffff808`dea37080)]
fffff808`de9dc8dd 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dc8e2 e9abfbffff      jmp     storport!RaidUnitCompleteRequest+0xbc2 (fffff808`de9dc492)  Branch

storport!RaidUnitCompleteRequest+0x1017:
fffff808`de9dc8e7 488b5d98        mov     rbx,qword ptr [rbp-68h]

storport!RaidUnitCompleteRequest+0x101b:
fffff808`de9dc8eb 488b05be490500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff808`dea312b0)]
fffff808`de9dc8f2 a810            test    al,10h
fffff808`de9dc8f4 740f            je      storport!RaidUnitCompleteRequest+0x1035 (fffff808`de9dc905)  Branch

storport!RaidUnitCompleteRequest+0x1026:
fffff808`de9dc8f6 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dc8fa 4d8bc6          mov     r8,r14
fffff808`de9dc8fd 488bd3          mov     rdx,rbx
fffff808`de9dc900 e81fc90300      call    storport!RaidLogRequestComplete (fffff808`dea19224)

storport!RaidUnitCompleteRequest+0x1035:
fffff808`de9dc905 448b4330        mov     r8d,dword ptr [rbx+30h]
fffff808`de9dc909 b201            mov     dl,1
fffff808`de9dc90b 488bcb          mov     rcx,rbx
fffff808`de9dc90e e88d050000      call    storport!RaidCompleteRequestEx (fffff808`de9dcea0)
fffff808`de9dc913 b101            mov     cl,1
fffff808`de9dc915 eb43            jmp     storport!RaidUnitCompleteRequest+0x108a (fffff808`de9dc95a)  Branch

storport!RaidUnitCompleteRequest+0x1047:
fffff808`de9dc917 80be8100000000  cmp     byte ptr [rsi+81h],0
fffff808`de9dc91e 742c            je      storport!RaidUnitCompleteRequest+0x107c (fffff808`de9dc94c)  Branch

storport!RaidUnitCompleteRequest+0x1050:
fffff808`de9dc920 4533c9          xor     r9d,r9d
fffff808`de9dc923 4d8bc4          mov     r8,r12
fffff808`de9dc926 33d2            xor     edx,edx
fffff808`de9dc928 488bce          mov     rcx,rsi
fffff808`de9dc92b e898980000      call    storport!IsZonedWriteRequest (fffff808`de9e61c8)
fffff808`de9dc930 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dc934 84c0            test    al,al
fffff808`de9dc936 740e            je      storport!RaidUnitCompleteRequest+0x1076 (fffff808`de9dc946)  Branch

storport!RaidUnitCompleteRequest+0x1068:
fffff808`de9dc938 ff81b8160000    inc     dword ptr [rcx+16B8h]
fffff808`de9dc93e ff8654080000    inc     dword ptr [rsi+854h]
fffff808`de9dc944 eb06            jmp     storport!RaidUnitCompleteRequest+0x107c (fffff808`de9dc94c)  Branch

storport!RaidUnitCompleteRequest+0x1076:
fffff808`de9dc946 ff81bc160000    inc     dword ptr [rcx+16BCh]

storport!RaidUnitCompleteRequest+0x107c:
fffff808`de9dc94c 498bd4          mov     rdx,r12
fffff808`de9dc94f 488bce          mov     rcx,rsi
fffff808`de9dc952 e80d100000      call    storport!RaUnitAsyncError (fffff808`de9dd964)
fffff808`de9dc957 0fb6c8          movzx   ecx,al

storport!RaidUnitCompleteRequest+0x108a:
fffff808`de9dc95a 0fb64580        movzx   eax,byte ptr [rbp-80h]
fffff808`de9dc95e 241c            and     al,1Ch
fffff808`de9dc960 3c0c            cmp     al,0Ch
fffff808`de9dc962 0f84ee020000    je      storport!RaidUnitCompleteRequest+0x1386 (fffff808`de9dcc56)  Branch

storport!RaidUnitCompleteRequest+0x1098:
fffff808`de9dc968 84c9            test    cl,cl
fffff808`de9dc96a 0f84e6020000    je      storport!RaidUnitCompleteRequest+0x1386 (fffff808`de9dcc56)  Branch

storport!RaidUnitCompleteRequest+0x10a0:
fffff808`de9dc970 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dc974 4c8d45c0        lea     r8,[rbp-40h]
fffff808`de9dc978 4881c140030000  add     rcx,340h
fffff808`de9dc97f 488d55c8        lea     rdx,[rbp-38h]
fffff808`de9dc983 e808030000      call    storport!StorRemoveIoGatewayItem (fffff808`de9dcc90)
fffff808`de9dc988 488b55c0        mov     rdx,qword ptr [rbp-40h]
fffff808`de9dc98c 0fb6d8          movzx   ebx,al
fffff808`de9dc98f 4885d2          test    rdx,rdx
fffff808`de9dc992 7427            je      storport!RaidUnitCompleteRequest+0x10eb (fffff808`de9dc9bb)  Branch

storport!RaidUnitCompleteRequest+0x10c4:
fffff808`de9dc994 488b4240        mov     rax,qword ptr [rdx+40h]
fffff808`de9dc998 4c8d45c8        lea     r8,[rbp-38h]
fffff808`de9dc99c 4883c288        add     rdx,0FFFFFFFFFFFFFF88h
fffff808`de9dc9a0 4533c9          xor     r9d,r9d
fffff808`de9dc9a3 488b4820        mov     rcx,qword ptr [rax+20h]
fffff808`de9dc9a7 488b8188020000  mov     rax,qword ptr [rcx+288h]
fffff808`de9dc9ae 488b8980020000  mov     rcx,qword ptr [rcx+280h]
fffff808`de9dc9b5 ff156dae0500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff808`dea37828)]

storport!RaidUnitCompleteRequest+0x10eb:
fffff808`de9dc9bb 85db            test    ebx,ebx
fffff808`de9dc9bd 740b            je      storport!RaidUnitCompleteRequest+0x10fa (fffff808`de9dc9ca)  Branch

storport!RaidUnitCompleteRequest+0x10ef:
fffff808`de9dc9bf 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dc9c3 33d2            xor     edx,edx
fffff808`de9dc9c5 e846720000      call    storport!RaidAdapterRestartQueues (fffff808`de9e3c10)

storport!RaidUnitCompleteRequest+0x10fa:
fffff808`de9dc9ca 488b4618        mov     rax,qword ptr [rsi+18h]
fffff808`de9dc9ce 4532e4          xor     r12b,r12b
fffff808`de9dc9d1 4885c0          test    rax,rax
fffff808`de9dc9d4 0f84af000000    je      storport!RaidUnitCompleteRequest+0x11b9 (fffff808`de9dca89)  Branch

storport!RaidUnitCompleteRequest+0x110a:
fffff808`de9dc9da 4c8bb6f8010000  mov     r14,qword ptr [rsi+1F8h]
fffff808`de9dc9e1 4d85f6          test    r14,r14
fffff808`de9dc9e4 0f849f000000    je      storport!RaidUnitCompleteRequest+0x11b9 (fffff808`de9dca89)  Branch

storport!RaidUnitCompleteRequest+0x111a:
fffff808`de9dc9ea 4883b8c813000000 cmp     qword ptr [rax+13C8h],0
fffff808`de9dc9f2 0f8691000000    jbe     storport!RaidUnitCompleteRequest+0x11b9 (fffff808`de9dca89)  Branch

storport!RaidUnitCompleteRequest+0x1128:
fffff808`de9dc9f8 41837e0800      cmp     dword ptr [r14+8],0
fffff808`de9dc9fd 418bfd          mov     edi,r13d
fffff808`de9dca00 7659            jbe     storport!RaidUnitCompleteRequest+0x118b (fffff808`de9dca5b)  Branch

storport!RaidUnitCompleteRequest+0x1132:
fffff808`de9dca02 0f1f4000        nop     dword ptr [rax]
fffff808`de9dca06 66660f1f840000000000 nop word ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x1140:
fffff808`de9dca10 8bdf            mov     ebx,edi
fffff808`de9dca12 488d5520        lea     rdx,[rbp+20h]
fffff808`de9dca16 48ffc3          inc     rbx
fffff808`de9dca19 48c1e306        shl     rbx,6
fffff808`de9dca1d 4903de          add     rbx,r14
fffff808`de9dca20 488d4b28        lea     rcx,[rbx+28h]
fffff808`de9dca24 48ff1585a80500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff808`dea372b0)]
fffff808`de9dca2b 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dca30 488b03          mov     rax,qword ptr [rbx]
fffff808`de9dca33 483bc3          cmp     rax,rbx
fffff808`de9dca36 740b            je      storport!RaidUnitCompleteRequest+0x1173 (fffff808`de9dca43)  Branch

storport!RaidUnitCompleteRequest+0x1168:
fffff808`de9dca38 488b4028        mov     rax,qword ptr [rax+28h]
fffff808`de9dca3c 493bc7          cmp     rax,r15
fffff808`de9dca3f 4c0f42f8        cmovb   r15,rax

storport!RaidUnitCompleteRequest+0x1173:
fffff808`de9dca43 488d4d20        lea     rcx,[rbp+20h]
fffff808`de9dca47 48ff15e2a50500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff808`dea37030)]
fffff808`de9dca4e 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dca53 ffc7            inc     edi
fffff808`de9dca55 413b7e08        cmp     edi,dword ptr [r14+8]
fffff808`de9dca59 72b5            jb      storport!RaidUnitCompleteRequest+0x1140 (fffff808`de9dca10)  Branch

storport!RaidUnitCompleteRequest+0x118b:
fffff808`de9dca5b 4983ffff        cmp     r15,0FFFFFFFFFFFFFFFFh
fffff808`de9dca5f 498bdd          mov     rbx,r13
fffff808`de9dca62 490f45df        cmovne  rbx,r15
fffff808`de9dca66 4885db          test    rbx,rbx
fffff808`de9dca69 741e            je      storport!RaidUnitCompleteRequest+0x11b9 (fffff808`de9dca89)  Branch

storport!RaidUnitCompleteRequest+0x119b:
fffff808`de9dca6b 48ff1536a60500  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff808`dea370a8)]
fffff808`de9dca72 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dca77 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff808`de9dca7b 482bc3          sub     rax,rbx
fffff808`de9dca7e 483b81c8130000  cmp     rax,qword ptr [rcx+13C8h]
fffff808`de9dca85 410f97c4        seta    r12b

storport!RaidUnitCompleteRequest+0x11b9:
fffff808`de9dca89 488dbe90020000  lea     rdi,[rsi+290h]
fffff808`de9dca90 488d4f48        lea     rcx,[rdi+48h]
fffff808`de9dca94 48ff15f5a80500  call    qword ptr [storport!_imp_ExAcquireSpinLockShared (fffff808`dea37390)]
fffff808`de9dca9b 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dcaa0 448b6d84        mov     r13d,dword ptr [rbp-7Ch]
fffff808`de9dcaa4 4585ed          test    r13d,r13d
fffff808`de9dcaa7 7534            jne     storport!RaidUnitCompleteRequest+0x120d (fffff808`de9dcadd)  Branch

storport!RaidUnitCompleteRequest+0x11d9:
fffff808`de9dcaa9 44396f20        cmp     dword ptr [rdi+20h],r13d
fffff808`de9dcaad 752e            jne     storport!RaidUnitCompleteRequest+0x120d (fffff808`de9dcadd)  Branch

storport!RaidUnitCompleteRequest+0x11df:
fffff808`de9dcaaf 44396f28        cmp     dword ptr [rdi+28h],r13d
fffff808`de9dcab3 7528            jne     storport!RaidUnitCompleteRequest+0x120d (fffff808`de9dcadd)  Branch

storport!RaidUnitCompleteRequest+0x11e5:
fffff808`de9dcab5 44396f14        cmp     dword ptr [rdi+14h],r13d
fffff808`de9dcab9 7522            jne     storport!RaidUnitCompleteRequest+0x120d (fffff808`de9dcadd)  Branch

storport!RaidUnitCompleteRequest+0x11eb:
fffff808`de9dcabb 44396f10        cmp     dword ptr [rdi+10h],r13d
fffff808`de9dcabf 751c            jne     storport!RaidUnitCompleteRequest+0x120d (fffff808`de9dcadd)  Branch

storport!RaidUnitCompleteRequest+0x11f1:
fffff808`de9dcac1 f0ff4f4c        lock dec dword ptr [rdi+4Ch]
fffff808`de9dcac5 488d4f48        lea     rcx,[rdi+48h]
fffff808`de9dcac9 0fb6d0          movzx   edx,al
fffff808`de9dcacc 48ff15b5a80500  call    qword ptr [storport!_imp_ExReleaseSpinLockShared (fffff808`dea37388)]
fffff808`de9dcad3 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dcad8 e979010000      jmp     storport!RaidUnitCompleteRequest+0x1386 (fffff808`de9dcc56)  Branch

storport!RaidUnitCompleteRequest+0x120d:
fffff808`de9dcadd 0fb6d0          movzx   edx,al
fffff808`de9dcae0 488d4f48        lea     rcx,[rdi+48h]
fffff808`de9dcae4 48ff159da80500  call    qword ptr [storport!_imp_ExReleaseSpinLockShared (fffff808`dea37388)]
fffff808`de9dcaeb 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dcaf0 488d4f48        lea     rcx,[rdi+48h]
fffff808`de9dcaf4 48ff159da60500  call    qword ptr [storport!_imp_ExAcquireSpinLockExclusive (fffff808`dea37198)]
fffff808`de9dcafb 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dcb00 418bd5          mov     edx,r13d
fffff808`de9dcb03 488bcf          mov     rcx,rdi
fffff808`de9dcb06 0fb6d8          movzx   ebx,al
fffff808`de9dcb09 e85a0b0000      call    storport!RiDeleteDeviceQueueEntry (fffff808`de9dd668)
fffff808`de9dcb0e 410fb6d4        movzx   edx,r12b
fffff808`de9dcb12 488bcf          mov     rcx,rdi
fffff808`de9dcb15 e88a080000      call    storport!RiNormalizeDeviceQueue (fffff808`de9dd3a4)
fffff808`de9dcb1a 0fb6d3          movzx   edx,bl
fffff808`de9dcb1d 488d4f48        lea     rcx,[rdi+48h]
fffff808`de9dcb21 4c8bf8          mov     r15,rax
fffff808`de9dcb24 48ff153da50500  call    qword ptr [storport!_imp_ExReleaseSpinLockExclusive (fffff808`dea37068)]
fffff808`de9dcb2b 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dcb30 4d85ff          test    r15,r15
fffff808`de9dcb33 0f84b6000000    je      storport!RaidUnitCompleteRequest+0x131f (fffff808`de9dcbef)  Branch

storport!RaidUnitCompleteRequest+0x1269:
fffff808`de9dcb39 803d504d050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff808`dea31890)],0
fffff808`de9dcb40 7477            je      storport!RaidUnitCompleteRequest+0x12e9 (fffff808`de9dcbb9)  Branch

storport!RaidUnitCompleteRequest+0x1272:
fffff808`de9dcb42 0fb60d994c0500  movzx   ecx,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff808`dea317e2)]
fffff808`de9dcb49 84c9            test    cl,cl
fffff808`de9dcb4b 796c            jns     storport!RaidUnitCompleteRequest+0x12e9 (fffff808`de9dcbb9)  Branch

storport!RaidUnitCompleteRequest+0x127d:
fffff808`de9dcb4d 33c0            xor     eax,eax
fffff808`de9dcb4f 488d5558        lea     rdx,[rbp+58h]
fffff808`de9dcb53 498d4f88        lea     rcx,[r15-78h]
fffff808`de9dcb57 48894558        mov     qword ptr [rbp+58h],rax
fffff808`de9dcb5b 48894560        mov     qword ptr [rbp+60h],rax
fffff808`de9dcb5f 48ff15eaa50500  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff808`dea37150)]
fffff808`de9dcb66 0f1f440000      nop     dword ptr [rax+rax]
fffff808`de9dcb6b 0fb605704c0500  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff808`dea317e2)]
fffff808`de9dcb72 84c0            test    al,al
fffff808`de9dcb74 7943            jns     storport!RaidUnitCompleteRequest+0x12e9 (fffff808`de9dcbb9)  Branch

storport!RaidUnitCompleteRequest+0x12a6:
fffff808`de9dcb76 8b8ea4020000    mov     ecx,dword ptr [rsi+2A4h]
fffff808`de9dcb7c 4c8d4558        lea     r8,[rbp+58h]
fffff808`de9dcb80 038ea0020000    add     ecx,dword ptr [rsi+2A0h]
fffff808`de9dcb86 ba00000000      mov     edx,0
fffff808`de9dcb8b 41f6471606      test    byte ptr [r15+16h],6
fffff808`de9dcb90 4c8bcf          mov     r9,rdi
fffff808`de9dcb93 8b86dc020000    mov     eax,dword ptr [rsi+2DCh]
fffff808`de9dcb99 89442440        mov     dword ptr [rsp+40h],eax
fffff808`de9dcb9d 0f95c2          setne   dl
fffff808`de9dcba0 894c2438        mov     dword ptr [rsp+38h],ecx
fffff808`de9dcba4 ffc2            inc     edx
fffff808`de9dcba6 c644243000      mov     byte ptr [rsp+30h],0
fffff808`de9dcbab c644242805      mov     byte ptr [rsp+28h],5
fffff808`de9dcbb0 89542420        mov     dword ptr [rsp+20h],edx
fffff808`de9dcbb4 e8c7fe0200      call    storport!McTemplateK0pquuqqd (fffff808`dea0ca80)

storport!RaidUnitCompleteRequest+0x12e9:
fffff808`de9dcbb9 488b8e98020000  mov     rcx,qword ptr [rsi+298h]
fffff808`de9dcbc0 4c8d4500        lea     r8,[rbp]
fffff808`de9dcbc4 498bd7          mov     rdx,r15
fffff808`de9dcbc7 e86c0b0000      call    storport!StorSubmitIoGatewayItem (fffff808`de9dd738)
fffff808`de9dcbcc 84c0            test    al,al
fffff808`de9dcbce 751f            jne     storport!RaidUnitCompleteRequest+0x131f (fffff808`de9dcbef)  Branch

storport!RaidUnitCompleteRequest+0x1300:
fffff808`de9dcbd0 488b8688020000  mov     rax,qword ptr [rsi+288h]
fffff808`de9dcbd7 4c8d4500        lea     r8,[rbp]
fffff808`de9dcbdb 488b8e80020000  mov     rcx,qword ptr [rsi+280h]
fffff808`de9dcbe2 498d5788        lea     rdx,[r15-78h]
fffff808`de9dcbe6 4533c9          xor     r9d,r9d
fffff808`de9dcbe9 ff1539ac0500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff808`dea37828)]

storport!RaidUnitCompleteRequest+0x131f:
fffff808`de9dcbef 4585ed          test    r13d,r13d
fffff808`de9dcbf2 7462            je      storport!RaidUnitCompleteRequest+0x1386 (fffff808`de9dcc56)  Branch

storport!RaidUnitCompleteRequest+0x1324:
fffff808`de9dcbf4 488bcf          mov     rcx,rdi
fffff808`de9dcbf7 e848070000      call    storport!RaidNormalizeDeviceQueue (fffff808`de9dd344)
fffff808`de9dcbfc 488bd8          mov     rbx,rax
fffff808`de9dcbff 4885c0          test    rax,rax
fffff808`de9dcc02 7452            je      storport!RaidUnitCompleteRequest+0x1386 (fffff808`de9dcc56)  Branch

storport!RaidUnitCompleteRequest+0x1334:
fffff808`de9dcc04 0f1f4000        nop     dword ptr [rax]
fffff808`de9dcc08 0f1f840000000000 nop     dword ptr [rax+rax]

storport!RaidUnitCompleteRequest+0x1340:
fffff808`de9dcc10 488b8e98020000  mov     rcx,qword ptr [rsi+298h]
fffff808`de9dcc17 4c8d4500        lea     r8,[rbp]
fffff808`de9dcc1b 488bd3          mov     rdx,rbx
fffff808`de9dcc1e e8150b0000      call    storport!StorSubmitIoGatewayItem (fffff808`de9dd738)
fffff808`de9dcc23 84c0            test    al,al
fffff808`de9dcc25 751f            jne     storport!RaidUnitCompleteRequest+0x1376 (fffff808`de9dcc46)  Branch

storport!RaidUnitCompleteRequest+0x1357:
fffff808`de9dcc27 488b8688020000  mov     rax,qword ptr [rsi+288h]
fffff808`de9dcc2e 488d5388        lea     rdx,[rbx-78h]
fffff808`de9dcc32 488b8e80020000  mov     rcx,qword ptr [rsi+280h]
fffff808`de9dcc39 4c8d4500        lea     r8,[rbp]
fffff808`de9dcc3d 4533c9          xor     r9d,r9d
fffff808`de9dcc40 ff15e2ab0500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff808`dea37828)]

storport!RaidUnitCompleteRequest+0x1376:
fffff808`de9dcc46 488bcf          mov     rcx,rdi
fffff808`de9dcc49 e8f6060000      call    storport!RaidNormalizeDeviceQueue (fffff808`de9dd344)
fffff808`de9dcc4e 488bd8          mov     rbx,rax
fffff808`de9dcc51 4885c0          test    rax,rax
fffff808`de9dcc54 75ba            jne     storport!RaidUnitCompleteRequest+0x1340 (fffff808`de9dcc10)  Branch

storport!RaidUnitCompleteRequest+0x1386:
fffff808`de9dcc56 4c8bbc24b0010000 mov     r15,qword ptr [rsp+1B0h]
fffff808`de9dcc5e 488bbc24a8010000 mov     rdi,qword ptr [rsp+1A8h]
fffff808`de9dcc66 488b4d68        mov     rcx,qword ptr [rbp+68h]
fffff808`de9dcc6a 4833cc          xor     rcx,rsp
fffff808`de9dcc6d e8de930100      call    storport!_security_check_cookie (fffff808`de9f6050)
fffff808`de9dcc72 488b9c24b8010000 mov     rbx,qword ptr [rsp+1B8h]
fffff808`de9dcc7a 4881c470010000  add     rsp,170h
fffff808`de9dcc81 415e            pop     r14
fffff808`de9dcc83 415d            pop     r13
fffff808`de9dcc85 415c            pop     r12
fffff808`de9dcc87 5e              pop     rsi
fffff808`de9dcc88 5d              pop     rbp
fffff808`de9dcc89 c3              ret
