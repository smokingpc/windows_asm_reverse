0: kd> uf storport!RaidStartIoPacket
Flow analysis was incomplete, some code may be missing
storport!RaidStartIoPacket:
fffff80e`acce7be0 4c894c2420      mov     qword ptr [rsp+20h],r9
fffff80e`acce7be5 4489442418      mov     dword ptr [rsp+18h],r8d
fffff80e`acce7bea 4889542410      mov     qword ptr [rsp+10h],rdx
fffff80e`acce7bef 55              push    rbp
fffff80e`acce7bf0 53              push    rbx
fffff80e`acce7bf1 56              push    rsi
fffff80e`acce7bf2 57              push    rdi
fffff80e`acce7bf3 4154            push    r12
fffff80e`acce7bf5 4155            push    r13
fffff80e`acce7bf7 4157            push    r15
fffff80e`acce7bf9 488d6c24d9      lea     rbp,[rsp-27h]
fffff80e`acce7bfe 4881ecc0000000  sub     rsp,0C0h
fffff80e`acce7c05 4c8ba2b8000000  mov     r12,qword ptr [rdx+0B8h]
fffff80e`acce7c0c 33f6            xor     esi,esi
fffff80e`acce7c0e 458bf8          mov     r15d,r8d
fffff80e`acce7c11 4c8bea          mov     r13,rdx
fffff80e`acce7c14 488bf9          mov     rdi,rcx
fffff80e`acce7c17 4c89659f        mov     qword ptr [rbp-61h],r12
fffff80e`acce7c1b 498b5c2408      mov     rbx,qword ptr [r12+8]
fffff80e`acce7c20 4038b1580a0000  cmp     byte ptr [rcx+0A58h],sil
fffff80e`acce7c27 0f8438010000    je      storport!RaidStartIoPacket+0x185 (fffff80e`acce7d65)  Branch

storport!RaidStartIoPacket+0x4d:
fffff80e`acce7c2d 0fb64302        movzx   eax,byte ptr [rbx+2]
fffff80e`acce7c31 3c28            cmp     al,28h
fffff80e`acce7c33 0f856b3d0200    jne     storport!RaidStartIoPacket+0x23dc4 (fffff80e`acd0b9a4)  Branch

storport!RaidStartIoPacket+0x59:
fffff80e`acce7c39 8b4b14          mov     ecx,dword ptr [rbx+14h]

storport!RaidStartIoPacket+0x5c:
fffff80e`acce7c3c 85c9            test    ecx,ecx
fffff80e`acce7c3e 0f8521010000    jne     storport!RaidStartIoPacket+0x185 (fffff80e`acce7d65)  Branch

storport!RaidStartIoPacket+0x64:
fffff80e`acce7c44 3c28            cmp     al,28h
fffff80e`acce7c46 0f85a63d0200    jne     storport!RaidStartIoPacket+0x23e12 (fffff80e`acd0b9f2)  Branch

storport!RaidStartIoPacket+0x6c:
fffff80e`acce7c4c 488bd6          mov     rdx,rsi
fffff80e`acce7c4f 397314          cmp     dword ptr [rbx+14h],esi
fffff80e`acce7c52 7556            jne     storport!RaidStartIoPacket+0xca (fffff80e`acce7caa)  Branch

storport!RaidStartIoPacket+0x74:
fffff80e`acce7c54 448b5338        mov     r10d,dword ptr [rbx+38h]
fffff80e`acce7c58 448bde          mov     r11d,esi
fffff80e`acce7c5b 4585d2          test    r10d,r10d
fffff80e`acce7c5e 744a            je      storport!RaidStartIoPacket+0xca (fffff80e`acce7caa)  Branch

storport!RaidStartIoPacket+0x80:
fffff80e`acce7c60 418bc3          mov     eax,r11d
fffff80e`acce7c63 8b4c8378        mov     ecx,dword ptr [rbx+rax*4+78h]
fffff80e`acce7c67 81f980000000    cmp     ecx,80h
fffff80e`acce7c6d 0f826e3d0200    jb      storport!RaidStartIoPacket+0x23e01 (fffff80e`acd0b9e1)  Branch

storport!RaidStartIoPacket+0x93:
fffff80e`acce7c73 448b4310        mov     r8d,dword ptr [rbx+10h]
fffff80e`acce7c77 413bc8          cmp     ecx,r8d
fffff80e`acce7c7a 0f83613d0200    jae     storport!RaidStartIoPacket+0x23e01 (fffff80e`acd0b9e1)  Branch

storport!RaidStartIoPacket+0xa0:
fffff80e`acce7c80 448bc9          mov     r9d,ecx
fffff80e`acce7c83 8b0c19          mov     ecx,dword ptr [rcx+rbx]
fffff80e`acce7c86 83f940          cmp     ecx,40h
fffff80e`acce7c89 0f851d3d0200    jne     storport!RaidStartIoPacket+0x23dcc (fffff80e`acd0b9ac)  Branch

storport!RaidStartIoPacket+0xaf:
fffff80e`acce7c8f 498d4928        lea     rcx,[r9+28h]
fffff80e`acce7c93 493bc8          cmp     rcx,r8
fffff80e`acce7c96 0f87453d0200    ja      storport!RaidStartIoPacket+0x23e01 (fffff80e`acd0b9e1)  Branch

storport!RaidStartIoPacket+0xbc:
fffff80e`acce7c9c 413854190a      cmp     byte ptr [r9+rbx+0Ah],dl
fffff80e`acce7ca1 7607            jbe     storport!RaidStartIoPacket+0xca (fffff80e`acce7caa)  Branch

storport!RaidStartIoPacket+0xc3:
fffff80e`acce7ca3 488d5318        lea     rdx,[rbx+18h]
fffff80e`acce7ca7 4903d1          add     rdx,r9

storport!RaidStartIoPacket+0xca:
fffff80e`acce7caa 4885d2          test    rdx,rdx
fffff80e`acce7cad 0f84b2000000    je      storport!RaidStartIoPacket+0x185 (fffff80e`acce7d65)  Branch

storport!RaidStartIoPacket+0xd3:
fffff80e`acce7cb3 0fb60a          movzx   ecx,byte ptr [rdx]
fffff80e`acce7cb6 8d41f8          lea     eax,[rcx-8]
fffff80e`acce7cb9 a85d            test    al,5Dh
fffff80e`acce7cbb 0f850a010000    jne     storport!RaidStartIoPacket+0x1eb (fffff80e`acce7dcb)  Branch

storport!RaidStartIoPacket+0xe1:
fffff80e`acce7cc1 c6459701        mov     byte ptr [rbp-69h],1

storport!RaidStartIoPacket+0xe5:
fffff80e`acce7cc5 807b0228        cmp     byte ptr [rbx+2],28h
fffff80e`acce7cc9 4c89b424b8000000 mov     qword ptr [rsp+0B8h],r14
fffff80e`acce7cd1 0f8597000000    jne     storport!RaidStartIoPacket+0x18e (fffff80e`acce7d6e)  Branch

storport!RaidStartIoPacket+0xf7:
fffff80e`acce7cd7 448b7318        mov     r14d,dword ptr [rbx+18h]

storport!RaidStartIoPacket+0xfb:
fffff80e`acce7cdb f687a200000002  test    byte ptr [rdi+0A2h],2
fffff80e`acce7ce2 0f852d3d0200    jne     storport!RaidStartIoPacket+0x23e35 (fffff80e`acd0ba15)  Branch

storport!RaidStartIoPacket+0x108:
fffff80e`acce7ce8 488d4d9b        lea     rcx,[rbp-65h]
fffff80e`acce7cec 48ff15ddc50500  call    qword ptr [storport!_imp_KeGetCurrentProcessorNumberEx (fffff80e`acd442d0)]
fffff80e`acce7cf3 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce7cf8 807b0228        cmp     byte ptr [rbx+2],28h
fffff80e`acce7cfc 7579            jne     storport!RaidStartIoPacket+0x197 (fffff80e`acce7d77)  Branch

storport!RaidStartIoPacket+0x11e:
fffff80e`acce7cfe 8b459b          mov     eax,dword ptr [rbp-65h]
fffff80e`acce7d01 894360          mov     dword ptr [rbx+60h],eax

storport!RaidStartIoPacket+0x124:
fffff80e`acce7d04 4038b781000000  cmp     byte ptr [rdi+81h],sil
fffff80e`acce7d0b 0f85693d0200    jne     storport!RaidStartIoPacket+0x23e9a (fffff80e`acd0ba7a)  Branch

storport!RaidStartIoPacket+0x131:
fffff80e`acce7d11 0fb64302        movzx   eax,byte ptr [rbx+2]
fffff80e`acce7d15 3c28            cmp     al,28h
fffff80e`acce7d17 7577            jne     storport!RaidStartIoPacket+0x1b0 (fffff80e`acce7d90)  Branch

storport!RaidStartIoPacket+0x139:
fffff80e`acce7d19 8b4314          mov     eax,dword ptr [rbx+14h]

storport!RaidStartIoPacket+0x13c:
fffff80e`acce7d1c ba01000000      mov     edx,1
fffff80e`acce7d21 85c0            test    eax,eax
fffff80e`acce7d23 7570            jne     storport!RaidStartIoPacket+0x1b5 (fffff80e`acce7d95)  Branch

storport!RaidStartIoPacket+0x145:
fffff80e`acce7d25 41f7c600081000  test    r14d,100800h
fffff80e`acce7d2c 0f84a7000000    je      storport!RaidStartIoPacket+0x1f9 (fffff80e`acce7dd9)  Branch

storport!RaidStartIoPacket+0x152:
fffff80e`acce7d32 4183cf08        or      r15d,8
fffff80e`acce7d36 4989742410      mov     qword ptr [r12+10h],rsi
fffff80e`acce7d3b 488bcf          mov     rcx,rdi
fffff80e`acce7d3e 44897d77        mov     dword ptr [rbp+77h],r15d
fffff80e`acce7d42 e895490000      call    storport!RaidUnitCheckAndAcquirePoFx (fffff80e`accec6dc)
fffff80e`acce7d47 84c0            test    al,al
fffff80e`acce7d49 0f8555080000    jne     storport!RaidStartIoPacket+0x9c4 (fffff80e`acce85a4)  Branch

storport!RaidStartIoPacket+0x16f:
fffff80e`acce7d4f 4c8b7718        mov     r14,qword ptr [rdi+18h]
fffff80e`acce7d53 4939b6e0130000  cmp     qword ptr [r14+13E0h],rsi
fffff80e`acce7d5a 0f853c400200    jne     storport!RaidStartIoPacket+0x241bc (fffff80e`acd0bd9c)  Branch

storport!RaidStartIoPacket+0x180:
fffff80e`acce7d60 e91d010000      jmp     storport!RaidStartIoPacket+0x2a2 (fffff80e`acce7e82)  Branch

storport!RaidStartIoPacket+0x185:
fffff80e`acce7d65 40887597        mov     byte ptr [rbp-69h],sil
fffff80e`acce7d69 e957ffffff      jmp     storport!RaidStartIoPacket+0xe5 (fffff80e`acce7cc5)  Branch

storport!RaidStartIoPacket+0x18e:
fffff80e`acce7d6e 448b730c        mov     r14d,dword ptr [rbx+0Ch]
fffff80e`acce7d72 e964ffffff      jmp     storport!RaidStartIoPacket+0xfb (fffff80e`acce7cdb)  Branch

storport!RaidStartIoPacket+0x197:
fffff80e`acce7d77 48397328        cmp     qword ptr [rbx+28h],rsi
fffff80e`acce7d7b 7508            jne     storport!RaidStartIoPacket+0x1a5 (fffff80e`acce7d85)  Branch

storport!RaidStartIoPacket+0x19d:
fffff80e`acce7d7d 488b4338        mov     rax,qword ptr [rbx+38h]
fffff80e`acce7d81 48894328        mov     qword ptr [rbx+28h],rax

storport!RaidStartIoPacket+0x1a5:
fffff80e`acce7d85 8b459b          mov     eax,dword ptr [rbp-65h]
fffff80e`acce7d88 894338          mov     dword ptr [rbx+38h],eax
fffff80e`acce7d8b e974ffffff      jmp     storport!RaidStartIoPacket+0x124 (fffff80e`acce7d04)  Branch

storport!RaidStartIoPacket+0x1b0:
fffff80e`acce7d90 0fb6c0          movzx   eax,al
fffff80e`acce7d93 eb87            jmp     storport!RaidStartIoPacket+0x13c (fffff80e`acce7d1c)  Branch

storport!RaidStartIoPacket+0x1b5:
fffff80e`acce7d95 83c0fe          add     eax,0FFFFFFFEh
fffff80e`acce7d98 83f823          cmp     eax,23h
fffff80e`acce7d9b 7795            ja      storport!RaidStartIoPacket+0x152 (fffff80e`acce7d32)  Branch

storport!RaidStartIoPacket+0x1bd:
fffff80e`acce7d9d 4c8d055c82ffff  lea     r8,[storport!RaUnitAtaPassThroughIoctl <PERF> (storport+0x0) (fffff80e`acce0000)]
fffff80e`acce7da4 418b8c80d42e0500 mov     ecx,dword ptr [r8+rax*4+52ED4h]
fffff80e`acce7dac 4903c8          add     rcx,r8
fffff80e`acce7daf ffe1            jmp     rcx

storport!RaidStartIoPacket+0x1eb:
fffff80e`acce7dcb 80f925          cmp     cl,25h
fffff80e`acce7dce 0f84edfeffff    je      storport!RaidStartIoPacket+0xe1 (fffff80e`acce7cc1)  Branch

