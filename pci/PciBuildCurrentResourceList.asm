;rcx = PDO's DevExt
;rdx = addr of return buffer variable
; BOOLEAN PciBuildCurrentResourceList(pdo_devext, PVOID *ret_buffer)

1: kd> uf pci!PciBuildCurrentResourceList
pci!PciBuildCurrentResourceList:
fffff800`09244300 4056            push    rsi
fffff800`09244302 57              push    rdi
fffff800`09244303 4154            push    r12
fffff800`09244305 4157            push    r15
fffff800`09244307 4883ec68        sub     rsp,68h
fffff800`0924430b 488b05de00ffff  mov     rax,qword ptr [pci!_security_cookie (fffff800`092343f0)]
fffff800`09244312 4833c4          xor     rax,rsp
fffff800`09244315 4889442448      mov     qword ptr [rsp+48h],rax
fffff800`0924431a 33ff            xor     edi,edi
fffff800`0924431c 4c8d442438      lea     r8,[rsp+38h]
fffff800`09244321 33c0            xor     eax,eax
fffff800`09244323 48893a          mov     qword ptr [rdx],rdi   ; *ret_buffer = NULL
fffff800`09244326 4c8bfa          mov     r15,rdx
fffff800`09244329 48897c2430      mov     qword ptr [rsp+30h],rdi
fffff800`0924432e 8b5120          mov     edx,dword ptr [rcx+20h]
fffff800`09244331 488bf1          mov     rsi,rcx
fffff800`09244334 488b8990000000  mov     rcx,qword ptr [rcx+90h]
fffff800`0924433b 4532e4          xor     r12b,r12b
fffff800`0924433e 897c2428        mov     dword ptr [rsp+28h],edi
fffff800`09244342 66897c2424      mov     word ptr [rsp+24h],di
fffff800`09244347 4889442438      mov     qword ptr [rsp+38h],rax
fffff800`0924434c 89442440        mov     dword ptr [rsp+40h],eax
fffff800`09244350 6689442444      mov     word ptr [rsp+44h],ax
fffff800`09244355 e8564dfcff      call    pci!PciReadSlotIdData (fffff800`092090b0)     ;read device info? and return NTSTATUS
fffff800`0924435a 85c0            test    eax,eax
fffff800`0924435c 0f884c4b0100    js      pci!PciBuildCurrentResourceList+0x14bae (fffff800`09258eae)  Branch

pci!PciBuildCurrentResourceList+0x62:
fffff800`09244362 488d542438      lea     rdx,[rsp+38h]
fffff800`09244367 488bce          mov     rcx,rsi
fffff800`0924436a e89148fcff      call    pci!PciIsSameDevice (fffff800`09208c00)   ;compare VENDOR_ID, DEVICE_ID
fffff800`0924436f 84c0            test    al,al
fffff800`09244371 0f84374b0100    je      pci!PciBuildCurrentResourceList+0x14bae (fffff800`09258eae)  Branch

pci!PciBuildCurrentResourceList+0x77:
fffff800`09244377 48899c24a0000000 mov     qword ptr [rsp+0A0h],rbx
fffff800`0924437f 4c8d442428      lea     r8,[rsp+28h]
fffff800`09244384 48896c2460      mov     qword ptr [rsp+60h],rbp
fffff800`09244389 488d542430      lea     rdx,[rsp+30h]
fffff800`0924438e 4c896c2458      mov     qword ptr [rsp+58h],r13
fffff800`09244393 4c89742450      mov     qword ptr [rsp+50h],r14
fffff800`09244398 e8a32cfcff      call    pci!PciKsrGetValidData (fffff800`09207040)
fffff800`0924439d 84c0            test    al,al
fffff800`0924439f 0f85c1490100    jne     pci!PciBuildCurrentResourceList+0x14a66 (fffff800`09258d66)  Branch

pci!PciBuildCurrentResourceList+0xa5:
fffff800`092443a5 488b8698050000  mov     rax,qword ptr [rsi+598h]
fffff800`092443ac 488d9ee0000000  lea     rbx,[rsi+0E0h]
fffff800`092443b3 488bd3          mov     rdx,rbx
fffff800`092443b6 488bce          mov     rcx,rsi
fffff800`092443b9 488b4008        mov     rax,qword ptr [rax+8]
fffff800`092443bd ff156d74ffff    call    qword ptr [pci!_guard_dispatch_icall_fptr (fffff800`0923b830)]    ;pci!PciType0_GetResources()
fffff800`092443c3 85c0            test    eax,eax
fffff800`092443c5 0f8818020000    js      pci!PciBuildCurrentResourceList+0x2e3 (fffff800`092445e3)  Branch

pci!PciBuildCurrentResourceList+0xcb:
fffff800`092443cb 41b902000000    mov     r9d,2
fffff800`092443d1 488d542424      lea     rdx,[rsp+24h]
fffff800`092443d6 488bce          mov     rcx,rsi
fffff800`092443d9 458d4102        lea     r8d,[r9+2]
fffff800`092443dd e8de7afcff      call    pci!PciReadDeviceConfig (fffff800`0920bec0)
fffff800`092443e2 4532c0          xor     r8b,r8b
fffff800`092443e5 4532ed          xor     r13b,r13b
fffff800`092443e8 40383b          cmp     byte ptr [rbx],dil        ;rbx = rsi+0E0h = PDO_devext+0xe0
fffff800`092443eb 8bcf            mov     ecx,edi
fffff800`092443ed 4488442420      mov     byte ptr [rsp+20h],r8b
fffff800`092443f2 0f95c1          setne   cl
fffff800`092443f5 40387b14        cmp     byte ptr [rbx+14h],dil
fffff800`092443f9 8d5101          lea     edx,[rcx+1]
fffff800`092443fc 0f44d1          cmove   edx,ecx
fffff800`092443ff 40387b28        cmp     byte ptr [rbx+28h],dil
fffff800`09244403 8d4a01          lea     ecx,[rdx+1]
fffff800`09244406 0f44ca          cmove   ecx,edx
fffff800`09244409 40387b3c        cmp     byte ptr [rbx+3Ch],dil
fffff800`0924440d 8d5101          lea     edx,[rcx+1]
fffff800`09244410 0f44d1          cmove   edx,ecx
fffff800`09244413 40387b50        cmp     byte ptr [rbx+50h],dil
fffff800`09244417 8d4a01          lea     ecx,[rdx+1]
fffff800`0924441a 0f44ca          cmove   ecx,edx
fffff800`0924441d 40387b64        cmp     byte ptr [rbx+64h],dil
fffff800`09244421 8d5101          lea     edx,[rcx+1]
fffff800`09244424 0f44d1          cmove   edx,ecx
fffff800`09244427 40387b78        cmp     byte ptr [rbx+78h],dil
fffff800`0924442b 8d4a01          lea     ecx,[rdx+1]
fffff800`0924442e 0f44ca          cmove   ecx,edx
fffff800`09244431 4038bb8c000000  cmp     byte ptr [rbx+8Ch],dil
fffff800`09244438 8d5101          lea     edx,[rcx+1]
fffff800`0924443b 0f44d1          cmove   edx,ecx
fffff800`0924443e 4038bba0000000  cmp     byte ptr [rbx+0A0h],dil
fffff800`09244445 8d4a01          lea     ecx,[rdx+1]
fffff800`09244448 0f44ca          cmove   ecx,edx
fffff800`0924444b 4038bbb4000000  cmp     byte ptr [rbx+0B4h],dil
fffff800`09244452 8d5101          lea     edx,[rcx+1]
fffff800`09244455 0f44d1          cmove   edx,ecx
fffff800`09244458 4038bbc8000000  cmp     byte ptr [rbx+0C8h],dil
fffff800`0924445f 8d4a01          lea     ecx,[rdx+1]
fffff800`09244462 0f44ca          cmove   ecx,edx
fffff800`09244465 4038bbdc000000  cmp     byte ptr [rbx+0DCh],dil
fffff800`0924446c 8d5101          lea     edx,[rcx+1]
fffff800`0924446f 0f44d1          cmove   edx,ecx
fffff800`09244472 4038bbf0000000  cmp     byte ptr [rbx+0F0h],dil
fffff800`09244479 8d6a01          lea     ebp,[rdx+1]
fffff800`0924447c 0f44ea          cmove   ebp,edx
fffff800`0924447f 83be8803000001  cmp     dword ptr [rsi+388h],1
fffff800`09244486 0fb7542424      movzx   edx,word ptr [rsp+24h]
fffff800`0924448b 7513            jne     pci!PciBuildCurrentResourceList+0x1a0 (fffff800`092444a0)  Branch ; stornvme jump~~

pci!PciBuildCurrentResourceList+0x18d:
fffff800`0924448d b800040000      mov     eax,400h
fffff800`09244492 6685d0          test    ax,dx
fffff800`09244495 7509            jne     pci!PciBuildCurrentResourceList+0x1a0 (fffff800`092444a0)  Branch

pci!PciBuildCurrentResourceList+0x197:
fffff800`09244497 f6c203          test    dl,3
fffff800`0924449a 0f85db020000    jne     pci!PciBuildCurrentResourceList+0x47b (fffff800`0924477b)  Branch

pci!PciBuildCurrentResourceList+0x1a0:
fffff800`092444a0 0fb64630        movzx   eax,byte ptr [rsi+30h]
fffff800`092444a4 fec8            dec     al
fffff800`092444a6 3c01            cmp     al,1
fffff800`092444a8 0f86a9020000    jbe     pci!PciBuildCurrentResourceList+0x457 (fffff800`09244757)  Branch

pci!PciBuildCurrentResourceList+0x1ae:
fffff800`092444ae 85ed            test    ebp,ebp
fffff800`092444b0 0f842b010000    je      pci!PciBuildCurrentResourceList+0x2e1 (fffff800`092445e1)  Branch ;stornvme jump~~~ return with STATUS_SUCCESS

pci!PciBuildCurrentResourceList+0x1b6:
fffff800`092444b6 b828000000      mov     eax,28h
fffff800`092444bb 83fd01          cmp     ebp,1
fffff800`092444be 7609            jbe     pci!PciBuildCurrentResourceList+0x1c9 (fffff800`092444c9)  Branch

pci!PciBuildCurrentResourceList+0x1c0:
fffff800`092444c0 8d4501          lea     eax,[rbp+1]
fffff800`092444c3 8d0480          lea     eax,[rax+rax*4]
fffff800`092444c6 c1e002          shl     eax,2

pci!PciBuildCurrentResourceList+0x1c9:
fffff800`092444c9 41b850636942    mov     r8d,42696350h
fffff800`092444cf 8bd0            mov     edx,eax
fffff800`092444d1 b901010000      mov     ecx,101h
fffff800`092444d6 448bf0          mov     r14d,eax
fffff800`092444d9 4c8b15a872ffff  mov     r10,qword ptr [pci!_imp_ExAllocatePoolWithTag (fffff800`0923b788)]
fffff800`092444e0 e82b3b57fb      call    nt!ExAllocatePoolWithTag (fffff800`047b8010)
fffff800`092444e5 488bf8          mov     rdi,rax
fffff800`092444e8 4885c0          test    rax,rax
fffff800`092444eb 0f84b3490100    je      pci!PciBuildCurrentResourceList+0x14ba4 (fffff800`09258ea4)  Branch

pci!PciBuildCurrentResourceList+0x1f1:
fffff800`092444f1 458bc6          mov     r8d,r14d
fffff800`092444f4 33d2            xor     edx,edx
fffff800`092444f6 488bc8          mov     rcx,rax
fffff800`092444f9 e802effcff      call    pci!memset (fffff800`09213400)
fffff800`092444fe c7470405000000  mov     dword ptr [rdi+4],5
fffff800`09244505 b801000000      mov     eax,1
fffff800`0924450a 8907            mov     dword ptr [rdi],eax
fffff800`0924450c 8b4e1c          mov     ecx,dword ptr [rsi+1Ch]
fffff800`0924450f 894f08          mov     dword ptr [rdi+8],ecx
fffff800`09244512 488d4f14        lea     rcx,[rdi+14h]
fffff800`09244516 c7470c01000100  mov     dword ptr [rdi+0Ch],10001h
fffff800`0924451d 896f10          mov     dword ptr [rdi+10h],ebp
fffff800`09244520 803b00          cmp     byte ptr [rbx],0
fffff800`09244523 0f85ea000000    jne     pci!PciBuildCurrentResourceList+0x313 (fffff800`09244613)  Branch

pci!PciBuildCurrentResourceList+0x229:
fffff800`09244529 807b1400        cmp     byte ptr [rbx+14h],0
fffff800`0924452d 0f85f5000000    jne     pci!PciBuildCurrentResourceList+0x328 (fffff800`09244628)  Branch

pci!PciBuildCurrentResourceList+0x233:
fffff800`09244533 807b2800        cmp     byte ptr [rbx+28h],0
fffff800`09244537 0f8501010000    jne     pci!PciBuildCurrentResourceList+0x33e (fffff800`0924463e)  Branch

pci!PciBuildCurrentResourceList+0x23d:
fffff800`0924453d 807b3c00        cmp     byte ptr [rbx+3Ch],0
fffff800`09244541 0f850d010000    jne     pci!PciBuildCurrentResourceList+0x354 (fffff800`09244654)  Branch

pci!PciBuildCurrentResourceList+0x247:
fffff800`09244547 807b5000        cmp     byte ptr [rbx+50h],0
fffff800`0924454b 0f8519010000    jne     pci!PciBuildCurrentResourceList+0x36a (fffff800`0924466a)  Branch

pci!PciBuildCurrentResourceList+0x251:
fffff800`09244551 807b6400        cmp     byte ptr [rbx+64h],0
fffff800`09244555 0f8525010000    jne     pci!PciBuildCurrentResourceList+0x380 (fffff800`09244680)  Branch

pci!PciBuildCurrentResourceList+0x25b:
fffff800`0924455b 807b7800        cmp     byte ptr [rbx+78h],0
fffff800`0924455f 0f8531010000    jne     pci!PciBuildCurrentResourceList+0x396 (fffff800`09244696)  Branch

pci!PciBuildCurrentResourceList+0x265:
fffff800`09244565 80bb8c00000000  cmp     byte ptr [rbx+8Ch],0
fffff800`0924456c 0f853d010000    jne     pci!PciBuildCurrentResourceList+0x3af (fffff800`092446af)  Branch

pci!PciBuildCurrentResourceList+0x272:
fffff800`09244572 80bba000000000  cmp     byte ptr [rbx+0A0h],0
fffff800`09244579 0f854c010000    jne     pci!PciBuildCurrentResourceList+0x3cb (fffff800`092446cb)  Branch

pci!PciBuildCurrentResourceList+0x27f:
fffff800`0924457f 80bbb400000000  cmp     byte ptr [rbx+0B4h],0
fffff800`09244586 0f855b010000    jne     pci!PciBuildCurrentResourceList+0x3e7 (fffff800`092446e7)  Branch

pci!PciBuildCurrentResourceList+0x28c:
fffff800`0924458c 80bbc800000000  cmp     byte ptr [rbx+0C8h],0
fffff800`09244593 0f856a010000    jne     pci!PciBuildCurrentResourceList+0x403 (fffff800`09244703)  Branch

pci!PciBuildCurrentResourceList+0x299:
fffff800`09244599 80bbdc00000000  cmp     byte ptr [rbx+0DCh],0
fffff800`092445a0 0f8579010000    jne     pci!PciBuildCurrentResourceList+0x41f (fffff800`0924471f)  Branch

pci!PciBuildCurrentResourceList+0x2a6:
fffff800`092445a6 80bbf000000000  cmp     byte ptr [rbx+0F0h],0
fffff800`092445ad 0f8588010000    jne     pci!PciBuildCurrentResourceList+0x43b (fffff800`0924473b)  Branch

pci!PciBuildCurrentResourceList+0x2b3:
fffff800`092445b3 4584ed          test    r13b,r13b
fffff800`092445b6 0f8562480100    jne     pci!PciBuildCurrentResourceList+0x14b1e (fffff800`09258e1e)  Branch

pci!PciBuildCurrentResourceList+0x2bc:
fffff800`092445bc 4584e4          test    r12b,r12b
fffff800`092445bf 741d            je      pci!PciBuildCurrentResourceList+0x2de (fffff800`092445de)  Branch

pci!PciBuildCurrentResourceList+0x2c1:
fffff800`092445c1 c70102030000    mov     dword ptr [rcx],302h
fffff800`092445c7 0fb6868c030000  movzx   eax,byte ptr [rsi+38Ch]
fffff800`092445ce 894108          mov     dword ptr [rcx+8],eax
fffff800`092445d1 66894104        mov     word ptr [rcx+4],ax
fffff800`092445d5 b8ffffffff      mov     eax,0FFFFFFFFh
fffff800`092445da 4889410c        mov     qword ptr [rcx+0Ch],rax

pci!PciBuildCurrentResourceList+0x2de:
fffff800`092445de 49893f          mov     qword ptr [r15],rdi

pci!PciBuildCurrentResourceList+0x2e1:
fffff800`092445e1 33c0            xor     eax,eax

pci!PciBuildCurrentResourceList+0x2e3:
fffff800`092445e3 4c8b6c2458      mov     r13,qword ptr [rsp+58h]
fffff800`092445e8 488b6c2460      mov     rbp,qword ptr [rsp+60h]
fffff800`092445ed 488b9c24a0000000 mov     rbx,qword ptr [rsp+0A0h]
fffff800`092445f5 4c8b742450      mov     r14,qword ptr [rsp+50h]

pci!PciBuildCurrentResourceList+0x2fa:
fffff800`092445fa 488b4c2448      mov     rcx,qword ptr [rsp+48h]
fffff800`092445ff 4833cc          xor     rcx,rsp
fffff800`09244602 e809d2fcff      call    pci!_security_check_cookie (fffff800`09211810)
fffff800`09244607 4883c468        add     rsp,68h
fffff800`0924460b 415f            pop     r15
fffff800`0924460d 415c            pop     r12
fffff800`0924460f 5f              pop     rdi
fffff800`09244610 5e              pop     rsi
fffff800`09244611 c3              ret

pci!PciBuildCurrentResourceList+0x313:
fffff800`09244613 0f1003          movups  xmm0,xmmword ptr [rbx]
fffff800`09244616 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`09244619 8b4310          mov     eax,dword ptr [rbx+10h]
fffff800`0924461c 894110          mov     dword ptr [rcx+10h],eax
fffff800`0924461f 4883c114        add     rcx,14h
fffff800`09244623 e901ffffff      jmp     pci!PciBuildCurrentResourceList+0x229 (fffff800`09244529)  Branch

pci!PciBuildCurrentResourceList+0x328:
fffff800`09244628 0f104314        movups  xmm0,xmmword ptr [rbx+14h]
fffff800`0924462c 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`0924462f 8b4324          mov     eax,dword ptr [rbx+24h]
fffff800`09244632 894110          mov     dword ptr [rcx+10h],eax
fffff800`09244635 4883c114        add     rcx,14h
fffff800`09244639 e9f5feffff      jmp     pci!PciBuildCurrentResourceList+0x233 (fffff800`09244533)  Branch

pci!PciBuildCurrentResourceList+0x33e:
fffff800`0924463e 0f104328        movups  xmm0,xmmword ptr [rbx+28h]
fffff800`09244642 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`09244645 8b4338          mov     eax,dword ptr [rbx+38h]
fffff800`09244648 894110          mov     dword ptr [rcx+10h],eax
fffff800`0924464b 4883c114        add     rcx,14h
fffff800`0924464f e9e9feffff      jmp     pci!PciBuildCurrentResourceList+0x23d (fffff800`0924453d)  Branch

pci!PciBuildCurrentResourceList+0x354:
fffff800`09244654 0f10433c        movups  xmm0,xmmword ptr [rbx+3Ch]
fffff800`09244658 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`0924465b 8b434c          mov     eax,dword ptr [rbx+4Ch]
fffff800`0924465e 894110          mov     dword ptr [rcx+10h],eax
fffff800`09244661 4883c114        add     rcx,14h
fffff800`09244665 e9ddfeffff      jmp     pci!PciBuildCurrentResourceList+0x247 (fffff800`09244547)  Branch

pci!PciBuildCurrentResourceList+0x36a:
fffff800`0924466a 0f104350        movups  xmm0,xmmword ptr [rbx+50h]
fffff800`0924466e 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`09244671 8b4360          mov     eax,dword ptr [rbx+60h]
fffff800`09244674 894110          mov     dword ptr [rcx+10h],eax
fffff800`09244677 4883c114        add     rcx,14h
fffff800`0924467b e9d1feffff      jmp     pci!PciBuildCurrentResourceList+0x251 (fffff800`09244551)  Branch

pci!PciBuildCurrentResourceList+0x380:
fffff800`09244680 0f104364        movups  xmm0,xmmword ptr [rbx+64h]
fffff800`09244684 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`09244687 8b4374          mov     eax,dword ptr [rbx+74h]
fffff800`0924468a 894110          mov     dword ptr [rcx+10h],eax
fffff800`0924468d 4883c114        add     rcx,14h
fffff800`09244691 e9c5feffff      jmp     pci!PciBuildCurrentResourceList+0x25b (fffff800`0924455b)  Branch

pci!PciBuildCurrentResourceList+0x396:
fffff800`09244696 0f104378        movups  xmm0,xmmword ptr [rbx+78h]
fffff800`0924469a 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`0924469d 8b8388000000    mov     eax,dword ptr [rbx+88h]
fffff800`092446a3 894110          mov     dword ptr [rcx+10h],eax
fffff800`092446a6 4883c114        add     rcx,14h
fffff800`092446aa e9b6feffff      jmp     pci!PciBuildCurrentResourceList+0x265 (fffff800`09244565)  Branch

pci!PciBuildCurrentResourceList+0x3af:
fffff800`092446af 0f10838c000000  movups  xmm0,xmmword ptr [rbx+8Ch]
fffff800`092446b6 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`092446b9 8b839c000000    mov     eax,dword ptr [rbx+9Ch]
fffff800`092446bf 894110          mov     dword ptr [rcx+10h],eax
fffff800`092446c2 4883c114        add     rcx,14h
fffff800`092446c6 e9a7feffff      jmp     pci!PciBuildCurrentResourceList+0x272 (fffff800`09244572)  Branch

pci!PciBuildCurrentResourceList+0x3cb:
fffff800`092446cb 0f1083a0000000  movups  xmm0,xmmword ptr [rbx+0A0h]
fffff800`092446d2 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`092446d5 8b83b0000000    mov     eax,dword ptr [rbx+0B0h]
fffff800`092446db 894110          mov     dword ptr [rcx+10h],eax
fffff800`092446de 4883c114        add     rcx,14h
fffff800`092446e2 e998feffff      jmp     pci!PciBuildCurrentResourceList+0x27f (fffff800`0924457f)  Branch

pci!PciBuildCurrentResourceList+0x3e7:
fffff800`092446e7 0f1083b4000000  movups  xmm0,xmmword ptr [rbx+0B4h]
fffff800`092446ee 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`092446f1 8b83c4000000    mov     eax,dword ptr [rbx+0C4h]
fffff800`092446f7 894110          mov     dword ptr [rcx+10h],eax
fffff800`092446fa 4883c114        add     rcx,14h
fffff800`092446fe e989feffff      jmp     pci!PciBuildCurrentResourceList+0x28c (fffff800`0924458c)  Branch

pci!PciBuildCurrentResourceList+0x403:
fffff800`09244703 0f1083c8000000  movups  xmm0,xmmword ptr [rbx+0C8h]
fffff800`0924470a 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`0924470d 8b83d8000000    mov     eax,dword ptr [rbx+0D8h]
fffff800`09244713 894110          mov     dword ptr [rcx+10h],eax
fffff800`09244716 4883c114        add     rcx,14h
fffff800`0924471a e97afeffff      jmp     pci!PciBuildCurrentResourceList+0x299 (fffff800`09244599)  Branch

pci!PciBuildCurrentResourceList+0x41f:
fffff800`0924471f 0f1083dc000000  movups  xmm0,xmmword ptr [rbx+0DCh]
fffff800`09244726 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`09244729 8b83ec000000    mov     eax,dword ptr [rbx+0ECh]
fffff800`0924472f 894110          mov     dword ptr [rcx+10h],eax
fffff800`09244732 4883c114        add     rcx,14h
fffff800`09244736 e96bfeffff      jmp     pci!PciBuildCurrentResourceList+0x2a6 (fffff800`092445a6)  Branch

pci!PciBuildCurrentResourceList+0x43b:
fffff800`0924473b 0f1083f0000000  movups  xmm0,xmmword ptr [rbx+0F0h]
fffff800`09244742 0f1101          movups  xmmword ptr [rcx],xmm0
fffff800`09244745 8b8300010000    mov     eax,dword ptr [rbx+100h]
fffff800`0924474b 894110          mov     dword ptr [rcx+10h],eax
fffff800`0924474e 4883c114        add     rcx,14h
fffff800`09244752 e95cfeffff      jmp     pci!PciBuildCurrentResourceList+0x2b3 (fffff800`092445b3)  Branch

pci!PciBuildCurrentResourceList+0x457:
fffff800`09244757 488bce          mov     rcx,rsi
fffff800`0924475a e8590bfcff      call    pci!PciSubtractiveDecodeBridge (fffff800`092052b8)
fffff800`0924475f 84c0            test    al,al
fffff800`09244761 0f8547fdffff    jne     pci!PciBuildCurrentResourceList+0x1ae (fffff800`092444ae)  Branch

pci!PciBuildCurrentResourceList+0x467:
fffff800`09244767 0fb7863e040000  movzx   eax,word ptr [rsi+43Eh]
fffff800`0924476e a808            test    al,8
fffff800`09244770 0f8438fdffff    je      pci!PciBuildCurrentResourceList+0x1ae (fffff800`092444ae)  Branch

pci!PciBuildCurrentResourceList+0x476:
fffff800`09244776 e96c460100      jmp     pci!PciBuildCurrentResourceList+0x14ae7 (fffff800`09258de7)  Branch

pci!PciBuildCurrentResourceList+0x47b:
fffff800`0924477b 41b401          mov     r12b,1
fffff800`0924477e ffc5            inc     ebp
fffff800`09244780 e91bfdffff      jmp     pci!PciBuildCurrentResourceList+0x1a0 (fffff800`092444a0)  Branch

pci!PciBuildCurrentResourceList+0x14a66:
fffff800`09258d66 837c242801      cmp     dword ptr [rsp+28h],1
fffff800`09258d6b 0f8634b6feff    jbe     pci!PciBuildCurrentResourceList+0xa5 (fffff800`092443a5)  Branch

pci!PciBuildCurrentResourceList+0x14a71:
fffff800`09258d71 488b442430      mov     rax,qword ptr [rsp+30h]
fffff800`09258d76 488d9ee0000000  lea     rbx,[rsi+0E0h]
fffff800`09258d7d 488bcb          mov     rcx,rbx
fffff800`09258d80 4805c0010000    add     rax,1C0h
fffff800`09258d86 ba02000000      mov     edx,2

pci!PciBuildCurrentResourceList+0x14a8b:
fffff800`09258d8b 488d8980000000  lea     rcx,[rcx+80h]
fffff800`09258d92 0f1000          movups  xmm0,xmmword ptr [rax]
fffff800`09258d95 488d8080000000  lea     rax,[rax+80h]
fffff800`09258d9c 0f114180        movups  xmmword ptr [rcx-80h],xmm0
fffff800`09258da0 0f104890        movups  xmm1,xmmword ptr [rax-70h]
fffff800`09258da4 0f114990        movups  xmmword ptr [rcx-70h],xmm1
fffff800`09258da8 0f1040a0        movups  xmm0,xmmword ptr [rax-60h]
fffff800`09258dac 0f1141a0        movups  xmmword ptr [rcx-60h],xmm0
fffff800`09258db0 0f1048b0        movups  xmm1,xmmword ptr [rax-50h]
fffff800`09258db4 0f1149b0        movups  xmmword ptr [rcx-50h],xmm1
fffff800`09258db8 0f1040c0        movups  xmm0,xmmword ptr [rax-40h]
fffff800`09258dbc 0f1141c0        movups  xmmword ptr [rcx-40h],xmm0
fffff800`09258dc0 0f1048d0        movups  xmm1,xmmword ptr [rax-30h]
fffff800`09258dc4 0f1149d0        movups  xmmword ptr [rcx-30h],xmm1
fffff800`09258dc8 0f1040e0        movups  xmm0,xmmword ptr [rax-20h]
fffff800`09258dcc 0f1141e0        movups  xmmword ptr [rcx-20h],xmm0
fffff800`09258dd0 0f1048f0        movups  xmm1,xmmword ptr [rax-10h]
fffff800`09258dd4 0f1149f0        movups  xmmword ptr [rcx-10h],xmm1
fffff800`09258dd8 4883ea01        sub     rdx,1
fffff800`09258ddc 75ad            jne     pci!PciBuildCurrentResourceList+0x14a8b (fffff800`09258d8b)  Branch

pci!PciBuildCurrentResourceList+0x14ade:
fffff800`09258dde 8b00            mov     eax,dword ptr [rax]
fffff800`09258de0 8901            mov     dword ptr [rcx],eax
fffff800`09258de2 e9e4b5feff      jmp     pci!PciBuildCurrentResourceList+0xcb (fffff800`092443cb)  Branch

pci!PciBuildCurrentResourceList+0x14ae7:
fffff800`09258de7 440fb6c0        movzx   r8d,al
fffff800`09258deb 41b501          mov     r13b,1
fffff800`09258dee 41c0e804        shr     r8b,4
fffff800`09258df2 8d4501          lea     eax,[rbp+1]
fffff800`09258df5 41f6d0          not     r8b
fffff800`09258df8 4522c5          and     r8b,r13b
fffff800`09258dfb f6c202          test    dl,2
fffff800`09258dfe 4488442420      mov     byte ptr [rsp+20h],r8b
fffff800`09258e03 0f44c5          cmove   eax,ebp
fffff800`09258e06 8be8            mov     ebp,eax
fffff800`09258e08 4184d5          test    r13b,dl
fffff800`09258e0b 0f849db6feff    je      pci!PciBuildCurrentResourceList+0x1ae (fffff800`092444ae)  Branch

pci!PciBuildCurrentResourceList+0x14b11:
fffff800`09258e11 83c502          add     ebp,2
fffff800`09258e14 4488442420      mov     byte ptr [rsp+20h],r8b
fffff800`09258e19 e990b6feff      jmp     pci!PciBuildCurrentResourceList+0x1ae (fffff800`092444ae)  Branch

pci!PciBuildCurrentResourceList+0x14b1e:
fffff800`09258e1e 0fb7442424      movzx   eax,word ptr [rsp+24h]
fffff800`09258e23 a802            test    al,2
fffff800`09258e25 7423            je      pci!PciBuildCurrentResourceList+0x14b4a (fffff800`09258e4a)  Branch

pci!PciBuildCurrentResourceList+0x14b27:
fffff800`09258e27 4533c9          xor     r9d,r9d
fffff800`09258e2a c60103          mov     byte ptr [rcx],3
fffff800`09258e2d 6644894902      mov     word ptr [rcx+2],r9w
fffff800`09258e32 48c7410400000a00 mov     qword ptr [rcx+4],0A0000h
fffff800`09258e3a c7410c00000200  mov     dword ptr [rcx+0Ch],20000h
fffff800`09258e41 4883c114        add     rcx,14h
fffff800`09258e45 0fb7442424      movzx   eax,word ptr [rsp+24h]

pci!PciBuildCurrentResourceList+0x14b4a:
fffff800`09258e4a a801            test    al,1
fffff800`09258e4c 0f846ab7feff    je      pci!PciBuildCurrentResourceList+0x2bc (fffff800`092445bc)  Branch

pci!PciBuildCurrentResourceList+0x14b52:
fffff800`09258e52 0fb6442420      movzx   eax,byte ptr [rsp+20h]
fffff800`09258e57 ba20000000      mov     edx,20h
fffff800`09258e5c c60101          mov     byte ptr [rcx],1
fffff800`09258e5f 66895102        mov     word ptr [rcx+2],dx
fffff800`09258e63 448d4204        lea     r8d,[rdx+4]
fffff800`09258e67 84c0            test    al,al
fffff800`09258e69 7405            je      pci!PciBuildCurrentResourceList+0x14b70 (fffff800`09258e70)  Branch

pci!PciBuildCurrentResourceList+0x14b6b:
fffff800`09258e6b 6644894102      mov     word ptr [rcx+2],r8w

pci!PciBuildCurrentResourceList+0x14b70:
fffff800`09258e70 48c74104b0030000 mov     qword ptr [rcx+4],3B0h
fffff800`09258e78 c7410c0c000000  mov     dword ptr [rcx+0Ch],0Ch
fffff800`09258e7f 66895116        mov     word ptr [rcx+16h],dx
fffff800`09258e83 c6411401        mov     byte ptr [rcx+14h],1
fffff800`09258e87 84c0            test    al,al
fffff800`09258e89 7405            je      pci!PciBuildCurrentResourceList+0x14b90 (fffff800`09258e90)  Branch

pci!PciBuildCurrentResourceList+0x14b8b:
fffff800`09258e8b 6644894116      mov     word ptr [rcx+16h],r8w

pci!PciBuildCurrentResourceList+0x14b90:
fffff800`09258e90 48c74118c0030000 mov     qword ptr [rcx+18h],3C0h
fffff800`09258e98 895120          mov     dword ptr [rcx+20h],edx
fffff800`09258e9b 4883c128        add     rcx,28h
fffff800`09258e9f e918b7feff      jmp     pci!PciBuildCurrentResourceList+0x2bc (fffff800`092445bc)  Branch

pci!PciBuildCurrentResourceList+0x14ba4:
fffff800`09258ea4 b89a0000c0      mov     eax,0C000009Ah
fffff800`09258ea9 e935b7feff      jmp     pci!PciBuildCurrentResourceList+0x2e3 (fffff800`092445e3)  Branch

pci!PciBuildCurrentResourceList+0x14bae:
fffff800`09258eae b80e0000c0      mov     eax,0C000000Eh
fffff800`09258eb3 e942b7feff      jmp     pci!PciBuildCurrentResourceList+0x2fa (fffff800`092445fa)  Branch
