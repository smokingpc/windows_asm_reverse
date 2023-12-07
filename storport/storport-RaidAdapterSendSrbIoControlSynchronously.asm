0: kd> uf RaidAdapterSendSrbIoControlSynchronously
storport!RaidAdapterSendSrbIoControlSynchronously:
fffff80e`6c5ef3b0 44894c2420      mov     dword ptr [rsp+20h],r9d   ;r9d == IRP SystemBuffer input size + output size
fffff80e`6c5ef3b5 4c89442418      mov     qword ptr [rsp+18h],r8    ;r8 == irp->AssociatedIrp->SystemBuffer, buffer combined by input buffer and output buffer
fffff80e`6c5ef3ba 4889542410      mov     qword ptr [rsp+10h],rdx   ;rdx == IRP
fffff80e`6c5ef3bf 53              push    rbx
fffff80e`6c5ef3c0 55              push    rbp
fffff80e`6c5ef3c1 56              push    rsi
fffff80e`6c5ef3c2 57              push    rdi
fffff80e`6c5ef3c3 4154            push    r12
fffff80e`6c5ef3c5 4155            push    r13
fffff80e`6c5ef3c7 4156            push    r14
fffff80e`6c5ef3c9 4157            push    r15           ;caller allocated input buffer. (SRB_IO_CONTROL)
fffff80e`6c5ef3cb 4883ec58        sub     rsp,58h
fffff80e`6c5ef3cf 8b99bc010000    mov     ebx,dword ptr [rcx+1BCh]  ;=PORT_CONFIGURATION_INFORMATIOM->SrbExtensionSize
fffff80e`6c5ef3d5 4d8be8          mov     r13,r8
fffff80e`6c5ef3d8 448a8192010000  mov     r8b,byte ptr [rcx+192h]   ;=PORT_CONFIGURATION_INFORMATIOM->SrbType , 1 == STORAGE_REQUESt_BLOCK
fffff80e`6c5ef3df 488bf1          mov     rsi,rcx       ;RCX == AdapterExt
fffff80e`6c5ef3e2 488b4908        mov     rcx,qword ptr [rcx+8]     ;=PORT_CONFIGURATION_INFORMATIOM->DeviceObject
fffff80e`6c5ef3e6 4533ff          xor     r15d,r15d
fffff80e`6c5ef3e9 458bf1          mov     r14d,r9d
fffff80e`6c5ef3ec 83c307          add     ebx,7
fffff80e`6c5ef3ef 4533c9          xor     r9d,r9d
fffff80e`6c5ef3f2 4533e4          xor     r12d,r12d
fffff80e`6c5ef3f5 83e3f8          and     ebx,0FFFFFFF8h    ;ebx = (SrbExtensionSize+7)/4
fffff80e`6c5ef3f8 418d5702        lea     edx,[r15+2]   ;edx==SRB_FUNCTION_IOCONTROL ?
fffff80e`6c5ef3fc e88b7bffff      call    storport!RaidAllocateSrb (fffff80e`6c5e6f8c) ; RaidAllocateSrb(devobj, 0, current SRB Type, 0)
fffff80e`6c5ef401 4c8bc6          mov     r8,rsi        ;AdapterExt
fffff80e`6c5ef404 8d8b40040000    lea     ecx,[rbx+440h]        ;SrbExtensionSize對齊DWORD後的值+440  丟到 ECX 去
fffff80e`6c5ef40a 488bf8          mov     rdi,rax   ;RAX==RDI== SRB
fffff80e`6c5ef40d e80ac9ffff      call    storport!StorAllocateContiguousIoResources (fffff80e`6c5ebd1c) ;StorAllocateContiguousIoResources(??)
fffff80e`6c5ef412 33db            xor     ebx,ebx
fffff80e`6c5ef414 488be8          mov     rbp,rax   ;RBP = RAX == (XRB-0x20) == ContiguousIoResources
fffff80e`6c5ef417 4885ff          test    rdi,rdi       ;if SRB == NULL , goto 0x20638
fffff80e`6c5ef41a 0f84c8050200    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x20638 (fffff80e`6c60f9e8)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x70:
fffff80e`6c5ef420 4885c0          test    rax,rax       ;if IoResources == NULL, goto 0x20638
fffff80e`6c5ef423 0f84bf050200    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x20638 (fffff80e`6c60f9e8)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x79:
fffff80e`6c5ef429 4c8d6020        lea     r12,[rax+20h]     ;ContiguousIoResources buffer+0x20 ?? => PortContext => XRB
fffff80e`6c5ef42d 4533c9          xor     r9d,r9d
fffff80e`6c5ef430 498bcc          mov     rcx,r12
fffff80e`6c5ef433 4533c0          xor     r8d,r8d
fffff80e`6c5ef436 e88daeffff      call    storport!RaidZeroXrb (fffff80e`6c5ea2c8)
fffff80e`6c5ef43b 458bc6          mov     r8d,r14d
fffff80e`6c5ef43e 498bd5          mov     rdx,r13
fffff80e`6c5ef441 498bcc          mov     rcx,r12
fffff80e`6c5ef444 e8f7caffff      call    storport!RaidBuildMdlForXrb (fffff80e`6c5ebf40)
fffff80e`6c5ef449 448bf0          mov     r14d,eax
fffff80e`6c5ef44c 85c0            test    eax,eax
fffff80e`6c5ef44e 0f889e010000    js      storport!RaidAdapterSendSrbIoControlSynchronously+0x242 (fffff80e`6c5ef5f2)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0xa4:
fffff80e`6c5ef454 448aac24c8000000 mov     r13b,byte ptr [rsp+0C8h]
fffff80e`6c5ef45c 8b8424d0000000  mov     eax,dword ptr [rsp+0D0h]
fffff80e`6c5ef463 4584ed          test    r13b,r13b
fffff80e`6c5ef466 7515            jne     storport!RaidAdapterSendSrbIoControlSynchronously+0xcd (fffff80e`6c5ef47d)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0xb8:
fffff80e`6c5ef468 0d02010000      or      eax,102h
fffff80e`6c5ef46d 8d4b20          lea     ecx,[rbx+20h]
fffff80e`6c5ef470 807f0228        cmp     byte ptr [rdi+2],28h      ;if Srb->Function == SRB_FUNCTION_STORAGE_REQUEST_BLOCK, goto 0x2A8
fffff80e`6c5ef474 0f84de010000    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x2a8 (fffff80e`6c5ef658)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0xca:
fffff80e`6c5ef47a 884f09          mov     byte ptr [rdi+9],cl       ;(SCSI_REQUEST_BLOCK)  srb->QueueAction = CL

storport!RaidAdapterSendSrbIoControlSynchronously+0xcd:
fffff80e`6c5ef47d 83c801          or      eax,1
fffff80e`6c5ef480 80be9201000001  cmp     byte ptr [rsi+192h],1     ;RSI==>AdapterExt->PORT_CONFIGURATION_INFORMATIOM->SrbType , 1 == STORAGE_REQUESt_BLOCK
fffff80e`6c5ef487 0f84d4010000    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x2b1 (fffff80e`6c5ef661)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0xdd:    ;fill _SCSI_REQUEST_BLOCK content
fffff80e`6c5ef48d 89470c          mov     dword ptr [rdi+0Ch],eax
fffff80e`6c5ef490 b958000000      mov     ecx,58h
fffff80e`6c5ef495 488b8424b0000000 mov     rax,qword ptr [rsp+0B0h]
fffff80e`6c5ef49d 48894718        mov     qword ptr [rdi+18h],rax
fffff80e`6c5ef4a1 8b8424b8000000  mov     eax,dword ptr [rsp+0B8h]
fffff80e`6c5ef4a8 894710          mov     dword ptr [rdi+10h],eax
fffff80e`6c5ef4ab 66890f          mov     word ptr [rdi],cx
fffff80e`6c5ef4ae c6470202        mov     byte ptr [rdi+2],2
fffff80e`6c5ef4b2 c64708ff        mov     byte ptr [rdi+8],0FFh
fffff80e`6c5ef4b6 8b866c100000    mov     eax,dword ptr [rsi+106Ch]
fffff80e`6c5ef4bc 894714          mov     dword ptr [rdi+14h],eax
fffff80e`6c5ef4bf 66895f05        mov     word ptr [rdi+5],bx
fffff80e`6c5ef4c3 885f07          mov     byte ptr [rdi+7],bl
fffff80e`6c5ef4c6 488b9c24a8000000 mov     rbx,qword ptr [rsp+0A8h]
fffff80e`6c5ef4ce 4c896730        mov     qword ptr [rdi+30h],r12
fffff80e`6c5ef4d2 4889bdc8000000  mov     qword ptr [rbp+0C8h],rdi
fffff80e`6c5ef4d9 488b4718        mov     rax,qword ptr [rdi+18h]
fffff80e`6c5ef4dd 488985d8000000  mov     qword ptr [rbp+0D8h],rax
fffff80e`6c5ef4e4 488bc3          mov     rax,rbx

storport!RaidAdapterSendSrbIoControlSynchronously+0x137:
fffff80e`6c5ef4e7 4c8d8540040000  lea     r8,[rbp+440h]     ;IoResource + 0x440 == Miniport Context == SrbExt, IoResource+0x20 == PortContext == XRB
fffff80e`6c5ef4ee 488985d0000000  mov     qword ptr [rbp+0D0h],rax  ;rbp+0xD0 = Srb->PortContext
fffff80e`6c5ef4f5 488bd7          mov     rdx,rdi               ;RDX == RDI == Srb
fffff80e`6c5ef4f8 488bce          mov     rcx,rsi   ;RaSrbSetMiniportContext(AdapterExt, SRB, IoResource ptr)
fffff80e`6c5ef4fb e8dcc8ffff      call    storport!RaSrbSetMiniportContext (fffff80e`6c5ebddc) ;把 (IoResource ptr+0x440)放到 Srb->MiniportContext
fffff80e`6c5ef500 4584ed          test    r13b,r13b
fffff80e`6c5ef503 0f8575030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x204ce (fffff80e`6c60f87e)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x159:
fffff80e`6c5ef509 488d8db8020000  lea     rcx,[rbp+2B8h]    ;RCX = addr of XRB->u.CompletionEvent
fffff80e`6c5ef510 4533c0          xor     r8d,r8d
fffff80e`6c5ef513 33d2            xor     edx,edx       ;;KeInitializeEvent(&event, NotificationEvent, FALSE)
fffff80e`6c5ef515 48ff152c4d0500  call    qword ptr [storport!_imp_KeInitializeEvent (fffff80e`6c644248)]
fffff80e`6c5ef51c 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5ef521 488d05a851ffff  lea     rax,[storport!RaidXrbSignalCompletion (fffff80e`6c5e46d0)]
fffff80e`6c5ef528 488985b0020000  mov     qword ptr [rbp+2B0h],rax  ;XRB->CompletionRoutine = RaidXrbSignalCompletion
fffff80e`6c5ef52f 4584ed          test    r13b,r13b
fffff80e`6c5ef532 0f854f030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x204d7 (fffff80e`6c60f887)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x188:
fffff80e`6c5ef538 33db            xor     ebx,ebx
fffff80e`6c5ef53a 48399ee0130000  cmp     qword ptr [rsi+13E0h],rbx     ;if AdapterExt->PoFx != NULL, goto 0x2055C
fffff80e`6c5ef541 0f85c5030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x2055c (fffff80e`6c60f90c)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x197:
fffff80e`6c5ef547 80be9201000001  cmp     byte ptr [rsi+192h],1     ;if (AdapterExt->PortConfig->SrbType == STORAGE_REQUESt_BLOCK) goto 0x330
fffff80e`6c5ef54e 0f848c010000    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x330 (fffff80e`6c5ef6e0)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x1a4:
fffff80e`6c5ef554 488b0da5ea0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80e`6c63e000)]
fffff80e`6c5ef55b 488d059eea0400  lea     rax,[storport!WPP_GLOBAL_Control (fffff80e`6c63e000)]
fffff80e`6c5ef562 483bc8          cmp     rcx,rax
fffff80e`6c5ef565 740b            je      storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2 (fffff80e`6c5ef572)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x1b7:
fffff80e`6c5ef567 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80e`6c5ef56a a810            test    al,10h
fffff80e`6c5ef56c 0f85cd030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x2058f (fffff80e`6c60f93f)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2:
fffff80e`6c5ef572 498bd4          mov     rdx,r12           ;R12 == RDX == (ContiguousIoResources buffer)+0x20 = XRB
fffff80e`6c5ef575 488bce          mov     rcx,rsi           ;RSI == RCX == RaidAdapterExtension
fffff80e`6c5ef578 389e62110000    cmp     byte ptr [rsi+1162h],bl   ;if AdapterExt->Contigous == FALSE, goto 0x29e (call RaidAdapterExecuteXrb)
fffff80e`6c5ef57e 0f84ca000000    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x29e (fffff80e`6c5ef64e)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x1d4:
fffff80e`6c5ef584 e83bd4ffff      call    storport!RaidAdapterRaiseIrqlAndExecuteXrb (fffff80e`6c5ec9c4)

storport!RaidAdapterSendSrbIoControlSynchronously+0x1d9:
fffff80e`6c5ef589 4533c9          xor     r9d,r9d       ;這邊RDI == SRB
fffff80e`6c5ef58c 48895c2420      mov     qword ptr [rsp+20h],rbx       ;timeout?
fffff80e`6c5ef591 4533c0          xor     r8d,r8d
fffff80e`6c5ef594 488d8db8020000  lea     rcx,[rbp+2B8h]    ;event
fffff80e`6c5ef59b 33d2            xor     edx,edx           ;
fffff80e`6c5ef59d 448bf0          mov     r14d,eax
fffff80e`6c5ef5a0 48ff15c94c0500  call    qword ptr [storport!_imp_KeWaitForSingleObject (fffff80e`6c644270)]       ;<=== SP2-I70 卡在這邊
fffff80e`6c5ef5a7 0f1f440000      nop     dword ptr [rax+rax]   ;KeWaitForSingleObject(&event, Executive, KernelMode, FALSE, NULL)
fffff80e`6c5ef5ac 4584ed          test    r13b,r13b
fffff80e`6c5ef5af 0f85c0030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x205c5 (fffff80e`6c60f975)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x205:
fffff80e`6c5ef5b5 f6453101        test    byte ptr [rbp+31h],1
fffff80e`6c5ef5b9 0f85e3030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x205f2 (fffff80e`6c60f9a2)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x20f:
fffff80e`6c5ef5bf 48399ee0130000  cmp     qword ptr [rsi+13E0h],rbx
fffff80e`6c5ef5c6 0f85f0030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x2060c (fffff80e`6c60f9bc)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x21c:
fffff80e`6c5ef5cc 4585f6          test    r14d,r14d
fffff80e`6c5ef5cf 7821            js      storport!RaidAdapterSendSrbIoControlSynchronously+0x242 (fffff80e`6c5ef5f2)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x221:
fffff80e`6c5ef5d1 488b8424c0000000 mov     rax,qword ptr [rsp+0C0h]
fffff80e`6c5ef5d9 4885c0          test    rax,rax
fffff80e`6c5ef5dc 0f85ed030200    jne     storport!RaidAdapterSendSrbIoControlSynchronously+0x2061f (fffff80e`6c60f9cf)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x232:
fffff80e`6c5ef5e2 4585f6          test    r14d,r14d
fffff80e`6c5ef5e5 780b            js      storport!RaidAdapterSendSrbIoControlSynchronously+0x242 (fffff80e`6c5ef5f2)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x237:
fffff80e`6c5ef5e7 8a4f03          mov     cl,byte ptr [rdi+3]
fffff80e`6c5ef5ea e835010000      call    storport!PortSrbTranslateSrbToNtStatus (fffff80e`6c5ef724)
fffff80e`6c5ef5ef 448bf0          mov     r14d,eax

storport!RaidAdapterSendSrbIoControlSynchronously+0x242:
fffff80e`6c5ef5f2 4885ed          test    rbp,rbp
fffff80e`6c5ef5f5 7415            je      storport!RaidAdapterSendSrbIoControlSynchronously+0x25c (fffff80e`6c5ef60c)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x247:
fffff80e`6c5ef5f7 33d2            xor     edx,edx
fffff80e`6c5ef5f9 498bcc          mov     rcx,r12
fffff80e`6c5ef5fc e84fb3ffff      call    storport!RaidXrbDeallocateResources (fffff80e`6c5ea950)
fffff80e`6c5ef601 488bd5          mov     rdx,rbp
fffff80e`6c5ef604 488bce          mov     rcx,rsi
fffff80e`6c5ef607 e8e4c6ffff      call    storport!StorFreeContiguousIoResources (fffff80e`6c5ebcf0)

storport!RaidAdapterSendSrbIoControlSynchronously+0x25c:
fffff80e`6c5ef60c 4885ff          test    rdi,rdi
fffff80e`6c5ef60f 7429            je      storport!RaidAdapterSendSrbIoControlSynchronously+0x28a (fffff80e`6c5ef63a)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x261:
fffff80e`6c5ef611 80be9201000001  cmp     byte ptr [rsi+192h],1
fffff80e`6c5ef618 0f84e9000000    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x357 (fffff80e`6c5ef707)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x26e:
fffff80e`6c5ef61e 48895f30        mov     qword ptr [rdi+30h],rbx
fffff80e`6c5ef622 48895f38        mov     qword ptr [rdi+38h],rbx

storport!RaidAdapterSendSrbIoControlSynchronously+0x276:
fffff80e`6c5ef626 ba52615372      mov     edx,72536152h
fffff80e`6c5ef62b 488bcf          mov     rcx,rdi
fffff80e`6c5ef62e 48ff15f34b0500  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff80e`6c644228)]
fffff80e`6c5ef635 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterSendSrbIoControlSynchronously+0x28a:
fffff80e`6c5ef63a 418bc6          mov     eax,r14d
fffff80e`6c5ef63d 4883c458        add     rsp,58h
fffff80e`6c5ef641 415f            pop     r15
fffff80e`6c5ef643 415e            pop     r14
fffff80e`6c5ef645 415d            pop     r13
fffff80e`6c5ef647 415c            pop     r12
fffff80e`6c5ef649 5f              pop     rdi
fffff80e`6c5ef64a 5e              pop     rsi
fffff80e`6c5ef64b 5d              pop     rbp
fffff80e`6c5ef64c 5b              pop     rbx
fffff80e`6c5ef64d c3              ret