storport!RaidStartIoPacket+0x1f4:
fffff80e`acce7dd4 e9223c0200      jmp     storport!RaidStartIoPacket+0x23e1b (fffff80e`acd0b9fb)  Branch

storport!RaidStartIoPacket+0x1f9:
fffff80e`acce7dd9 4c8b7718        mov     r14,qword ptr [rdi+18h]

storport!RaidStartIoPacket+0x1fd:
fffff80e`acce7ddd 4d8bfe          mov     r15,r14
fffff80e`acce7de0 440f20c0        mov     rax,cr8
fffff80e`acce7de4 3c02            cmp     al,2
fffff80e`acce7de6 0f83b5040000    jae     storport!RaidStartIoPacket+0x6c1 (fffff80e`acce82a1)  Branch

storport!RaidStartIoPacket+0x20c:
fffff80e`acce7dec 4038b7a0000000  cmp     byte ptr [rdi+0A0h],sil
fffff80e`acce7df3 0f8ca8040000    jl      storport!RaidStartIoPacket+0x6c1 (fffff80e`acce82a1)  Branch

storport!RaidStartIoPacket+0x219:
fffff80e`acce7df9 0fb687a1000000  movzx   eax,byte ptr [rdi+0A1h]
fffff80e`acce7e00 a801            test    al,1
fffff80e`acce7e02 0f8599040000    jne     storport!RaidStartIoPacket+0x6c1 (fffff80e`acce82a1)  Branch

storport!RaidStartIoPacket+0x228:
fffff80e`acce7e08 4d8badb8000000  mov     r13,qword ptr [r13+0B8h]
fffff80e`acce7e0f 4532ff          xor     r15b,r15b
fffff80e`acce7e12 448be2          mov     r12d,edx
fffff80e`acce7e15 4088757f        mov     byte ptr [rbp+7Fh],sil
fffff80e`acce7e19 4939b6e0130000  cmp     qword ptr [r14+13E0h],rsi
fffff80e`acce7e20 743d            je      storport!RaidStartIoPacket+0x27f (fffff80e`acce7e5f)  Branch

storport!RaidStartIoPacket+0x242:
fffff80e`acce7e22 448bc2          mov     r8d,edx
fffff80e`acce7e25 4138766c        cmp     byte ptr [r14+6Ch],sil
fffff80e`acce7e29 0f8c773f0200    jl      storport!RaidStartIoPacket+0x241c6 (fffff80e`acd0bda6)  Branch

storport!RaidStartIoPacket+0x24f:
fffff80e`acce7e2f 4139765c        cmp     dword ptr [r14+5Ch],esi
fffff80e`acce7e33 0f878f3f0200    ja      storport!RaidStartIoPacket+0x241e8 (fffff80e`acd0bdc8)  Branch

storport!RaidStartIoPacket+0x259:
fffff80e`acce7e39 498b8ee0130000  mov     rcx,qword ptr [r14+13E0h]
fffff80e`acce7e40 33d2            xor     edx,edx
fffff80e`acce7e42 488b09          mov     rcx,qword ptr [rcx]
fffff80e`acce7e45 48ff15ccc10500  call    qword ptr [storport!_imp_PoFxActivateComponent (fffff80e`acd44018)]
fffff80e`acce7e4c 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce7e51 0fb687a1000000  movzx   eax,byte ptr [rdi+0A1h]
fffff80e`acce7e58 41b702          mov     r15b,2
fffff80e`acce7e5b c6457f02        mov     byte ptr [rbp+7Fh],2

storport!RaidStartIoPacket+0x27f:
fffff80e`acce7e5f 84c0            test    al,al
fffff80e`acce7e61 0f8847050000    js      storport!RaidStartIoPacket+0x7ce (fffff80e`acce83ae)  Branch

storport!RaidStartIoPacket+0x287:
fffff80e`acce7e67 410fb6cf        movzx   ecx,r15b

storport!RaidStartIoPacket+0x28b:
fffff80e`acce7e6b 8bc1            mov     eax,ecx
fffff80e`acce7e6d 83e101          and     ecx,1
fffff80e`acce7e70 d1e8            shr     eax,1
fffff80e`acce7e72 83e001          and     eax,1
fffff80e`acce7e75 03c0            add     eax,eax
fffff80e`acce7e77 480bc1          or      rax,rcx
fffff80e`acce7e7a 49894510        mov     qword ptr [r13+10h],rax
fffff80e`acce7e7e 4c8b6d6f        mov     r13,qword ptr [rbp+6Fh]

storport!RaidStartIoPacket+0x2a2:
fffff80e`acce7e82 40387597        cmp     byte ptr [rbp-69h],sil
fffff80e`acce7e86 0f84aa000000    je      storport!RaidStartIoPacket+0x356 (fffff80e`acce7f36)  Branch

storport!RaidStartIoPacket+0x2ac:
fffff80e`acce7e8c 83bf700a0000ff  cmp     dword ptr [rdi+0A70h],0FFFFFFFFh
fffff80e`acce7e93 4c8bf6          mov     r14,rsi
fffff80e`acce7e96 750d            jne     storport!RaidStartIoPacket+0x2c5 (fffff80e`acce7ea5)  Branch

storport!RaidStartIoPacket+0x2b8:
fffff80e`acce7e98 83bf600a0000ff  cmp     dword ptr [rdi+0A60h],0FFFFFFFFh
fffff80e`acce7e9f 0f84b43f0200    je      storport!RaidStartIoPacket+0x24279 (fffff80e`acd0be59)  Branch

storport!RaidStartIoPacket+0x2c5:
fffff80e`acce7ea5 4c8b6708        mov     r12,qword ptr [rdi+8]
fffff80e`acce7ea9 41bf38000000    mov     r15d,38h
fffff80e`acce7eaf 418bd7          mov     edx,r15d
fffff80e`acce7eb2 41b852614354    mov     r8d,54436152h
fffff80e`acce7eb8 b900020000      mov     ecx,200h
fffff80e`acce7ebd 48ff154cc30500  call    qword ptr [storport!_imp_ExAllocatePoolWithTag (fffff80e`acd44210)]
fffff80e`acce7ec4 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce7ec9 4c8bf0          mov     r14,rax
fffff80e`acce7ecc 4885c0          test    rax,rax
fffff80e`acce7ecf 0f84953f0200    je      storport!RaidStartIoPacket+0x2428a (fffff80e`acd0be6a)  Branch

storport!RaidStartIoPacket+0x2f5:
fffff80e`acce7ed5 4d85f6          test    r14,r14
fffff80e`acce7ed8 7438            je      storport!RaidStartIoPacket+0x332 (fffff80e`acce7f12)  Branch

storport!RaidStartIoPacket+0x2fa:
fffff80e`acce7eda 4d8bc7          mov     r8,r15
fffff80e`acce7edd 33d2            xor     edx,edx
fffff80e`acce7edf 498bce          mov     rcx,r14
fffff80e`acce7ee2 e859c10100      call    storport!memset (fffff80e`acd04040)
fffff80e`acce7ee7 41c706dd22ee11  mov     dword ptr [r14],11EE22DDh
fffff80e`acce7eee 83bf700a0000ff  cmp     dword ptr [rdi+0A70h],0FFFFFFFFh
fffff80e`acce7ef5 0f858b3f0200    jne     storport!RaidStartIoPacket+0x242a6 (fffff80e`acd0be86)  Branch

storport!RaidStartIoPacket+0x31b:
fffff80e`acce7efb 48c7c0ffffffff  mov     rax,0FFFFFFFFFFFFFFFFh

storport!RaidStartIoPacket+0x322:
fffff80e`acce7f02 49894608        mov     qword ptr [r14+8],rax
fffff80e`acce7f06 834d7710        or      dword ptr [rbp+77h],10h
fffff80e`acce7f0a 49897e30        mov     qword ptr [r14+30h],rdi
fffff80e`acce7f0e 4d896e28        mov     qword ptr [r14+28h],r13

storport!RaidStartIoPacket+0x332:
fffff80e`acce7f12 807b0228        cmp     byte ptr [rbx+2],28h
fffff80e`acce7f16 0f85883f0200    jne     storport!RaidStartIoPacket+0x242c4 (fffff80e`acd0bea4)  Branch

storport!RaidStartIoPacket+0x33c:
fffff80e`acce7f1c 4d85f6          test    r14,r14
fffff80e`acce7f1f 740c            je      storport!RaidStartIoPacket+0x34d (fffff80e`acce7f2d)  Branch

storport!RaidStartIoPacket+0x341:
fffff80e`acce7f21 488b4360        mov     rax,qword ptr [rbx+60h]
fffff80e`acce7f25 49894610        mov     qword ptr [r14+10h],rax
fffff80e`acce7f29 4c897360        mov     qword ptr [rbx+60h],r14

storport!RaidStartIoPacket+0x34d:
fffff80e`acce7f2d 8b87680a0000    mov     eax,dword ptr [rdi+0A68h]
fffff80e`acce7f33 894328          mov     dword ptr [rbx+28h],eax

storport!RaidStartIoPacket+0x356:
fffff80e`acce7f36 b102            mov     cl,2
fffff80e`acce7f38 48ff1511c30500  call    qword ptr [storport!_imp_KfRaiseIrql (fffff80e`acd44250)]
fffff80e`acce7f3f 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce7f44 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff80e`acce7f48 884597          mov     byte ptr [rbp-69h],al
fffff80e`acce7f4b f6818412000001  test    byte ptr [rcx+1284h],1
fffff80e`acce7f52 0f8441030000    je      storport!RaidStartIoPacket+0x6b9 (fffff80e`acce8299)  Branch

storport!RaidStartIoPacket+0x378:
fffff80e`acce7f58 8b459b          mov     eax,dword ptr [rbp-65h]
fffff80e`acce7f5b 440fb7c0        movzx   r8d,ax
fffff80e`acce7f5f 443b059e680500  cmp     r8d,dword ptr [storport!g_RaidPerfRedirectGroupCount (fffff80e`acd3e804)]
fffff80e`acce7f66 0f832d030000    jae     storport!RaidStartIoPacket+0x6b9 (fffff80e`acce8299)  Branch

