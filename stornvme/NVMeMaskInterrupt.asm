1: kd> uf  stornvme!NVMeMaskInterrupt
stornvme!NVMeMaskInterrupt:
fffff801`d2c564b0 80791200        cmp     byte ptr [rcx+12h],0  ;pAE+0x12 似乎是  "Is current MSI Interrupt already masked?"
fffff801`d2c564b4 4c8bc1          mov     r8,rcx                ;pAE
fffff801`d2c564b7 7527            jne     stornvme!NVMeMaskInterrupt+0x30 (fffff801`d2c564e0)  Branch ;if *(pAE+0x12) != 0 return

stornvme!NVMeMaskInterrupt+0x9:
fffff801`d2c564b9 8b410c          mov     eax,dword ptr [rcx+0Ch]
fffff801`d2c564bc ffc8            dec     eax
fffff801`d2c564be 83f801          cmp     eax,1
fffff801`d2c564c1 771d            ja      stornvme!NVMeMaskInterrupt+0x30 (fffff801`d2c564e0)  Branch   ;從這邊return

stornvme!NVMeMaskInterrupt+0x13:
fffff801`d2c564c3 498b8090000000  mov     rax,qword ptr [r8+90h]        ;pCtrlRegister
fffff801`d2c564ca 8aca            mov     cl,dl
fffff801`d2c564cc ba01000000      mov     edx,1
fffff801`d2c564d1 d3e2            shl     edx,cl
fffff801`d2c564d3 89500c          mov     dword ptr [rax+0Ch],edx       ;操作 pCtrlRegister->INTMS => MSIX 不應該用這個？
fffff801`d2c564d6 f0830c2400      lock or dword ptr [rsp],0
fffff801`d2c564db 41c6401201      mov     byte ptr [r8+12h],1       ;InterlockedOr

stornvme!NVMeMaskInterrupt+0x30:
fffff801`d2c564e0 c3              ret  Branch
