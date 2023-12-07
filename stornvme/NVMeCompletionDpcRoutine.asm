0: kd> uf stornvme!NVMeCompletionDpcRoutine
===> RCX == (HwDeviceExt OFFSET 0x1b0) or other addr == STOR_DPC object address
===> RDX == HwDeviceExt
===> R8 == address of an PAGE_ALIGNED pointer variable ==> addr of Corresponding CplQ va pointer

stornvme!NVMeCompletionDpcRoutine:
fffff801`780818f0 4c8bdc          mov     r11,rsp
fffff801`780818f3 4d894b20        mov     qword ptr [r11+20h],r9
fffff801`780818f7 53              push    rbx
fffff801`780818f8 56              push    rsi
fffff801`780818f9 4155            push    r13
fffff801`780818fb 4881ec20010000  sub     rsp,120h
fffff801`78081902 33c0            xor     eax,eax
fffff801`78081904 49897be0        mov     qword ptr [r11-20h],rdi
fffff801`78081908 4d8963d8        mov     qword ptr [r11-28h],r12
fffff801`7808190c 488bda          mov     rbx,rdx
fffff801`7808190f 4d8973d0        mov     qword ptr [r11-30h],r14
fffff801`78081913 33ff            xor     edi,edi
fffff801`78081915 450fb7b0aa000000 movzx   r14d,word ptr [r8+0AAh]
fffff801`7808191d 0fb7d7          movzx   edx,di
fffff801`78081920 49c1e604        shl     r14,4
fffff801`78081924 4d8be8          mov     r13,r8
fffff801`78081927 4d0330          add     r14,qword ptr [r8]
fffff801`7808192a 41b401          mov     r12b,1
fffff801`7808192d 6689942448010000 mov     word ptr [rsp+148h],dx
fffff801`78081935 498943a8        mov     qword ptr [r11-58h],rax
fffff801`78081939 498943a0        mov     qword ptr [r11-60h],rax
fffff801`7808193d 498943b0        mov     qword ptr [r11-50h],rax
fffff801`78081941 384311          cmp     byte ptr [rbx+11h],al
fffff801`78081944 7507            jne     stornvme!NVMeCompletionDpcRoutine+0x5d (fffff801`7808194d)  Branch

stornvme!NVMeCompletionDpcRoutine+0x56:
fffff801`78081946 8b4368          mov     eax,dword ptr [rbx+68h]
fffff801`78081949 a802            test    al,2
fffff801`7808194b 7427            je      stornvme!NVMeCompletionDpcRoutine+0x84 (fffff801`78081974)  Branch

stornvme!NVMeCompletionDpcRoutine+0x5d:
fffff801`7808194d 4c8d8c24e8000000 lea     r9,[rsp+0E8h]
fffff801`78081955 488bd3          mov     rdx,rbx
fffff801`78081958 4c8d8424d8000000 lea     r8,[rsp+0D8h]
fffff801`78081960 b92f000000      mov     ecx,2Fh
fffff801`78081965 48ff15bce60100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`780a0028)]
fffff801`7808196c 0f1f440000      nop     dword ptr [rax+rax]
fffff801`78081971 0fb7d7          movzx   edx,di

stornvme!NVMeCompletionDpcRoutine+0x84:
fffff801`78081974 410fb7460e      movzx   eax,word ptr [r14+0Eh]
fffff801`78081979 be01000000      mov     esi,1
fffff801`7808197e 6683e001        and     ax,1
fffff801`78081982 4889ac2440010000 mov     qword ptr [rsp+140h],rbp
fffff801`7808198a 4c89bc2400010000 mov     qword ptr [rsp+100h],r15
fffff801`78081992 66413b85ac000000 cmp     ax,word ptr [r13+0ACh]
fffff801`7808199a 0f8417050000    je      stornvme!NVMeCompletionDpcRoutine+0x5c7 (fffff801`78081eb7)  Branch

stornvme!NVMeCompletionDpcRoutine+0xb0:
fffff801`780819a0 4584e4          test    r12b,r12b
fffff801`780819a3 0f8409050000    je      stornvme!NVMeCompletionDpcRoutine+0x5c2 (fffff801`78081eb2)  Branch

stornvme!NVMeCompletionDpcRoutine+0xb9:
fffff801`780819a9 450fb795a8000000 movzx   r10d,word ptr [r13+0A8h]
fffff801`780819b1 450fb7460a      movzx   r8d,word ptr [r14+0Ah]
fffff801`780819b6 450fb74e0c      movzx   r9d,word ptr [r14+0Ch]
fffff801`780819bb 450fb75e08      movzx   r11d,word ptr [r14+8]
fffff801`780819c0 89bc24d0000000  mov     dword ptr [rsp+0D0h],edi
fffff801`780819c7 664585d2        test    r10w,r10w
fffff801`780819cb 740b            je      stornvme!NVMeCompletionDpcRoutine+0xe8 (fffff801`780819d8)  Branch

stornvme!NVMeCompletionDpcRoutine+0xdd:
fffff801`780819cd 8b4314          mov     eax,dword ptr [rbx+14h]
fffff801`780819d0 a801            test    al,1
fffff801`780819d2 0f8420060000    je      stornvme!NVMeCompletionDpcRoutine+0x708 (fffff801`78081ff8)  Branch

