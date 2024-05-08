;NTSTATUS PCI_MSIX_MASKUNMASK_ENTRY (
;    _In_ PVOID Context,
;    _In_ ULONG TableEntry);

6: kd> uf PciMsiXInterface_MaskTableEntry
pci!PciMsiXInterface_MaskTableEntry:
fffff803`4593cb10 4889742418      mov     qword ptr [rsp+18h],rsi
fffff803`4593cb15 57              push    rdi
fffff803`4593cb16 4883ec20        sub     rsp,20h
fffff803`4593cb1a 488b050ff70000  mov     rax,qword ptr [pci!_security_cookie (fffff803`4594c230)]
fffff803`4593cb21 4833c4          xor     rax,rsp
fffff803`4593cb24 4889442410      mov     qword ptr [rsp+10h],rax
fffff803`4593cb29 813950636944    cmp     dword ptr [rcx],44696350h
fffff803`4593cb2f 488bf9          mov     rdi,rcx
fffff803`4593cb32 7556            jne     pci!PciMsiXInterface_MaskTableEntry+0x7a (fffff803`4593cb8a)  Branch

pci!PciMsiXInterface_MaskTableEntry+0x24:
fffff803`4593cb34 83b94803000003  cmp     dword ptr [rcx+348h],3
fffff803`4593cb3b 754d            jne     pci!PciMsiXInterface_MaskTableEntry+0x7a (fffff803`4593cb8a)  Branch

pci!PciMsiXInterface_MaskTableEntry+0x2d:
fffff803`4593cb3d 3b91d4030000    cmp     edx,dword ptr [rcx+3D4h]
fffff803`4593cb43 7345            jae     pci!PciMsiXInterface_MaskTableEntry+0x7a (fffff803`4593cb8a)  Branch

pci!PciMsiXInterface_MaskTableEntry+0x35:
fffff803`4593cb45 488b8768030000  mov     rax,qword ptr [rdi+368h]
fffff803`4593cb4c 8bca            mov     ecx,edx
fffff803`4593cb4e 0fba2c881f      bts     dword ptr [rax+rcx*4],1Fh
fffff803`4593cb53 488b9758030000  mov     rdx,qword ptr [rdi+358h]
fffff803`4593cb5a 48c1e104        shl     rcx,4
fffff803`4593cb5e 488d3c24        lea     rdi,[rsp]
fffff803`4593cb62 4803d1          add     rdx,rcx
fffff803`4593cb65 b804000000      mov     eax,4
fffff803`4593cb6a 488bf2          mov     rsi,rdx
fffff803`4593cb6d 8bc8            mov     ecx,eax
fffff803`4593cb6f f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`4593cb71 834c240c01      or      dword ptr [rsp+0Ch],1
fffff803`4593cb76 488d3424        lea     rsi,[rsp]
fffff803`4593cb7a 488bfa          mov     rdi,rdx
fffff803`4593cb7d 8bc8            mov     ecx,eax
fffff803`4593cb7f f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff803`4593cb81 f0830c2400      lock or dword ptr [rsp],0
fffff803`4593cb86 33c0            xor     eax,eax
fffff803`4593cb88 eb05            jmp     pci!PciMsiXInterface_MaskTableEntry+0x7f (fffff803`4593cb8f)  Branch

pci!PciMsiXInterface_MaskTableEntry+0x7a:
fffff803`4593cb8a b80d0000c0      mov     eax,0C000000Dh

pci!PciMsiXInterface_MaskTableEntry+0x7f:
fffff803`4593cb8f 488b4c2410      mov     rcx,qword ptr [rsp+10h]
fffff803`4593cb94 4833cc          xor     rcx,rsp
fffff803`4593cb97 e884e7feff      call    pci!_security_check_cookie (fffff803`4592b320)
fffff803`4593cb9c 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff803`4593cba1 4883c420        add     rsp,20h
fffff803`4593cba5 5f              pop     rdi
fffff803`4593cba6 c3              ret
