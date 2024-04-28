4: kd> uf PciDevice_QueryResourceRequirements
pci!PciDevice_QueryResourceRequirements:
fffff808`d8500010 48895c2408      mov     qword ptr [rsp+8],rbx
fffff808`d8500015 57              push    rdi
fffff808`d8500016 4883ec20        sub     rsp,20h
fffff808`d850001a 488bf9          mov     rdi,rcx
fffff808`d850001d 498bd8          mov     rbx,r8
fffff808`d8500020 b9ffff0000      mov     ecx,0FFFFh
fffff808`d8500025 48ff15e432ffff  call    qword ptr [pci!_imp_KeQueryActiveProcessorCountEx (fffff808`d84f3310)]
fffff808`d850002c 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d8500031 488d542440      lea     rdx,[rsp+40h]     ;ret buffer address
fffff808`d8500036 488bcb          mov     rcx,rbx           ;PDO's DevExt
fffff808`d8500039 898304040000    mov     dword ptr [rbx+404h],eax
fffff808`d850003f e8fcf5ffff      call    pci!PciBuildRequirementsList (fffff808`d84ff640)
fffff808`d8500044 85c0            test    eax,eax
fffff808`d8500046 7809            js      pci!PciDevice_QueryResourceRequirements+0x41 (fffff808`d8500051)  Branch

pci!PciDevice_QueryResourceRequirements+0x38:
fffff808`d8500048 488b542440      mov     rdx,qword ptr [rsp+40h]
fffff808`d850004d 48895738        mov     qword ptr [rdi+38h],rdx

pci!PciDevice_QueryResourceRequirements+0x41:
fffff808`d8500051 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff808`d8500056 4883c420        add     rsp,20h
fffff808`d850005a 5f              pop     rdi
fffff808`d850005b c3              ret
