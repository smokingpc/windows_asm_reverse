62: kd> uf nt!IopQueryDeviceResources
nt!IopQueryDeviceResources:
fffff807`497a81a4 4055            push    rbp
fffff807`497a81a6 53              push    rbx
fffff807`497a81a7 56              push    rsi
fffff807`497a81a8 57              push    rdi
fffff807`497a81a9 4154            push    r12
fffff807`497a81ab 4155            push    r13
fffff807`497a81ad 4156            push    r14
fffff807`497a81af 488d6c24d9      lea     rbp,[rsp-27h]
fffff807`497a81b4 4881eca0000000  sub     rsp,0A0h
fffff807`497a81bb 4533f6          xor     r14d,r14d
fffff807`497a81be 498bf8          mov     rdi,r8
fffff807`497a81c1 4d8930          mov     qword ptr [r8],r14
fffff807`497a81c4 8bda            mov     ebx,edx
fffff807`497a81c6 4c8be9          mov     r13,rcx
fffff807`497a81c9 458931          mov     dword ptr [r9],r14d
fffff807`497a81cc 33d2            xor     edx,edx
fffff807`497a81ce 488d4dd7        lea     rcx,[rbp-29h]
fffff807`497a81d2 458d4648        lea     r8d,[r14+48h]
fffff807`497a81d6 498bf1          mov     rsi,r9
fffff807`497a81d9 e8225dadff      call    nt!memset (fffff807`4927df00)
fffff807`497a81de 498b8538010000  mov     rax,qword ptr [r13+138h]
fffff807`497a81e5 498bcd          mov     rcx,r13
fffff807`497a81e8 4c8b6028        mov     r12,qword ptr [rax+28h]
fffff807`497a81ec 4c896577        mov     qword ptr [rbp+77h],r12
fffff807`497a81f0 85db            test    ebx,ebx
fffff807`497a81f2 755d            jne     nt!IopQueryDeviceResources+0xad (fffff807`497a8251)  Branch

nt!IopQueryDeviceResources+0x50:
fffff807`497a81f4 418b84248c010000 mov     eax,dword ptr [r12+18Ch]
fffff807`497a81fc a801            test    al,1
fffff807`497a81fe 0f85ea2a0d00    jne     nt!IopQueryDeviceResources+0xd2b4a (fffff807`4987acee)  Branch

nt!IopQueryDeviceResources+0x60:
fffff807`497a8204 41bebb0000c0    mov     r14d,0C00000BBh
fffff807`497a820a 66c745d71b0a    mov     word ptr [rbp-29h],0A1Bh
fffff807`497a8210 458bc6          mov     r8d,r14d
fffff807`497a8213 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff807`497a8218 4533c9          xor     r9d,r9d
fffff807`497a821b 488d55d7        lea     rdx,[rbp-29h]
fffff807`497a821f e8e85fecff      call    nt!IopSynchronousCall (fffff807`4966e20c)
fffff807`497a8224 8bd8            mov     ebx,eax
fffff807`497a8226 413bc6          cmp     eax,r14d
fffff807`497a8229 0f8404010000    je      nt!IopQueryDeviceResources+0x18f (fffff807`497a8333)  Branch

nt!IopQueryDeviceResources+0x8b:
fffff807`497a822f 85db            test    ebx,ebx
fffff807`497a8231 780a            js      nt!IopQueryDeviceResources+0x99 (fffff807`497a823d)  Branch

nt!IopQueryDeviceResources+0x8f:
fffff807`497a8233 488b0f          mov     rcx,qword ptr [rdi]
fffff807`497a8236 e801050000      call    nt!PnpDetermineResourceListSize (fffff807`497a873c)
fffff807`497a823b 8906            mov     dword ptr [rsi],eax

nt!IopQueryDeviceResources+0x99:
fffff807`497a823d 8bc3            mov     eax,ebx