stornvme!NVMeCompletionDpcRoutine+0xe8:
fffff801`780819d8 664585c0        test    r8w,r8w
fffff801`780819dc 7538            jne     stornvme!NVMeCompletionDpcRoutine+0x126 (fffff801`78081a16)  Branch

stornvme!NVMeCompletionDpcRoutine+0xee:
fffff801`780819de 440fb7bb04010000 movzx   r15d,word ptr [rbx+104h]
fffff801`780819e6 488dbb94010000  lea     rdi,[rbx+194h]
fffff801`780819ed 4889bc24f0000000 mov     qword ptr [rsp+0F0h],rdi
fffff801`780819f5 488d933e010000  lea     rdx,[rbx+13Eh]
fffff801`780819fc 488dbb90010000  lea     rdi,[rbx+190h]
fffff801`78081a03 4889bc24f8000000 mov     qword ptr [rsp+0F8h],rdi
fffff801`78081a0b 488d8b30010000  lea     rcx,[rbx+130h]
fffff801`78081a12 33ff            xor     edi,edi
fffff801`78081a14 eb46            jmp     stornvme!NVMeCompletionDpcRoutine+0x16c (fffff801`78081a5c)  Branch

stornvme!NVMeCompletionDpcRoutine+0x126:
fffff801`78081a16 440fb7bb06010000 movzx   r15d,word ptr [rbx+106h]
fffff801`78081a1e 410fb7c0        movzx   eax,r8w
fffff801`78081a22 4869c888000000  imul    rcx,rax,88h
fffff801`78081a29 488b83f0020000  mov     rax,qword ptr [rbx+2F0h]
fffff801`78081a30 488d50fc        lea     rdx,[rax-4]
fffff801`78081a34 4803d1          add     rdx,rcx
fffff801`78081a37 48899424f0000000 mov     qword ptr [rsp+0F0h],rdx
fffff801`78081a3f 488d50f8        lea     rdx,[rax-8]
fffff801`78081a43 4803d1          add     rdx,rcx
fffff801`78081a46 48899424f8000000 mov     qword ptr [rsp+0F8h],rdx
fffff801`78081a4e 488d50a6        lea     rdx,[rax-5Ah]
fffff801`78081a52 4803d1          add     rdx,rcx
fffff801`78081a55 4883c198        add     rcx,0FFFFFFFFFFFFFF98h
fffff801`78081a59 4803c8          add     rcx,rax

stornvme!NVMeCompletionDpcRoutine+0x16c:
fffff801`78081a5c 664489bc2450010000 mov   word ptr [rsp+150h],r15w
fffff801`78081a65 66453bcf        cmp     r9w,r15w
fffff801`78081a69 0f838f040000    jae     stornvme!NVMeCompletionDpcRoutine+0x60e (fffff801`78081efe)  Branch

stornvme!NVMeCompletionDpcRoutine+0x17f:
fffff801`78081a6f 410fb7c1        movzx   eax,r9w
fffff801`78081a73 48c1e004        shl     rax,4
fffff801`78081a77 480301          add     rax,qword ptr [rcx]
fffff801`78081a7a 488738          xchg    rdi,qword ptr [rax]
fffff801`78081a7d 4885ff          test    rdi,rdi
fffff801`78081a80 0f8472050000    je      stornvme!NVMeCompletionDpcRoutine+0x708 (fffff801`78081ff8)  Branch

stornvme!NVMeCompletionDpcRoutine+0x196:
fffff801`78081a86 807f0228        cmp     byte ptr [rdi+2],28h
fffff801`78081a8a 7506            jne     stornvme!NVMeCompletionDpcRoutine+0x1a2 (fffff801`78081a92)  Branch

stornvme!NVMeCompletionDpcRoutine+0x19c:
fffff801`78081a8c 488b6f68        mov     rbp,qword ptr [rdi+68h]
fffff801`78081a90 eb04            jmp     stornvme!NVMeCompletionDpcRoutine+0x1a6 (fffff801`78081a96)  Branch

stornvme!NVMeCompletionDpcRoutine+0x1a2:
fffff801`78081a92 488b6f38        mov     rbp,qword ptr [rdi+38h]

stornvme!NVMeCompletionDpcRoutine+0x1a6:
fffff801`78081a96 488bc5          mov     rax,rbp
fffff801`78081a99 25ff0f0000      and     eax,0FFFh
fffff801`78081a9e 740a            je      stornvme!NVMeCompletionDpcRoutine+0x1ba (fffff801`78081aaa)  Branch

stornvme!NVMeCompletionDpcRoutine+0x1b0:
fffff801`78081aa0 482be8          sub     rbp,rax
fffff801`78081aa3 4881c500100000  add     rbp,1000h

stornvme!NVMeCompletionDpcRoutine+0x1ba:
fffff801`78081aaa 6644891a        mov     word ptr [rdx],r11w
fffff801`78081aae 807f0228        cmp     byte ptr [rdi+2],28h
fffff801`78081ab2 750a            jne     stornvme!NVMeCompletionDpcRoutine+0x1ce (fffff801`78081abe)  Branch

stornvme!NVMeCompletionDpcRoutine+0x1c4:
fffff801`78081ab4 8b4734          mov     eax,dword ptr [rdi+34h]
fffff801`78081ab7 0fb64c380a      movzx   ecx,byte ptr [rax+rdi+0Ah]
fffff801`78081abc eb04            jmp     stornvme!NVMeCompletionDpcRoutine+0x1d2 (fffff801`78081ac2)  Branch

stornvme!NVMeCompletionDpcRoutine+0x1ce:
fffff801`78081abe 0fb64f07        movzx   ecx,byte ptr [rdi+7]

stornvme!NVMeCompletionDpcRoutine+0x1d2:
fffff801`78081ac2 410fb7460e      movzx   eax,word ptr [r14+0Eh]
fffff801`78081ac7 0fb6f1          movzx   esi,cl
fffff801`78081aca b9000e0000      mov     ecx,0E00h
fffff801`78081acf 89b424d0000000  mov     dword ptr [rsp+0D0h],esi
fffff801`78081ad6 6689859a100000  mov     word ptr [rbp+109Ah],ax
fffff801`78081add 6685c1          test    cx,ax
fffff801`78081ae0 7529            jne     stornvme!NVMeCompletionDpcRoutine+0x21b (fffff801`78081b0b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x1f2:
fffff801`78081ae2 b9fe010000      mov     ecx,1FEh
fffff801`78081ae7 6685c1          test    cx,ax
fffff801`78081aea 751f            jne     stornvme!NVMeCompletionDpcRoutine+0x21b (fffff801`78081b0b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x1fc:
fffff801`78081aec c6470301        mov     byte ptr [rdi+3],1
fffff801`78081af0 39b3b8000000    cmp     dword ptr [rbx+0B8h],esi
fffff801`78081af6 7633            jbe     stornvme!NVMeCompletionDpcRoutine+0x23b (fffff801`78081b2b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x208:
fffff801`78081af8 488b8cf368060000 mov     rcx,qword ptr [rbx+rsi*8+668h]
fffff801`78081b00 4885c9          test    rcx,rcx
fffff801`78081b03 7426            je      stornvme!NVMeCompletionDpcRoutine+0x23b (fffff801`78081b2b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x215:
fffff801`78081b05 48ff4118        inc     qword ptr [rcx+18h]
fffff801`78081b09 eb20            jmp     stornvme!NVMeCompletionDpcRoutine+0x23b (fffff801`78081b2b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x21b:
fffff801`78081b0b 488bcf          mov     rcx,rdi
fffff801`78081b0e e849060000      call    stornvme!NVMeMapError (fffff801`7808215c)
fffff801`78081b13 39b3b8000000    cmp     dword ptr [rbx+0B8h],esi
fffff801`78081b19 7610            jbe     stornvme!NVMeCompletionDpcRoutine+0x23b (fffff801`78081b2b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x22b:
fffff801`78081b1b 488b8cf368060000 mov     rcx,qword ptr [rbx+rsi*8+668h]
fffff801`78081b23 4885c9          test    rcx,rcx
fffff801`78081b26 7403            je      stornvme!NVMeCompletionDpcRoutine+0x23b (fffff801`78081b2b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x238:
fffff801`78081b28 ff4120          inc     dword ptr [rcx+20h]

stornvme!NVMeCompletionDpcRoutine+0x23b:
fffff801`78081b2b 807b1100        cmp     byte ptr [rbx+11h],0
fffff801`78081b2f 0f847d010000    je      stornvme!NVMeCompletionDpcRoutine+0x3c2 (fffff801`78081cb2)  Branch

stornvme!NVMeCompletionDpcRoutine+0x245:
fffff801`78081b35 807f0228        cmp     byte ptr [rdi+2],28h
fffff801`78081b39 7506            jne     stornvme!NVMeCompletionDpcRoutine+0x251 (fffff801`78081b41)  Branch

stornvme!NVMeCompletionDpcRoutine+0x24b:
fffff801`78081b3b 4c8b7f68        mov     r15,qword ptr [rdi+68h]
fffff801`78081b3f eb04            jmp     stornvme!NVMeCompletionDpcRoutine+0x255 (fffff801`78081b45)  Branch

stornvme!NVMeCompletionDpcRoutine+0x251:
fffff801`78081b41 4c8b7f38        mov     r15,qword ptr [rdi+38h]

stornvme!NVMeCompletionDpcRoutine+0x255:
fffff801`78081b45 498bc7          mov     rax,r15
fffff801`78081b48 25ff0f0000      and     eax,0FFFh
fffff801`78081b4d 740a            je      stornvme!NVMeCompletionDpcRoutine+0x269 (fffff801`78081b59)  Branch

stornvme!NVMeCompletionDpcRoutine+0x25f:
fffff801`78081b4f 4c2bf8          sub     r15,rax
fffff801`78081b52 4981c700100000  add     r15,1000h

stornvme!NVMeCompletionDpcRoutine+0x269:
fffff801`78081b59 458b8704100000  mov     r8d,dword ptr [r15+1004h]
fffff801`78081b60 4183f8ff        cmp     r8d,0FFFFFFFFh
fffff801`78081b64 7425            je      stornvme!NVMeCompletionDpcRoutine+0x29b (fffff801`78081b8b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x276:
fffff801`78081b66 8b93b8000000    mov     edx,dword ptr [rbx+0B8h]
fffff801`78081b6c 33c9            xor     ecx,ecx
fffff801`78081b6e 85d2            test    edx,edx
fffff801`78081b70 7419            je      stornvme!NVMeCompletionDpcRoutine+0x29b (fffff801`78081b8b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x282:
fffff801`78081b72 488bb4cb68060000 mov     rsi,qword ptr [rbx+rcx*8+668h]
fffff801`78081b7a 4885f6          test    rsi,rsi
fffff801`78081b7d 7406            je      stornvme!NVMeCompletionDpcRoutine+0x295 (fffff801`78081b85)  Branch

stornvme!NVMeCompletionDpcRoutine+0x28f:
fffff801`78081b7f 44394610        cmp     dword ptr [rsi+10h],r8d
fffff801`78081b83 7408            je      stornvme!NVMeCompletionDpcRoutine+0x29d (fffff801`78081b8d)  Branch

stornvme!NVMeCompletionDpcRoutine+0x295:
fffff801`78081b85 ffc1            inc     ecx
fffff801`78081b87 3bca            cmp     ecx,edx
fffff801`78081b89 72e7            jb      stornvme!NVMeCompletionDpcRoutine+0x282 (fffff801`78081b72)  Branch

stornvme!NVMeCompletionDpcRoutine+0x29b:
fffff801`78081b8b 33f6            xor     esi,esi

stornvme!NVMeCompletionDpcRoutine+0x29d:
fffff801`78081b8d 450fb7460e      movzx   r8d,word ptr [r14+0Eh]
fffff801`78081b92 418b4e08        mov     ecx,dword ptr [r14+8]
fffff801`78081b96 458bd8          mov     r11d,r8d
fffff801`78081b99 418b16          mov     edx,dword ptr [r14]
fffff801`78081b9c 418bc0          mov     eax,r8d
fffff801`78081b9f 450fb7560c      movzx   r10d,word ptr [r14+0Ch]
fffff801`78081ba4 48d1e8          shr     rax,1
fffff801`78081ba7 440fb6c8        movzx   r9d,al
fffff801`78081bab 488d0586920100  lea     rax,[stornvme!`string` (fffff801`7809ae38)]
fffff801`78081bb2 49c1eb09        shr     r11,9
fffff801`78081bb6 4183e307        and     r11d,7
fffff801`78081bba 41f6879d10000001 test    byte ptr [r15+109Dh],1
fffff801`78081bc2 4c8d3da7920100  lea     r15,[stornvme!`string` (fffff801`7809ae70)]
fffff801`78081bc9 490f44c7        cmove   rax,r15
fffff801`78081bcd 4533ff          xor     r15d,r15d
fffff801`78081bd0 4c89bc24c8000000 mov     qword ptr [rsp+0C8h],r15
fffff801`78081bd8 4c89bc24c0000000 mov     qword ptr [rsp+0C0h],r15
fffff801`78081be0 4c89bc24b8000000 mov     qword ptr [rsp+0B8h],r15
fffff801`78081be8 4c89bc24b0000000 mov     qword ptr [rsp+0B0h],r15
fffff801`78081bf0 48898c24a8000000 mov     qword ptr [rsp+0A8h],rcx
fffff801`78081bf8 488d0dd9910100  lea     rcx,[stornvme!`string` (fffff801`7809add8)]
fffff801`78081bff 48898c24a0000000 mov     qword ptr [rsp+0A0h],rcx
fffff801`78081c07 488d0dd2910100  lea     rcx,[stornvme!`string` (fffff801`7809ade0)]
fffff801`78081c0e 4889942498000000 mov     qword ptr [rsp+98h],rdx
fffff801`78081c16 488bd3          mov     rdx,rbx
fffff801`78081c19 48898c2490000000 mov     qword ptr [rsp+90h],rcx
fffff801`78081c21 488d0dc0910100  lea     rcx,[stornvme!`string` (fffff801`7809ade8)]
fffff801`78081c28 4c89842488000000 mov     qword ptr [rsp+88h],r8
fffff801`78081c30 4c8bc6          mov     r8,rsi
fffff801`78081c33 48898c2480000000 mov     qword ptr [rsp+80h],rcx
fffff801`78081c3b 488d0dc6910100  lea     rcx,[stornvme!`string` (fffff801`7809ae08)]
fffff801`78081c42 4c895c2478      mov     qword ptr [rsp+78h],r11
fffff801`78081c47 48894c2470      mov     qword ptr [rsp+70h],rcx
fffff801`78081c4c 488d0dcd910100  lea     rcx,[stornvme!`string` (fffff801`7809ae20)]
fffff801`78081c53 4c894c2468      mov     qword ptr [rsp+68h],r9
fffff801`78081c58 4533c9          xor     r9d,r9d
fffff801`78081c5b 48894c2460      mov     qword ptr [rsp+60h],rcx
fffff801`78081c60 488d0d49850100  lea     rcx,[stornvme!`string` (fffff801`7809a1b0)]
fffff801`78081c67 4c89542458      mov     qword ptr [rsp+58h],r10
fffff801`78081c6c 48894c2450      mov     qword ptr [rsp+50h],rcx
fffff801`78081c71 418d4f57        lea     ecx,[r15+57h]
fffff801`78081c75 48897c2448      mov     qword ptr [rsp+48h],rdi
fffff801`78081c7a 44897c2440      mov     dword ptr [rsp+40h],r15d
fffff801`78081c7f c744243804000000 mov     dword ptr [rsp+38h],4
fffff801`78081c87 48c744243010000000 mov   qword ptr [rsp+30h],10h
fffff801`78081c90 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`78081c95 c744242004000000 mov     dword ptr [rsp+20h],4
fffff801`78081c9d 48ff1584e30100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`780a0028)]
fffff801`78081ca4 0f1f440000      nop     dword ptr [rax+rax]
fffff801`78081ca9 440fb7bc2450010000 movzx r15d,word ptr [rsp+150h]

stornvme!NVMeCompletionDpcRoutine+0x3c2:
fffff801`78081cb2 488b8580100000  mov     rax,qword ptr [rbp+1080h]
fffff801`78081cb9 4885c0          test    rax,rax
fffff801`78081cbc 7411            je      stornvme!NVMeCompletionDpcRoutine+0x3df (fffff801`78081ccf)  Branch

stornvme!NVMeCompletionDpcRoutine+0x3ce:
fffff801`78081cbe 4d8bc6          mov     r8,r14
fffff801`78081cc1 488bd7          mov     rdx,rdi
fffff801`78081cc4 488bcb          mov     rcx,rbx
fffff801`78081cc7 ff15d3e30100    call    qword ptr [stornvme!_guard_dispatch_icall_fptr (fffff801`780a00a0)]
fffff801`78081ccd eb07            jmp     stornvme!NVMeCompletionDpcRoutine+0x3e6 (fffff801`78081cd6)  Branch

stornvme!NVMeCompletionDpcRoutine+0x3df:
fffff801`78081ccf 808d9d10000008  or      byte ptr [rbp+109Dh],8

stornvme!NVMeCompletionDpcRoutine+0x3e6:
fffff801`78081cd6 4883bd4010000000 cmp     qword ptr [rbp+1040h],0
fffff801`78081cde 0f86a3000000    jbe     stornvme!NVMeCompletionDpcRoutine+0x497 (fffff801`78081d87)  Branch

stornvme!NVMeCompletionDpcRoutine+0x3f4:
fffff801`78081ce4 33f6            xor     esi,esi
fffff801`78081ce6 4c8d8c24e0000000 lea     r9,[rsp+0E0h]
fffff801`78081cee 4c8d8424d8000000 lea     r8,[rsp+0D8h]
fffff801`78081cf6 488bd3          mov     rdx,rbx
fffff801`78081cf9 8d4e2f          lea     ecx,[rsi+2Fh]
fffff801`78081cfc 48ff1525e30100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`780a0028)]
fffff801`78081d03 0f1f440000      nop     dword ptr [rax+rax]
fffff801`78081d08 40387311        cmp     byte ptr [rbx+11h],sil
fffff801`78081d0c 7441            je      stornvme!NVMeCompletionDpcRoutine+0x45f (fffff801`78081d4f)  Branch

stornvme!NVMeCompletionDpcRoutine+0x41e:
fffff801`78081d0e 488b8540100000  mov     rax,qword ptr [rbp+1040h]
fffff801`78081d15 488b8c24e0000000 mov     rcx,qword ptr [rsp+0E0h]
fffff801`78081d1d 483bc8          cmp     rcx,rax
fffff801`78081d20 7213            jb      stornvme!NVMeCompletionDpcRoutine+0x445 (fffff801`78081d35)  Branch

stornvme!NVMeCompletionDpcRoutine+0x432:
fffff801`78081d22 488b9424d8000000 mov     rdx,qword ptr [rsp+0D8h]
fffff801`78081d2a 482bc8          sub     rcx,rax
fffff801`78081d2d e83e030000      call    stornvme!CalculateTimeDurationIn100ns (fffff801`78082070)
fffff801`78081d32 488bf0          mov     rsi,rax

stornvme!NVMeCompletionDpcRoutine+0x445:
fffff801`78081d35 4c8bcf          mov     r9,rdi
fffff801`78081d38 4c8bc6          mov     r8,rsi
fffff801`78081d3b 488bd3          mov     rdx,rbx
fffff801`78081d3e b906100000      mov     ecx,1006h
fffff801`78081d43 48ff15c6e20100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`780a0010)]
fffff801`78081d4a 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeCompletionDpcRoutine+0x45f:
fffff801`78081d4f 8b4368          mov     eax,dword ptr [rbx+68h]
fffff801`78081d52 a802            test    al,2
fffff801`78081d54 7431            je      stornvme!NVMeCompletionDpcRoutine+0x497 (fffff801`78081d87)  Branch

stornvme!NVMeCompletionDpcRoutine+0x466:
fffff801`78081d56 488b8424e8000000 mov     rax,qword ptr [rsp+0E8h]
fffff801`78081d5e 488bd7          mov     rdx,rdi
fffff801`78081d61 48898558100000  mov     qword ptr [rbp+1058h],rax
fffff801`78081d68 488bcb          mov     rcx,rbx
fffff801`78081d6b 488b8424e0000000 mov     rax,qword ptr [rsp+0E0h]
fffff801`78081d73 48898560100000  mov     qword ptr [rbp+1060h],rax
fffff801`78081d7a 4c8b8424d8000000 mov     r8,qword ptr [rsp+0D8h]
fffff801`78081d82 e839610100      call    stornvme!RecordCommandTimingHistory (fffff801`78097ec0)

stornvme!NVMeCompletionDpcRoutine+0x497:
fffff801`78081d87 f6859d10000008  test    byte ptr [rbp+109Dh],8
fffff801`78081d8e 745e            je      stornvme!NVMeCompletionDpcRoutine+0x4fe (fffff801`78081dee)  Branch

stornvme!NVMeCompletionDpcRoutine+0x4a0:
fffff801`78081d90 488d8328030000  lea     rax,[rbx+328h]
fffff801`78081d97 483bf8          cmp     rdi,rax
fffff801`78081d9a 0f848d000000    je      stornvme!NVMeCompletionDpcRoutine+0x53d (fffff801`78081e2d)  Branch

stornvme!NVMeCompletionDpcRoutine+0x4b0:
fffff801`78081da0 33d2            xor     edx,edx
fffff801`78081da2 0f1f4000        nop     dword ptr [rax]
fffff801`78081da6 66660f1f840000000000 nop word ptr [rax+rax]

stornvme!NVMeCompletionDpcRoutine+0x4c0:
fffff801`78081db0 8bc2            mov     eax,edx
fffff801`78081db2 486bc868        imul    rcx,rax,68h
fffff801`78081db6 488d8390030000  lea     rax,[rbx+390h]
fffff801`78081dbd 4803c1          add     rax,rcx
fffff801`78081dc0 483bf8          cmp     rdi,rax
fffff801`78081dc3 7468            je      stornvme!NVMeCompletionDpcRoutine+0x53d (fffff801`78081e2d)  Branch

stornvme!NVMeCompletionDpcRoutine+0x4d5:
fffff801`78081dc5 ffc2            inc     edx
fffff801`78081dc7 83fa06          cmp     edx,6
fffff801`78081dca 72e4            jb      stornvme!NVMeCompletionDpcRoutine+0x4c0 (fffff801`78081db0)  Branch

stornvme!NVMeCompletionDpcRoutine+0x4dc:
fffff801`78081dcc 4883bc245801000001 cmp   qword ptr [rsp+158h],1
fffff801`78081dd5 4c8bc7          mov     r8,rdi
fffff801`78081dd8 488bd3          mov     rdx,rbx
fffff801`78081ddb 7540            jne     stornvme!NVMeCompletionDpcRoutine+0x52d (fffff801`78081e1d)  Branch

stornvme!NVMeCompletionDpcRoutine+0x4ed:
fffff801`78081ddd b908100000      mov     ecx,1008h
fffff801`78081de2 48ff1527e20100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`780a0010)]
fffff801`78081de9 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeCompletionDpcRoutine+0x4fe:
fffff801`78081dee 33ff            xor     edi,edi

stornvme!NVMeCompletionDpcRoutine+0x500:
fffff801`78081df0 488b8c24f0000000 mov     rcx,qword ptr [rsp+0F0h]
fffff801`78081df8 488b8424f8000000 mov     rax,qword ptr [rsp+0F8h]
fffff801`78081e00 ff01            inc     dword ptr [rcx]
fffff801`78081e02 66f0ff08        lock dec word ptr [rax]
fffff801`78081e06 410fb78daa000000 movzx   ecx,word ptr [r13+0AAh]
fffff801`78081e0e 410fb7c7        movzx   eax,r15w
fffff801`78081e12 ffc8            dec     eax
fffff801`78081e14 3bc8            cmp     ecx,eax
fffff801`78081e16 7d2b            jge     stornvme!NVMeCompletionDpcRoutine+0x553 (fffff801`78081e43)  Branch

stornvme!NVMeCompletionDpcRoutine+0x528:
fffff801`78081e18 66ffc1          inc     cx
fffff801`78081e1b eb3f            jmp     stornvme!NVMeCompletionDpcRoutine+0x56c (fffff801`78081e5c)  Branch

stornvme!NVMeCompletionDpcRoutine+0x52d:
fffff801`78081e1d 33c9            xor     ecx,ecx
fffff801`78081e1f 48ff15eae10100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`780a0010)]
fffff801`78081e26 0f1f440000      nop     dword ptr [rax+rax]
fffff801`78081e2b ebc1            jmp     stornvme!NVMeCompletionDpcRoutine+0x4fe (fffff801`78081dee)  Branch

stornvme!NVMeCompletionDpcRoutine+0x53d:
fffff801`78081e2d 488bd7          mov     rdx,rdi
fffff801`78081e30 488bcb          mov     rcx,rbx
fffff801`78081e33 e8c0f6ffff      call    stornvme!GetLocalCommand (fffff801`780814f8)
fffff801`78081e38 33ff            xor     edi,edi
fffff801`78081e3a 4885c0          test    rax,rax
fffff801`78081e3d 74b1            je      stornvme!NVMeCompletionDpcRoutine+0x500 (fffff801`78081df0)  Branch

stornvme!NVMeCompletionDpcRoutine+0x54f:
fffff801`78081e3f 8938            mov     dword ptr [rax],edi
fffff801`78081e41 ebad            jmp     stornvme!NVMeCompletionDpcRoutine+0x500 (fffff801`78081df0)  Branch

stornvme!NVMeCompletionDpcRoutine+0x553:
fffff801`78081e43 664183bdac00000001 cmp   word ptr [r13+0ACh],1
fffff801`78081e4c 8bc7            mov     eax,edi
fffff801`78081e4e 0fb7cf          movzx   ecx,di
fffff801`78081e51 0f95c0          setne   al
fffff801`78081e54 66418985ac000000 mov     word ptr [r13+0ACh],ax

stornvme!NVMeCompletionDpcRoutine+0x56c:
fffff801`78081e5c 0fb7942448010000 movzx   edx,word ptr [rsp+148h]
fffff801`78081e64 6641898daa000000 mov     word ptr [r13+0AAh],cx
fffff801`78081e6c 66ffc2          inc     dx
fffff801`78081e6f 440fb7f1        movzx   r14d,cx
fffff801`78081e73 49c1e604        shl     r14,4
fffff801`78081e77 4d037500        add     r14,qword ptr [r13]
fffff801`78081e7b 4180bdc800000000 cmp     byte ptr [r13+0C8h],0
fffff801`78081e83 6689942448010000 mov     word ptr [rsp+148h],dx
fffff801`78081e8b 740e            je      stornvme!NVMeCompletionDpcRoutine+0x5ab (fffff801`78081e9b)  Branch

stornvme!NVMeCompletionDpcRoutine+0x59d:
fffff801`78081e8d 0fb7c2          movzx   eax,dx
fffff801`78081e90 3b4344          cmp     eax,dword ptr [rbx+44h]
fffff801`78081e93 450fb6e4        movzx   r12d,r12b
fffff801`78081e97 440f43e7        cmovae  r12d,edi

stornvme!NVMeCompletionDpcRoutine+0x5ab:
fffff801`78081e9b 410fb7460e      movzx   eax,word ptr [r14+0Eh]
fffff801`78081ea0 6683e001        and     ax,1
fffff801`78081ea4 66413b85ac000000 cmp     ax,word ptr [r13+0ACh]
fffff801`78081eac 0f85eefaffff    jne     stornvme!NVMeCompletionDpcRoutine+0xb0 (fffff801`780819a0)  Branch

stornvme!NVMeCompletionDpcRoutine+0x5c2:
fffff801`78081eb2 be01000000      mov     esi,1

stornvme!NVMeCompletionDpcRoutine+0x5c7:
fffff801`78081eb7 410fb785aa000000 movzx   eax,word ptr [r13+0AAh]
fffff801`78081ebf 6641898534010000 mov     word ptr [r13+134h],ax
fffff801`78081ec7 410f1006        movups  xmm0,xmmword ptr [r14]
fffff801`78081ecb 6641899530010000 mov     word ptr [r13+130h],dx
fffff801`78081ed3 410f118548010000 movups  xmmword ptr [r13+148h],xmm0
fffff801`78081edb 6685d2          test    dx,dx
fffff801`78081ede 0f8419010000    je      stornvme!NVMeCompletionDpcRoutine+0x70d (fffff801`78081ffd)  Branch

stornvme!NVMeCompletionDpcRoutine+0x5f4:
fffff801`78081ee4 498b4d10        mov     rcx,qword ptr [r13+10h]
fffff801`78081ee8 0fb7c0          movzx   eax,ax
fffff801`78081eeb 898424d4000000  mov     dword ptr [rsp+0D4h],eax
fffff801`78081ef2 8901            mov     dword ptr [rcx],eax
fffff801`78081ef4 f0830c2400      lock or dword ptr [rsp],0
fffff801`78081ef9 e9ff000000      jmp     stornvme!NVMeCompletionDpcRoutine+0x70d (fffff801`78081ffd)  Branch

stornvme!NVMeCompletionDpcRoutine+0x60e:
fffff801`78081efe 410fb7460e      movzx   eax,word ptr [r14+0Eh]
fffff801`78081f03 be01000000      mov     esi,1
fffff801`78081f08 4889bc24c8000000 mov     qword ptr [rsp+0C8h],rdi
fffff801`78081f10 8bd0            mov     edx,eax
fffff801`78081f12 4889bc24c0000000 mov     qword ptr [rsp+0C0h],rdi
fffff801`78081f1a 4889bc24b8000000 mov     qword ptr [rsp+0B8h],rdi
fffff801`78081f22 4889bc24b0000000 mov     qword ptr [rsp+0B0h],rdi
fffff801`78081f2a 4889bc24a8000000 mov     qword ptr [rsp+0A8h],rdi
fffff801`78081f32 4889bc24a0000000 mov     qword ptr [rsp+0A0h],rdi
fffff801`78081f3a 48d1e8          shr     rax,1
fffff801`78081f3d 0fb6c8          movzx   ecx,al
fffff801`78081f40 48c1ea09        shr     rdx,9
fffff801`78081f44 83e207          and     edx,7
fffff801`78081f47 410fb7c2        movzx   eax,r10w
fffff801`78081f4b 4889942498000000 mov     qword ptr [rsp+98h],rdx
fffff801`78081f53 488d15ae8e0100  lea     rdx,[stornvme!`string` (fffff801`7809ae08)]
fffff801`78081f5a 4889942490000000 mov     qword ptr [rsp+90h],rdx
fffff801`78081f62 488bd3          mov     rdx,rbx
fffff801`78081f65 48898c2488000000 mov     qword ptr [rsp+88h],rcx
fffff801`78081f6d 488d0dac8e0100  lea     rcx,[stornvme!`string` (fffff801`7809ae20)]
fffff801`78081f74 48898c2480000000 mov     qword ptr [rsp+80h],rcx
fffff801`78081f7c 8d4e56          lea     ecx,[rsi+56h]
fffff801`78081f7f 4889442478      mov     qword ptr [rsp+78h],rax
fffff801`78081f84 488d05158f0100  lea     rax,[stornvme!`string` (fffff801`7809aea0)]
fffff801`78081f8b 4889442470      mov     qword ptr [rsp+70h],rax
fffff801`78081f90 488d05198f0100  lea     rax,[stornvme!`string` (fffff801`7809aeb0)]
fffff801`78081f97 450fb7c0        movzx   r8d,r8w
fffff801`78081f9b 4c89442468      mov     qword ptr [rsp+68h],r8
fffff801`78081fa0 4533c0          xor     r8d,r8d
fffff801`78081fa3 4889442460      mov     qword ptr [rsp+60h],rax
fffff801`78081fa8 488d0501820100  lea     rax,[stornvme!`string` (fffff801`7809a1b0)]
fffff801`78081faf 450fb7c9        movzx   r9d,r9w
fffff801`78081fb3 4c894c2458      mov     qword ptr [rsp+58h],r9
fffff801`78081fb8 448bce          mov     r9d,esi
fffff801`78081fbb 4889442450      mov     qword ptr [rsp+50h],rax
fffff801`78081fc0 488d05f98e0100  lea     rax,[stornvme!`string` (fffff801`7809aec0)]
fffff801`78081fc7 48897c2448      mov     qword ptr [rsp+48h],rdi
fffff801`78081fcc 897c2440        mov     dword ptr [rsp+40h],edi
fffff801`78081fd0 c744243802000000 mov     dword ptr [rsp+38h],2
fffff801`78081fd8 4889742430      mov     qword ptr [rsp+30h],rsi
fffff801`78081fdd 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`78081fe2 c744242006000000 mov     dword ptr [rsp+20h],6
fffff801`78081fea 48ff1537e00100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`780a0028)]
fffff801`78081ff1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`78081ff6 eb05            jmp     stornvme!NVMeCompletionDpcRoutine+0x70d (fffff801`78081ffd)  Branch

stornvme!NVMeCompletionDpcRoutine+0x708:
fffff801`78081ff8 be01000000      mov     esi,1

stornvme!NVMeCompletionDpcRoutine+0x70d:
fffff801`78081ffd 807b1201        cmp     byte ptr [rbx+12h],1
fffff801`78082001 4c8bbc2400010000 mov     r15,qword ptr [rsp+100h]
fffff801`78082009 4c8bb42408010000 mov     r14,qword ptr [rsp+108h]
fffff801`78082011 4c8ba42410010000 mov     r12,qword ptr [rsp+110h]
fffff801`78082019 488bbc2418010000 mov     rdi,qword ptr [rsp+118h]
fffff801`78082021 488bac2440010000 mov     rbp,qword ptr [rsp+140h]
fffff801`78082029 7527            jne     stornvme!NVMeCompletionDpcRoutine+0x762 (fffff801`78082052)  Branch

stornvme!NVMeCompletionDpcRoutine+0x73b:
fffff801`7808202b 8b430c          mov     eax,dword ptr [rbx+0Ch]
fffff801`7808202e ffc8            dec     eax
fffff801`78082030 83f801          cmp     eax,1
fffff801`78082033 771d            ja      stornvme!NVMeCompletionDpcRoutine+0x762 (fffff801`78082052)  Branch

stornvme!NVMeCompletionDpcRoutine+0x745:
fffff801`78082035 410fb68da8000000 movzx   ecx,byte ptr [r13+0A8h]
fffff801`7808203d 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff801`78082044 d3e6            shl     esi,cl
fffff801`78082046 897010          mov     dword ptr [rax+10h],esi
fffff801`78082049 f0830c2400      lock or dword ptr [rsp],0
fffff801`7808204e c6431200        mov     byte ptr [rbx+12h],0

stornvme!NVMeCompletionDpcRoutine+0x762:
fffff801`78082052 4881c420010000  add     rsp,120h
fffff801`78082059 415d            pop     r13
fffff801`7808205b 5e              pop     rsi
fffff801`7808205c 5b              pop     rbx
fffff801`7808205d c3              ret
