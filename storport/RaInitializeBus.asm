1: kd> uf storport!RaInitializeBus
storport!RaInitializeBus:
fffff80b`7ca6c5d8 4053            push    rbx
fffff80b`7ca6c5da 4883ec30        sub     rsp,30h
fffff80b`7ca6c5de 488d4108        lea     rax,[rcx+8]
fffff80b`7ca6c5e2 488bd9          mov     rbx,rcx
fffff80b`7ca6c5e5 488bca          mov     rcx,rdx
fffff80b`7ca6c5e8 4889442420      mov     qword ptr [rsp+20h],rax
fffff80b`7ca6c5ed e8a202fbff      call    storport!RaQueryInterface (fffff80b`7ca1c894)
fffff80b`7ca6c5f2 85c0            test    eax,eax
fffff80b`7ca6c5f4 0f99c2          setns   dl
fffff80b`7ca6c5f7 8813            mov     byte ptr [rbx],dl
fffff80b`7ca6c5f9 4883c430        add     rsp,30h
fffff80b`7ca6c5fd 5b              pop     rbx
fffff80b`7ca6c5fe c3              ret
