0: kd> uf RaidpAdapterContinueScatterGather
storport!RaidpAdapterContinueScatterGather:
fffff80f`82e8cae0 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff80f`82e8cae5 57              push    rdi
fffff80f`82e8cae6 4883ec20        sub     rsp,20h
fffff80f`82e8caea 488b5940        mov     rbx,qword ptr [rcx+40h]   ;RCX == DEVICE_OBJECT , RBX = DevObj->DeviceExtension == AdapterExt
fffff80f`82e8caee 498bf9          mov     rdi,r9                    ;RDI = R9 = XRB
fffff80f`82e8caf1 4d894170        mov     qword ptr [r9+70h],r8     ;XRB->SgList = R8
fffff80f`82e8caf5 488bd3          mov     rdx,rbx                   ;RDX = AdapterExt
fffff80f`82e8caf8 4533c0          xor     r8d,r8d
fffff80f`82e8cafb 498999d8000000  mov     qword ptr [r9+0D8h],rbx   ;set XRB->Adapter = AdapterExt
fffff80f`82e8cb02 498bc9          mov     rcx,r9
fffff80f`82e8cb05 e836140000      call    storport!RaidXrbSetDataBufferAddress (fffff80f`82e8df40);RaidXrbSetDataBufferAddress(XRB, AdapterExt, 0)
fffff80f`82e8cb0a 85c0            test    eax,eax
fffff80f`82e8cb0c 0f8852190200    js      storport!RaidpAdapterContinueScatterGather+0x21984 (fffff80f`82eae464)  Branch

storport!RaidpAdapterContinueScatterGather+0x32:
fffff80f`82e8cb12 488bd7          mov     rdx,rdi       ;XRB
fffff80f`82e8cb15 4889742430      mov     qword ptr [rsp+30h],rsi
fffff80f`82e8cb1a 488bcb          mov     rcx,rbx       ;Srb->DataBuffer
fffff80f`82e8cb1d e85e0e0000      call    storport!RaidAdapterPostScatterGatherExecute (fffff80f`82e8d980)
fffff80f`82e8cb22 807b6900        cmp     byte ptr [rbx+69h],0  ;if (!RAID_ADAPTER_EXTENSION->Flags.InvalidateBusRelations) goto 0x97
fffff80f`82e8cb26 8bf0            mov     esi,eax
fffff80f`82e8cb28 0f8560190200    jne     storport!RaidpAdapterContinueScatterGather+0x219ae (fffff80f`82eae48e)  Branch

storport!RaidpAdapterContinueScatterGather+0x4e:
fffff80f`82e8cb2e 85f6            test    esi,esi
fffff80f`82e8cb30 488b742430      mov     rsi,qword ptr [rsp+30h]
fffff80f`82e8cb35 0f886f190200    js      storport!RaidpAdapterContinueScatterGather+0x219ca (fffff80f`82eae4aa)  Branch

storport!RaidpAdapterContinueScatterGather+0x5b:
fffff80f`82e8cb3b 488b5c2438      mov     rbx,qword ptr [rsp+38h]
fffff80f`82e8cb40 4883c420        add     rsp,20h
fffff80f`82e8cb44 5f              pop     rdi
fffff80f`82e8cb45 c3              ret

storport!RaidpAdapterContinueScatterGather+0x21984:
fffff80f`82eae464 488b87a8000000  mov     rax,qword ptr [rdi+0A8h]  ;RAX = XRB->Srb
fffff80f`82eae46b c6400330        mov     byte ptr [rax+3],30h      ;Srb->SrbStatus = SRB_STATUS_INTERNAL_ERROR
fffff80f`82eae46f 488b87a8000000  mov     rax,qword ptr [rdi+0A8h]  ;RAX = XRB->Srb
fffff80f`82eae476 80780228        cmp     byte ptr [rax+2],28h      ;if(Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x219a5
fffff80f`82eae47a 7509            jne     storport!RaidpAdapterContinueScatterGather+0x219a5 (fffff80f`82eae485)  Branch

storport!RaidpAdapterContinueScatterGather+0x2199c:
;這邊應該是更新 Srb->SystemStatus 但missed SRB沒這值，或許根本沒進到RaidDmaBuildScatterGatherList甚至RaidAdapterScatterGatherExecute？
fffff80f`82eae47c c7402c9a0000c0  mov     dword ptr [rax+2Ch],0C000009Ah
fffff80f`82eae483 eb30            jmp     storport!RaidpAdapterContinueScatterGather+0x219d5 (fffff80f`82eae4b5)  Branch

storport!RaidpAdapterContinueScatterGather+0x219a5:
;這邊應該是更新 Srb->SystemStatus? 但missed SRB沒這值，或許根本沒進到RaidDmaBuildScatterGatherList甚至RaidAdapterScatterGatherExecute？
fffff80f`82eae485 c740409a0000c0  mov     dword ptr [rax+40h],0C000009Ah
fffff80f`82eae48c eb27            jmp     storport!RaidpAdapterContinueScatterGather+0x219d5 (fffff80f`82eae4b5)  Branch

storport!RaidpAdapterContinueScatterGather+0x219ae:
fffff80f`82eae48e 488b4b20        mov     rcx,qword ptr [rbx+20h]
fffff80f`82eae492 33d2            xor     edx,edx
fffff80f`82eae494 c6436900        mov     byte ptr [rbx+69h],0
fffff80f`82eae498 48ff15195e0300  call    qword ptr [storport!_imp_IoInvalidateDeviceRelations (fffff80f`82ee42b8)]
fffff80f`82eae49f 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`82eae4a4 90              nop
fffff80f`82eae4a5 e984e6fdff      jmp     storport!RaidpAdapterContinueScatterGather+0x4e (fffff80f`82e8cb2e)  Branch

storport!RaidpAdapterContinueScatterGather+0x219ca:
fffff80f`82eae4aa 488b87a8000000  mov     rax,qword ptr [rdi+0A8h]
fffff80f`82eae4b1 c6400304        mov     byte ptr [rax+3],4

storport!RaidpAdapterContinueScatterGather+0x219d5:
fffff80f`82eae4b5 41b001          mov     r8b,1
fffff80f`82eae4b8 488bd7          mov     rdx,rdi
fffff80f`82eae4bb 488bcb          mov     rcx,rbx
fffff80f`82eae4be e82d08feff      call    storport!RaidAdapterRequestComplete (fffff80f`82e8ecf0)
fffff80f`82eae4c3 90              nop
fffff80f`82eae4c4 e972e6fdff      jmp     storport!RaidpAdapterContinueScatterGather+0x5b (fffff80f`82e8cb3b)  Branch

