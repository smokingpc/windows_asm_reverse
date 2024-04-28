;PciDevice_QueryResources(PIRP irp, PIO_STACK_LOCATION location, PDO_DevExt)

4: kd> uf PciDevice_QueryResources
pci!PciDevice_QueryResources:
fffff808`d8500af0 4053            push    rbx
fffff808`d8500af2 4883ec20        sub     rsp,20h
fffff808`d8500af6 488bd9          mov     rbx,rcx       ;IRP
fffff808`d8500af9 488d542440      lea     rdx,[rsp+40h] ;ret buffer?
fffff808`d8500afe 498bc8          mov     rcx,r8        ;PDO's DevExt
fffff808`d8500b01 e86af5ffff      call    pci!PciBuildCurrentResourceList (fffff808`d8500070)
fffff808`d8500b06 85c0            test    eax,eax
fffff808`d8500b08 780e            js      pci!PciDevice_QueryResources+0x28 (fffff808`d8500b18)  Branch

pci!PciDevice_QueryResources+0x1a:
fffff808`d8500b0a 488b542440      mov     rdx,qword ptr [rsp+40h]
fffff808`d8500b0f 4885d2          test    rdx,rdx
fffff808`d8500b12 740a            je      pci!PciDevice_QueryResources+0x2e (fffff808`d8500b1e)  Branch

pci!PciDevice_QueryResources+0x24:
fffff808`d8500b14 48895338        mov     qword ptr [rbx+38h],rdx

pci!PciDevice_QueryResources+0x28:
fffff808`d8500b18 4883c420        add     rsp,20h
fffff808`d8500b1c 5b              pop     rbx
fffff808`d8500b1d c3              ret

pci!PciDevice_QueryResources+0x2e:
fffff808`d8500b1e b8bb0000c0      mov     eax,0C00000BBh
fffff808`d8500b23 ebf3            jmp     pci!PciDevice_QueryResources+0x28 (fffff808`d8500b18)  Branch
