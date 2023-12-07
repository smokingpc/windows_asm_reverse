;NTSTATUS HalBuildScatterGatherListV2(_DMA_ADAPTER *, 
;                                    _DEVICE_OBJECT *,
;                                    _MDL *,
;                                    void *,
;                                    callback function,
;                                    callback context,
;                                    unsigned char WriteToDevice?,
;                                    Srb->DataBuffer?,
;                                    Srb->DataTransferLength);
;
;
;
;
hal!HalBuildScatterGatherListV2:
fffff803`5ac75ac0 4c8bdc          mov     r11,rsp
fffff803`5ac75ac3 4d894b20        mov     qword ptr [r11+20h],r9
fffff803`5ac75ac7 4d894318        mov     qword ptr [r11+18h],r8
fffff803`5ac75acb 49895310        mov     qword ptr [r11+10h],rdx
fffff803`5ac75acf 49894b08        mov     qword ptr [r11+8],rcx
fffff803`5ac75ad3 55              push    rbp
fffff803`5ac75ad4 56              push    rsi
fffff803`5ac75ad5 57              push    rdi
0: kd> uf HalBuildScatterGatherListV2
hal!HalBuildScatterGatherListV2:
fffff803`5ac75ac0 4c8bdc          mov     r11,rsp
fffff803`5ac75ac3 4d894b20        mov     qword ptr [r11+20h],r9
fffff803`5ac75ac7 4d894318        mov     qword ptr [r11+18h],r8
fffff803`5ac75acb 49895310        mov     qword ptr [r11+10h],rdx
fffff803`5ac75acf 49894b08        mov     qword ptr [r11+8],rcx
fffff803`5ac75ad3 55              push    rbp
fffff803`5ac75ad4 56              push    rsi
fffff803`5ac75ad5 57              push    rdi
fffff803`5ac75ad6 4881ec80000000  sub     rsp,80h
fffff803`5ac75add 498bf9          mov     rdi,r9
fffff803`5ac75ae0 498bf0          mov     rsi,r8
fffff803`5ac75ae3 488bea          mov     rbp,rdx
fffff803`5ac75ae6 4d85c0          test    r8,r8
fffff803`5ac75ae9 0f8445980100    je      hal!HalBuildScatterGatherListV2+0x19874 (fffff803`5ac8f334)  Branch

hal!HalBuildScatterGatherListV2+0x2f:
fffff803`5ac75aef 498d43ac        lea     rax,[r11-54h]
fffff803`5ac75af3 4d8963d8        mov     qword ptr [r11-28h],r12
fffff803`5ac75af7 448ba424c0000000 mov     r12d,dword ptr [rsp+0C0h]
fffff803`5ac75aff 4c8bc7          mov     r8,rdi
fffff803`5ac75b02 49894398        mov     qword ptr [r11-68h],rax
fffff803`5ac75b06 458bcc          mov     r9d,r12d
fffff803`5ac75b09 498d43b0        lea     rax,[r11-50h]
fffff803`5ac75b0d 488bd6          mov     rdx,rsi
fffff803`5ac75b10 49894390        mov     qword ptr [r11-70h],rax
fffff803`5ac75b14 498d43a8        lea     rax,[r11-58h]
fffff803`5ac75b18 49894388        mov     qword ptr [r11-78h],rax
fffff803`5ac75b1c e87f020000      call    hal!HalpCalculateScatterGatherListSize (fffff803`5ac75da0)
fffff803`5ac75b21 85c0            test    eax,eax
fffff803`5ac75b23 0f88c7010000    js      hal!HalBuildScatterGatherListV2+0x230 (fffff803`5ac75cf0)  Branch

hal!HalBuildScatterGatherListV2+0x69:
fffff803`5ac75b29 4c8b9424a0000000 mov     r10,qword ptr [rsp+0A0h]
fffff803`5ac75b31 48895c2478      mov     qword ptr [rsp+78h],rbx
fffff803`5ac75b36 4c896c2468      mov     qword ptr [rsp+68h],r13
fffff803`5ac75b3b 4c89742460      mov     qword ptr [rsp+60h],r14
fffff803`5ac75b40 4180baa801000000 cmp     byte ptr [r10+1A8h],0
fffff803`5ac75b48 0f8556980100    jne     hal!HalBuildScatterGatherListV2+0x198e4 (fffff803`5ac8f3a4)  Branch

