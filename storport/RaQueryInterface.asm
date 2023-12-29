1: kd> uf RaQueryInterface      ;IRP_MJ_PNP + IRP_MN_QUERY_INTERFACE to query BusInterface callbacks from bus driver.
storport!RaQueryInterface:
fffff80b`7ca1c894 48895c2408      mov     qword ptr [rsp+8],rbx
fffff80b`7ca1c899 57              push    rdi
fffff80b`7ca1c89a 4883ec20        sub     rsp,20h
fffff80b`7ca1c89e 488bf9          mov     rdi,rcx       ;DEVICE_OBJECT of current miniport adapter
fffff80b`7ca1c8a1 33d2            xor     edx,edx
fffff80b`7ca1c8a3 8a494c          mov     cl,byte ptr [rcx+4Ch] ;cl = DEVICE_OBJECT::StackSize
fffff80b`7ca1c8a6 48ff1563aa0400  call    qword ptr [storport!_imp_IoAllocateIrp (fffff80b`7ca67310)]
fffff80b`7ca1c8ad 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c8b2 488bd8          mov     rbx,rax
fffff80b`7ca1c8b5 4885c0          test    rax,rax
fffff80b`7ca1c8b8 7464            je      storport!RaQueryInterface+0x8a (fffff80b`7ca1c91e)  Branch

storport!RaQueryInterface+0x26:
fffff80b`7ca1c8ba 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]  ;RCX = irp->Tail.CurrentStackLocation
fffff80b`7ca1c8c1 488bd3          mov     rdx,rbx                   ;rbx = rdx = irp
fffff80b`7ca1c8c4 c74030bb0000c0  mov     dword ptr [rax+30h],0C00000BBh    ;irp->IoStatus.Status = 0xC00000BB
fffff80b`7ca1c8cb 488d05f67f0300  lea     rax,[storport!GUID_BUS_INTERFACE_STANDARD (fffff80b`7ca548c8)]
fffff80b`7ca1c8d2 488361d800      and     qword ptr [rcx-28h],0
fffff80b`7ca1c8d7 488941c0        mov     qword ptr [rcx-40h],rax
fffff80b`7ca1c8db 488b442450      mov     rax,qword ptr [rsp+50h]
fffff80b`7ca1c8e0 488941d0        mov     qword ptr [rcx-30h],rax
fffff80b`7ca1c8e4 66c741b81b08    mov     word ptr [rcx-48h],81Bh
fffff80b`7ca1c8ea c741c840000100  mov     dword ptr [rcx-38h],10040h
fffff80b`7ca1c8f1 488bcf          mov     rcx,rdi
fffff80b`7ca1c8f4 e8873effff      call    storport!RaSendIrpSynchronous (fffff80b`7ca10780)
fffff80b`7ca1c8f9 8bf8            mov     edi,eax
fffff80b`7ca1c8fb 85c0            test    eax,eax
fffff80b`7ca1c8fd 7803            js      storport!RaQueryInterface+0x6e (fffff80b`7ca1c902)  Branch

storport!RaQueryInterface+0x6b:
fffff80b`7ca1c8ff 8b7b30          mov     edi,dword ptr [rbx+30h]

storport!RaQueryInterface+0x6e:
fffff80b`7ca1c902 488bcb          mov     rcx,rbx
fffff80b`7ca1c905 48ff15dca90400  call    qword ptr [storport!_imp_IoFreeIrp (fffff80b`7ca672e8)]
fffff80b`7ca1c90c 0f1f440000      nop     dword ptr [rax+rax]
fffff80b`7ca1c911 8bc7            mov     eax,edi

storport!RaQueryInterface+0x7f:
fffff80b`7ca1c913 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff80b`7ca1c918 4883c420        add     rsp,20h
fffff80b`7ca1c91c 5f              pop     rdi
fffff80b`7ca1c91d c3              ret

storport!RaQueryInterface+0x8a:
fffff80b`7ca1c91e b89a0000c0      mov     eax,0C000009Ah
fffff80b`7ca1c923 ebee            jmp     storport!RaQueryInterface+0x7f (fffff80b`7ca1c913)  Branch
