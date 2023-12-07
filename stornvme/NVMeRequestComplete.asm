0: kd> uf stornvme!NVMeRequestComplete
stornvme!NVMeRequestComplete:
fffff803`20c0e3d4 48895c2408      mov     qword ptr [rsp+8],rbx
fffff803`20c0e3d9 57              push    rdi
fffff803`20c0e3da 4883ec20        sub     rsp,20h
fffff803`20c0e3de 418af8          mov     dil,r8b
fffff803`20c0e3e1 4c8bda          mov     r11,rdx
fffff803`20c0e3e4 488bd9          mov     rbx,rcx
fffff803`20c0e3e7 e830b4ffff      call    stornvme!IsInternalSrb (fffff803`20c0981c)
fffff803`20c0e3ec 84c0            test    al,al
fffff803`20c0e3ee 7415            je      stornvme!NVMeRequestComplete+0x31 (fffff803`20c0e405)  Branch

stornvme!NVMeRequestComplete+0x1c:
fffff803`20c0e3f0 498bd3          mov     rdx,r11
fffff803`20c0e3f3 488bcb          mov     rcx,rbx
fffff803`20c0e3f6 e8316effff      call    stornvme!GetLocalCommand (fffff803`20c0522c)
fffff803`20c0e3fb 4885c0          test    rax,rax
fffff803`20c0e3fe 7431            je      stornvme!NVMeRequestComplete+0x5d (fffff803`20c0e431)  Branch

stornvme!NVMeRequestComplete+0x2c:
fffff803`20c0e400 832000          and     dword ptr [rax],0
fffff803`20c0e403 eb2c            jmp     stornvme!NVMeRequestComplete+0x5d (fffff803`20c0e431)  Branch

stornvme!NVMeRequestComplete+0x31:
fffff803`20c0e405 4d8bc3          mov     r8,r11
fffff803`20c0e408 488bd3          mov     rdx,rbx
fffff803`20c0e40b 4084ff          test    dil,dil
fffff803`20c0e40e 7413            je      stornvme!NVMeRequestComplete+0x4f (fffff803`20c0e423)  Branch

stornvme!NVMeRequestComplete+0x3c:
fffff803`20c0e410 b908100000      mov     ecx,1008h				;RequestDirectComplete
fffff803`20c0e415 48ff15f40b0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff803`20c1f010)]
fffff803`20c0e41c 0f1f440000      nop     dword ptr [rax+rax]
fffff803`20c0e421 eb0e            jmp     stornvme!NVMeRequestComplete+0x5d (fffff803`20c0e431)  Branch

stornvme!NVMeRequestComplete+0x4f:
fffff803`20c0e423 33c9            xor     ecx,ecx
fffff803`20c0e425 48ff15e40b0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff803`20c1f010)]
fffff803`20c0e42c 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeRequestComplete+0x5d:
fffff803`20c0e431 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff803`20c0e436 4883c420        add     rsp,20h
fffff803`20c0e43a 5f              pop     rdi
fffff803`20c0e43b c3              ret
