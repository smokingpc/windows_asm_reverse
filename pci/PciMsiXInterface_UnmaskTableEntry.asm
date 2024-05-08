;NTSTATUS PCI_MSIX_MASKUNMASK_ENTRY (
;    _In_ PVOID Context,
;    _In_ ULONG TableEntry);

6: kd> uf PciMsiXInterface_UnmaskTableEntry
pci!PciMsiXInterface_UnmaskTableEntry:
fffff803`4593cbb0 4889742418      mov     qword ptr [rsp+18h],rsi
fffff803`4593cbb5 57              push    rdi
fffff803`4593cbb6 4883ec20        sub     rsp,20h
fffff803`4593cbba 488b056ff60000  mov     rax,qword ptr [pci!_security_cookie (fffff803`4594c230)]
fffff803`4593cbc1 4833c4          xor     rax,rsp
fffff803`4593cbc4 4889442410      mov     qword ptr [rsp+10h],rax
fffff803`4593cbc9 813950636944    cmp     dword ptr [rcx],44696350h
fffff803`4593cbcf 488bf9          mov     rdi,rcx
fffff803`4593cbd2 7556            jne     pci!PciMsiXInterface_UnmaskTableEntry+0x7a (fffff803`4593cc2a)  Branch

pci!PciMsiXInterface_UnmaskTableEntry+0x24:
fffff803`4593cbd4 83b94803000003  cmp     dword ptr [rcx+348h],3
fffff803`4593cbdb 754d            jne     pci!PciMsiXInterface_UnmaskTableEntry+0x7a (fffff803`4593cc2a)  Branch

pci!PciMsiXInterface_UnmaskTableEntry+0x2d:
fffff803`4593cbdd 3b91d4030000    cmp     edx,dword ptr [rcx+3D4h]
fffff803`4593cbe3 7345            jae     pci!PciMsiXInterface_UnmaskTableEntry+0x7a (fffff803`4593cc2a)  Branch

pci!PciMsiXInterface_UnmaskTableEntry+0x35:
fffff803`4593cbe5 488b8768030000  mov     rax,qword ptr [rdi+368h]
fffff803`4593cbec 8bca            mov     ecx,edx
fffff803`4593cbee 0fba34881f      btr     dword ptr [rax+rcx*4],1Fh
fffff803`4593cbf3 488b9758030000  mov     rdx,qword ptr [rdi+358h]
fffff803`4593cbfa 48c1e104        shl     rcx,4
fffff803`4593cbfe 488d3c24        lea     rdi,[rsp]
fffff803`4593cc02 4803d1          add     rdx,rcx
fffff803`4593cc05 b804000000      mov     eax,4
fffff803`4593cc0a 488bf2          mov     rsi,rdx
fffff803`4593cc0d 8bc8            mov     ecx,eax
fffff803`4593cc0f f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`4593cc11 8364240cfe      and     dword ptr [rsp+0Ch],0FFFFFFFEh
fffff803`4593cc16 488d3424        lea     rsi,[rsp]
fffff803`4593cc1a 488bfa          mov     rdi,rdx
fffff803`4593cc1d 8bc8            mov     ecx,eax
fffff803`4593cc1f f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`4593cc21 f0830c2400      lock or dword ptr [rsp],0
fffff803`4593cc26 33c0            xor     eax,eax
fffff803`4593cc28 eb05            jmp     pci!PciMsiXInterface_UnmaskTableEntry+0x7f (fffff803`4593cc2f)  Branch

pci!PciMsiXInterface_UnmaskTableEntry+0x7a:
fffff803`4593cc2a b80d0000c0      mov     eax,0C000000Dh

pci!PciMsiXInterface_UnmaskTableEntry+0x7f:
fffff803`4593cc2f 488b4c2410      mov     rcx,qword ptr [rsp+10h]
fffff803`4593cc34 4833cc          xor     rcx,rsp
fffff803`4593cc37 e8e4e6feff      call    pci!_security_check_cookie (fffff803`4592b320)
fffff803`4593cc3c 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff803`4593cc41 4883c420        add     rsp,20h
fffff803`4593cc45 5f              pop     rdi
fffff803`4593cc46 c3              ret
