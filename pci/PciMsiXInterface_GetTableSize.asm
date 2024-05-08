;NTSTATUS PCI_MSIX_GET_TABLE_SIZE (
;    _In_ PVOID Context,
;    _Out_ PULONG TableSize);

6: kd> uf pci!PciMsiXInterface_GetTableSize
pci!PciMsiXInterface_GetTableSize:
fffff803`4593cae0 813950636944    cmp     dword ptr [rcx],44696350h ;check if devext is PDOEXT
fffff803`4593cae6 7514            jne     pci!PciMsiXInterface_GetTableSize+0x1c (fffff803`4593cafc)  Branch

pci!PciMsiXInterface_GetTableSize+0x8:
fffff803`4593cae8 83b94803000003  cmp     dword ptr [rcx+348h],3
fffff803`4593caef 750b            jne     pci!PciMsiXInterface_GetTableSize+0x1c (fffff803`4593cafc)  Branch

pci!PciMsiXInterface_GetTableSize+0x11:
fffff803`4593caf1 8b81d4030000    mov     eax,dword ptr [rcx+3D4h]      ;count of MSIX Table Entries
fffff803`4593caf7 8902            mov     dword ptr [rdx],eax
fffff803`4593caf9 33c0            xor     eax,eax
fffff803`4593cafb c3              ret

pci!PciMsiXInterface_GetTableSize+0x1c:
fffff803`4593cafc b80d0000c0      mov     eax,0C000000Dh
fffff803`4593cb01 c3              ret