hal!HalBuildScatterGatherListV2+0x8e:
fffff803`5ac75b4e 4180baad01000000 cmp     byte ptr [r10+1ADh],0
fffff803`5ac75b56 0f84e2970100    je      hal!HalBuildScatterGatherListV2+0x1987e (fffff803`5ac8f33e)  Branch

hal!HalBuildScatterGatherListV2+0x9c:
fffff803`5ac75b5c 4c8b9c24e0000000 mov     r11,qword ptr [rsp+0E0h]
fffff803`5ac75b64 4d85db          test    r11,r11
fffff803`5ac75b67 0f84de010000    je      hal!HalBuildScatterGatherListV2+0x28b (fffff803`5ac75d4b)  Branch

hal!HalBuildScatterGatherListV2+0xad:
fffff803`5ac75b6d 8b442440        mov     eax,dword ptr [rsp+40h]
fffff803`5ac75b71 398424e8000000  cmp     dword ptr [rsp+0E8h],eax
fffff803`5ac75b78 0f820e020000    jb      hal!HalBuildScatterGatherListV2+0x2cc (fffff803`5ac75d8c)  Branch

hal!HalBuildScatterGatherListV2+0xbe:
fffff803`5ac75b7e 4d8beb          mov     r13,r11
fffff803`5ac75b81 4c895c2448      mov     qword ptr [rsp+48h],r11

hal!HalBuildScatterGatherListV2+0xc6:
fffff803`5ac75b86 8b4e2c          mov     ecx,dword ptr [rsi+2Ch]
fffff803`5ac75b89 4c8bf6          mov     r14,rsi
fffff803`5ac75b8c 48034e20        add     rcx,qword ptr [rsi+20h]
fffff803`5ac75b90 488bc7          mov     rax,rdi
fffff803`5ac75b93 49c7450800000000 mov     qword ptr [r13+8],0
fffff803`5ac75b9b 8bef            mov     ebp,edi
fffff803`5ac75b9d 448b4628        mov     r8d,dword ptr [rsi+28h]
fffff803`5ac75ba1 81e5ff0f0000    and     ebp,0FFFh
fffff803`5ac75ba7 442bc7          sub     r8d,edi
fffff803`5ac75baa 4c897c2458      mov     qword ptr [rsp+58h],r15
fffff803`5ac75baf 4403c1          add     r8d,ecx
fffff803`5ac75bb2 4d8d7d10        lea     r15,[r13+10h]
fffff803`5ac75bb6 4881e100f0ffff  and     rcx,0FFFFFFFFFFFFF000h
fffff803`5ac75bbd 498bdf          mov     rbx,r15
fffff803`5ac75bc0 482bc1          sub     rax,rcx
fffff803`5ac75bc3 48c1e80c        shr     rax,0Ch
fffff803`5ac75bc7 488d34c6        lea     rsi,[rsi+rax*8]
fffff803`5ac75bcb 4883c630        add     rsi,30h
fffff803`5ac75bcf 4585e4          test    r12d,r12d
fffff803`5ac75bd2 0f84aa000000    je      hal!HalBuildScatterGatherListV2+0x1c2 (fffff803`5ac75c82)  Branch

hal!HalBuildScatterGatherListV2+0x118:
fffff803`5ac75bd8 4c8bac24b0000000 mov     r13,qword ptr [rsp+0B0h]

hal!HalBuildScatterGatherListV2+0x120:
fffff803`5ac75be0 498b0e          mov     rcx,qword ptr [r14]
fffff803`5ac75be3 453bc4          cmp     r8d,r12d
fffff803`5ac75be6 418bd4          mov     edx,r12d
fffff803`5ac75be9 418bfc          mov     edi,r12d
fffff803`5ac75bec 410f46d0        cmovbe  edx,r8d
fffff803`5ac75bf0 418bc4          mov     eax,r12d
fffff803`5ac75bf3 4885c9          test    rcx,rcx
fffff803`5ac75bf6 0f45fa          cmovne  edi,edx
fffff803`5ac75bf9 2bc2            sub     eax,edx
fffff803`5ac75bfb 4533e4          xor     r12d,r12d
fffff803`5ac75bfe 4885c9          test    rcx,rcx
fffff803`5ac75c01 440f45e0        cmovne  r12d,eax
fffff803`5ac75c05 4180baad01000000 cmp     byte ptr [r10+1ADh],0
fffff803`5ac75c0d 0f8452970100    je      hal!HalBuildScatterGatherListV2+0x198a5 (fffff803`5ac8f365)  Branch

hal!HalBuildScatterGatherListV2+0x153:
fffff803`5ac75c13 85ff            test    edi,edi
fffff803`5ac75c15 7452            je      hal!HalBuildScatterGatherListV2+0x1a9 (fffff803`5ac75c69)  Branch

hal!HalBuildScatterGatherListV2+0x157:
fffff803`5ac75c17 4c8b06          mov     r8,qword ptr [rsi]
fffff803`5ac75c1a ba00100000      mov     edx,1000h
fffff803`5ac75c1f 49c1e00c        shl     r8,0Ch
fffff803`5ac75c23 2bd5            sub     edx,ebp
fffff803`5ac75c25 8bc5            mov     eax,ebp
fffff803`5ac75c27 4c03c0          add     r8,rax
fffff803`5ac75c2a 895308          mov     dword ptr [rbx+8],edx
fffff803`5ac75c2d 4c8903          mov     qword ptr [rbx],r8
fffff803`5ac75c30 3bd7            cmp     edx,edi
fffff803`5ac75c32 0f87c8000000    ja      hal!HalBuildScatterGatherListV2+0x240 (fffff803`5ac75d00)  Branch

hal!HalBuildScatterGatherListV2+0x178:
fffff803`5ac75c38 2bfa            sub     edi,edx
fffff803`5ac75c3a 493bdf          cmp     rbx,r15
fffff803`5ac75c3d 7414            je      hal!HalBuildScatterGatherListV2+0x193 (fffff803`5ac75c53)  Branch

