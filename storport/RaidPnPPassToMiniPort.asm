1: kd> uf storport!RaidPnPPassToMiniPort
storport!RaidPnPPassToMiniPort:
fffff809`efc17028 488bc4          mov     rax,rsp
fffff809`efc1702b 4c894820        mov     qword ptr [rax+20h],r9
fffff809`efc1702f 44884018        mov     byte ptr [rax+18h],r8b
fffff809`efc17033 895010          mov     dword ptr [rax+10h],edx
fffff809`efc17036 48894808        mov     qword ptr [rax+8],rcx
fffff809`efc1703a 53              push    rbx
fffff809`efc1703b 55              push    rbp
fffff809`efc1703c 56              push    rsi
fffff809`efc1703d 57              push    rdi
fffff809`efc1703e 4154            push    r12
fffff809`efc17040 4155            push    r13
fffff809`efc17042 4156            push    r14
fffff809`efc17044 4157            push    r15
fffff809`efc17046 4883ec58        sub     rsp,58h
fffff809`efc1704a 4c8b7140        mov     r14,qword ptr [rcx+40h]
fffff809`efc1704e 4533c0          xor     r8d,r8d
fffff809`efc17051 4c89442430      mov     qword ptr [rsp+30h],r8
fffff809`efc17056 418be8          mov     ebp,r8d
fffff809`efc17059 458be8          mov     r13d,r8d
fffff809`efc1705c 418b06          mov     eax,dword ptr [r14]
fffff809`efc1705f 83f801          cmp     eax,1
fffff809`efc17062 0f85d2020000    jne     storport!RaidPnPPassToMiniPort+0x312 (fffff809`efc1733a)  Branch

storport!RaidPnPPassToMiniPort+0x40:
fffff809`efc17068 498b7e18        mov     rdi,qword ptr [r14+18h]

storport!RaidPnPPassToMiniPort+0x44:
fffff809`efc1706c 83f801          cmp     eax,1
fffff809`efc1706f 4d0f45f0        cmovne  r14,r8
fffff809`efc17073 4c398710020000  cmp     qword ptr [rdi+210h],r8
fffff809`efc1707a 0f84962c0100    je      storport!RaidPnPPassToMiniPort+0x12cee (fffff809`efc29d16)  Branch

storport!RaidPnPPassToMiniPort+0x58:
fffff809`efc17080 4c398718020000  cmp     qword ptr [rdi+218h],r8
fffff809`efc17087 0f84892c0100    je      storport!RaidPnPPassToMiniPort+0x12cee (fffff809`efc29d16)  Branch

storport!RaidPnPPassToMiniPort+0x65:
fffff809`efc1708d 48c744243818fcffff mov   qword ptr [rsp+38h],0FFFFFFFFFFFFFC18h
fffff809`efc17096 498bd8          mov     rbx,r8
fffff809`efc17099 448bbfbc010000  mov     r15d,dword ptr [rdi+1BCh]
fffff809`efc170a0 498bf0          mov     rsi,r8
fffff809`efc170a3 4183c707        add     r15d,7
fffff809`efc170a7 458be0          mov     r12d,r8d
fffff809`efc170aa 4183e7f8        and     r15d,0FFFFFFF8h

storport!RaidPnPPassToMiniPort+0x86:
fffff809`efc170ae 4885db          test    rbx,rbx
fffff809`efc170b1 751c            jne     storport!RaidPnPPassToMiniPort+0xa7 (fffff809`efc170cf)  Branch

storport!RaidPnPPassToMiniPort+0x8b:
fffff809`efc170b3 448a8792010000  mov     r8b,byte ptr [rdi+192h]
fffff809`efc170ba 8d5325          lea     edx,[rbx+25h]
fffff809`efc170bd 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff809`efc170c1 4533c9          xor     r9d,r9d
fffff809`efc170c4 e8c3fefeff      call    storport!RaidAllocateSrb (fffff809`efc06f8c)
fffff809`efc170c9 488bd8          mov     rbx,rax
fffff809`efc170cc 4533c0          xor     r8d,r8d