nt!IopQueryDeviceResources+0x9b:
fffff807`497a823f 4881c4a0000000  add     rsp,0A0h
fffff807`497a8246 415e            pop     r14
fffff807`497a8248 415d            pop     r13
fffff807`497a824a 415c            pop     r12
fffff807`497a824c 5f              pop     rdi
fffff807`497a824d 5e              pop     rsi
fffff807`497a824e 5b              pop     rbx
fffff807`497a824f 5d              pop     rbp
fffff807`497a8250 c3              ret

nt!IopQueryDeviceResources+0xad:
fffff807`497a8251 33d2            xor     edx,edx
fffff807`497a8253 488d456f        lea     rax,[rbp+6Fh]
fffff807`497a8257 4c8bcf          mov     r9,rdi
fffff807`497a825a 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`497a825f 448d4202        lea     r8d,[rdx+2]
fffff807`497a8263 e8e8020000      call    nt!PnpGetDeviceResourcesFromRegistry (fffff807`497a8550)
fffff807`497a8268 bb340000c0      mov     ebx,0C0000034h
fffff807`497a826d 3bc3            cmp     eax,ebx
fffff807`497a826f 0f85d22a0d00    jne     nt!IopQueryDeviceResources+0xd2ba3 (fffff807`4987ad47)  Branch

