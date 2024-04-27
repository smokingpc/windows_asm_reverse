;看起來是在修改 MSI與MSIX PCI Cap
5: kd> uf pci!PciProgramInterruptResource
pci!PciProgramInterruptResource:
fffff808`d84c4ad0 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff808`d84c4ad5 57              push    rdi
fffff808`d84c4ad6 4883ec60        sub     rsp,60h
fffff808`d84c4ada 80792d00        cmp     byte ptr [rcx+2Dh],0
fffff808`d84c4ade 488bd9          mov     rbx,rcx
fffff808`d84c4ae1 0f8480000000    je      pci!PciProgramInterruptResource+0x97 (fffff808`d84c4b67)  Branch

pci!PciProgramInterruptResource+0x17:
fffff808`d84c4ae7 488b4148        mov     rax,qword ptr [rcx+48h]
fffff808`d84c4aeb 4c8d4c2478      lea     r9,[rsp+78h]
fffff808`d84c4af0 448b431c        mov     r8d,dword ptr [rbx+1Ch]
fffff808`d84c4af4 8b5318          mov     edx,dword ptr [rbx+18h]
fffff808`d84c4af7 c744242802000000 mov     dword ptr [rsp+28h],2
fffff808`d84c4aff 488b4820        mov     rcx,qword ptr [rax+20h]
fffff808`d84c4b03 c744242004000000 mov     dword ptr [rsp+20h],4
fffff808`d84c4b0b 488b4120        mov     rax,qword ptr [rcx+20h]   ;rax = acpi!AcpiWrapperReadConfig
fffff808`d84c4b0f 488b4908        mov     rcx,qword ptr [rcx+8]     ;rcx = ACPI PDO
fffff808`d84c4b13 ff155fec0200    call    qword ptr [pci!_guard_dispatch_icall_fptr (fffff808`d84f3778)]
fffff808`d84c4b19 83f802          cmp     eax,2
fffff808`d84c4b1c 0f851e9c0000    jne     pci!PciProgramInterruptResource+0x9c70 (fffff808`d84ce740)  Branch

pci!PciProgramInterruptResource+0x52:
fffff808`d84c4b22 448b431c        mov     r8d,dword ptr [rbx+1Ch]
fffff808`d84c4b26 4c8d4c2478      lea     r9,[rsp+78h]
fffff808`d84c4b2b 8b5318          mov     edx,dword ptr [rbx+18h]
fffff808`d84c4b2e b800040000      mov     eax,400h
fffff808`d84c4b33 6609442478      or      word ptr [rsp+78h],ax
fffff808`d84c4b38 488b4348        mov     rax,qword ptr [rbx+48h]
fffff808`d84c4b3c c744242802000000 mov     dword ptr [rsp+28h],2
fffff808`d84c4b44 c744242004000000 mov     dword ptr [rsp+20h],4
fffff808`d84c4b4c 488b4820        mov     rcx,qword ptr [rax+20h]
fffff808`d84c4b50 488b4128        mov     rax,qword ptr [rcx+28h]   ;rax = ACPI!AcpiWrapperWriteConfig
fffff808`d84c4b54 488b4908        mov     rcx,qword ptr [rcx+8]     ;rcx = ACPI PDO
fffff808`d84c4b58 ff151aec0200    call    qword ptr [pci!_guard_dispatch_icall_fptr (fffff808`d84f3778)]
fffff808`d84c4b5e 83f802          cmp     eax,2
fffff808`d84c4b61 0f85019c0000    jne     pci!PciProgramInterruptResource+0x9c98 (fffff808`d84ce768)  Branch

pci!PciProgramInterruptResource+0x97:
fffff808`d84c4b67 807b3500        cmp     byte ptr [rbx+35h],0
fffff808`d84c4b6b 0f8530010000    jne     pci!PciProgramInterruptResource+0x1d1 (fffff808`d84c4ca1)  Branch

pci!PciProgramInterruptResource+0xa1:
fffff808`d84c4b71 0fb64334        movzx   eax,byte ptr [rbx+34h]
fffff808`d84c4b75 84c0            test    al,al
fffff808`d84c4b77 7441            je      pci!PciProgramInterruptResource+0xea (fffff808`d84c4bba)  Branch

