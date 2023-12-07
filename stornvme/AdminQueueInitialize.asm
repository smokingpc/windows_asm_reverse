0: kd> uf stornvme!AdminQueueInitialize
stornvme!AdminQueueInitialize:
fffff806`a390b4d8 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff806`a390b4dd 55              push    rbp
fffff806`a390b4de 56              push    rsi
fffff806`a390b4df 57              push    rdi
fffff806`a390b4e0 4156            push    r14
fffff806`a390b4e2 4157            push    r15
fffff806`a390b4e4 488bec          mov     rbp,rsp
fffff806`a390b4e7 4883ec40        sub     rsp,40h
fffff806`a390b4eb 4533ff          xor     r15d,r15d
fffff806`a390b4ee 4c8db110010000  lea     r14,[rcx+110h]
fffff806`a390b4f5 488bf9          mov     rdi,rcx
fffff806`a390b4f8 4c897d38        mov     qword ptr [rbp+38h],r15
fffff806`a390b4fc 33db            xor     ebx,ebx
fffff806`a390b4fe 4c897d30        mov     qword ptr [rbp+30h],r15
fffff806`a390b502 488db198010000  lea     rsi,[rcx+198h]
fffff806`a390b509 0fb78904010000  movzx   ecx,word ptr [rcx+104h]
fffff806`a390b510 44387f10        cmp     byte ptr [rdi+10h],r15b
fffff806`a390b514 0f85b2000000    jne     stornvme!AdminQueueInitialize+0xf4 (fffff806`a390b5cc)  Branch

stornvme!AdminQueueInitialize+0x42:
fffff806`a390b51a 440fb7c1        movzx   r8d,cx
fffff806`a390b51e 488d4538        lea     rax,[rbp+38h]
fffff806`a390b522 41c1e004        shl     r8d,4
fffff806`a390b526 41b94e766d65    mov     r9d,656D764Eh
fffff806`a390b52c 488bd7          mov     rdx,rdi
fffff806`a390b52f 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`a390b534 33c9            xor     ecx,ecx
fffff806`a390b536 48ff15eb4a0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`a3920028)]    ;StorPortAllocatePool()
fffff806`a390b53d 0f1f440000      nop     dword ptr [rax+rax]
fffff806`a390b542 4c397d38        cmp     qword ptr [rbp+38h],r15
fffff806`a390b546 7453            je      stornvme!AdminQueueInitialize+0xc3 (fffff806`a390b59b)  Branch

stornvme!AdminQueueInitialize+0x70:
fffff806`a390b548 440fb78704010000 movzx   r8d,word ptr [rdi+104h]
fffff806`a390b550 488d4530        lea     rax,[rbp+30h]
fffff806`a390b554 41c1e004        shl     r8d,4
fffff806`a390b558 41b94e766d65    mov     r9d,656D764Eh
fffff806`a390b55e 488bd7          mov     rdx,rdi                           ;pAE
fffff806`a390b561 4889442420      mov     qword ptr [rsp+20h],rax
fffff806`a390b566 33c9            xor     ecx,ecx
fffff806`a390b568 48ff15b94a0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`a3920028)]    ;StorPortAllocatePool()
fffff806`a390b56f 0f1f440000      nop     dword ptr [rax+rax]
fffff806`a390b574 4c8b4530        mov     r8,qword ptr [rbp+30h]
fffff806`a390b578 4d85c0          test    r8,r8
fffff806`a390b57b 7542            jne     stornvme!AdminQueueInitialize+0xe7 (fffff806`a390b5bf)  Branch

stornvme!AdminQueueInitialize+0xa5:
fffff806`a390b57d 488b4538        mov     rax,qword ptr [rbp+38h]
fffff806`a390b581 4885c0          test    rax,rax
fffff806`a390b584 7419            je      stornvme!AdminQueueInitialize+0xc7 (fffff806`a390b59f)  Branch

stornvme!AdminQueueInitialize+0xae:
fffff806`a390b586 4c8bc0          mov     r8,rax
fffff806`a390b589 8d4b01          lea     ecx,[rbx+1]
fffff806`a390b58c 488bd7          mov     rdx,rdi                           ;pAE
fffff806`a390b58f 48ff15924a0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`a3920028)]
fffff806`a390b596 0f1f440000      nop     dword ptr [rax+rax]

stornvme!AdminQueueInitialize+0xc3:
fffff806`a390b59b 4c8b4530        mov     r8,qword ptr [rbp+30h]

stornvme!AdminQueueInitialize+0xc7:
fffff806`a390b59f 4d85c0          test    r8,r8
fffff806`a390b5a2 7414            je      stornvme!AdminQueueInitialize+0xe0 (fffff806`a390b5b8)  Branch

