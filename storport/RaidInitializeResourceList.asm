storport!RaidInitializeResourceList:
fffff807`329add10 48895c2408      mov     qword ptr [rsp+8],rbx
fffff807`329add15 57              push    rdi
fffff807`329add16 4883ec20        sub     rsp,20h
fffff807`329add1a 498bf8          mov     rdi,r8
fffff807`329add1d 488bd9          mov     rbx,rcx
fffff807`329add20 4885c9          test    rcx,rcx   ;address of out ptr of _CM_RESOURCE_LIST*
fffff807`329add23 7429            je      storport!RaidInitializeResourceList+0x3e (fffff807`329add4e)  Branch

storport!RaidInitializeResourceList+0x15:
fffff807`329add25 4885d2          test    rdx,rdx   ;RDX指向的 _CM_RESOURCE_LIST 已經有資料
fffff807`329add28 7424            je      storport!RaidInitializeResourceList+0x3e (fffff807`329add4e)  Branch

storport!RaidInitializeResourceList+0x1a:
fffff807`329add2a 4d85c0          test    r8,r8
fffff807`329add2d 741f            je      storport!RaidInitializeResourceList+0x3e (fffff807`329add4e)  Branch

storport!RaidInitializeResourceList+0x1f:
fffff807`329add2f e834000000      call    storport!RaDuplicateCmResourceList (fffff807`329add68)
fffff807`329add34 488bd7          mov     rdx,rdi
fffff807`329add37 488903          mov     qword ptr [rbx],rax
fffff807`329add3a e829000000      call    storport!RaDuplicateCmResourceList (fffff807`329add68)
fffff807`329add3f 48833b00        cmp     qword ptr [rbx],0
fffff807`329add43 48894308        mov     qword ptr [rbx+8],rax
fffff807`329add47 7412            je      storport!RaidInitializeResourceList+0x4b (fffff807`329add5b)  Branch

storport!RaidInitializeResourceList+0x39:
fffff807`329add49 4885c0          test    rax,rax
fffff807`329add4c 740d            je      storport!RaidInitializeResourceList+0x4b (fffff807`329add5b)  Branch

storport!RaidInitializeResourceList+0x3e:
fffff807`329add4e 33c0            xor     eax,eax

storport!RaidInitializeResourceList+0x40:
fffff807`329add50 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff807`329add55 4883c420        add     rsp,20h
fffff807`329add59 5f              pop     rdi
fffff807`329add5a c3              ret

storport!RaidInitializeResourceList+0x4b:
fffff807`329add5b b8170000c0      mov     eax,0C0000017h
fffff807`329add60 ebee            jmp     storport!RaidInitializeResourceList+0x40 (fffff807`329add50)  Branch
