;NTSTATUS PciType0_SetResources(
;    __in PPCI_DEVICE Device,
;    __in PPCI_DEVICE_RESOURCES Resources)
    
66: kd> uf pci!PciType0_SetResources
pci!PciType0_SetResources:
fffff801`80393bc0 4053            push    rbx
fffff801`80393bc2 55              push    rbp
fffff801`80393bc3 56              push    rsi
fffff801`80393bc4 57              push    rdi
fffff801`80393bc5 4154            push    r12
fffff801`80393bc7 4156            push    r14
fffff801`80393bc9 4157            push    r15
fffff801`80393bcb 4881ecd0000000  sub     rsp,0D0h
fffff801`80393bd2 488b0557860200  mov     rax,qword ptr [pci!_security_cookie (fffff801`803bc230)]
fffff801`80393bd9 4833c4          xor     rax,rsp
fffff801`80393bdc 48898424c0000000 mov     qword ptr [rsp+0C0h],rax
fffff801`80393be4 4533e4          xor     r12d,r12d
fffff801`80393be7 4c89ac2420010000 mov     qword ptr [rsp+120h],r13
fffff801`80393bef 4c8bfa          mov     r15,rdx
fffff801`80393bf2 4c8bf1          mov     r14,rcx
fffff801`80393bf5 418bdc          mov     ebx,r12d  ;r12x == 0;
fffff801`80393bf8 418d542401      lea     edx,[r12+1]
fffff801`80393bfd 0f1f00          nop     dword ptr [rax]

pci!PciType0_SetResources+0x40:
fffff801`80393c00 8bfb            mov     edi,ebx   ;beginning of for() loop?
fffff801`80393c02 488d04bf        lea     rax,[rdi+rdi*4]   
fffff801`80393c06 498d3487        lea     rsi,[r15+rax*4]   ;RSI == Resources->Bars[barIndex]
fffff801`80393c0a 8bc3            mov     eax,ebx
fffff801`80393c0c 48c1e005        shl     rax,5
fffff801`80393c10 4a8d2c30        lea     rbp,[rax+r14]
fffff801`80393c14 0fb606          movzx   eax,byte ptr [rsi]
fffff801`80393c17 0fb68da9010000  movzx   ecx,byte ptr [rbp+1A9h]
fffff801`80393c1e 3ac1            cmp     al,cl
fffff801`80393c20 0f8510010000    jne     pci!PciType0_SetResources+0x176 (fffff801`80393d36)  Branch

pci!PciType0_SetResources+0x66:
fffff801`80393c26 84c0            test    al,al
fffff801`80393c28 0f8588000000    jne     pci!PciType0_SetResources+0xf6 (fffff801`80393cb6)  Branch

pci!PciType0_SetResources+0x6e:
fffff801`80393c2e 448964bc40      mov     dword ptr [rsp+rdi*4+40h],r12d

pci!PciType0_SetResources+0x73:
fffff801`80393c33 ffc3            inc     ebx
fffff801`80393c35 83fb06          cmp     ebx,6
fffff801`80393c38 72c6            jb      pci!PciType0_SetResources+0x40 (fffff801`80393c00)  Branch