pci!PciProgramInterruptResource+0xa9:
fffff808`d84c4b79 440fb6c0        movzx   r8d,al
fffff808`d84c4b7d 488d542442      lea     rdx,[rsp+42h]
fffff808`d84c4b82 4183c002        add     r8d,2
fffff808`d84c4b86 41b902000000    mov     r9d,2
fffff808`d84c4b8c 488bcb          mov     rcx,rbx
fffff808`d84c4b8f e87cfaffff      call    pci!PciReadDeviceConfig (fffff808`d84c4610)
fffff808`d84c4b94 440fb64334      movzx   r8d,byte ptr [rbx+34h]
fffff808`d84c4b99 488d542442      lea     rdx,[rsp+42h]
fffff808`d84c4b9e b8feff0000      mov     eax,0FFFEh
fffff808`d84c4ba3 4183c002        add     r8d,2
fffff808`d84c4ba7 6621442442      and     word ptr [rsp+42h],ax
fffff808`d84c4bac 41b902000000    mov     r9d,2
fffff808`d84c4bb2 488bcb          mov     rcx,rbx
fffff808`d84c4bb5 e806f7ffff      call    pci!PciWriteDeviceConfig (fffff808`d84c42c0)

pci!PciProgramInterruptResource+0xea:
fffff808`d84c4bba 8b8b48030000    mov     ecx,dword ptr [rbx+348h]
fffff808`d84c4bc0 83f902          cmp     ecx,2
fffff808`d84c4bc3 7529            jne     pci!PciProgramInterruptResource+0x11e (fffff808`d84c4bee)  Branch

pci!PciProgramInterruptResource+0xf5:
fffff808`d84c4bc5 488d9348030000  lea     rdx,[rbx+348h]
fffff808`d84c4bcc 488bcb          mov     rcx,rbx
fffff808`d84c4bcf e8b0f1ffff      call    pci!PciProgramMsiInterrupt (fffff808`d84c3d84)
fffff808`d84c4bd4 8bf8            mov     edi,eax

pci!PciProgramInterruptResource+0x106:
fffff808`d84c4bd6 85ff            test    edi,edi
fffff808`d84c4bd8 0f88089c0000    js      pci!PciProgramInterruptResource+0x9d16 (fffff808`d84ce7e6)  Branch

pci!PciProgramInterruptResource+0x10e:
fffff808`d84c4bde 8bc7            mov     eax,edi
fffff808`d84c4be0 488b9c2488000000 mov     rbx,qword ptr [rsp+88h]
fffff808`d84c4be8 4883c460        add     rsp,60h
fffff808`d84c4bec 5f              pop     rdi
fffff808`d84c4bed c3              ret

pci!PciProgramInterruptResource+0x11e:
fffff808`d84c4bee 83e901          sub     ecx,1
fffff808`d84c4bf1 754a            jne     pci!PciProgramInterruptResource+0x16d (fffff808`d84c4c3d)  Branch

pci!PciProgramInterruptResource+0x123:
fffff808`d84c4bf3 41b902000000    mov     r9d,2
fffff808`d84c4bf9 488d542470      lea     rdx,[rsp+70h]
fffff808`d84c4bfe 488bcb          mov     rcx,rbx
fffff808`d84c4c01 458d4102        lea     r8d,[r9+2]
fffff808`d84c4c05 e806faffff      call    pci!PciReadDeviceConfig (fffff808`d84c4610)
fffff808`d84c4c0a 41b902000000    mov     r9d,2
fffff808`d84c4c10 488d542470      lea     rdx,[rsp+70h]
fffff808`d84c4c15 b8fffb0000      mov     eax,0FBFFh
fffff808`d84c4c1a 488bcb          mov     rcx,rbx
fffff808`d84c4c1d 6621442470      and     word ptr [rsp+70h],ax
fffff808`d84c4c22 458d4102        lea     r8d,[r9+2]
fffff808`d84c4c26 e895f6ffff      call    pci!PciWriteDeviceConfig (fffff808`d84c42c0)

pci!PciProgramInterruptResource+0x15b:
fffff808`d84c4c2b 488b9c2488000000 mov     rbx,qword ptr [rsp+88h]
fffff808`d84c4c33 33ff            xor     edi,edi
fffff808`d84c4c35 8bc7            mov     eax,edi
fffff808`d84c4c37 4883c460        add     rsp,60h
fffff808`d84c4c3b 5f              pop     rdi
fffff808`d84c4c3c c3              ret

