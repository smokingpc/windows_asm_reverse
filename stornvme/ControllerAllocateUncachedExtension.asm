13: kd> uf stornvme!ControllerAllocateUncachedExtension
stornvme!ControllerAllocateUncachedExtension:
fffff806`55d8a9b0 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff806`55d8a9b5 57              push    rdi
fffff806`55d8a9b6 4883ec20        sub     rsp,20h
fffff806`55d8a9ba 8364243000      and     dword ptr [rsp+30h],0
fffff806`55d8a9bf 488bd9          mov     rbx,rcx
fffff806`55d8a9c2 8a4110          mov     al,byte ptr [rcx+10h]
fffff806`55d8a9c5 f6d8            neg     al
fffff806`55d8a9c7 1bff            sbb     edi,edi
fffff806`55d8a9c9 81e70050ffff    and     edi,0FFFF5000h
fffff806`55d8a9cf 448d8700500100  lea     r8d,[rdi+15000h]  ;StorPortGetUncachedExtension() will also trigger RaidInitializeDma
fffff806`55d8a9d6 48ff152b560100  call    qword ptr [stornvme!_imp_StorPortGetUncachedExtension (fffff806`55da0008)]
fffff806`55d8a9dd 0f1f440000      nop     dword ptr [rax+rax]
fffff806`55d8a9e2 48898310060000  mov     qword ptr [rbx+610h],rax
fffff806`55d8a9e9 4885c0          test    rax,rax
fffff806`55d8a9ec 750c            jne     stornvme!ControllerAllocateUncachedExtension+0x4a (fffff806`55d8a9fa)  Branch

stornvme!ControllerAllocateUncachedExtension+0x3e:
fffff806`55d8a9ee c7431801000000  mov     dword ptr [rbx+18h],1
fffff806`55d8a9f5 e950010000      jmp     stornvme!ControllerAllocateUncachedExtension+0x19a (fffff806`55d8ab4a)  Branch

stornvme!ControllerAllocateUncachedExtension+0x4a:
fffff806`55d8a9fa 8d9700500100    lea     edx,[rdi+15000h]
fffff806`55d8aa00 488bc8          mov     rcx,rax
fffff806`55d8aa03 e828a6ffff      call    stornvme!NVMeZeroMemory (fffff806`55d85030)
fffff806`55d8aa08 807b1000        cmp     byte ptr [rbx+10h],0
fffff806`55d8aa0c 4c8b8310060000  mov     r8,qword ptr [rbx+610h]
fffff806`55d8aa13 7415            je      stornvme!ControllerAllocateUncachedExtension+0x7a (fffff806`55d8aa2a)  Branch