pci!PciType0_SetResources+0x7a:
fffff801`80393c3a 41b918000000    mov     r9d,18h
fffff801`80393c40 488d542440      lea     rdx,[rsp+40h]
fffff801`80393c45 498bce          mov     rcx,r14
fffff801`80393c48 458d41f8        lea     r8d,[r9-8]
fffff801`80393c4c e86f060000      call    pci!PciWriteDeviceConfig (fffff801`803942c0)
fffff801`80393c51 41807f7800      cmp     byte ptr [r15+78h],0
fffff801`80393c56 0f85cea10000    jne     pci!PciType0_SetResources+0xa26a (fffff801`8039de2a)  Branch

pci!PciType0_SetResources+0x9c:
fffff801`80393c5c 418bc4          mov     eax,r12d

pci!PciType0_SetResources+0x9f:
fffff801`80393c5f 41b904000000    mov     r9d,4
fffff801`80393c65 89442424        mov     dword ptr [rsp+24h],eax
fffff801`80393c69 488d542424      lea     rdx,[rsp+24h]
fffff801`80393c6e 498bce          mov     rcx,r14
fffff801`80393c71 458d412c        lea     r8d,[r9+2Ch]
fffff801`80393c75 e846060000      call    pci!PciWriteDeviceConfig (fffff801`803942c0)
fffff801`80393c7a 498b8688000000  mov     rax,qword ptr [r14+88h]
fffff801`80393c81 4885c0          test    rax,rax
fffff801`80393c84 0f85e1000000    jne     pci!PciType0_SetResources+0x1ab (fffff801`80393d6b)  Branch

pci!PciType0_SetResources+0xca:
fffff801`80393c8a 33c0            xor     eax,eax

pci!PciType0_SetResources+0xcc:
fffff801`80393c8c 4c8bac2420010000 mov     r13,qword ptr [rsp+120h]
fffff801`80393c94 488b8c24c0000000 mov     rcx,qword ptr [rsp+0C0h]
fffff801`80393c9c 4833cc          xor     rcx,rsp
fffff801`80393c9f e87c760000      call    pci!_security_check_cookie (fffff801`8039b320)
fffff801`80393ca4 4881c4d0000000  add     rsp,0D0h
fffff801`80393cab 415f            pop     r15
fffff801`80393cad 415e            pop     r14
fffff801`80393caf 415c            pop     r12
fffff801`80393cb1 5f              pop     rdi
fffff801`80393cb2 5e              pop     rsi
fffff801`80393cb3 5d              pop     rbp
fffff801`80393cb4 5b              pop     rbx
fffff801`80393cb5 c3              ret

pci!PciType0_SetResources+0xf6:
fffff801`80393cb6 2c03            sub     al,3
fffff801`80393cb8 a8fb            test    al,0FBh
fffff801`80393cba 7524            jne     pci!PciType0_SetResources+0x120 (fffff801`80393ce0)  Branch

pci!PciType0_SetResources+0xfc:
fffff801`80393cbc 80f903          cmp     cl,3
fffff801`80393cbf 751f            jne     pci!PciType0_SetResources+0x120 (fffff801`80393ce0)  Branch

pci!PciType0_SetResources+0x101:
fffff801`80393cc1 498b8688000000  mov     rax,qword ptr [r14+88h]
fffff801`80393cc8 4885c0          test    rax,rax
fffff801`80393ccb 7539            jne     pci!PciType0_SetResources+0x146 (fffff801`80393d06)  Branch

pci!PciType0_SetResources+0x10d:
fffff801`80393ccd 4d8ba680000000  mov     r12,qword ptr [r14+80h]
fffff801`80393cd4 4d85e4          test    r12,r12
fffff801`80393cd7 0f859ca00000    jne     pci!PciType0_SetResources+0xa1b9 (fffff801`8039dd79)  Branch

pci!PciType0_SetResources+0x11d:
fffff801`80393cdd 4533e4          xor     r12d,r12d

pci!PciType0_SetResources+0x120:
fffff801`80393ce0 8b4604          mov     eax,dword ptr [rsi+4]
fffff801`80393ce3 8944bc40        mov     dword ptr [rsp+rdi*4+40h],eax
fffff801`80393ce7 b8ffffffff      mov     eax,0FFFFFFFFh
fffff801`80393cec 483985c0010000  cmp     qword ptr [rbp+1C0h],rax
fffff801`80393cf3 772c            ja      pci!PciType0_SetResources+0x161 (fffff801`80393d21)  Branch

pci!PciType0_SetResources+0x135:
fffff801`80393cf5 837e0800        cmp     dword ptr [rsi+8],0
fffff801`80393cf9 0f8434ffffff    je      pci!PciType0_SetResources+0x73 (fffff801`80393c33)  Branch

pci!PciType0_SetResources+0x13f:
fffff801`80393cff b80d0000c0      mov     eax,0C000000Dh
fffff801`80393d04 eb86            jmp     pci!PciType0_SetResources+0xcc (fffff801`80393c8c)  Branch

pci!PciType0_SetResources+0x146:
fffff801`80393d06 4c8da048060000  lea     r12,[rax+648h]

pci!PciType0_SetResources+0x14d:
fffff801`80393d0d 4d85e4          test    r12,r12
fffff801`80393d10 74cb            je      pci!PciType0_SetResources+0x11d (fffff801`80393cdd)  Branch

pci!PciType0_SetResources+0x152:
fffff801`80393d12 458b6cbc04      mov     r13d,dword ptr [r12+rdi*4+4]
fffff801`80393d17 4585ed          test    r13d,r13d
fffff801`80393d1a 74c1            je      pci!PciType0_SetResources+0x11d (fffff801`80393cdd)  Branch

pci!PciType0_SetResources+0x15c:
fffff801`80393d1c e961a00000      jmp     pci!PciType0_SetResources+0xa1c2 (fffff801`8039dd82)  Branch

pci!PciType0_SetResources+0x161:
fffff801`80393d21 ffc3            inc     ebx
fffff801`80393d23 83fb06          cmp     ebx,6
fffff801`80393d26 74d7            je      pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0x168:
fffff801`80393d28 8b4608          mov     eax,dword ptr [rsi+8]
fffff801`80393d2b 89449c40        mov     dword ptr [rsp+rbx*4+40h],eax
fffff801`80393d2f 8bcb            mov     ecx,ebx
fffff801`80393d31 e9fdfeffff      jmp     pci!PciType0_SetResources+0x73 (fffff801`80393c33)  Branch

pci!PciType0_SetResources+0x176:
fffff801`80393d36 3c07            cmp     al,7
fffff801`80393d38 0f84e29f0000    je      pci!PciType0_SetResources+0xa160 (fffff801`8039dd20)  Branch

pci!PciType0_SetResources+0x17e:
fffff801`80393d3e 3c03            cmp     al,3
fffff801`80393d40 0f84e89f0000    je      pci!PciType0_SetResources+0xa16e (fffff801`8039dd2e)  Branch

pci!PciType0_SetResources+0x186:
fffff801`80393d46 80f901          cmp     cl,1
fffff801`80393d49 0f85ed9f0000    jne     pci!PciType0_SetResources+0xa17c (fffff801`8039dd3c)  Branch

pci!PciType0_SetResources+0x18f:
fffff801`80393d4f 84c0            test    al,al
fffff801`80393d51 75ac            jne     pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0x193:
fffff801`80393d53 410fb7463c      movzx   eax,word ptr [r14+3Ch]
fffff801`80393d58 6685c2          test    dx,ax
fffff801`80393d5b 0f85f09f0000    jne     pci!PciType0_SetResources+0xa191 (fffff801`8039dd51)  Branch

pci!PciType0_SetResources+0x1a1:
fffff801`80393d61 ba01000000      mov     edx,1
fffff801`80393d66 e9c3feffff      jmp     pci!PciType0_SetResources+0x6e (fffff801`80393c2e)  Branch

pci!PciType0_SetResources+0x1ab:
fffff801`80393d6b 6683b8f200000000 cmp     word ptr [rax+0F2h],0
fffff801`80393d73 0f8411ffffff    je      pci!PciType0_SetResources+0xca (fffff801`80393c8a)  Branch

pci!PciType0_SetResources+0x1b9:
fffff801`80393d79 e9b5a00000      jmp     pci!PciType0_SetResources+0xa273 (fffff801`8039de33)  Branch

pci!PciType0_SetResources+0xa160:
fffff801`8039dd20 80f903          cmp     cl,3
fffff801`8039dd23 0f84985fffff    je      pci!PciType0_SetResources+0x101 (fffff801`80393cc1)  Branch

pci!PciType0_SetResources+0xa169:
fffff801`8039dd29 e91860ffff      jmp     pci!PciType0_SetResources+0x186 (fffff801`80393d46)  Branch

pci!PciType0_SetResources+0xa16e:
fffff801`8039dd2e 80f907          cmp     cl,7
fffff801`8039dd31 0f84855fffff    je      pci!PciType0_SetResources+0xfc (fffff801`80393cbc)  Branch

pci!PciType0_SetResources+0xa177:
fffff801`8039dd37 e90a60ffff      jmp     pci!PciType0_SetResources+0x186 (fffff801`80393d46)  Branch

pci!PciType0_SetResources+0xa17c:
fffff801`8039dd3c 80e903          sub     cl,3
fffff801`8039dd3f ba02000000      mov     edx,2
fffff801`8039dd44 f6c1fb          test    cl,0FBh
fffff801`8039dd47 66410f45d4      cmovne  dx,r12w
fffff801`8039dd4c e9fe5fffff      jmp     pci!PciType0_SetResources+0x18f (fffff801`80393d4f)  Branch

pci!PciType0_SetResources+0xa191:
fffff801`8039dd51 410fb64625      movzx   eax,byte ptr [r14+25h]
fffff801`8039dd56 84c0            test    al,al
fffff801`8039dd58 7507            jne     pci!PciType0_SetResources+0xa1a1 (fffff801`8039dd61)  Branch

pci!PciType0_SetResources+0xa19a:
fffff801`8039dd5a 41807e2601      cmp     byte ptr [r14+26h],1
fffff801`8039dd5f eb0d            jmp     pci!PciType0_SetResources+0xa1ae (fffff801`8039dd6e)  Branch

pci!PciType0_SetResources+0xa1a1:
fffff801`8039dd61 3c03            cmp     al,3
fffff801`8039dd63 0f85965fffff    jne     pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0xa1a9:
fffff801`8039dd69 41807e2600      cmp     byte ptr [r14+26h],0

pci!PciType0_SetResources+0xa1ae:
fffff801`8039dd6e 0f858b5fffff    jne     pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0xa1b4:
fffff801`8039dd74 e9e85fffff      jmp     pci!PciType0_SetResources+0x1a1 (fffff801`80393d61)  Branch

pci!PciType0_SetResources+0xa1b9:
fffff801`8039dd79 4983c42c        add     r12,2Ch
fffff801`8039dd7d e98b5fffff      jmp     pci!PciType0_SetResources+0x14d (fffff801`80393d0d)  Branch

pci!PciType0_SetResources+0xa1c2:
fffff801`8039dd82 4533c9          xor     r9d,r9d
fffff801`8039dd85 488d8da8010000  lea     rcx,[rbp+1A8h]
fffff801`8039dd8c 4533c0          xor     r8d,r8d
fffff801`8039dd8f 33d2            xor     edx,edx
fffff801`8039dd91 48ff1548590200  call    qword ptr [pci!_imp_RtlIoDecodeMemIoResource (fffff801`803c36e0)]
fffff801`8039dd98 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8039dd9d 488d48ff        lea     rcx,[rax-1]
fffff801`8039dda1 4885c8          test    rax,rcx
fffff801`8039dda4 757a            jne     pci!PciType0_SetResources+0xa260 (fffff801`8039de20)  Branch

pci!PciType0_SetResources+0xa1e6:
fffff801`8039dda6 48c1e814        shr     rax,14h
fffff801`8039ddaa 498bcd          mov     rcx,r13
fffff801`8039ddad 4c85e8          test    rax,r13
fffff801`8039ddb0 746e            je      pci!PciType0_SetResources+0xa260 (fffff801`8039de20)  Branch

pci!PciType0_SetResources+0xa1f2:
fffff801`8039ddb2 420fb64c271c    movzx   ecx,byte ptr [rdi+r12+1Ch]
fffff801`8039ddb8 488d542420      lea     rdx,[rsp+20h]
fffff801`8039ddbd 440fbde8        bsr     r13d,eax
fffff801`8039ddc1 410fb70424      movzx   eax,word ptr [r12]
fffff801`8039ddc6 41b904000000    mov     r9d,4
fffff801`8039ddcc 44896c2428      mov     dword ptr [rsp+28h],r13d
fffff801`8039ddd1 448d24c8        lea     r12d,[rax+rcx*8]
fffff801`8039ddd5 498bce          mov     rcx,r14
fffff801`8039ddd8 458d442408      lea     r8d,[r12+8]
fffff801`8039dddd e82e68ffff      call    pci!PciReadDeviceConfig (fffff801`80394610)
fffff801`8039dde2 8b442420        mov     eax,dword ptr [rsp+20h]
fffff801`8039dde6 8bc8            mov     ecx,eax
fffff801`8039dde8 c1e908          shr     ecx,8
fffff801`8039ddeb 83e11f          and     ecx,1Fh
fffff801`8039ddee 413bcd          cmp     ecx,r13d
fffff801`8039ddf1 742d            je      pci!PciType0_SetResources+0xa260 (fffff801`8039de20)  Branch

pci!PciType0_SetResources+0xa233:
fffff801`8039ddf3 41c1e508        shl     r13d,8
fffff801`8039ddf7 458d442408      lea     r8d,[r12+8]
fffff801`8039ddfc 4433e8          xor     r13d,eax
fffff801`8039ddff 488d542420      lea     rdx,[rsp+20h]
fffff801`8039de04 4181e5001f0000  and     r13d,1F00h
fffff801`8039de0b 41b904000000    mov     r9d,4
fffff801`8039de11 4133c5          xor     eax,r13d
fffff801`8039de14 498bce          mov     rcx,r14
fffff801`8039de17 89442420        mov     dword ptr [rsp+20h],eax
fffff801`8039de1b e8a064ffff      call    pci!PciWriteDeviceConfig (fffff801`803942c0)

pci!PciType0_SetResources+0xa260:
fffff801`8039de20 ba01000000      mov     edx,1
fffff801`8039de25 e9b35effff      jmp     pci!PciType0_SetResources+0x11d (fffff801`80393cdd)  Branch

pci!PciType0_SetResources+0xa26a:
fffff801`8039de2a 418b477c        mov     eax,dword ptr [r15+7Ch]
fffff801`8039de2e e92c5effff      jmp     pci!PciType0_SetResources+0x9f (fffff801`80393c5f)  Branch

pci!PciType0_SetResources+0xa273:
fffff801`8039de33 f70503e4010000800000 test dword ptr [pci!PciSystemWideHackFlags (fffff801`803bc240)],8000h
fffff801`8039de3d 0f85475effff    jne     pci!PciType0_SetResources+0xca (fffff801`80393c8a)  Branch

pci!PciType0_SetResources+0xa283:
fffff801`8039de43 f049818e3805000000000008 lock or qword ptr [r14+538h],8000000h
fffff801`8039de4f 418bd4          mov     edx,r12d

pci!PciType0_SetResources+0xa292:
fffff801`8039de52 8bca            mov     ecx,edx
fffff801`8039de54 488d4107        lea     rax,[rcx+7]
fffff801`8039de58 488d0480        lea     rax,[rax+rax*4]
fffff801`8039de5c 450fb60c87      movzx   r9d,byte ptr [r15+rax*4]
fffff801`8039de61 4d8d0487        lea     r8,[r15+rax*4]
fffff801`8039de65 8bc2            mov     eax,edx
fffff801`8039de67 48c1e005        shl     rax,5
fffff801`8039de6b 4e8d1430        lea     r10,[rax+r14]
fffff801`8039de6f 410fb68289020000 movzx   eax,byte ptr [r10+289h]
fffff801`8039de77 443ac8          cmp     r9b,al
fffff801`8039de7a 0f858e000000    jne     pci!PciType0_SetResources+0xa34e (fffff801`8039df0e)  Branch

pci!PciType0_SetResources+0xa2c0:
fffff801`8039de80 4584c9          test    r9b,r9b
fffff801`8039de83 750a            jne     pci!PciType0_SetResources+0xa2cf (fffff801`8039de8f)  Branch

pci!PciType0_SetResources+0xa2c5:
fffff801`8039de85 4489a48ca4000000 mov     dword ptr [rsp+rcx*4+0A4h],r12d
fffff801`8039de8d eb3c            jmp     pci!PciType0_SetResources+0xa30b (fffff801`8039decb)  Branch

pci!PciType0_SetResources+0xa2cf:
fffff801`8039de8f 418b4004        mov     eax,dword ptr [r8+4]
fffff801`8039de93 89848ca4000000  mov     dword ptr [rsp+rcx*4+0A4h],eax
fffff801`8039de9a b8ffffffff      mov     eax,0FFFFFFFFh
fffff801`8039de9f 493982a0020000  cmp     qword ptr [r10+2A0h],rax
fffff801`8039dea6 7618            jbe     pci!PciType0_SetResources+0xa300 (fffff801`8039dec0)  Branch

pci!PciType0_SetResources+0xa2e8:
fffff801`8039dea8 ffc2            inc     edx
fffff801`8039deaa 83fa06          cmp     edx,6
fffff801`8039dead 0f844c5effff    je      pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0xa2f3:
fffff801`8039deb3 418b4008        mov     eax,dword ptr [r8+8]
fffff801`8039deb7 898494a4000000  mov     dword ptr [rsp+rdx*4+0A4h],eax
fffff801`8039debe eb0b            jmp     pci!PciType0_SetResources+0xa30b (fffff801`8039decb)  Branch

pci!PciType0_SetResources+0xa300:
fffff801`8039dec0 4183780800      cmp     dword ptr [r8+8],0
fffff801`8039dec5 0f85345effff    jne     pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0xa30b:
fffff801`8039decb ffc2            inc     edx
fffff801`8039decd 83fa06          cmp     edx,6
fffff801`8039ded0 7280            jb      pci!PciType0_SetResources+0xa292 (fffff801`8039de52)  Branch

pci!PciType0_SetResources+0xa312:
fffff801`8039ded2 f04981a638050000fffffff7 lock and qword ptr [r14+538h],0FFFFFFFFF7FFFFFFh
fffff801`8039dede 498b8e88000000  mov     rcx,qword ptr [r14+88h]
fffff801`8039dee5 488d9424a4000000 lea     rdx,[rsp+0A4h]
fffff801`8039deed 41b918000000    mov     r9d,18h
fffff801`8039def3 440fb781f2000000 movzx   r8d,word ptr [rcx+0F2h]
fffff801`8039defb 488b4908        mov     rcx,qword ptr [rcx+8]
fffff801`8039deff 4183c024        add     r8d,24h
fffff801`8039df03 e8b863ffff      call    pci!PciWriteDeviceConfig (fffff801`803942c0)
fffff801`8039df08 90              nop
fffff801`8039df09 e97c5dffff      jmp     pci!PciType0_SetResources+0xca (fffff801`80393c8a)  Branch

pci!PciType0_SetResources+0xa34e:
fffff801`8039df0e 3c01            cmp     al,1
fffff801`8039df10 0f84e95dffff    je      pci!PciType0_SetResources+0x13f (fffff801`80393cff)  Branch

pci!PciType0_SetResources+0xa356:
fffff801`8039df16 2c03            sub     al,3
fffff801`8039df18 a8fb            test    al,0FBh
fffff801`8039df1a 0f846a5dffff    je      pci!PciType0_SetResources+0xca (fffff801`80393c8a)  Branch

pci!PciType0_SetResources+0xa360:
fffff801`8039df20 b8e50000c0      mov     eax,0C00000E5h
fffff801`8039df25 e9625dffff      jmp     pci!PciType0_SetResources+0xcc (fffff801`80393c8c)  Branch
