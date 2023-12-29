1: kd> uf storport!RaidGetD3ColdInterface
storport!RaidGetD3ColdInterface:
fffff80b`7ca1dab0 488bc4          mov     rax,rsp
fffff80b`7ca1dab3 48895808        mov     qword ptr [rax+8],rbx
fffff80b`7ca1dab7 48896810        mov     qword ptr [rax+10h],rbp
fffff80b`7ca1dabb 48897018        mov     qword ptr [rax+18h],rsi
fffff80b`7ca1dabf 48897820        mov     qword ptr [rax+20h],rdi
fffff80b`7ca1dac3 4156            push    r14
fffff80b`7ca1dac5 4883ec20        sub     rsp,20h
fffff80b`7ca1dac9 488b4140        mov     rax,qword ptr [rcx+40h]
fffff80b`7ca1dacd 4c8bf2          mov     r14,rdx
fffff80b`7ca1dad0 33f6            xor     esi,esi
fffff80b`7ca1dad2 33ff            xor     edi,edi
fffff80b`7ca1dad4 488be9          mov     rbp,rcx
fffff80b`7ca1dad7 8b10            mov     edx,dword ptr [rax]
fffff80b`7ca1dad9 85d2            test    edx,edx
fffff80b`7ca1dadb 0f8493000000    je      storport!RaidGetD3ColdInterface+0xc4 (fffff80b`7ca1db74)  Branch

