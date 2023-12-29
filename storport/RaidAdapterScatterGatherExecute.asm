1: kd> uf storport!RaidAdapterScatterGatherExecute
storport!RaidAdapterScatterGatherExecute:
fffff809`efc0f178 48895c2408      mov     qword ptr [rsp+8],rbx
fffff809`efc0f17d 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff809`efc0f182 4889742418      mov     qword ptr [rsp+18h],rsi
fffff809`efc0f187 57              push    rdi
fffff809`efc0f188 4156            push    r14
fffff809`efc0f18a 4157            push    r15
fffff809`efc0f18c 4883ec50        sub     rsp,50h
fffff809`efc0f190 488b82a8000000  mov     rax,qword ptr [rdx+0A8h]  ;Srb
fffff809`efc0f197 488be9          mov     rbp,rcx                   ;AdapterExt
fffff809`efc0f19a 488bfa          mov     rdi,rdx                   ;PortContext 
fffff809`efc0f19d 8a4802          mov     cl,byte ptr [rax+2]
fffff809`efc0f1a0 80f928          cmp     cl,28h
fffff809`efc0f1a3 0f84ba000000    je      storport!RaidAdapterScatterGatherExecute+0xeb (fffff809`efc0f263)  Branch

storport!RaidAdapterScatterGatherExecute+0x31:
fffff809`efc0f1a9 8b700c          mov     esi,dword ptr [rax+0Ch]   ;SCSI_REQUEST_BLOCK :: SrbFlags
fffff809`efc0f1ac 8b5810          mov     ebx,dword ptr [rax+10h]   ;SCSI_REQUEST_BLOCK :: DataTransferLength
fffff809`efc0f1af 440fb6f1        movzx   r14d,cl

storport!RaidAdapterScatterGatherExecute+0x3b:
fffff809`efc0f1b3 8b850c020000    mov     eax,dword ptr [rbp+20Ch] ;AdapterExt->MiniPort->PortConfiguration.FeatureSupport
fffff809`efc0f1b9 8bce            mov     ecx,esi
fffff809`efc0f1bb c1ee07          shr     esi,7     ; esi = esi/128  => 配合sil AND 1 =>  sil = (esi & 0x80) => bool write(sil) = (srb->SrbFlags & SRB_FLAGS_DATA_OUT)
fffff809`efc0f1be 41b001          mov     r8b,1
fffff809`efc0f1c1 4122f0          and     sil,r8b   ; sil AND 1
fffff809`efc0f1c4 83e140          and     ecx,40h   ; SRB_FLAGS_DATA_IN AND ecx
fffff809`efc0f1c7 a808            test    al,8      ;if(FeatureSupport AND STOR_ADAPTER_DMA_V3_PREFERRED != 0) goto 0x6e
fffff809`efc0f1c9 751b            jne     storport!RaidAdapterScatterGatherExecute+0x6e (fffff809`efc0f1e6)  Branch

storport!RaidAdapterScatterGatherExecute+0x53:
fffff809`efc0f1cb f6456d02        test    byte ptr [rbp+6Dh],2  ;if(AdapterExt->Flags.UseDMAv3) goto 0x6e
fffff809`efc0f1cf 7515            jne     storport!RaidAdapterScatterGatherExecute+0x6e (fffff809`efc0f1e6)  Branch

storport!RaidAdapterScatterGatherExecute+0x59:
fffff809`efc0f1d1 85c9            test    ecx,ecx
fffff809`efc0f1d3 488b4f68        mov     rcx,qword ptr [rdi+68h]   ;MDL?
fffff809`efc0f1d7 0f95c2          setne   dl                       ;if (SrbFlags AND SRB_FLAGS_DATA_IN) dl=1
                                            ; KeFlushIoBuffers(pMDL, (SrbFlags AND SRB_FLAGS_DATA_IN), TRUE)
fffff809`efc0f1da 48ff15774f0500  call    qword ptr [storport!_imp_KeFlushIoBuffers (fffff809`efc64158)]
fffff809`efc0f1e1 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterScatterGatherExecute+0x6e:
fffff809`efc0f1e6 4183fe17        cmp     r14d,17h      ;if Srb->Function == SRB_FUNCTION_WMI, goto 0xdd (根據MDL調整 Srb->DataTransferLength)
fffff809`efc0f1ea 7469            je      storport!RaidAdapterScatterGatherExecute+0xdd (fffff809`efc0f255)  Branch

