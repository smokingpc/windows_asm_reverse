12: kd> uf storport!StorPortNotification
Flow analysis was incomplete, some code may be missing

;RCX = NotifyType
;RDX = pAE
;R8 = SRB

storport!StorPortNotification:
fffff80c`bee35270 4889542410      mov     qword ptr [rsp+10h],rdx
fffff80c`bee35275 4c89442418      mov     qword ptr [rsp+18h],r8
fffff80c`bee3527a 4c894c2420      mov     qword ptr [rsp+20h],r9
fffff80c`bee3527f 55              push    rbp
fffff80c`bee35280 57              push    rdi
fffff80c`bee35281 4881ecc8000000  sub     rsp,0C8h
fffff80c`bee35288 33ed            xor     ebp,ebp
fffff80c`bee3528a 33c0            xor     eax,eax
fffff80c`bee3528c 4889842480000000 mov     qword ptr [rsp+80h],rax
fffff80c`bee35294 4c8bca          mov     r9,rdx
fffff80c`bee35297 8bfd            mov     edi,ebp
fffff80c`bee35299 4885d2          test    rdx,rdx
fffff80c`bee3529c 7407            je      storport!StorPortNotification+0x35 (fffff80c`bee352a5)  Branch

storport!StorPortNotification+0x2e:
fffff80c`bee3529e 4c8b42f0        mov     r8,qword ptr [rdx-10h]
fffff80c`bee352a2 498b38          mov     rdi,qword ptr [r8]

storport!StorPortNotification+0x35:
fffff80c`bee352a5 48899c24c0000000 mov     qword ptr [rsp+0C0h],rbx
fffff80c`bee352ad 488d9424f0000000 lea     rdx,[rsp+0F0h]
fffff80c`bee352b5 4889b424b8000000 mov     qword ptr [rsp+0B8h],rsi
fffff80c`bee352bd 4c89b424a0000000 mov     qword ptr [rsp+0A0h],r14
fffff80c`bee352c5 4c89bc2498000000 mov     qword ptr [rsp+98h],r15
fffff80c`bee352cd 81f900100000    cmp     ecx,1000h
fffff80c`bee352d3 0f8f9e030000    jg      storport!StorPortNotification+0x407 (fffff80c`bee35677)  Branch

storport!StorPortNotification+0x69:
fffff80c`bee352d9 0f8433030000    je      storport!StorPortNotification+0x3a2 (fffff80c`bee35612)  Branch

storport!StorPortNotification+0x6f:
fffff80c`bee352df 83f90f          cmp     ecx,0Fh
fffff80c`bee352e2 0f8713080000    ja      storport!StorPortNotification+0x88b (fffff80c`bee35afb)  Branch

storport!StorPortNotification+0x78:
fffff80c`bee352e8 4863c9          movsxd  rcx,ecx
fffff80c`bee352eb 4c8d050eadffff  lea     r8,[storport!RaUnitAtaPassThroughIoctl <PERF> (storport+0x0) (fffff80c`bee30000)]
fffff80c`bee352f2 418b8c883c640500 mov     ecx,dword ptr [r8+rcx*4+5643Ch] ;=> fffff80c`bee30000+rcx*4+0x5643C =>從fffff80c`bee8643c開始找 offset table

;fffff80c`bee8643c  00005303 00005afb 00005afb 00005341     ;00005303=> RequestComplete的offset
;fffff80c`bee8644c  00005afb 00005afb 00005468 000053e7
;fffff80c`bee8645c  000054fc 00005afb 000055a8 00005592
;fffff80c`bee8646c  000055be 000055d3 000055f2 00005602
;fffff80c`bee8647c  000056d9 000057be 000057ef 00005883
;fffff80c`bee8648c  000059c4 00005924 00005b94 000056a1
;fffff80c`bee8649c  00005719 00005769 00005c80 000075b4
;fffff80c`bee864ac  0000756f 0002dbb3 0002db17 0002dbb3
;fffff80c`bee864bc  0002dae1 0000756f 0002dbb3 0000756f
;fffff80c`bee864cc  0002dbb3 0002dbb3 0002dbb3 0002dbb3
;fffff80c`bee864dc  0002dbb3 0002dbb3 0002dba1 0002dbb3
;fffff80c`bee864ec  0002daf3 0002dba1 0002dbb3 0002db05
;fffff80c`bee864fc  0002dbb3 0002db8a 000075ec 00007616
;fffff80c`bee8650c  00007658 0002dbb3 0002dbb3 0002dbb3
;fffff80c`bee8651c  0002dbb3 0002dbb3 0002dba1 


