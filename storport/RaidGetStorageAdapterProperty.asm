;rcx == AdapterExt
;rdx == STORAGE_DESCRIPTOR_HEADER or STORAGE_ADAPTER_DESCRIPTOR
;r8 == addr of output buffer size variable
15: kd> uf RaidGetStorageAdapterProperty
storport!RaidGetStorageAdapterProperty:
fffff80c`ccf8a19c 498b00          mov     rax,qword ptr [r8]
fffff80c`ccf8a19f 4883f808        cmp     rax,8 ;if outbuf_size == 8, it is STORAGE_DESCRIPTOR_HEADER, return 8 bytes
fffff80c`ccf8a1a3 0f82336d0000    jb      storport!RaidGetStorageAdapterProperty+0x6d40 (fffff80c`ccf90edc)  Branch

storport!RaidGetStorageAdapterProperty+0xd:
fffff80c`ccf8a1a9 41ba1e000000    mov     r10d,1Eh
fffff80c`ccf8a1af 493bc2          cmp     rax,r10
fffff80c`ccf8a1b2 0f829a000000    jb      storport!RaidGetStorageAdapterProperty+0xb6 (fffff80c`ccf8a252)  Branch

storport!RaidGetStorageAdapterProperty+0x1c:
fffff80c`ccf8a1b8 4883f820        cmp     rax,20h   ;is input buffer == STORAGE_ADAPTER_DESCRIPTOR?
fffff80c`ccf8a1bc 1bc0            sbb     eax,eax
fffff80c`ccf8a1be 4533db          xor     r11d,r11d
fffff80c`ccf8a1c1 83e0fe          and     eax,0FFFFFFFEh
fffff80c`ccf8a1c4 83c020          add     eax,20h
fffff80c`ccf8a1c7 894204          mov     dword ptr [rdx+4],eax ;retbuf->Version = 0x20
fffff80c`ccf8a1ca 8902            mov     dword ptr [rdx],eax   ;retbuf->Size = 0x20
fffff80c`ccf8a1cc 448b895c010000  mov     r9d,dword ptr [rcx+15Ch]  ;AdapterExt->Miniport->PortConfig->NumberOfPhysicalBreaks
fffff80c`ccf8a1d3 443899a2110000  cmp     byte ptr [rcx+11A2h],r11b ;if(0==AdapterExt->Contiguous) goto 0x4d
fffff80c`ccf8a1da 740d            je      storport!RaidGetStorageAdapterProperty+0x4d (fffff80c`ccf8a1e9)  Branch

storport!RaidGetStorageAdapterProperty+0x40:
fffff80c`ccf8a1dc 8b81dc020000    mov     eax,dword ptr [rcx+2DCh]
fffff80c`ccf8a1e2 443bc8          cmp     r9d,eax
fffff80c`ccf8a1e5 440f43c8        cmovae  r9d,eax

storport!RaidGetStorageAdapterProperty+0x4d:    ;AdapterProperty都從AdapterExt->Miniport->PortConfig取得...
fffff80c`ccf8a1e9 44894a0c        mov     dword ptr [rdx+0Ch],r9d   ;retbuf->MaximumPhysicalPages
fffff80c`ccf8a1ed 49833820        cmp     qword ptr [r8],20h        ;AdapterExt->Miniport->PortConfig == AdapterExt + 0x140
fffff80c`ccf8a1f1 8b8158010000    mov     eax,dword ptr [rcx+158h]  ;AdapterExt->Miniport->PortConfig->MaximumTransferLength
fffff80c`ccf8a1f7 894208          mov     dword ptr [rdx+8],eax     ;retbuf->MaximumTransferLength
fffff80c`ccf8a1fa 8b8170010000    mov     eax,dword ptr [rcx+170h]  ;AdapterExt->Miniport->PortConfig->AlignmentMask
fffff80c`ccf8a200 894210          mov     dword ptr [rdx+10h],eax   ;retbuf->AlignmentMask
fffff80c`ccf8a203 8a8199010000    mov     al,byte ptr [rcx+199h]    ;PortConfig->MapBuffers ??
fffff80c`ccf8a209 884214          mov     byte ptr [rdx+14h],al     ;retbuf->AdapterUsesPio ??
fffff80c`ccf8a20c 8a8194010000    mov     al,byte ptr [rcx+194h]    ;PortConfig->AdapterScansDown
fffff80c`ccf8a212 884215          mov     byte ptr [rdx+15h],al     ;retbuf->AdapterScansDown
fffff80c`ccf8a215 8a819b010000    mov     al,byte ptr [rcx+19Bh]    ;PortConfig->TaggedQueuing
fffff80c`ccf8a21b 884216          mov     byte ptr [rdx+16h],al     ;retbuf->CommandQueueing
fffff80c`ccf8a21e c6421701        mov     byte ptr [rdx+17h],1      ;retbuf->AcceleratedTransfer = TRUE
fffff80c`ccf8a222 8a8144110000    mov     al,byte ptr [rcx+1144h]   ;AdaperExt->Parameters->BusType
fffff80c`ccf8a228 884218          mov     byte ptr [rdx+18h],al     ;retbuf->BusType (有1 byte padding)
fffff80c`ccf8a22b c7421a02000000  mov     dword ptr [rdx+1Ah],2     ;retbuf->BusMajorVersion = 2
fffff80c`ccf8a232 7218            jb      storport!RaidGetStorageAdapterProperty+0xb0 (fffff80c`ccf8a24c)  Branch

storport!RaidGetStorageAdapterProperty+0x98:
fffff80c`ccf8a234 8a81a2010000    mov     al,byte ptr [rcx+1A2h]    ;PortConfig->SrbType
fffff80c`ccf8a23a 41ba20000000    mov     r10d,20h
fffff80c`ccf8a240 88421e          mov     byte ptr [rdx+1Eh],al     ;retbuf->SrbType
fffff80c`ccf8a243 8a81a3010000    mov     al,byte ptr [rcx+1A3h]    ;PortConfig->AddressType
fffff80c`ccf8a249 88421f          mov     byte ptr [rdx+1Fh],al     ;retbuf->AddressType

storport!RaidGetStorageAdapterProperty+0xb0:
fffff80c`ccf8a24c 4d8910          mov     qword ptr [r8],r10

storport!RaidGetStorageAdapterProperty+0xb3:
fffff80c`ccf8a24f 33c0            xor     eax,eax
fffff80c`ccf8a251 c3              ret

storport!RaidGetStorageAdapterProperty+0xb6:
fffff80c`ccf8a252 c70220000000    mov     dword ptr [rdx],20h
fffff80c`ccf8a258 c7420420000000  mov     dword ptr [rdx+4],20h
fffff80c`ccf8a25f 49c70008000000  mov     qword ptr [r8],8
fffff80c`ccf8a266 ebe7            jmp     storport!RaidGetStorageAdapterProperty+0xb3 (fffff80c`ccf8a24f)  Branch

storport!RaidGetStorageAdapterProperty+0x6d40:
fffff80c`ccf90edc 49c70020000000  mov     qword ptr [r8],20h
fffff80c`ccf90ee3 b8230000c0      mov     eax,0C0000023h
fffff80c`ccf90ee8 c3              ret
