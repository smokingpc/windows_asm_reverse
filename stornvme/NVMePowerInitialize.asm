1: kd> uf stornvme!NVMePowerInitialize
stornvme!NVMePowerInitialize:
fffff808`7144ebf4 4055            push    rbp
fffff808`7144ebf6 53              push    rbx
fffff808`7144ebf7 56              push    rsi
fffff808`7144ebf8 57              push    rdi
fffff808`7144ebf9 4154            push    r12
fffff808`7144ebfb 4155            push    r13
fffff808`7144ebfd 4156            push    r14
fffff808`7144ebff 4157            push    r15
fffff808`7144ec01 488d6c24e1      lea     rbp,[rsp-1Fh]
fffff808`7144ec06 4881ece8000000  sub     rsp,0E8h
fffff808`7144ec0d 4c8ba9f8050000  mov     r13,qword ptr [rcx+5F8h]
fffff808`7144ec14 33d2            xor     edx,edx
fffff808`7144ec16 488bf9          mov     rdi,rcx
fffff808`7144ec19 4889557f        mov     qword ptr [rbp+7Fh],rdx
fffff808`7144ec1d 8b494c          mov     ecx,dword ptr [rcx+4Ch]
fffff808`7144ec20 4183ceff        or      r14d,0FFFFFFFFh
fffff808`7144ec24 48895507        mov     qword ptr [rbp+7],rdx
fffff808`7144ec28 448afa          mov     r15b,dl
fffff808`7144ec2b 885577          mov     byte ptr [rbp+77h],dl
fffff808`7144ec2e 8d7201          lea     esi,[rdx+1]
fffff808`7144ec31 88556f          mov     byte ptr [rbp+6Fh],dl
fffff808`7144ec34 448aca          mov     r9b,dl
fffff808`7144ec37 885567          mov     byte ptr [rbp+67h],dl
fffff808`7144ec3a 83f904          cmp     ecx,4
fffff808`7144ec3d 0f8478060000    je      stornvme!NVMePowerInitialize+0x6c7 (fffff808`7144f2bb)  Branch

stornvme!NVMePowerInitialize+0x4f:
fffff808`7144ec43 8b879c0e0000    mov     eax,dword ptr [rdi+0E9Ch]
fffff808`7144ec49 0fbae008        bt      eax,8
fffff808`7144ec4d 0f8268060000    jb      stornvme!NVMePowerInitialize+0x6c7 (fffff808`7144f2bb)  Branch

stornvme!NVMePowerInitialize+0x5f:
fffff808`7144ec53 83f903          cmp     ecx,3
fffff808`7144ec56 7543            jne     stornvme!NVMePowerInitialize+0xa7 (fffff808`7144ec9b)  Branch

stornvme!NVMePowerInitialize+0x64:
fffff808`7144ec58 488bcf          mov     rcx,rdi
fffff808`7144ec5b e89c680000      call    stornvme!NVMeGetAutoPowerStateTransition (fffff808`714554fc)
fffff808`7144ec60 8b9720060000    mov     edx,dword ptr [rdi+620h]
fffff808`7144ec66 f6c240          test    dl,40h
fffff808`7144ec69 7513            jne     stornvme!NVMePowerInitialize+0x8a (fffff808`7144ec7e)  Branch

stornvme!NVMePowerInitialize+0x77:
fffff808`7144ec6b 408ad6          mov     dl,sil
fffff808`7144ec6e 488bcf          mov     rcx,rdi
fffff808`7144ec71 e8b2850000      call    stornvme!NVMeSetAutoPowerStateTransition (fffff808`71457228)
fffff808`7144ec76 488bcf          mov     rcx,rdi
fffff808`7144ec79 e87e680000      call    stornvme!NVMeGetAutoPowerStateTransition (fffff808`714554fc)

stornvme!NVMePowerInitialize+0x8a:
fffff808`7144ec7e 488d1593bc0000  lea     rdx,[stornvme!`string` (fffff808`7145a918)]
fffff808`7144ec85 b903000000      mov     ecx,3
fffff808`7144ec8a 48ff159f130100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff808`71460030)]
fffff808`7144ec91 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144ec96 e920060000      jmp     stornvme!NVMePowerInitialize+0x6c7 (fffff808`7144f2bb)  Branch

stornvme!NVMePowerInitialize+0xa7:
fffff808`7144ec9b 8b8720060000    mov     eax,dword ptr [rdi+620h]
fffff808`7144eca1 4084c6          test    sil,al
fffff808`7144eca4 0f8511060000    jne     stornvme!NVMePowerInitialize+0x6c7 (fffff808`7144f2bb)  Branch

