1: kd> uf storport!RaSendIrpSynchronous
;arg1 ==  Device Object
;arg2 ==  IRP?
storport!RaSendIrpSynchronous:
fffff800`690ee020 48895c2408      mov     qword ptr [rsp+8],rbx
fffff800`690ee025 57              push    rdi
fffff800`690ee026 4883ec50        sub     rsp,50h
fffff800`690ee02a 33c0            xor     eax,eax
fffff800`690ee02c 488bda          mov     rbx,rdx
fffff800`690ee02f 488bf9          mov     rdi,rcx
fffff800`690ee032 4889442440      mov     qword ptr [rsp+40h],rax
fffff800`690ee037 0f57c0          xorps   xmm0,xmm0
fffff800`690ee03a 488d4c2430      lea     rcx,[rsp+30h]
fffff800`690ee03f 4533c0          xor     r8d,r8d
fffff800`690ee042 8d5001          lea     edx,[rax+1]
fffff800`690ee045 0f11442430      movups  xmmword ptr [rsp+30h],xmm0
fffff800`690ee04a 4c8b1527f20500  mov     r10,qword ptr [storport!_imp_KeInitializeEvent (fffff800`6914d278)]
fffff800`690ee051 e8ba0d5efc      call    nt!KeInitializeEvent (fffff800`656cee10)
fffff800`690ee056 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff800`690ee05d 488d0d6c000000  lea     rcx,[storport!RiSignalCompletion (fffff800`690ee0d0)]
fffff800`690ee064 488bd3          mov     rdx,rbx
fffff800`690ee067 488948f0        mov     qword ptr [rax-10h],rcx
fffff800`690ee06b 488d4c2430      lea     rcx,[rsp+30h]
fffff800`690ee070 488948f8        mov     qword ptr [rax-8],rcx
fffff800`690ee074 488bcf          mov     rcx,rdi
fffff800`690ee077 c640bbe0        mov     byte ptr [rax-45h],0E0h
fffff800`690ee07b 4c8b15c6f10500  mov     r10,qword ptr [storport!_imp_IofCallDriver (fffff800`6914d248)]
fffff800`690ee082 e829f75dfc      call    nt!IofCallDriver (fffff800`656cd7b0)
fffff800`690ee087 8bd8            mov     ebx,eax
fffff800`690ee089 3d03010000      cmp     eax,103h
fffff800`690ee08e 7520            jne     storport!RaSendIrpSynchronous+0x90 (fffff800`690ee0b0)  Branch

storport!RaSendIrpSynchronous+0x70:
fffff800`690ee090 33db            xor     ebx,ebx
fffff800`690ee092 488d4c2430      lea     rcx,[rsp+30h]
fffff800`690ee097 4533c9          xor     r9d,r9d
fffff800`690ee09a 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff800`690ee09f 4533c0          xor     r8d,r8d
fffff800`690ee0a2 33d2            xor     edx,edx
fffff800`690ee0a4 4c8b15fdf10500  mov     r10,qword ptr [storport!_imp_KeWaitForSingleObject (fffff800`6914d2a8)]
fffff800`690ee0ab e8900a5ffc      call    nt!KeWaitForSingleObject (fffff800`656deb40)

storport!RaSendIrpSynchronous+0x90:
fffff800`690ee0b0 8bc3            mov     eax,ebx
fffff800`690ee0b2 488b5c2460      mov     rbx,qword ptr [rsp+60h]
fffff800`690ee0b7 4883c450        add     rsp,50h
fffff800`690ee0bb 5f              pop     rdi
fffff800`690ee0bc c3              ret
