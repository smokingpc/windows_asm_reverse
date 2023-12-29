2: kd> uf RaidAdapterExecuteXrb
storport!RaidAdapterExecuteXrb:
fffff806`c7d12e30 48895c2408      mov     qword ptr [rsp+8],rbx
fffff806`c7d12e35 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff806`c7d12e3a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff806`c7d12e3f 57              push    rdi
fffff806`c7d12e40 4883ec20        sub     rsp,20h
fffff806`c7d12e44 80b9a211000000  cmp     byte ptr [rcx+11A2h],0
fffff806`c7d12e4b 488bda          mov     rbx,rdx       ;RDX == XRB
fffff806`c7d12e4e 488bf1          mov     rsi,rcx
fffff806`c7d12e51 746a            je      storport!RaidAdapterExecuteXrb+0x8d (fffff806`c7d12ebd)  Branch

storport!RaidAdapterExecuteXrb+0x23:
fffff806`c7d12e53 488b82a8000000  mov     rax,qword ptr [rdx+0A8h]  ;get XRB->SRB
fffff806`c7d12e5a 80780228        cmp     byte ptr [rax+2],28h      ;if function == SRB_FUNCTION_STORAGE_REQUEST_BLOCK, goto 0x9a
fffff806`c7d12e5e 746a            je      storport!RaidAdapterExecuteXrb+0x9a (fffff806`c7d12eca)  Branch
                                          ;0x9a => _STORAGE_REQUEST_BLOCK 取得 SrbFlags

storport!RaidAdapterExecuteXrb+0x30:
fffff806`c7d12e60 8b780c          mov     edi,dword ptr [rax+0Ch]   ;_SCSI_REQUEST_BLOCK 取得 SrbFlags

storport!RaidAdapterExecuteXrb+0x33:
fffff806`c7d12e63 f681a311000004  test    byte ptr [rcx+11A3h],4        ;check AdapterExt->PerfOptFlags, if(! BypassSgl) goto 0x66
fffff806`c7d12e6a 752a            jne     storport!RaidAdapterExecuteXrb+0x66 (fffff806`c7d12e96)  Branch

storport!RaidAdapterExecuteXrb+0x3c:
fffff806`c7d12e6c 4883ba8800000000 cmp     qword ptr [rdx+88h],0            ;if (XRB->DataMdl != NULL), goto 0xac
fffff806`c7d12e74 7566            jne     storport!RaidAdapterExecuteXrb+0xac (fffff806`c7d12edc)  Branch

storport!RaidAdapterExecuteXrb+0x46:
fffff806`c7d12e76 40f6c7c0        test    dil,0C0h  ;if (Srb->SrbFlags & SRB_FLAGS_UNSPECIFIED_DIRECTION) goto 0x8d
fffff806`c7d12e7a 7441            je      storport!RaidAdapterExecuteXrb+0x8d (fffff806`c7d12ebd)  Branch

storport!RaidAdapterExecuteXrb+0x4c:
fffff806`c7d12e7c e8cbfdffff      call    storport!RaidAdapterScatterGatherExecute (fffff806`c7d12c4c)

storport!RaidAdapterExecuteXrb+0x51:
fffff806`c7d12e81 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff806`c7d12e86 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff806`c7d12e8b 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff806`c7d12e90 4883c420        add     rsp,20h
fffff806`c7d12e94 5f              pop     rdi
fffff806`c7d12e95 c3              ret

storport!RaidAdapterExecuteXrb+0x66:
fffff806`c7d12e96 488b5268        mov     rdx,qword ptr [rdx+68h]   ;Srb->MiniportContext
fffff806`c7d12e9a 488da9d0020000  lea     rbp,[rcx+2D0h]    ;AdapterExt->Dma->MapRegisterBase or Width ??
fffff806`c7d12ea1 c1ef06          shr     edi,6
fffff806`c7d12ea4 4080e701        and     dil,1
fffff806`c7d12ea8 4885d2          test    rdx,rdx   ;if SrbFlags & SRB_FLAGS_DATA_IN , goto 0x9f
fffff806`c7d12eab 7522            jne     storport!RaidAdapterExecuteXrb+0x9f (fffff806`c7d12ecf)  Branch

storport!RaidAdapterExecuteXrb+0x7d:
fffff806`c7d12ead 488b9388000000  mov     rdx,qword ptr [rbx+88h]
fffff806`c7d12eb4 4885d2          test    rdx,rdx ;IF Srb->Cdb->Cdb6GenericOp != EXECUTE_SCSI, goto 0x29c82
fffff806`c7d12eb7 0f85f59b0200    jne     storport!RaidAdapterExecuteXrb+0x29c82 (fffff806`c7d3cab2)  Branch

storport!RaidAdapterExecuteXrb+0x8d:
fffff806`c7d12ebd 488bd3          mov     rdx,rbx
fffff806`c7d12ec0 488bce          mov     rcx,rsi
fffff806`c7d12ec3 e8a8190000      call    storport!RaidAdapterPostScatterGatherExecute (fffff806`c7d14870)
fffff806`c7d12ec8 ebb7            jmp     storport!RaidAdapterExecuteXrb+0x51 (fffff806`c7d12e81)  Branch

storport!RaidAdapterExecuteXrb+0x9a:
fffff806`c7d12eca 8b7818          mov     edi,dword ptr [rax+18h];move Srb->SrbFlags to edi
fffff806`c7d12ecd eb94            jmp     storport!RaidAdapterExecuteXrb+0x33 (fffff806`c7d12e63)  Branch

storport!RaidAdapterExecuteXrb+0x9f:
fffff806`c7d12ecf 448ac7          mov     r8b,dil
fffff806`c7d12ed2 488bcd          mov     rcx,rbp
fffff806`c7d12ed5 e8f2210200      call    storport!RaidDmaFlushDmaBuffers (fffff806`c7d350cc)
fffff806`c7d12eda ebd1            jmp     storport!RaidAdapterExecuteXrb+0x7d (fffff806`c7d12ead)  Branch

storport!RaidAdapterExecuteXrb+0xac:
fffff806`c7d12edc e89f620300      call    storport!RaidAdapterScatterGatherExecuteBidirectionalRequest (fffff806`c7d49180)
fffff806`c7d12ee1 eb9e            jmp     storport!RaidAdapterExecuteXrb+0x51 (fffff806`c7d12e81)  Branch

storport!RaidAdapterExecuteXrb+0x29c82:
fffff806`c7d3cab2 448ac7          mov     r8b,dil
fffff806`c7d3cab5 488bcd          mov     rcx,rbp
fffff806`c7d3cab8 e80f86ffff      call    storport!RaidDmaFlushDmaBuffers (fffff806`c7d350cc)
fffff806`c7d3cabd 90              nop
fffff806`c7d3cabe e9fa63fdff      jmp     storport!RaidAdapterExecuteXrb+0x8d (fffff806`c7d12ebd)  Branch