stornvme!NVMePowerInitialize+0xb6:
fffff808`7144ecaa 410fb68507010000 movzx   eax,byte ptr [r13+107h]
fffff808`7144ecb2 448ae2          mov     r12b,dl
fffff808`7144ecb5 03c6            add     eax,esi
fffff808`7144ecb7 0f8473010000    je      stornvme!NVMePowerInitialize+0x23c (fffff808`7144ee30)  Branch

stornvme!NVMePowerInitialize+0xc9:
fffff808`7144ecbd 418ad4          mov     dl,r12b
fffff808`7144ecc0 488bcf          mov     rcx,rdi
fffff808`7144ecc3 e8f0f7ffff      call    stornvme!NVMeGetPowerState (fffff808`7144e4b8)
fffff808`7144ecc8 488bc8          mov     rcx,rax
fffff808`7144eccb 4c8bd0          mov     r10,rax
fffff808`7144ecce e88d090000      call    stornvme!NVMePowerStateGetMaxPower (fffff808`7144f660)
fffff808`7144ecd3 418a5a03        mov     bl,byte ptr [r10+3]
fffff808`7144ecd7 448bd8          mov     r11d,eax
fffff808`7144ecda f6c302          test    bl,2
fffff808`7144ecdd 7509            jne     stornvme!NVMePowerInitialize+0xf4 (fffff808`7144ece8)  Branch

stornvme!NVMePowerInitialize+0xeb:
fffff808`7144ecdf 4402fe          add     r15b,sil
fffff808`7144ece2 4488656f        mov     byte ptr [rbp+6Fh],r12b
fffff808`7144ece6 eb0e            jmp     stornvme!NVMePowerInitialize+0x102 (fffff808`7144ecf6)  Branch

stornvme!NVMePowerInitialize+0xf4:
fffff808`7144ece8 4402ce          add     r9b,sil
fffff808`7144eceb 453bde          cmp     r11d,r14d
fffff808`7144ecee 44884d67        mov     byte ptr [rbp+67h],r9b
fffff808`7144ecf2 450f42f3        cmovb   r14d,r11d

stornvme!NVMePowerInitialize+0x102:
fffff808`7144ecf6 410fb6420f      movzx   eax,byte ptr [r10+0Fh]
fffff808`7144ecfb 410fb64a0e      movzx   ecx,byte ptr [r10+0Eh]
fffff808`7144ed00 83e01f          and     eax,1Fh
fffff808`7144ed03 410fb6520d      movzx   edx,byte ptr [r10+0Dh]
fffff808`7144ed08 83e11f          and     ecx,1Fh
fffff808`7144ed0b 450fb6420c      movzx   r8d,byte ptr [r10+0Ch]
fffff808`7144ed10 83e21f          and     edx,1Fh
fffff808`7144ed13 458b4a08        mov     r9d,dword ptr [r10+8]
fffff808`7144ed17 4183e01f        and     r8d,1Fh
fffff808`7144ed1b 458b5204        mov     r10d,dword ptr [r10+4]
fffff808`7144ed1f 48898424c8000000 mov     qword ptr [rsp+0C8h],rax
fffff808`7144ed27 488d052abc0000  lea     rax,[stornvme!`string` (fffff808`7145a958)]
fffff808`7144ed2e 48898424c0000000 mov     qword ptr [rsp+0C0h],rax
fffff808`7144ed36 488d053bbc0000  lea     rax,[stornvme!`string` (fffff808`7145a978)]
fffff808`7144ed3d 48898c24b8000000 mov     qword ptr [rsp+0B8h],rcx
fffff808`7144ed45 33c9            xor     ecx,ecx
fffff808`7144ed47 48898424b0000000 mov     qword ptr [rsp+0B0h],rax
fffff808`7144ed4f 488d0542bc0000  lea     rax,[stornvme!`string` (fffff808`7145a998)]
fffff808`7144ed56 48899424a8000000 mov     qword ptr [rsp+0A8h],rdx
fffff808`7144ed5e 488bd7          mov     rdx,rdi
fffff808`7144ed61 48898424a0000000 mov     qword ptr [rsp+0A0h],rax
fffff808`7144ed69 488d0548bc0000  lea     rax,[stornvme!`string` (fffff808`7145a9b8)]
fffff808`7144ed70 4c89842498000000 mov     qword ptr [rsp+98h],r8
fffff808`7144ed78 4533c0          xor     r8d,r8d
fffff808`7144ed7b 4889842490000000 mov     qword ptr [rsp+90h],rax
fffff808`7144ed83 488d054ebc0000  lea     rax,[stornvme!`string` (fffff808`7145a9d8)]
fffff808`7144ed8a 4c898c2488000000 mov     qword ptr [rsp+88h],r9
fffff808`7144ed92 4533c9          xor     r9d,r9d
fffff808`7144ed95 4889842480000000 mov     qword ptr [rsp+80h],rax
fffff808`7144ed9d 488d0554bc0000  lea     rax,[stornvme!`string` (fffff808`7145a9f8)]
fffff808`7144eda4 4c89542478      mov     qword ptr [rsp+78h],r10
fffff808`7144eda9 4889442470      mov     qword ptr [rsp+70h],rax
fffff808`7144edae 488d0563bc0000  lea     rax,[stornvme!`string` (fffff808`7145aa18)]
fffff808`7144edb5 0fb6db          movzx   ebx,bl
fffff808`7144edb8 48d1eb          shr     rbx,1
fffff808`7144edbb 4823de          and     rbx,rsi
fffff808`7144edbe 48895c2468      mov     qword ptr [rsp+68h],rbx
fffff808`7144edc3 4889442460      mov     qword ptr [rsp+60h],rax
fffff808`7144edc8 488d0569bc0000  lea     rax,[stornvme!`string` (fffff808`7145aa38)]
fffff808`7144edcf 4c895c2458      mov     qword ptr [rsp+58h],r11
fffff808`7144edd4 4889442450      mov     qword ptr [rsp+50h],rax
fffff808`7144edd9 488d0578bc0000  lea     rax,[stornvme!`string` (fffff808`7145aa58)]
fffff808`7144ede0 48894c2448      mov     qword ptr [rsp+48h],rcx
fffff808`7144ede5 894c2440        mov     dword ptr [rsp+40h],ecx
fffff808`7144ede9 c744243804000000 mov     dword ptr [rsp+38h],4
fffff808`7144edf1 48c74424300c000000 mov   qword ptr [rsp+30h],0Ch
fffff808`7144edfa 4889442428      mov     qword ptr [rsp+28h],rax
fffff808`7144edff 894c2420        mov     dword ptr [rsp+20h],ecx
fffff808`7144ee03 418d4957        lea     ecx,[r9+57h]
fffff808`7144ee07 48ff151a120100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144ee0e 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144ee13 410fb68d07010000 movzx   ecx,byte ptr [r13+107h]
fffff808`7144ee1b 4402e6          add     r12b,sil
fffff808`7144ee1e 448a4d67        mov     r9b,byte ptr [rbp+67h]
fffff808`7144ee22 03ce            add     ecx,esi
fffff808`7144ee24 410fb6c4        movzx   eax,r12b
fffff808`7144ee28 3bc1            cmp     eax,ecx
fffff808`7144ee2a 0f828dfeffff    jb      stornvme!NVMePowerInitialize+0xc9 (fffff808`7144ecbd)  Branch

stornvme!NVMePowerInitialize+0x23c:
fffff808`7144ee30 450fb6e9        movzx   r13d,r9b
fffff808`7144ee34 488d457f        lea     rax,[rbp+7Fh]
fffff808`7144ee38 41b94e766d65    mov     r9d,656D764Eh
fffff808`7144ee3e 4889442420      mov     qword ptr [rsp+20h],rax
fffff808`7144ee43 488bd7          mov     rdx,rdi
fffff808`7144ee46 33c9            xor     ecx,ecx
fffff808`7144ee48 418d5d03        lea     ebx,[r13+3]
fffff808`7144ee4c c1e305          shl     ebx,5
fffff808`7144ee4f 448bc3          mov     r8d,ebx
fffff808`7144ee52 48ff15cf110100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144ee59 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144ee5e 4533e4          xor     r12d,r12d
fffff808`7144ee61 85c0            test    eax,eax
fffff808`7144ee63 741f            je      stornvme!NVMePowerInitialize+0x290 (fffff808`7144ee84)  Branch

stornvme!NVMePowerInitialize+0x271:
fffff808`7144ee65 488d1514bc0000  lea     rdx,[stornvme!`string` (fffff808`7145aa80)]

stornvme!NVMePowerInitialize+0x278:
fffff808`7144ee6c b903000000      mov     ecx,3

stornvme!NVMePowerInitialize+0x27d:
fffff808`7144ee71 48ff15b8110100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff808`71460030)]
fffff808`7144ee78 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144ee7d 32c0            xor     al,al
fffff808`7144ee7f e93a040000      jmp     stornvme!NVMePowerInitialize+0x6ca (fffff808`7144f2be)  Branch

stornvme!NVMePowerInitialize+0x290:
fffff808`7144ee84 488b4d7f        mov     rcx,qword ptr [rbp+7Fh]
fffff808`7144ee88 8bd3            mov     edx,ebx
fffff808`7144ee8a e84163ffff      call    stornvme!NVMeZeroMemory (fffff808`714451d0)
fffff808`7144ee8f 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ee93 418d4d01        lea     ecx,[r13+1]
fffff808`7144ee97 0f10059ac90000  movups  xmm0,xmmword ptr [stornvme!`HexFromUchar'::`2'::hexDigits+0x18 (fffff808`7145b838)]
fffff808`7144ee9e 41b802000000    mov     r8d,2
fffff808`7144eea4 8bd6            mov     edx,esi
fffff808`7144eea6 448900          mov     dword ptr [rax],r8d
fffff808`7144eea9 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144eead c7400418000000  mov     dword ptr [rax+4],18h
fffff808`7144eeb4 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144eeb8 897008          mov     dword ptr [rax+8],esi
fffff808`7144eebb 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144eebf 83480c40        or      dword ptr [rax+0Ch],40h
fffff808`7144eec3 488b5d7f        mov     rbx,qword ptr [rbp+7Fh]
fffff808`7144eec7 44894318        mov     dword ptr [rbx+18h],r8d
fffff808`7144eecb c7431c28000000  mov     dword ptr [rbx+1Ch],28h
fffff808`7144eed2 f30f7f4328      movdqu  xmmword ptr [rbx+28h],xmm0
fffff808`7144eed7 837f4c05        cmp     dword ptr [rdi+4Ch],5
fffff808`7144eedb 0f45d1          cmovne  edx,ecx
fffff808`7144eede 895320          mov     dword ptr [rbx+20h],edx
fffff808`7144eee1 3bd6            cmp     edx,esi
fffff808`7144eee3 760c            jbe     stornvme!NVMePowerInitialize+0x2fd (fffff808`7144eef1)  Branch

stornvme!NVMePowerInitialize+0x2f1:
fffff808`7144eee5 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144eee9 0fba680c08      bts     dword ptr [rax+0Ch],8
fffff808`7144eeee 8b5320          mov     edx,dword ptr [rbx+20h]

stornvme!NVMePowerInitialize+0x2fd:
fffff808`7144eef1 41bd08000000    mov     r13d,8
fffff808`7144eef7 413bd5          cmp     edx,r13d
fffff808`7144eefa 7604            jbe     stornvme!NVMePowerInitialize+0x30c (fffff808`7144ef00)  Branch

stornvme!NVMePowerInitialize+0x308:
fffff808`7144eefc 44896b20        mov     dword ptr [rbx+20h],r13d

stornvme!NVMePowerInitialize+0x30c:
fffff808`7144ef00 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ef04 4183cbff        or      r11d,0FFFFFFFFh
fffff808`7144ef08 83480c10        or      dword ptr [rax+0Ch],10h
fffff808`7144ef0c 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ef10 44895810        mov     dword ptr [rax+10h],r11d
fffff808`7144ef14 8b474c          mov     eax,dword ptr [rdi+4Ch]
fffff808`7144ef17 85c0            test    eax,eax
fffff808`7144ef19 7509            jne     stornvme!NVMePowerInitialize+0x330 (fffff808`7144ef24)  Branch

stornvme!NVMePowerInitialize+0x327:
fffff808`7144ef1b 4181fe10270000  cmp     r14d,2710h
fffff808`7144ef22 7705            ja      stornvme!NVMePowerInitialize+0x335 (fffff808`7144ef29)  Branch

stornvme!NVMePowerInitialize+0x330:
fffff808`7144ef24 413bc0          cmp     eax,r8d
fffff808`7144ef27 7511            jne     stornvme!NVMePowerInitialize+0x346 (fffff808`7144ef3a)  Branch

stornvme!NVMePowerInitialize+0x335:
fffff808`7144ef29 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ef2d 83480c04        or      dword ptr [rax+0Ch],4
fffff808`7144ef31 838f2006000010  or      dword ptr [rdi+620h],10h
fffff808`7144ef38 eb17            jmp     stornvme!NVMePowerInitialize+0x35d (fffff808`7144ef51)  Branch

stornvme!NVMePowerInitialize+0x346:
fffff808`7144ef3a 83f805          cmp     eax,5
fffff808`7144ef3d 7512            jne     stornvme!NVMePowerInitialize+0x35d (fffff808`7144ef51)  Branch

stornvme!NVMePowerInitialize+0x34b:
fffff808`7144ef3f 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ef43 83480c04        or      dword ptr [rax+0Ch],4
fffff808`7144ef47 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ef4b 8b4f58          mov     ecx,dword ptr [rdi+58h]
fffff808`7144ef4e 894810          mov     dword ptr [rax+10h],ecx

stornvme!NVMePowerInitialize+0x35d:
fffff808`7144ef51 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144ef55 448bd6          mov     r10d,esi
fffff808`7144ef58 448a756f        mov     r14b,byte ptr [rbp+6Fh]
fffff808`7144ef5c 4409680c        or      dword ptr [rax+0Ch],r13d
fffff808`7144ef60 8b4320          mov     eax,dword ptr [rbx+20h]
fffff808`7144ef63 468d0c36        lea     r9d,[rsi+r14]
fffff808`7144ef67 2bc6            sub     eax,esi
fffff808`7144ef69 89433c          mov     dword ptr [rbx+3Ch],eax
fffff808`7144ef6c 897340          mov     dword ptr [rbx+40h],esi
fffff808`7144ef6f c7434420000000  mov     dword ptr [rbx+44h],20h
fffff808`7144ef76 4c896348        mov     qword ptr [rbx+48h],r12
fffff808`7144ef7a 4c896350        mov     qword ptr [rbx+50h],r12
fffff808`7144ef7e 44895b58        mov     dword ptr [rbx+58h],r11d
fffff808`7144ef82 397320          cmp     dword ptr [rbx+20h],esi
fffff808`7144ef85 7651            jbe     stornvme!NVMePowerInitialize+0x3e4 (fffff808`7144efd8)  Branch

stornvme!NVMePowerInitialize+0x393:
fffff808`7144ef87 418ad1          mov     dl,r9b
fffff808`7144ef8a 488bcf          mov     rcx,rdi
fffff808`7144ef8d e826f5ffff      call    stornvme!NVMeGetPowerState (fffff808`7144e4b8)
fffff808`7144ef92 418bca          mov     ecx,r10d
fffff808`7144ef95 4402ce          add     r9b,sil
fffff808`7144ef98 4883c102        add     rcx,2
fffff808`7144ef9c 418bd2          mov     edx,r10d
fffff808`7144ef9f 48c1e105        shl     rcx,5
fffff808`7144efa3 4403d6          add     r10d,esi
fffff808`7144efa6 48c1e205        shl     rdx,5
fffff808`7144efaa 44895c1918      mov     dword ptr [rcx+rbx+18h],r11d
fffff808`7144efaf 89741a40        mov     dword ptr [rdx+rbx+40h],esi
fffff808`7144efb3 c7441a4420000000 mov     dword ptr [rdx+rbx+44h],20h
fffff808`7144efbb 8b4808          mov     ecx,dword ptr [rax+8]
fffff808`7144efbe 034804          add     ecx,dword ptr [rax+4]
fffff808`7144efc1 4c89641a50      mov     qword ptr [rdx+rbx+50h],r12
fffff808`7144efc6 488d0c89        lea     rcx,[rcx+rcx*4]
fffff808`7144efca 4803c9          add     rcx,rcx
fffff808`7144efcd 48894c1a48      mov     qword ptr [rdx+rbx+48h],rcx
fffff808`7144efd2 443b5320        cmp     r10d,dword ptr [rbx+20h]
fffff808`7144efd6 72af            jb      stornvme!NVMePowerInitialize+0x393 (fffff808`7144ef87)  Branch

stornvme!NVMePowerInitialize+0x3e4:
fffff808`7144efd8 4c8b4d7f        mov     r9,qword ptr [rbp+7Fh]
fffff808`7144efdc 488d4577        lea     rax,[rbp+77h]
fffff808`7144efe0 4533c0          xor     r8d,r8d
fffff808`7144efe3 4889442420      mov     qword ptr [rsp+20h],rax
fffff808`7144efe8 488bd7          mov     rdx,rdi
fffff808`7144efeb 418d4830        lea     ecx,[r8+30h]
fffff808`7144efef 48ff1532100100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144eff6 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144effb 85c0            test    eax,eax
fffff808`7144effd 7437            je      stornvme!NVMePowerInitialize+0x442 (fffff808`7144f036)  Branch

stornvme!NVMePowerInitialize+0x40b:
fffff808`7144efff 4c8b457f        mov     r8,qword ptr [rbp+7Fh]
fffff808`7144f003 488bd7          mov     rdx,rdi
fffff808`7144f006 8bce            mov     ecx,esi
fffff808`7144f008 48ff1519100100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f00f 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f014 8b8720060000    mov     eax,dword ptr [rdi+620h]
fffff808`7144f01a 488d15a7ba0000  lea     rdx,[stornvme!`string` (fffff808`7145aac8)]
fffff808`7144f021 83e0fa          and     eax,0FFFFFFFAh
fffff808`7144f024 4c89a710060000  mov     qword ptr [rdi+610h],r12
fffff808`7144f02b 898720060000    mov     dword ptr [rdi+620h],eax
fffff808`7144f031 e936feffff      jmp     stornvme!NVMePowerInitialize+0x278 (fffff808`7144ee6c)  Branch

stornvme!NVMePowerInitialize+0x442:
fffff808`7144f036 8b8f20060000    mov     ecx,dword ptr [rdi+620h]
fffff808`7144f03c 0fb64577        movzx   eax,byte ptr [rbp+77h]
fffff808`7144f040 83c904          or      ecx,4
fffff808`7144f043 8b5760          mov     edx,dword ptr [rdi+60h]
fffff808`7144f046 0bce            or      ecx,esi
fffff808`7144f048 c1e003          shl     eax,3
fffff808`7144f04b 33c1            xor     eax,ecx
fffff808`7144f04d 4123c5          and     eax,r13d
fffff808`7144f050 33c1            xor     eax,ecx
fffff808`7144f052 898720060000    mov     dword ptr [rdi+620h],eax
fffff808`7144f058 83faff          cmp     edx,0FFFFFFFFh
fffff808`7144f05b 8a4320          mov     al,byte ptr [rbx+20h]
fffff808`7144f05e 888729060000    mov     byte ptr [rdi+629h],al
fffff808`7144f064 488b457f        mov     rax,qword ptr [rbp+7Fh]
fffff808`7144f068 48898710060000  mov     qword ptr [rdi+610h],rax
fffff808`7144f06f b80f000000      mov     eax,0Fh
fffff808`7144f074 898738060000    mov     dword ptr [rdi+638h],eax
fffff808`7144f07a 0f45c2          cmovne  eax,edx
fffff808`7144f07d 898730060000    mov     dword ptr [rdi+630h],eax
fffff808`7144f083 4488a72a060000  mov     byte ptr [rdi+62Ah],r12b
fffff808`7144f08a 664489a726060000 mov     word ptr [rdi+626h],r12w
fffff808`7144f092 4489a72c060000  mov     dword ptr [rdi+62Ch],r12d
fffff808`7144f099 4488b725060000  mov     byte ptr [rdi+625h],r14b
fffff808`7144f0a0 c7873c060000c8000000 mov dword ptr [rdi+63Ch],0C8h
fffff808`7144f0aa c78744060000d0070000 mov dword ptr [rdi+644h],7D0h
fffff808`7144f0b4 c7874006000064000000 mov dword ptr [rdi+640h],64h
fffff808`7144f0be 44386567        cmp     byte ptr [rbp+67h],r12b
fffff808`7144f0c2 7657            jbe     stornvme!NVMePowerInitialize+0x527 (fffff808`7144f11b)  Branch

stornvme!NVMePowerInitialize+0x4d0:
fffff808`7144f0c4 4c8d8748060000  lea     r8,[rdi+648h]
fffff808`7144f0cb 488bd7          mov     rdx,rdi
fffff808`7144f0ce b920000000      mov     ecx,20h
fffff808`7144f0d3 48ff154e0f0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f0da 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f0df 4533c9          xor     r9d,r9d
fffff808`7144f0e2 4c89642420      mov     qword ptr [rsp+20h],r12
fffff808`7144f0e7 4533c0          xor     r8d,r8d
fffff808`7144f0ea 488bd7          mov     rdx,rdi
fffff808`7144f0ed 418d4933        lea     ecx,[r9+33h]
fffff808`7144f0f1 48ff15300f0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f0f8 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f0fd 4533c9          xor     r9d,r9d
fffff808`7144f100 4c89642420      mov     qword ptr [rsp+20h],r12
fffff808`7144f105 4533c0          xor     r8d,r8d
fffff808`7144f108 488bd7          mov     rdx,rdi
fffff808`7144f10b 418d4934        lea     ecx,[r9+34h]
fffff808`7144f10f 48ff15120f0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f116 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMePowerInitialize+0x527:
fffff808`7144f11b 41be03000000    mov     r14d,3
fffff808`7144f121 488d15d0b90000  lea     rdx,[stornvme!`string` (fffff808`7145aaf8)]
fffff808`7144f128 418bce          mov     ecx,r14d
fffff808`7144f12b 48ff15fe0e0100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff808`71460030)]
fffff808`7144f132 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f137 488d4507        lea     rax,[rbp+7]
fffff808`7144f13b 410fb6df        movzx   ebx,r15b
fffff808`7144f13f 41b94e766d65    mov     r9d,656D764Eh
fffff808`7144f145 4889442420      mov     qword ptr [rsp+20h],rax
fffff808`7144f14a 488bd7          mov     rdx,rdi
fffff808`7144f14d 33c9            xor     ecx,ecx
fffff808`7144f14f 448d045b        lea     r8d,[rbx+rbx*2]
fffff808`7144f153 468d04c528000000 lea     r8d,[r8*8+28h]
fffff808`7144f15b 48ff15c60e0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f162 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f167 85c0            test    eax,eax
fffff808`7144f169 740f            je      stornvme!NVMePowerInitialize+0x586 (fffff808`7144f17a)  Branch

stornvme!NVMePowerInitialize+0x577:
fffff808`7144f16b 488d15beb90000  lea     rdx,[stornvme!`string` (fffff808`7145ab30)]
fffff808`7144f172 418bce          mov     ecx,r14d
fffff808`7144f175 e9f7fcffff      jmp     stornvme!NVMePowerInitialize+0x27d (fffff808`7144ee71)  Branch

stornvme!NVMePowerInitialize+0x586:
fffff808`7144f17a 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f17e b928000000      mov     ecx,28h
fffff808`7144f183 458ad4          mov     r10b,r12b
fffff808`7144f186 8930            mov     dword ptr [rax],esi
fffff808`7144f188 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f18c 894804          mov     dword ptr [rax+4],ecx
fffff808`7144f18f 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f193 44896014        mov     dword ptr [rax+14h],r12d
fffff808`7144f197 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f19b 44897010        mov     dword ptr [rax+10h],r14d
fffff808`7144f19f 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f1a3 895818          mov     dword ptr [rax+18h],ebx
fffff808`7144f1a6 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f1aa 89481c          mov     dword ptr [rax+1Ch],ecx
fffff808`7144f1ad 4584ff          test    r15b,r15b
fffff808`7144f1b0 7457            je      stornvme!NVMePowerInitialize+0x615 (fffff808`7144f209)  Branch

stornvme!NVMePowerInitialize+0x5be:
fffff808`7144f1b2 4d8bdc          mov     r11,r12
fffff808`7144f1b5 498bdc          mov     rbx,r12

stornvme!NVMePowerInitialize+0x5c4:
fffff808`7144f1b8 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f1bc 418ad2          mov     dl,r10b
fffff808`7144f1bf 488bcf          mov     rcx,rdi
fffff808`7144f1c2 448b481c        mov     r9d,dword ptr [rax+1Ch]
fffff808`7144f1c6 4c03cb          add     r9,rbx
fffff808`7144f1c9 4c03c8          add     r9,rax
fffff808`7144f1cc 418931          mov     dword ptr [r9],esi
fffff808`7144f1cf 41c7410418000000 mov     dword ptr [r9+4],18h
fffff808`7144f1d7 e8dcf2ffff      call    stornvme!NVMeGetPowerState (fffff808`7144e4b8)
fffff808`7144f1dc 488bc8          mov     rcx,rax
fffff808`7144f1df e87c040000      call    stornvme!NVMePowerStateGetMaxPower (fffff808`7144f660)
fffff808`7144f1e4 8bd0            mov     edx,eax
fffff808`7144f1e6 4d895910        mov     qword ptr [r9+10h],r11
fffff808`7144f1ea b8d34d6210      mov     eax,10624DD3h
fffff808`7144f1ef 4402d6          add     r10b,sil
fffff808`7144f1f2 f7e2            mul     eax,edx
fffff808`7144f1f4 4c03de          add     r11,rsi
fffff808`7144f1f7 4883c318        add     rbx,18h
fffff808`7144f1fb c1ea06          shr     edx,6
fffff808`7144f1fe 8bc2            mov     eax,edx
fffff808`7144f200 49894108        mov     qword ptr [r9+8],rax
fffff808`7144f204 453ad7          cmp     r10b,r15b
fffff808`7144f207 72af            jb      stornvme!NVMePowerInitialize+0x5c4 (fffff808`7144f1b8)  Branch

stornvme!NVMePowerInitialize+0x615:
fffff808`7144f209 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f20d 4533c9          xor     r9d,r9d
fffff808`7144f210 4889442430      mov     qword ptr [rsp+30h],rax
fffff808`7144f215 4533c0          xor     r8d,r8d
fffff808`7144f218 89742428        mov     dword ptr [rsp+28h],esi
fffff808`7144f21c 488bd7          mov     rdx,rdi
fffff808`7144f21f 48c744242080000000 mov   qword ptr [rsp+20h],80h
fffff808`7144f228 418d4941        lea     ecx,[r9+41h]
fffff808`7144f22c 48ff15f50d0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f233 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f238 85c0            test    eax,eax
fffff808`7144f23a 7529            jne     stornvme!NVMePowerInitialize+0x671 (fffff808`7144f265)  Branch

stornvme!NVMePowerInitialize+0x648:
fffff808`7144f23c 488b4507        mov     rax,qword ptr [rbp+7]
fffff808`7144f240 4c8d0531b90000  lea     r8,[stornvme!`string` (fffff808`7145ab78)]
fffff808`7144f247 838f2006000002  or      dword ptr [rdi+620h],2
fffff808`7144f24e 48898718060000  mov     qword ptr [rdi+618h],rax
fffff808`7144f255 4488bf26060000  mov     byte ptr [rdi+626h],r15b
fffff808`7144f25c 4488a727060000  mov     byte ptr [rdi+627h],r12b
fffff808`7144f263 eb1c            jmp     stornvme!NVMePowerInitialize+0x68d (fffff808`7144f281)  Branch

stornvme!NVMePowerInitialize+0x671:
fffff808`7144f265 4c8b4507        mov     r8,qword ptr [rbp+7]
fffff808`7144f269 488bd7          mov     rdx,rdi
fffff808`7144f26c 8bce            mov     ecx,esi
fffff808`7144f26e 48ff15b30d0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff808`71460028)]
fffff808`7144f275 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f27a 4c8d0503b90000  lea     r8,[stornvme!`string` (fffff808`7145ab84)]

stornvme!NVMePowerInitialize+0x68d:
fffff808`7144f281 488d1508b90000  lea     rdx,[stornvme!`string` (fffff808`7145ab90)]
fffff808`7144f288 418bce          mov     ecx,r14d
fffff808`7144f28b 48ff159e0d0100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff808`71460030)]
fffff808`7144f292 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144f297 488bcf          mov     rcx,rdi
fffff808`7144f29a e85d620000      call    stornvme!NVMeGetAutoPowerStateTransition (fffff808`714554fc)
fffff808`7144f29f 8b8720060000    mov     eax,dword ptr [rdi+620h]
fffff808`7144f2a5 a840            test    al,40h
fffff808`7144f2a7 7412            je      stornvme!NVMePowerInitialize+0x6c7 (fffff808`7144f2bb)  Branch

stornvme!NVMePowerInitialize+0x6b5:
fffff808`7144f2a9 33d2            xor     edx,edx
fffff808`7144f2ab 488bcf          mov     rcx,rdi
fffff808`7144f2ae e8757f0000      call    stornvme!NVMeSetAutoPowerStateTransition (fffff808`71457228)
fffff808`7144f2b3 488bcf          mov     rcx,rdi
fffff808`7144f2b6 e841620000      call    stornvme!NVMeGetAutoPowerStateTransition (fffff808`714554fc)

stornvme!NVMePowerInitialize+0x6c7:
fffff808`7144f2bb 408ac6          mov     al,sil

stornvme!NVMePowerInitialize+0x6ca:
fffff808`7144f2be 4881c4e8000000  add     rsp,0E8h
fffff808`7144f2c5 415f            pop     r15
fffff808`7144f2c7 415e            pop     r14
fffff808`7144f2c9 415d            pop     r13
fffff808`7144f2cb 415c            pop     r12
fffff808`7144f2cd 5f              pop     rdi
fffff808`7144f2ce 5e              pop     rsi
fffff808`7144f2cf 5b              pop     rbx
fffff808`7144f2d0 5d              pop     rbp
fffff808`7144f2d1 c3              ret
