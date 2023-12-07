112: kd> uf stornvme!ProcessCommandInSpecificQueue
stornvme!ProcessCommandInSpecificQueue:
fffff801`dbee2d20 488bc4          mov     rax,rsp
fffff801`dbee2d23 6644894820      mov     word ptr [rax+20h],r9w
fffff801`dbee2d28 55              push    rbp
fffff801`dbee2d29 53              push    rbx
fffff801`dbee2d2a 4155            push    r13
fffff801`dbee2d2c 488d68a1        lea     rbp,[rax-5Fh]
fffff801`dbee2d30 4881ecb0000000  sub     rsp,0B0h
fffff801`dbee2d37 807a0228        cmp     byte ptr [rdx+2],28h
fffff801`dbee2d3b 488bd9          mov     rbx,rcx       ;DevExt
fffff801`dbee2d3e 488970e0        mov     qword ptr [rax-20h],rsi
fffff801`dbee2d42 488978d8        mov     qword ptr [rax-28h],rdi
fffff801`dbee2d46 488bfa          mov     rdi,rdx       ;Srb
fffff801`dbee2d49 4c8970c8        mov     qword ptr [rax-38h],r14
fffff801`dbee2d4d 4d8bf0          mov     r14,r8        ;Queue VirtualAddress
fffff801`dbee2d50 0f85ac030000    jne     stornvme!ProcessCommandInSpecificQueue+0x3e2 (fffff801`dbee3102)  Branch