nt!IopQueryDeviceResources+0xd1:
fffff807`497a8275 ba01000000      mov     edx,1
fffff807`497a827a 488d456f        lea     rax,[rbp+6Fh]
fffff807`497a827e 448bc2          mov     r8d,edx
fffff807`497a8281 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`497a8286 4c8d4d67        lea     r9,[rbp+67h]
fffff807`497a828a 498bcd          mov     rcx,r13
fffff807`497a828d e8be020000      call    nt!PnpGetDeviceResourcesFromRegistry (fffff807`497a8550)
fffff807`497a8292 3bc3            cmp     eax,ebx
fffff807`497a8294 0f858d2a0d00    jne     nt!IopQueryDeviceResources+0xd2b83 (fffff807`4987ad27)  Branch

nt!IopQueryDeviceResources+0xf6:
fffff807`497a829a 418b84248c010000 mov     eax,dword ptr [r12+18Ch]
fffff807`497a82a2 a801            test    al,1
fffff807`497a82a4 0f85ba010000    jne     nt!IopQueryDeviceResources+0x2c0 (fffff807`497a8464)  Branch

nt!IopQueryDeviceResources+0x106:
fffff807`497a82aa 498b8424b8010000 mov     rax,qword ptr [r12+1B8h]
fffff807`497a82b2 4885c0          test    rax,rax
fffff807`497a82b5 0f8583000000    jne     nt!IopQueryDeviceResources+0x19a (fffff807`497a833e)  Branch

nt!IopQueryDeviceResources+0x117:
fffff807`497a82bb 488d5567        lea     rdx,[rbp+67h]
fffff807`497a82bf 498bcd          mov     rcx,r13
fffff807`497a82c2 e8c5070000      call    nt!PpIrpQueryResourceRequirements (fffff807`497a8a8c)
fffff807`497a82c7 41bebb0000c0    mov     r14d,0C00000BBh
fffff807`497a82cd 413bc6          cmp     eax,r14d
fffff807`497a82d0 0f85452a0d00    jne     nt!IopQueryDeviceResources+0xd2b77 (fffff807`4987ad1b)  Branch

nt!IopQueryDeviceResources+0x132:
fffff807`497a82d6 4533f6          xor     r14d,r14d
fffff807`497a82d9 418bde          mov     ebx,r14d
fffff807`497a82dc 418bc6          mov     eax,r14d

nt!IopQueryDeviceResources+0x13b:
fffff807`497a82df 85c0            test    eax,eax
fffff807`497a82e1 0f8858ffffff    js      nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0x143:
fffff807`497a82e7 33d2            xor     edx,edx
fffff807`497a82e9 488d456f        lea     rax,[rbp+6Fh]
fffff807`497a82ed 4c8d4d67        lea     r9,[rbp+67h]
fffff807`497a82f1 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`497a82f6 498bcd          mov     rcx,r13
fffff807`497a82f9 448d4204        lea     r8d,[rdx+4]
fffff807`497a82fd e84e020000      call    nt!PnpGetDeviceResourcesFromRegistry (fffff807`497a8550)
fffff807`497a8302 85c0            test    eax,eax
fffff807`497a8304 796e            jns     nt!IopQueryDeviceResources+0x1d0 (fffff807`497a8374)  Branch

nt!IopQueryDeviceResources+0x162:
fffff807`497a8306 4c8d4567        lea     r8,[rbp+67h]
fffff807`497a830a 488bd3          mov     rdx,rbx
fffff807`497a830d 498bcd          mov     rcx,r13
fffff807`497a8310 e88b040000      call    nt!IopFilterResourceRequirementsCall (fffff807`497a87a0)
fffff807`497a8315 85c0            test    eax,eax
fffff807`497a8317 0f8981000000    jns     nt!IopQueryDeviceResources+0x1fa (fffff807`497a839e)  Branch

nt!IopQueryDeviceResources+0x179:
fffff807`497a831d 48891f          mov     qword ptr [rdi],rbx
fffff807`497a8320 4885db          test    rbx,rbx
fffff807`497a8323 0f857b2a0d00    jne     nt!IopQueryDeviceResources+0xd2c00 (fffff807`4987ada4)  Branch

nt!IopQueryDeviceResources+0x185:
fffff807`497a8329 448936          mov     dword ptr [rsi],r14d

nt!IopQueryDeviceResources+0x188:
fffff807`497a832c 33c0            xor     eax,eax
fffff807`497a832e e90cffffff      jmp     nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0x18f:
fffff807`497a8333 48832700        and     qword ptr [rdi],0
fffff807`497a8337 33db            xor     ebx,ebx
fffff807`497a8339 e9f1feffff      jmp     nt!IopQueryDeviceResources+0x8b (fffff807`497a822f)  Branch

nt!IopQueryDeviceResources+0x19a:
fffff807`497a833e 8b10            mov     edx,dword ptr [rax]
fffff807`497a8340 b901000000      mov     ecx,1
fffff807`497a8345 41b850702020    mov     r8d,20207050h
fffff807`497a834b e8c01cc5ff      call    nt!ExAllocatePoolWithTag (fffff807`493fa010)
fffff807`497a8350 488bd8          mov     rbx,rax
fffff807`497a8353 4885c0          test    rax,rax
fffff807`497a8356 0f84b5290d00    je      nt!IopQueryDeviceResources+0xd2b6d (fffff807`4987ad11)  Branch

nt!IopQueryDeviceResources+0x1b8:
fffff807`497a835c 498b9424b8010000 mov     rdx,qword ptr [r12+1B8h]
fffff807`497a8364 488bc8          mov     rcx,rax
fffff807`497a8367 448b02          mov     r8d,dword ptr [rdx]
fffff807`497a836a e85158adff      call    nt!memcpy (fffff807`4927dbc0)
fffff807`497a836f e973ffffff      jmp     nt!IopQueryDeviceResources+0x143 (fffff807`497a82e7)  Branch

nt!IopQueryDeviceResources+0x1d0:
fffff807`497a8374 4c8b7567        mov     r14,qword ptr [rbp+67h]
fffff807`497a8378 4d85f6          test    r14,r14
fffff807`497a837b 0f8414010000    je      nt!IopQueryDeviceResources+0x2f1 (fffff807`497a8495)  Branch

nt!IopQueryDeviceResources+0x1dd:
fffff807`497a8381 41833e00        cmp     dword ptr [r14],0
fffff807`497a8385 0f840a010000    je      nt!IopQueryDeviceResources+0x2f1 (fffff807`497a8495)  Branch

nt!IopQueryDeviceResources+0x1e7:
fffff807`497a838b 41837e0405      cmp     dword ptr [r14+4],5
fffff807`497a8390 0f85ff000000    jne     nt!IopQueryDeviceResources+0x2f1 (fffff807`497a8495)  Branch

nt!IopQueryDeviceResources+0x1f2:
fffff807`497a8396 4533f6          xor     r14d,r14d
fffff807`497a8399 e968ffffff      jmp     nt!IopQueryDeviceResources+0x162 (fffff807`497a8306)  Branch

nt!IopQueryDeviceResources+0x1fa:
fffff807`497a839e 488b5d67        mov     rbx,qword ptr [rbp+67h]
fffff807`497a83a2 4885db          test    rbx,rbx
fffff807`497a83a5 0f84ee290d00    je      nt!IopQueryDeviceResources+0xd2bf5 (fffff807`4987ad99)  Branch

nt!IopQueryDeviceResources+0x207:
fffff807`497a83ab 8b03            mov     eax,dword ptr [rbx]
fffff807`497a83ad b901000000      mov     ecx,1
fffff807`497a83b2 8bd0            mov     edx,eax
fffff807`497a83b4 8906            mov     dword ptr [rsi],eax
fffff807`497a83b6 41b850702020    mov     r8d,20207050h
fffff807`497a83bc e84f1cc5ff      call    nt!ExAllocatePoolWithTag (fffff807`493fa010)
fffff807`497a83c1 488907          mov     qword ptr [rdi],rax
fffff807`497a83c4 4885c0          test    rax,rax
fffff807`497a83c7 0f84b0290d00    je      nt!IopQueryDeviceResources+0xd2bd9 (fffff807`4987ad7d)  Branch

nt!IopQueryDeviceResources+0x229:
fffff807`497a83cd 448b06          mov     r8d,dword ptr [rsi]
fffff807`497a83d0 488bd3          mov     rdx,rbx
fffff807`497a83d3 488bc8          mov     rcx,rax
fffff807`497a83d6 e8e557adff      call    nt!memcpy (fffff807`4927dbc0)
fffff807`497a83db 33d2            xor     edx,edx
fffff807`497a83dd 488bcb          mov     rcx,rbx
fffff807`497a83e0 e87b28c5ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0x241:
fffff807`497a83e5 498b542430      mov     rdx,qword ptr [r12+30h]
fffff807`497a83ea 488d4567        lea     rax,[rbp+67h]
fffff807`497a83ee 488b0d4328deff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff807`4958ac38)]
fffff807`497a83f5 4533c9          xor     r9d,r9d
fffff807`497a83f8 4c89742438      mov     qword ptr [rsp+38h],r14
fffff807`497a83fd 4889442430      mov     qword ptr [rsp+30h],rax
fffff807`497a8402 c644242801      mov     byte ptr [rsp+28h],1
fffff807`497a8407 458d4113        lea     r8d,[r9+13h]
fffff807`497a840b c744242019000200 mov     dword ptr [rsp+20h],20019h
fffff807`497a8413 e8785df4ff      call    nt!_CmOpenDeviceRegKey (fffff807`496ee190)
fffff807`497a8418 85c0            test    eax,eax
fffff807`497a841a 0f880cffffff    js      nt!IopQueryDeviceResources+0x188 (fffff807`497a832c)  Branch

nt!IopQueryDeviceResources+0x27c:
fffff807`497a8420 488b4d67        mov     rcx,qword ptr [rbp+67h]
fffff807`497a8424 488d0515ce0600  lea     rax,[nt! ?? ::NNGAKEGL::`string` (fffff807`49815240)]
fffff807`497a842b 488945cf        mov     qword ptr [rbp-31h],rax
fffff807`497a842f 488d55c7        lea     rdx,[rbp-39h]
fffff807`497a8433 8b06            mov     eax,dword ptr [rsi]
fffff807`497a8435 41b90a000000    mov     r9d,0Ah
fffff807`497a843b 89442428        mov     dword ptr [rsp+28h],eax
fffff807`497a843f 4533c0          xor     r8d,r8d
fffff807`497a8442 488b07          mov     rax,qword ptr [rdi]
fffff807`497a8445 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`497a844a c745c728002a00  mov     dword ptr [rbp-39h],2A0028h
fffff807`497a8451 e82addabff      call    nt!ZwSetValueKey (fffff807`49266180)
fffff807`497a8456 488b4d67        mov     rcx,qword ptr [rbp+67h]
fffff807`497a845a e801d3abff      call    nt!ZwClose (fffff807`49265760)
fffff807`497a845f e9c8feffff      jmp     nt!IopQueryDeviceResources+0x188 (fffff807`497a832c)  Branch

