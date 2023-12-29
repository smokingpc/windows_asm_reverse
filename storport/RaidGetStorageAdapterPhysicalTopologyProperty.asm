0: kd> uf RaidGetStorageAdapterPhysicalTopologyProperty
storport!RaidGetStorageAdapterPhysicalTopologyProperty:
fffff802`27e5f764 4c8bdc          mov     r11,rsp
fffff802`27e5f767 49895b08        mov     qword ptr [r11+8],rbx
fffff802`27e5f76b 49896b20        mov     qword ptr [r11+20h],rbp
fffff802`27e5f76f 56              push    rsi
fffff802`27e5f770 57              push    rdi
fffff802`27e5f771 4154            push    r12
fffff802`27e5f773 4156            push    r14
fffff802`27e5f775 4157            push    r15
fffff802`27e5f777 4883ec40        sub     rsp,40h
fffff802`27e5f77b 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]  ;rax = Irp->Tail.Overlay.CurrentIoStackLocation
fffff802`27e5f782 4d8be0          mov     r12,r8
fffff802`27e5f785 4983631800      and     qword ptr [r11+18h],0
fffff802`27e5f78a 488bda          mov     rbx,rdx
fffff802`27e5f78d 8364247800      and     dword ptr [rsp+78h],0
fffff802`27e5f792 4c8bf1          mov     r14,rcx
fffff802`27e5f795 49832000        and     qword ptr [r8],0
fffff802`27e5f799 83781008        cmp     dword ptr [rax+10h],8     ;if(CurrentIoStackLocation.Parameters.DeviceIoControl.InputBufferLength < 8) goto 0x202ea
fffff802`27e5f79d 488b7218        mov     rsi,qword ptr [rdx+18h]   ;rsi = Irp->AssociatedIrp
fffff802`27e5f7a1 8b6808          mov     ebp,dword ptr [rax+8]     ;ebp = Irp->Tail.Overlay.CurrentIoStackLocation.Parameters.DeviceIoControl.OutputBufferLength
fffff802`27e5f7a4 0f82a4020200    jb      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x202ea (fffff802`27e7fa4e)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x46:
fffff802`27e5f7aa b838000000      mov     eax,38h
fffff802`27e5f7af 3be8            cmp     ebp,eax   ;if(CurrentIoStackLocation.Parameters.DeviceIoControl.OutputBufferLength < 0x38) goto 0x202f4
fffff802`27e5f7b1 0f82a1020200    jb      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x202f4 (fffff802`27e7fa58)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x53:
fffff802`27e5f7b7 488b4908        mov     rcx,qword ptr [rcx+8]
fffff802`27e5f7bb 4d8d4b10        lea     r9,[r11+10h]
fffff802`27e5f7bf 4d8d4318        lea     r8,[r11+18h]
fffff802`27e5f7c3 e83c5affff      call    storport!RaBuildQueryPhysicalTopologyBufferForMiniport (fffff802`27e55204)
fffff802`27e5f7c8 4c8bbc2480000000 mov     r15,qword ptr [rsp+80h]
fffff802`27e5f7d0 8bf8            mov     edi,eax
fffff802`27e5f7d2 85c0            test    eax,eax
fffff802`27e5f7d4 7843            js      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xb5 (fffff802`27e5f819)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x72:
fffff802`27e5f7d6 448b4c2478      mov     r9d,dword ptr [rsp+78h]
fffff802`27e5f7db 4d8bc7          mov     r8,r15
fffff802`27e5f7de c744243040000000 mov     dword ptr [rsp+30h],40h
fffff802`27e5f7e6 488bd3          mov     rdx,rbx
fffff802`27e5f7e9 c644242800      mov     byte ptr [rsp+28h],0
fffff802`27e5f7ee 498bce          mov     rcx,r14
fffff802`27e5f7f1 488364242000    and     qword ptr [rsp+20h],0
fffff802`27e5f7f7 e8b4fbffff      call    storport!RaidAdapterSendSrbIoControlSynchronously (fffff802`27e5f3b0) ;呼叫進去miniport
fffff802`27e5f7fc b900000080      mov     ecx,80000000h
fffff802`27e5f801 8bf8            mov     edi,eax
fffff802`27e5f803 03c1            add     eax,ecx
fffff802`27e5f805 85c1            test    ecx,eax
fffff802`27e5f807 0f856d020200    jne     storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x20316 (fffff802`27e7fa7a)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xa9:
fffff802`27e5f80d 81ff05000080    cmp     edi,80000005h
fffff802`27e5f813 0f8461020200    je      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x20316 (fffff802`27e7fa7a)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xb5:
fffff802`27e5f819 4d85ff          test    r15,r15
fffff802`27e5f81c 7414            je      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xce (fffff802`27e5f832)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xba:
fffff802`27e5f81e ba52615372      mov     edx,72536152h
fffff802`27e5f823 498bcf          mov     rcx,r15
fffff802`27e5f826 48ff15fb490500  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff802`27eb4228)]
fffff802`27e5f82d 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xce:
fffff802`27e5f832 4c8d5c2440      lea     r11,[rsp+40h]
fffff802`27e5f837 8bc7            mov     eax,edi
fffff802`27e5f839 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff802`27e5f83d 498b6b48        mov     rbp,qword ptr [r11+48h]
fffff802`27e5f841 498be3          mov     rsp,r11
fffff802`27e5f844 415f            pop     r15
fffff802`27e5f846 415e            pop     r14
fffff802`27e5f848 415c            pop     r12
fffff802`27e5f84a 5f              pop     rdi
fffff802`27e5f84b 5e              pop     rsi
fffff802`27e5f84c c3              ret

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x202ea:
fffff802`27e7fa4e bfef0000c0      mov     edi,0C00000EFh
fffff802`27e7fa53 e9dafdfdff      jmp     storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xce (fffff802`27e5f832)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x202f4:
fffff802`27e7fa58 83fd08          cmp     ebp,8
fffff802`27e7fa5b 7213            jb      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x2030c (fffff802`27e7fa70)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x202f9:
fffff802`27e7fa5d 49c70008000000  mov     qword ptr [r8],8
fffff802`27e7fa64 33ff            xor     edi,edi
fffff802`27e7fa66 8906            mov     dword ptr [rsi],eax
fffff802`27e7fa68 894604          mov     dword ptr [rsi+4],eax
fffff802`27e7fa6b e9c2fdfdff      jmp     storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xce (fffff802`27e5f832)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x2030c:
fffff802`27e7fa70 bf230000c0      mov     edi,0C0000023h
fffff802`27e7fa75 e9b8fdfdff      jmp     storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xce (fffff802`27e5f832)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x20316:
fffff802`27e7fa7a 498d571c        lea     rdx,[r15+1Ch]
fffff802`27e7fa7e 4c8bc5          mov     r8,rbp
fffff802`27e7fa81 488bce          mov     rcx,rsi
fffff802`27e7fa84 e87742ffff      call    storport!memcpy (fffff802`27e73d00)
fffff802`27e7fa89 c70638000000    mov     dword ptr [rsi],38h
fffff802`27e7fa8f 49892c24        mov     qword ptr [r12],rbp
fffff802`27e7fa93 85ff            test    edi,edi
fffff802`27e7fa95 0f887efdfdff    js      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xb5 (fffff802`27e5f819)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x20337:
fffff802`27e7fa9b 4180be3c15000000 cmp     byte ptr [r14+153Ch],0   ;AdapterExt->TopologyInfoLogged
fffff802`27e7faa3 0f8570fdfdff    jne     storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xb5 (fffff802`27e5f819)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x20345:
fffff802`27e7faa9 396e04          cmp     dword ptr [rsi+4],ebp
fffff802`27e7faac 0f8767fdfdff    ja      storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xb5 (fffff802`27e5f819)  Branch

storport!RaidGetStorageAdapterPhysicalTopologyProperty+0x2034e:
fffff802`27e7fab2 448bc5          mov     r8d,ebp
fffff802`27e7fab5 41c6863c15000001 mov     byte ptr [r14+153Ch],1   ;;AdapterExt->TopologyInfoLogged
fffff802`27e7fabd 488bd6          mov     rdx,rsi
fffff802`27e7fac0 498bce          mov     rcx,r14
fffff802`27e7fac3 e85cb80100      call    storport!StorpLogPhysicalTopologyInfo (fffff802`27e9b324)
fffff802`27e7fac8 90              nop
fffff802`27e7fac9 e94bfdfdff      jmp     storport!RaidGetStorageAdapterPhysicalTopologyProperty+0xb5 (fffff802`27e5f819)  Branch
