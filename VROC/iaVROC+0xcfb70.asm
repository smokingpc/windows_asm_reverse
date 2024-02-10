1: kd> uf iaVROC+0xcfb70
iaVROC+0xcfb70:
fffff803`9630fb70 48895c2408      mov     qword ptr [rsp+8],rbx
fffff803`9630fb75 57              push    rdi
fffff803`9630fb76 4883ec20        sub     rsp,20h
fffff803`9630fb7a 8bda            mov     ebx,edx
fffff803`9630fb7c 488bf9          mov     rdi,rcx
fffff803`9630fb7f 448bc2          mov     r8d,edx
fffff803`9630fb82 b903000000      mov     ecx,3
fffff803`9630fb87 488d15d2cf0100  lea     rdx,[iaVROC+0xecb60 (fffff803`9632cb60)]
fffff803`9630fb8e e8ddc10100      call    iaVROC+0xebd70 (fffff803`9632bd70)
fffff803`9630fb93 0fb787e4010000  movzx   eax,word ptr [rdi+1E4h]
fffff803`9630fb9a 0faee8          lfence
fffff803`9630fb9d 3bd8            cmp     ebx,eax
fffff803`9630fb9f 7618            jbe     iaVROC+0xcfbb9 (fffff803`9630fbb9)  Branch

iaVROC+0xcfba1:
fffff803`9630fba1 448bc3          mov     r8d,ebx
fffff803`9630fba4 488d15e5cf0100  lea     rdx,[iaVROC+0xecb90 (fffff803`9632cb90)]
fffff803`9630fbab b903000000      mov     ecx,3
fffff803`9630fbb0 e8bbc10100      call    iaVROC+0xebd70 (fffff803`9632bd70)
fffff803`9630fbb5 32c0            xor     al,al
fffff803`9630fbb7 eb28            jmp     iaVROC+0xcfbe1 (fffff803`9630fbe1)  Branch

iaVROC+0xcfbb9:
fffff803`9630fbb9 85db            test    ebx,ebx
fffff803`9630fbbb 7507            jne     iaVROC+0xcfbc4 (fffff803`9630fbc4)  Branch

iaVROC+0xcfbbd:
fffff803`9630fbbd c6873820000001  mov     byte ptr [rdi+2038h],1

iaVROC+0xcfbc4:
fffff803`9630fbc4 488b8748010000  mov     rax,qword ptr [rdi+148h]
fffff803`9630fbcb 488d0cdb        lea     rcx,[rbx+rbx*8]
fffff803`9630fbcf 4c8bc3          mov     r8,rbx
fffff803`9630fbd2 4c8bcf          mov     r9,rdi
fffff803`9630fbd5 488d14c8        lea     rdx,[rax+rcx*8]
fffff803`9630fbd9 488bcf          mov     rcx,rdi
fffff803`9630fbdc e80f96f3ff      call    iaVROC+0x91f0 (fffff803`962491f0) ;MSIX go this path (MSGID==1)

iaVROC+0xcfbe1:
fffff803`9630fbe1 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff803`9630fbe6 4883c420        add     rsp,20h
fffff803`9630fbea 5f              pop     rdi
fffff803`9630fbeb c3              ret