fffff80c`bee352fa 4903c8          add     rcx,r8
fffff80c`bee352fd ffe1            jmp     rcx
;中間這一段是dispatcher...

12: kd> u fffff80c`bee35300 fffff80c`bee35612
storport!StorPortNotification+0x90:
fffff80c`bee35300 cc              int     3
fffff80c`bee35301 cc              int     3
fffff80c`bee35302 cc              int     3
;===========>  RequestComplete BEGIN
fffff80c`bee35303 488b02          mov     rax,qword ptr [rdx]
fffff80c`bee35306 4885ff          test    rdi,rdi   ;rdi == RAID_ADAPTER_EXTENSION, if(AdapterExt == NULL) return
fffff80c`bee35309 0f84ec070000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee3530f 4885c0          test    rax,rax   ;if(srb==NULL) return
fffff80c`bee35312 0f84e3070000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee35318 80780228        cmp     byte ptr [rax+2],28h      ;if(srb->function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0xb4
fffff80c`bee3531c 7506            jne     storport!StorPortNotification+0xb4 (fffff80c`bee35324)
fffff80c`bee3531e 488b5060        mov     rdx,qword ptr [rax+60h]       ;rdx = Srb->PortContext
fffff80c`bee35322 eb04            jmp     storport!StorPortNotification+0xb8 (fffff80c`bee35328)
;if(srb->function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) RDX == OriginalRequest
;else {RDX = Srb->PortContext}