storport!RaidGetD3ColdInterface+0x31:
fffff80b`7ca1dae1 83fa01          cmp     edx,1
fffff80b`7ca1dae4 0f85855b0100    jne     storport!RaidGetD3ColdInterface+0x15bbf (fffff80b`7ca3366f)  Branch

storport!RaidGetD3ColdInterface+0x3a:
fffff80b`7ca1daea 488bf8          mov     rdi,rax
fffff80b`7ca1daed 4885c0          test    rax,rax
fffff80b`7ca1daf0 7410            je      storport!RaidGetD3ColdInterface+0x52 (fffff80b`7ca1db02)  Branch

storport!RaidGetD3ColdInterface+0x42:
fffff80b`7ca1daf2 488b80d8060000  mov     rax,qword ptr [rax+6D8h]

storport!RaidGetD3ColdInterface+0x49:
fffff80b`7ca1daf9 4885c0          test    rax,rax
fffff80b`7ca1dafc 0f8586000000    jne     storport!RaidGetD3ColdInterface+0xd8 (fffff80b`7ca1db88)  Branch

storport!RaidGetD3ColdInterface+0x52:
fffff80b`7ca1db02 440f20c0        mov     rax,tmm
fffff80b`7ca1db06 84c0            test    al,al
fffff80b`7ca1db08 0f85385b0100    jne     storport!RaidGetD3ColdInterface+0x15b96 (fffff80b`7ca33646)  Branch

storport!RaidGetD3ColdInterface+0x5e:
fffff80b`7ca1db0e 4c8bcd          mov     r9,rbp
fffff80b`7ca1db11 ba48000000      mov     edx,48h
fffff80b`7ca1db16 b900020000      mov     ecx,200h
fffff80b`7ca1db1b 41b852615057    mov     r8d,57506152h
fffff80b`7ca1db21 e816a6feff      call    storport!RaidAllocatePool (fffff80b`7ca0813c)
fffff80b`7ca1db26 488bd8          mov     rbx,rax
fffff80b`7ca1db29 4885c0          test    rax,rax
fffff80b`7ca1db2c 0f841e5b0100    je      storport!RaidGetD3ColdInterface+0x15ba0 (fffff80b`7ca33650)  Branch

storport!RaidGetD3ColdInterface+0x82:
fffff80b`7ca1db32 488bd0          mov     rdx,rax
fffff80b`7ca1db35 488bcd          mov     rcx,rbp
fffff80b`7ca1db38 e86f000000      call    storport!RaidQueryD3ColdInterface (fffff80b`7ca1dbac)
fffff80b`7ca1db3d 8be8            mov     ebp,eax
fffff80b`7ca1db3f 85c0            test    eax,eax
fffff80b`7ca1db41 794c            jns     storport!RaidGetD3ColdInterface+0xdf (fffff80b`7ca1db8f)  Branch

storport!RaidGetD3ColdInterface+0x93:
fffff80b`7ca1db43 ba52615057      mov     edx,57506152h
fffff80b`7ca1db48 488bcb          mov     rcx,rbx
fffff80b`7ca1db4b 48ff15d6960400  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff80b`7ca67228)]
fffff80b`7ca1db52 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidGetD3ColdInterface+0xa7:
fffff80b`7ca1db57 8bc5            mov     eax,ebp

storport!RaidGetD3ColdInterface+0xa9:
fffff80b`7ca1db59 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff80b`7ca1db5e 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff80b`7ca1db63 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff80b`7ca1db68 488b7c2448      mov     rdi,qword ptr [rsp+48h]
fffff80b`7ca1db6d 4883c420        add     rsp,20h
fffff80b`7ca1db71 415e            pop     r14
fffff80b`7ca1db73 c3              ret

storport!RaidGetD3ColdInterface+0xc4:
fffff80b`7ca1db74 488bf0          mov     rsi,rax
fffff80b`7ca1db77 4885c0          test    rax,rax
fffff80b`7ca1db7a 7486            je      storport!RaidGetD3ColdInterface+0x52 (fffff80b`7ca1db02)  Branch

storport!RaidGetD3ColdInterface+0xcc:
fffff80b`7ca1db7c 488b80a0150000  mov     rax,qword ptr [rax+15A0h]
fffff80b`7ca1db83 e971ffffff      jmp     storport!RaidGetD3ColdInterface+0x49 (fffff80b`7ca1daf9)  Branch

storport!RaidGetD3ColdInterface+0xd8:
fffff80b`7ca1db88 498906          mov     qword ptr [r14],rax
fffff80b`7ca1db8b 33c0            xor     eax,eax
fffff80b`7ca1db8d ebca            jmp     storport!RaidGetD3ColdInterface+0xa9 (fffff80b`7ca1db59)  Branch

storport!RaidGetD3ColdInterface+0xdf:
fffff80b`7ca1db8f 49891e          mov     qword ptr [r14],rbx
fffff80b`7ca1db92 4885f6          test    rsi,rsi
fffff80b`7ca1db95 0f84bf5a0100    je      storport!RaidGetD3ColdInterface+0x15baa (fffff80b`7ca3365a)  Branch

storport!RaidGetD3ColdInterface+0xeb:
fffff80b`7ca1db9b 48899ea0150000  mov     qword ptr [rsi+15A0h],rbx
fffff80b`7ca1dba2 ebb3            jmp     storport!RaidGetD3ColdInterface+0xa7 (fffff80b`7ca1db57)  Branch

storport!RaidGetD3ColdInterface+0x15b96:
fffff80b`7ca33646 b8480100c0      mov     eax,0C0000148h
fffff80b`7ca3364b e909a5feff      jmp     storport!RaidGetD3ColdInterface+0xa9 (fffff80b`7ca1db59)  Branch

storport!RaidGetD3ColdInterface+0x15ba0:
fffff80b`7ca33650 b89a0000c0      mov     eax,0C000009Ah
fffff80b`7ca33655 e9ffa4feff      jmp     storport!RaidGetD3ColdInterface+0xa9 (fffff80b`7ca1db59)  Branch

storport!RaidGetD3ColdInterface+0x15baa:
fffff80b`7ca3365a 4885ff          test    rdi,rdi
fffff80b`7ca3365d 0f84f4a4feff    je      storport!RaidGetD3ColdInterface+0xa7 (fffff80b`7ca1db57)  Branch

storport!RaidGetD3ColdInterface+0x15bb3:
fffff80b`7ca33663 48899fd8060000  mov     qword ptr [rdi+6D8h],rbx
fffff80b`7ca3366a e9e8a4feff      jmp     storport!RaidGetD3ColdInterface+0xa7 (fffff80b`7ca1db57)  Branch

storport!RaidGetD3ColdInterface+0x15bbf:
fffff80b`7ca3366f b80d0000c0      mov     eax,0C000000Dh
fffff80b`7ca33674 e9e0a4feff      jmp     storport!RaidGetD3ColdInterface+0xa9 (fffff80b`7ca1db59)  Branch