hal!HalBuildScatterGatherListV2+0x17f:
fffff803`5ac75c3f 448b4bf0        mov     r9d,dword ptr [rbx-10h]
fffff803`5ac75c43 418bc1          mov     eax,r9d
fffff803`5ac75c46 480343e8        add     rax,qword ptr [rbx-18h]
fffff803`5ac75c4a 4c3bc0          cmp     r8,rax
fffff803`5ac75c4d 0f84b7000000    je      hal!HalBuildScatterGatherListV2+0x24a (fffff803`5ac75d0a)  Branch

hal!HalBuildScatterGatherListV2+0x193:
fffff803`5ac75c53 33ed            xor     ebp,ebp
fffff803`5ac75c55 4883c318        add     rbx,18h
fffff803`5ac75c59 4883c608        add     rsi,8
fffff803`5ac75c5d 85ff            test    edi,edi
fffff803`5ac75c5f 75b6            jne     hal!HalBuildScatterGatherListV2+0x157 (fffff803`5ac75c17)  Branch

hal!HalBuildScatterGatherListV2+0x1a1:
fffff803`5ac75c61 4c8b9424a0000000 mov     r10,qword ptr [rsp+0A0h]

hal!HalBuildScatterGatherListV2+0x1a9:
fffff803`5ac75c69 4d8b36          mov     r14,qword ptr [r14]
fffff803`5ac75c6c 4d85f6          test    r14,r14
fffff803`5ac75c6f 0f85bc000000    jne     hal!HalBuildScatterGatherListV2+0x271 (fffff803`5ac75d31)  Branch

hal!HalBuildScatterGatherListV2+0x1b5:
fffff803`5ac75c75 4c8b6c2448      mov     r13,qword ptr [rsp+48h]
fffff803`5ac75c7a 4c8b9c24e0000000 mov     r11,qword ptr [rsp+0E0h]

hal!HalBuildScatterGatherListV2+0x1c2:
fffff803`5ac75c82 4c8b7c2458      mov     r15,qword ptr [rsp+58h]
fffff803`5ac75c87 492bdd          sub     rbx,r13
fffff803`5ac75c8a 4883eb10        sub     rbx,10h
fffff803`5ac75c8e 48b8abaaaaaaaaaaaa2a mov rax,2AAAAAAAAAAAAAABh
fffff803`5ac75c98 48f7eb          imul    rbx
fffff803`5ac75c9b 48c1fa02        sar     rdx,2
fffff803`5ac75c9f 488bc2          mov     rax,rdx
fffff803`5ac75ca2 48c1e83f        shr     rax,3Fh
fffff803`5ac75ca6 4803d0          add     rdx,rax
fffff803`5ac75ca9 41895500        mov     dword ptr [r13],edx
fffff803`5ac75cad 4d85db          test    r11,r11
fffff803`5ac75cb0 7408            je      hal!HalBuildScatterGatherListV2+0x1fa (fffff803`5ac75cba)  Branch