storport!StorPortNotification+0xb4:
fffff80c`bee35324 488b5030        mov     rdx,qword ptr [rax+30h]       ;if (SRB is SCSI_REQUEST_BLOCK) RDX == OriginalRequest

storport!StorPortNotification+0xb8:
fffff80c`bee35328 4885d2          test    rdx,rdx
fffff80c`bee3532b 0f84ca070000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee35331 4533c0          xor     r8d,r8d
fffff80c`bee35334 488bcf          mov     rcx,rdi
fffff80c`bee35337 e874090000      call    storport!RaidAdapterRequestComplete (fffff80c`bee35cb0) ;RaidAdapterRequestComplete(AdapterExt, Srb->PortContext, 0);
fffff80c`bee3533c e9ba070000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)

;<===========  RequestComplete END

fffff80c`bee35341 4885ff          test    rdi,rdi
fffff80c`bee35344 0f84b1070000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee3534a 8b8f18020000    mov     ecx,dword ptr [rdi+218h]
fffff80c`bee35350 4c8bc7          mov     r8,rdi
fffff80c`bee35353 488b9424d8000000 mov     rdx,qword ptr [rsp+0D8h]
fffff80c`bee3535b 448b4f38        mov     r9d,dword ptr [rdi+38h]
fffff80c`bee3535f 4889442430      mov     qword ptr [rsp+30h],rax
fffff80c`bee35364 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff80c`bee35369 488bcf          mov     rcx,rdi
fffff80c`bee3536c 4889542420      mov     qword ptr [rsp+20h],rdx
fffff80c`bee35371 ba27000000      mov     edx,27h
fffff80c`bee35376 e879d2ffff      call    storport!DbgLogRequest (fffff80c`bee325f4)
fffff80c`bee3537b f6055ec4050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80c`bee917e0)],2
fffff80c`bee35382 8b9f18020000    mov     ebx,dword ptr [rdi+218h]
fffff80c`bee35388 741f            je      storport!StorPortNotification+0x139 (fffff80c`bee353a9)
fffff80c`bee3538a 8b4738          mov     eax,dword ptr [rdi+38h]
fffff80c`bee3538d 488d1544040500  lea     rdx,[storport!EventResetDetected (fffff80c`bee857d8)]
fffff80c`bee35394 4c8b8c24e8000000 mov     r9,qword ptr [rsp+0E8h]
fffff80c`bee3539c 895c2428        mov     dword ptr [rsp+28h],ebx
fffff80c`bee353a0 89442420        mov     dword ptr [rsp+20h],eax
fffff80c`bee353a4 e863820300      call    storport!McTemplateK0pqq (fffff80c`bee6d60c)
fffff80c`bee353a9 85db            test    ebx,ebx
fffff80c`bee353ab 0f844a070000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee353b1 b800093d00      mov     eax,3D0900h
fffff80c`bee353b6 3bd8            cmp     ebx,eax
fffff80c`bee353b8 0f47d8          cmova   ebx,eax
fffff80c`bee353bb b883de1b43      mov     eax,431BDE83h
fffff80c`bee353c0 f7e3            mul     eax,ebx
fffff80c`bee353c2 8bca            mov     ecx,edx
fffff80c`bee353c4 c1e912          shr     ecx,12h
fffff80c`bee353c7 69c140420f00    imul    eax,ecx,0F4240h
fffff80c`bee353cd 8d5101          lea     edx,[rcx+1]
fffff80c`bee353d0 3bd8            cmp     ebx,eax
fffff80c`bee353d2 0f44d1          cmove   edx,ecx
fffff80c`bee353d5 488b8c24e8000000 mov     rcx,qword ptr [rsp+0E8h]
fffff80c`bee353dd e88e970300      call    storport!StorPortPause (fffff80c`bee6eb70)
fffff80c`bee353e2 e914070000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee353e7 4885ff          test    rdi,rdi
fffff80c`bee353ea 0f840b070000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee353f0 8b8f18020000    mov     ecx,dword ptr [rdi+218h]
fffff80c`bee353f6 4c8bc7          mov     r8,rdi
fffff80c`bee353f9 488b9424d8000000 mov     rdx,qword ptr [rsp+0D8h]
fffff80c`bee35401 448b4f38        mov     r9d,dword ptr [rdi+38h]
fffff80c`bee35405 4889442430      mov     qword ptr [rsp+30h],rax
fffff80c`bee3540a 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff80c`bee3540f 488bcf          mov     rcx,rdi
fffff80c`bee35412 4889542420      mov     qword ptr [rsp+20h],rdx
fffff80c`bee35417 ba26000000      mov     edx,26h
fffff80c`bee3541c e8d3d1ffff      call    storport!DbgLogRequest (fffff80c`bee325f4)
fffff80c`bee35421 f605b8c3050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80c`bee917e0)],2
fffff80c`bee35428 741b            je      storport!StorPortNotification+0x1d5 (fffff80c`bee35445)
fffff80c`bee3542a 8b4738          mov     eax,dword ptr [rdi+38h]
fffff80c`bee3542d 488d1534050500  lea     rdx,[storport!EventBusChangeDetected (fffff80c`bee85968)]
fffff80c`bee35434 4c8b8c24e8000000 mov     r9,qword ptr [rsp+0E8h]
fffff80c`bee3543c 89442420        mov     dword ptr [rsp+20h],eax
fffff80c`bee35440 e853810300      call    storport!McTemplateK0pq (fffff80c`bee6d598)
fffff80c`bee35445 488d8f08080000  lea     rcx,[rdi+808h]
fffff80c`bee3544c 66c747690101    mov     word ptr [rdi+69h],101h
fffff80c`bee35452 4533c0          xor     r8d,r8d
fffff80c`bee35455 33d2            xor     edx,edx
fffff80c`bee35457 48ff15e2220600  call    qword ptr [storport!_imp_KeInsertQueueDpc (fffff80c`bee97740)]
fffff80c`bee3545e 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`bee35463 e993060000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee35468 488b32          mov     rsi,qword ptr [rdx]
fffff80c`bee3546b 8b5a08          mov     ebx,dword ptr [rdx+8]
fffff80c`bee3546e 4885ff          test    rdi,rdi
fffff80c`bee35471 0f8484060000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee35477 f60562c3050002  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff80c`bee917e0)],2
fffff80c`bee3547e 7417            je      storport!StorPortNotification+0x227 (fffff80c`bee35497)
fffff80c`bee35480 8b4738          mov     eax,dword ptr [rdi+38h]
fffff80c`bee35483 488d154e040500  lea     rdx,[storport!EventRequestTimerCall (fffff80c`bee858d8)]
fffff80c`bee3548a 895c2428        mov     dword ptr [rsp+28h],ebx
fffff80c`bee3548e 89442420        mov     dword ptr [rsp+20h],eax
fffff80c`bee35492 e875810300      call    storport!McTemplateK0pqq (fffff80c`bee6d60c)
fffff80c`bee35497 440f20c0        mov     rax,cr8
fffff80c`bee3549b 3c02            cmp     al,2
fffff80c`bee3549d 774a            ja      storport!StorPortNotification+0x279 (fffff80c`bee354e9)
fffff80c`bee3549f 488d8fc0060000  lea     rcx,[rdi+6C0h]
fffff80c`bee354a6 85db            test    ebx,ebx
fffff80c`bee354a8 7511            jne     storport!StorPortNotification+0x24b (fffff80c`bee354bb)
fffff80c`bee354aa 48ff15371d0600  call    qword ptr [storport!_imp_KeCancelTimer (fffff80c`bee971e8)]
fffff80c`bee354b1 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`bee354b6 e940060000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee354bb 488d8780060000  lea     rax,[rdi+680h]
fffff80c`bee354c2 4889b7c0070000  mov     qword ptr [rdi+7C0h],rsi
fffff80c`bee354c9 486bd3f6        imul    rdx,rbx,0FFFFFFFFFFFFFFF6h
fffff80c`bee354cd 4533c9          xor     r9d,r9d
fffff80c`bee354d0 4889442420      mov     qword ptr [rsp+20h],rax
fffff80c`bee354d5 4533c0          xor     r8d,r8d
fffff80c`bee354d8 48ff15011e0600  call    qword ptr [storport!_imp_KeSetCoalescableTimer (fffff80c`bee972e0)]
fffff80c`bee354df 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`bee354e4 e912060000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee354e9 448bc3          mov     r8d,ebx
fffff80c`bee354ec 488bd6          mov     rdx,rsi
fffff80c`bee354ef 488bcf          mov     rcx,rdi
fffff80c`bee354f2 e8b1360300      call    storport!RaidAdapterRequestTimerDeferred (fffff80c`bee68ba8)
fffff80c`bee354f7 e9ff050000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee354fc 0fb66a08        movzx   ebp,byte ptr [rdx+8]
fffff80c`bee35500 4532f6          xor     r14b,r14b
fffff80c`bee35503 488b32          mov     rsi,qword ptr [rdx]
fffff80c`bee35506 4532ff          xor     r15b,r15b
fffff80c`bee35509 4080fdff        cmp     bpl,0FFh
fffff80c`bee3550d 740a            je      storport!StorPortNotification+0x2a9 (fffff80c`bee35519)
fffff80c`bee3550f 440fb67210      movzx   r14d,byte ptr [rdx+10h]
fffff80c`bee35514 440fb67a18      movzx   r15d,byte ptr [rdx+18h]
fffff80c`bee35519 4885f6          test    rsi,rsi
fffff80c`bee3551c 0f84d9050000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee35522 813e80000000    cmp     dword ptr [rsi],80h
fffff80c`bee35528 0f87cd050000    ja      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee3552e 4885ff          test    rdi,rdi
fffff80c`bee35531 0f84c4050000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee35537 488d8f50060000  lea     rcx,[rdi+650h]
fffff80c`bee3553e 48ff156b1b0600  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff80c`bee970b0)]
fffff80c`bee35545 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`bee3554a 488bd8          mov     rbx,rax
fffff80c`bee3554d 4885c0          test    rax,rax
fffff80c`bee35550 0f84a5050000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee35556 c7401002200708  mov     dword ptr [rax+10h],8072002h
fffff80c`bee3555d 40886820        mov     byte ptr [rax+20h],bpl
fffff80c`bee35561 4080fdff        cmp     bpl,0FFh
fffff80c`bee35565 7408            je      storport!StorPortNotification+0x2ff (fffff80c`bee3556f)
fffff80c`bee35567 44887021        mov     byte ptr [rax+21h],r14b
fffff80c`bee3556b 44887822        mov     byte ptr [rax+22h],r15b
fffff80c`bee3556f 448b06          mov     r8d,dword ptr [rsi]
fffff80c`bee35572 488d4828        lea     rcx,[rax+28h]
fffff80c`bee35576 488bd6          mov     rdx,rsi
fffff80c`bee35579 e842650200      call    storport!memcpy (fffff80c`bee5bac0)
fffff80c`bee3557e 488d8f00060000  lea     rcx,[rdi+600h]
fffff80c`bee35585 488bd3          mov     rdx,rbx
fffff80c`bee35588 e8dfceffff      call    storport!RaidQueueDeferredItem (fffff80c`bee3246c)
fffff80c`bee3558d e969050000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee35592 4885ff          test    rdi,rdi
fffff80c`bee35595 0f8460050000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee3559b 488bcf          mov     rcx,rdi
fffff80c`bee3559e e885870300      call    storport!RaidpLinkDown (fffff80c`bee6dd28)
fffff80c`bee355a3 e953050000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee355a8 4885ff          test    rdi,rdi
fffff80c`bee355ab 0f844a050000    je      storport!StorPortNotification+0x88b (fffff80c`bee35afb)
fffff80c`bee355b1 488bcf          mov     rcx,rdi
fffff80c`bee355b4 e8d7870300      call    storport!RaidpLinkUp (fffff80c`bee6dd90)
fffff80c`bee355b9 e93d050000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee355be 488b0a          mov     rcx,qword ptr [rdx]
fffff80c`bee355c1 48a12003000080f7ffff mov rax,qword ptr [FFFFF78000000320h]
fffff80c`bee355cb 488901          mov     qword ptr [rcx],rax
fffff80c`bee355ce e928050000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee355d3 4533c9          xor     r9d,r9d
fffff80c`bee355d6 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff80c`bee355db 4533c0          xor     r8d,r8d
fffff80c`bee355de 33d2            xor     edx,edx
fffff80c`bee355e0 b9f7000000      mov     ecx,0F7h
fffff80c`bee355e5 48ff158c1a0600  call    qword ptr [storport!_imp_KeBugCheckEx (fffff80c`bee97078)]
fffff80c`bee355ec 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`bee355f1 cc              int     3
fffff80c`bee355f2 4c8b4208        mov     r8,qword ptr [rdx+8]
fffff80c`bee355f6 8b12            mov     edx,dword ptr [rdx]
fffff80c`bee355f8 e863f50300      call    storport!RaidHandleTraceNotifyType (fffff80c`bee74b60)
fffff80c`bee355fd e9f9040000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee35602 488b12          mov     rdx,qword ptr [rdx]
fffff80c`bee35605 498bc9          mov     rcx,r9
fffff80c`bee35608 e883ae0300      call    storport!StorpGetExtendedTable (fffff80c`bee70490)
fffff80c`bee3560d e9e9040000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)


fffff80c`bee35612 498b41f0        mov     rax,qword ptr [r9-10h]


