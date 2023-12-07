1: kd> uf NVMeSetArbitration
stornvme!NVMeSetArbitration:
fffff800`243cb1f4 48895c2408      mov     qword ptr [rsp+8],rbx
fffff800`243cb1f9 4889742410      mov     qword ptr [rsp+10h],rsi
fffff800`243cb1fe 48897c2418      mov     qword ptr [rsp+18h],rdi
fffff800`243cb203 4156            push    r14
fffff800`243cb205 4883ec20        sub     rsp,20h
fffff800`243cb209 488bf9          mov     rdi,rcx
fffff800`243cb20c 4533f6          xor     r14d,r14d
fffff800`243cb20f 488b8950060000  mov     rcx,qword ptr [rcx+650h]
fffff800`243cb216 408af2          mov     sil,dl
fffff800`243cb219 418ade          mov     bl,r14b
fffff800`243cb21c 44387710        cmp     byte ptr [rdi+10h],r14b
fffff800`243cb220 0f85d1000000    jne     stornvme!NVMeSetArbitration+0x103 (fffff800`243cb2f7)  Branch

stornvme!NVMeSetArbitration+0x32:
fffff800`243cb226 8a472e          mov     al,byte ptr [rdi+2Eh]
fffff800`243cb229 3cff            cmp     al,0FFh
fffff800`243cb22b 740e            je      stornvme!NVMeSetArbitration+0x47 (fffff800`243cb23b)  Branch

stornvme!NVMeSetArbitration+0x39:
fffff800`243cb22d 3c01            cmp     al,1
fffff800`243cb22f 7614            jbe     stornvme!NVMeSetArbitration+0x51 (fffff800`243cb245)  Branch

stornvme!NVMeSetArbitration+0x3d:
fffff800`243cb231 d0e8            shr     al,1
fffff800`243cb233 fec3            inc     bl
fffff800`243cb235 3c01            cmp     al,1
fffff800`243cb237 77f8            ja      stornvme!NVMeSetArbitration+0x3d (fffff800`243cb231)  Branch

stornvme!NVMeSetArbitration+0x45:
fffff800`243cb239 eb03            jmp     stornvme!NVMeSetArbitration+0x4a (fffff800`243cb23e)  Branch

stornvme!NVMeSetArbitration+0x47:
fffff800`243cb23b 8a5948          mov     bl,byte ptr [rcx+48h]

stornvme!NVMeSetArbitration+0x4a:
fffff800`243cb23e 80fb07          cmp     bl,7
fffff800`243cb241 7202            jb      stornvme!NVMeSetArbitration+0x51 (fffff800`243cb245)  Branch

stornvme!NVMeSetArbitration+0x4f:
fffff800`243cb243 b307            mov     bl,7

stornvme!NVMeSetArbitration+0x51:
fffff800`243cb245 488b8fa0030000  mov     rcx,qword ptr [rdi+3A0h]                  ;[rdi+3A0h] 是一個奇怪的指標，長度 0x10A0
fffff800`243cb24c 33d2            xor     edx,edx
fffff800`243cb24e 41b8a0100000    mov     r8d,10A0h
fffff800`243cb254 4488b74b030000  mov     byte ptr [rdi+34Bh],r14b
fffff800`243cb25b e8a0cbfeff      call    stornvme!memset (fffff800`243b7e00)
fffff800`243cb260 488b87a0030000  mov     rax,qword ptr [rdi+3A0h]
fffff800`243cb267 4c89b088100000  mov     qword ptr [rax+1088h],r14
fffff800`243cb26e 488b87a0030000  mov     rax,qword ptr [rdi+3A0h]
fffff800`243cb275 48898780030000  mov     qword ptr [rdi+380h],rax
fffff800`243cb27c c7874003000001000000 mov dword ptr [rdi+340h],1
fffff800`243cb286 80889d10000001  or      byte ptr [rax+109Dh],1
fffff800`243cb28d 488b87a0030000  mov     rax,qword ptr [rdi+3A0h]
fffff800`243cb294 80a09d100000fd  and     byte ptr [rax+109Dh],0FDh
fffff800`243cb29b 488b87a0030000  mov     rax,qword ptr [rdi+3A0h]
fffff800`243cb2a2 664489b094100000 mov     word ptr [rax+1094h],r14w
fffff800`243cb2aa 488b8fa0030000  mov     rcx,qword ptr [rdi+3A0h]
fffff800`243cb2b1 0fb6c3          movzx   eax,bl
fffff800`243cb2b4 488d9f48030000  lea     rbx,[rdi+348h]
fffff800`243cb2bb 488bd3          mov     rdx,rbx
fffff800`243cb2be 33812c100000    xor     eax,dword ptr [rcx+102Ch]
fffff800`243cb2c4 83e007          and     eax,7
fffff800`243cb2c7 c6810010000009  mov     byte ptr [rcx+1000h],9
fffff800`243cb2ce 31812c100000    xor     dword ptr [rcx+102Ch],eax
fffff800`243cb2d4 c6812810000001  mov     byte ptr [rcx+1028h],1
fffff800`243cb2db 488bcf          mov     rcx,rdi
fffff800`243cb2de e87d7afeff      call    stornvme!ProcessCommand (fffff800`243b2d60) ;ProcessCommand(pAE, pAE+0x348)
fffff800`243cb2e3 41b980969800    mov     r9d,989680h           ;wait 10 seconds (10000000 us) to complete this command.
fffff800`243cb2e9 448ac6          mov     r8b,sil
fffff800`243cb2ec 488bd3          mov     rdx,rbx
fffff800`243cb2ef 488bcf          mov     rcx,rdi
fffff800`243cb2f2 e835170000      call    stornvme!WaitForCommandCompleteWithCustomTimeout (fffff800`243cca2c)

stornvme!NVMeSetArbitration+0x103:
fffff800`243cb2f7 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff800`243cb2fc 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff800`243cb301 488b7c2440      mov     rdi,qword ptr [rsp+40h]
fffff800`243cb306 4883c420        add     rsp,20h
fffff800`243cb30a 415e            pop     r14
fffff800`243cb30c c3              ret