stornvme!ProcessCommandInSpecificQueue+0x36:
fffff801`dbee2d56 488b7268        mov     rsi,qword ptr [rdx+68h]

stornvme!ProcessCommandInSpecificQueue+0x3a:
fffff801`dbee2d5a 488bc6          mov     rax,rsi
fffff801`dbee2d5d 25ff0f0000      and     eax,0FFFh ;if Srb+0x68 is PAGE_ALIGNED, goto 0x4e
fffff801`dbee2d62 740a            je      stornvme!ProcessCommandInSpecificQueue+0x4e (fffff801`dbee2d6e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x44:
fffff801`dbee2d64 482bf0          sub     rsi,rax
fffff801`dbee2d67 4881c600100000  add     rsi,1000h

stornvme!ProcessCommandInSpecificQueue+0x4e:
fffff801`dbee2d6e 33c0            xor     eax,eax
fffff801`dbee2d70 c745ef01000000  mov     dword ptr [rbp-11h],1
fffff801`dbee2d77 41b501          mov     r13b,1
fffff801`dbee2d7a 894577          mov     dword ptr [rbp+77h],eax
fffff801`dbee2d7d 488945f7        mov     qword ptr [rbp-9],rax
fffff801`dbee2d81 488945ff        mov     qword ptr [rbp-1],rax
fffff801`dbee2d85 48894507        mov     qword ptr [rbp+7],rax
fffff801`dbee2d89 6641394028      cmp     word ptr [r8+28h],ax
fffff801`dbee2d8e 0f842e030000    je      stornvme!ProcessCommandInSpecificQueue+0x3a2 (fffff801`dbee30c2)  Branch

stornvme!ProcessCommandInSpecificQueue+0x74:
fffff801`dbee2d94 8b4114          mov     eax,dword ptr [rcx+14h]
fffff801`dbee2d97 a810            test    al,10h
fffff801`dbee2d99 0f85374d0000    jne     stornvme!ProcessCommandInSpecificQueue+0x4db6 (fffff801`dbee7ad6)  Branch

stornvme!ProcessCommandInSpecificQueue+0x7f:
fffff801`dbee2d9f 0fbae008        bt      eax,8
fffff801`dbee2da3 0f82394d0000    jb      stornvme!ProcessCommandInSpecificQueue+0x4dc2 (fffff801`dbee7ae2)  Branch

stornvme!ProcessCommandInSpecificQueue+0x89:
fffff801`dbee2da9 4d8d4838        lea     r9,[r8+38h]
fffff801`dbee2dad 4c89a42498000000 mov     qword ptr [rsp+98h],r12
fffff801`dbee2db5 41b801000000    mov     r8d,1
fffff801`dbee2dbb 488d45ef        lea     rax,[rbp-11h]
fffff801`dbee2dbf 488bd3          mov     rdx,rbx
fffff801`dbee2dc2 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`dbee2dc7 418d485c        lea     ecx,[r8+5Ch]              ;ExtFunctionAcquireSpinLock
fffff801`dbee2dcb 48ff1556c20100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`dbeff028)]
fffff801`dbee2dd2 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee2dd7 410fb74628      movzx   eax,word ptr [r14+28h]
fffff801`dbee2ddc 6685c0          test    ax,ax
fffff801`dbee2ddf 0f84ea020000    je      stornvme!ProcessCommandInSpecificQueue+0x3af (fffff801`dbee30cf)  Branch

stornvme!ProcessCommandInSpecificQueue+0xc5:
fffff801`dbee2de5 440fb78306010000 movzx   r8d,word ptr [rbx+106h]
fffff801`dbee2ded 0fb7c0          movzx   eax,ax
fffff801`dbee2df0 4869c888000000  imul    rcx,rax,88h
fffff801`dbee2df7 488b83f0020000  mov     rax,qword ptr [rbx+2F0h]
fffff801`dbee2dfe 4c8d58a4        lea     r11,[rax-5Ch]
fffff801`dbee2e02 4c8d50a8        lea     r10,[rax-58h]
fffff801`dbee2e06 4c03d9          add     r11,rcx
fffff801`dbee2e09 4c8d6098        lea     r12,[rax-68h]
fffff801`dbee2e0d 4c03d1          add     r10,rcx
fffff801`dbee2e10 4c03e1          add     r12,rcx
fffff801`dbee2e13 4883c0a6        add     rax,0FFFFFFFFFFFFFFA6h
fffff801`dbee2e17 4803c1          add     rax,rcx

stornvme!ProcessCommandInSpecificQueue+0xfa:
fffff801`dbee2e1a 0fb710          movzx   edx,word ptr [rax]
fffff801`dbee2e1d 450fb70b        movzx   r9d,word ptr [r11]
fffff801`dbee2e21 8bc2            mov     eax,edx
fffff801`dbee2e23 4c89bc2488000000 mov     qword ptr [rsp+88h],r15
fffff801`dbee2e2b 418d4901        lea     ecx,[r9+1]
fffff801`dbee2e2f 3bd1            cmp     edx,ecx
fffff801`dbee2e31 0f841f4e0000    je      stornvme!ProcessCommandInSpecificQueue+0x4f36 (fffff801`dbee7c56)  Branch

stornvme!ProcessCommandInSpecificQueue+0x117:
fffff801`dbee2e37 6685d2          test    dx,dx
fffff801`dbee2e3a 0f844e020000    je      stornvme!ProcessCommandInSpecificQueue+0x36e (fffff801`dbee308e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x120:
fffff801`dbee2e40 418d4101        lea     eax,[r9+1]
fffff801`dbee2e44 33c9            xor     ecx,ecx
fffff801`dbee2e46 66418903        mov     word ptr [r11],ax
fffff801`dbee2e4a 66413bc0        cmp     ax,r8w
fffff801`dbee2e4e 0f844e020000    je      stornvme!ProcessCommandInSpecificQueue+0x382 (fffff801`dbee30a2)  Branch

stornvme!ProcessCommandInSpecificQueue+0x134:
fffff801`dbee2e54 410fb712        movzx   edx,word ptr [r10]
fffff801`dbee2e58 66413bd0        cmp     dx,r8w
fffff801`dbee2e5c 0f838c4c0000    jae     stornvme!ProcessCommandInSpecificQueue+0x4dce (fffff801`dbee7aee)  Branch

stornvme!ProcessCommandInSpecificQueue+0x142:
fffff801`dbee2e62 4d8b3c24        mov     r15,qword ptr [r12]

stornvme!ProcessCommandInSpecificQueue+0x146:
fffff801`dbee2e66 0fb7c2          movzx   eax,dx
fffff801`dbee2e69 8d4a01          lea     ecx,[rdx+1]
fffff801`dbee2e6c 48c1e004        shl     rax,4
fffff801`dbee2e70 4a833c3800      cmp     qword ptr [rax+r15],0
fffff801`dbee2e75 0f8590020000    jne     stornvme!ProcessCommandInSpecificQueue+0x3eb (fffff801`dbee310b)  Branch

stornvme!ProcessCommandInSpecificQueue+0x15b:
fffff801`dbee2e7b 4533e4          xor     r12d,r12d
fffff801`dbee2e7e 6641890a        mov     word ptr [r10],cx
fffff801`dbee2e82 66413bc8        cmp     cx,r8w
fffff801`dbee2e86 0f841f020000    je      stornvme!ProcessCommandInSpecificQueue+0x38b (fffff801`dbee30ab)  Branch

stornvme!ProcessCommandInSpecificQueue+0x16c:
fffff801`dbee2e8c 33c0            xor     eax,eax
fffff801`dbee2e8e 6644898e98100000 mov     word ptr [rsi+1098h],r9w
fffff801`dbee2e96 66899696100000  mov     word ptr [rsi+1096h],dx
fffff801`dbee2e9d 4d8bfc          mov     r15,r12
fffff801`dbee2ea0 488945e7        mov     qword ptr [rbp-19h],rax
fffff801`dbee2ea4 6641394628      cmp     word ptr [r14+28h],ax
fffff801`dbee2ea9 761d            jbe     stornvme!ProcessCommandInSpecificQueue+0x1a8 (fffff801`dbee2ec8)  Branch

stornvme!ProcessCommandInSpecificQueue+0x18b:
fffff801`dbee2eab 410fb74632      movzx   eax,word ptr [r14+32h]
fffff801`dbee2eb0 4c8bbbf8020000  mov     r15,qword ptr [rbx+2F8h]
fffff801`dbee2eb7 4869c858010000  imul    rcx,rax,158h
fffff801`dbee2ebe 4981c7a8feffff  add     r15,0FFFFFFFFFFFFFEA8h
fffff801`dbee2ec5 4c03f9          add     r15,rcx

stornvme!ProcessCommandInSpecificQueue+0x1a8:
fffff801`dbee2ec8 66899602100000  mov     word ptr [rsi+1002h],dx
fffff801`dbee2ecf 807b1100        cmp     byte ptr [rbx+11h],0
fffff801`dbee2ed3 7412            je      stornvme!ProcessCommandInSpecificQueue+0x1c7 (fffff801`dbee2ee7)  Branch

stornvme!ProcessCommandInSpecificQueue+0x1b5:
fffff801`dbee2ed5 488bd7          mov     rdx,rdi
fffff801`dbee2ed8 488bcb          mov     rcx,rbx
fffff801`dbee2edb e850020000      call    stornvme!ProcessCommandTrace (fffff801`dbee3130)
fffff801`dbee2ee0 0fb79696100000  movzx   edx,word ptr [rsi+1096h]

stornvme!ProcessCommandInSpecificQueue+0x1c7:
fffff801`dbee2ee7 498b4620        mov     rax,qword ptr [r14+20h]
fffff801`dbee2eeb 0fb7ca          movzx   ecx,dx
fffff801`dbee2eee 4803c9          add     rcx,rcx
fffff801`dbee2ef1 48893cc8        mov     qword ptr [rax+rcx*8],rdi
fffff801`dbee2ef5 0fb79696100000  movzx   edx,word ptr [rsi+1096h]
fffff801`dbee2efc 498b4e20        mov     rcx,qword ptr [r14+20h]
fffff801`dbee2f00 4803d2          add     rdx,rdx
fffff801`dbee2f03 0fb78698100000  movzx   eax,word ptr [rsi+1098h]
fffff801`dbee2f0a 668944d108      mov     word ptr [rcx+rdx*8+8],ax
fffff801`dbee2f0f 498b4618        mov     rax,qword ptr [r14+18h]
fffff801`dbee2f13 0fb78e98100000  movzx   ecx,word ptr [rsi+1098h]
fffff801`dbee2f1a 0f108600100000  movups  xmm0,xmmword ptr [rsi+1000h]
fffff801`dbee2f21 4803c9          add     rcx,rcx
fffff801`dbee2f24 488b14c8        mov     rdx,qword ptr [rax+rcx*8]
fffff801`dbee2f28 0f1102          movups  xmmword ptr [rdx],xmm0
fffff801`dbee2f2b 0f108e10100000  movups  xmm1,xmmword ptr [rsi+1010h]
fffff801`dbee2f32 0f114a10        movups  xmmword ptr [rdx+10h],xmm1
fffff801`dbee2f36 0f108620100000  movups  xmm0,xmmword ptr [rsi+1020h]
fffff801`dbee2f3d 0f114220        movups  xmmword ptr [rdx+20h],xmm0
fffff801`dbee2f41 0f108e30100000  movups  xmm1,xmmword ptr [rsi+1030h]
fffff801`dbee2f48 0f114a30        movups  xmmword ptr [rdx+30h],xmm1
fffff801`dbee2f4c 0fb79698100000  movzx   edx,word ptr [rsi+1098h]
fffff801`dbee2f53 498b4e18        mov     rcx,qword ptr [r14+18h]
fffff801`dbee2f57 4803d2          add     rdx,rdx
fffff801`dbee2f5a 0fb78696100000  movzx   eax,word ptr [rsi+1096h]
fffff801`dbee2f61 668944d108      mov     word ptr [rcx+rdx*8+8],ax
fffff801`dbee2f66 807b1100        cmp     byte ptr [rbx+11h],0
fffff801`dbee2f6a 0f84d04b0000    je      stornvme!ProcessCommandInSpecificQueue+0x4e20 (fffff801`dbee7b40)  Branch

stornvme!ProcessCommandInSpecificQueue+0x250:
fffff801`dbee2f70 488d8328030000  lea     rax,[rbx+328h]
fffff801`dbee2f77 483bf8          cmp     rdi,rax
fffff801`dbee2f7a 7445            je      stornvme!ProcessCommandInSpecificQueue+0x2a1 (fffff801`dbee2fc1)  Branch

stornvme!ProcessCommandInSpecificQueue+0x25c:
fffff801`dbee2f7c 418bc4          mov     eax,r12d
fffff801`dbee2f7f 90              nop

stornvme!ProcessCommandInSpecificQueue+0x260:
fffff801`dbee2f80 8bc8            mov     ecx,eax
fffff801`dbee2f82 486bd168        imul    rdx,rcx,68h
fffff801`dbee2f86 488d8b90030000  lea     rcx,[rbx+390h]
fffff801`dbee2f8d 4803ca          add     rcx,rdx
fffff801`dbee2f90 483bf9          cmp     rdi,rcx
fffff801`dbee2f93 742c            je      stornvme!ProcessCommandInSpecificQueue+0x2a1 (fffff801`dbee2fc1)  Branch

stornvme!ProcessCommandInSpecificQueue+0x275:
fffff801`dbee2f95 ffc0            inc     eax
fffff801`dbee2f97 83f806          cmp     eax,6
fffff801`dbee2f9a 72e4            jb      stornvme!ProcessCommandInSpecificQueue+0x260 (fffff801`dbee2f80)  Branch

stornvme!ProcessCommandInSpecificQueue+0x27c:
fffff801`dbee2f9c 4533c0          xor     r8d,r8d
fffff801`dbee2f9f 4c8d4de7        lea     r9,[rbp-19h]
fffff801`dbee2fa3 488bd3          mov     rdx,rbx
fffff801`dbee2fa6 418d482f        lea     ecx,[r8+2Fh]
fffff801`dbee2faa 48ff1577c00100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`dbeff028)]
fffff801`dbee2fb1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee2fb6 488b45e7        mov     rax,qword ptr [rbp-19h]
fffff801`dbee2fba 48898640100000  mov     qword ptr [rsi+1040h],rax

stornvme!ProcessCommandInSpecificQueue+0x2a1:
fffff801`dbee2fc1 66f041ff8680000000 lock inc word ptr [r14+80h]
fffff801`dbee2fca 0fb78e98100000  movzx   ecx,word ptr [rsi+1098h]
fffff801`dbee2fd1 ffc1            inc     ecx
fffff801`dbee2fd3 334d77          xor     ecx,dword ptr [rbp+77h]
fffff801`dbee2fd6 0fb7d1          movzx   edx,cx
fffff801`dbee2fd9 335577          xor     edx,dword ptr [rbp+77h]
fffff801`dbee2fdc 895577          mov     dword ptr [rbp+77h],edx
fffff801`dbee2fdf 663b557f        cmp     dx,word ptr [rbp+7Fh]
fffff801`dbee2fe3 0f84cb000000    je      stornvme!ProcessCommandInSpecificQueue+0x394 (fffff801`dbee30b4)  Branch

