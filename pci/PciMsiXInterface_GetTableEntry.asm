;NTSTATUS PCI_MSIX_GET_ENTRY (
;    _In_ PVOID Context,
;    _In_ ULONG TableEntry,
;    _Out_ PULONG MessageNumber,
;    _Out_ PBOOLEAN Masked);
;


6: kd> uf PciMsiXInterface_GetTableEntry
pci!PciMsiXInterface_GetTableEntry:
fffff803`4593ca90 813950636944    cmp     dword ptr [rcx],44696350h ;check if devext is PDOEXT
fffff803`4593ca96 752f            jne     pci!PciMsiXInterface_GetTableEntry+0x37 (fffff803`4593cac7)  Branch

pci!PciMsiXInterface_GetTableEntry+0x8:
fffff803`4593ca98 83b94803000003  cmp     dword ptr [rcx+348h],3
fffff803`4593ca9f 7526            jne     pci!PciMsiXInterface_GetTableEntry+0x37 (fffff803`4593cac7)  Branch

pci!PciMsiXInterface_GetTableEntry+0x11:
fffff803`4593caa1 3b91d4030000    cmp     edx,dword ptr [rcx+3D4h]  ;if idx >= (count of MSIX Table Entries), return error
fffff803`4593caa7 731e            jae     pci!PciMsiXInterface_GetTableEntry+0x37 (fffff803`4593cac7)  Branch

pci!PciMsiXInterface_GetTableEntry+0x19:
fffff803`4593caa9 488b8168030000  mov     rax,qword ptr [rcx+368h]  ;ptr of MSIX Table?
fffff803`4593cab0 8bd2            mov     edx,edx
fffff803`4593cab2 8b0c90          mov     ecx,dword ptr [rax+rdx*4] ;
fffff803`4593cab5 8bc1            mov     eax,ecx
fffff803`4593cab7 0fbaf01f        btr     eax,1Fh
fffff803`4593cabb c1e91f          shr     ecx,1Fh
fffff803`4593cabe 418900          mov     dword ptr [r8],eax
fffff803`4593cac1 33c0            xor     eax,eax
fffff803`4593cac3 418809          mov     byte ptr [r9],cl
fffff803`4593cac6 c3              ret

pci!PciMsiXInterface_GetTableEntry+0x37:
fffff803`4593cac7 b80d0000c0      mov     eax,0C000000Dh
fffff803`4593cacc c3              ret