nt!IopQueryDeviceResources+0x2c0:
fffff807`497a8464 ba01000000      mov     edx,1
fffff807`497a8469 488d456f        lea     rax,[rbp+6Fh]
fffff807`497a846d 4c8d4d67        lea     r9,[rbp+67h]
fffff807`497a8471 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`497a8476 498bcd          mov     rcx,r13
fffff807`497a8479 448d4201        lea     r8d,[rdx+1]
fffff807`497a847d e8ce000000      call    nt!PnpGetDeviceResourcesFromRegistry (fffff807`497a8550)
fffff807`497a8482 3bc3            cmp     eax,ebx
fffff807`497a8484 0f8594280d00    jne     nt!IopQueryDeviceResources+0xd2b7a (fffff807`4987ad1e)  Branch

nt!IopQueryDeviceResources+0x2e6:
fffff807`497a848a 418bc6          mov     eax,r14d
fffff807`497a848d 498bde          mov     rbx,r14
fffff807`497a8490 e94afeffff      jmp     nt!IopQueryDeviceResources+0x13b (fffff807`497a82df)  Branch

nt!IopQueryDeviceResources+0x2f1:
fffff807`497a8495 4c8d4d6f        lea     r9,[rbp+6Fh]
fffff807`497a8499 498bd6          mov     rdx,r14
fffff807`497a849c 4c8d4567        lea     r8,[rbp+67h]
fffff807`497a84a0 488bcb          mov     rcx,rbx
fffff807`497a84a3 e890470400      call    nt!PnpFilterResourceRequirementsList (fffff807`497ecc38)
fffff807`497a84a8 448be0          mov     r12d,eax
fffff807`497a84ab 4d85f6          test    r14,r14
fffff807`497a84ae 740a            je      nt!IopQueryDeviceResources+0x316 (fffff807`497a84ba)  Branch

nt!IopQueryDeviceResources+0x30c:
fffff807`497a84b0 33d2            xor     edx,edx
fffff807`497a84b2 498bce          mov     rcx,r14
fffff807`497a84b5 e8a627c5ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0x316:
fffff807`497a84ba 4533f6          xor     r14d,r14d
fffff807`497a84bd 4585e4          test    r12d,r12d
fffff807`497a84c0 0f886a280d00    js      nt!IopQueryDeviceResources+0xd2b8c (fffff807`4987ad30)  Branch

nt!IopQueryDeviceResources+0x322:
fffff807`497a84c6 4c8b6577        mov     r12,qword ptr [rbp+77h]
fffff807`497a84ca 418b84248c010000 mov     eax,dword ptr [r12+18Ch]
fffff807`497a84d2 a801            test    al,1
fffff807`497a84d4 750c            jne     nt!IopQueryDeviceResources+0x33e (fffff807`497a84e2)  Branch

nt!IopQueryDeviceResources+0x332:
fffff807`497a84d6 4439756f        cmp     dword ptr [rbp+6Fh],r14d
fffff807`497a84da 741e            je      nt!IopQueryDeviceResources+0x356 (fffff807`497a84fa)  Branch

nt!IopQueryDeviceResources+0x338:
fffff807`497a84dc 837b1c01        cmp     dword ptr [rbx+1Ch],1
fffff807`497a84e0 7718            ja      nt!IopQueryDeviceResources+0x356 (fffff807`497a84fa)  Branch

nt!IopQueryDeviceResources+0x33e:
fffff807`497a84e2 4885db          test    rbx,rbx
fffff807`497a84e5 740a            je      nt!IopQueryDeviceResources+0x34d (fffff807`497a84f1)  Branch

nt!IopQueryDeviceResources+0x343:
fffff807`497a84e7 33d2            xor     edx,edx
fffff807`497a84e9 488bcb          mov     rcx,rbx
fffff807`497a84ec e86f27c5ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0x34d:
fffff807`497a84f1 488b5d67        mov     rbx,qword ptr [rbp+67h]
fffff807`497a84f5 e90cfeffff      jmp     nt!IopQueryDeviceResources+0x162 (fffff807`497a8306)  Branch

nt!IopQueryDeviceResources+0x356:
fffff807`497a84fa 4c8b6567        mov     r12,qword ptr [rbp+67h]
fffff807`497a84fe 4c8d457f        lea     r8,[rbp+7Fh]
fffff807`497a8502 498bcc          mov     rcx,r12
fffff807`497a8505 488bd3          mov     rdx,rbx
fffff807`497a8508 e8b73f0600      call    nt!PnpMergeFilteredResourceRequirementsList (fffff807`4980c4c4)
fffff807`497a850d 448bf0          mov     r14d,eax
fffff807`497a8510 4885db          test    rbx,rbx
fffff807`497a8513 740a            je      nt!IopQueryDeviceResources+0x37b (fffff807`497a851f)  Branch