stornvme!ProcessCommandInSpecificQueue+0x2c9:
fffff801`dbee2fe9 498b4610        mov     rax,qword ptr [r14+10h]
fffff801`dbee2fed 8910            mov     dword ptr [rax],edx
fffff801`dbee2fef f0830c2400      lock or dword ptr [rsp],0
fffff801`dbee2ff4 4883be4010000000 cmp     qword ptr [rsi+1040h],0
fffff801`dbee2ffc 7625            jbe     stornvme!ProcessCommandInSpecificQueue+0x303 (fffff801`dbee3023)  Branch

stornvme!ProcessCommandInSpecificQueue+0x2de:
fffff801`dbee2ffe 4533c0          xor     r8d,r8d
fffff801`dbee3001 4c8d4de7        lea     r9,[rbp-19h]
fffff801`dbee3005 488bd3          mov     rdx,rbx
fffff801`dbee3008 418d482f        lea     ecx,[r8+2Fh]
fffff801`dbee300c 48ff1515c00100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`dbeff028)]
fffff801`dbee3013 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee3018 488b45e7        mov     rax,qword ptr [rbp-19h]
fffff801`dbee301c 48898648100000  mov     qword ptr [rsi+1048h],rax

stornvme!ProcessCommandInSpecificQueue+0x303:
fffff801`dbee3023 4c8d45ef        lea     r8,[rbp-11h]
fffff801`dbee3027 488bd3          mov     rdx,rbx
fffff801`dbee302a b904100000      mov     ecx,1004h             ;ReleaseSpinLock
fffff801`dbee302f 48ff15dabf0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`dbeff010)]
fffff801`dbee3036 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee303b 4d85ff          test    r15,r15
fffff801`dbee303e 740e            je      stornvme!ProcessCommandInSpecificQueue+0x32e (fffff801`dbee304e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x320:
fffff801`dbee3040 4180bfc800000000 cmp     byte ptr [r15+0C8h],0
fffff801`dbee3048 0f85024b0000    jne     stornvme!ProcessCommandInSpecificQueue+0x4e30 (fffff801`dbee7b50)  Branch

stornvme!ProcessCommandInSpecificQueue+0x32e:
fffff801`dbee304e 4c8bbc2488000000 mov     r15,qword ptr [rsp+88h]
fffff801`dbee3056 4c8ba42498000000 mov     r12,qword ptr [rsp+98h]

stornvme!ProcessCommandInSpecificQueue+0x33e:
fffff801`dbee305e 6641837e2800    cmp     word ptr [r14+28h],0
fffff801`dbee3064 410fb6c5        movzx   eax,r13b
fffff801`dbee3068 4c8bb42490000000 mov     r14,qword ptr [rsp+90h]
fffff801`dbee3070 488bbc24a0000000 mov     rdi,qword ptr [rsp+0A0h]
fffff801`dbee3078 488bb424a8000000 mov     rsi,qword ptr [rsp+0A8h]
fffff801`dbee3080 7476            je      stornvme!ProcessCommandInSpecificQueue+0x3d8 (fffff801`dbee30f8)  Branch