hal!HalBuildScatterGatherListV2+0x1f2:
fffff803`5ac75cb2 49c7450801000000 mov     qword ptr [r13+8],1

hal!HalBuildScatterGatherListV2+0x1fa:
fffff803`5ac75cba 488b8c24a8000000 mov     rcx,qword ptr [rsp+0A8h]
fffff803`5ac75cc2 4d8bc5          mov     r8,r13
fffff803`5ac75cc5 4c8b8c24d0000000 mov     r9,qword ptr [rsp+0D0h]
fffff803`5ac75ccd 488b8424c8000000 mov     rax,qword ptr [rsp+0C8h]
fffff803`5ac75cd5 488b5120        mov     rdx,qword ptr [rcx+20h]
fffff803`5ac75cd9 ff15f12b0700    call    qword ptr [hal!_guard_dispatch_icall_fptr (fffff803`5ace88d0)]
fffff803`5ac75cdf 33c0            xor     eax,eax

hal!HalBuildScatterGatherListV2+0x221:
fffff803`5ac75ce1 4c8b6c2468      mov     r13,qword ptr [rsp+68h]
fffff803`5ac75ce6 488b5c2478      mov     rbx,qword ptr [rsp+78h]
fffff803`5ac75ceb 4c8b742460      mov     r14,qword ptr [rsp+60h]

hal!HalBuildScatterGatherListV2+0x230:
fffff803`5ac75cf0 4c8b642470      mov     r12,qword ptr [rsp+70h]

hal!HalBuildScatterGatherListV2+0x235:
fffff803`5ac75cf5 4881c480000000  add     rsp,80h
fffff803`5ac75cfc 5f              pop     rdi
fffff803`5ac75cfd 5e              pop     rsi
fffff803`5ac75cfe 5d              pop     rbp
fffff803`5ac75cff c3              ret

hal!HalBuildScatterGatherListV2+0x240:
fffff803`5ac75d00 897b08          mov     dword ptr [rbx+8],edi
fffff803`5ac75d03 8bd7            mov     edx,edi
fffff803`5ac75d05 e92effffff      jmp     hal!HalBuildScatterGatherListV2+0x178 (fffff803`5ac75c38)  Branch

hal!HalBuildScatterGatherListV2+0x24a:
fffff803`5ac75d0a 488b06          mov     rax,qword ptr [rsi]
fffff803`5ac75d0d 488d48ff        lea     rcx,[rax-1]
fffff803`5ac75d11 4833c8          xor     rcx,rax
fffff803`5ac75d14 48f7c10000f0ff  test    rcx,0FFFFFFFFFFF00000h
fffff803`5ac75d1b 0f8532ffffff    jne     hal!HalBuildScatterGatherListV2+0x193 (fffff803`5ac75c53)  Branch

