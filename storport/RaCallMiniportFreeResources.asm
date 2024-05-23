3: kd> uf storport!RaCallMiniportFreeResources
storport!RaCallMiniportFreeResources:
fffff806`0d96d89c 4883ec28        sub     rsp,28h
fffff806`0d96d8a0 4885c9          test    rcx,rcx
fffff806`0d96d8a3 7437            je      storport!RaCallMiniportFreeResources+0x40 (fffff806`0d96d8dc)  Branch

storport!RaCallMiniportFreeResources+0x9:
fffff806`0d96d8a5 488b91e8000000  mov     rdx,qword ptr [rcx+0E8h]
fffff806`0d96d8ac 4885d2          test    rdx,rdx         ;if(NULL == AdapterExt->Miniport->HwInitializeData) return;
fffff806`0d96d8af 742b            je      storport!RaCallMiniportFreeResources+0x40 (fffff806`0d96d8dc)  Branch

storport!RaCallMiniportFreeResources+0x15:
fffff806`0d96d8b1 4c8b81f0000000  mov     r8,qword ptr [rcx+0F0h]
fffff806`0d96d8b8 4d85c0          test    r8,r8         ;if(NULL == AdapterExt->Miniport->PrivateDeviceExt) return;
fffff806`0d96d8bb 741f            je      storport!RaCallMiniportFreeResources+0x40 (fffff806`0d96d8dc)  Branch

storport!RaCallMiniportFreeResources+0x21:
fffff806`0d96d8bd f681f800000004  test    byte ptr [rcx+0F8h],4 ;if (FALSE==AdapterExt->Miniport.Flags.IsVirtual) return;
fffff806`0d96d8c4 7416            je      storport!RaCallMiniportFreeResources+0x40 (fffff806`0d96d8dc)  Branch

storport!RaCallMiniportFreeResources+0x2a:
fffff806`0d96d8c6 488b8288000000  mov     rax,qword ptr [rdx+88h]
fffff806`0d96d8cd 4885c0          test    rax,rax   ;if (NULL == HW_INITIALIZATION_DATA::HwFreeAdapterResources) return;
fffff806`0d96d8d0 740a            je      storport!RaCallMiniportFreeResources+0x40 (fffff806`0d96d8dc)  Branch

storport!RaCallMiniportFreeResources+0x36:
fffff806`0d96d8d2 498d4810        lea     rcx,[r8+10h]         ;call to HwFreeAdapterResources();
fffff806`0d96d8d6 ff154c9f0200    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff806`0d997828)]

storport!RaCallMiniportFreeResources+0x40:
fffff806`0d96d8dc 4883c428        add     rsp,28h
fffff806`0d96d8e0 c3              ret