stornvme!ProcessCommandInSpecificQueue+0x362:
fffff801`dbee3082 4881c4b0000000  add     rsp,0B0h
fffff801`dbee3089 415d            pop     r13
fffff801`dbee308b 5b              pop     rbx
fffff801`dbee308c 5d              pop     rbp
fffff801`dbee308d c3              ret

stornvme!ProcessCommandInSpecificQueue+0x36e:
fffff801`dbee308e 410fb7c0        movzx   eax,r8w
fffff801`dbee3092 ffc8            dec     eax
fffff801`dbee3094 443bc8          cmp     r9d,eax
fffff801`dbee3097 0f85a3fdffff    jne     stornvme!ProcessCommandInSpecificQueue+0x120 (fffff801`dbee2e40)  Branch

stornvme!ProcessCommandInSpecificQueue+0x37d:
fffff801`dbee309d e9b44b0000      jmp     stornvme!ProcessCommandInSpecificQueue+0x4f36 (fffff801`dbee7c56)  Branch

stornvme!ProcessCommandInSpecificQueue+0x382:
fffff801`dbee30a2 6641890b        mov     word ptr [r11],cx
fffff801`dbee30a6 e9a9fdffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x134 (fffff801`dbee2e54)  Branch

stornvme!ProcessCommandInSpecificQueue+0x38b:
fffff801`dbee30ab 66458922        mov     word ptr [r10],r12w
fffff801`dbee30af e9d8fdffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x16c (fffff801`dbee2e8c)  Branch