nt!IopQueryDeviceResources+0x371:
fffff807`497a8515 33d2            xor     edx,edx
fffff807`497a8517 488bcb          mov     rcx,rbx
fffff807`497a851a e84127c5ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0x37b:
fffff807`497a851f 4d85e4          test    r12,r12
fffff807`497a8522 740a            je      nt!IopQueryDeviceResources+0x38a (fffff807`497a852e)  Branch

nt!IopQueryDeviceResources+0x380:
fffff807`497a8524 33d2            xor     edx,edx
fffff807`497a8526 498bcc          mov     rcx,r12
fffff807`497a8529 e83227c5ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0x38a:
fffff807`497a852e 4585f6          test    r14d,r14d
fffff807`497a8531 780d            js      nt!IopQueryDeviceResources+0x39c (fffff807`497a8540)  Branch

nt!IopQueryDeviceResources+0x38f:
fffff807`497a8533 488b5d7f        mov     rbx,qword ptr [rbp+7Fh]
fffff807`497a8537 4c8b6577        mov     r12,qword ptr [rbp+77h]
fffff807`497a853b e956feffff      jmp     nt!IopQueryDeviceResources+0x1f2 (fffff807`497a8396)  Branch

nt!IopQueryDeviceResources+0x39c:
fffff807`497a8540 418bc6          mov     eax,r14d
fffff807`497a8543 e9f7fcffff      jmp     nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0xd2b4a:
fffff807`4987acee 33d2            xor     edx,edx
fffff807`4987acf0 4889742420      mov     qword ptr [rsp+20h],rsi
fffff807`4987acf5 4c8bcf          mov     r9,rdi
fffff807`4987acf8 448d4207        lea     r8d,[rdx+7]
fffff807`4987acfc e84fd8f2ff      call    nt!PnpGetDeviceResourcesFromRegistry (fffff807`497a8550)
fffff807`4987ad01 bb340000c0      mov     ebx,0C0000034h
fffff807`4987ad06 3bc3            cmp     eax,ebx
fffff807`4987ad08 410f44c6        cmove   eax,r14d
fffff807`4987ad0c e92ed5f2ff      jmp     nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0xd2b6d:
fffff807`4987ad11 b8170000c0      mov     eax,0C0000017h
fffff807`4987ad16 e924d5f2ff      jmp     nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0xd2b77:
fffff807`4987ad1b 4533f6          xor     r14d,r14d

nt!IopQueryDeviceResources+0xd2b7a:
fffff807`4987ad1e 488b5d67        mov     rbx,qword ptr [rbp+67h]
fffff807`4987ad22 e9b8d5f2ff      jmp     nt!IopQueryDeviceResources+0x13b (fffff807`497a82df)  Branch