storport!RaidStartIoPacket+0x38c:
fffff80e`acce7f6c 488b0d6d680500  mov     rcx,qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff80e`acd3e7e0)]
fffff80e`acce7f73 440fb64d9d      movzx   r9d,byte ptr [rbp-63h]
fffff80e`acce7f78 0fb7d0          movzx   edx,ax
fffff80e`acce7f7b 443b0c91        cmp     r9d,dword ptr [rcx+rdx*4]
fffff80e`acce7f7f 0f8314030000    jae     storport!RaidStartIoPacket+0x6b9 (fffff80e`acce8299)  Branch

storport!RaidStartIoPacket+0x3a5:
fffff80e`acce7f85 488b057c680500  mov     rax,qword ptr [storport!g_RaidPerProcessorState (fffff80e`acd3e808)]
fffff80e`acce7f8c 41c1e006        shl     r8d,6
fffff80e`acce7f90 438d0c01        lea     ecx,[r9+r8]
fffff80e`acce7f94 48c1e107        shl     rcx,7
fffff80e`acce7f98 39740150        cmp     dword ptr [rcx+rax+50h],esi
fffff80e`acce7f9c 0f85f7020000    jne     storport!RaidStartIoPacket+0x6b9 (fffff80e`acce8299)  Branch

storport!RaidStartIoPacket+0x3c2:
fffff80e`acce7fa2 ba02000000      mov     edx,2
fffff80e`acce7fa7 41b501          mov     r13b,1
fffff80e`acce7faa 87540150        xchg    edx,dword ptr [rcx+rax+50h]

storport!RaidStartIoPacket+0x3ce:
fffff80e`acce7fae 488b459f        mov     rax,qword ptr [rbp-61h]
fffff80e`acce7fb2 32db            xor     bl,bl
fffff80e`acce7fb4 4c8b7d6f        mov     r15,qword ptr [rbp+6Fh]
fffff80e`acce7fb8 41c6878d000000a9 mov     byte ptr [r15+8Dh],0A9h
fffff80e`acce7fc0 48897820        mov     qword ptr [rax+20h],rdi
fffff80e`acce7fc4 488b4718        mov     rax,qword ptr [rdi+18h]
fffff80e`acce7fc8 4885c0          test    rax,rax
fffff80e`acce7fcb 7419            je      storport!RaidStartIoPacket+0x406 (fffff80e`acce7fe6)  Branch

storport!RaidStartIoPacket+0x3ed:
fffff80e`acce7fcd 4c8bb7d8000000  mov     r14,qword ptr [rdi+0D8h]
fffff80e`acce7fd4 4d85f6          test    r14,r14
fffff80e`acce7fd7 740d            je      storport!RaidStartIoPacket+0x406 (fffff80e`acce7fe6)  Branch

storport!RaidStartIoPacket+0x3f9:
fffff80e`acce7fd9 4839b088130000  cmp     qword ptr [rax+1388h],rsi
fffff80e`acce7fe0 0f8715030000    ja      storport!RaidStartIoPacket+0x71b (fffff80e`acce82fb)  Branch

storport!RaidStartIoPacket+0x406:
fffff80e`acce7fe6 448b6577        mov     r12d,dword ptr [rbp+77h]
fffff80e`acce7fea 488d8f90010000  lea     rcx,[rdi+190h]
fffff80e`acce7ff1 458bc4          mov     r8d,r12d
fffff80e`acce7ff4 885c2420        mov     byte ptr [rsp+20h],bl
fffff80e`acce7ff8 498bd7          mov     rdx,r15
fffff80e`acce7ffb e8e0050000      call    storport!RaidInsertDeviceQueue (fffff80e`acce85e0)
fffff80e`acce8000 440fb6f0        movzx   r14d,al
fffff80e`acce8004 84db            test    bl,bl
fffff80e`acce8006 0f8571050000    jne     storport!RaidStartIoPacket+0x99d (fffff80e`acce857d)  Branch

storport!RaidStartIoPacket+0x42c:
fffff80e`acce800c 41f6c408        test    r12b,8
fffff80e`acce8010 750d            jne     storport!RaidStartIoPacket+0x43f (fffff80e`acce801f)  Branch

storport!RaidStartIoPacket+0x432:
fffff80e`acce8012 4038b7b7010000  cmp     byte ptr [rdi+1B7h],sil
fffff80e`acce8019 0f8573050000    jne     storport!RaidStartIoPacket+0x9b2 (fffff80e`acce8592)  Branch

storport!RaidStartIoPacket+0x43f:
fffff80e`acce801f 4584f6          test    r14b,r14b
fffff80e`acce8022 0f8538050000    jne     storport!RaidStartIoPacket+0x980 (fffff80e`acce8560)  Branch

storport!RaidStartIoPacket+0x448:
fffff80e`acce8028 41c6878d000000a8 mov     byte ptr [r15+8Dh],0A8h
fffff80e`acce8030 4983c778        add     r15,78h
fffff80e`acce8034 488b9f98010000  mov     rbx,qword ptr [rdi+198h]
fffff80e`acce803b 4c897db7        mov     qword ptr [rbp-49h],r15
fffff80e`acce803f 39732c          cmp     dword ptr [rbx+2Ch],esi
fffff80e`acce8042 0f8f99040000    jg      storport!RaidStartIoPacket+0x901 (fffff80e`acce84e1)  Branch

storport!RaidStartIoPacket+0x468:
fffff80e`acce8048 397328          cmp     dword ptr [rbx+28h],esi
fffff80e`acce804b 0f8f90040000    jg      storport!RaidStartIoPacket+0x901 (fffff80e`acce84e1)  Branch

storport!RaidStartIoPacket+0x471:
fffff80e`acce8051 8b8b80000000    mov     ecx,dword ptr [rbx+80h]
fffff80e`acce8057 85c9            test    ecx,ecx
fffff80e`acce8059 0f8437030000    je      storport!RaidStartIoPacket+0x7b6 (fffff80e`acce8396)  Branch

storport!RaidStartIoPacket+0x47f:
fffff80e`acce805f 658b0425a4010000 mov     eax,dword ptr gs:[1A4h]
fffff80e`acce8067 33d2            xor     edx,edx
fffff80e`acce8069 0fafc1          imul    eax,ecx
fffff80e`acce806c 488b4b40        mov     rcx,qword ptr [rbx+40h]
fffff80e`acce8070 f7b384000000    div     eax,dword ptr [rbx+84h]
fffff80e`acce8076 448bf8          mov     r15d,eax
fffff80e`acce8079 488b0cc1        mov     rcx,qword ptr [rcx+rax*8]
fffff80e`acce807d 48ff152cc00500  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff80e`acd440b0)]
fffff80e`acce8084 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce8089 488bc8          mov     rcx,rax
fffff80e`acce808c 4885c0          test    rax,rax
fffff80e`acce808f 0f843c3e0200    je      storport!RaidStartIoPacket+0x242f1 (fffff80e`acd0bed1)  Branch

storport!RaidStartIoPacket+0x4b5:
fffff80e`acce8095 448939          mov     dword ptr [rcx],r15d

storport!RaidStartIoPacket+0x4b8:
fffff80e`acce8098 4c8b7db7        mov     r15,qword ptr [rbp-49h]

storport!RaidStartIoPacket+0x4bc:
fffff80e`acce809c 4885c9          test    rcx,rcx
fffff80e`acce809f 0f848e3e0200    je      storport!RaidStartIoPacket+0x24353 (fffff80e`acd0bf33)  Branch

storport!RaidStartIoPacket+0x4c5:
fffff80e`acce80a5 41bf01000000    mov     r15d,1
fffff80e`acce80ab 418bc7          mov     eax,r15d
fffff80e`acce80ae f00fc183c0000000 lock xadd dword ptr [rbx+0C0h],eax
fffff80e`acce80b6 ffc0            inc     eax
fffff80e`acce80b8 3b4324          cmp     eax,dword ptr [rbx+24h]
fffff80e`acce80bb 0f83a7040000    jae     storport!RaidStartIoPacket+0x988 (fffff80e`acce8568)  Branch

storport!RaidStartIoPacket+0x4e1:
fffff80e`acce80c1 488d5920        lea     rbx,[rcx+20h]
fffff80e`acce80c5 48895de7        mov     qword ptr [rbp-19h],rbx
fffff80e`acce80c9 488d8140030000  lea     rax,[rcx+340h]
fffff80e`acce80d0 488945ef        mov     qword ptr [rbp-11h],rax
fffff80e`acce80d4 488d8140040000  lea     rax,[rcx+440h]
fffff80e`acce80db 488945df        mov     qword ptr [rbp-21h],rax
fffff80e`acce80df b8ffff0000      mov     eax,0FFFFh
fffff80e`acce80e4 4c8b8918030000  mov     r9,qword ptr [rcx+318h]
fffff80e`acce80eb 8b9108030000    mov     edx,dword ptr [rcx+308h]
fffff80e`acce80f1 8063109c        and     byte ptr [rbx+10h],9Ch
fffff80e`acce80f5 4c8bb310030000  mov     r14,qword ptr [rbx+310h]
fffff80e`acce80fc 66894312        mov     word ptr [rbx+12h],ax
fffff80e`acce8100 0fb64310        movzx   eax,byte ptr [rbx+10h]
fffff80e`acce8104 c7034c3d2e1f    mov     dword ptr [rbx],1F2E3D4Ch
fffff80e`acce810a 48897308        mov     qword ptr [rbx+8],rsi
fffff80e`acce810e c64314ff        mov     byte ptr [rbx+14h],0FFh
fffff80e`acce8112 897318          mov     dword ptr [rbx+18h],esi
fffff80e`acce8115 48897368        mov     qword ptr [rbx+68h],rsi
fffff80e`acce8119 48897370        mov     qword ptr [rbx+70h],rsi
fffff80e`acce811d 4889b388000000  mov     qword ptr [rbx+88h],rsi
fffff80e`acce8124 4889b398000000  mov     qword ptr [rbx+98h],rsi
fffff80e`acce812b 4889b390000000  mov     qword ptr [rbx+90h],rsi
fffff80e`acce8132 4889b3c0000000  mov     qword ptr [rbx+0C0h],rsi
fffff80e`acce8139 4889b3a0000000  mov     qword ptr [rbx+0A0h],rsi
fffff80e`acce8140 4889b3a8000000  mov     qword ptr [rbx+0A8h],rsi
fffff80e`acce8147 4889b3d8000000  mov     qword ptr [rbx+0D8h],rsi
fffff80e`acce814e 4889b3e0000000  mov     qword ptr [rbx+0E0h],rsi
fffff80e`acce8155 48897378        mov     qword ptr [rbx+78h],rsi
fffff80e`acce8159 4889b3b8020000  mov     qword ptr [rbx+2B8h],rsi
fffff80e`acce8160 4889b3c0020000  mov     qword ptr [rbx+2C0h],rsi
fffff80e`acce8167 4889b3c8020000  mov     qword ptr [rbx+2C8h],rsi
fffff80e`acce816e 4889b3d0020000  mov     qword ptr [rbx+2D0h],rsi
fffff80e`acce8175 8993e8020000    mov     dword ptr [rbx+2E8h],edx
fffff80e`acce817b 4c898bf8020000  mov     qword ptr [rbx+2F8h],r9
fffff80e`acce8182 4d85c9          test    r9,r9
fffff80e`acce8185 7411            je      storport!RaidStartIoPacket+0x5b8 (fffff80e`acce8198)  Branch

storport!RaidStartIoPacket+0x5a7:
fffff80e`acce8187 448bc2          mov     r8d,edx
fffff80e`acce818a 498bc9          mov     rcx,r9
fffff80e`acce818d 33d2            xor     edx,edx
fffff80e`acce818f e8acbe0100      call    storport!memset (fffff80e`acd04040)
fffff80e`acce8194 0fb64310        movzx   eax,byte ptr [rbx+10h]

storport!RaidStartIoPacket+0x5b8:
fffff80e`acce8198 806311f0        and     byte ptr [rbx+11h],0F0h
fffff80e`acce819c 4c8d45d7        lea     r8,[rbp-29h]
fffff80e`acce81a0 488b556f        mov     rdx,qword ptr [rbp+6Fh]
fffff80e`acce81a4 247f            and     al,7Fh
fffff80e`acce81a6 884310          mov     byte ptr [rbx+10h],al
fffff80e`acce81a9 4889b300030000  mov     qword ptr [rbx+300h],rsi
fffff80e`acce81b0 89b3ec020000    mov     dword ptr [rbx+2ECh],esi
fffff80e`acce81b6 89b308030000    mov     dword ptr [rbx+308h],esi
fffff80e`acce81bc 4c89b310030000  mov     qword ptr [rbx+310h],r14
fffff80e`acce81c3 488b8788010000  mov     rax,qword ptr [rdi+188h]
fffff80e`acce81ca 488b8f80010000  mov     rcx,qword ptr [rdi+180h]
fffff80e`acce81d1 ff1501c60500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`acd447d8)]   ;RaidUnitStartIo()
fffff80e`acce81d7 458bf7          mov     r14d,r15d

storport!RaidStartIoPacket+0x5fa:
fffff80e`acce81da 4180fd01        cmp     r13b,1
fffff80e`acce81de 0f8588000000    jne     storport!RaidStartIoPacket+0x68c (fffff80e`acce826c)  Branch

storport!RaidStartIoPacket+0x604:
fffff80e`acce81e4 488b4718        mov     rax,qword ptr [rdi+18h]
fffff80e`acce81e8 4484a884120000  test    byte ptr [rax+1284h],r13b
fffff80e`acce81ef 747b            je      storport!RaidStartIoPacket+0x68c (fffff80e`acce826c)  Branch

storport!RaidStartIoPacket+0x611:
fffff80e`acce81f1 8b459b          mov     eax,dword ptr [rbp-65h]
fffff80e`acce81f4 0fb7d0          movzx   edx,ax
fffff80e`acce81f7 3b1507660500    cmp     edx,dword ptr [storport!g_RaidPerfRedirectGroupCount (fffff80e`acd3e804)]
fffff80e`acce81fd 736d            jae     storport!RaidStartIoPacket+0x68c (fffff80e`acce826c)  Branch

storport!RaidStartIoPacket+0x61f:
fffff80e`acce81ff 440fb6459d      movzx   r8d,byte ptr [rbp-63h]
fffff80e`acce8204 0fb7c8          movzx   ecx,ax
fffff80e`acce8207 488b05d2650500  mov     rax,qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff80e`acd3e7e0)]
fffff80e`acce820e 443b0488        cmp     r8d,dword ptr [rax+rcx*4]
fffff80e`acce8212 7358            jae     storport!RaidStartIoPacket+0x68c (fffff80e`acce826c)  Branch

storport!RaidStartIoPacket+0x634:
fffff80e`acce8214 488b05ed650500  mov     rax,qword ptr [storport!g_RaidPerProcessorState (fffff80e`acd3e808)]
fffff80e`acce821b c1e206          shl     edx,6
fffff80e`acce821e 418d0c10        lea     ecx,[r8+rdx]
fffff80e`acce8222 41b801000000    mov     r8d,1
fffff80e`acce8228 48c1e107        shl     rcx,7
fffff80e`acce822c 488d5040        lea     rdx,[rax+40h]
fffff80e`acce8230 4487440150      xchg    r8d,dword ptr [rcx+rax+50h]
fffff80e`acce8235 4803ca          add     rcx,rdx
fffff80e`acce8238 48ff1521be0500  call    qword ptr [storport!_imp_ExpInterlockedFlushSList (fffff80e`acd44060)]
fffff80e`acce823f 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce8244 488bd8          mov     rbx,rax
fffff80e`acce8247 4885c0          test    rax,rax
fffff80e`acce824a 0f85e0010000    jne     storport!RaidStartIoPacket+0x850 (fffff80e`acce8430)  Branch

storport!RaidStartIoPacket+0x670:
fffff80e`acce8250 0fb7559b        movzx   edx,word ptr [rbp-65h]
fffff80e`acce8254 0fb64d9d        movzx   ecx,byte ptr [rbp-63h]
fffff80e`acce8258 c1e206          shl     edx,6
fffff80e`acce825b 03d1            add     edx,ecx
fffff80e`acce825d 488b0da4650500  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff80e`acd3e808)]
fffff80e`acce8264 48c1e207        shl     rdx,7
fffff80e`acce8268 87740a50        xchg    esi,dword ptr [rdx+rcx+50h]

storport!RaidStartIoPacket+0x68c:
fffff80e`acce826c 0fb64d97        movzx   ecx,byte ptr [rbp-69h]
fffff80e`acce8270 48ff1529bf0500  call    qword ptr [storport!_imp_KeLowerIrql (fffff80e`acd441a0)]
fffff80e`acce8277 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce827c 418bc6          mov     eax,r14d

storport!RaidStartIoPacket+0x69f:
fffff80e`acce827f 4c8bb424b8000000 mov     r14,qword ptr [rsp+0B8h]
fffff80e`acce8287 4881c4c0000000  add     rsp,0C0h
fffff80e`acce828e 415f            pop     r15
fffff80e`acce8290 415d            pop     r13
fffff80e`acce8292 415c            pop     r12
fffff80e`acce8294 5f              pop     rdi
fffff80e`acce8295 5e              pop     rsi
fffff80e`acce8296 5b              pop     rbx
fffff80e`acce8297 5d              pop     rbp
fffff80e`acce8298 c3              ret

storport!RaidStartIoPacket+0x6b9:
fffff80e`acce8299 4532ed          xor     r13b,r13b
fffff80e`acce829c e90dfdffff      jmp     storport!RaidStartIoPacket+0x3ce (fffff80e`acce7fae)  Branch

storport!RaidStartIoPacket+0x6c1:
fffff80e`acce82a1 4d8badb8000000  mov     r13,qword ptr [r13+0B8h]
fffff80e`acce82a8 4532f6          xor     r14b,r14b
fffff80e`acce82ab 40887567        mov     byte ptr [rbp+67h],sil
fffff80e`acce82af 4939b7e0130000  cmp     qword ptr [r15+13E0h],rsi
fffff80e`acce82b6 742d            je      storport!RaidStartIoPacket+0x705 (fffff80e`acce82e5)  Branch

storport!RaidStartIoPacket+0x6d8:
fffff80e`acce82b8 4138776c        cmp     byte ptr [r15+6Ch],sil
fffff80e`acce82bc 0f8c443b0200    jl      storport!RaidStartIoPacket+0x24226 (fffff80e`acd0be06)  Branch

storport!RaidStartIoPacket+0x6e2:
fffff80e`acce82c2 498b8fe0130000  mov     rcx,qword ptr [r15+13E0h]
fffff80e`acce82c9 33d2            xor     edx,edx
fffff80e`acce82cb 488b09          mov     rcx,qword ptr [rcx]
fffff80e`acce82ce 448d4202        lea     r8d,[rdx+2]
fffff80e`acce82d2 48ff153fbd0500  call    qword ptr [storport!_imp_PoFxActivateComponent (fffff80e`acd44018)]
fffff80e`acce82d9 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce82de c6456702        mov     byte ptr [rbp+67h],2
fffff80e`acce82e2 41b602          mov     r14b,2

storport!RaidStartIoPacket+0x705:
fffff80e`acce82e5 4038b7a1000000  cmp     byte ptr [rdi+0A1h],sil
fffff80e`acce82ec 0f8c7f010000    jl      storport!RaidStartIoPacket+0x891 (fffff80e`acce8471)  Branch

storport!RaidStartIoPacket+0x712:
fffff80e`acce82f2 410fb6ce        movzx   ecx,r14b
fffff80e`acce82f6 e970fbffff      jmp     storport!RaidStartIoPacket+0x28b (fffff80e`acce7e6b)  Branch

storport!RaidStartIoPacket+0x71b:
fffff80e`acce82fb 48ff1586be0500  call    qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff80e`acd44188)]
fffff80e`acce8302 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce8307 0fb7c0          movzx   eax,ax
fffff80e`acce830a 49c7c4ffffffff  mov     r12,0FFFFFFFFFFFFFFFFh
fffff80e`acce8311 83c001          add     eax,1
fffff80e`acce8314 7445            je      storport!RaidStartIoPacket+0x77b (fffff80e`acce835b)  Branch

storport!RaidStartIoPacket+0x736:
fffff80e`acce8316 4983c640        add     r14,40h
fffff80e`acce831a 448bf8          mov     r15d,eax

storport!RaidStartIoPacket+0x73d:
fffff80e`acce831d 498d4e28        lea     rcx,[r14+28h]
fffff80e`acce8321 488d55f7        lea     rdx,[rbp-9]
fffff80e`acce8325 48ff1584bf0500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff80e`acd442b0)]
fffff80e`acce832c 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce8331 498b06          mov     rax,qword ptr [r14]
fffff80e`acce8334 493bc6          cmp     rax,r14
fffff80e`acce8337 0f851f010000    jne     storport!RaidStartIoPacket+0x87c (fffff80e`acce845c)  Branch

storport!RaidStartIoPacket+0x75d:
fffff80e`acce833d 488d4df7        lea     rcx,[rbp-9]
fffff80e`acce8341 48ff15e8bc0500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff80e`acd44030)]
fffff80e`acce8348 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce834d 4983c640        add     r14,40h
fffff80e`acce8351 4983ef01        sub     r15,1
fffff80e`acce8355 75c6            jne     storport!RaidStartIoPacket+0x73d (fffff80e`acce831d)  Branch

storport!RaidStartIoPacket+0x777:
fffff80e`acce8357 4c8b7d6f        mov     r15,qword ptr [rbp+6Fh]

storport!RaidStartIoPacket+0x77b:
fffff80e`acce835b 4983fcff        cmp     r12,0FFFFFFFFFFFFFFFFh
fffff80e`acce835f 4c8bf6          mov     r14,rsi
fffff80e`acce8362 4d0f45f4        cmovne  r14,r12
fffff80e`acce8366 4d85f6          test    r14,r14
fffff80e`acce8369 0f8477fcffff    je      storport!RaidStartIoPacket+0x406 (fffff80e`acce7fe6)  Branch

storport!RaidStartIoPacket+0x78f:
fffff80e`acce836f 48ff1532bd0500  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`acd440a8)]
fffff80e`acce8376 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce837b 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff80e`acce837f 492bc6          sub     rax,r14
fffff80e`acce8382 483b8188130000  cmp     rax,qword ptr [rcx+1388h]
fffff80e`acce8389 0f87e7010000    ja      storport!RaidStartIoPacket+0x996 (fffff80e`acce8576)  Branch

storport!RaidStartIoPacket+0x7af:
fffff80e`acce838f 32db            xor     bl,bl
fffff80e`acce8391 e950fcffff      jmp     storport!RaidStartIoPacket+0x406 (fffff80e`acce7fe6)  Branch

storport!RaidStartIoPacket+0x7b6:
fffff80e`acce8396 488d4b40        lea     rcx,[rbx+40h]
fffff80e`acce839a 48ff150fbd0500  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff80e`acd440b0)]
fffff80e`acce83a1 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce83a6 488bc8          mov     rcx,rax
fffff80e`acce83a9 e9eefcffff      jmp     storport!RaidStartIoPacket+0x4bc (fffff80e`acce809c)  Branch

storport!RaidStartIoPacket+0x7ce:
fffff80e`acce83ae 488b8fc8050000  mov     rcx,qword ptr [rdi+5C8h]
fffff80e`acce83b5 48ff15c4bd0500  call    qword ptr [storport!_imp_ExAcquireRundownProtectionCacheAware (fffff80e`acd44180)]
fffff80e`acce83bc 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce83c1 84c0            test    al,al
fffff80e`acce83c3 0f849efaffff    je      storport!RaidStartIoPacket+0x287 (fffff80e`acce7e67)  Branch

storport!RaidStartIoPacket+0x7e9:
fffff80e`acce83c9 4138766c        cmp     byte ptr [r14+6Ch],sil
fffff80e`acce83cd 0f8c003a0200    jl      storport!RaidStartIoPacket+0x241f3 (fffff80e`acd0bdd3)  Branch

storport!RaidStartIoPacket+0x7f3:
fffff80e`acce83d3 488b8fd0050000  mov     rcx,qword ptr [rdi+5D0h]
fffff80e`acce83da 8b818c000000    mov     eax,dword ptr [rcx+8Ch]
fffff80e`acce83e0 a801            test    al,1
fffff80e`acce83e2 0f850b3a0200    jne     storport!RaidStartIoPacket+0x24213 (fffff80e`acd0bdf3)  Branch

storport!RaidStartIoPacket+0x808:
fffff80e`acce83e8 39b7ac020000    cmp     dword ptr [rdi+2ACh],esi
fffff80e`acce83ee 7606            jbe     storport!RaidStartIoPacket+0x816 (fffff80e`acce83f6)  Branch

storport!RaidStartIoPacket+0x810:
fffff80e`acce83f0 41bc05000000    mov     r12d,5

storport!RaidStartIoPacket+0x816:
fffff80e`acce83f6 488b09          mov     rcx,qword ptr [rcx]
fffff80e`acce83f9 458bc4          mov     r8d,r12d
fffff80e`acce83fc 33d2            xor     edx,edx
fffff80e`acce83fe 48ff1513bc0500  call    qword ptr [storport!_imp_PoFxActivateComponent (fffff80e`acd44018)]
fffff80e`acce8405 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce840a 488b8fc8050000  mov     rcx,qword ptr [rdi+5C8h]
fffff80e`acce8411 48ff1578be0500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff80e`acd44290)]
fffff80e`acce8418 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce841d 440fb67d7f      movzx   r15d,byte ptr [rbp+7Fh]
fffff80e`acce8422 4180cf01        or      r15b,1
fffff80e`acce8426 e93cfaffff      jmp     storport!RaidStartIoPacket+0x287 (fffff80e`acce7e67)  Branch

storport!RaidStartIoPacket+0x850:
fffff80e`acce8430 f643f101        test    byte ptr [rbx-0Fh],1
fffff80e`acce8434 488d7be0        lea     rdi,[rbx-20h]
fffff80e`acce8438 488b1b          mov     rbx,qword ptr [rbx]
fffff80e`acce843b 0f856c3b0200    jne     storport!RaidStartIoPacket+0x243cd (fffff80e`acd0bfad)  Branch

storport!RaidStartIoPacket+0x861:
fffff80e`acce8441 488b8790020000  mov     rax,qword ptr [rdi+290h]
fffff80e`acce8448 488bcf          mov     rcx,rdi
fffff80e`acce844b ff1587c30500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`acd447d8)]
fffff80e`acce8451 4885db          test    rbx,rbx
fffff80e`acce8454 0f84f6fdffff    je      storport!RaidStartIoPacket+0x670 (fffff80e`acce8250)  Branch

storport!RaidStartIoPacket+0x87a:
fffff80e`acce845a ebd4            jmp     storport!RaidStartIoPacket+0x850 (fffff80e`acce8430)  Branch

storport!RaidStartIoPacket+0x87c:
fffff80e`acce845c 488b4028        mov     rax,qword ptr [rax+28h]
fffff80e`acce8460 493bc4          cmp     rax,r12
fffff80e`acce8463 0f83d4feffff    jae     storport!RaidStartIoPacket+0x75d (fffff80e`acce833d)  Branch

storport!RaidStartIoPacket+0x889:
fffff80e`acce8469 4c8be0          mov     r12,rax
fffff80e`acce846c e9ccfeffff      jmp     storport!RaidStartIoPacket+0x75d (fffff80e`acce833d)  Branch

storport!RaidStartIoPacket+0x891:
fffff80e`acce8471 488b8fc8050000  mov     rcx,qword ptr [rdi+5C8h]
fffff80e`acce8478 48ff1501bd0500  call    qword ptr [storport!_imp_ExAcquireRundownProtectionCacheAware (fffff80e`acd44180)]
fffff80e`acce847f 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce8484 84c0            test    al,al
fffff80e`acce8486 0f8466feffff    je      storport!RaidStartIoPacket+0x712 (fffff80e`acce82f2)  Branch

storport!RaidStartIoPacket+0x8ac:
fffff80e`acce848c 4138776c        cmp     byte ptr [r15+6Ch],sil
fffff80e`acce8490 0f8c90390200    jl      storport!RaidStartIoPacket+0x24246 (fffff80e`acd0be26)  Branch

storport!RaidStartIoPacket+0x8b6:
fffff80e`acce8496 488b8fd0050000  mov     rcx,qword ptr [rdi+5D0h]
fffff80e`acce849d 8b818c000000    mov     eax,dword ptr [rcx+8Ch]
fffff80e`acce84a3 a801            test    al,1
fffff80e`acce84a5 0f859b390200    jne     storport!RaidStartIoPacket+0x24266 (fffff80e`acd0be46)  Branch

storport!RaidStartIoPacket+0x8cb:
fffff80e`acce84ab 488b09          mov     rcx,qword ptr [rcx]
fffff80e`acce84ae 33d2            xor     edx,edx
fffff80e`acce84b0 448d4202        lea     r8d,[rdx+2]
fffff80e`acce84b4 48ff155dbb0500  call    qword ptr [storport!_imp_PoFxActivateComponent (fffff80e`acd44018)]
fffff80e`acce84bb 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce84c0 488b8fc8050000  mov     rcx,qword ptr [rdi+5C8h]
fffff80e`acce84c7 48ff15c2bd0500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff80e`acd44290)]
fffff80e`acce84ce 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce84d3 440fb67567      movzx   r14d,byte ptr [rbp+67h]
fffff80e`acce84d8 4180ce01        or      r14b,1
fffff80e`acce84dc e911feffff      jmp     storport!RaidStartIoPacket+0x712 (fffff80e`acce82f2)  Branch

storport!RaidStartIoPacket+0x901:
fffff80e`acce84e1 488d55bf        lea     rdx,[rbp-41h]
fffff80e`acce84e5 488bcb          mov     rcx,rbx
fffff80e`acce84e8 48ff1571be0500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLockAtDpcLevel (fffff80e`acd44360)]
fffff80e`acce84ef 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce84f4 39732c          cmp     dword ptr [rbx+2Ch],esi
fffff80e`acce84f7 0f8ebf000000    jle     storport!RaidStartIoPacket+0x9dc (fffff80e`acce85bc)  Branch

storport!RaidStartIoPacket+0x91d:
fffff80e`acce84fd 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80e`acce8501 488d4308        lea     rax,[rbx+8]
fffff80e`acce8505 483901          cmp     qword ptr [rcx],rax
fffff80e`acce8508 0f85983a0200    jne     storport!RaidStartIoPacket+0x243c6 (fffff80e`acd0bfa6)  Branch

storport!RaidStartIoPacket+0x92e:
fffff80e`acce850e 498907          mov     qword ptr [r15],rax
fffff80e`acce8511 49894f08        mov     qword ptr [r15+8],rcx
fffff80e`acce8515 4c8939          mov     qword ptr [rcx],r15
fffff80e`acce8518 4c897808        mov     qword ptr [rax+8],r15
fffff80e`acce851c ff4318          inc     dword ptr [rbx+18h]
fffff80e`acce851f 41f6471620      test    byte ptr [r15+16h],20h
fffff80e`acce8524 742a            je      storport!RaidStartIoPacket+0x970 (fffff80e`acce8550)  Branch

storport!RaidStartIoPacket+0x946:
fffff80e`acce8526 498bcf          mov     rcx,r15
fffff80e`acce8529 e80e780100      call    storport!RaidGetQosEntryForDeviceEntry (fffff80e`accffd3c)
fffff80e`acce852e 4881c308010000  add     rbx,108h
fffff80e`acce8535 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff80e`acce8539 483919          cmp     qword ptr [rcx],rbx
fffff80e`acce853c 0f85643a0200    jne     storport!RaidStartIoPacket+0x243c6 (fffff80e`acd0bfa6)  Branch

storport!RaidStartIoPacket+0x962:
fffff80e`acce8542 488918          mov     qword ptr [rax],rbx
fffff80e`acce8545 48894808        mov     qword ptr [rax+8],rcx
fffff80e`acce8549 488901          mov     qword ptr [rcx],rax
fffff80e`acce854c 48894308        mov     qword ptr [rbx+8],rax

storport!RaidStartIoPacket+0x970:
fffff80e`acce8550 488d4dbf        lea     rcx,[rbp-41h]
fffff80e`acce8554 48ff150dbe0500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLockFromDpcLevel (fffff80e`acd44368)]
fffff80e`acce855b 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidStartIoPacket+0x980:
fffff80e`acce8560 448bf6          mov     r14d,esi
fffff80e`acce8563 e972fcffff      jmp     storport!RaidStartIoPacket+0x5fa (fffff80e`acce81da)  Branch