storport!RaidPnPPassToMiniPort+0xa7:
fffff809`efc170cf 4885f6          test    rsi,rsi
fffff809`efc170d2 7515            jne     storport!RaidPnPPassToMiniPort+0xc1 (fffff809`efc170e9)  Branch

storport!RaidPnPPassToMiniPort+0xac:
fffff809`efc170d4 4c8bc7          mov     r8,rdi
fffff809`efc170d7 418d8f40040000  lea     ecx,[r15+440h]
fffff809`efc170de e8394cffff      call    storport!StorAllocateContiguousIoResources (fffff809`efc0bd1c)
fffff809`efc170e3 488bf0          mov     rsi,rax
fffff809`efc170e6 4533c0          xor     r8d,r8d

storport!RaidPnPPassToMiniPort+0xc1:
fffff809`efc170e9 4885db          test    rbx,rbx
fffff809`efc170ec 0f84b22a0100    je      storport!RaidPnPPassToMiniPort+0x12b7c (fffff809`efc29ba4)  Branch

storport!RaidPnPPassToMiniPort+0xca:
fffff809`efc170f2 4885f6          test    rsi,rsi
fffff809`efc170f5 0f84a92a0100    je      storport!RaidPnPPassToMiniPort+0x12b7c (fffff809`efc29ba4)  Branch

storport!RaidPnPPassToMiniPort+0xd3:
fffff809`efc170fb 4c8d6620        lea     r12,[rsi+20h]
fffff809`efc170ff 4533c9          xor     r9d,r9d
fffff809`efc17102 498bcc          mov     rcx,r12
fffff809`efc17105 4533c0          xor     r8d,r8d
fffff809`efc17108 e8bb31ffff      call    storport!RaidZeroXrb (fffff809`efc0a2c8)
fffff809`efc1710d 48899ec8000000  mov     qword ptr [rsi+0C8h],rbx
fffff809`efc17114 41bf01000000    mov     r15d,1
fffff809`efc1711a 488b4330        mov     rax,qword ptr [rbx+30h]
fffff809`efc1711e 488986d0000000  mov     qword ptr [rsi+0D0h],rax
fffff809`efc17125 488b8424b8000000 mov     rax,qword ptr [rsp+0B8h]
fffff809`efc1712d 4438bf92010000  cmp     byte ptr [rdi+192h],r15b
fffff809`efc17134 0f8460020000    je      storport!RaidPnPPassToMiniPort+0x372 (fffff809`efc1739a)  Branch

storport!RaidPnPPassToMiniPort+0x112:
fffff809`efc1713a 48894318        mov     qword ptr [rbx+18h],rax
fffff809`efc1713e 4533c9          xor     r9d,r9d
fffff809`efc17141 8b8424c0000000  mov     eax,dword ptr [rsp+0C0h]
fffff809`efc17148 894310          mov     dword ptr [rbx+10h],eax
fffff809`efc1714b 418d4757        lea     eax,[r15+57h]
fffff809`efc1714f 668903          mov     word ptr [rbx],ax
fffff809`efc17152 8b8424a8000000  mov     eax,dword ptr [rsp+0A8h]
fffff809`efc17159 894308          mov     dword ptr [rbx+8],eax
fffff809`efc1715c 488b8424b8000000 mov     rax,qword ptr [rsp+0B8h]
fffff809`efc17164 4c896330        mov     qword ptr [rbx+30h],r12
fffff809`efc17168 c6430225        mov     byte ptr [rbx+2],25h
fffff809`efc1716c 44884b04        mov     byte ptr [rbx+4],r9b
fffff809`efc17170 c7430c00010000  mov     dword ptr [rbx+0Ch],100h
fffff809`efc17177 c743140a000000  mov     dword ptr [rbx+14h],0Ah

storport!RaidPnPPassToMiniPort+0x156:
fffff809`efc1717e 4c8d8640040000  lea     r8,[rsi+440h]
fffff809`efc17185 488986d8000000  mov     qword ptr [rsi+0D8h],rax
fffff809`efc1718c 488bd3          mov     rdx,rbx
fffff809`efc1718f 488bcf          mov     rcx,rdi
fffff809`efc17192 e8454cffff      call    storport!RaSrbSetMiniportContext (fffff809`efc0bddc)
fffff809`efc17197 488b8424a0000000 mov     rax,qword ptr [rsp+0A0h]
fffff809`efc1719f 8a8f92010000    mov     cl,byte ptr [rdi+192h]
fffff809`efc171a5 488b4040        mov     rax,qword ptr [rax+40h]
fffff809`efc171a9 443938          cmp     dword ptr [rax],r15d
fffff809`efc171ac 0f8590010000    jne     storport!RaidPnPPassToMiniPort+0x31a (fffff809`efc17342)  Branch

storport!RaidPnPPassToMiniPort+0x18a:
fffff809`efc171b2 418a4660        mov     al,byte ptr [r14+60h]
fffff809`efc171b6 413acf          cmp     cl,r15b
fffff809`efc171b9 0f849d020000    je      storport!RaidPnPPassToMiniPort+0x434 (fffff809`efc1745c)  Branch

storport!RaidPnPPassToMiniPort+0x197:
fffff809`efc171bf 884305          mov     byte ptr [rbx+5],al
fffff809`efc171c2 418a4661        mov     al,byte ptr [r14+61h]
fffff809`efc171c6 884306          mov     byte ptr [rbx+6],al
fffff809`efc171c9 418a4662        mov     al,byte ptr [r14+62h]
fffff809`efc171cd 884307          mov     byte ptr [rbx+7],al

storport!RaidPnPPassToMiniPort+0x1a8:
fffff809`efc171d0 4c8daeb8020000  lea     r13,[rsi+2B8h]
fffff809`efc171d7 4533c0          xor     r8d,r8d
fffff809`efc171da 498bcd          mov     rcx,r13
fffff809`efc171dd 33d2            xor     edx,edx
fffff809`efc171df 48ff1562d00400  call    qword ptr [storport!_imp_KeInitializeEvent (fffff809`efc64248)]
fffff809`efc171e6 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc171eb 488d05ded4feff  lea     rax,[storport!RaidXrbSignalCompletion (fffff809`efc046d0)]
fffff809`efc171f2 488986b0020000  mov     qword ptr [rsi+2B0h],rax
fffff809`efc171f9 4438bf92010000  cmp     byte ptr [rdi+192h],r15b
fffff809`efc17200 0f84f8010000    je      storport!RaidPnPPassToMiniPort+0x3d6 (fffff809`efc173fe)  Branch

storport!RaidPnPPassToMiniPort+0x1de:
fffff809`efc17206 488b0df36d0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc1720d 4c8d3dec6d0400  lea     r15,[storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc17214 493bcf          cmp     rcx,r15
fffff809`efc17217 7422            je      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x1f1:
fffff809`efc17219 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc1721c a802            test    al,2
fffff809`efc1721e 0f850f2a0100    jne     storport!RaidPnPPassToMiniPort+0x12c0b (fffff809`efc29c33)  Branch

storport!RaidPnPPassToMiniPort+0x1fc:
fffff809`efc17224 488b0dd56d0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc1722b 493bcf          cmp     rcx,r15
fffff809`efc1722e 740b            je      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x208:
fffff809`efc17230 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc17233 a802            test    al,2
fffff809`efc17235 0f852e2a0100    jne     storport!RaidPnPPassToMiniPort+0x12c41 (fffff809`efc29c69)  Branch

storport!RaidPnPPassToMiniPort+0x213:
fffff809`efc1723b 4d85f6          test    r14,r14
fffff809`efc1723e 0f8419010000    je      storport!RaidPnPPassToMiniPort+0x335 (fffff809`efc1735d)  Branch

storport!RaidPnPPassToMiniPort+0x21c:
fffff809`efc17244 33d2            xor     edx,edx
fffff809`efc17246 4c8d8c24b0000000 lea     r9,[rsp+0B0h]
fffff809`efc1724e 498bce          mov     rcx,r14
fffff809`efc17251 448d4201        lea     r8d,[rdx+1]
fffff809`efc17255 e8ce4fffff      call    storport!RaidUnitPoFxActivateComponent (fffff809`efc0c228)

storport!RaidPnPPassToMiniPort+0x232:
fffff809`efc1725a 80bf6211000000  cmp     byte ptr [rdi+1162h],0
fffff809`efc17261 498bd4          mov     rdx,r12
fffff809`efc17264 488bcf          mov     rcx,rdi
fffff809`efc17267 0f8405020000    je      storport!RaidPnPPassToMiniPort+0x44a (fffff809`efc17472)  Branch

storport!RaidPnPPassToMiniPort+0x245:
fffff809`efc1726d e85257ffff      call    storport!RaidAdapterRaiseIrqlAndExecuteXrb (fffff809`efc0c9c4)

storport!RaidPnPPassToMiniPort+0x24a:
fffff809`efc17272 33ed            xor     ebp,ebp
fffff809`efc17274 4533c9          xor     r9d,r9d
fffff809`efc17277 48216c2420      and     qword ptr [rsp+20h],rbp
fffff809`efc1727c 4533c0          xor     r8d,r8d
fffff809`efc1727f 33d2            xor     edx,edx
fffff809`efc17281 498bcd          mov     rcx,r13
fffff809`efc17284 48ff15e5cf0400  call    qword ptr [storport!_imp_KeWaitForSingleObject (fffff809`efc64270)]
fffff809`efc1728b 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc17290 f6463101        test    byte ptr [rsi+31h],1
fffff809`efc17294 0f850b2a0100    jne     storport!RaidPnPPassToMiniPort+0x12c7d (fffff809`efc29ca5)  Branch

storport!RaidPnPPassToMiniPort+0x272:
fffff809`efc1729a 4533c0          xor     r8d,r8d
fffff809`efc1729d 4d85f6          test    r14,r14
fffff809`efc172a0 0f84d8000000    je      storport!RaidPnPPassToMiniPort+0x356 (fffff809`efc1737e)  Branch

storport!RaidPnPPassToMiniPort+0x27e:
fffff809`efc172a6 4c8d8c24b0000000 lea     r9,[rsp+0B0h]
fffff809`efc172ae 33d2            xor     edx,edx
fffff809`efc172b0 498bce          mov     rcx,r14
fffff809`efc172b3 e8ac4effff      call    storport!RaidUnitPoFxIdleComponent (fffff809`efc0c164)
fffff809`efc172b8 f6463102        test    byte ptr [rsi+31h],2
fffff809`efc172bc 0f85fd290100    jne     storport!RaidPnPPassToMiniPort+0x12c97 (fffff809`efc29cbf)  Branch

storport!RaidPnPPassToMiniPort+0x29a:
fffff809`efc172c2 4533c0          xor     r8d,r8d

storport!RaidPnPPassToMiniPort+0x29d:
fffff809`efc172c5 488b0d346d0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc172cc 493bcf          cmp     rcx,r15
fffff809`efc172cf 740b            je      storport!RaidPnPPassToMiniPort+0x2b4 (fffff809`efc172dc)  Branch

storport!RaidPnPPassToMiniPort+0x2a9:
fffff809`efc172d1 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc172d4 a802            test    al,2
fffff809`efc172d6 0f85fa290100    jne     storport!RaidPnPPassToMiniPort+0x12cae (fffff809`efc29cd6)  Branch

storport!RaidPnPPassToMiniPort+0x2b4:
fffff809`efc172dc 4885f6          test    rsi,rsi
fffff809`efc172df 7418            je      storport!RaidPnPPassToMiniPort+0x2d1 (fffff809`efc172f9)  Branch

storport!RaidPnPPassToMiniPort+0x2b9:
fffff809`efc172e1 33d2            xor     edx,edx
fffff809`efc172e3 498bcc          mov     rcx,r12
fffff809`efc172e6 e86536ffff      call    storport!RaidXrbDeallocateResources (fffff809`efc0a950)
fffff809`efc172eb 488bd6          mov     rdx,rsi
fffff809`efc172ee 488bcf          mov     rcx,rdi
fffff809`efc172f1 e8fa49ffff      call    storport!StorFreeContiguousIoResources (fffff809`efc0bcf0)
fffff809`efc172f6 4533c0          xor     r8d,r8d

storport!RaidPnPPassToMiniPort+0x2d1:
fffff809`efc172f9 4885db          test    rbx,rbx
fffff809`efc172fc 7429            je      storport!RaidPnPPassToMiniPort+0x2ff (fffff809`efc17327)  Branch

storport!RaidPnPPassToMiniPort+0x2d6:
fffff809`efc172fe 80bf9201000001  cmp     byte ptr [rdi+192h],1
fffff809`efc17305 0f8435010000    je      storport!RaidPnPPassToMiniPort+0x418 (fffff809`efc17440)  Branch

storport!RaidPnPPassToMiniPort+0x2e3:
fffff809`efc1730b 4c894330        mov     qword ptr [rbx+30h],r8
fffff809`efc1730f 4c894338        mov     qword ptr [rbx+38h],r8

storport!RaidPnPPassToMiniPort+0x2eb:
fffff809`efc17313 ba52615372      mov     edx,72536152h
fffff809`efc17318 488bcb          mov     rcx,rbx
fffff809`efc1731b 48ff1506cf0400  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff809`efc64228)]
fffff809`efc17322 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidPnPPassToMiniPort+0x2ff:
fffff809`efc17327 8bc5            mov     eax,ebp

storport!RaidPnPPassToMiniPort+0x301:
fffff809`efc17329 4883c458        add     rsp,58h
fffff809`efc1732d 415f            pop     r15
fffff809`efc1732f 415e            pop     r14
fffff809`efc17331 415d            pop     r13
fffff809`efc17333 415c            pop     r12
fffff809`efc17335 5f              pop     rdi
fffff809`efc17336 5e              pop     rsi
fffff809`efc17337 5d              pop     rbp
fffff809`efc17338 5b              pop     rbx
fffff809`efc17339 c3              ret

storport!RaidPnPPassToMiniPort+0x312:
fffff809`efc1733a 498bfe          mov     rdi,r14
fffff809`efc1733d e92afdffff      jmp     storport!RaidPnPPassToMiniPort+0x44 (fffff809`efc1706c)  Branch

storport!RaidPnPPassToMiniPort+0x31a:
fffff809`efc17342 413acf          cmp     cl,r15b
fffff809`efc17345 0f8431010000    je      storport!RaidPnPPassToMiniPort+0x454 (fffff809`efc1747c)  Branch

storport!RaidPnPPassToMiniPort+0x323:
fffff809`efc1734b 6683630500      and     word ptr [rbx+5],0
fffff809`efc17350 44897b40        mov     dword ptr [rbx+40h],r15d
fffff809`efc17354 44884b07        mov     byte ptr [rbx+7],r9b
fffff809`efc17358 e973feffff      jmp     storport!RaidPnPPassToMiniPort+0x1a8 (fffff809`efc171d0)  Branch

storport!RaidPnPPassToMiniPort+0x335:
fffff809`efc1735d 4883bfe013000000 cmp     qword ptr [rdi+13E0h],0
fffff809`efc17365 0f84effeffff    je      storport!RaidPnPPassToMiniPort+0x232 (fffff809`efc1725a)  Branch

storport!RaidPnPPassToMiniPort+0x343:
fffff809`efc1736b 33d2            xor     edx,edx
fffff809`efc1736d 488bcf          mov     rcx,rdi
fffff809`efc17370 448d4201        lea     r8d,[rdx+1]
fffff809`efc17374 e8538b0000      call    storport!RaidAdapterPoFxActivateComponent (fffff809`efc1fecc)
fffff809`efc17379 e9dcfeffff      jmp     storport!RaidPnPPassToMiniPort+0x232 (fffff809`efc1725a)  Branch

storport!RaidPnPPassToMiniPort+0x356:
fffff809`efc1737e 4c3987e0130000  cmp     qword ptr [rdi+13E0h],r8
fffff809`efc17385 0f843affffff    je      storport!RaidPnPPassToMiniPort+0x29d (fffff809`efc172c5)  Branch

storport!RaidPnPPassToMiniPort+0x363:
fffff809`efc1738b 33d2            xor     edx,edx
fffff809`efc1738d 488bcf          mov     rcx,rdi
fffff809`efc17390 e8fb8a0000      call    storport!RaidAdapterPoFxIdleComponent (fffff809`efc1fe90)
fffff809`efc17395 e928ffffff      jmp     storport!RaidPnPPassToMiniPort+0x29a (fffff809`efc172c2)  Branch

storport!RaidPnPPassToMiniPort+0x372:
fffff809`efc1739a 8b6b34          mov     ebp,dword ptr [rbx+34h]
fffff809`efc1739d 48894340        mov     qword ptr [rbx+40h],rax
fffff809`efc173a1 4803eb          add     rbp,rbx
fffff809`efc173a4 8b8424c0000000  mov     eax,dword ptr [rsp+0C0h]
fffff809`efc173ab 89433c          mov     dword ptr [rbx+3Ch],eax
fffff809`efc173ae 8b8424a8000000  mov     eax,dword ptr [rsp+0A8h]
fffff809`efc173b5 4c896360        mov     qword ptr [rbx+60h],r12
fffff809`efc173b9 c7431425000000  mov     dword ptr [rbx+14h],25h
fffff809`efc173c0 c7431800010000  mov     dword ptr [rbx+18h],100h
fffff809`efc173c7 c743280a000000  mov     dword ptr [rbx+28h],0Ah
fffff809`efc173ce 448b6b78        mov     r13d,dword ptr [rbx+78h]
fffff809`efc173d2 4c03eb          add     r13,rbx
fffff809`efc173d5 48895c2430      mov     qword ptr [rsp+30h],rbx
fffff809`efc173da 4533c9          xor     r9d,r9d
fffff809`efc173dd 41c7450062000000 mov     dword ptr [r13],62h
fffff809`efc173e5 41c7450410000000 mov     dword ptr [r13+4],10h
fffff809`efc173ed 4189450c        mov     dword ptr [r13+0Ch],eax
fffff809`efc173f1 45884d08        mov     byte ptr [r13+8],r9b
fffff809`efc173f5 488b4340        mov     rax,qword ptr [rbx+40h]
fffff809`efc173f9 e980fdffff      jmp     storport!RaidPnPPassToMiniPort+0x156 (fffff809`efc1717e)  Branch

storport!RaidPnPPassToMiniPort+0x3d6:
fffff809`efc173fe 488b0dfb6b0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc17405 4c8d3df46b0400  lea     r15,[storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc1740c 493bcf          cmp     rcx,r15
fffff809`efc1740f 0f8426feffff    je      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x3ed:
fffff809`efc17415 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc17418 a802            test    al,2
fffff809`efc1741a 0f85b0270100    jne     storport!RaidPnPPassToMiniPort+0x12ba8 (fffff809`efc29bd0)  Branch

storport!RaidPnPPassToMiniPort+0x3f8:
fffff809`efc17420 488b0dd96b0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc17427 493bcf          cmp     rcx,r15
fffff809`efc1742a 0f840bfeffff    je      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x408:
fffff809`efc17430 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc17433 a802            test    al,2
fffff809`efc17435 0f8400feffff    je      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x413:
fffff809`efc1743b e9cb270100      jmp     storport!RaidPnPPassToMiniPort+0x12be3 (fffff809`efc29c0b)  Branch

storport!RaidPnPPassToMiniPort+0x418:
fffff809`efc17440 488b4c2430      mov     rcx,qword ptr [rsp+30h]
fffff809`efc17445 488bc3          mov     rax,rbx
fffff809`efc17448 4885c9          test    rcx,rcx
fffff809`efc1744b 480f45c1        cmovne  rax,rcx
fffff809`efc1744f 4c894050        mov     qword ptr [rax+50h],r8
fffff809`efc17453 4c894068        mov     qword ptr [rax+68h],r8
fffff809`efc17457 e9b7feffff      jmp     storport!RaidPnPPassToMiniPort+0x2eb (fffff809`efc17313)  Branch

storport!RaidPnPPassToMiniPort+0x434:
fffff809`efc1745c 884508          mov     byte ptr [rbp+8],al
fffff809`efc1745f 418a4661        mov     al,byte ptr [r14+61h]
fffff809`efc17463 884509          mov     byte ptr [rbp+9],al
fffff809`efc17466 418a4662        mov     al,byte ptr [r14+62h]
fffff809`efc1746a 88450a          mov     byte ptr [rbp+0Ah],al
fffff809`efc1746d e95efdffff      jmp     storport!RaidPnPPassToMiniPort+0x1a8 (fffff809`efc171d0)  Branch

storport!RaidPnPPassToMiniPort+0x44a:
fffff809`efc17472 e8a955ffff      call    storport!RaidAdapterExecuteXrb (fffff809`efc0ca20)
fffff809`efc17477 e9f6fdffff      jmp     storport!RaidPnPPassToMiniPort+0x24a (fffff809`efc17272)  Branch

storport!RaidPnPPassToMiniPort+0x454:
fffff809`efc1747c 45897d10        mov     dword ptr [r13+10h],r15d
fffff809`efc17480 6683650800      and     word ptr [rbp+8],0
fffff809`efc17485 44884d0a        mov     byte ptr [rbp+0Ah],r9b
fffff809`efc17489 e942fdffff      jmp     storport!RaidPnPPassToMiniPort+0x1a8 (fffff809`efc171d0)  Branch

storport!RaidPnPPassToMiniPort+0x12b7c:
fffff809`efc29ba4 418bcc          mov     ecx,r12d
fffff809`efc29ba7 41ffc4          inc     r12d
fffff809`efc29baa 83f903          cmp     ecx,3
fffff809`efc29bad 0f8356010000    jae     storport!RaidPnPPassToMiniPort+0x12ce1 (fffff809`efc29d09)  Branch

storport!RaidPnPPassToMiniPort+0x12b8b:
fffff809`efc29bb3 4c8d442438      lea     r8,[rsp+38h]
fffff809`efc29bb8 33d2            xor     edx,edx
fffff809`efc29bba 33c9            xor     ecx,ecx
fffff809`efc29bbc 48ff155da40300  call    qword ptr [storport!_imp_KeDelayExecutionThread (fffff809`efc64020)]
fffff809`efc29bc3 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc29bc8 4533c0          xor     r8d,r8d
fffff809`efc29bcb e9ded4feff      jmp     storport!RaidPnPPassToMiniPort+0x86 (fffff809`efc170ae)  Branch

storport!RaidPnPPassToMiniPort+0x12ba8:
fffff809`efc29bd0 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc29bd4 0f8246d8feff    jb      storport!RaidPnPPassToMiniPort+0x3f8 (fffff809`efc17420)  Branch

storport!RaidPnPPassToMiniPort+0x12bb2:
fffff809`efc29bda 4c8b442430      mov     r8,qword ptr [rsp+30h]
fffff809`efc29bdf ba3a000000      mov     edx,3Ah
fffff809`efc29be4 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`efc29be8 4d8bcc          mov     r9,r12
fffff809`efc29beb 498b4068        mov     rax,qword ptr [r8+68h]
fffff809`efc29bef 4889442428      mov     qword ptr [rsp+28h],rax
fffff809`efc29bf4 4c89442420      mov     qword ptr [rsp+20h],r8
fffff809`efc29bf9 4c8d0538d20200  lea     r8,[storport!WPP_dd435e78b7a432f8405f8f56a0e26d40_Traceguids (fffff809`efc56e38)]
fffff809`efc29c00 e883e00000      call    storport!WPP_SF_qqq (fffff809`efc37c88)
fffff809`efc29c05 90              nop
fffff809`efc29c06 e915d8feff      jmp     storport!RaidPnPPassToMiniPort+0x3f8 (fffff809`efc17420)  Branch

storport!RaidPnPPassToMiniPort+0x12be3:
fffff809`efc29c0b 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc29c0f 0f8226d6feff    jb      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x12bed:
fffff809`efc29c15 0fb6450a        movzx   eax,byte ptr [rbp+0Ah]
fffff809`efc29c19 ba3b000000      mov     edx,3Bh
fffff809`efc29c1e 440fb65509      movzx   r10d,byte ptr [rbp+9]
fffff809`efc29c23 440fb64d08      movzx   r9d,byte ptr [rbp+8]
fffff809`efc29c28 89442428        mov     dword ptr [rsp+28h],eax
fffff809`efc29c2c 4489542420      mov     dword ptr [rsp+20h],r10d
fffff809`efc29c31 eb5c            jmp     storport!RaidPnPPassToMiniPort+0x12c67 (fffff809`efc29c8f)  Branch

storport!RaidPnPPassToMiniPort+0x12c0b:
fffff809`efc29c33 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc29c37 0f82e7d5feff    jb      storport!RaidPnPPassToMiniPort+0x1fc (fffff809`efc17224)  Branch