storport!RaidAdapterScatterGatherExecute+0x74:
fffff809`efc0f1ec 4c8b8fb8000000  mov     r9,qword ptr [rdi+0B8h]       ;CurrentVA => R9 = XRB->SrbData.DataBuffer
fffff809`efc0f1f3 488d87e8000000  lea     rax,[rdi+0E8h]                ;RAX == addr (XRB->ScatterGatherBuffer) 
fffff809`efc0f1fa 4c8b4768        mov     r8,qword ptr [rdi+68h]        ;MDL
fffff809`efc0f1fe 4c8db5b8020000  lea     r14,[rbp+2B8h]                ;R14 == addr (AdapterExt->Dma)
fffff809`efc0f205 488b5508        mov     rdx,qword ptr [rbp+8]         ;RDX = AdapterExt->DeviceObject
fffff809`efc0f209 4c8d3dd0d8ffff  lea     r15,[storport!RaidpAdapterContinueScatterGather (fffff809`efc0cae0)]
fffff809`efc0f210 4889442440      mov     qword ptr [rsp+40h],rax       ;addr (XRB->ScatterGatherBuffer)
fffff809`efc0f215 498bce          mov     rcx,r14                       ;addr (AdapterExt->Dma)
fffff809`efc0f218 4088742438      mov     byte ptr [rsp+38h],sil        ;BOOLEAN WriteToDevice = (srb->SrbFlags & SRB_FLAGS_DATA_OUT)
fffff809`efc0f21d 48897c2430      mov     qword ptr [rsp+30h],rdi       ;XRB (ExecutionRoutine callback context)
fffff809`efc0f222 4c897c2428      mov     qword ptr [rsp+28h],r15       ;PDRIVER_LIST_CONTROL ExecutionRoutine
fffff809`efc0f227 895c2420        mov     dword ptr [rsp+20h],ebx       ;Srb->DataTransferLength
fffff809`efc0f22b e848000000      call    storport!RaidDmaBuildScatterGatherList (fffff809`efc0f278) 
    ;fffff809`efc0f22b=> RaidDmaBuildScatterGatherList(&AdapterExt->Dma, AdapterExt->DeviceObject, &XRB->Mdl, XRB->SrbData.DataBuffer, Srb->DataTransferLength,
    ;                           function ptr "RaidpAdapterContinueScatterGather", XRB, (srb->SrbFlags & SRB_FLAGS_DATA_OUT))
fffff809`efc0f230 3d230000c0      cmp     eax,0C0000023h
fffff809`efc0f235 0f84cd050200    je      storport!RaidAdapterScatterGatherExecute+0x20690 (fffff809`efc2f808)  Branch

storport!RaidAdapterScatterGatherExecute+0xc3:
fffff809`efc0f23b 4c8d5c2450      lea     r11,[rsp+50h]
fffff809`efc0f240 498b5b20        mov     rbx,qword ptr [r11+20h]
fffff809`efc0f244 498b6b28        mov     rbp,qword ptr [r11+28h]
fffff809`efc0f248 498b7330        mov     rsi,qword ptr [r11+30h]
fffff809`efc0f24c 498be3          mov     rsp,r11
fffff809`efc0f24f 415f            pop     r15
fffff809`efc0f251 415e            pop     r14
fffff809`efc0f253 5f              pop     rdi
fffff809`efc0f254 c3              ret

storport!RaidAdapterScatterGatherExecute+0xdd:
fffff809`efc0f255 488b4768        mov     rax,qword ptr [rdi+68h]
fffff809`efc0f259 8b4828          mov     ecx,dword ptr [rax+28h]       ;MDL->ByteCount ?
fffff809`efc0f25c 3bcb            cmp     ecx,ebx
fffff809`efc0f25e 0f47d9          cmova   ebx,ecx       ;if(MDL->ByteCount > Srb->DataTransferLength)  Srb->DataTransferLength=MDL->ByteCount 
fffff809`efc0f261 eb89            jmp     storport!RaidAdapterScatterGatherExecute+0x74 (fffff809`efc0f1ec)  Branch

storport!RaidAdapterScatterGatherExecute+0xeb:
fffff809`efc0f263 8b7018          mov     esi,dword ptr [rax+18h]       ;Srb->SrbFlags
fffff809`efc0f266 8b583c          mov     ebx,dword ptr [rax+3Ch]       ;Srb->DataTransferLength
fffff809`efc0f269 448b7014        mov     r14d,dword ptr [rax+14h]      ;Srb->SrbFunction
fffff809`efc0f26d e941ffffff      jmp     storport!RaidAdapterScatterGatherExecute+0x3b (fffff809`efc0f1b3)  Branch

storport!RaidAdapterScatterGatherExecute+0x20690:
fffff809`efc2f808 4c8b8fb8000000  mov     r9,qword ptr [rdi+0B8h]
fffff809`efc2f80f 498bce          mov     rcx,r14
fffff809`efc2f812 4c8b4768        mov     r8,qword ptr [rdi+68h]
fffff809`efc2f816 488b5508        mov     rdx,qword ptr [rbp+8]
fffff809`efc2f81a 4088742438      mov     byte ptr [rsp+38h],sil
fffff809`efc2f81f 48897c2430      mov     qword ptr [rsp+30h],rdi
fffff809`efc2f824 4c897c2428      mov     qword ptr [rsp+28h],r15
fffff809`efc2f829 895c2420        mov     dword ptr [rsp+20h],ebx
fffff809`efc2f82d e842890000      call    storport!RaidDmaGetScatterGatherList (fffff809`efc38174)
fffff809`efc2f832 90              nop
fffff809`efc2f833 e903fafdff      jmp     storport!RaidAdapterScatterGatherExecute+0xc3 (fffff809`efc0f23b)  Branch


