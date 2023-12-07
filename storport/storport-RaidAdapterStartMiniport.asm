;0: kd> k
; # Child-SP          RetAddr               Call Site
;00 fffff60b`ea3e6588 fffff802`173ce52f     stornvme!NVMeHwPassiveInitialize
;01 fffff60b`ea3e6590 fffff802`173ce1c4     storport!RaidAdapterStartMiniport+0x14b
;02 fffff60b`ea3e65d0 fffff802`173c3d72     storport!RaidAdapterStartDeviceIrp+0x16c
;03 fffff60b`ea3e6660 fffff802`173bc01e     storport!RaidAdapterPnpIrp+0x222
;04 fffff60b`ea3e6700 fffff805`664d9d19     storport!RaDriverPnpIrp+0x8e
;05 fffff60b`ea3e6740 fffff805`66ba52de     nt!IofCallDriver+0x59
;06 fffff60b`ea3e6780 fffff805`664c3425     nt!PnpAsynchronousCall+0xea
;07 fffff60b`ea3e67c0 fffff805`66606458     nt!PnpSendIrp+0x95
;08 fffff60b`ea3e6830 fffff805`66b97197     nt!PnpStartDevice+0x88
;09 fffff60b`ea3e68c0 fffff805`66b9737f     nt!PnpStartDeviceNode+0xdb
;0a fffff60b`ea3e6950 fffff805`66b91f98     nt!PipProcessStartPhase1+0x6f
;0b fffff60b`ea3e69a0 fffff805`66c0a85f     nt!PipProcessDevNodeTree+0x3dc
;0c fffff60b`ea3e6a60 fffff805`66607461     nt!PiRestartDevice+0xab
;0d fffff60b`ea3e6ab0 fffff805`6655e1ba     nt!PnpDeviceActionWorker+0x421
;0e fffff60b`ea3e6b70 fffff805`665dfed5     nt!ExpWorkerThread+0x16a
;0f fffff60b`ea3e6c10 fffff805`6666e51c     nt!PspSystemThreadStartup+0x55
;10 fffff60b`ea3e6c60 00000000`00000000     nt!KiStartSystemThread+0x1c