storport!RaidPnPPassToMiniPort+0x12c15:
fffff809`efc29c3d 488b4338        mov     rax,qword ptr [rbx+38h]
fffff809`efc29c41 4c8d05f0d10200  lea     r8,[storport!WPP_dd435e78b7a432f8405f8f56a0e26d40_Traceguids (fffff809`efc56e38)]
fffff809`efc29c48 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`efc29c4c ba3c000000      mov     edx,3Ch
fffff809`efc29c51 4889442428      mov     qword ptr [rsp+28h],rax
fffff809`efc29c56 4d8bcc          mov     r9,r12
fffff809`efc29c59 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff809`efc29c5e e825e00000      call    storport!WPP_SF_qqq (fffff809`efc37c88)
fffff809`efc29c63 90              nop
fffff809`efc29c64 e9bbd5feff      jmp     storport!RaidPnPPassToMiniPort+0x1fc (fffff809`efc17224)  Branch

storport!RaidPnPPassToMiniPort+0x12c41:
fffff809`efc29c69 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc29c6d 0f82c8d5feff    jb      storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x12c4b:
fffff809`efc29c73 0fb64307        movzx   eax,byte ptr [rbx+7]
fffff809`efc29c77 ba3d000000      mov     edx,3Dh
fffff809`efc29c7c 440fb64306      movzx   r8d,byte ptr [rbx+6]
fffff809`efc29c81 440fb64b05      movzx   r9d,byte ptr [rbx+5]
fffff809`efc29c86 89442428        mov     dword ptr [rsp+28h],eax
fffff809`efc29c8a 4489442420      mov     dword ptr [rsp+20h],r8d

storport!RaidPnPPassToMiniPort+0x12c67:
fffff809`efc29c8f 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`efc29c93 4c8d059ed10200  lea     r8,[storport!WPP_dd435e78b7a432f8405f8f56a0e26d40_Traceguids (fffff809`efc56e38)]
fffff809`efc29c9a e809dd0000      call    storport!WPP_SF_DDD (fffff809`efc379a8)
fffff809`efc29c9f 90              nop
fffff809`efc29ca0 e996d5feff      jmp     storport!RaidPnPPassToMiniPort+0x213 (fffff809`efc1723b)  Branch

storport!RaidPnPPassToMiniPort+0x12c7d:
fffff809`efc29ca5 8b960c030000    mov     edx,dword ptr [rsi+30Ch]
fffff809`efc29cab 4533c0          xor     r8d,r8d
fffff809`efc29cae 488bcf          mov     rcx,rdi
fffff809`efc29cb1 e8da61ffff      call    storport!RaidAdapterPoFxIdleComponent (fffff809`efc1fe90)
fffff809`efc29cb6 806631fe        and     byte ptr [rsi+31h],0FEh
fffff809`efc29cba e9dbd5feff      jmp     storport!RaidPnPPassToMiniPort+0x272 (fffff809`efc1729a)  Branch

storport!RaidPnPPassToMiniPort+0x12c97:
fffff809`efc29cbf 8b960c030000    mov     edx,dword ptr [rsi+30Ch]
fffff809`efc29cc5 498bce          mov     rcx,r14
fffff809`efc29cc8 e81fd80000      call    storport!RaidUnitPoFxIdleComponentFromMiniport (fffff809`efc374ec)
fffff809`efc29ccd 806631fd        and     byte ptr [rsi+31h],0FDh
fffff809`efc29cd1 e9ecd5feff      jmp     storport!RaidPnPPassToMiniPort+0x29a (fffff809`efc172c2)  Branch

storport!RaidPnPPassToMiniPort+0x12cae:
fffff809`efc29cd6 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc29cda 0f82fcd5feff    jb      storport!RaidPnPPassToMiniPort+0x2b4 (fffff809`efc172dc)  Branch

storport!RaidPnPPassToMiniPort+0x12cb8:
fffff809`efc29ce0 8b8424a8000000  mov     eax,dword ptr [rsp+0A8h]
fffff809`efc29ce7 ba3e000000      mov     edx,3Eh
fffff809`efc29cec 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`efc29cf0 4c8bcf          mov     r9,rdi
fffff809`efc29cf3 89442428        mov     dword ptr [rsp+28h],eax
fffff809`efc29cf7 4489442420      mov     dword ptr [rsp+20h],r8d
fffff809`efc29cfc e89bdd0000      call    storport!WPP_SF_qDD (fffff809`efc37a9c)
fffff809`efc29d01 4533c0          xor     r8d,r8d
fffff809`efc29d04 e9d3d5feff      jmp     storport!RaidPnPPassToMiniPort+0x2b4 (fffff809`efc172dc)  Branch

storport!RaidPnPPassToMiniPort+0x12ce1:
fffff809`efc29d09 bd170000c0      mov     ebp,0C0000017h
fffff809`efc29d0e 4d8be5          mov     r12,r13
fffff809`efc29d11 e9c6d5feff      jmp     storport!RaidPnPPassToMiniPort+0x2b4 (fffff809`efc172dc)  Branch

storport!RaidPnPPassToMiniPort+0x12cee:
fffff809`efc29d16 33c0            xor     eax,eax
fffff809`efc29d18 e90cd6feff      jmp     storport!RaidPnPPassToMiniPort+0x301 (fffff809`efc17329)  Branch
