;_IRQL_requires_max_(HIGH_LEVEL)
;NTSTATUS PciUpdateHardware(
;    __inout PPCI_DEVICE Device,
;    __in_opt PVOID ReconnectDevice)
    
127: kd> uf pci!PciUpdateHardware
pci!PciUpdateHardware:
fffff801`80395550 48895c2408      mov     qword ptr [rsp+8],rbx
fffff801`80395555 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff801`8039555a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff801`8039555f 57              push    rdi
fffff801`80395560 4883ec40        sub     rsp,40h
fffff801`80395564 488bf2          mov     rsi,rdx
fffff801`80395567 488bd9          mov     rbx,rcx
fffff801`8039556a e861020000      call    pci!PciDisconnectDevice (fffff801`803957d0)
fffff801`8039556f 488b8350050000  mov     rax,qword ptr [rbx+550h] ;rax = Device->Operations
;if PCI Device(Type0), rax is pci!PciType0HeaderOperations structure pointer.
;if PCI Bridge(Type1), rax is pci!PciType1HeaderOperations structure pointer
fffff801`80395576 488d93a0000000  lea     rdx,[rbx+0A0h]    ;rdx = Device->Resources
fffff801`8039557d 488bcb          mov     rcx,rbx           ;PPCI_DEVICE Device
fffff801`80395580 488b4010        mov     rax,qword ptr [rax+10h]   ;rax = Device->Operations->SetResources()
;if PCI Device(Type0), rax == pci!PciType0_SetResources();
;if PCI Bridge(Type1), rax == pci!PciType1_SetResources();
fffff801`80395584 ff15eee10200    call    qword ptr [pci!_guard_dispatch_icall_fptr (fffff801`803c3778)]
fffff801`8039558a 33ed            xor     ebp,ebp
fffff801`8039558c 8bf8            mov     edi,eax
fffff801`8039558e 85c0            test    eax,eax
fffff801`80395590 0f88f2970000    js      pci!PciUpdateHardware+0x9838 (fffff801`8039ed88)  Branch

pci!PciUpdateHardware+0x46:
fffff801`80395596 488d93f8030000  lea     rdx,[rbx+3F8h]
fffff801`8039559d 488bcb          mov     rcx,rbx
fffff801`803955a0 e8fbf2ffff      call    pci!PciRestoreDeviceRegisters (fffff801`803948a0)
fffff801`803955a5 8bf8            mov     edi,eax
fffff801`803955a7 85c0            test    eax,eax
fffff801`803955a9 7824            js      pci!PciUpdateHardware+0x7f (fffff801`803955cf)  Branch