pci!PciProgramInterruptResource+0x16d:
fffff808`d84c4c3d 83f902          cmp     ecx,2
fffff808`d84c4c40 756c            jne     pci!PciProgramInterruptResource+0x1de (fffff808`d84c4cae)  Branch

pci!PciProgramInterruptResource+0x172:
fffff808`d84c4c42 448bc9          mov     r9d,ecx
fffff808`d84c4c45 448d4102        lea     r8d,[rcx+2]
fffff808`d84c4c49 488bcb          mov     rcx,rbx
fffff808`d84c4c4c 488d942480000000 lea     rdx,[rsp+80h]
fffff808`d84c4c54 e8b7f9ffff      call    pci!PciReadDeviceConfig (fffff808`d84c4610)
fffff808`d84c4c59 0fb7842480000000 movzx   eax,word ptr [rsp+80h]
fffff808`d84c4c61 6683c802        or      ax,2
fffff808`d84c4c65 6689442470      mov     word ptr [rsp+70h],ax
fffff808`d84c4c6a 6639842480000000 cmp     word ptr [rsp+80h],ax
fffff808`d84c4c72 0f85319b0000    jne     pci!PciProgramInterruptResource+0x9cd9 (fffff808`d84ce7a9)  Branch

pci!PciProgramInterruptResource+0x1a8:
fffff808`d84c4c78 488d9348030000  lea     rdx,[rbx+348h]
fffff808`d84c4c7f 488bcb          mov     rcx,rbx
fffff808`d84c4c82 e84d4f0000      call    pci!PciProgramMsiXInterrupt (fffff808`d84c9bd4)
fffff808`d84c4c87 0fb74c2470      movzx   ecx,word ptr [rsp+70h]
fffff808`d84c4c8c 8bf8            mov     edi,eax
fffff808`d84c4c8e 66398c2480000000 cmp     word ptr [rsp+80h],cx
fffff808`d84c4c96 0f843affffff    je      pci!PciProgramInterruptResource+0x106 (fffff808`d84c4bd6)  Branch

pci!PciProgramInterruptResource+0x1cc:
fffff808`d84c4c9c e9259b0000      jmp     pci!PciProgramInterruptResource+0x9cf6 (fffff808`d84ce7c6)  Branch

pci!PciProgramInterruptResource+0x1d1:
fffff808`d84c4ca1 488bcb          mov     rcx,rbx
fffff808`d84c4ca4 e80f650000      call    pci!PciMaskMsiXInterrupt (fffff808`d84cb1b8)
fffff808`d84c4ca9 e9c3feffff      jmp     pci!PciProgramInterruptResource+0xa1 (fffff808`d84c4b71)  Branch

pci!PciProgramInterruptResource+0x1de:
fffff808`d84c4cae 807b2501        cmp     byte ptr [rbx+25h],1
fffff808`d84c4cb2 0f8573ffffff    jne     pci!PciProgramInterruptResource+0x15b (fffff808`d84c4c2b)  Branch

pci!PciProgramInterruptResource+0x1e8:
fffff808`d84c4cb8 e9cf9a0000      jmp     pci!PciProgramInterruptResource+0x9cbc (fffff808`d84ce78c)  Branch

pci!PciProgramInterruptResource+0x9c70:
fffff808`d84ce740 448b431c        mov     r8d,dword ptr [rbx+1Ch]
fffff808`d84ce744 b9c0000000      mov     ecx,0C0h
fffff808`d84ce749 8b5318          mov     edx,dword ptr [rbx+18h]
fffff808`d84ce74c 41b904000000    mov     r9d,4
fffff808`d84ce752 48c744242001000000 mov   qword ptr [rsp+20h],1
fffff808`d84ce75b 48ff15464b0200  call    qword ptr [pci!_imp_KeBugCheckEx (fffff808`d84f32a8)]
fffff808`d84ce762 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84ce767 cc              int     3

pci!PciProgramInterruptResource+0x9c98:
fffff808`d84ce768 448b431c        mov     r8d,dword ptr [rbx+1Ch]
fffff808`d84ce76c 33ff            xor     edi,edi
fffff808`d84ce76e 8b5318          mov     edx,dword ptr [rbx+18h]
fffff808`d84ce771 b9c0000000      mov     ecx,0C0h
fffff808`d84ce776 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff808`d84ce77b 448d4f04        lea     r9d,[rdi+4]
fffff808`d84ce77f 48ff15224b0200  call    qword ptr [pci!_imp_KeBugCheckEx (fffff808`d84f32a8)]
fffff808`d84ce786 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d84ce78b cc              int     3

pci!PciProgramInterruptResource+0x9cbc:
fffff808`d84ce78c 807b2601        cmp     byte ptr [rbx+26h],1
fffff808`d84ce790 0f859564ffff    jne     pci!PciProgramInterruptResource+0x15b (fffff808`d84c4c2b)  Branch

pci!PciProgramInterruptResource+0x9cc6:
fffff808`d84ce796 0fb64327        movzx   eax,byte ptr [rbx+27h]
fffff808`d84ce79a 2405            and     al,5
fffff808`d84ce79c 3c05            cmp     al,5
fffff808`d84ce79e 0f848764ffff    je      pci!PciProgramInterruptResource+0x15b (fffff808`d84c4c2b)  Branch

pci!PciProgramInterruptResource+0x9cd4:
fffff808`d84ce7a4 e94a64ffff      jmp     pci!PciProgramInterruptResource+0x123 (fffff808`d84c4bf3)  Branch

pci!PciProgramInterruptResource+0x9cd9:
fffff808`d84ce7a9 41b902000000    mov     r9d,2
fffff808`d84ce7af 488d542470      lea     rdx,[rsp+70h]
fffff808`d84ce7b4 488bcb          mov     rcx,rbx
fffff808`d84ce7b7 458d4102        lea     r8d,[r9+2]
fffff808`d84ce7bb e8005bffff      call    pci!PciWriteDeviceConfig (fffff808`d84c42c0)
fffff808`d84ce7c0 90              nop
fffff808`d84ce7c1 e9b264ffff      jmp     pci!PciProgramInterruptResource+0x1a8 (fffff808`d84c4c78)  Branch

pci!PciProgramInterruptResource+0x9cf6:
fffff808`d84ce7c6 41b902000000    mov     r9d,2
fffff808`d84ce7cc 488d942480000000 lea     rdx,[rsp+80h]
fffff808`d84ce7d4 488bcb          mov     rcx,rbx
fffff808`d84ce7d7 458d4102        lea     r8d,[r9+2]
fffff808`d84ce7db e8e05affff      call    pci!PciWriteDeviceConfig (fffff808`d84c42c0)
fffff808`d84ce7e0 90              nop
fffff808`d84ce7e1 e9f063ffff      jmp     pci!PciProgramInterruptResource+0x106 (fffff808`d84c4bd6)  Branch

pci!PciProgramInterruptResource+0x9d16:
fffff808`d84ce7e6 8b531c          mov     edx,dword ptr [rbx+1Ch]
fffff808`d84ce7e9 41b90a000000    mov     r9d,0Ah
fffff808`d84ce7ef 488b4b50        mov     rcx,qword ptr [rbx+50h]
fffff808`d84ce7f3 8bc2            mov     eax,edx
fffff808`d84ce7f5 c1e805          shr     eax,5
fffff808`d84ce7f8 83e21f          and     edx,1Fh
fffff808`d84ce7fb 83e007          and     eax,7
fffff808`d84ce7fe 897c2438        mov     dword ptr [rsp+38h],edi
fffff808`d84ce802 89442430        mov     dword ptr [rsp+30h],eax
fffff808`d84ce806 458d41fc        lea     r8d,[r9-4]
fffff808`d84ce80a 488b8928030000  mov     rcx,qword ptr [rcx+328h]
fffff808`d84ce811 488d05906e0100  lea     rax,[pci!WPP_6fa5c236ca643d3a75eaac43ba9a3211_Traceguids (fffff808`d84e56a8)]
fffff808`d84ce818 89542428        mov     dword ptr [rsp+28h],edx
fffff808`d84ce81c b202            mov     dl,2
fffff808`d84ce81e 4889442420      mov     qword ptr [rsp+20h],rax
fffff808`d84ce823 e83c43ffff      call    pci!WPP_RECORDER_SF_DDd (fffff808`d84c2b64)
fffff808`d84ce828 90              nop
fffff808`d84ce829 e9b063ffff      jmp     pci!PciProgramInterruptResource+0x10e (fffff808`d84c4bde)  Branch
