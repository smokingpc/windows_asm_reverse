1: kd> uf stornvme!NVMeGetPowerState 
stornvme!NVMeGetPowerState:
fffff808`7144e4b8 4c8b81f8050000  mov     r8,qword ptr [rcx+5F8h]
fffff808`7144e4bf 80fa1f          cmp     dl,1Fh
fffff808`7144e4c2 7718            ja      stornvme!NVMeGetPowerState+0x24 (fffff808`7144e4dc)  Branch

stornvme!NVMeGetPowerState+0xc:
fffff808`7144e4c4 413a9007010000  cmp     dl,byte ptr [r8+107h]
fffff808`7144e4cb 770f            ja      stornvme!NVMeGetPowerState+0x24 (fffff808`7144e4dc)  Branch

stornvme!NVMeGetPowerState+0x15:
fffff808`7144e4cd 0fb6c2          movzx   eax,dl
fffff808`7144e4d0 4883c040        add     rax,40h
fffff808`7144e4d4 48c1e005        shl     rax,5
fffff808`7144e4d8 4903c0          add     rax,r8
fffff808`7144e4db c3              ret

stornvme!NVMeGetPowerState+0x24:
fffff808`7144e4dc 33c0            xor     eax,eax
fffff808`7144e4de c3              ret