stornvme!ProcessCommandInSpecificQueue+0x394:
fffff801`dbee30b4 81e20000ffff    and     edx,0FFFF0000h
fffff801`dbee30ba 895577          mov     dword ptr [rbp+77h],edx
fffff801`dbee30bd e927ffffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x2c9 (fffff801`dbee2fe9)  Branch

stornvme!ProcessCommandInSpecificQueue+0x3a2:
fffff801`dbee30c2 66f0ff8118030000 lock inc word ptr [rcx+318h]
fffff801`dbee30ca e9c5fcffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x74 (fffff801`dbee2d94)  Branch

stornvme!ProcessCommandInSpecificQueue+0x3af:
fffff801`dbee30cf 440fb78304010000 movzx   r8d,word ptr [rbx+104h]
fffff801`dbee30d7 4c8d9b3c010000  lea     r11,[rbx+13Ch]
fffff801`dbee30de 4c8d9340010000  lea     r10,[rbx+140h]
fffff801`dbee30e5 4c8da330010000  lea     r12,[rbx+130h]
fffff801`dbee30ec 488d833e010000  lea     rax,[rbx+13Eh]
fffff801`dbee30f3 e922fdffff      jmp     stornvme!ProcessCommandInSpecificQueue+0xfa (fffff801`dbee2e1a)  Branch