storport!RaidStartIoPacket+0x988:
fffff80e`acce8568 8b83c0000000    mov     eax,dword ptr [rbx+0C0h]
fffff80e`acce856e 894324          mov     dword ptr [rbx+24h],eax
fffff80e`acce8571 e94bfbffff      jmp     storport!RaidStartIoPacket+0x4e1 (fffff80e`acce80c1)  Branch

storport!RaidStartIoPacket+0x996:
fffff80e`acce8576 b301            mov     bl,1
fffff80e`acce8578 e969faffff      jmp     storport!RaidStartIoPacket+0x406 (fffff80e`acce7fe6)  Branch

storport!RaidStartIoPacket+0x99d:
fffff80e`acce857d 4584f6          test    r14b,r14b
fffff80e`acce8580 0f8486faffff    je      storport!RaidStartIoPacket+0x42c (fffff80e`acce800c)  Branch

storport!RaidStartIoPacket+0x9a6:
fffff80e`acce8586 48ff87b0060000  inc     qword ptr [rdi+6B0h]
fffff80e`acce858d e97afaffff      jmp     storport!RaidStartIoPacket+0x42c (fffff80e`acce800c)  Branch

storport!RaidStartIoPacket+0x9b2:
fffff80e`acce8592 4038b7a1000000  cmp     byte ptr [rdi+0A1h],sil
fffff80e`acce8599 0f8c80faffff    jl      storport!RaidStartIoPacket+0x43f (fffff80e`acce801f)  Branch

