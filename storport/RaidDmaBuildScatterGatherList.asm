    ;RaidDmaBuildScatterGatherList(&AdapterExt->Dma, AdapterExt->DeviceObject, &XRB->Mdl, XRB->SrbData.DataBuffer, Srb->DataTransferLength,
    ;           function ptr "RaidpAdapterContinueScatterGather", XRB, (srb->SrbFlags & SRB_FLAGS_DATA_OUT))

0: kd> uf RaidDmaBuildScatterGatherList
storport!RaidDmaBuildScatterGatherList:
fffff80f`82e8f278 4883ec68        sub     rsp,68h
fffff80f`82e8f27c 4c8bd2          mov     r10,rdx
fffff80f`82e8f27f 4885c9          test    rcx,rcx   ;if(AdapterExt->Dma is NULL) return STATUS_INVALID_PARAM
fffff80f`82e8f282 746d            je      storport!RaidDmaBuildScatterGatherList+0x79 (fffff80f`82e8f2f1)  Branch

storport!RaidDmaBuildScatterGatherList+0xc:
fffff80f`82e8f284 488b09          mov     rcx,qword ptr [rcx]
fffff80f`82e8f287 4885c9          test    rcx,rcx   ;if(AdapterExt->Dma->DmaAdapter is NULL) return STATUS_INVALID_PARAM
fffff80f`82e8f28a 7465            je      storport!RaidDmaBuildScatterGatherList+0x79 (fffff80f`82e8f2f1)  Branch

storport!RaidDmaBuildScatterGatherList+0x14:
fffff80f`82e8f28c 488b4108        mov     rax,qword ptr [rcx+8] ;if(Dma->DmaAdapter->DmaOperations is NULL) return STATUS_INVALID_PARAM
fffff80f`82e8f290 4885c0          test    rax,rax
fffff80f`82e8f293 745c            je      storport!RaidDmaBuildScatterGatherList+0x79 (fffff80f`82e8f2f1)  Branch

storport!RaidDmaBuildScatterGatherList+0x1d:
fffff80f`82e8f295 488b4070        mov     rax,qword ptr [rax+70h]   ;RAX = DmaOperations->BuildScatterGatherList 
fffff80f`82e8f299 4885c0          test    rax,rax           ;if(DmaOperations->BuildScatterGatherList is NULL) return STATUS_INVALID_PARAM
fffff80f`82e8f29c 7453            je      storport!RaidDmaBuildScatterGatherList+0x79 (fffff80f`82e8f2f1)  Branch

storport!RaidDmaBuildScatterGatherList+0x26:
fffff80f`82e8f29e 488b9424b0000000 mov     rdx,qword ptr [rsp+0B0h]
fffff80f`82e8f2a6 c7442448a8010000 mov     dword ptr [rsp+48h],1A8h
fffff80f`82e8f2ae 4889542440      mov     qword ptr [rsp+40h],rdx
fffff80f`82e8f2b3 8a9424a8000000  mov     dl,byte ptr [rsp+0A8h]
fffff80f`82e8f2ba 88542438        mov     byte ptr [rsp+38h],dl
fffff80f`82e8f2be 488b9424a0000000 mov     rdx,qword ptr [rsp+0A0h]
fffff80f`82e8f2c6 4889542430      mov     qword ptr [rsp+30h],rdx
fffff80f`82e8f2cb 488b942498000000 mov     rdx,qword ptr [rsp+98h]
fffff80f`82e8f2d3 4889542428      mov     qword ptr [rsp+28h],rdx
fffff80f`82e8f2d8 8b942490000000  mov     edx,dword ptr [rsp+90h]
fffff80f`82e8f2df 89542420        mov     dword ptr [rsp+20h],edx
fffff80f`82e8f2e3 498bd2          mov     rdx,r10
fffff80f`82e8f2e6 ff15ec540500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80f`82ee47d8)]
; call DmaOperations->BuildScatterGatherList()


storport!RaidDmaBuildScatterGatherList+0x74:
fffff80f`82e8f2ec 4883c468        add     rsp,68h
fffff80f`82e8f2f0 c3              ret

storport!RaidDmaBuildScatterGatherList+0x79:
fffff80f`82e8f2f1 b80d0000c0      mov     eax,0C000000Dh
fffff80f`82e8f2f6 ebf4            jmp     storport!RaidDmaBuildScatterGatherList+0x74 (fffff80f`82e8f2ec)  Branch
