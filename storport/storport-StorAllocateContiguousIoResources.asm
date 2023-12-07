0: kd> uf storport!StorAllocateContiguousIoResources
storport!StorAllocateContiguousIoResources:
fffff80e`6c5ebd1c 4c8bdc          mov     r11,rsp
fffff80e`6c5ebd1f 49895b08        mov     qword ptr [r11+8],rbx
fffff80e`6c5ebd23 89542410        mov     dword ptr [rsp+10h],edx
fffff80e`6c5ebd27 57              push    rdi
fffff80e`6c5ebd28 4883ec60        sub     rsp,60h
fffff80e`6c5ebd2c 498b9028110000  mov     rdx,qword ptr [r8+1128h]      ;RDX = AdapterExt->Parameters.MinimumPhysicalAddress
fffff80e`6c5ebd33 8d7918          lea     edi,[rcx+18h]
fffff80e`6c5ebd36 4d8b90b8020000  mov     r10,qword ptr [r8+2B8h]       ;r10 = AdapterExt->Dma
fffff80e`6c5ebd3d 498bd8          mov     rbx,r8                        ;RBX = R8 = AdapterExt
fffff80e`6c5ebd40 4d8b8030110000  mov     r8,qword ptr [r8+1130h]       ;R8 =  AdapterExt->Parameters.MaximumPhysicalAddress
fffff80e`6c5ebd47 33c0            xor     eax,eax
fffff80e`6c5ebd49 49894318        mov     qword ptr [r11+18h],rax
fffff80e`6c5ebd4d c744247801000000 mov     dword ptr [rsp+78h],1
fffff80e`6c5ebd55 48398340160000  cmp     qword ptr [rbx+1640h],rax     ;if(AdapterExt->CryptoCapabilities != NULL) goto 0x220ba
fffff80e`6c5ebd5c 4c8b8b20110000  mov     r9,qword ptr [rbx+1120h]      ;R9=AdapterExt->Parameters.BoundaryAddress
fffff80e`6c5ebd63 0f44f9          cmove   edi,ecx
fffff80e`6c5ebd66 4889542450      mov     qword ptr [rsp+50h],rdx
fffff80e`6c5ebd6b 4d894320        mov     qword ptr [r11+20h],r8
fffff80e`6c5ebd6f 3883c0020000    cmp     byte ptr [rbx+2C0h],al
fffff80e`6c5ebd75 0f855b200200    jne     storport!StorAllocateContiguousIoResources+0x220ba (fffff80e`6c60ddd6)  Branch

storport!StorAllocateContiguousIoResources+0x5f:
fffff80e`6c5ebd7b 8bcf            mov     ecx,edi
fffff80e`6c5ebd7d c744242800000080 mov     dword ptr [rsp+28h],80000000h    ;MM_ANY_NODE_OK
fffff80e`6c5ebd85 c744242004000000 mov     dword ptr [rsp+20h],4            ;PAGE_READWRITE
fffff80e`6c5ebd8d 48ff15cc860500  call    qword ptr [storport!_imp_MmAllocateContiguousNodeMemory (fffff80e`6c644460)]
fffff80e`6c5ebd94 0f1f440000      nop     dword ptr [rax+rax]

storport!StorAllocateContiguousIoResources+0x7d:
fffff80e`6c5ebd99 488bd0          mov     rdx,rax
fffff80e`6c5ebd9c 4885c0          test    rax,rax
fffff80e`6c5ebd9f 7425            je      storport!StorAllocateContiguousIoResources+0xaa (fffff80e`6c5ebdc6)  Branch

storport!StorAllocateContiguousIoResources+0x85:
fffff80e`6c5ebda1 4883bb4016000000 cmp     qword ptr [rbx+1640h],0      ;if(AdapterExt->CryptoCapabilities != NULL) goto 0x22115
fffff80e`6c5ebda9 0f8582200200    jne     storport!StorAllocateContiguousIoResources+0x22115 (fffff80e`6c60de31)  Branch

storport!StorAllocateContiguousIoResources+0x93:
fffff80e`6c5ebdaf 4883a03003000000 and     qword ptr [rax+330h],0

storport!StorAllocateContiguousIoResources+0x9b:
fffff80e`6c5ebdb7 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff80e`6c5ebdbf 48894218        mov     qword ptr [rdx+18h],rax
fffff80e`6c5ebdc3 897a10          mov     dword ptr [rdx+10h],edi

storport!StorAllocateContiguousIoResources+0xaa:
fffff80e`6c5ebdc6 488bc2          mov     rax,rdx
fffff80e`6c5ebdc9 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff80e`6c5ebdce 4883c460        add     rsp,60h
fffff80e`6c5ebdd2 5f              pop     rdi
fffff80e`6c5ebdd3 c3              ret

storport!StorAllocateContiguousIoResources+0x220ba:
fffff80e`6c60ddd6 83bbd402000003  cmp     dword ptr [rbx+2D4h],3
fffff80e`6c60dddd 0f8598dffdff    jne     storport!StorAllocateContiguousIoResources+0x5f (fffff80e`6c5ebd7b)  Branch

storport!StorAllocateContiguousIoResources+0x220c7:
fffff80e`6c60dde3 498b4208        mov     rax,qword ptr [r10+8]
fffff80e`6c60dde7 488d8c2480000000 lea     rcx,[rsp+80h]
fffff80e`6c60ddef 48894c2438      mov     qword ptr [rsp+38h],rcx
fffff80e`6c60ddf4 4c8d842488000000 lea     r8,[rsp+88h]
fffff80e`6c60ddfc 488d4c2478      lea     rcx,[rsp+78h]
fffff80e`6c60de01 c744243000000080 mov     dword ptr [rsp+30h],80000000h
fffff80e`6c60de09 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff80e`6c60de0e 488d542450      lea     rdx,[rsp+50h]
fffff80e`6c60de13 8364242000      and     dword ptr [rsp+20h],0
fffff80e`6c60de18 498bca          mov     rcx,r10
fffff80e`6c60de1b 488b8010010000  mov     rax,qword ptr [rax+110h]
fffff80e`6c60de22 448bcf          mov     r9d,edi
fffff80e`6c60de25 ff15ad690300    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`6c6447d8)]
fffff80e`6c60de2b 90              nop
fffff80e`6c60de2c e968dffdff      jmp     storport!StorAllocateContiguousIoResources+0x7d (fffff80e`6c5ebd99)  Branch

storport!StorAllocateContiguousIoResources+0x22115:
fffff80e`6c60de31 8bcf            mov     ecx,edi
fffff80e`6c60de33 4883c1e8        add     rcx,0FFFFFFFFFFFFFFE8h
fffff80e`6c60de37 4803ca          add     rcx,rdx
fffff80e`6c60de3a 33c0            xor     eax,eax
fffff80e`6c60de3c 48898a30030000  mov     qword ptr [rdx+330h],rcx
fffff80e`6c60de43 488901          mov     qword ptr [rcx],rax
fffff80e`6c60de46 48894108        mov     qword ptr [rcx+8],rax
fffff80e`6c60de4a 48894110        mov     qword ptr [rcx+10h],rax
fffff80e`6c60de4e e964dffdff      jmp     storport!StorAllocateContiguousIoResources+0x9b (fffff80e`6c5ebdb7)  Branch