stornvme!ControllerAllocateUncachedExtension+0x65:
fffff806`55d8aa15 4981c0ff0f0000  add     r8,0FFFh
fffff806`55d8aa1c 4981e000f0ffff  and     r8,0FFFFFFFFFFFFF000h
fffff806`55d8aa23 4c898310060000  mov     qword ptr [rbx+610h],r8

stornvme!ControllerAllocateUncachedExtension+0x7a:
fffff806`55d8aa2a 4c8d4c2430      lea     r9,[rsp+30h]
fffff806`55d8aa2f 4c898300060000  mov     qword ptr [rbx+600h],r8
fffff806`55d8aa36 33d2            xor     edx,edx
fffff806`55d8aa38 488bcb          mov     rcx,rbx
fffff806`55d8aa3b 48ff15be550100  call    qword ptr [stornvme!_imp_StorPortGetPhysicalAddress (fffff806`55da0000)]
fffff806`55d8aa42 0f1f440000      nop     dword ptr [rax+rax]
fffff806`55d8aa47 48898308060000  mov     qword ptr [rbx+608h],rax
fffff806`55d8aa4e bf00100000      mov     edi,1000h
fffff806`55d8aa53 488b8310060000  mov     rax,qword ptr [rbx+610h]
fffff806`55d8aa5a 4803c7          add     rax,rdi
fffff806`55d8aa5d 807b1000        cmp     byte ptr [rbx+10h],0
fffff806`55d8aa61 48898388030000  mov     qword ptr [rbx+388h],rax
fffff806`55d8aa68 4c8d8000200000  lea     r8,[rax+2000h]
fffff806`55d8aa6f 4c898310060000  mov     qword ptr [rbx+610h],r8
fffff806`55d8aa76 7535            jne     stornvme!ControllerAllocateUncachedExtension+0xfd (fffff806`55d8aaad)  Branch

stornvme!ControllerAllocateUncachedExtension+0xc8:
fffff806`55d8aa78 488d8bf0030000  lea     rcx,[rbx+3F0h]
fffff806`55d8aa7f ba06000000      mov     edx,6

stornvme!ControllerAllocateUncachedExtension+0xd4:
fffff806`55d8aa84 488b8310060000  mov     rax,qword ptr [rbx+610h]
fffff806`55d8aa8b 488901          mov     qword ptr [rcx],rax
fffff806`55d8aa8e 488d4968        lea     rcx,[rcx+68h]
fffff806`55d8aa92 4c8b8310060000  mov     r8,qword ptr [rbx+610h]
fffff806`55d8aa99 4981c000200000  add     r8,2000h
fffff806`55d8aaa0 4c898310060000  mov     qword ptr [rbx+610h],r8
fffff806`55d8aaa7 4883ea01        sub     rdx,1
fffff806`55d8aaab 75d7            jne     stornvme!ControllerAllocateUncachedExtension+0xd4 (fffff806`55d8aa84)  Branch

stornvme!ControllerAllocateUncachedExtension+0xfd:
fffff806`55d8aaad 4c8d4c2430      lea     r9,[rsp+30h]
fffff806`55d8aab2 4c898360060000  mov     qword ptr [rbx+660h],r8
fffff806`55d8aab9 33d2            xor     edx,edx
fffff806`55d8aabb 488bcb          mov     rcx,rbx
fffff806`55d8aabe 48ff153b550100  call    qword ptr [stornvme!_imp_StorPortGetPhysicalAddress (fffff806`55da0000)]
fffff806`55d8aac5 0f1f440000      nop     dword ptr [rax+rax]
fffff806`55d8aaca 488b8b10060000  mov     rcx,qword ptr [rbx+610h]
fffff806`55d8aad1 48898368060000  mov     qword ptr [rbx+668h],rax
fffff806`55d8aad8 4803cf          add     rcx,rdi
fffff806`55d8aadb 0fb7830c010000  movzx   eax,word ptr [rbx+10Ch]
fffff806`55d8aae2 48c1e006        shl     rax,6
fffff806`55d8aae6 48898b18010000  mov     qword ptr [rbx+118h],rcx
fffff806`55d8aaed 4803c8          add     rcx,rax
fffff806`55d8aaf0 807b1000        cmp     byte ptr [rbx+10h],0
fffff806`55d8aaf4 48898ba0010000  mov     qword ptr [rbx+1A0h],rcx
fffff806`55d8aafb 488d8100100000  lea     rax,[rcx+1000h]
fffff806`55d8ab02 48898310060000  mov     qword ptr [rbx+610h],rax
fffff806`55d8ab09 743d            je      stornvme!ControllerAllocateUncachedExtension+0x198 (fffff806`55d8ab48)  Branch

stornvme!ControllerAllocateUncachedExtension+0x15b:
fffff806`55d8ab0b 488d8800100000  lea     rcx,[rax+1000h]
fffff806`55d8ab12 4c8bc1          mov     r8,rcx
fffff806`55d8ab15 4803cf          add     rcx,rdi
fffff806`55d8ab18 48898b10060000  mov     qword ptr [rbx+610h],rcx
fffff806`55d8ab1f 488d9120feffff  lea     rdx,[rcx-1E0h]
fffff806`55d8ab26 4881c1a8feffff  add     rcx,0FFFFFFFFFFFFFEA8h
fffff806`55d8ab2d 48898b00030000  mov     qword ptr [rbx+300h],rcx
fffff806`55d8ab34 488993f8020000  mov     qword ptr [rbx+2F8h],rdx
fffff806`55d8ab3b 488902          mov     qword ptr [rdx],rax
fffff806`55d8ab3e 488b8b00030000  mov     rcx,qword ptr [rbx+300h]
fffff806`55d8ab45 4c8901          mov     qword ptr [rcx],r8

stornvme!ControllerAllocateUncachedExtension+0x198:
fffff806`55d8ab48 b001            mov     al,1

stornvme!ControllerAllocateUncachedExtension+0x19a:
fffff806`55d8ab4a 488b5c2438      mov     rbx,qword ptr [rsp+38h]
fffff806`55d8ab4f 4883c420        add     rsp,20h
fffff806`55d8ab53 5f              pop     rdi
fffff806`55d8ab54 c3              ret
