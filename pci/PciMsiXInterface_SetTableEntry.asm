;NTSTATUS PCI_MSIX_SET_ENTRY (
;    _In_ PVOID Context,
;    _In_ ULONG TableEntry,
;    _In_ ULONG MessageNumber);

6: kd> uf PciMsiXInterface_SetTableEntry
pci!PciMsiXInterface_SetTableEntry:
fffff803`45929ac0 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff803`45929ac5 55              push    rbp
fffff803`45929ac6 56              push    rsi
fffff803`45929ac7 57              push    rdi
fffff803`45929ac8 488bec          mov     rbp,rsp
fffff803`45929acb 4883ec60        sub     rsp,60h
fffff803`45929acf 488b055a270200  mov     rax,qword ptr [pci!_security_cookie (fffff803`4594c230)]
fffff803`45929ad6 4833c4          xor     rax,rsp
fffff803`45929ad9 488945f0        mov     qword ptr [rbp-10h],rax
fffff803`45929add 813950636944    cmp     dword ptr [rcx],44696350h
fffff803`45929ae3 418bf0          mov     esi,r8d
fffff803`45929ae6 8bda            mov     ebx,edx
fffff803`45929ae8 488bf9          mov     rdi,rcx
fffff803`45929aeb 0f85037e0000    jne     pci!PciMsiXInterface_SetTableEntry+0x7e34 (fffff803`459318f4)  Branch

pci!PciMsiXInterface_SetTableEntry+0x31:
fffff803`45929af1 83b94803000003  cmp     dword ptr [rcx+348h],3
fffff803`45929af8 0f85f67d0000    jne     pci!PciMsiXInterface_SetTableEntry+0x7e34 (fffff803`459318f4)  Branch

pci!PciMsiXInterface_SetTableEntry+0x3e:
fffff803`45929afe 3b99d4030000    cmp     ebx,dword ptr [rcx+3D4h]
fffff803`45929b04 0f83ea7d0000    jae     pci!PciMsiXInterface_SetTableEntry+0x7e34 (fffff803`459318f4)  Branch

pci!PciMsiXInterface_SetTableEntry+0x4a:
fffff803`45929b0a 443b8160030000  cmp     r8d,dword ptr [rcx+360h]
fffff803`45929b11 0f83dd7d0000    jae     pci!PciMsiXInterface_SetTableEntry+0x7e34 (fffff803`459318f4)  Branch

pci!PciMsiXInterface_SetTableEntry+0x57:
fffff803`45929b17 488b9170030000  mov     rdx,qword ptr [rcx+370h]
fffff803`45929b1e 488d45d0        lea     rax,[rbp-30h]
fffff803`45929b22 4c8d4dd8        lea     r9,[rbp-28h]
fffff803`45929b26 4889442420      mov     qword ptr [rsp+20h],rax
fffff803`45929b2b e800020000      call    pci!PciProcessInterruptMessageData (fffff803`45929d30)
fffff803`45929b30 85c0            test    eax,eax
fffff803`45929b32 787b            js      pci!PciMsiXInterface_SetTableEntry+0xef (fffff803`45929baf)  Branch

;PDOEXT + 358 == mapped MSIX Raw Table 
;PDOEXT + 368 == msgid table
;PDOEXT + 370 == pci.sys維護的 struct MSIX_MSG_ADDR / OS ACPI vector(!arbiter 4 看到的那個) 等映射資料
pci!PciMsiXInterface_SetTableEntry+0x74:
fffff803`45929b34 488b8768030000  mov     rax,qword ptr [rdi+368h]  ;msgid table
fffff803`45929b3b 8bcb            mov     ecx,ebx
fffff803`45929b3d 8b1498          mov     edx,dword ptr [rax+rbx*4]
fffff803`45929b40 81e200000080    and     edx,80000000h
fffff803`45929b46 0bf2            or      esi,edx
fffff803`45929b48 893498          mov     dword ptr [rax+rbx*4],esi
fffff803`45929b4b 4c8b8758030000  mov     r8,qword ptr [rdi+358h]
fffff803`45929b52 488b45d8        mov     rax,qword ptr [rbp-28h]
fffff803`45929b56 488d7de0        lea     rdi,[rbp-20h]
fffff803`45929b5a 48c1e104        shl     rcx,4
fffff803`45929b5e 41b904000000    mov     r9d,4
fffff803`45929b64 4c03c1          add     r8,rcx
fffff803`45929b67 418bc9          mov     ecx,r9d
fffff803`45929b6a 498bf0          mov     rsi,r8
fffff803`45929b6d f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`45929b6f 488945e0        mov     qword ptr [rbp-20h],rax
fffff803`45929b73 8b45d0          mov     eax,dword ptr [rbp-30h]
fffff803`45929b76 8945e8          mov     dword ptr [rbp-18h],eax
fffff803`45929b79 85d2            test    edx,edx
fffff803`45929b7b 751f            jne     pci!PciMsiXInterface_SetTableEntry+0xdc (fffff803`45929b9c)  Branch

pci!PciMsiXInterface_SetTableEntry+0xbd:
fffff803`45929b7d 8b45ec          mov     eax,dword ptr [rbp-14h]
fffff803`45929b80 488d75e0        lea     rsi,[rbp-20h]
fffff803`45929b84 83c801          or      eax,1
fffff803`45929b87 498bf8          mov     rdi,r8
fffff803`45929b8a 418bc9          mov     ecx,r9d
fffff803`45929b8d 8945ec          mov     dword ptr [rbp-14h],eax
fffff803`45929b90 f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`45929b92 f0091424        lock or dword ptr [rsp],edx
fffff803`45929b96 83e0fe          and     eax,0FFFFFFFEh
fffff803`45929b99 8945ec          mov     dword ptr [rbp-14h],eax

pci!PciMsiXInterface_SetTableEntry+0xdc:
fffff803`45929b9c 488d75e0        lea     rsi,[rbp-20h]
fffff803`45929ba0 498bf8          mov     rdi,r8
fffff803`45929ba3 498bc9          mov     rcx,r9
fffff803`45929ba6 f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`45929ba8 f0830c2400      lock or dword ptr [rsp],0
fffff803`45929bad 33c0            xor     eax,eax

pci!PciMsiXInterface_SetTableEntry+0xef:
fffff803`45929baf 488b4df0        mov     rcx,qword ptr [rbp-10h]
fffff803`45929bb3 4833cc          xor     rcx,rsp
fffff803`45929bb6 e865170000      call    pci!_security_check_cookie (fffff803`4592b320)
fffff803`45929bbb 488b9c2498000000 mov     rbx,qword ptr [rsp+98h]
fffff803`45929bc3 4883c460        add     rsp,60h
fffff803`45929bc7 5f              pop     rdi
fffff803`45929bc8 5e              pop     rsi
fffff803`45929bc9 5d              pop     rbp
fffff803`45929bca c3              ret

pci!PciMsiXInterface_SetTableEntry+0x7e34:
fffff803`459318f4 b80d0000c0      mov     eax,0C000000Dh
fffff803`459318f9 e9b182ffff      jmp     pci!PciMsiXInterface_SetTableEntry+0xef (fffff803`45929baf)  Branch