storport!RaidStartIoPacket+0x9bf:
fffff80e`acce859f e91f390200      jmp     storport!RaidStartIoPacket+0x242e3 (fffff80e`acd0bec3)  Branch

storport!RaidStartIoPacket+0x9c4:
fffff80e`acce85a4 488b8fc8050000  mov     rcx,qword ptr [rdi+5C8h]
fffff80e`acce85ab 48ff15debc0500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff80e`acd44290)]
fffff80e`acce85b2 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce85b7 e9c6f8ffff      jmp     storport!RaidStartIoPacket+0x2a2 (fffff80e`acce7e82)  Branch

storport!RaidStartIoPacket+0x9dc:
fffff80e`acce85bc 397328          cmp     dword ptr [rbx+28h],esi
fffff80e`acce85bf 0f8f38ffffff    jg      storport!RaidStartIoPacket+0x91d (fffff80e`acce84fd)  Branch

storport!RaidStartIoPacket+0x9e5:
fffff80e`acce85c5 488d4dbf        lea     rcx,[rbp-41h]
fffff80e`acce85c9 48ff1598bd0500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLockFromDpcLevel (fffff80e`acd44368)]
fffff80e`acce85d0 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acce85d5 e977faffff      jmp     storport!RaidStartIoPacket+0x471 (fffff80e`acce8051)  Branch

storport!RaidStartIoPacket+0x23dc4:
fffff80e`acd0b9a4 0fb6c8          movzx   ecx,al
fffff80e`acd0b9a7 e990c2fdff      jmp     storport!RaidStartIoPacket+0x5c (fffff80e`acce7c3c)  Branch

storport!RaidStartIoPacket+0x23dcc:
fffff80e`acd0b9ac 83e941          sub     ecx,41h
fffff80e`acd0b9af 7423            je      storport!RaidStartIoPacket+0x23df4 (fffff80e`acd0b9d4)  Branch

storport!RaidStartIoPacket+0x23dd1:
fffff80e`acd0b9b1 83e901          sub     ecx,1
fffff80e`acd0b9b4 752b            jne     storport!RaidStartIoPacket+0x23e01 (fffff80e`acd0b9e1)  Branch

storport!RaidStartIoPacket+0x23dd6:
fffff80e`acd0b9b6 498d4928        lea     rcx,[r9+28h]
fffff80e`acd0b9ba 493bc8          cmp     rcx,r8
fffff80e`acd0b9bd 7722            ja      storport!RaidStartIoPacket+0x23e01 (fffff80e`acd0b9e1)  Branch

storport!RaidStartIoPacket+0x23ddf:
fffff80e`acd0b9bf 488d5320        lea     rdx,[rbx+20h]
fffff80e`acd0b9c3 4903d1          add     rdx,r9
fffff80e`acd0b9c6 413974190c      cmp     dword ptr [r9+rbx+0Ch],esi
fffff80e`acd0b9cb 480f44d6        cmove   rdx,rsi
fffff80e`acd0b9cf e9d6c2fdff      jmp     storport!RaidStartIoPacket+0xca (fffff80e`acce7caa)  Branch

storport!RaidStartIoPacket+0x23df4:
fffff80e`acd0b9d4 498d4938        lea     rcx,[r9+38h]
fffff80e`acd0b9d8 493bc8          cmp     rcx,r8
fffff80e`acd0b9db 0f86bbc2fdff    jbe     storport!RaidStartIoPacket+0xbc (fffff80e`acce7c9c)  Branch

storport!RaidStartIoPacket+0x23e01:
fffff80e`acd0b9e1 41ffc3          inc     r11d
fffff80e`acd0b9e4 453bda          cmp     r11d,r10d
fffff80e`acd0b9e7 0f8273c2fdff    jb      storport!RaidStartIoPacket+0x80 (fffff80e`acce7c60)  Branch

storport!RaidStartIoPacket+0x23e0d:
fffff80e`acd0b9ed e9b8c2fdff      jmp     storport!RaidStartIoPacket+0xca (fffff80e`acce7caa)  Branch

storport!RaidStartIoPacket+0x23e12:
fffff80e`acd0b9f2 488d5348        lea     rdx,[rbx+48h]
fffff80e`acd0b9f6 e9afc2fdff      jmp     storport!RaidStartIoPacket+0xca (fffff80e`acce7caa)  Branch

storport!RaidStartIoPacket+0x23e1b:
fffff80e`acd0b9fb 80f99e          cmp     cl,9Eh
fffff80e`acd0b9fe 0f84bdc2fdff    je      storport!RaidStartIoPacket+0xe1 (fffff80e`acce7cc1)  Branch

storport!RaidStartIoPacket+0x23e24:
fffff80e`acd0ba04 80e95e          sub     cl,5Eh
fffff80e`acd0ba07 80f901          cmp     cl,1
fffff80e`acd0ba0a 0f8755c3fdff    ja      storport!RaidStartIoPacket+0x185 (fffff80e`acce7d65)  Branch

storport!RaidStartIoPacket+0x23e30:
fffff80e`acd0ba10 e9acc2fdff      jmp     storport!RaidStartIoPacket+0xe1 (fffff80e`acce7cc1)  Branch

storport!RaidStartIoPacket+0x23e35:
fffff80e`acd0ba15 488bcb          mov     rcx,rbx
fffff80e`acd0ba18 e8f7dc0000      call    storport!RaidIsUnresponsiveBlockedCmd (fffff80e`acd19714)
fffff80e`acd0ba1d 84c0            test    al,al
fffff80e`acd0ba1f 0f84c3c2fdff    je      storport!RaidStartIoPacket+0x108 (fffff80e`acce7ce8)  Branch