storport!StorPortNotification+0x3a2:
fffff80c`bee35612 498b41f0        mov     rax,qword ptr [r9-10h]
fffff80c`bee35616 4c8b02          mov     r8,qword ptr [rdx]
fffff80c`bee35619 488b5a08        mov     rbx,qword ptr [rdx+8]
fffff80c`bee3561d 488b08          mov     rcx,qword ptr [rax]
fffff80c`bee35620 f6416810        test    byte ptr [rcx+68h],10h
fffff80c`bee35624 753e            jne     storport!StorPortNotification+0x3f4 (fffff80c`bee35664)  Branch

storport!StorPortNotification+0x3b6:
fffff80c`bee35626 488b0dd3b90500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80c`bee91000)]
fffff80c`bee3562d 488d05ccb90500  lea     rax,[storport!WPP_GLOBAL_Control (fffff80c`bee91000)]
fffff80c`bee35634 483bc8          cmp     rcx,rax
fffff80c`bee35637 7437            je      storport!StorPortNotification+0x400 (fffff80c`bee35670)  Branch

storport!StorPortNotification+0x3c9:
fffff80c`bee35639 f7412c00010000  test    dword ptr [rcx+2Ch],100h
fffff80c`bee35640 742e            je      storport!StorPortNotification+0x400 (fffff80c`bee35670)  Branch

storport!StorPortNotification+0x3d2:
fffff80c`bee35642 80792901        cmp     byte ptr [rcx+29h],1
fffff80c`bee35646 7228            jb      storport!StorPortNotification+0x400 (fffff80c`bee35670)  Branch

storport!StorPortNotification+0x3d8:
fffff80c`bee35648 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80c`bee3564c 4c8d05e5040500  lea     r8,[storport!WPP_890ff0257e5a37fc61b1814295f1a13c_Traceguids (fffff80c`bee85b38)]
fffff80c`bee35653 ba17000000      mov     edx,17h
fffff80c`bee35658 e847600300      call    storport!WPP_SF_ (fffff80c`bee6b6a4)
fffff80c`bee3565d 892b            mov     dword ptr [rbx],ebp
fffff80c`bee3565f e997040000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)  Branch

storport!StorPortNotification+0x3f4:
fffff80c`bee35664 4c898178110000  mov     qword ptr [rcx+1178h],r8
fffff80c`bee3566b bd01000000      mov     ebp,1

storport!StorPortNotification+0x400:
fffff80c`bee35670 892b            mov     dword ptr [rbx],ebp
fffff80c`bee35672 e984040000      jmp     storport!StorPortNotification+0x88b (fffff80c`bee35afb)  Branch

storport!StorPortNotification+0x407:
fffff80c`bee35677 81c1ffefffff    add     ecx,0FFFFEFFFh
fffff80c`bee3567d 83f90a          cmp     ecx,0Ah
fffff80c`bee35680 0f8775040000    ja      storport!StorPortNotification+0x88b (fffff80c`bee35afb)  Branch

storport!StorPortNotification+0x416:
fffff80c`bee35686 4c8d0573a9ffff  lea     r8,[storport!RaUnitAtaPassThroughIoctl <PERF> (storport+0x0) (fffff80c`bee30000)]
fffff80c`bee3568d 4863c1          movsxd  rax,ecx
fffff80c`bee35690 418b84807c640500 mov     eax,dword ptr [r8+rax*4+5647Ch]
fffff80c`bee35698 4903c0          add     rax,r8
fffff80c`bee3569b ffe0            jmp     rax

storport!StorPortNotification+0x88b:
fffff80c`bee35afb 4c8bbc2498000000 mov     r15,qword ptr [rsp+98h]
fffff80c`bee35b03 4c8bb424a0000000 mov     r14,qword ptr [rsp+0A0h]
fffff80c`bee35b0b 488bb424b8000000 mov     rsi,qword ptr [rsp+0B8h]
fffff80c`bee35b13 488b9c24c0000000 mov     rbx,qword ptr [rsp+0C0h]
fffff80c`bee35b1b 4881c4c8000000  add     rsp,0C8h
fffff80c`bee35b22 5f              pop     rdi
fffff80c`bee35b23 5d              pop     rbp
fffff80c`bee35b24 c3              ret
