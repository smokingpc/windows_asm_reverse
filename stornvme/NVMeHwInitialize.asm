1: kd> uf NVMeHwInitialize
stornvme!NVMeHwInitialize:
fffff808`7144b1c0 4053            push    rbx
fffff808`7144b1c2 4883ec20        sub     rsp,20h
fffff808`7144b1c6 80791000        cmp     byte ptr [rcx+10h],0  ;pAE+0x10 == PORT_CONFIGURATION_INFORMATION::DumpMode.
fffff808`7144b1ca 488bd9          mov     rbx,rcx
fffff808`7144b1cd 741b            je      stornvme!NVMeHwInitialize+0x2a (fffff808`7144b1ea)  Branch ;if DumpMode==0, goto 0x2a

stornvme!NVMeHwInitialize+0xf:
fffff808`7144b1cf 41b001          mov     r8b,1
fffff808`7144b1d2 418ad0          mov     dl,r8b
fffff808`7144b1d5 e82e2a0000      call    stornvme!NVMeContorllerInitPart2 (fffff808`7144dc08)
fffff808`7144b1da 84c0            test    al,al
fffff808`7144b1dc 7435            je      stornvme!NVMeHwInitialize+0x53 (fffff808`7144b213)  Branch

stornvme!NVMeHwInitialize+0x1e:
fffff808`7144b1de b201            mov     dl,1
fffff808`7144b1e0 488bcb          mov     rcx,rbx
fffff808`7144b1e3 e828b3ffff      call    stornvme!NVMeControllerInitPart3 (fffff808`71446510)
fffff808`7144b1e8 eb29            jmp     stornvme!NVMeHwInitialize+0x53 (fffff808`7144b213)  Branch

stornvme!NVMeHwInitialize+0x2a:
fffff808`7144b1ea 8364243000      and     dword ptr [rsp+30h],0
fffff808`7144b1ef 4c8d4c2430      lea     r9,[rsp+30h]
fffff808`7144b1f4 4c8d0585000000  lea     r8,[stornvme!NVMeHwPassiveInitialize (fffff808`7144b280)]
fffff808`7144b1fb 488bd3          mov     rdx,rbx
fffff808`7144b1fe b900100000      mov     ecx,1000h
fffff808`7144b203 48ff15064e0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff808`71460010)]
fffff808`7144b20a 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144b20f 8a442430        mov     al,byte ptr [rsp+30h]

stornvme!NVMeHwInitialize+0x53:
fffff808`7144b213 4883c420        add     rsp,20h
fffff808`7144b217 5b              pop     rbx
fffff808`7144b218 c3              ret