stornvme!ProcessCommandInSpecificQueue+0x3d8:
fffff801`dbee30f8 66f0ff8b18030000 lock dec word ptr [rbx+318h]
fffff801`dbee3100 eb80            jmp     stornvme!ProcessCommandInSpecificQueue+0x362 (fffff801`dbee3082)  Branch

stornvme!ProcessCommandInSpecificQueue+0x3e2:
fffff801`dbee3102 488b7238        mov     rsi,qword ptr [rdx+38h]
fffff801`dbee3106 e94ffcffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x3a (fffff801`dbee2d5a)  Branch

stornvme!ProcessCommandInSpecificQueue+0x3eb:
fffff801`dbee310b 0fb7d1          movzx   edx,cx
fffff801`dbee310e 66413bc8        cmp     cx,r8w
fffff801`dbee3112 0f824efdffff    jb      stornvme!ProcessCommandInSpecificQueue+0x146 (fffff801`dbee2e66)  Branch

stornvme!ProcessCommandInSpecificQueue+0x3f8:
fffff801`dbee3118 33c9            xor     ecx,ecx
fffff801`dbee311a e9cf490000      jmp     stornvme!ProcessCommandInSpecificQueue+0x4dce (fffff801`dbee7aee)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4db6:
fffff801`dbee7ad6 c642030e        mov     byte ptr [rdx+3],0Eh
fffff801`dbee7ada 4532ed          xor     r13b,r13b
fffff801`dbee7add e97cb5ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x33e (fffff801`dbee305e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4dc2:
fffff801`dbee7ae2 c6420304        mov     byte ptr [rdx+3],4
fffff801`dbee7ae6 4532ed          xor     r13b,r13b
fffff801`dbee7ae9 e970b5ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x33e (fffff801`dbee305e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4dce:
fffff801`dbee7aee 8bd1            mov     edx,ecx
fffff801`dbee7af0 66413b0a        cmp     cx,word ptr [r10]
fffff801`dbee7af4 731e            jae     stornvme!ProcessCommandInSpecificQueue+0x4df4 (fffff801`dbee7b14)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4dd6:
fffff801`dbee7af6 4d8b3c24        mov     r15,qword ptr [r12]

stornvme!ProcessCommandInSpecificQueue+0x4dda:
fffff801`dbee7afa 0fb7c2          movzx   eax,dx
fffff801`dbee7afd 8d4a01          lea     ecx,[rdx+1]
fffff801`dbee7b00 48c1e004        shl     rax,4
fffff801`dbee7b04 4a833c3800      cmp     qword ptr [rax+r15],0
fffff801`dbee7b09 741f            je      stornvme!ProcessCommandInSpecificQueue+0x4e0a (fffff801`dbee7b2a)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4deb:
fffff801`dbee7b0b 0fb7d1          movzx   edx,cx
fffff801`dbee7b0e 66413b0a        cmp     cx,word ptr [r10]
fffff801`dbee7b12 72e6            jb      stornvme!ProcessCommandInSpecificQueue+0x4dda (fffff801`dbee7afa)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4df4:
fffff801`dbee7b14 410fb703        movzx   eax,word ptr [r11]
fffff801`dbee7b18 6685c0          test    ax,ax
fffff801`dbee7b1b 0f852d010000    jne     stornvme!ProcessCommandInSpecificQueue+0x4f2e (fffff801`dbee7c4e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e01:
fffff801`dbee7b21 6641ffc8        dec     r8w
fffff801`dbee7b25 e928010000      jmp     stornvme!ProcessCommandInSpecificQueue+0x4f32 (fffff801`dbee7c52)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e0a:
fffff801`dbee7b2a 4533e4          xor     r12d,r12d
fffff801`dbee7b2d 6641890a        mov     word ptr [r10],cx
fffff801`dbee7b31 66413bc8        cmp     cx,r8w
fffff801`dbee7b35 0f8551b3ffff    jne     stornvme!ProcessCommandInSpecificQueue+0x16c (fffff801`dbee2e8c)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e1b:
fffff801`dbee7b3b e96bb5ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x38b (fffff801`dbee30ab)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e20:
fffff801`dbee7b40 8b4368          mov     eax,dword ptr [rbx+68h]
fffff801`dbee7b43 a802            test    al,2
fffff801`dbee7b45 0f8476b4ffff    je      stornvme!ProcessCommandInSpecificQueue+0x2a1 (fffff801`dbee2fc1)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e2b:
fffff801`dbee7b4b e920b4ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x250 (fffff801`dbee2f70)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e30:
fffff801`dbee7b50 4c8d456f        lea     r8,[rbp+6Fh]
fffff801`dbee7b54 4489656f        mov     dword ptr [rbp+6Fh],r12d
fffff801`dbee7b58 488bd3          mov     rdx,rbx
fffff801`dbee7b5b b95c000000      mov     ecx,5Ch           ;ExtFunctionGetCurrentProcessorIndex
fffff801`dbee7b60 48ff15c1740100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`dbeff028)]
fffff801`dbee7b67 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee7b6c 498b8fd0000000  mov     rcx,qword ptr [r15+0D0h]
fffff801`dbee7b73 4885c9          test    rcx,rcx
fffff801`dbee7b76 0f8592000000    jne     stornvme!ProcessCommandInSpecificQueue+0x4eee (fffff801`dbee7c0e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e5c:
fffff801`dbee7b7c 8b839c0e0000    mov     eax,dword ptr [rbx+0E9Ch]
fffff801`dbee7b82 a810            test    al,10h
fffff801`dbee7b84 7451            je      stornvme!ProcessCommandInSpecificQueue+0x4eb7 (fffff801`dbee7bd7)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e66:
fffff801`dbee7b86 8b456f          mov     eax,dword ptr [rbp+6Fh]
fffff801`dbee7b89 488d0c40        lea     rcx,[rax+rax*2]
fffff801`dbee7b8d 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff801`dbee7b94 4803c9          add     rcx,rcx
fffff801`dbee7b97 488b54c808      mov     rdx,qword ptr [rax+rcx*8+8]
fffff801`dbee7b9c 4885d2          test    rdx,rdx
fffff801`dbee7b9f 7436            je      stornvme!ProcessCommandInSpecificQueue+0x4eb7 (fffff801`dbee7bd7)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4e81:
fffff801`dbee7ba1 4533c0          xor     r8d,r8d
fffff801`dbee7ba4 4c8d4ddb        lea     r9,[rbp-25h]
fffff801`dbee7ba8 448945db        mov     dword ptr [rbp-25h],r8d
fffff801`dbee7bac 4d8d87d8000000  lea     r8,[r15+0D8h]
fffff801`dbee7bb3 0fb744c810      movzx   eax,word ptr [rax+rcx*8+10h]
fffff801`dbee7bb8 b90b100000      mov     ecx,100Bh         ;type == SetTargetProcessorDpc
fffff801`dbee7bbd 668945db        mov     word ptr [rbp-25h],ax
fffff801`dbee7bc1 480fbcc2        bsf     rax,rdx
fffff801`dbee7bc5 488bd3          mov     rdx,rbx
fffff801`dbee7bc8 8945dd          mov     dword ptr [rbp-23h],eax
fffff801`dbee7bcb 48ff153e740100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`dbeff010)]
fffff801`dbee7bd2 0f1f440000      nop     dword ptr [rax+rax]

stornvme!ProcessCommandInSpecificQueue+0x4eb7:
fffff801`dbee7bd7 448b4d6f        mov     r9d,dword ptr [rbp+6Fh]
fffff801`dbee7bdb 488d45d7        lea     rax,[rbp-29h]
fffff801`dbee7bdf 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`dbee7be4 4d8d87d8000000  lea     r8,[r15+0D8h]
fffff801`dbee7beb 488bd3          mov     rdx,rbx
fffff801`dbee7bee 4c89642420      mov     qword ptr [rsp+20h],r12
fffff801`dbee7bf3 b902100000      mov     ecx,1002h                 ;StorportIssueDPC
fffff801`dbee7bf8 448965d7        mov     dword ptr [rbp-29h],r12d
fffff801`dbee7bfc 48ff150d740100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`dbeff010)]        
fffff801`dbee7c03 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee7c08 90              nop
fffff801`dbee7c09 e940b4ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x32e (fffff801`dbee304e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4eee:
fffff801`dbee7c0e 418b87cc000000  mov     eax,dword ptr [r15+0CCh]
fffff801`dbee7c15 488bd3          mov     rdx,rbx
fffff801`dbee7c18 448b456f        mov     r8d,dword ptr [rbp+6Fh]
fffff801`dbee7c1c 4c6bc8f6        imul    r9,rax,0FFFFFFFFFFFFFFF6h
fffff801`dbee7c20 4e8b04c1        mov     r8,qword ptr [rcx+r8*8]
fffff801`dbee7c24 488d4567        lea     rax,[rbp+67h]
fffff801`dbee7c28 4889442430      mov     qword ptr [rsp+30h],rax
fffff801`dbee7c2d b959000000      mov     ecx,59h               ;ExtFunctionRequestHighResolutionTimer
fffff801`dbee7c32 4c89642428      mov     qword ptr [rsp+28h],r12
fffff801`dbee7c37 4c89642420      mov     qword ptr [rsp+20h],r12
fffff801`dbee7c3c 48ff15e5730100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`dbeff028)]
fffff801`dbee7c43 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee7c48 90              nop
fffff801`dbee7c49 e900b4ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x32e (fffff801`dbee304e)  Branch

stornvme!ProcessCommandInSpecificQueue+0x4f2e:
fffff801`dbee7c4e 448d40ff        lea     r8d,[rax-1]

stornvme!ProcessCommandInSpecificQueue+0x4f32:
fffff801`dbee7c52 66458903        mov     word ptr [r11],r8w

stornvme!ProcessCommandInSpecificQueue+0x4f36:
fffff801`dbee7c56 4c8d45ef        lea     r8,[rbp-11h]
fffff801`dbee7c5a 488bd3          mov     rdx,rbx
fffff801`dbee7c5d b904100000      mov     ecx,1004h         ;ReleaseSpinLock
fffff801`dbee7c62 48ff15a7730100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`dbeff010)]
fffff801`dbee7c69 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbee7c6e 4532ed          xor     r13b,r13b
fffff801`dbee7c71 c6470305        mov     byte ptr [rdi+3],5
fffff801`dbee7c75 e9d4b3ffff      jmp     stornvme!ProcessCommandInSpecificQueue+0x32e (fffff801`dbee304e)  Branch