hal!HalBuildScatterGatherListV2+0x261:
fffff803`5ac75d21 418d0411        lea     eax,[r9+rdx]
fffff803`5ac75d25 8943f0          mov     dword ptr [rbx-10h],eax
fffff803`5ac75d28 4883c3e8        add     rbx,0FFFFFFFFFFFFFFE8h
fffff803`5ac75d2c e922ffffff      jmp     hal!HalBuildScatterGatherListV2+0x193 (fffff803`5ac75c53)  Branch

hal!HalBuildScatterGatherListV2+0x271:
fffff803`5ac75d31 418b6e2c        mov     ebp,dword ptr [r14+2Ch]
fffff803`5ac75d35 498d7630        lea     rsi,[r14+30h]
fffff803`5ac75d39 458b4628        mov     r8d,dword ptr [r14+28h]
fffff803`5ac75d3d 4585e4          test    r12d,r12d
fffff803`5ac75d40 0f859afeffff    jne     hal!HalBuildScatterGatherListV2+0x120 (fffff803`5ac75be0)  Branch

hal!HalBuildScatterGatherListV2+0x286:
fffff803`5ac75d46 e92affffff      jmp     hal!HalBuildScatterGatherListV2+0x1b5 (fffff803`5ac75c75)  Branch

hal!HalBuildScatterGatherListV2+0x28b:
fffff803`5ac75d4b 8b542440        mov     edx,dword ptr [rsp+40h]
fffff803`5ac75d4f b900020000      mov     ecx,200h
fffff803`5ac75d54 41b848616c20    mov     r8d,206C6148h
fffff803`5ac75d5a 48ff1547230700  call    qword ptr [hal!_imp_ExAllocatePoolWithTag (fffff803`5ace80a8)]
fffff803`5ac75d61 0f1f440000      nop     dword ptr [rax+rax]
fffff803`5ac75d66 4889442448      mov     qword ptr [rsp+48h],rax
fffff803`5ac75d6b 4c8be8          mov     r13,rax
fffff803`5ac75d6e 4885c0          test    rax,rax
fffff803`5ac75d71 0f842e970100    je      hal!HalBuildScatterGatherListV2+0x199e5 (fffff803`5ac8f4a5)  Branch

hal!HalBuildScatterGatherListV2+0x2b7:
fffff803`5ac75d77 4c8b9424a0000000 mov     r10,qword ptr [rsp+0A0h]
fffff803`5ac75d7f 4c8b9c24e0000000 mov     r11,qword ptr [rsp+0E0h]
fffff803`5ac75d87 e9fafdffff      jmp     hal!HalBuildScatterGatherListV2+0xc6 (fffff803`5ac75b86)  Branch

hal!HalBuildScatterGatherListV2+0x2cc:
fffff803`5ac75d8c b8230000c0      mov     eax,0C0000023h
fffff803`5ac75d91 e94bffffff      jmp     hal!HalBuildScatterGatherListV2+0x221 (fffff803`5ac75ce1)  Branch

hal!HalBuildScatterGatherListV2+0x19874:
fffff803`5ac8f334 b80d0000c0      mov     eax,0C000000Dh
fffff803`5ac8f339 e9b769feff      jmp     hal!HalBuildScatterGatherListV2+0x235 (fffff803`5ac75cf5)  Branch

hal!HalBuildScatterGatherListV2+0x1987e:
fffff803`5ac8f33e 440fb6b424d8000000 movzx r14d,byte ptr [rsp+0D8h]
fffff803`5ac8f347 4584f6          test    r14b,r14b
fffff803`5ac8f34a 0f850c68feff    jne     hal!HalBuildScatterGatherListV2+0x9c (fffff803`5ac75b5c)  Branch

hal!HalBuildScatterGatherListV2+0x19890:
fffff803`5ac8f350 8b7c2444        mov     edi,dword ptr [rsp+44h]
fffff803`5ac8f354 85ff            test    edi,edi
fffff803`5ac8f356 7559            jne     hal!HalBuildScatterGatherListV2+0x198f1 (fffff803`5ac8f3b1)  Branch

