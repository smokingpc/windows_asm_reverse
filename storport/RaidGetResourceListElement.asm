22: kd> uf storport!RaidGetResourceListElement
storport!RaidGetResourceListElement:
fffff807`3295fc1c 48895c2408      mov     qword ptr [rsp+8],rbx
fffff807`3295fc21 4c8b11          mov     r10,qword ptr [rcx]
fffff807`3295fc24 4d8bd8          mov     r11,r8
fffff807`3295fc27 488b5c2428      mov     rbx,qword ptr [rsp+28h]
fffff807`3295fc2c 418b4208        mov     eax,dword ptr [r10+8]
fffff807`3295fc30 458b4204        mov     r8d,dword ptr [r10+4]
fffff807`3295fc34 418901          mov     dword ptr [r9],eax
fffff807`3295fc37 8bc2            mov     eax,edx
fffff807`3295fc39 458903          mov     dword ptr [r11],r8d
fffff807`3295fc3c 488d1480        lea     rdx,[rax+rax*4]
fffff807`3295fc40 48c1e202        shl     rdx,2
fffff807`3295fc44 4885db          test    rbx,rbx
fffff807`3295fc47 752a            jne     storport!RaidGetResourceListElement+0x57 (fffff807`3295fc73)  Branch

storport!RaidGetResourceListElement+0x2d:
fffff807`3295fc49 4c8b442430      mov     r8,qword ptr [rsp+30h]
fffff807`3295fc4e 4d85c0          test    r8,r8
fffff807`3295fc51 741a            je      storport!RaidGetResourceListElement+0x51 (fffff807`3295fc6d)  Branch

storport!RaidGetResourceListElement+0x37:
fffff807`3295fc53 488b4908        mov     rcx,qword ptr [rcx+8]
fffff807`3295fc57 8b4104          mov     eax,dword ptr [rcx+4]
fffff807`3295fc5a 418903          mov     dword ptr [r11],eax
fffff807`3295fc5d 8b4108          mov     eax,dword ptr [rcx+8]
fffff807`3295fc60 418901          mov     dword ptr [r9],eax
fffff807`3295fc63 488d4114        lea     rax,[rcx+14h]
fffff807`3295fc67 4803c2          add     rax,rdx
fffff807`3295fc6a 498900          mov     qword ptr [r8],rax

storport!RaidGetResourceListElement+0x51:
fffff807`3295fc6d 488b5c2408      mov     rbx,qword ptr [rsp+8]
fffff807`3295fc72 c3              ret

storport!RaidGetResourceListElement+0x57:
fffff807`3295fc73 418b4208        mov     eax,dword ptr [r10+8]
fffff807`3295fc77 418901          mov     dword ptr [r9],eax
fffff807`3295fc7a 498d4214        lea     rax,[r10+14h]
fffff807`3295fc7e 4803c2          add     rax,rdx
fffff807`3295fc81 458903          mov     dword ptr [r11],r8d
fffff807`3295fc84 488903          mov     qword ptr [rbx],rax
fffff807`3295fc87 ebc0            jmp     storport!RaidGetResourceListElement+0x2d (fffff807`3295fc49)  Branch