pci!PciUpdateHardware+0x5b:
fffff801`803955ab 8a432c          mov     al,byte ptr [rbx+2Ch]
fffff801`803955ae fec8            dec     al
fffff801`803955b0 3c01            cmp     al,1
fffff801`803955b2 764a            jbe     pci!PciUpdateHardware+0xae (fffff801`803955fe)  Branch

pci!PciUpdateHardware+0x64:
fffff801`803955b4 488bcb          mov     rcx,rbx
fffff801`803955b7 4084f6          test    sil,sil
fffff801`803955ba 755d            jne     pci!PciUpdateHardware+0xc9 (fffff801`80395619)  Branch

pci!PciUpdateHardware+0x6c:
fffff801`803955bc e86f000000      call    pci!PciConnectDevice (fffff801`80395630)

pci!PciUpdateHardware+0x71:
fffff801`803955c1 488b9b88000000  mov     rbx,qword ptr [rbx+88h]
fffff801`803955c8 4885db          test    rbx,rbx
fffff801`803955cb 7517            jne     pci!PciUpdateHardware+0x94 (fffff801`803955e4)  Branch

pci!PciUpdateHardware+0x7d:
fffff801`803955cd 8bc7            mov     eax,edi

pci!PciUpdateHardware+0x7f:
fffff801`803955cf 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff801`803955d4 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff801`803955d9 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff801`803955de 4883c440        add     rsp,40h
fffff801`803955e2 5f              pop     rdi
fffff801`803955e3 c3              ret

pci!PciUpdateHardware+0x94:
fffff801`803955e4 0fb78304060000  movzx   eax,word ptr [rbx+604h]
fffff801`803955eb 6685c0          test    ax,ax
fffff801`803955ee 74dd            je      pci!PciUpdateHardware+0x7d (fffff801`803955cd)  Branch

pci!PciUpdateHardware+0xa0:
fffff801`803955f0 4038ab06060000  cmp     byte ptr [rbx+606h],bpl
fffff801`803955f7 74d4            je      pci!PciUpdateHardware+0x7d (fffff801`803955cd)  Branch

pci!PciUpdateHardware+0xa9:
fffff801`803955f9 e9e4970000      jmp     pci!PciUpdateHardware+0x9892 (fffff801`8039ede2)  Branch

pci!PciUpdateHardware+0xae:
fffff801`803955fe 488b8348050000  mov     rax,qword ptr [rbx+548h]
fffff801`80395605 48b90000000004000000 mov rcx,400000000h
fffff801`8039560f 4885c1          test    rcx,rax
fffff801`80395612 74a0            je      pci!PciUpdateHardware+0x64 (fffff801`803955b4)  Branch

pci!PciUpdateHardware+0xc4:
fffff801`80395614 e9bb970000      jmp     pci!PciUpdateHardware+0x9884 (fffff801`8039edd4)  Branch

pci!PciUpdateHardware+0xc9:
fffff801`80395619 e84a150100      call    pci!PciReconnectDevice (fffff801`803a6b68)
fffff801`8039561e eba1            jmp     pci!PciUpdateHardware+0x71 (fffff801`803955c1)  Branch

pci!PciUpdateHardware+0x9838:
fffff801`8039ed88 448b431c        mov     r8d,dword ptr [rbx+1Ch]
fffff801`8039ed8c 41b90a000000    mov     r9d,0Ah
fffff801`8039ed92 488b4b50        mov     rcx,qword ptr [rbx+50h]
fffff801`8039ed96 418bd0          mov     edx,r8d
fffff801`8039ed99 89442438        mov     dword ptr [rsp+38h],eax
fffff801`8039ed9d 4183e01f        and     r8d,1Fh
fffff801`8039eda1 c1ea05          shr     edx,5
fffff801`8039eda4 488d05354d0100  lea     rax,[pci!WPP_1ab26348d7bb3827b155b649d4023739_Traceguids (fffff801`803b3ae0)]
fffff801`8039edab 83e207          and     edx,7
fffff801`8039edae 488b8928030000  mov     rcx,qword ptr [rcx+328h]
fffff801`8039edb5 89542430        mov     dword ptr [rsp+30h],edx
fffff801`8039edb9 b202            mov     dl,2
fffff801`8039edbb 4489442428      mov     dword ptr [rsp+28h],r8d
fffff801`8039edc0 458d41fc        lea     r8d,[r9-4]
fffff801`8039edc4 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`8039edc9 e8963dffff      call    pci!WPP_RECORDER_SF_DDd (fffff801`80392b64)
fffff801`8039edce 90              nop
fffff801`8039edcf e9e067ffff      jmp     pci!PciUpdateHardware+0x64 (fffff801`803955b4)  Branch

pci!PciUpdateHardware+0x9884:
fffff801`8039edd4 488bcb          mov     rcx,rbx
fffff801`8039edd7 e8507e0000      call    pci!PciResetBridge (fffff801`803a6c2c)
fffff801`8039eddc 90              nop
fffff801`8039eddd e9d267ffff      jmp     pci!PciUpdateHardware+0x64 (fffff801`803955b4)  Branch

pci!PciUpdateHardware+0x9892:
fffff801`8039ede2 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff801`8039ede6 488d9310060000  lea     rdx,[rbx+610h]
fffff801`8039eded 440fb7c0        movzx   r8d,ax
fffff801`8039edf1 41b904000000    mov     r9d,4
fffff801`8039edf7 4183c008        add     r8d,8
fffff801`8039edfb e8c054ffff      call    pci!PciWriteDeviceConfig (fffff801`803942c0)
fffff801`8039ee00 8b830c060000    mov     eax,dword ptr [rbx+60Ch]
fffff801`8039ee06 448bc8          mov     r9d,eax
fffff801`8039ee09 41c1e910        shr     r9d,10h
fffff801`8039ee0d 4181e1ff070000  and     r9d,7FFh
fffff801`8039ee14 c1e809          shr     eax,9
fffff801`8039ee17 41ffc1          inc     r9d
fffff801`8039ee1a 83e003          and     eax,3
fffff801`8039ee1d 83e801          sub     eax,1
fffff801`8039ee20 741a            je      pci!PciUpdateHardware+0x98ec (fffff801`8039ee3c)  Branch

pci!PciUpdateHardware+0x98d2:
fffff801`8039ee22 83f801          cmp     eax,1
fffff801`8039ee25 0f85a267ffff    jne     pci!PciUpdateHardware+0x7d (fffff801`803955cd)  Branch

pci!PciUpdateHardware+0x98db:
fffff801`8039ee2b 418bd1          mov     edx,r9d
fffff801`8039ee2e 488bcb          mov     rcx,rbx
fffff801`8039ee31 e89e0b0100      call    pci!ExpressRestoreTphMsiXStEntries (fffff801`803af9d4)
fffff801`8039ee36 90              nop
fffff801`8039ee37 e99167ffff      jmp     pci!PciUpdateHardware+0x7d (fffff801`803955cd)  Branch

pci!PciUpdateHardware+0x98ec:
fffff801`8039ee3c 488b9318060000  mov     rdx,qword ptr [rbx+618h]
fffff801`8039ee43 b840000000      mov     eax,40h
fffff801`8039ee48 443bc8          cmp     r9d,eax
fffff801`8039ee4b 440f47c8        cmova   r9d,eax
fffff801`8039ee4f 4885d2          test    rdx,rdx
fffff801`8039ee52 0f847567ffff    je      pci!PciUpdateHardware+0x7d (fffff801`803955cd)  Branch

pci!PciUpdateHardware+0x9908:
fffff801`8039ee58 440fb78304060000 movzx   r8d,word ptr [rbx+604h]
fffff801`8039ee60 4503c9          add     r9d,r9d
fffff801`8039ee63 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff801`8039ee67 4183c00c        add     r8d,0Ch
fffff801`8039ee6b e85054ffff      call    pci!PciWriteDeviceConfig (fffff801`803942c0)
fffff801`8039ee70 90              nop
fffff801`8039ee71 e95767ffff      jmp     pci!PciUpdateHardware+0x7d (fffff801`803955cd)  Branch