0: kd> uf storport!RaidAdapterStartMiniport
storport!RaidAdapterStartMiniport:
fffff802`173ce3e4 48895c2408      mov     qword ptr [rsp+8],rbx
fffff802`173ce3e9 4889742418      mov     qword ptr [rsp+18h],rsi
fffff802`173ce3ee 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff802`173ce3f3 4156            push    r14
fffff802`173ce3f5 4883ec30        sub     rsp,30h
fffff802`173ce3f9 488bd9          mov     rbx,rcx       ;AdapterExt?
fffff802`173ce3fc 4885d2          test    rdx,rdx       ;??
fffff802`173ce3ff 0f84d9290100    je      storport!RaidAdapterStartMiniport+0x129fa (fffff802`173e0dde)  Branch

storport!RaidAdapterStartMiniport+0x21:
fffff802`173ce405 488db938010000  lea     rdi,[rcx+138h]    ;AdapterExt->Miniport
fffff802`173ce40c 4c8d8928010000  lea     r9,[rcx+128h]     ;AdapterExt->ResourceList
fffff802`173ce413 488bcf          mov     rcx,rdi
fffff802`173ce416 e8f5f90400      call    storport!RaInitializeMiniport (fffff802`1741de10)
fffff802`173ce41b 85c0            test    eax,eax
fffff802`173ce41d 0f8828010000    js      storport!RaidAdapterStartMiniport+0x167 (fffff802`173ce54b)  Branch

storport!RaidAdapterStartMiniport+0x3f:
fffff802`173ce423 488b9360080000  mov     rdx,qword ptr [rbx+860h]  ;RDX = AdapterExt->DriverParameters
fffff802`173ce42a 41be01000000    mov     r14d,1
fffff802`173ce430 488bcf          mov     rcx,rdi               ;RCX = AdapterExt->Miniport
fffff802`173ce433 4488b3a2110000  mov     byte ptr [rbx+11A2h],r14b
fffff802`173ce43a e8910b0000      call    storport!RaCallMiniportFindAdapter (fffff802`173cefd0)
fffff802`173ce43f 804b6d20        or      byte ptr [rbx+6Dh],20h
fffff802`173ce443 85c0            test    eax,eax
fffff802`173ce445 0f8800010000    js      storport!RaidAdapterStartMiniport+0x167 (fffff802`173ce54b)  Branch

storport!RaidAdapterStartMiniport+0x67:
fffff802`173ce44b 8a153f340400    mov     dl,byte ptr [storport!StorEtwLoggingEnabled (fffff802`17411890)]
fffff802`173ce451 488bcb          mov     rcx,rbx
fffff802`173ce454 e8ff0a0000      call    storport!StorEtwEnableAdapter (fffff802`173cef58)
fffff802`173ce459 83bb0003000000  cmp     dword ptr [rbx+300h],0
fffff802`173ce460 0f84fb000000    je      storport!RaidAdapterStartMiniport+0x17d (fffff802`173ce561)  Branch

storport!RaidAdapterStartMiniport+0x82:
fffff802`173ce466 8a8b04020000    mov     cl,byte ptr [rbx+204h]
fffff802`173ce46c 8b93d4010000    mov     edx,dword ptr [rbx+1D4h]
fffff802`173ce472 84c9            test    cl,cl
fffff802`173ce474 8993c8020000    mov     dword ptr [rbx+2C8h],edx
fffff802`173ce47a 0f94c0          sete    al
fffff802`173ce47d 8883a2110000    mov     byte ptr [rbx+11A2h],al
fffff802`173ce483 84c9            test    cl,cl
fffff802`173ce485 0f8521010000    jne     storport!RaidAdapterStartMiniport+0x1c8 (fffff802`173ce5ac)  Branch

storport!RaidAdapterStartMiniport+0xa7:
fffff802`173ce48b 8b83e0010000    mov     eax,dword ptr [rbx+1E0h]
fffff802`173ce491 884b6b          mov     byte ptr [rbx+6Bh],cl
fffff802`173ce494 898380110000    mov     dword ptr [rbx+1180h],eax
fffff802`173ce49a 85c0            test    eax,eax
fffff802`173ce49c 7413            je      storport!RaidAdapterStartMiniport+0xcd (fffff802`173ce4b1)  Branch

storport!RaidAdapterStartMiniport+0xba:
fffff802`173ce49e 85d2            test    edx,edx
fffff802`173ce4a0 4488b3a0110000  mov     byte ptr [rbx+11A0h],r14b
fffff802`173ce4a7 410f44c6        cmove   eax,r14d
fffff802`173ce4ab 898380110000    mov     dword ptr [rbx+1180h],eax

storport!RaidAdapterStartMiniport+0xcd:
fffff802`173ce4b1 488bcb          mov     rcx,rbx
fffff802`173ce4b4 e86b130000      call    storport!RaidAdapterConnectInterrupt (fffff802`173cf824)
fffff802`173ce4b9 85c0            test    eax,eax
fffff802`173ce4bb 0f888a000000    js      storport!RaidAdapterStartMiniport+0x167 (fffff802`173ce54b)  Branch

storport!RaidAdapterStartMiniport+0xdd:
fffff802`173ce4c1 488bcb          mov     rcx,rbx
fffff802`173ce4c4 e827120000      call    storport!RaidPreInitializePerfOpts (fffff802`173cf6f0)
fffff802`173ce4c9 85c0            test    eax,eax
fffff802`173ce4cb 787e            js      storport!RaidAdapterStartMiniport+0x167 (fffff802`173ce54b)  Branch

storport!RaidAdapterStartMiniport+0xe9:
fffff802`173ce4cd 488bcb          mov     rcx,rbx
fffff802`173ce4d0 e84be9feff      call    storport!RaidAdapterAcquireInterruptLock (fffff802`173bce20)  ;It's why HwInitialize run at DISPATCH_LEVEL
fffff802`173ce4d5 408af0          mov     sil,al
fffff802`173ce4d8 4488736b        mov     byte ptr [rbx+6Bh],r14b   ;AdapterExt->Flags.InitializedMiniport = TRUE;

storport!RaidAdapterStartMiniport+0xf8:
fffff802`173ce4dc 804b6810        or      byte ptr [rbx+68h],10h    ;AdapterExt->Flags.InHwInitialize = TRUE;
fffff802`173ce4e0 488bcf          mov     rcx,rdi
fffff802`173ce4e3 e8380a0000      call    storport!RaCallMiniportHwInitialize (fffff802`173cef20)
fffff802`173ce4e8 8bf8            mov     edi,eax
fffff802`173ce4ea 85c0            test    eax,eax
fffff802`173ce4ec 7804            js      storport!RaidAdapterStartMiniport+0x10e (fffff802`173ce4f2)  Branch

storport!RaidAdapterStartMiniport+0x10a:
fffff802`173ce4ee 44087368        or      byte ptr [rbx+68h],r14b    ;AdapterExt->Flags.InHwInitialize = FALSE;

storport!RaidAdapterStartMiniport+0x10e:
fffff802`173ce4f2 80bba211000000  cmp     byte ptr [rbx+11A2h],0    ;if !AdapterExt->Contiguous , goto 0x122
fffff802`173ce4f9 740b            je      storport!RaidAdapterStartMiniport+0x122 (fffff802`173ce506)  Branch

storport!RaidAdapterStartMiniport+0x117:
fffff802`173ce4fb 408ad6          mov     dl,sil
fffff802`173ce4fe 488bcb          mov     rcx,rbx
fffff802`173ce501 e87ae7feff      call    storport!RaidAdapterReleaseInterruptLock (fffff802`173bcc80)

storport!RaidAdapterStartMiniport+0x122:
fffff802`173ce506 85ff            test    edi,edi
fffff802`173ce508 0f88b0000000    js      storport!RaidAdapterStartMiniport+0x1da (fffff802`173ce5be)  Branch

storport!RaidAdapterStartMiniport+0x12a:
fffff802`173ce50e 488b8378110000  mov     rax,qword ptr [rbx+1178h]
fffff802`173ce515 4885c0          test    rax,rax
fffff802`173ce518 0f8498000000    je      storport!RaidAdapterStartMiniport+0x1d2 (fffff802`173ce5b6)  Branch

storport!RaidAdapterStartMiniport+0x13a:
fffff802`173ce51e 488b8b28020000  mov     rcx,qword ptr [rbx+228h]
fffff802`173ce525 4883c110        add     rcx,10h
fffff802`173ce529 ff15f1920400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff802`17417820)]   ;call HwPassiveInitialize()
fffff802`173ce52f 84c0            test    al,al         ;if !HwPassiveInitialize(), goto 0x12a2e to return 0xC0000001 STATUS_UNSUCCESSFUL
fffff802`173ce531 0f84db280100    je      storport!RaidAdapterStartMiniport+0x12a2e (fffff802`173e0e12)  Branch

storport!RaidAdapterStartMiniport+0x153:
fffff802`173ce537 806368ef        and     byte ptr [rbx+68h],0EFh
fffff802`173ce53b 488bcb          mov     rcx,rbx
fffff802`173ce53e e831010000      call    storport!RaidInitializePerfOptsPassive (fffff802`173ce674)
fffff802`173ce543 488bcb          mov     rcx,rbx
fffff802`173ce546 e87d000000      call    storport!InitializeBusesWithVmLunsBitmap (fffff802`173ce5c8)

storport!RaidAdapterStartMiniport+0x167:
fffff802`173ce54b 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff802`173ce550 488b742450      mov     rsi,qword ptr [rsp+50h]
fffff802`173ce555 488b7c2458      mov     rdi,qword ptr [rsp+58h]
fffff802`173ce55a 4883c430        add     rsp,30h
fffff802`173ce55e 415e            pop     r14
fffff802`173ce560 c3              ret

storport!RaidAdapterStartMiniport+0x17d:
fffff802`173ce561 8a83d0010000    mov     al,byte ptr [rbx+1D0h]
fffff802`173ce567 3c02            cmp     al,2
fffff802`173ce569 0f8479280100    je      storport!RaidAdapterStartMiniport+0x12a04 (fffff802`173e0de8)  Branch

storport!RaidAdapterStartMiniport+0x18b:
fffff802`173ce56f 2c03            sub     al,3
fffff802`173ce571 413ac6          cmp     al,r14b
fffff802`173ce574 0f87ecfeffff    ja      storport!RaidAdapterStartMiniport+0x82 (fffff802`173ce466)  Branch

storport!RaidAdapterStartMiniport+0x196:
fffff802`173ce57a 48b90000000001000000 mov rcx,100000000h
fffff802`173ce584 4883c8ff        or      rax,0FFFFFFFFFFFFFFFFh
fffff802`173ce588 48398b50110000  cmp     qword ptr [rbx+1150h],rcx
fffff802`173ce58f 7307            jae     storport!RaidAdapterStartMiniport+0x1b4 (fffff802`173ce598)  Branch

storport!RaidAdapterStartMiniport+0x1ad:
fffff802`173ce591 48898350110000  mov     qword ptr [rbx+1150h],rax

storport!RaidAdapterStartMiniport+0x1b4:
fffff802`173ce598 4883a36011000000 and     qword ptr [rbx+1160h],0

storport!RaidAdapterStartMiniport+0x1bc:
fffff802`173ce5a0 48898370110000  mov     qword ptr [rbx+1170h],rax
fffff802`173ce5a7 e9bafeffff      jmp     storport!RaidAdapterStartMiniport+0x82 (fffff802`173ce466)  Branch

storport!RaidAdapterStartMiniport+0x1c8:
fffff802`173ce5ac 408a742448      mov     sil,byte ptr [rsp+48h]
fffff802`173ce5b1 e926ffffff      jmp     storport!RaidAdapterStartMiniport+0xf8 (fffff802`173ce4dc)  Branch

storport!RaidAdapterStartMiniport+0x1d2:
fffff802`173ce5b6 85ff            test    edi,edi
fffff802`173ce5b8 0f8979ffffff    jns     storport!RaidAdapterStartMiniport+0x153 (fffff802`173ce537)  Branch

storport!RaidAdapterStartMiniport+0x1da:
fffff802`173ce5be 8bc7            mov     eax,edi
fffff802`173ce5c0 eb89            jmp     storport!RaidAdapterStartMiniport+0x167 (fffff802`173ce54b)  Branch

storport!RaidAdapterStartMiniport+0x129fa:
fffff802`173e0dde b80e0000c0      mov     eax,0C000000Eh
fffff802`173e0de3 e963d7feff      jmp     storport!RaidAdapterStartMiniport+0x167 (fffff802`173ce54b)  Branch

storport!RaidAdapterStartMiniport+0x12a04:
fffff802`173e0de8 48b90000000001000000 mov rcx,100000000h
fffff802`173e0df2 4883c8ff        or      rax,0FFFFFFFFFFFFFFFFh
fffff802`173e0df6 48398b50110000  cmp     qword ptr [rbx+1150h],rcx
fffff802`173e0dfd 7307            jae     storport!RaidAdapterStartMiniport+0x12a22 (fffff802`173e0e06)  Branch

storport!RaidAdapterStartMiniport+0x12a1b:
fffff802`173e0dff 48898350110000  mov     qword ptr [rbx+1150h],rax

storport!RaidAdapterStartMiniport+0x12a22:
fffff802`173e0e06 48898b60110000  mov     qword ptr [rbx+1160h],rcx
fffff802`173e0e0d e98ed7feff      jmp     storport!RaidAdapterStartMiniport+0x1bc (fffff802`173ce5a0)  Branch

storport!RaidAdapterStartMiniport+0x12a2e:
fffff802`173e0e12 bf010000c0      mov     edi,0C0000001h
fffff802`173e0e17 e99ad7feff      jmp     storport!RaidAdapterStartMiniport+0x1d2 (fffff802`173ce5b6)  Branch