storport!RaidStartIoPacket+0x23e45:
fffff80e`acd0ba25 488bcf          mov     rcx,rdi
fffff80e`acd0ba28 e82feefdff      call    storport!RaUnitReleaseRemoveLock (fffff80e`accea85c)
fffff80e`acd0ba2d 807b0228        cmp     byte ptr [rbx+2],28h
fffff80e`acd0ba31 0fb64303        movzx   eax,byte ptr [rbx+3]
fffff80e`acd0ba35 7509            jne     storport!RaidStartIoPacket+0x23e60 (fffff80e`acd0ba40)  Branch

storport!RaidStartIoPacket+0x23e57:
fffff80e`acd0ba37 c0f807          sar     al,7
fffff80e`acd0ba3a 2480            and     al,80h
fffff80e`acd0ba3c 0438            add     al,38h
fffff80e`acd0ba3e eb15            jmp     storport!RaidStartIoPacket+0x23e75 (fffff80e`acd0ba55)  Branch

storport!RaidStartIoPacket+0x23e60:
fffff80e`acd0ba40 84c0            test    al,al
fffff80e`acd0ba42 b9b8000000      mov     ecx,0B8h
fffff80e`acd0ba47 41bf38000000    mov     r15d,38h
fffff80e`acd0ba4d 440f48f9        cmovs   r15d,ecx
fffff80e`acd0ba51 410fb6c7        movzx   eax,r15b

storport!RaidStartIoPacket+0x23e75:
fffff80e`acd0ba55 33d2            xor     edx,edx
fffff80e`acd0ba57 884303          mov     byte ptr [rbx+3],al
fffff80e`acd0ba5a 41b80a0500c0    mov     r8d,0C000050Ah
fffff80e`acd0ba60 498bcd          mov     rcx,r13
fffff80e`acd0ba63 e848dbfdff      call    storport!RaidCompleteRequestEx (fffff80e`acce95b0)
fffff80e`acd0ba68 f048ff8720070000 lock inc qword ptr [rdi+720h]
fffff80e`acd0ba70 b801000000      mov     eax,1
fffff80e`acd0ba75 e905c8fdff      jmp     storport!RaidStartIoPacket+0x69f (fffff80e`acce827f)  Branch

storport!RaidStartIoPacket+0x23e9a:
fffff80e`acd0ba7a 498b95b8000000  mov     rdx,qword ptr [r13+0B8h]
fffff80e`acd0ba81 803a0f          cmp     byte ptr [rdx],0Fh
fffff80e`acd0ba84 0f8587c2fdff    jne     storport!RaidStartIoPacket+0x131 (fffff80e`acce7d11)  Branch

storport!RaidStartIoPacket+0x23eaa:
fffff80e`acd0ba8a 488b5208        mov     rdx,qword ptr [rdx+8]
fffff80e`acd0ba8e 440fb66202      movzx   r12d,byte ptr [rdx+2]
fffff80e`acd0ba93 4180fc28        cmp     r12b,28h
fffff80e`acd0ba97 7505            jne     storport!RaidStartIoPacket+0x23ebe (fffff80e`acd0ba9e)  Branch

storport!RaidStartIoPacket+0x23eb9:
fffff80e`acd0ba99 8b4214          mov     eax,dword ptr [rdx+14h]
fffff80e`acd0ba9c eb04            jmp     storport!RaidStartIoPacket+0x23ec2 (fffff80e`acd0baa2)  Branch

storport!RaidStartIoPacket+0x23ebe:
fffff80e`acd0ba9e 410fb6c4        movzx   eax,r12b

storport!RaidStartIoPacket+0x23ec2:
fffff80e`acd0baa2 85c0            test    eax,eax
fffff80e`acd0baa4 0f85c8020000    jne     storport!RaidStartIoPacket+0x24192 (fffff80e`acd0bd72)  Branch

storport!RaidStartIoPacket+0x23eca:
fffff80e`acd0baaa 4180fc28        cmp     r12b,28h
fffff80e`acd0baae 0f859b000000    jne     storport!RaidStartIoPacket+0x23f6f (fffff80e`acd0bb4f)  Branch

storport!RaidStartIoPacket+0x23ed4:
fffff80e`acd0bab4 4c8bfe          mov     r15,rsi
fffff80e`acd0bab7 397214          cmp     dword ptr [rdx+14h],esi
fffff80e`acd0baba 0f8593000000    jne     storport!RaidStartIoPacket+0x23f73 (fffff80e`acd0bb53)  Branch

storport!RaidStartIoPacket+0x23ee0:
fffff80e`acd0bac0 448b5a38        mov     r11d,dword ptr [rdx+38h]
fffff80e`acd0bac4 448bd6          mov     r10d,esi
fffff80e`acd0bac7 4585db          test    r11d,r11d
fffff80e`acd0baca 0f8483000000    je      storport!RaidStartIoPacket+0x23f73 (fffff80e`acd0bb53)  Branch

storport!RaidStartIoPacket+0x23ef0:
fffff80e`acd0bad0 418bc2          mov     eax,r10d
fffff80e`acd0bad3 8b4c8278        mov     ecx,dword ptr [rdx+rax*4+78h]
fffff80e`acd0bad7 81f980000000    cmp     ecx,80h
fffff80e`acd0badd 7266            jb      storport!RaidStartIoPacket+0x23f65 (fffff80e`acd0bb45)  Branch

storport!RaidStartIoPacket+0x23eff:
fffff80e`acd0badf 448b4210        mov     r8d,dword ptr [rdx+10h]
fffff80e`acd0bae3 413bc8          cmp     ecx,r8d
fffff80e`acd0bae6 735d            jae     storport!RaidStartIoPacket+0x23f65 (fffff80e`acd0bb45)  Branch

storport!RaidStartIoPacket+0x23f08:
fffff80e`acd0bae8 448bc9          mov     r9d,ecx
fffff80e`acd0baeb 8b0c11          mov     ecx,dword ptr [rcx+rdx]
fffff80e`acd0baee 83e940          sub     ecx,40h
fffff80e`acd0baf1 7446            je      storport!RaidStartIoPacket+0x23f59 (fffff80e`acd0bb39)  Branch

storport!RaidStartIoPacket+0x23f13:
fffff80e`acd0baf3 83e901          sub     ecx,1
fffff80e`acd0baf6 7425            je      storport!RaidStartIoPacket+0x23f3d (fffff80e`acd0bb1d)  Branch

storport!RaidStartIoPacket+0x23f18:
fffff80e`acd0baf8 83f901          cmp     ecx,1
fffff80e`acd0bafb 7548            jne     storport!RaidStartIoPacket+0x23f65 (fffff80e`acd0bb45)  Branch

storport!RaidStartIoPacket+0x23f1d:
fffff80e`acd0bafd 498d4928        lea     rcx,[r9+28h]
fffff80e`acd0bb01 418bc0          mov     eax,r8d
fffff80e`acd0bb04 493bc8          cmp     rcx,r8
fffff80e`acd0bb07 773c            ja      storport!RaidStartIoPacket+0x23f65 (fffff80e`acd0bb45)  Branch

storport!RaidStartIoPacket+0x23f29:
fffff80e`acd0bb09 418b44110c      mov     eax,dword ptr [r9+rdx+0Ch]
fffff80e`acd0bb0e 4c8d7a20        lea     r15,[rdx+20h]
fffff80e`acd0bb12 4d03f9          add     r15,r9
fffff80e`acd0bb15 85c0            test    eax,eax
fffff80e`acd0bb17 4c0f44fe        cmove   r15,rsi
fffff80e`acd0bb1b eb36            jmp     storport!RaidStartIoPacket+0x23f73 (fffff80e`acd0bb53)  Branch

storport!RaidStartIoPacket+0x23f3d:
fffff80e`acd0bb1d 498d4938        lea     rcx,[r9+38h]
fffff80e`acd0bb21 498bc0          mov     rax,r8
fffff80e`acd0bb24 493bc8          cmp     rcx,r8
fffff80e`acd0bb27 771c            ja      storport!RaidStartIoPacket+0x23f65 (fffff80e`acd0bb45)  Branch

storport!RaidStartIoPacket+0x23f49:
fffff80e`acd0bb29 413874110a      cmp     byte ptr [r9+rdx+0Ah],sil
fffff80e`acd0bb2e 7623            jbe     storport!RaidStartIoPacket+0x23f73 (fffff80e`acd0bb53)  Branch

storport!RaidStartIoPacket+0x23f50:
fffff80e`acd0bb30 4c8d7a18        lea     r15,[rdx+18h]
fffff80e`acd0bb34 4d03f9          add     r15,r9
fffff80e`acd0bb37 eb1a            jmp     storport!RaidStartIoPacket+0x23f73 (fffff80e`acd0bb53)  Branch

storport!RaidStartIoPacket+0x23f59:
fffff80e`acd0bb39 498d4928        lea     rcx,[r9+28h]
fffff80e`acd0bb3d 498bc0          mov     rax,r8
fffff80e`acd0bb40 493bc8          cmp     rcx,r8
fffff80e`acd0bb43 76e4            jbe     storport!RaidStartIoPacket+0x23f49 (fffff80e`acd0bb29)  Branch

storport!RaidStartIoPacket+0x23f65:
fffff80e`acd0bb45 41ffc2          inc     r10d
fffff80e`acd0bb48 453bd3          cmp     r10d,r11d
fffff80e`acd0bb4b 7283            jb      storport!RaidStartIoPacket+0x23ef0 (fffff80e`acd0bad0)  Branch

storport!RaidStartIoPacket+0x23f6d:
fffff80e`acd0bb4d eb04            jmp     storport!RaidStartIoPacket+0x23f73 (fffff80e`acd0bb53)  Branch

storport!RaidStartIoPacket+0x23f6f:
fffff80e`acd0bb4f 4c8d7a48        lea     r15,[rdx+48h]

storport!RaidStartIoPacket+0x23f73:
fffff80e`acd0bb53 4180fc28        cmp     r12b,28h
fffff80e`acd0bb57 756e            jne     storport!RaidStartIoPacket+0x23fe7 (fffff80e`acd0bbc7)  Branch

storport!RaidStartIoPacket+0x23f79:
fffff80e`acd0bb59 397214          cmp     dword ptr [rdx+14h],esi
fffff80e`acd0bb5c 7569            jne     storport!RaidStartIoPacket+0x23fe7 (fffff80e`acd0bbc7)  Branch

storport!RaidStartIoPacket+0x23f7e:
fffff80e`acd0bb5e 448b5a38        mov     r11d,dword ptr [rdx+38h]
fffff80e`acd0bb62 448bd6          mov     r10d,esi
fffff80e`acd0bb65 4585db          test    r11d,r11d
fffff80e`acd0bb68 745d            je      storport!RaidStartIoPacket+0x23fe7 (fffff80e`acd0bbc7)  Branch