stornvme!AdminQueueInitialize+0xcc:
fffff806`a390b5a4 488bd7          mov     rdx,rdi                           ;pAE
fffff806`a390b5a7 b901000000      mov     ecx,1
fffff806`a390b5ac 48ff15754a0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff806`a3920028)]    ;StorPortFreePool()
fffff806`a390b5b3 0f1f440000      nop     dword ptr [rax+rax]

stornvme!AdminQueueInitialize+0xe0:
fffff806`a390b5b8 32c0            xor     al,al
fffff806`a390b5ba e9bf000000      jmp     stornvme!AdminQueueInitialize+0x1a6 (fffff806`a390b67e)  Branch

stornvme!AdminQueueInitialize+0xe7:
fffff806`a390b5bf 0fb78f04010000  movzx   ecx,word ptr [rdi+104h]
fffff806`a390b5c6 4c8b4538        mov     r8,qword ptr [rbp+38h]
fffff806`a390b5ca eb19            jmp     stornvme!AdminQueueInitialize+0x10d (fffff806`a390b5e5)  Branch

stornvme!AdminQueueInitialize+0xf4:
fffff806`a390b5cc 4c8b06          mov     r8,qword ptr [rsi]
fffff806`a390b5cf 0fb7d1          movzx   edx,cx
fffff806`a390b5d2 48c1e204        shl     rdx,4
fffff806`a390b5d6 4c03c2          add     r8,rdx
fffff806`a390b5d9 4c894538        mov     qword ptr [rbp+38h],r8
fffff806`a390b5dd 498d0410        lea     rax,[r8+rdx]
fffff806`a390b5e1 48894530        mov     qword ptr [rbp+30h],rax

stornvme!AdminQueueInitialize+0x10d:
fffff806`a390b5e5 0fb7d1          movzx   edx,cx
fffff806`a390b5e8 498bc8          mov     rcx,r8
fffff806`a390b5eb c1e204          shl     edx,4
fffff806`a390b5ee e8dd9bffff      call    stornvme!NVMeZeroMemory (fffff806`a39051d0)
fffff806`a390b5f3 0fb79704010000  movzx   edx,word ptr [rdi+104h]
fffff806`a390b5fa 488b4d30        mov     rcx,qword ptr [rbp+30h]
fffff806`a390b5fe c1e204          shl     edx,4
fffff806`a390b601 e8ca9bffff      call    stornvme!NVMeZeroMemory (fffff806`a39051d0)
fffff806`a390b606 488b4530        mov     rax,qword ptr [rbp+30h]
fffff806`a390b60a 4533c0          xor     r8d,r8d
fffff806`a390b60d 4d8b0e          mov     r9,qword ptr [r14]
fffff806`a390b610 498bd6          mov     rdx,r14
fffff806`a390b613 4889442430      mov     qword ptr [rsp+30h],rax
fffff806`a390b618 488bcf          mov     rcx,rdi
fffff806`a390b61b 488b4538        mov     rax,qword ptr [rbp+38h]
fffff806`a390b61f 4889442428      mov     qword ptr [rsp+28h],rax
fffff806`a390b624 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff806`a390b629 e832430000      call    stornvme!NVMeSubmissionQueueInit (fffff806`a390f960)
fffff806`a390b62e 4c8b0e          mov     r9,qword ptr [rsi]
fffff806`a390b631 4533c0          xor     r8d,r8d
fffff806`a390b634 488bd6          mov     rdx,rsi
fffff806`a390b637 4c897c2428      mov     qword ptr [rsp+28h],r15
fffff806`a390b63c 488bcf          mov     rcx,rdi
fffff806`a390b63f 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff806`a390b644 e80b1c0000      call    stornvme!NVMeCompletionQueueInit (fffff806`a390d254)
fffff806`a390b649 0fb79704010000  movzx   edx,word ptr [rdi+104h]
fffff806`a390b650 498b0e          mov     rcx,qword ptr [r14]
fffff806`a390b653 c1e206          shl     edx,6
fffff806`a390b656 e8759bffff      call    stornvme!NVMeZeroMemory (fffff806`a39051d0)
fffff806`a390b65b 0fb79704010000  movzx   edx,word ptr [rdi+104h]
fffff806`a390b662 488b0e          mov     rcx,qword ptr [rsi]
fffff806`a390b665 c1e204          shl     edx,4
fffff806`a390b668 e8639bffff      call    stornvme!NVMeZeroMemory (fffff806`a39051d0)
fffff806`a390b66d 6645897e32      mov     word ptr [r14+32h],r15w
fffff806`a390b672 b001            mov     al,1
fffff806`a390b674 c786b400000001000000 mov dword ptr [rsi+0B4h],1

stornvme!AdminQueueInitialize+0x1a6:
fffff806`a390b67e 488b9c2480000000 mov     rbx,qword ptr [rsp+80h]
fffff806`a390b686 4883c440        add     rsp,40h
fffff806`a390b68a 415f            pop     r15
fffff806`a390b68c 415e            pop     r14
fffff806`a390b68e 5f              pop     rdi
fffff806`a390b68f 5e              pop     rsi
fffff806`a390b690 5d              pop     rbp
fffff806`a390b691 c3              ret
