3: kd> uf stornvme!NVMeSetPowerState
stornvme!NVMeSetPowerState:
fffff801`0a5bb244 488bc4          mov     rax,rsp
fffff801`0a5bb247 48895808        mov     qword ptr [rax+8],rbx
fffff801`0a5bb24b 48896810        mov     qword ptr [rax+10h],rbp
fffff801`0a5bb24f 48897018        mov     qword ptr [rax+18h],rsi
fffff801`0a5bb253 48897820        mov     qword ptr [rax+20h],rdi
fffff801`0a5bb257 4156            push    r14
fffff801`0a5bb259 4883ec20        sub     rsp,20h
fffff801`0a5bb25d 0fb6da          movzx   ebx,dl
fffff801`0a5bb260 488bf1          mov     rsi,rcx
fffff801`0a5bb263 4533f6          xor     r14d,r14d
fffff801`0a5bb266 33d2            xor     edx,edx
fffff801`0a5bb268 4488b14b030000  mov     byte ptr [rcx+34Bh],r14b
fffff801`0a5bb26f 41b8a0100000    mov     r8d,10A0h
fffff801`0a5bb275 488b89a0030000  mov     rcx,qword ptr [rcx+3A0h]
fffff801`0a5bb27c bf40420f00      mov     edi,0F4240h
fffff801`0a5bb281 e8fab2feff      call    stornvme!memset (fffff801`0a5a6580)
fffff801`0a5bb286 488b86a0030000  mov     rax,qword ptr [rsi+3A0h]
fffff801`0a5bb28d 488dae48030000  lea     rbp,[rsi+348h]
fffff801`0a5bb294 488bd5          mov     rdx,rbp
fffff801`0a5bb297 4c89b088100000  mov     qword ptr [rax+1088h],r14
fffff801`0a5bb29e 488b86a0030000  mov     rax,qword ptr [rsi+3A0h]
fffff801`0a5bb2a5 48898680030000  mov     qword ptr [rsi+380h],rax
fffff801`0a5bb2ac c7864003000001000000 mov dword ptr [rsi+340h],1
fffff801`0a5bb2b6 80889d10000001  or      byte ptr [rax+109Dh],1
fffff801`0a5bb2bd 488b86a0030000  mov     rax,qword ptr [rsi+3A0h]
fffff801`0a5bb2c4 80a09d100000fd  and     byte ptr [rax+109Dh],0FDh
fffff801`0a5bb2cb 488b86a0030000  mov     rax,qword ptr [rsi+3A0h]
fffff801`0a5bb2d2 664489b094100000 mov     word ptr [rax+1094h],r14w
fffff801`0a5bb2da 8bc3            mov     eax,ebx
fffff801`0a5bb2dc 488b8ea0030000  mov     rcx,qword ptr [rsi+3A0h]
fffff801`0a5bb2e3 33812c100000    xor     eax,dword ptr [rcx+102Ch]
fffff801`0a5bb2e9 83e01f          and     eax,1Fh
fffff801`0a5bb2ec c6810010000009  mov     byte ptr [rcx+1000h],9
fffff801`0a5bb2f3 31812c100000    xor     dword ptr [rcx+102Ch],eax
fffff801`0a5bb2f9 c6812810000002  mov     byte ptr [rcx+1028h],2
fffff801`0a5bb300 488bce          mov     rcx,rsi
fffff801`0a5bb303 e81c7afeff      call    stornvme!ProcessCommand (fffff801`0a5a2d24)
fffff801`0a5bb308 8a967c060000    mov     dl,byte ptr [rsi+67Ch]
fffff801`0a5bb30e 488bce          mov     rcx,rsi
fffff801`0a5bb311 e8f625ffff      call    stornvme!NVMeGetPowerState (fffff801`0a5ad90c)
fffff801`0a5bb316 8ad3            mov     dl,bl
fffff801`0a5bb318 4c8bc8          mov     r9,rax
fffff801`0a5bb31b e8ec25ffff      call    stornvme!NVMeGetPowerState (fffff801`0a5ad90c)
fffff801`0a5bb320 4d85c9          test    r9,r9
fffff801`0a5bb323 7417            je      stornvme!NVMeSetPowerState+0xf8 (fffff801`0a5bb33c)  Branch

stornvme!NVMeSetPowerState+0xe1:
fffff801`0a5bb325 4885c0          test    rax,rax
fffff801`0a5bb328 7412            je      stornvme!NVMeSetPowerState+0xf8 (fffff801`0a5bb33c)  Branch

stornvme!NVMeSetPowerState+0xe6:
fffff801`0a5bb32a 448b5004        mov     r10d,dword ptr [rax+4]
fffff801`0a5bb32e 45035108        add     r10d,dword ptr [r9+8]
fffff801`0a5bb332 443bd7          cmp     r10d,edi
fffff801`0a5bb335 440f47d7        cmova   r10d,edi
fffff801`0a5bb339 418bfa          mov     edi,r10d

stornvme!NVMeSetPowerState+0xf8:
fffff801`0a5bb33c 448bcf          mov     r9d,edi
fffff801`0a5bb33f 41b001          mov     r8b,1
fffff801`0a5bb342 488bd5          mov     rdx,rbp
fffff801`0a5bb345 e8360c0000      call    stornvme!WaitForCommandCompleteWithCustomTimeout (fffff801`0a5bbf80)
fffff801`0a5bb34a 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff801`0a5bb34f 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff801`0a5bb354 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff801`0a5bb359 488b7c2448      mov     rdi,qword ptr [rsp+48h]
fffff801`0a5bb35e 4883c420        add     rsp,20h
fffff801`0a5bb362 415e            pop     r14
fffff801`0a5bb364 c3              ret