nt!IopQueryDeviceResources+0xd2b83:
fffff807`4987ad27 488b5d67        mov     rbx,qword ptr [rbp+67h]
fffff807`4987ad2b e9b7d5f2ff      jmp     nt!IopQueryDeviceResources+0x143 (fffff807`497a82e7)  Branch

nt!IopQueryDeviceResources+0xd2b8c:
fffff807`4987ad30 4885db          test    rbx,rbx
fffff807`4987ad33 740a            je      nt!IopQueryDeviceResources+0xd2b9b (fffff807`4987ad3f)  Branch

nt!IopQueryDeviceResources+0xd2b91:
fffff807`4987ad35 33d2            xor     edx,edx
fffff807`4987ad37 488bcb          mov     rcx,rbx
fffff807`4987ad3a e821ffb7ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0xd2b9b:
fffff807`4987ad3f 418bc4          mov     eax,r12d
fffff807`4987ad42 e9f8d4f2ff      jmp     nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0xd2ba3:
fffff807`4987ad47 488b17          mov     rdx,qword ptr [rdi]
fffff807`4987ad4a 4885d2          test    rdx,rdx
fffff807`4987ad4d 7442            je      nt!IopQueryDeviceResources+0xd2bed (fffff807`4987ad91)  Branch

nt!IopQueryDeviceResources+0xd2bab:
fffff807`4987ad4f 4533c0          xor     r8d,r8d
fffff807`4987ad52 e86d77f6ff      call    nt!PnpCmResourcesToIoResources (fffff807`497e24c4)
fffff807`4987ad57 488b0f          mov     rcx,qword ptr [rdi]
fffff807`4987ad5a 33d2            xor     edx,edx
fffff807`4987ad5c 488bd8          mov     rbx,rax
fffff807`4987ad5f e8fcfeb7ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)
fffff807`4987ad64 4885db          test    rbx,rbx
fffff807`4987ad67 740c            je      nt!IopQueryDeviceResources+0xd2bd1 (fffff807`4987ad75)  Branch

nt!IopQueryDeviceResources+0xd2bc5:
fffff807`4987ad69 48891f          mov     qword ptr [rdi],rbx
fffff807`4987ad6c 8b03            mov     eax,dword ptr [rbx]
fffff807`4987ad6e 8906            mov     dword ptr [rsi],eax
fffff807`4987ad70 e991d5f2ff      jmp     nt!IopQueryDeviceResources+0x162 (fffff807`497a8306)  Branch

