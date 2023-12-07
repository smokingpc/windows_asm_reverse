0: kd> uf stornvme!NVMeHwPassiveInitialize
stornvme!NVMeHwPassiveInitialize:
fffff801`7808b280 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff801`7808b285 57              push    rdi
fffff801`7808b286 4883ec30        sub     rsp,30h
fffff801`7808b28a 488bb9f8050000  mov     rdi,qword ptr [rcx+5F8h]
fffff801`7808b291 488d442440      lea     rax,[rsp+40h]
fffff801`7808b296 8364244000      and     dword ptr [rsp+40h],0
fffff801`7808b29b 4c8d0d46f20000  lea     r9,[stornvme!`string`+0x58 (fffff801`7809a4e8)]
fffff801`7808b2a2 4533c0          xor     r8d,r8d
fffff801`7808b2a5 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`7808b2aa 488bd9          mov     rbx,rcx
fffff801`7808b2ad 488bd1          mov     rdx,rcx
fffff801`7808b2b0 418d4837        lea     ecx,[r8+37h]
fffff801`7808b2b4 48ff156d4d0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`780a0028)]
fffff801`7808b2bb 0f1f440000      nop     dword ptr [rax+rax]
fffff801`7808b2c0 85c0            test    eax,eax
fffff801`7808b2c2 750c            jne     stornvme!NVMeHwPassiveInitialize+0x50 (fffff801`7808b2d0)  Branch

stornvme!NVMeHwPassiveInitialize+0x44:
fffff801`7808b2c4 837c244001      cmp     dword ptr [rsp+40h],1
fffff801`7808b2c9 7505            jne     stornvme!NVMeHwPassiveInitialize+0x50 (fffff801`7808b2d0)  Branch

stornvme!NVMeHwPassiveInitialize+0x4b:
fffff801`7808b2cb 0fba6b1407      bts     dword ptr [rbx+14h],7

stornvme!NVMeHwPassiveInitialize+0x50:
fffff801`7808b2d0 83bf0402000000  cmp     dword ptr [rdi+204h],0
fffff801`7808b2d7 763d            jbe     stornvme!NVMeHwPassiveInitialize+0x96 (fffff801`7808b316)  Branch

stornvme!NVMeHwPassiveInitialize+0x59:
fffff801`7808b2d9 4533c0          xor     r8d,r8d
fffff801`7808b2dc b201            mov     dl,1
fffff801`7808b2de 488bcb          mov     rcx,rbx
fffff801`7808b2e1 e822290000      call    stornvme!NVMeControllerInitPart2 (fffff801`7808dc08)
fffff801`7808b2e6 84c0            test    al,al
fffff801`7808b2e8 7442            je      stornvme!NVMeHwPassiveInitialize+0xac (fffff801`7808b32c)  Branch

stornvme!NVMeHwPassiveInitialize+0x6a:
fffff801`7808b2ea 440fb78308010000 movzx   r8d,word ptr [rbx+108h]
fffff801`7808b2f2 488bd3          mov     rdx,rbx
fffff801`7808b2f5 0fb78306010000  movzx   eax,word ptr [rbx+106h]
fffff801`7808b2fc b954000000      mov     ecx,54h                   ;ExtFunctionUpdateAdapterMaxIOInfo
fffff801`7808b301 440fafc0        imul    r8d,eax
fffff801`7808b305 458bc8          mov     r9d,r8d
fffff801`7808b308 48ff15194d0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`780a0028)]
fffff801`7808b30f 0f1f440000      nop     dword ptr [rax+rax]
fffff801`7808b314 eb08            jmp     stornvme!NVMeHwPassiveInitialize+0x9e (fffff801`7808b31e)  Branch

stornvme!NVMeHwPassiveInitialize+0x96:
fffff801`7808b316 83631800        and     dword ptr [rbx+18h],0
fffff801`7808b31a 834b1401        or      dword ptr [rbx+14h],1

stornvme!NVMeHwPassiveInitialize+0x9e:
fffff801`7808b31e 33d2            xor     edx,edx
fffff801`7808b320 488bcb          mov     rcx,rbx
fffff801`7808b323 e8e8b1ffff      call    stornvme!NVMeControllerInitPart3 (fffff801`78086510)
fffff801`7808b328 84c0            test    al,al
fffff801`7808b32a 750c            jne     stornvme!NVMeHwPassiveInitialize+0xb8 (fffff801`7808b338)  Branch

stornvme!NVMeHwPassiveInitialize+0xac:
fffff801`7808b32c 488bcb          mov     rcx,rbx
fffff801`7808b32f e80cf9ffff      call    stornvme!NVMeControllerStartFailureEventLog (fffff801`7808ac40)
fffff801`7808b334 32c0            xor     al,al
fffff801`7808b336 eb0a            jmp     stornvme!NVMeHwPassiveInitialize+0xc2 (fffff801`7808b342)  Branch

stornvme!NVMeHwPassiveInitialize+0xb8:
fffff801`7808b338 488bcb          mov     rcx,rbx
fffff801`7808b33b e8b4380000      call    stornvme!NVMePowerInitialize (fffff801`7808ebf4)
fffff801`7808b340 b001            mov     al,1

stornvme!NVMeHwPassiveInitialize+0xc2:
fffff801`7808b342 488b5c2448      mov     rbx,qword ptr [rsp+48h]
fffff801`7808b347 4883c430        add     rsp,30h
fffff801`7808b34b 5f              pop     rdi
fffff801`7808b34c c3              ret
