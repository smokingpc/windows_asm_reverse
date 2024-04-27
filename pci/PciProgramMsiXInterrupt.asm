;called from pci!PciProgramInterruptResource()

5: kd> uf pci!PciProgramMsiXInterrupt
pci!PciProgramMsiXInterrupt:
fffff808`d84c9bd4 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff808`d84c9bd9 55              push    rbp
fffff808`d84c9bda 56              push    rsi
fffff808`d84c9bdb 57              push    rdi
fffff808`d84c9bdc 4154            push    r12
fffff808`d84c9bde 4155            push    r13
fffff808`d84c9be0 4156            push    r14
fffff808`d84c9be2 4157            push    r15
fffff808`d84c9be4 488bec          mov     rbp,rsp
fffff808`d84c9be7 4883ec70        sub     rsp,70h
fffff808`d84c9beb 488b053e260200  mov     rax,qword ptr [pci!_security_cookie (fffff808`d84ec230)]
fffff808`d84c9bf2 4833c4          xor     rax,rsp
fffff808`d84c9bf5 488945f8        mov     qword ptr [rbp-8],rax
fffff808`d84c9bf9 488b7a10        mov     rdi,qword ptr [rdx+10h]
fffff808`d84c9bfd 4533f6          xor     r14d,r14d
fffff808`d84c9c00 448ba1d4030000  mov     r12d,dword ptr [rcx+3D4h]
fffff808`d84c9c07 4c8bea          mov     r13,rdx
fffff808`d84c9c0a 48897dd0        mov     qword ptr [rbp-30h],rdi
fffff808`d84c9c0e 488bd9          mov     rbx,rcx
fffff808`d84c9c11 4585e4          test    r12d,r12d
fffff808`d84c9c14 0f8492000000    je      pci!PciProgramMsiXInterrupt+0xd8 (fffff808`d84c9cac)  Branch

pci!PciProgramMsiXInterrupt+0x46:
fffff808`d84c9c1a 4533ff          xor     r15d,r15d

pci!PciProgramMsiXInterrupt+0x49:
fffff808`d84c9c1d 498b4520        mov     rax,qword ptr [r13+20h]
fffff808`d84c9c21 4c8d4dc8        lea     r9,[rbp-38h]
fffff808`d84c9c25 498b5528        mov     rdx,qword ptr [r13+28h]
fffff808`d84c9c29 488bcb          mov     rcx,rbx
fffff808`d84c9c2c 458b0407        mov     r8d,dword ptr [r15+rax]
fffff808`d84c9c30 488d45c4        lea     rax,[rbp-3Ch]
fffff808`d84c9c34 410fbaf01f      btr     r8d,1Fh
fffff808`d84c9c39 4889442420      mov     qword ptr [rsp+20h],rax
fffff808`d84c9c3e e8ed000000      call    pci!PciProcessInterruptMessageData (fffff808`d84c9d30)
fffff808`d84c9c43 85c0            test    eax,eax
fffff808`d84c9c45 0f88b0000000    js      pci!PciProgramMsiXInterrupt+0x127 (fffff808`d84c9cfb)  Branch

pci!PciProgramMsiXInterrupt+0x77:
fffff808`d84c9c4b 488b45c8        mov     rax,qword ptr [rbp-38h]
fffff808`d84c9c4f 41b804000000    mov     r8d,4
fffff808`d84c9c55 418bd6          mov     edx,r14d
fffff808`d84c9c58 418bc8          mov     ecx,r8d
fffff808`d84c9c5b 48c1e204        shl     rdx,4
fffff808`d84c9c5f 4803d7          add     rdx,rdi
fffff808`d84c9c62 488d7dd8        lea     rdi,[rbp-28h]
fffff808`d84c9c66 488bf2          mov     rsi,rdx
fffff808`d84c9c69 f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff808`d84c9c6b 488945d8        mov     qword ptr [rbp-28h],rax
fffff808`d84c9c6f 8b45c4          mov     eax,dword ptr [rbp-3Ch]
fffff808`d84c9c72 8945e0          mov     dword ptr [rbp-20h],eax
fffff808`d84c9c75 498b4520        mov     rax,qword ptr [r13+20h]
fffff808`d84c9c79 41833c0700      cmp     dword ptr [r15+rax],0
fffff808`d84c9c7e 0f8c7a7c0000    jl      pci!PciProgramMsiXInterrupt+0x7d2a (fffff808`d84d18fe)  Branch

pci!PciProgramMsiXInterrupt+0xb0:
fffff808`d84c9c84 8365e4fe        and     dword ptr [rbp-1Ch],0FFFFFFFEh

pci!PciProgramMsiXInterrupt+0xb4:
fffff808`d84c9c88 488d75d8        lea     rsi,[rbp-28h]
fffff808`d84c9c8c 488bfa          mov     rdi,rdx
fffff808`d84c9c8f 498bc8          mov     rcx,r8
fffff808`d84c9c92 f3a5            rep movs dword ptr [rdi],dword ptr [rsi]
fffff808`d84c9c94 f0830c2400      lock or dword ptr [rsp],0
fffff808`d84c9c99 488b7dd0        mov     rdi,qword ptr [rbp-30h]
fffff808`d84c9c9d 41ffc6          inc     r14d
fffff808`d84c9ca0 4d03f8          add     r15,r8
fffff808`d84c9ca3 453bf4          cmp     r14d,r12d
fffff808`d84c9ca6 0f8271ffffff    jb      pci!PciProgramMsiXInterrupt+0x49 (fffff808`d84c9c1d)  Branch

pci!PciProgramMsiXInterrupt+0xd8:
fffff808`d84c9cac 440fb64335      movzx   r8d,byte ptr [rbx+35h]
fffff808`d84c9cb1 488d55ea        lea     rdx,[rbp-16h]
fffff808`d84c9cb5 bf02000000      mov     edi,2
fffff808`d84c9cba 488bcb          mov     rcx,rbx
fffff808`d84c9cbd 4403c7          add     r8d,edi
fffff808`d84c9cc0 448bcf          mov     r9d,edi
fffff808`d84c9cc3 e848a9ffff      call    pci!PciReadDeviceConfig (fffff808`d84c4610)
fffff808`d84c9cc8 440fb64335      movzx   r8d,byte ptr [rbx+35h]
fffff808`d84c9ccd 488d55ea        lea     rdx,[rbp-16h]
fffff808`d84c9cd1 b800800000      mov     eax,8000h
fffff808`d84c9cd6 4403c7          add     r8d,edi
fffff808`d84c9cd9 660945ea        or      word ptr [rbp-16h],ax
fffff808`d84c9cdd 448bcf          mov     r9d,edi
fffff808`d84c9ce0 488bcb          mov     rcx,rbx
fffff808`d84c9ce3 e8d8a5ffff      call    pci!PciWriteDeviceConfig (fffff808`d84c42c0)
fffff808`d84c9ce8 8b8348050000    mov     eax,dword ptr [rbx+548h]
fffff808`d84c9cee 480fbae015      bt      rax,15h
fffff808`d84c9cf3 0f820e7c0000    jb      pci!PciProgramMsiXInterrupt+0x7d33 (fffff808`d84d1907)  Branch

pci!PciProgramMsiXInterrupt+0x125:
fffff808`d84c9cf9 33c0            xor     eax,eax

pci!PciProgramMsiXInterrupt+0x127:
fffff808`d84c9cfb 488b4df8        mov     rcx,qword ptr [rbp-8]
fffff808`d84c9cff 4833cc          xor     rcx,rsp
fffff808`d84c9d02 e819160000      call    pci!_security_check_cookie (fffff808`d84cb320)
fffff808`d84c9d07 488b9c24c0000000 mov     rbx,qword ptr [rsp+0C0h]
fffff808`d84c9d0f 4883c470        add     rsp,70h
fffff808`d84c9d13 415f            pop     r15
fffff808`d84c9d15 415e            pop     r14
fffff808`d84c9d17 415d            pop     r13
fffff808`d84c9d19 415c            pop     r12
fffff808`d84c9d1b 5f              pop     rdi
fffff808`d84c9d1c 5e              pop     rsi
fffff808`d84c9d1d 5d              pop     rbp
fffff808`d84c9d1e c3              ret

pci!PciProgramMsiXInterrupt+0x7d2a:
fffff808`d84d18fe 834de401        or      dword ptr [rbp-1Ch],1
fffff808`d84d1902 e98183ffff      jmp     pci!PciProgramMsiXInterrupt+0xb4 (fffff808`d84c9c88)  Branch

pci!PciProgramMsiXInterrupt+0x7d33:
fffff808`d84d1907 448bcf          mov     r9d,edi
fffff808`d84d190a 488d55c0        lea     rdx,[rbp-40h]
fffff808`d84d190e 41b804000000    mov     r8d,4
fffff808`d84d1914 488bcb          mov     rcx,rbx
fffff808`d84d1917 e8f42cffff      call    pci!PciReadDeviceConfig (fffff808`d84c4610)
fffff808`d84d191c b8fffb0000      mov     eax,0FBFFh
fffff808`d84d1921 488d55c0        lea     rdx,[rbp-40h]
fffff808`d84d1925 662145c0        and     word ptr [rbp-40h],ax
fffff808`d84d1929 448bcf          mov     r9d,edi
fffff808`d84d192c 41b804000000    mov     r8d,4
fffff808`d84d1932 488bcb          mov     rcx,rbx
fffff808`d84d1935 e88629ffff      call    pci!PciWriteDeviceConfig (fffff808`d84c42c0)
fffff808`d84d193a 90              nop
fffff808`d84d193b e9b983ffff      jmp     pci!PciProgramMsiXInterrupt+0x125 (fffff808`d84c9cf9)  Branch
