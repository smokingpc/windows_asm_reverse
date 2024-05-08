6: kd> uf PciMsiXInterface_Constructor
pci!PciMsiXInterface_Constructor:
fffff803`4596bfd0 ba38000000      mov     edx,38h
fffff803`4596bfd5 66443bca        cmp     r9w,dx        ;r9w 決定了constructed MSIX Interface 結構要吐回去多長的資料
fffff803`4596bfd9 0f8225830000    jb      pci!PciMsiXInterface_Constructor+0x8334 (fffff803`45974304)  Branch

pci!PciMsiXInterface_Constructor+0xf:
fffff803`4596bfdf 488b442428      mov     rax,qword ptr [rsp+28h]   ;rax == PCI_MSIX_TABLE_CONFIG_INTERFACE ptr
fffff803`4596bfe4 448d42c9        lea     r8d,[rdx-37h]             ;r8d = 0x38-0x37 = 1
fffff803`4596bfe8 48894808        mov     qword ptr [rax+8],rcx     ;PCI_MSIX_TABLE_CONFIG_INTERFACE::Context = PDOEXT
fffff803`4596bfec 488d0dad54fbff  lea     rcx,[pci!PciDevice_QueryPower (fffff803`459214a0)]    ;PciDevice_QueryPower == WdfDeviceInterfaceReferenceNoOp
fffff803`4596bff3 48894810        mov     qword ptr [rax+10h],rcx   ;InterfaceReference = WdfDeviceInterfaceReferenceNoOp
fffff803`4596bff7 48894818        mov     qword ptr [rax+18h],rcx   ;InterfaceDereference = WdfDeviceInterfaceReferenceNoOp
fffff803`4596bffb 488d0dbedafbff  lea     rcx,[pci!PciMsiXInterface_SetTableEntry (fffff803`45929ac0)]
fffff803`4596c002 48894820        mov     qword ptr [rax+20h],rcx
fffff803`4596c006 488d0d030bfdff  lea     rcx,[pci!PciMsiXInterface_MaskTableEntry (fffff803`4593cb10)]
fffff803`4596c00d 6644894002      mov     word ptr [rax+2],r8w      ;Version = 1
fffff803`4596c012 448d4208        lea     r8d,[rdx+8]               ;RDX == 0x38
fffff803`4596c016 48894828        mov     qword ptr [rax+28h],rcx
fffff803`4596c01a 488d0d8f0bfdff  lea     rcx,[pci!PciMsiXInterface_UnmaskTableEntry (fffff803`4593cbb0)]
fffff803`4596c021 48894830        mov     qword ptr [rax+30h],rcx
fffff803`4596c025 66453bc8        cmp     r9w,r8w
fffff803`4596c029 720f            jb      pci!PciMsiXInterface_Constructor+0x6a (fffff803`4596c03a)  Branch

pci!PciMsiXInterface_Constructor+0x5b:
fffff803`4596c02b 488d0d5e0afdff  lea     rcx,[pci!PciMsiXInterface_GetTableEntry (fffff803`4593ca90)]
fffff803`4596c032 410fb7d0        movzx   edx,r8w
fffff803`4596c036 48894838        mov     qword ptr [rax+38h],rcx

pci!PciMsiXInterface_Constructor+0x6a:
fffff803`4596c03a 41b848000000    mov     r8d,48h
fffff803`4596c040 66453bc8        cmp     r9w,r8w
fffff803`4596c044 720f            jb      pci!PciMsiXInterface_Constructor+0x85 (fffff803`4596c055)  Branch

pci!PciMsiXInterface_Constructor+0x76:
fffff803`4596c046 488d0d930afdff  lea     rcx,[pci!PciMsiXInterface_GetTableSize (fffff803`4593cae0)]
fffff803`4596c04d 410fb7d0        movzx   edx,r8w
fffff803`4596c051 48894840        mov     qword ptr [rax+40h],rcx

pci!PciMsiXInterface_Constructor+0x85:
fffff803`4596c055 668910          mov     word ptr [rax],dx
fffff803`4596c058 33c0            xor     eax,eax
fffff803`4596c05a c3              ret

pci!PciMsiXInterface_Constructor+0x8334:
fffff803`45974304 b80d0000c0      mov     eax,0C000000Dh
fffff803`45974309 c3              ret