hal!HalBuildScatterGatherListV2+0x19898:
fffff803`5ac8f358 488bbc24b8000000 mov     rdi,qword ptr [rsp+0B8h]
fffff803`5ac8f360 e9f767feff      jmp     hal!HalBuildScatterGatherListV2+0x9c (fffff803`5ac75b5c)  Branch

hal!HalBuildScatterGatherListV2+0x198a5:
fffff803`5ac8f365 4d3bf5          cmp     r14,r13
fffff803`5ac8f368 750a            jne     hal!HalBuildScatterGatherListV2+0x198b4 (fffff803`5ac8f374)  Branch

hal!HalBuildScatterGatherListV2+0x198aa:
fffff803`5ac8f36a 4c8b8424b8000000 mov     r8,qword ptr [rsp+0B8h]
fffff803`5ac8f372 eb07            jmp     hal!HalBuildScatterGatherListV2+0x198bb (fffff803`5ac8f37b)  Branch

hal!HalBuildScatterGatherListV2+0x198b4:
fffff803`5ac8f374 448bc5          mov     r8d,ebp
fffff803`5ac8f377 4d034620        add     r8,qword ptr [r14+20h]

hal!HalBuildScatterGatherListV2+0x198bb:
fffff803`5ac8f37b 0fb68424d8000000 movzx   eax,byte ptr [rsp+0D8h]
fffff803`5ac8f383 448bcf          mov     r9d,edi
fffff803`5ac8f386 c644242800      mov     byte ptr [rsp+28h],0
fffff803`5ac8f38b 498bd6          mov     rdx,r14
fffff803`5ac8f38e 88442420        mov     byte ptr [rsp+20h],al
fffff803`5ac8f392 e885db0000      call    hal!HalpDmaFlushBuffer (fffff803`5ac9cf1c)
fffff803`5ac8f397 4c8b9424a0000000 mov     r10,qword ptr [rsp+0A0h]
fffff803`5ac8f39f e96f68feff      jmp     hal!HalBuildScatterGatherListV2+0x153 (fffff803`5ac75c13)  Branch

hal!HalBuildScatterGatherListV2+0x198e4:
fffff803`5ac8f3a4 8b7c2444        mov     edi,dword ptr [rsp+44h]
fffff803`5ac8f3a8 440fb6b424d8000000 movzx r14d,byte ptr [rsp+0D8h]

hal!HalBuildScatterGatherListV2+0x198f1:
fffff803`5ac8f3b1 488b9c24e0000000 mov     rbx,qword ptr [rsp+0E0h]
fffff803`5ac8f3b9 4885db          test    rbx,rbx
fffff803`5ac8f3bc 0f84ad000000    je      hal!HalBuildScatterGatherListV2+0x199af (fffff803`5ac8f46f)  Branch

hal!HalBuildScatterGatherListV2+0x19902:
fffff803`5ac8f3c2 8b442440        mov     eax,dword ptr [rsp+40h]
fffff803`5ac8f3c6 398424e8000000  cmp     dword ptr [rsp+0E8h],eax
fffff803`5ac8f3cd 0f82b969feff    jb      hal!HalBuildScatterGatherListV2+0x2cc (fffff803`5ac75d8c)  Branch

hal!HalBuildScatterGatherListV2+0x19913:
fffff803`5ac8f3d3 830b01          or      dword ptr [rbx],1

hal!HalBuildScatterGatherListV2+0x19916:
fffff803`5ac8f3d6 488b8424b8000000 mov     rax,qword ptr [rsp+0B8h]
fffff803`5ac8f3de 488d5330        lea     rdx,[rbx+30h]
fffff803`5ac8f3e2 48894320        mov     qword ptr [rbx+20h],rax
fffff803`5ac8f3e6 4c8d0db3900000  lea     r9,[hal!HalpAllocateAdapterCallbackV2 (fffff803`5ac984a0)]
fffff803`5ac8f3ed 488b8424c8000000 mov     rax,qword ptr [rsp+0C8h]
fffff803`5ac8f3f5 498bca          mov     rcx,r10
fffff803`5ac8f3f8 48894378        mov     qword ptr [rbx+78h],rax
fffff803`5ac8f3fc 488b8424d0000000 mov     rax,qword ptr [rsp+0D0h]
fffff803`5ac8f404 48898380000000  mov     qword ptr [rbx+80h],rax
fffff803`5ac8f40b 48897308        mov     qword ptr [rbx+8],rsi
fffff803`5ac8f40f 48c7431000000000 mov     qword ptr [rbx+10h],0
fffff803`5ac8f417 44896328        mov     dword ptr [rbx+28h],r12d
fffff803`5ac8f41b 4c899390000000  mov     qword ptr [rbx+90h],r10
fffff803`5ac8f422 4488b398000000  mov     byte ptr [rbx+98h],r14b
fffff803`5ac8f429 4180baa801000000 cmp     byte ptr [r10+1A8h],0
fffff803`5ac8f431 48895b50        mov     qword ptr [rbx+50h],rbx
fffff803`5ac8f435 0f457c2448      cmovne  edi,dword ptr [rsp+48h]
fffff803`5ac8f43a 897b2c          mov     dword ptr [rbx+2Ch],edi
fffff803`5ac8f43d 448bc7          mov     r8d,edi
fffff803`5ac8f440 48896b60        mov     qword ptr [rbx+60h],rbp
fffff803`5ac8f444 488b4520        mov     rax,qword ptr [rbp+20h]
fffff803`5ac8f448 48894368        mov     qword ptr [rbx+68h],rax
fffff803`5ac8f44c e8ff860000      call    hal!HalAllocateAdapterChannel (fffff803`5ac97b50)
fffff803`5ac8f451 8bf8            mov     edi,eax
fffff803`5ac8f453 85c0            test    eax,eax
fffff803`5ac8f455 7911            jns     hal!HalBuildScatterGatherListV2+0x199a8 (fffff803`5ac8f468)  Branch

hal!HalBuildScatterGatherListV2+0x19997:
fffff803`5ac8f457 33d2            xor     edx,edx
fffff803`5ac8f459 488bcb          mov     rcx,rbx
fffff803`5ac8f45c 48ff154d8c0500  call    qword ptr [hal!_imp_ExFreePoolWithTag (fffff803`5ace80b0)]
fffff803`5ac8f463 0f1f440000      nop     dword ptr [rax+rax]

hal!HalBuildScatterGatherListV2+0x199a8:
fffff803`5ac8f468 8bc7            mov     eax,edi
fffff803`5ac8f46a e97268feff      jmp     hal!HalBuildScatterGatherListV2+0x221 (fffff803`5ac75ce1)  Branch

hal!HalBuildScatterGatherListV2+0x199af:
fffff803`5ac8f46f 8b542440        mov     edx,dword ptr [rsp+40h]
fffff803`5ac8f473 b900020000      mov     ecx,200h
fffff803`5ac8f478 41b848616c20    mov     r8d,206C6148h
fffff803`5ac8f47e 48ff15238c0500  call    qword ptr [hal!_imp_ExAllocatePoolWithTag (fffff803`5ace80a8)]
fffff803`5ac8f485 0f1f440000      nop     dword ptr [rax+rax]
fffff803`5ac8f48a 488bd8          mov     rbx,rax
fffff803`5ac8f48d 4885c0          test    rax,rax
fffff803`5ac8f490 7413            je      hal!HalBuildScatterGatherListV2+0x199e5 (fffff803`5ac8f4a5)  Branch

hal!HalBuildScatterGatherListV2+0x199d2:
fffff803`5ac8f492 4c8b9424a0000000 mov     r10,qword ptr [rsp+0A0h]
fffff803`5ac8f49a c70000000000    mov     dword ptr [rax],0
fffff803`5ac8f4a0 e931ffffff      jmp     hal!HalBuildScatterGatherListV2+0x19916 (fffff803`5ac8f3d6)  Branch

hal!HalBuildScatterGatherListV2+0x199e5:
fffff803`5ac8f4a5 b89a0000c0      mov     eax,0C000009Ah
fffff803`5ac8f4aa e93268feff      jmp     hal!HalBuildScatterGatherListV2+0x221 (fffff803`5ac75ce1)  Branch