nt!IopQueryDeviceResources+0xd2bd1:
fffff807`4987ad75 4c8937          mov     qword ptr [rdi],r14
fffff807`4987ad78 448936          mov     dword ptr [rsi],r14d
fffff807`4987ad7b eb0a            jmp     nt!IopQueryDeviceResources+0xd2be3 (fffff807`4987ad87)  Branch

nt!IopQueryDeviceResources+0xd2bd9:
fffff807`4987ad7d 33d2            xor     edx,edx
fffff807`4987ad7f 488bcb          mov     rcx,rbx
fffff807`4987ad82 e8d9feb7ff      call    nt!ExFreePoolWithTag (fffff807`493fac60)

nt!IopQueryDeviceResources+0xd2be3:
fffff807`4987ad87 b89a0000c0      mov     eax,0C000009Ah
fffff807`4987ad8c e9aed4f2ff      jmp     nt!IopQueryDeviceResources+0x9b (fffff807`497a823f)  Branch

nt!IopQueryDeviceResources+0xd2bed:
fffff807`4987ad91 498bde          mov     rbx,r14
fffff807`4987ad94 e96dd5f2ff      jmp     nt!IopQueryDeviceResources+0x162 (fffff807`497a8306)  Branch

nt!IopQueryDeviceResources+0xd2bf5:
fffff807`4987ad99 448936          mov     dword ptr [rsi],r14d
fffff807`4987ad9c 4c8937          mov     qword ptr [rdi],r14
fffff807`4987ad9f e941d6f2ff      jmp     nt!IopQueryDeviceResources+0x241 (fffff807`497a83e5)  Branch

nt!IopQueryDeviceResources+0xd2c00:
fffff807`4987ada4 8b03            mov     eax,dword ptr [rbx]
fffff807`4987ada6 8906            mov     dword ptr [rsi],eax
fffff807`4987ada8 e97fd5f2ff      jmp     nt!IopQueryDeviceResources+0x188 (fffff807`497a832c)  Branch