storport!RaidStartIoPacket+0x23f8a:
fffff80e`acd0bb6a 418bc2          mov     eax,r10d
fffff80e`acd0bb6d 8b4c8278        mov     ecx,dword ptr [rdx+rax*4+78h]
fffff80e`acd0bb71 81f980000000    cmp     ecx,80h
fffff80e`acd0bb77 7246            jb      storport!RaidStartIoPacket+0x23fdf (fffff80e`acd0bbbf)  Branch

storport!RaidStartIoPacket+0x23f99:
fffff80e`acd0bb79 448b4a10        mov     r9d,dword ptr [rdx+10h]
fffff80e`acd0bb7d 413bc9          cmp     ecx,r9d
fffff80e`acd0bb80 733d            jae     storport!RaidStartIoPacket+0x23fdf (fffff80e`acd0bbbf)  Branch

storport!RaidStartIoPacket+0x23fa2:
fffff80e`acd0bb82 448bc1          mov     r8d,ecx
fffff80e`acd0bb85 8b0c11          mov     ecx,dword ptr [rcx+rdx]
fffff80e`acd0bb88 83e940          sub     ecx,40h
fffff80e`acd0bb8b 7426            je      storport!RaidStartIoPacket+0x23fd3 (fffff80e`acd0bbb3)  Branch

storport!RaidStartIoPacket+0x23fad:
fffff80e`acd0bb8d 83e901          sub     ecx,1
fffff80e`acd0bb90 7413            je      storport!RaidStartIoPacket+0x23fc5 (fffff80e`acd0bba5)  Branch

storport!RaidStartIoPacket+0x23fb2:
fffff80e`acd0bb92 83f901          cmp     ecx,1
fffff80e`acd0bb95 7528            jne     storport!RaidStartIoPacket+0x23fdf (fffff80e`acd0bbbf)  Branch

storport!RaidStartIoPacket+0x23fb7:
fffff80e`acd0bb97 498d4828        lea     rcx,[r8+28h]
fffff80e`acd0bb9b 418bc1          mov     eax,r9d
fffff80e`acd0bb9e 493bc9          cmp     rcx,r9
fffff80e`acd0bba1 771c            ja      storport!RaidStartIoPacket+0x23fdf (fffff80e`acd0bbbf)  Branch

storport!RaidStartIoPacket+0x23fc3:
fffff80e`acd0bba3 eb22            jmp     storport!RaidStartIoPacket+0x23fe7 (fffff80e`acd0bbc7)  Branch

storport!RaidStartIoPacket+0x23fc5:
fffff80e`acd0bba5 498d4838        lea     rcx,[r8+38h]
fffff80e`acd0bba9 498bc1          mov     rax,r9
fffff80e`acd0bbac 493bc9          cmp     rcx,r9
fffff80e`acd0bbaf 770e            ja      storport!RaidStartIoPacket+0x23fdf (fffff80e`acd0bbbf)  Branch

storport!RaidStartIoPacket+0x23fd1:
fffff80e`acd0bbb1 eb14            jmp     storport!RaidStartIoPacket+0x23fe7 (fffff80e`acd0bbc7)  Branch

storport!RaidStartIoPacket+0x23fd3:
fffff80e`acd0bbb3 498d4828        lea     rcx,[r8+28h]
fffff80e`acd0bbb7 498bc1          mov     rax,r9
fffff80e`acd0bbba 493bc9          cmp     rcx,r9
fffff80e`acd0bbbd 7608            jbe     storport!RaidStartIoPacket+0x23fe7 (fffff80e`acd0bbc7)  Branch

storport!RaidStartIoPacket+0x23fdf:
fffff80e`acd0bbbf 41ffc2          inc     r10d
fffff80e`acd0bbc2 453bd3          cmp     r10d,r11d
fffff80e`acd0bbc5 72a3            jb      storport!RaidStartIoPacket+0x23f8a (fffff80e`acd0bb6a)  Branch

storport!RaidStartIoPacket+0x23fe7:
fffff80e`acd0bbc7 4d85ff          test    r15,r15
fffff80e`acd0bbca 0f849e010000    je      storport!RaidStartIoPacket+0x2418e (fffff80e`acd0bd6e)  Branch

storport!RaidStartIoPacket+0x23ff0:
fffff80e`acd0bbd0 410fb607        movzx   eax,byte ptr [r15]
fffff80e`acd0bbd4 2c0a            sub     al,0Ah
fffff80e`acd0bbd6 a85f            test    al,5Fh
fffff80e`acd0bbd8 0f8590010000    jne     storport!RaidStartIoPacket+0x2418e (fffff80e`acd0bd6e)  Branch

storport!RaidStartIoPacket+0x23ffe:
fffff80e`acd0bbde 448b8f44020000  mov     r9d,dword ptr [rdi+244h]
fffff80e`acd0bbe5 4585c9          test    r9d,r9d
fffff80e`acd0bbe8 0f8480010000    je      storport!RaidStartIoPacket+0x2418e (fffff80e`acd0bd6e)  Branch

storport!RaidStartIoPacket+0x2400e:
fffff80e`acd0bbee 4180fc28        cmp     r12b,28h
fffff80e`acd0bbf2 7505            jne     storport!RaidStartIoPacket+0x24019 (fffff80e`acd0bbf9)  Branch

storport!RaidStartIoPacket+0x24014:
fffff80e`acd0bbf4 8b4218          mov     eax,dword ptr [rdx+18h]
fffff80e`acd0bbf7 eb03            jmp     storport!RaidStartIoPacket+0x2401c (fffff80e`acd0bbfc)  Branch

storport!RaidStartIoPacket+0x24019:
fffff80e`acd0bbf9 8b420c          mov     eax,dword ptr [rdx+0Ch]

storport!RaidStartIoPacket+0x2401c:
fffff80e`acd0bbfc 0fbae00c        bt      eax,0Ch
fffff80e`acd0bc00 0f8368010000    jae     storport!RaidStartIoPacket+0x2418e (fffff80e`acd0bd6e)  Branch

storport!RaidStartIoPacket+0x24026:
fffff80e`acd0bc06 488d8f90010000  lea     rcx,[rdi+190h]
fffff80e`acd0bc0d c644242001      mov     byte ptr [rsp+20h],1
fffff80e`acd0bc12 4533c0          xor     r8d,r8d
fffff80e`acd0bc15 498bd5          mov     rdx,r13
fffff80e`acd0bc18 e863d20000      call    storport!RaidZoneWriteGroupListSearchRequest (fffff80e`acd18e80)
fffff80e`acd0bc1d 4c8be0          mov     r12,rax
fffff80e`acd0bc20 4885c0          test    rax,rax
fffff80e`acd0bc23 0f84e5000000    je      storport!RaidStartIoPacket+0x2412e (fffff80e`acd0bd0e)  Branch

storport!RaidStartIoPacket+0x24049:
fffff80e`acd0bc29 498b8db8000000  mov     rcx,qword ptr [r13+0B8h]
fffff80e`acd0bc30 488b5108        mov     rdx,qword ptr [rcx+8]
fffff80e`acd0bc34 807a0228        cmp     byte ptr [rdx+2],28h
fffff80e`acd0bc38 0f858c000000    jne     storport!RaidStartIoPacket+0x240ea (fffff80e`acd0bcca)  Branch

storport!RaidStartIoPacket+0x2405e:
fffff80e`acd0bc3e 4c8bce          mov     r9,rsi
fffff80e`acd0bc41 397214          cmp     dword ptr [rdx+14h],esi
fffff80e`acd0bc44 0f8584000000    jne     storport!RaidStartIoPacket+0x240ee (fffff80e`acd0bcce)  Branch

storport!RaidStartIoPacket+0x2406a:
fffff80e`acd0bc4a 448b7a38        mov     r15d,dword ptr [rdx+38h]
fffff80e`acd0bc4e 448bde          mov     r11d,esi
fffff80e`acd0bc51 4585ff          test    r15d,r15d
fffff80e`acd0bc54 7478            je      storport!RaidStartIoPacket+0x240ee (fffff80e`acd0bcce)  Branch

storport!RaidStartIoPacket+0x24076:
fffff80e`acd0bc56 418bc3          mov     eax,r11d
fffff80e`acd0bc59 8b4c8278        mov     ecx,dword ptr [rdx+rax*4+78h]
fffff80e`acd0bc5d 81f980000000    cmp     ecx,80h
fffff80e`acd0bc63 725b            jb      storport!RaidStartIoPacket+0x240e0 (fffff80e`acd0bcc0)  Branch

storport!RaidStartIoPacket+0x24085:
fffff80e`acd0bc65 448b4210        mov     r8d,dword ptr [rdx+10h]
fffff80e`acd0bc69 413bc8          cmp     ecx,r8d
fffff80e`acd0bc6c 7352            jae     storport!RaidStartIoPacket+0x240e0 (fffff80e`acd0bcc0)  Branch

storport!RaidStartIoPacket+0x2408e:
fffff80e`acd0bc6e 448bd1          mov     r10d,ecx
fffff80e`acd0bc71 8b0c0a          mov     ecx,dword ptr [rdx+rcx]
fffff80e`acd0bc74 83e940          sub     ecx,40h
fffff80e`acd0bc77 743e            je      storport!RaidStartIoPacket+0x240d7 (fffff80e`acd0bcb7)  Branch

storport!RaidStartIoPacket+0x24099:
fffff80e`acd0bc79 83e901          sub     ecx,1
fffff80e`acd0bc7c 7420            je      storport!RaidStartIoPacket+0x240be (fffff80e`acd0bc9e)  Branch

storport!RaidStartIoPacket+0x2409e:
fffff80e`acd0bc7e 83f901          cmp     ecx,1
fffff80e`acd0bc81 753d            jne     storport!RaidStartIoPacket+0x240e0 (fffff80e`acd0bcc0)  Branch

storport!RaidStartIoPacket+0x240a3:
fffff80e`acd0bc83 498d4a28        lea     rcx,[r10+28h]
fffff80e`acd0bc87 493bc8          cmp     rcx,r8
fffff80e`acd0bc8a 7734            ja      storport!RaidStartIoPacket+0x240e0 (fffff80e`acd0bcc0)  Branch

storport!RaidStartIoPacket+0x240ac:
fffff80e`acd0bc8c 4c8d4a20        lea     r9,[rdx+20h]
fffff80e`acd0bc90 4d03ca          add     r9,r10
fffff80e`acd0bc93 423974120c      cmp     dword ptr [rdx+r10+0Ch],esi
fffff80e`acd0bc98 4c0f44ce        cmove   r9,rsi
fffff80e`acd0bc9c eb30            jmp     storport!RaidStartIoPacket+0x240ee (fffff80e`acd0bcce)  Branch

storport!RaidStartIoPacket+0x240be:
fffff80e`acd0bc9e 498d4a38        lea     rcx,[r10+38h]
fffff80e`acd0bca2 493bc8          cmp     rcx,r8
fffff80e`acd0bca5 7719            ja      storport!RaidStartIoPacket+0x240e0 (fffff80e`acd0bcc0)  Branch

storport!RaidStartIoPacket+0x240c7:
fffff80e`acd0bca7 423874120a      cmp     byte ptr [rdx+r10+0Ah],sil
fffff80e`acd0bcac 7620            jbe     storport!RaidStartIoPacket+0x240ee (fffff80e`acd0bcce)  Branch

storport!RaidStartIoPacket+0x240ce:
fffff80e`acd0bcae 4c8d4a18        lea     r9,[rdx+18h]
fffff80e`acd0bcb2 4d03ca          add     r9,r10
fffff80e`acd0bcb5 eb17            jmp     storport!RaidStartIoPacket+0x240ee (fffff80e`acd0bcce)  Branch

storport!RaidStartIoPacket+0x240d7:
fffff80e`acd0bcb7 498d4a28        lea     rcx,[r10+28h]
fffff80e`acd0bcbb 493bc8          cmp     rcx,r8
fffff80e`acd0bcbe 76e7            jbe     storport!RaidStartIoPacket+0x240c7 (fffff80e`acd0bca7)  Branch

storport!RaidStartIoPacket+0x240e0:
fffff80e`acd0bcc0 41ffc3          inc     r11d
fffff80e`acd0bcc3 453bdf          cmp     r11d,r15d
fffff80e`acd0bcc6 728e            jb      storport!RaidStartIoPacket+0x24076 (fffff80e`acd0bc56)  Branch

storport!RaidStartIoPacket+0x240e8:
fffff80e`acd0bcc8 eb04            jmp     storport!RaidStartIoPacket+0x240ee (fffff80e`acd0bcce)  Branch

storport!RaidStartIoPacket+0x240ea:
fffff80e`acd0bcca 4c8d4a48        lea     r9,[rdx+48h]

storport!RaidStartIoPacket+0x240ee:
fffff80e`acd0bcce 4533c0          xor     r8d,r8d
fffff80e`acd0bcd1 488975af        mov     qword ptr [rbp-51h],rsi
fffff80e`acd0bcd5 488d55af        lea     rdx,[rbp-51h]
fffff80e`acd0bcd9 498bc9          mov     rcx,r9
fffff80e`acd0bcdc e8c7af0000      call    storport!RaidGetIoStartingLbaAndLength (fffff80e`acd16ca8)
fffff80e`acd0bce1 33c0            xor     eax,eax
fffff80e`acd0bce3 f0490fb1742428  lock cmpxchg qword ptr [r12+28h],rsi
fffff80e`acd0bcea 483945af        cmp     qword ptr [rbp-51h],rax
fffff80e`acd0bcee 767e            jbe     storport!RaidStartIoPacket+0x2418e (fffff80e`acd0bd6e)  Branch

storport!RaidStartIoPacket+0x24110:
fffff80e`acd0bcf0 39b7a0010000    cmp     dword ptr [rdi+1A0h],esi
fffff80e`acd0bcf6 7508            jne     storport!RaidStartIoPacket+0x24120 (fffff80e`acd0bd00)  Branch

storport!RaidStartIoPacket+0x24118:
fffff80e`acd0bcf8 39b7dc010000    cmp     dword ptr [rdi+1DCh],esi
fffff80e`acd0bcfe 746e            je      storport!RaidStartIoPacket+0x2418e (fffff80e`acd0bd6e)  Branch

storport!RaidStartIoPacket+0x24120:
fffff80e`acd0bd00 448b7d77        mov     r15d,dword ptr [rbp+77h]
fffff80e`acd0bd04 4183cf20        or      r15d,20h
fffff80e`acd0bd08 44897d77        mov     dword ptr [rbp+77h],r15d
fffff80e`acd0bd0c eb64            jmp     storport!RaidStartIoPacket+0x24192 (fffff80e`acd0bd72)  Branch

storport!RaidStartIoPacket+0x2412e:
fffff80e`acd0bd0e 488bcf          mov     rcx,rdi
fffff80e`acd0bd11 e846ebfdff      call    storport!RaUnitReleaseRemoveLock (fffff80e`accea85c)
fffff80e`acd0bd16 0fb65302        movzx   edx,byte ptr [rbx+2]
fffff80e`acd0bd1a 80fa28          cmp     dl,28h
fffff80e`acd0bd1d 740c            je      storport!RaidStartIoPacket+0x2414b (fffff80e`acd0bd2b)  Branch

storport!RaidStartIoPacket+0x2413f:
fffff80e`acd0bd1f 488b4328        mov     rax,qword ptr [rbx+28h]
fffff80e`acd0bd23 48894338        mov     qword ptr [rbx+38h],rax
fffff80e`acd0bd27 48897328        mov     qword ptr [rbx+28h],rsi

storport!RaidStartIoPacket+0x2414b:
fffff80e`acd0bd2b 0fb64b03        movzx   ecx,byte ptr [rbx+3]
fffff80e`acd0bd2f 80fa28          cmp     dl,28h
fffff80e`acd0bd32 750b            jne     storport!RaidStartIoPacket+0x2415f (fffff80e`acd0bd3f)  Branch

storport!RaidStartIoPacket+0x24154:
fffff80e`acd0bd34 c0f907          sar     cl,7
fffff80e`acd0bd37 80e180          and     cl,80h
fffff80e`acd0bd3a 80c130          add     cl,30h
fffff80e`acd0bd3d eb12            jmp     storport!RaidStartIoPacket+0x24171 (fffff80e`acd0bd51)  Branch

storport!RaidStartIoPacket+0x2415f:
fffff80e`acd0bd3f 84c9            test    cl,cl
fffff80e`acd0bd41 b830000000      mov     eax,30h
fffff80e`acd0bd46 bab0000000      mov     edx,0B0h
fffff80e`acd0bd4b 0f48c2          cmovs   eax,edx
fffff80e`acd0bd4e 0fb6c8          movzx   ecx,al

storport!RaidStartIoPacket+0x24171:
fffff80e`acd0bd51 884b03          mov     byte ptr [rbx+3],cl
fffff80e`acd0bd54 33d2            xor     edx,edx
fffff80e`acd0bd56 498bcd          mov     rcx,r13
fffff80e`acd0bd59 41b89a0000c0    mov     r8d,0C000009Ah
fffff80e`acd0bd5f e84cd8fdff      call    storport!RaidCompleteRequestEx (fffff80e`acce95b0)
fffff80e`acd0bd64 b801000000      mov     eax,1
fffff80e`acd0bd69 e911c5fdff      jmp     storport!RaidStartIoPacket+0x69f (fffff80e`acce827f)  Branch

storport!RaidStartIoPacket+0x2418e:
fffff80e`acd0bd6e 448b7d77        mov     r15d,dword ptr [rbp+77h]

storport!RaidStartIoPacket+0x24192:
fffff80e`acd0bd72 4c8b659f        mov     r12,qword ptr [rbp-61h]
fffff80e`acd0bd76 e996bffdff      jmp     storport!RaidStartIoPacket+0x131 (fffff80e`acce7d11)  Branch

storport!RaidStartIoPacket+0x241bc:
fffff80e`acd0bd9c ba01000000      mov     edx,1
fffff80e`acd0bda1 e937c0fdff      jmp     storport!RaidStartIoPacket+0x1fd (fffff80e`acce7ddd)  Branch

storport!RaidStartIoPacket+0x241c6:
fffff80e`acd0bda6 f049ff8618150000 lock inc qword ptr [r14+1518h]
fffff80e`acd0bdae 410fb6466d      movzx   eax,byte ptr [r14+6Dh]
fffff80e`acd0bdb3 a801            test    al,1
fffff80e`acd0bdb5 0f8474c0fdff    je      storport!RaidStartIoPacket+0x24f (fffff80e`acce7e2f)  Branch

storport!RaidStartIoPacket+0x241db:
fffff80e`acd0bdbb f049ff8620150000 lock inc qword ptr [r14+1520h]
fffff80e`acd0bdc3 e967c0fdff      jmp     storport!RaidStartIoPacket+0x24f (fffff80e`acce7e2f)  Branch

storport!RaidStartIoPacket+0x241e8:
fffff80e`acd0bdc8 41b805000000    mov     r8d,5
fffff80e`acd0bdce e966c0fdff      jmp     storport!RaidStartIoPacket+0x259 (fffff80e`acce7e39)  Branch

storport!RaidStartIoPacket+0x241f3:
fffff80e`acd0bdd3 f048ff87f8060000 lock inc qword ptr [rdi+6F8h]
fffff80e`acd0bddb 41f6466d01      test    byte ptr [r14+6Dh],1
fffff80e`acd0bde0 0f84edc5fdff    je      storport!RaidStartIoPacket+0x7f3 (fffff80e`acce83d3)  Branch

