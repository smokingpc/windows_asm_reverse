0: kd> uf storport!RaidSrbStatusToNtStatus
storport!RaidSrbStatusToNtStatus:
fffff803`10deb6a8 0fb6d1          movzx   edx,cl
fffff803`10deb6ab 81e23fffffff    and     edx,0FFFFFF3Fh        ;SRB_STATUS_* & 0x3F
fffff803`10deb6b1 83fa11          cmp     edx,11h               ;if status code > SRB_STATUS_NO_HBA, goto 0x34
fffff803`10deb6b4 7726            ja      storport!RaidSrbStatusToNtStatus+0x34 (fffff803`10deb6dc)  Branch

storport!RaidSrbStatusToNtStatus+0xe:       ;if SRB_STATUS_NO_HBA, return  STATUS_DEVICE_DOES_NOT_EXIST (C00000C0)
fffff803`10deb6b6 7441            je      storport!RaidSrbStatusToNtStatus+0x51 (fffff803`10deb6f9)  Branch

storport!RaidSrbStatusToNtStatus+0x10:
fffff803`10deb6b8 83ea01          sub     edx,1 ;if SRB_STATUS_SUCCESS , return STATUS_SUCCESS
fffff803`10deb6bb 7448            je      storport!RaidSrbStatusToNtStatus+0x5d (fffff803`10deb705)  Branch

storport!RaidSrbStatusToNtStatus+0x15:
fffff803`10deb6bd 83ea04          sub     edx,4 ;if SRB_STATUS_BUSY, return STATUS_DEVICE_BUSY (80000011)
fffff803`10deb6c0 7452            je      storport!RaidSrbStatusToNtStatus+0x6c (fffff803`10deb714)  Branch

storport!RaidSrbStatusToNtStatus+0x1a:
fffff803`10deb6c2 83ea03          sub     edx,3 ;if SRB_STATUS_NO_DEVICE, return STATUS_DEVICE_DOES_NOT_EXIST (C00000C0)
fffff803`10deb6c5 7432            je      storport!RaidSrbStatusToNtStatus+0x51 (fffff803`10deb6f9)  Branch

storport!RaidSrbStatusToNtStatus+0x1f:
fffff803`10deb6c7 83ea01          sub     edx,1 ;if SRB_STATUS_TIMEOUT, return STATUS_IO_TIMEOUT (C00000B5)
fffff803`10deb6ca 7442            je      storport!RaidSrbStatusToNtStatus+0x66 (fffff803`10deb70e)  Branch

storport!RaidSrbStatusToNtStatus+0x24:
fffff803`10deb6cc 83ea01          sub     edx,1 ;if SRB_STATUS_SELECTION_TIMEOUT, return STATUS_DEVICE_NOT_CONNECTED (C000009D)
fffff803`10deb6cf 7437            je      storport!RaidSrbStatusToNtStatus+0x60 (fffff803`10deb708)  Branch

storport!RaidSrbStatusToNtStatus+0x29:
fffff803`10deb6d1 83fa01          cmp     edx,1 ;if SRB_STATUS_COMMAND_TIMEOUT, return STATUS_IO_TIMEOUT (C00000B5)
fffff803`10deb6d4 7438            je      storport!RaidSrbStatusToNtStatus+0x66 (fffff803`10deb70e)  Branch

storport!RaidSrbStatusToNtStatus+0x2e:      ;all other SRB_STATUS => return STATUS_IO_DEVICE_ERROR(C0000185)
fffff803`10deb6d6 b8850100c0      mov     eax,0C0000185h
fffff803`10deb6db c3              ret

storport!RaidSrbStatusToNtStatus+0x34:
fffff803`10deb6dc 83fa12          cmp     edx,12h   ;if SRB_STATUS_DATA_OVERRUN, return STATUS_BUFFER_OVERFLOW(80000005)
fffff803`10deb6df 741e            je      storport!RaidSrbStatusToNtStatus+0x57 (fffff803`10deb6ff)  Branch

storport!RaidSrbStatusToNtStatus+0x39:
fffff803`10deb6e1 83fa15          cmp     edx,15h   ;if SRB_STATUS_BAD_SRB_BLOCK_LENGTH, return STATUS_INVALID_DEVICE_REQUEST(C0000010)
fffff803`10deb6e4 743a            je      storport!RaidSrbStatusToNtStatus+0x78 (fffff803`10deb720)  Branch

storport!RaidSrbStatusToNtStatus+0x3e:
fffff803`10deb6e6 83fa16          cmp     edx,16h   ;if SRB_STATUS_REQUEST_FLUSHED, return STATUS_UNSUCCESSFUL(C0000001)
fffff803`10deb6e9 742f            je      storport!RaidSrbStatusToNtStatus+0x72 (fffff803`10deb71a)  Branch

storport!RaidSrbStatusToNtStatus+0x43:
fffff803`10deb6eb 83fa1f          cmp     edx,1Fh   ;if srb_status <= 0x1F (內部保留？header沒這定義) , return STATUS_IO_DEVICE_ERROR(C0000185)
fffff803`10deb6ee 76e6            jbe     storport!RaidSrbStatusToNtStatus+0x2e (fffff803`10deb6d6)  Branch

storport!RaidSrbStatusToNtStatus+0x48:
fffff803`10deb6f0 83fa21          cmp     edx,21h   ;if srb_status > SRB_STATUS_INVALID_TARGET_ID, goto 0x22c44
fffff803`10deb6f3 0f87f32b0200    ja      storport!RaidSrbStatusToNtStatus+0x22c44 (fffff803`10e0e2ec)  Branch

storport!RaidSrbStatusToNtStatus+0x51:
fffff803`10deb6f9 b8c00000c0      mov     eax,0C00000C0h
fffff803`10deb6fe c3              ret

storport!RaidSrbStatusToNtStatus+0x57:
fffff803`10deb6ff b805000080      mov     eax,80000005h
fffff803`10deb704 c3              ret

storport!RaidSrbStatusToNtStatus+0x5d:
fffff803`10deb705 33c0            xor     eax,eax
fffff803`10deb707 c3              ret

storport!RaidSrbStatusToNtStatus+0x60:
fffff803`10deb708 b89d0000c0      mov     eax,0C000009Dh
fffff803`10deb70d c3              ret

storport!RaidSrbStatusToNtStatus+0x66:
fffff803`10deb70e b8b50000c0      mov     eax,0C00000B5h
fffff803`10deb713 c3              ret

storport!RaidSrbStatusToNtStatus+0x6c:
fffff803`10deb714 b811000080      mov     eax,80000011h
fffff803`10deb719 c3              ret

storport!RaidSrbStatusToNtStatus+0x72:
fffff803`10deb71a b8010000c0      mov     eax,0C0000001h
fffff803`10deb71f c3              ret

storport!RaidSrbStatusToNtStatus+0x78:
fffff803`10deb720 b8100000c0      mov     eax,0C0000010h
fffff803`10deb725 c3              ret

storport!RaidSrbStatusToNtStatus+0x22c44:
fffff803`10e0e2ec 83fa22          cmp     edx,22h   ;if SRB_STATUS_BAD_FUNCTION, return STATUS_INVALID_DEVICE_REQUEST(C0000010)
fffff803`10e0e2ef 0f842bd4fdff    je      storport!RaidSrbStatusToNtStatus+0x78 (fffff803`10deb720)  Branch

storport!RaidSrbStatusToNtStatus+0x22c4d:
fffff803`10e0e2f5 83fa38          cmp     edx,38h   ;if srb_status != 0x38 (系統保留，header未定義), return STATUS_IO_DEVICE_ERROR(C0000185)
fffff803`10e0e2f8 0f85d8d3fdff    jne     storport!RaidSrbStatusToNtStatus+0x2e (fffff803`10deb6d6)  Branch

storport!RaidSrbStatusToNtStatus+0x22c56:   ;if srb_status == 0x38, return STATUS_DEVICE_UNRESPONSIVE (C000050A)
fffff803`10e0e2fe b80a0500c0      mov     eax,0C000050Ah
fffff803`10e0e303 c3              ret
