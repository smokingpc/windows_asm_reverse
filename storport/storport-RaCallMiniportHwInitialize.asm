0: kd> uf storport!RaCallMiniportHwInitialize
storport!RaCallMiniportHwInitialize:
fffff802`173cef20 4883ec28        sub     rsp,28h
fffff802`173cef24 488b81e8000000  mov     rax,qword ptr [rcx+0E8h]
fffff802`173cef2b 488b89f0000000  mov     rcx,qword ptr [rcx+0F0h]
fffff802`173cef32 4883c110        add     rcx,10h
fffff802`173cef36 488b4008        mov     rax,qword ptr [rax+8]
fffff802`173cef3a ff15e0880400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff802`17417820)]
fffff802`173cef40 f6d8            neg     al
fffff802`173cef42 1bc0            sbb     eax,eax
fffff802`173cef44 f7d0            not     eax
fffff802`173cef46 25010000c0      and     eax,0C0000001h
fffff802`173cef4b 4883c428        add     rsp,28h
fffff802`173cef4f c3              ret