storport!RaidStartIoPacket+0x24206:
fffff80e`acd0bde6 f048ff8700070000 lock inc qword ptr [rdi+700h]
fffff80e`acd0bdee e9e0c5fdff      jmp     storport!RaidStartIoPacket+0x7f3 (fffff80e`acce83d3)  Branch

storport!RaidStartIoPacket+0x24213:
fffff80e`acd0bdf3 f0ff8188000000  lock inc dword ptr [rcx+88h]
fffff80e`acd0bdfa 488b8fd0050000  mov     rcx,qword ptr [rdi+5D0h]
fffff80e`acd0be01 e9e2c5fdff      jmp     storport!RaidStartIoPacket+0x808 (fffff80e`acce83e8)  Branch

storport!RaidStartIoPacket+0x24226:
fffff80e`acd0be06 f049ff8718150000 lock inc qword ptr [r15+1518h]
fffff80e`acd0be0e 41f6476d01      test    byte ptr [r15+6Dh],1
fffff80e`acd0be13 0f84a9c4fdff    je      storport!RaidStartIoPacket+0x6e2 (fffff80e`acce82c2)  Branch

storport!RaidStartIoPacket+0x24239:
fffff80e`acd0be19 f049ff8720150000 lock inc qword ptr [r15+1520h]
fffff80e`acd0be21 e99cc4fdff      jmp     storport!RaidStartIoPacket+0x6e2 (fffff80e`acce82c2)  Branch

storport!RaidStartIoPacket+0x24246:
fffff80e`acd0be26 f048ff87f8060000 lock inc qword ptr [rdi+6F8h]
fffff80e`acd0be2e 41f6476d01      test    byte ptr [r15+6Dh],1
fffff80e`acd0be33 0f845dc6fdff    je      storport!RaidStartIoPacket+0x8b6 (fffff80e`acce8496)  Branch

storport!RaidStartIoPacket+0x24259:
fffff80e`acd0be39 f048ff8700070000 lock inc qword ptr [rdi+700h]
fffff80e`acd0be41 e950c6fdff      jmp     storport!RaidStartIoPacket+0x8b6 (fffff80e`acce8496)  Branch

storport!RaidStartIoPacket+0x24266:
fffff80e`acd0be46 f0ff8188000000  lock inc dword ptr [rcx+88h]
fffff80e`acd0be4d 488b8fd0050000  mov     rcx,qword ptr [rdi+5D0h]
fffff80e`acd0be54 e952c6fdff      jmp     storport!RaidStartIoPacket+0x8cb (fffff80e`acce84ab)  Branch

storport!RaidStartIoPacket+0x24279:
fffff80e`acd0be59 39b7640a0000    cmp     dword ptr [rdi+0A64h],esi
fffff80e`acd0be5f 0f84adc0fdff    je      storport!RaidStartIoPacket+0x332 (fffff80e`acce7f12)  Branch

storport!RaidStartIoPacket+0x24285:
fffff80e`acd0be65 e93bc0fdff      jmp     storport!RaidStartIoPacket+0x2c5 (fffff80e`acce7ea5)  Branch

storport!RaidStartIoPacket+0x2428a:
fffff80e`acd0be6a 41b952614354    mov     r9d,54436152h
fffff80e`acd0be70 4d8bc7          mov     r8,r15
fffff80e`acd0be73 ba00020000      mov     edx,200h
fffff80e`acd0be78 498bcc          mov     rcx,r12
fffff80e`acd0be7b e8e4630100      call    storport!RaidLogAllocationFailure (fffff80e`acd22264)
fffff80e`acd0be80 90              nop
fffff80e`acd0be81 e94fc0fdff      jmp     storport!RaidStartIoPacket+0x2f5 (fffff80e`acce7ed5)  Branch

storport!RaidStartIoPacket+0x242a6:
fffff80e`acd0be86 48ff151b820300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`acd440a8)]
fffff80e`acd0be8d 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acd0be92 6997700a0000404b4c00 imul edx,dword ptr [rdi+0A70h],4C4B40h
fffff80e`acd0be9c 4803c2          add     rax,rdx
fffff80e`acd0be9f e95ec0fdff      jmp     storport!RaidStartIoPacket+0x322 (fffff80e`acce7f02)  Branch

storport!RaidStartIoPacket+0x242c4:
fffff80e`acd0bea4 4d85f6          test    r14,r14
fffff80e`acd0bea7 740c            je      storport!RaidStartIoPacket+0x242d5 (fffff80e`acd0beb5)  Branch

storport!RaidStartIoPacket+0x242c9:
fffff80e`acd0bea9 488b4330        mov     rax,qword ptr [rbx+30h]
fffff80e`acd0bead 49894610        mov     qword ptr [r14+10h],rax
fffff80e`acd0beb1 4c897330        mov     qword ptr [rbx+30h],r14

storport!RaidStartIoPacket+0x242d5:
fffff80e`acd0beb5 8b87680a0000    mov     eax,dword ptr [rdi+0A68h]
fffff80e`acd0bebb 894314          mov     dword ptr [rbx+14h],eax
fffff80e`acd0bebe e973c0fdff      jmp     storport!RaidStartIoPacket+0x356 (fffff80e`acce7f36)  Branch

storport!RaidStartIoPacket+0x242e3:
fffff80e`acd0bec3 488bcf          mov     rcx,rdi
fffff80e`acd0bec6 e8f92a0100      call    storport!RaUnitRequestPowerUp (fffff80e`acd1e9c4)
fffff80e`acd0becb 90              nop
fffff80e`acd0becc e94ec1fdff      jmp     storport!RaidStartIoPacket+0x43f (fffff80e`acce801f)  Branch

storport!RaidStartIoPacket+0x242f1:
fffff80e`acd0bed1 448b8380000000  mov     r8d,dword ptr [rbx+80h]
fffff80e`acd0bed8 b801000000      mov     eax,1
fffff80e`acd0bedd 89459f          mov     dword ptr [rbp-61h],eax
fffff80e`acd0bee0 443bc0          cmp     r8d,eax
fffff80e`acd0bee3 0f86afc1fdff    jbe     storport!RaidStartIoPacket+0x4b8 (fffff80e`acce8098)  Branch

storport!RaidStartIoPacket+0x24309:
fffff80e`acd0bee9 4885c9          test    rcx,rcx
fffff80e`acd0beec 0f85a3c1fdff    jne     storport!RaidStartIoPacket+0x4b5 (fffff80e`acce8095)  Branch

storport!RaidStartIoPacket+0x24312:
fffff80e`acd0bef2 488b4b40        mov     rcx,qword ptr [rbx+40h]
fffff80e`acd0bef6 33d2            xor     edx,edx
fffff80e`acd0bef8 4103c7          add     eax,r15d
fffff80e`acd0befb 41f7f0          div     eax,r8d
fffff80e`acd0befe 488b0cd1        mov     rcx,qword ptr [rcx+rdx*8]
fffff80e`acd0bf02 48ff15a7810300  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff80e`acd440b0)]
fffff80e`acd0bf09 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acd0bf0e 448b8380000000  mov     r8d,dword ptr [rbx+80h]
fffff80e`acd0bf15 488bc8          mov     rcx,rax
fffff80e`acd0bf18 8b459f          mov     eax,dword ptr [rbp-61h]
fffff80e`acd0bf1b ffc0            inc     eax
fffff80e`acd0bf1d 89459f          mov     dword ptr [rbp-61h],eax
fffff80e`acd0bf20 413bc0          cmp     eax,r8d
fffff80e`acd0bf23 72c4            jb      storport!RaidStartIoPacket+0x24309 (fffff80e`acd0bee9)  Branch

storport!RaidStartIoPacket+0x24345:
fffff80e`acd0bf25 4885c9          test    rcx,rcx
fffff80e`acd0bf28 0f846ac1fdff    je      storport!RaidStartIoPacket+0x4b8 (fffff80e`acce8098)  Branch

storport!RaidStartIoPacket+0x2434e:
fffff80e`acd0bf2e e962c1fdff      jmp     storport!RaidStartIoPacket+0x4b5 (fffff80e`acce8095)  Branch

storport!RaidStartIoPacket+0x24353:
fffff80e`acd0bf33 8b8390000000    mov     eax,dword ptr [rbx+90h]
fffff80e`acd0bf39 398388000000    cmp     dword ptr [rbx+88h],eax
fffff80e`acd0bf3f 731d            jae     storport!RaidStartIoPacket+0x2437e (fffff80e`acd0bf5e)  Branch

storport!RaidStartIoPacket+0x24361:
fffff80e`acd0bf41 488bcb          mov     rcx,rbx
fffff80e`acd0bf44 e8b7c10100      call    storport!RaAttemptHighWaterMarkIncrease (fffff80e`acd28100)
fffff80e`acd0bf49 488d4b40        lea     rcx,[rbx+40h]
fffff80e`acd0bf4d e872e4fdff      call    storport!RaAllocateIoResource (fffff80e`accea3c4)
fffff80e`acd0bf52 488bc8          mov     rcx,rax
fffff80e`acd0bf55 4885c0          test    rax,rax
fffff80e`acd0bf58 0f8547c1fdff    jne     storport!RaidStartIoPacket+0x4c5 (fffff80e`acce80a5)  Branch

storport!RaidStartIoPacket+0x2437e:
fffff80e`acd0bf5e 488d55bf        lea     rdx,[rbp-41h]
fffff80e`acd0bf62 488bcb          mov     rcx,rbx
fffff80e`acd0bf65 48ff15f4830300  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLockAtDpcLevel (fffff80e`acd44360)]
fffff80e`acd0bf6c 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`acd0bf71 488b4b10        mov     rcx,qword ptr [rbx+10h]
fffff80e`acd0bf75 488d4308        lea     rax,[rbx+8]
fffff80e`acd0bf79 483901          cmp     qword ptr [rcx],rax
fffff80e`acd0bf7c 7528            jne     storport!RaidStartIoPacket+0x243c6 (fffff80e`acd0bfa6)  Branch

storport!RaidStartIoPacket+0x2439e:
fffff80e`acd0bf7e 498907          mov     qword ptr [r15],rax
fffff80e`acd0bf81 49894f08        mov     qword ptr [r15+8],rcx
fffff80e`acd0bf85 4c8939          mov     qword ptr [rcx],r15
fffff80e`acd0bf88 4c897808        mov     qword ptr [rax+8],r15
fffff80e`acd0bf8c ff4318          inc     dword ptr [rbx+18h]
fffff80e`acd0bf8f c7432801000000  mov     dword ptr [rbx+28h],1
fffff80e`acd0bf96 41f6471620      test    byte ptr [r15+16h],20h
fffff80e`acd0bf9b 0f84afc5fdff    je      storport!RaidStartIoPacket+0x970 (fffff80e`acce8550)  Branch

storport!RaidStartIoPacket+0x243c1:
fffff80e`acd0bfa1 e980c5fdff      jmp     storport!RaidStartIoPacket+0x946 (fffff80e`acce8526)  Branch

storport!RaidStartIoPacket+0x243c6:
fffff80e`acd0bfa6 b903000000      mov     ecx,3
fffff80e`acd0bfab cd29            int     29h

storport!RaidStartIoPacket+0x243cd:
fffff80e`acd0bfad 8b97ec020000    mov     edx,dword ptr [rdi+2ECh]
fffff80e`acd0bfb3 4533c0          xor     r8d,r8d
fffff80e`acd0bfb6 488b8fd8000000  mov     rcx,qword ptr [rdi+0D8h]
fffff80e`acd0bfbd e8ce3effff      call    storport!RaidAdapterPoFxIdleComponent (fffff80e`accffe90)
fffff80e`acd0bfc2 806711fe        and     byte ptr [rdi+11h],0FEh
fffff80e`acd0bfc6 e976c4fdff      jmp     storport!RaidStartIoPacket+0x861 (fffff80e`acce8441)  Branch