storport!RaidAdapterSendSrbIoControlSynchronously+0x29e:
fffff80e`6c5ef64e e8cdd3ffff      call    storport!RaidAdapterExecuteXrb (fffff80e`6c5eca20)
fffff80e`6c5ef653 e931ffffff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x1d9 (fffff80e`6c5ef589)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2a8:
fffff80e`6c5ef658 66894f26        mov     word ptr [rdi+26h],cx     ;Srb->RequestAttribute = CX
fffff80e`6c5ef65c e91cfeffff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0xcd (fffff80e`6c5ef47d)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2b1:    ;fill _STORAGE_REQUEST_BLOCK content, RDI == SRB
fffff80e`6c5ef661 4c8bb424a8000000 mov     r14,qword ptr [rsp+0A8h]     ;pick back IRP of this request
fffff80e`6c5ef669 4c8bff          mov     r15,rdi
fffff80e`6c5ef66c 8b5f34          mov     ebx,dword ptr [rdi+34h]       ;ebx=SRB->AddressOffset
fffff80e`6c5ef66f 498bce          mov     rcx,r14                       ;R14 = RCX = original IRP ptr
fffff80e`6c5ef672 834f20ff        or      dword ptr [rdi+20h],0FFFFFFFFh    ;srb->RequestTag = -1
fffff80e`6c5ef676 894718          mov     dword ptr [rdi+18h],eax           ;srb->SrbFlags = eax
fffff80e`6c5ef679 488b8424b0000000 mov     rax,qword ptr [rsp+0B0h]         ;rsp+0xB0 could be buffer of I/O
fffff80e`6c5ef681 48894740        mov     qword ptr [rdi+40h],rax           ;srb->DataBuffer = rax
fffff80e`6c5ef685 8b8424b8000000  mov     eax,dword ptr [rsp+0B8h]
fffff80e`6c5ef68c 89473c          mov     dword ptr [rdi+3Ch],eax           ;srb->DataTransferLength = rax
fffff80e`6c5ef68f c7471402000000  mov     dword ptr [rdi+14h],2             ;srb->SrbFunction = SRB_FUNCTION_IO_CONTROL
fffff80e`6c5ef696 48ff159b4a0500  call    qword ptr [storport!_imp_IoGetIoPriorityHint (fffff80e`6c644138)]
fffff80e`6c5ef69d 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5ef6a2 66894724        mov     word ptr [rdi+24h],ax     ;srb->RequestPriority = IRP's Io Priority Hint
fffff80e`6c5ef6a6 8b866c100000    mov     eax,dword ptr [rsi+106Ch] ;eax = AdapterExt->DefaultTimeout
fffff80e`6c5ef6ac 894728          mov     dword ptr [rdi+28h],eax   ;srb->TimeOutValue = eax = AdapterExt->DefaultTimeout
fffff80e`6c5ef6af 4c896760        mov     qword ptr [rdi+60h],r12   ;srb->PortContext = R12
fffff80e`6c5ef6b3 4c897750        mov     qword ptr [rdi+50h],r14   ;srb->OriginalRequest = R14 (IRP)
fffff80e`6c5ef6b7 6683643b0800    and     word ptr [rbx+rdi+8],0
fffff80e`6c5ef6bd c6443b0a00      mov     byte ptr [rbx+rdi+0Ah],0
fffff80e`6c5ef6c2 498bde          mov     rbx,r14                   ;IRP
fffff80e`6c5ef6c5 4889bdc8000000  mov     qword ptr [rbp+0C8h],rdi  ;set SRB to XRB->Srb (rbp == XRB-0x20 == ContigousIoResource)
fffff80e`6c5ef6cc 488b4740        mov     rax,qword ptr [rdi+40h]   ;rax = srb->DataBuffer
fffff80e`6c5ef6d0 488985d8000000  mov     qword ptr [rbp+0D8h],rax  ;set DataBuffer XRB->SrbData->DataBuffer
fffff80e`6c5ef6d7 488b4760        mov     rax,qword ptr [rdi+60h]   ;rax = srb->PortContext
fffff80e`6c5ef6db e907feffff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x137 (fffff80e`6c5ef4e7)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x330:
fffff80e`6c5ef6e0 488b0d19e90400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80e`6c63e000)]
fffff80e`6c5ef6e7 488d0512e90400  lea     rax,[storport!WPP_GLOBAL_Control (fffff80e`6c63e000)]
fffff80e`6c5ef6ee 483bc8          cmp     rcx,rax
fffff80e`6c5ef6f1 0f847bfeffff    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2 (fffff80e`6c5ef572)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x347:
fffff80e`6c5ef6f7 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80e`6c5ef6fa a810            test    al,10h
fffff80e`6c5ef6fc 0f8470feffff    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2 (fffff80e`6c5ef572)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x352:
fffff80e`6c5ef702 e919020200      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x20570 (fffff80e`6c60f920)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x357:
fffff80e`6c5ef707 4d85ff          test    r15,r15
fffff80e`6c5ef70a 4c0f44ff        cmove   r15,rdi
fffff80e`6c5ef70e 49895f50        mov     qword ptr [r15+50h],rbx
fffff80e`6c5ef712 49895f68        mov     qword ptr [r15+68h],rbx
fffff80e`6c5ef716 e90bffffff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x276 (fffff80e`6c5ef626)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x204ce:
fffff80e`6c60f87e 804d3108        or      byte ptr [rbp+31h],8
fffff80e`6c60f882 e982fcfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x159 (fffff80e`6c5ef509)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x204d7:
fffff80e`6c60f887 33c0            xor     eax,eax
fffff80e`6c60f889 488bce          mov     rcx,rsi
fffff80e`6c60f88c 48898424a0000000 mov     qword ptr [rsp+0A0h],rax
fffff80e`6c60f894 e8cf75feff      call    storport!RaidPauseAdapterQueue (fffff80e`6c5f6e68)
fffff80e`6c60f899 4533c0          xor     r8d,r8d
fffff80e`6c60f89c 488d4c2430      lea     rcx,[rsp+30h]
fffff80e`6c60f8a1 33d2            xor     edx,edx
fffff80e`6c60f8a3 48ff159e490300  call    qword ptr [storport!_imp_KeInitializeEvent (fffff80e`6c644248)]
fffff80e`6c60f8aa 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60f8af 488d8e00030000  lea     rcx,[rsi+300h]
fffff80e`6c60f8b6 488d542430      lea     rdx,[rsp+30h]
fffff80e`6c60f8bb e8d48b0100      call    storport!StorSetIoGatewayEmptyEvent (fffff80e`6c628494)
fffff80e`6c60f8c0 488d8424a0000000 lea     rax,[rsp+0A0h]
fffff80e`6c60f8c8 48c78424a0000000007479b8 mov qword ptr [rsp+0A0h],0FFFFFFFFB8797400h
fffff80e`6c60f8d4 4533c9          xor     r9d,r9d
fffff80e`6c60f8d7 4889442420      mov     qword ptr [rsp+20h],rax
fffff80e`6c60f8dc 4533c0          xor     r8d,r8d
fffff80e`6c60f8df 488d4c2430      lea     rcx,[rsp+30h]
fffff80e`6c60f8e4 33d2            xor     edx,edx
fffff80e`6c60f8e6 48ff1583490300  call    qword ptr [storport!_imp_KeWaitForSingleObject (fffff80e`6c644270)]
fffff80e`6c60f8ed 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60f8f2 85c0            test    eax,eax
fffff80e`6c60f8f4 0f843efcfdff    je      storport!RaidAdapterSendSrbIoControlSynchronously+0x188 (fffff80e`6c5ef538)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2054a:
fffff80e`6c60f8fa 4883633800      and     qword ptr [rbx+38h],0
fffff80e`6c60f8ff 41be010000c0    mov     r14d,0C0000001h
fffff80e`6c60f905 33db            xor     ebx,ebx
fffff80e`6c60f907 e9e6fcfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x242 (fffff80e`6c5ef5f2)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2055c:
fffff80e`6c60f90c 33d2            xor     edx,edx
fffff80e`6c60f90e 488bce          mov     rcx,rsi
fffff80e`6c60f911 448d4201        lea     r8d,[rdx+1]
fffff80e`6c60f915 e8b205ffff      call    storport!RaidAdapterPoFxActivateComponent (fffff80e`6c5ffecc)
fffff80e`6c60f91a 90              nop
fffff80e`6c60f91b e927fcfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x197 (fffff80e`6c5ef547)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x20570:
fffff80e`6c60f920 80792904        cmp     byte ptr [rcx+29h],4
fffff80e`6c60f924 0f8248fcfdff    jb      storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2 (fffff80e`6c5ef572)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2057a:
fffff80e`6c60f92a 498b4768        mov     rax,qword ptr [r15+68h]
fffff80e`6c60f92e ba3f000000      mov     edx,3Fh
fffff80e`6c60f933 4889442428      mov     qword ptr [rsp+28h],rax
fffff80e`6c60f938 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff80e`6c60f93d eb1d            jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x205ac (fffff80e`6c60f95c)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2058f:
fffff80e`6c60f93f 80792904        cmp     byte ptr [rcx+29h],4
fffff80e`6c60f943 0f8229fcfdff    jb      storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2 (fffff80e`6c5ef572)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x20599:
fffff80e`6c60f949 488b4738        mov     rax,qword ptr [rdi+38h]
fffff80e`6c60f94d ba40000000      mov     edx,40h
fffff80e`6c60f952 4889442428      mov     qword ptr [rsp+28h],rax
fffff80e`6c60f957 48897c2420      mov     qword ptr [rsp+20h],rdi

storport!RaidAdapterSendSrbIoControlSynchronously+0x205ac:
fffff80e`6c60f95c 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80e`6c60f960 4c8d05d1740200  lea     r8,[storport!WPP_dd435e78b7a432f8405f8f56a0e26d40_Traceguids (fffff80e`6c636e38)]
fffff80e`6c60f967 4d8bcc          mov     r9,r12
fffff80e`6c60f96a e819830000      call    storport!WPP_SF_qqq (fffff80e`6c617c88)
fffff80e`6c60f96f 90              nop
fffff80e`6c60f970 e9fdfbfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x1c2 (fffff80e`6c5ef572)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x205c5:
fffff80e`6c60f975 b102            mov     cl,2
fffff80e`6c60f977 48ff15d2480300  call    qword ptr [storport!_imp_KfRaiseIrql (fffff80e`6c644250)]
fffff80e`6c60f97e 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60f983 488bce          mov     rcx,rsi
fffff80e`6c60f986 8ad8            mov     bl,al
fffff80e`6c60f988 e8eb7a0000      call    storport!RaidResumeAndRestartAdapterQueues (fffff80e`6c617478)
fffff80e`6c60f98d 8acb            mov     cl,bl
fffff80e`6c60f98f 48ff150a480300  call    qword ptr [storport!_imp_KeLowerIrql (fffff80e`6c6441a0)]
fffff80e`6c60f996 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c60f99b 33db            xor     ebx,ebx
fffff80e`6c60f99d e913fcfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x205 (fffff80e`6c5ef5b5)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x205f2:
fffff80e`6c60f9a2 8b950c030000    mov     edx,dword ptr [rbp+30Ch]
fffff80e`6c60f9a8 4533c0          xor     r8d,r8d
fffff80e`6c60f9ab 488bce          mov     rcx,rsi
fffff80e`6c60f9ae e8dd04ffff      call    storport!RaidAdapterPoFxIdleComponent (fffff80e`6c5ffe90)
fffff80e`6c60f9b3 806531fe        and     byte ptr [rbp+31h],0FEh
fffff80e`6c60f9b7 e903fcfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x20f (fffff80e`6c5ef5bf)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2060c:
fffff80e`6c60f9bc 4533c0          xor     r8d,r8d
fffff80e`6c60f9bf 33d2            xor     edx,edx
fffff80e`6c60f9c1 488bce          mov     rcx,rsi
fffff80e`6c60f9c4 e8c704ffff      call    storport!RaidAdapterPoFxIdleComponent (fffff80e`6c5ffe90)
fffff80e`6c60f9c9 90              nop
fffff80e`6c60f9ca e9fdfbfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x21c (fffff80e`6c5ef5cc)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x2061f:
fffff80e`6c60f9cf 488b8c24b0000000 mov     rcx,qword ptr [rsp+0B0h]
fffff80e`6c60f9d7 8b4914          mov     ecx,dword ptr [rcx+14h]
fffff80e`6c60f9da ff15f84d0300    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`6c6447d8)]
fffff80e`6c60f9e0 448bf0          mov     r14d,eax
fffff80e`6c60f9e3 e9fafbfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x232 (fffff80e`6c5ef5e2)  Branch

storport!RaidAdapterSendSrbIoControlSynchronously+0x20638:
fffff80e`6c60f9e8 41be170000c0    mov     r14d,0C0000017h
fffff80e`6c60f9ee e9fffbfdff      jmp     storport!RaidAdapterSendSrbIoControlSynchronously+0x242 (fffff80e`6c5ef5f2)  Branch
