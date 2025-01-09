1: kd> uf 0xfffff800`0c154400
stornvme!NVMeHwFindAdapter:
fffff800`0c154400 488bc4          mov     rax,rsp
fffff800`0c154403 48895810        mov     qword ptr [rax+10h],rbx
fffff800`0c154407 48897018        mov     qword ptr [rax+18h],rsi
fffff800`0c15440b 48897820        mov     qword ptr [rax+20h],rdi
fffff800`0c15440f 55              push    rbp
fffff800`0c154410 4154            push    r12
fffff800`0c154412 4155            push    r13
fffff800`0c154414 4156            push    r14
fffff800`0c154416 4157            push    r15
fffff800`0c154418 488d6888        lea     rbp,[rax-78h]
fffff800`0c15441c 4881ec50010000  sub     rsp,150h
fffff800`0c154423 488b05d6ab0200  mov     rax,qword ptr [stornvme!_security_cookie (fffff800`0c17f000)]
fffff800`0c15442a 4833c4          xor     rax,rsp
fffff800`0c15442d 48894540        mov     qword ptr [rbp+40h],rax
fffff800`0c154431 488bbda0000000  mov     rdi,qword ptr [rbp+0A0h]
fffff800`0c154438 4533ed          xor     r13d,r13d
fffff800`0c15443b 488bd9          mov     rbx,rcx
fffff800`0c15443e 66c7453a0100    mov     word ptr [rbp+3Ah],1
fffff800`0c154444 33d2            xor     edx,edx
fffff800`0c154446 6644896d3d      mov     word ptr [rbp+3Dh],r13w
fffff800`0c15444b 488d4d80        lea     rcx,[rbp-80h]
fffff800`0c15444f 458bfd          mov     r15d,r13d
fffff800`0c154452 4c8b7740        mov     r14,qword ptr [rdi+40h]
fffff800`0c154456 458d4558        lea     r8d,[r13+58h]
fffff800`0c15445a e821a00100      call    stornvme!_memset_spec_ermsb (fffff800`0c16e480)
fffff800`0c15445f 448b6318        mov     r12d,dword ptr [rbx+18h]
fffff800`0c154463 418d7502        lea     esi,[r13+2]
fffff800`0c154467 4423e6          and     r12d,esi
fffff800`0c15446a 4c896c2468      mov     qword ptr [rsp+68h],r13
fffff800`0c15446f 8d46ff          lea     eax,[rsi-1]
fffff800`0c154472 44886c2460      mov     byte ptr [rsp+60h],r13b
fffff800`0c154477 c7453000010101  mov     dword ptr [rbp+30h],1010100h
fffff800`0c15447e c7453401010101  mov     dword ptr [rbp+34h],1010101h
fffff800`0c154485 66c745380101    mov     word ptr [rbp+38h],101h
fffff800`0c15448b 88453c          mov     byte ptr [rbp+3Ch],al
fffff800`0c15448e 4438afc5000000  cmp     byte ptr [rdi+0C5h],r13b
fffff800`0c154495 7503            jne     stornvme!NVMeHwFindAdapter+0x9a (fffff800`0c15449a)  Branch

stornvme!NVMeHwFindAdapter+0x97:
fffff800`0c154497 88453e          mov     byte ptr [rbp+3Eh],al

stornvme!NVMeHwFindAdapter+0x9a:
fffff800`0c15449a 41b80f000000    mov     r8d,0Fh
fffff800`0c1544a0 4c8d4d30        lea     r9,[rbp+30h]
fffff800`0c1544a4 488bd3          mov     rdx,rbx
fffff800`0c1544a7 418d4858        lea     ecx,[r8+58h]
fffff800`0c1544ab 4c8b15e6eb0200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c1544b2 e849a0d5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c1544b7 4585e4          test    r12d,r12d
fffff800`0c1544ba 751d            jne     stornvme!NVMeHwFindAdapter+0xd9 (fffff800`0c1544d9)  Branch

stornvme!NVMeHwFindAdapter+0xbc:
fffff800`0c1544bc 0fb60d3eac0200  movzx   ecx,byte ptr [stornvme!g_ControllerExtensionIndex (fffff800`0c17f101)]
fffff800`0c1544c3 488d15b6ab0200  lea     rdx,[stornvme!g_ControllerExtension (fffff800`0c17f080)]
fffff800`0c1544ca 48891cca        mov     qword ptr [rdx+rcx*8],rbx
fffff800`0c1544ce fec1            inc     cl
fffff800`0c1544d0 80e10f          and     cl,0Fh
fffff800`0c1544d3 880d28ac0200    mov     byte ptr [stornvme!g_ControllerExtensionIndex (fffff800`0c17f101)],cl

stornvme!NVMeHwFindAdapter+0xd9:
fffff800`0c1544d9 8a8fc5000000    mov     cl,byte ptr [rdi+0C5h]
fffff800`0c1544df 884b14          mov     byte ptr [rbx+14h],cl
fffff800`0c1544e2 8b87c8000000    mov     eax,dword ptr [rdi+0C8h]
fffff800`0c1544e8 4084c6          test    sil,al
fffff800`0c1544eb 7412            je      stornvme!NVMeHwFindAdapter+0xff (fffff800`0c1544ff)  Branch

stornvme!NVMeHwFindAdapter+0xed:
fffff800`0c1544ed 0fbaab380f00000c bts     dword ptr [rbx+0F38h],0Ch
fffff800`0c1544f5 b804000000      mov     eax,4
fffff800`0c1544fa e919070000      jmp     stornvme!NVMeHwFindAdapter+0x818 (fffff800`0c154c18)  Branch

stornvme!NVMeHwFindAdapter+0xff:
fffff800`0c1544ff b840000000      mov     eax,40h
fffff800`0c154504 84c9            test    cl,cl
fffff800`0c154506 0f84c5000000    je      stornvme!NVMeHwFindAdapter+0x1d1 (fffff800`0c1545d1)  Branch

stornvme!NVMeHwFindAdapter+0x10c:
fffff800`0c15450c 4d85f6          test    r14,r14
fffff800`0c15450f 0f84b4000000    je      stornvme!NVMeHwFindAdapter+0x1c9 (fffff800`0c1545c9)  Branch

stornvme!NVMeHwFindAdapter+0x115:
fffff800`0c154515 448d4858        lea     r9d,[rax+58h]
fffff800`0c154519 44896c2420      mov     dword ptr [rsp+20h],r13d
fffff800`0c15451e 4d8bc6          mov     r8,r14
fffff800`0c154521 8d48ed          lea     ecx,[rax-13h]
fffff800`0c154524 488bd3          mov     rdx,rbx
fffff800`0c154527 4c8b156aeb0200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c15452e e8cd9fd5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154533 410fb706        movzx   eax,word ptr [r14]
fffff800`0c154537 ba80000000      mov     edx,80h
fffff800`0c15453c 66894304        mov     word ptr [rbx+4],ax
fffff800`0c154540 410fb74602      movzx   eax,word ptr [r14+2]
fffff800`0c154545 66894306        mov     word ptr [rbx+6],ax
fffff800`0c154549 418a4604        mov     al,byte ptr [r14+4]
fffff800`0c15454d 884308          mov     byte ptr [rbx+8],al
fffff800`0c154550 4d8b4608        mov     r8,qword ptr [r14+8]
fffff800`0c154554 4c8983a8000000  mov     qword ptr [rbx+0A8h],r8
fffff800`0c15455b 410f104610      movups  xmm0,xmmword ptr [r14+10h]
fffff800`0c154560 0f114320        movups  xmmword ptr [rbx+20h],xmm0
fffff800`0c154564 410f104e20      movups  xmm1,xmmword ptr [r14+20h]
fffff800`0c154569 0f114b30        movups  xmmword ptr [rbx+30h],xmm1
fffff800`0c15456d 410f104630      movups  xmm0,xmmword ptr [r14+30h]
fffff800`0c154572 0f114340        movups  xmmword ptr [rbx+40h],xmm0
fffff800`0c154576 410f104e40      movups  xmm1,xmmword ptr [r14+40h]
fffff800`0c15457b 0f114b50        movups  xmmword ptr [rbx+50h],xmm1
fffff800`0c15457f 410f104650      movups  xmm0,xmmword ptr [r14+50h]
fffff800`0c154584 0f114360        movups  xmmword ptr [rbx+60h],xmm0
fffff800`0c154588 410f104e60      movups  xmm1,xmmword ptr [r14+60h]
fffff800`0c15458d 0f114b70        movups  xmmword ptr [rbx+70h],xmm1
fffff800`0c154591 410f104670      movups  xmm0,xmmword ptr [r14+70h]
fffff800`0c154596 0f118380000000  movups  xmmword ptr [rbx+80h],xmm0
fffff800`0c15459d 410f108e80000000 movups  xmm1,xmmword ptr [r14+80h]
fffff800`0c1545a5 0f114c1310      movups  xmmword ptr [rbx+rdx+10h],xmm1
fffff800`0c1545aa 418b441610      mov     eax,dword ptr [r14+rdx+10h]
fffff800`0c1545af 89441320        mov     dword ptr [rbx+rdx+20h],eax
fffff800`0c1545b3 418b8694000000  mov     eax,dword ptr [r14+94h]
fffff800`0c1545ba 834b3804        or      dword ptr [rbx+38h],4
fffff800`0c1545be 8983d8000000    mov     dword ptr [rbx+0D8h],eax
fffff800`0c1545c4 e99d000000      jmp     stornvme!NVMeHwFindAdapter+0x266 (fffff800`0c154666)  Branch

stornvme!NVMeHwFindAdapter+0x1c9:
fffff800`0c1545c9 89731c          mov     dword ptr [rbx+1Ch],esi
fffff800`0c1545cc e9db040000      jmp     stornvme!NVMeHwFindAdapter+0x6ac (fffff800`0c154aac)  Branch

stornvme!NVMeHwFindAdapter+0x1d1:
fffff800`0c1545d1 4c8bc0          mov     r8,rax
fffff800`0c1545d4 488d4de0        lea     rcx,[rbp-20h]
fffff800`0c1545d8 33d2            xor     edx,edx
fffff800`0c1545da e8a19e0100      call    stornvme!_memset_spec_ermsb (fffff800`0c16e480)
fffff800`0c1545df 448b4f64        mov     r9d,dword ptr [rdi+64h]
fffff800`0c1545e3 488d45e0        lea     rax,[rbp-20h]
fffff800`0c1545e7 448b4704        mov     r8d,dword ptr [rdi+4]
fffff800`0c1545eb 41be40000000    mov     r14d,40h
fffff800`0c1545f1 4489742428      mov     dword ptr [rsp+28h],r14d
fffff800`0c1545f6 488bcb          mov     rcx,rbx
fffff800`0c1545f9 4889442420      mov     qword ptr [rsp+20h],rax
fffff800`0c1545fe 418d56c4        lea     edx,[r14-3Ch]
fffff800`0c154602 4c8b1597ea0200  mov     r10,qword ptr [stornvme!_imp_StorPortGetBusData (fffff800`0c1830a0)]
fffff800`0c154609 e88292d9ff      call    storport!StorPortGetBusData (fffff800`0beed890)
fffff800`0c15460e 413bc6          cmp     eax,r14d
fffff800`0c154611 0f8581040000    jne     stornvme!NVMeHwFindAdapter+0x698 (fffff800`0c154a98)  Branch

stornvme!NVMeHwFindAdapter+0x217:
fffff800`0c154617 0fb745e0        movzx   eax,word ptr [rbp-20h]
fffff800`0c15461b 488bcb          mov     rcx,rbx
fffff800`0c15461e 66894304        mov     word ptr [rbx+4],ax
fffff800`0c154622 0fb745e2        movzx   eax,word ptr [rbp-1Eh]
fffff800`0c154626 66894306        mov     word ptr [rbx+6],ax
fffff800`0c15462a 8a45e8          mov     al,byte ptr [rbp-18h]
fffff800`0c15462d 884308          mov     byte ptr [rbx+8],al
fffff800`0c154630 e8a7fdffff      call    stornvme!IsIntelChatham (fffff800`0c1543dc)
fffff800`0c154635 84c0            test    al,al
fffff800`0c154637 740f            je      stornvme!NVMeHwFindAdapter+0x248 (fffff800`0c154648)  Branch

stornvme!NVMeHwFindAdapter+0x239:
fffff800`0c154639 488b45f8        mov     rax,qword ptr [rbp-8]
fffff800`0c15463d b900f0ffff      mov     ecx,0FFFFF000h
fffff800`0c154642 448b45fc        mov     r8d,dword ptr [rbp-4]
fffff800`0c154646 eb0d            jmp     stornvme!NVMeHwFindAdapter+0x255 (fffff800`0c154655)  Branch

stornvme!NVMeHwFindAdapter+0x248:
fffff800`0c154648 488b45f0        mov     rax,qword ptr [rbp-10h]
fffff800`0c15464c b900c0ffff      mov     ecx,0FFFFC000h
fffff800`0c154651 448b45f4        mov     r8d,dword ptr [rbp-0Ch]

stornvme!NVMeHwFindAdapter+0x255:
fffff800`0c154655 4823c1          and     rax,rcx
fffff800`0c154658 49c1e020        shl     r8,20h
fffff800`0c15465c 4c0bc0          or      r8,rax
fffff800`0c15465f 4c8983a8000000  mov     qword ptr [rbx+0A8h],r8

stornvme!NVMeHwFindAdapter+0x266:
fffff800`0c154666 488bd7          mov     rdx,rdi
fffff800`0c154669 488bcb          mov     rcx,rbx
fffff800`0c15466c e8a3540100      call    stornvme!GetNVMeRegisterAddress (fffff800`0c169b14)
fffff800`0c154671 488983b0000000  mov     qword ptr [rbx+0B0h],rax
fffff800`0c154678 4885c0          test    rax,rax
fffff800`0c15467b 7516            jne     stornvme!NVMeHwFindAdapter+0x293 (fffff800`0c154693)  Branch

stornvme!NVMeHwFindAdapter+0x27d:
fffff800`0c15467d c7431c04000000  mov     dword ptr [rbx+1Ch],4
fffff800`0c154684 4c8d3d6d100200  lea     r15,[stornvme!`string` (fffff800`0c1756f8)]
fffff800`0c15468b 8d7003          lea     esi,[rax+3]
fffff800`0c15468e e919040000      jmp     stornvme!NVMeHwFindAdapter+0x6ac (fffff800`0c154aac)  Branch

stornvme!NVMeHwFindAdapter+0x293:
fffff800`0c154693 90              nop
fffff800`0c154694 ba04000000      mov     edx,4
fffff800`0c154699 488b00          mov     rax,qword ptr [rax]
fffff800`0c15469c 488983c0000000  mov     qword ptr [rbx+0C0h],rax
fffff800`0c1546a3 488b83b0000000  mov     rax,qword ptr [rbx+0B0h]
fffff800`0c1546aa 90              nop
fffff800`0c1546ab 8b4008          mov     eax,dword ptr [rax+8]
fffff800`0c1546ae 488b8bc0000000  mov     rcx,qword ptr [rbx+0C0h]
fffff800`0c1546b5 48c1e920        shr     rcx,20h
fffff800`0c1546b9 80e10f          and     cl,0Fh
fffff800`0c1546bc 8983b8000000    mov     dword ptr [rbx+0B8h],eax
fffff800`0c1546c2 d3e2            shl     edx,cl
fffff800`0c1546c4 488bcb          mov     rcx,rbx
fffff800`0c1546c7 8993c8000000    mov     dword ptr [rbx+0C8h],edx
fffff800`0c1546cd e80afdffff      call    stornvme!IsIntelChatham (fffff800`0c1543dc)
fffff800`0c1546d2 41bf01000000    mov     r15d,1
fffff800`0c1546d8 84c0            test    al,al
fffff800`0c1546da 7407            je      stornvme!NVMeHwFindAdapter+0x2e3 (fffff800`0c1546e3)  Branch

stornvme!NVMeHwFindAdapter+0x2dc:
fffff800`0c1546dc 4488bbc3000000  mov     byte ptr [rbx+0C3h],r15b

stornvme!NVMeHwFindAdapter+0x2e3:
fffff800`0c1546e3 0fb683c3000000  movzx   eax,byte ptr [rbx+0C3h]
fffff800`0c1546ea 69c8f4010000    imul    ecx,eax,1F4h
fffff800`0c1546f0 898bcc000000    mov     dword ptr [rbx+0CCh],ecx
fffff800`0c1546f6 44386b14        cmp     byte ptr [rbx+14h],r13b
fffff800`0c1546fa 750d            jne     stornvme!NVMeHwFindAdapter+0x309 (fffff800`0c154709)  Branch

stornvme!NVMeHwFindAdapter+0x2fc:
fffff800`0c1546fc 4585e4          test    r12d,r12d
fffff800`0c1546ff 7508            jne     stornvme!NVMeHwFindAdapter+0x309 (fffff800`0c154709)  Branch

stornvme!NVMeHwFindAdapter+0x301:
fffff800`0c154701 488bcb          mov     rcx,rbx
fffff800`0c154704 e87b540100      call    stornvme!GetRegistrySettings (fffff800`0c169b84)

stornvme!NVMeHwFindAdapter+0x309:
fffff800`0c154709 44397f14        cmp     dword ptr [rdi+14h],r15d
fffff800`0c15470d 4c8d4c2460      lea     r9,[rsp+60h]
fffff800`0c154712 41be03000000    mov     r14d,3
fffff800`0c154718 458bc7          mov     r8d,r15d
fffff800`0c15471b 418bc6          mov     eax,r14d
fffff800`0c15471e 488bd3          mov     rdx,rbx
fffff800`0c154721 410f45c7        cmovne  eax,r15d
fffff800`0c154725 894310          mov     dword ptr [rbx+10h],eax
fffff800`0c154728 418d4e5e        lea     ecx,[r14+5Eh]
fffff800`0c15472c 4c8b1565e90200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154733 e8c89dd5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154738 85c0            test    eax,eax
fffff800`0c15473a 740a            je      stornvme!NVMeHwFindAdapter+0x346 (fffff800`0c154746)  Branch

stornvme!NVMeHwFindAdapter+0x33c:
fffff800`0c15473c 0fbab3380f000010 btr     dword ptr [rbx+0F38h],10h
fffff800`0c154744 eb20            jmp     stornvme!NVMeHwFindAdapter+0x366 (fffff800`0c154766)  Branch

stornvme!NVMeHwFindAdapter+0x346:
fffff800`0c154746 8a442460        mov     al,byte ptr [rsp+60h]
fffff800`0c15474a f6d8            neg     al
fffff800`0c15474c 8b83380f0000    mov     eax,dword ptr [rbx+0F38h]
fffff800`0c154752 1bc9            sbb     ecx,ecx
fffff800`0c154754 0fbaf010        btr     eax,10h
fffff800`0c154758 81e100000100    and     ecx,10000h
fffff800`0c15475e 0bc1            or      eax,ecx
fffff800`0c154760 8983380f0000    mov     dword ptr [rbx+0F38h],eax

stornvme!NVMeHwFindAdapter+0x366:
fffff800`0c154766 41b920000000    mov     r9d,20h
fffff800`0c15476c 8b4324          mov     eax,dword ptr [rbx+24h]
fffff800`0c15476f c7834001000040001000 mov dword ptr [rbx+140h],100040h
fffff800`0c154779 44386b14        cmp     byte ptr [rbx+14h],r13b
fffff800`0c15477d 7422            je      stornvme!NVMeHwFindAdapter+0x3a1 (fffff800`0c1547a1)  Branch

stornvme!NVMeHwFindAdapter+0x37f:
fffff800`0c15477f 6644898b44010000 mov     word ptr [rbx+144h],r9w
fffff800`0c154787 85c0            test    eax,eax
fffff800`0c154789 7409            je      stornvme!NVMeHwFindAdapter+0x394 (fffff800`0c154794)  Branch

stornvme!NVMeHwFindAdapter+0x38b:
fffff800`0c15478b 413bc1          cmp     eax,r9d
fffff800`0c15478e 410f47c1        cmova   eax,r9d
fffff800`0c154792 eb04            jmp     stornvme!NVMeHwFindAdapter+0x398 (fffff800`0c154798)  Branch

stornvme!NVMeHwFindAdapter+0x394:
fffff800`0c154794 410fb7c1        movzx   eax,r9w

stornvme!NVMeHwFindAdapter+0x398:
fffff800`0c154798 66898346010000  mov     word ptr [rbx+146h],ax
fffff800`0c15479f eb70            jmp     stornvme!NVMeHwFindAdapter+0x411 (fffff800`0c154811)  Branch

stornvme!NVMeHwFindAdapter+0x3a1:
fffff800`0c1547a1 41b900010000    mov     r9d,100h
fffff800`0c1547a7 ba00040000      mov     edx,400h
fffff800`0c1547ac 6644898b44010000 mov     word ptr [rbx+144h],r9w
fffff800`0c1547b4 41b8ffff0000    mov     r8d,0FFFFh
fffff800`0c1547ba 85c0            test    eax,eax
fffff800`0c1547bc 7412            je      stornvme!NVMeHwFindAdapter+0x3d0 (fffff800`0c1547d0)  Branch

stornvme!NVMeHwFindAdapter+0x3be:
fffff800`0c1547be 8bd0            mov     edx,eax
fffff800`0c1547c0 413bc0          cmp     eax,r8d
fffff800`0c1547c3 7307            jae     stornvme!NVMeHwFindAdapter+0x3cc (fffff800`0c1547cc)  Branch

stornvme!NVMeHwFindAdapter+0x3c5:
fffff800`0c1547c5 440fb74b24      movzx   r9d,word ptr [rbx+24h]
fffff800`0c1547ca eb04            jmp     stornvme!NVMeHwFindAdapter+0x3d0 (fffff800`0c1547d0)  Branch

stornvme!NVMeHwFindAdapter+0x3cc:
fffff800`0c1547cc 450fb7c8        movzx   r9d,r8w

stornvme!NVMeHwFindAdapter+0x3d0:
fffff800`0c1547d0 8b83c0000000    mov     eax,dword ptr [rbx+0C0h]
fffff800`0c1547d6 0fb7c8          movzx   ecx,ax
fffff800`0c1547d9 4903cf          add     rcx,r15
fffff800`0c1547dc 8bc2            mov     eax,edx
fffff800`0c1547de 483bc1          cmp     rax,rcx
fffff800`0c1547e1 720c            jb      stornvme!NVMeHwFindAdapter+0x3ef (fffff800`0c1547ef)  Branch

stornvme!NVMeHwFindAdapter+0x3e3:
fffff800`0c1547e3 8b83c0000000    mov     eax,dword ptr [rbx+0C0h]
fffff800`0c1547e9 0fb7d0          movzx   edx,ax
fffff800`0c1547ec 4103d7          add     edx,r15d

stornvme!NVMeHwFindAdapter+0x3ef:
fffff800`0c1547ef 413bd0          cmp     edx,r8d
fffff800`0c1547f2 440f42c2        cmovb   r8d,edx
fffff800`0c1547f6 66453bc1        cmp     r8w,r9w
fffff800`0c1547fa 6644898346010000 mov     word ptr [rbx+146h],r8w
fffff800`0c154802 66450f47c8      cmova   r9w,r8w
fffff800`0c154807 410fb7c1        movzx   eax,r9w
fffff800`0c15480b 41b920000000    mov     r9d,20h

stornvme!NVMeHwFindAdapter+0x411:
fffff800`0c154811 66898348010000  mov     word ptr [rbx+148h],ax
fffff800`0c154818 44897730        mov     dword ptr [rdi+30h],r14d
fffff800`0c15481c 44887f51        mov     byte ptr [rdi+51h],r15b
fffff800`0c154820 4488af91000000  mov     byte ptr [rdi+91h],r13b
fffff800`0c154827 4489bf94000000  mov     dword ptr [rdi+94h],r15d
fffff800`0c15482e 44397f14        cmp     dword ptr [rdi+14h],r15d
fffff800`0c154832 7512            jne     stornvme!NVMeHwFindAdapter+0x446 (fffff800`0c154846)  Branch

stornvme!NVMeHwFindAdapter+0x434:
fffff800`0c154834 488d05e5fcfeff  lea     rax,[stornvme!NVMeHwMSIInterrupt (fffff800`0c144520)]
fffff800`0c15483b 48898798000000  mov     qword ptr [rdi+98h],rax
fffff800`0c154842 8bc6            mov     eax,esi
fffff800`0c154844 eb03            jmp     stornvme!NVMeHwFindAdapter+0x449 (fffff800`0c154849)  Branch

stornvme!NVMeHwFindAdapter+0x446:
fffff800`0c154846 418bc7          mov     eax,r15d

stornvme!NVMeHwFindAdapter+0x449:
fffff800`0c154849 8987a0000000    mov     dword ptr [rdi+0A0h],eax
fffff800`0c15484f 80bf9000000080  cmp     byte ptr [rdi+90h],80h
fffff800`0c154856 4489afd8000000  mov     dword ptr [rdi+0D8h],r13d
fffff800`0c15485d 7507            jne     stornvme!NVMeHwFindAdapter+0x466 (fffff800`0c154866)  Branch

stornvme!NVMeHwFindAdapter+0x45f:
fffff800`0c15485f 4088b790000000  mov     byte ptr [rdi+90h],sil

stornvme!NVMeHwFindAdapter+0x466:
fffff800`0c154866 8b8fdc000000    mov     ecx,dword ptr [rdi+0DCh]
fffff800`0c15486c 0bce            or      ecx,esi
fffff800`0c15486e 4488af93000000  mov     byte ptr [rdi+93h],r13b
fffff800`0c154875 83c908          or      ecx,8
fffff800`0c154878 410bc9          or      ecx,r9d
fffff800`0c15487b 410bcf          or      ecx,r15d
fffff800`0c15487e 898fdc000000    mov     dword ptr [rdi+0DCh],ecx
fffff800`0c154884 8b4338          mov     eax,dword ptr [rbx+38h]
fffff800`0c154887 4084c6          test    sil,al
fffff800`0c15488a 7509            jne     stornvme!NVMeHwFindAdapter+0x495 (fffff800`0c154895)  Branch

stornvme!NVMeHwFindAdapter+0x48c:
fffff800`0c15488c 83c904          or      ecx,4
fffff800`0c15488f 898fdc000000    mov     dword ptr [rdi+0DCh],ecx

stornvme!NVMeHwFindAdapter+0x495:
fffff800`0c154895 f7433800004000  test    dword ptr [rbx+38h],400000h
fffff800`0c15489c 750a            jne     stornvme!NVMeHwFindAdapter+0x4a8 (fffff800`0c1548a8)  Branch

stornvme!NVMeHwFindAdapter+0x49e:
fffff800`0c15489e 0fbae91f        bts     ecx,1Fh
fffff800`0c1548a2 898fdc000000    mov     dword ptr [rdi+0DCh],ecx

stornvme!NVMeHwFindAdapter+0x4a8:
fffff800`0c1548a8 c7471800002000  mov     dword ptr [rdi+18h],200000h
fffff800`0c1548af 4585e4          test    r12d,r12d
fffff800`0c1548b2 0f85c1000000    jne     stornvme!NVMeHwFindAdapter+0x579 (fffff800`0c154979)  Branch

stornvme!NVMeHwFindAdapter+0x4b8:
fffff800`0c1548b8 4c8d8308100000  lea     r8,[rbx+1008h]
fffff800`0c1548bf 488bd3          mov     rdx,rbx
fffff800`0c1548c2 418bc9          mov     ecx,r9d
fffff800`0c1548c5 4c8b15cce70200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c1548cc e82f9cd5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c1548d1 488bd7          mov     rdx,rdi
fffff800`0c1548d4 488bcb          mov     rcx,rbx
fffff800`0c1548d7 e814f5ffff      call    stornvme!ControllerAllocateUncachedExtension (fffff800`0c153df0)
fffff800`0c1548dc 84c0            test    al,al
fffff800`0c1548de 750c            jne     stornvme!NVMeHwFindAdapter+0x4ec (fffff800`0c1548ec)  Branch

stornvme!NVMeHwFindAdapter+0x4e0:
fffff800`0c1548e0 4c8d3d490e0200  lea     r15,[stornvme!`string` (fffff800`0c175730)]
fffff800`0c1548e7 e9c0010000      jmp     stornvme!NVMeHwFindAdapter+0x6ac (fffff800`0c154aac)  Branch

stornvme!NVMeHwFindAdapter+0x4ec:
fffff800`0c1548ec 44386b14        cmp     byte ptr [rbx+14h],r13b
fffff800`0c1548f0 0f8583000000    jne     stornvme!NVMeHwFindAdapter+0x579 (fffff800`0c154979)  Branch

stornvme!NVMeHwFindAdapter+0x4f6:
fffff800`0c1548f6 448b4370        mov     r8d,dword ptr [rbx+70h]
fffff800`0c1548fa 4585c0          test    r8d,r8d
fffff800`0c1548fd 7462            je      stornvme!NVMeHwFindAdapter+0x561 (fffff800`0c154961)  Branch

stornvme!NVMeHwFindAdapter+0x4ff:
fffff800`0c1548ff 4c8dbb400e0000  lea     r15,[rbx+0E40h]
fffff800`0c154906 41b94e766d65    mov     r9d,656D764Eh
fffff800`0c15490c 488bd3          mov     rdx,rbx
fffff800`0c15490f 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff800`0c154914 33c9            xor     ecx,ecx
fffff800`0c154916 4c8b157be70200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c15491d e8de9bd5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154922 85c0            test    eax,eax
fffff800`0c154924 7535            jne     stornvme!NVMeHwFindAdapter+0x55b (fffff800`0c15495b)  Branch

stornvme!NVMeHwFindAdapter+0x526:
fffff800`0c154926 498b0f          mov     rcx,qword ptr [r15]
fffff800`0c154929 4885c9          test    rcx,rcx
fffff800`0c15492c 742d            je      stornvme!NVMeHwFindAdapter+0x55b (fffff800`0c15495b)  Branch

stornvme!NVMeHwFindAdapter+0x52e:
fffff800`0c15492e 8b4370          mov     eax,dword ptr [rbx+70h]
fffff800`0c154931 4184c6          test    r14b,al
fffff800`0c154934 7517            jne     stornvme!NVMeHwFindAdapter+0x54d (fffff800`0c15494d)  Branch

stornvme!NVMeHwFindAdapter+0x536:
fffff800`0c154936 c1e802          shr     eax,2
fffff800`0c154939 85c0            test    eax,eax
fffff800`0c15493b 741e            je      stornvme!NVMeHwFindAdapter+0x55b (fffff800`0c15495b)  Branch

stornvme!NVMeHwFindAdapter+0x53d:
fffff800`0c15493d 448bc0          mov     r8d,eax
fffff800`0c154940 33d2            xor     edx,edx
fffff800`0c154942 49c1e002        shl     r8,2
fffff800`0c154946 e8359b0100      call    stornvme!_memset_spec_ermsb (fffff800`0c16e480)
fffff800`0c15494b eb0e            jmp     stornvme!NVMeHwFindAdapter+0x55b (fffff800`0c15495b)  Branch

stornvme!NVMeHwFindAdapter+0x54d:
fffff800`0c15494d 85c0            test    eax,eax
fffff800`0c15494f 740a            je      stornvme!NVMeHwFindAdapter+0x55b (fffff800`0c15495b)  Branch

stornvme!NVMeHwFindAdapter+0x551:
fffff800`0c154951 4c8bc0          mov     r8,rax
fffff800`0c154954 33d2            xor     edx,edx
fffff800`0c154956 e8259b0100      call    stornvme!_memset_spec_ermsb (fffff800`0c16e480)

stornvme!NVMeHwFindAdapter+0x55b:
fffff800`0c15495b 41bf01000000    mov     r15d,1

stornvme!NVMeHwFindAdapter+0x561:
fffff800`0c154961 e88a860100      call    stornvme!Feature_LocalCommandPoolInStorNVMe__private_IsEnabledDeviceUsageNoInline (fffff800`0c16cff0)
fffff800`0c154966 85c0            test    eax,eax
fffff800`0c154968 740f            je      stornvme!NVMeHwFindAdapter+0x579 (fffff800`0c154979)  Branch

stornvme!NVMeHwFindAdapter+0x56a:
fffff800`0c15496a 488bcb          mov     rcx,rbx
fffff800`0c15496d e8ca970000      call    stornvme!NVMeControllerCreateLocalCommandPool (fffff800`0c15e13c)
fffff800`0c154972 4409bb50100000  or      dword ptr [rbx+1050h],r15d

stornvme!NVMeHwFindAdapter+0x579:
fffff800`0c154979 418ad7          mov     dl,r15b
fffff800`0c15497c 488bcb          mov     rcx,rbx
fffff800`0c15497f e89cd8feff      call    stornvme!ControllerReset (fffff800`0c142220)
fffff800`0c154984 85c0            test    eax,eax
fffff800`0c154986 740c            je      stornvme!NVMeHwFindAdapter+0x594 (fffff800`0c154994)  Branch

stornvme!NVMeHwFindAdapter+0x588:
fffff800`0c154988 4c8d3df10d0200  lea     r15,[stornvme!`string` (fffff800`0c175780)]
fffff800`0c15498f e918010000      jmp     stornvme!NVMeHwFindAdapter+0x6ac (fffff800`0c154aac)  Branch

stornvme!NVMeHwFindAdapter+0x594:
fffff800`0c154994 418ad7          mov     dl,r15b
fffff800`0c154997 488bcb          mov     rcx,rbx
fffff800`0c15499a e8b1430000      call    stornvme!NVMeControllerInitPart1 (fffff800`0c158d50)
fffff800`0c15499f 85c0            test    eax,eax
fffff800`0c1549a1 740c            je      stornvme!NVMeHwFindAdapter+0x5af (fffff800`0c1549af)  Branch

stornvme!NVMeHwFindAdapter+0x5a3:
fffff800`0c1549a3 4c8d3d060e0200  lea     r15,[stornvme!`string` (fffff800`0c1757b0)]
fffff800`0c1549aa e9fd000000      jmp     stornvme!NVMeHwFindAdapter+0x6ac (fffff800`0c154aac)  Branch

stornvme!NVMeHwFindAdapter+0x5af:
fffff800`0c1549af 4c8b8b78050000  mov     r9,qword ptr [rbx+578h]
fffff800`0c1549b6 458a414d        mov     r8b,byte ptr [r9+4Dh]
fffff800`0c1549ba 4584c0          test    r8b,r8b
fffff800`0c1549bd 7505            jne     stornvme!NVMeHwFindAdapter+0x5c4 (fffff800`0c1549c4)  Branch

stornvme!NVMeHwFindAdapter+0x5bf:
fffff800`0c1549bf 83caff          or      edx,0FFFFFFFFh
fffff800`0c1549c2 eb1c            jmp     stornvme!NVMeHwFindAdapter+0x5e0 (fffff800`0c1549e0)  Branch

stornvme!NVMeHwFindAdapter+0x5c4:
fffff800`0c1549c4 8a8bc6000000    mov     cl,byte ptr [rbx+0C6h]
fffff800`0c1549ca 418bd7          mov     edx,r15d
fffff800`0c1549cd 80e10f          and     cl,0Fh
fffff800`0c1549d0 418bc7          mov     eax,r15d
fffff800`0c1549d3 80c10c          add     cl,0Ch
fffff800`0c1549d6 d3e2            shl     edx,cl
fffff800`0c1549d8 418ac8          mov     cl,r8b
fffff800`0c1549db d3e0            shl     eax,cl
fffff800`0c1549dd 0fafd0          imul    edx,eax

stornvme!NVMeHwFindAdapter+0x5e0:
fffff800`0c1549e0 488bcb          mov     rcx,rbx
fffff800`0c1549e3 8993d0000000    mov     dword ptr [rbx+0D0h],edx
fffff800`0c1549e9 e8c28cffff      call    stornvme!GetControllerMaxTransferSize (fffff800`0c14d6b0)
fffff800`0c1549ee 894718          mov     dword ptr [rdi+18h],eax
fffff800`0c1549f1 b820000000      mov     eax,20h
fffff800`0c1549f6 8987d4000000    mov     dword ptr [rdi+0D4h],eax
fffff800`0c1549fc 8987cc000000    mov     dword ptr [rdi+0CCh],eax
fffff800`0c154a02 8987d0000000    mov     dword ptr [rdi+0D0h],eax
fffff800`0c154a08 c7471c01020000  mov     dword ptr [rdi+1Ch],201h
fffff800`0c154a0f 44887f48        mov     byte ptr [rdi+48h],r15b
fffff800`0c154a13 44887f61        mov     byte ptr [rdi+61h],r15b
fffff800`0c154a17 c68792000000ff  mov     byte ptr [rdi+92h],0FFh
fffff800`0c154a1e 44386b14        cmp     byte ptr [rbx+14h],r13b
fffff800`0c154a22 7568            jne     stornvme!NVMeHwFindAdapter+0x68c (fffff800`0c154a8c)  Branch

stornvme!NVMeHwFindAdapter+0x624:
fffff800`0c154a24 0f100505100200  movups  xmm0,xmmword ptr [stornvme!GUID_NVME_POWER_STATE_TRANSITION_LATENCY_TOLERANCE1 (fffff800`0c175a30)]
fffff800`0c154a2b 418b4160        mov     eax,dword ptr [r9+60h]
fffff800`0c154a2f 0f100dea0f0200  movups  xmm1,xmmword ptr [stornvme!GUID_NVME_POWER_IDLE_TIMEOUT1 (fffff800`0c175a20)]
fffff800`0c154a36 f30f7f45e0      movdqu  xmmword ptr [rbp-20h],xmm0
fffff800`0c154a3b 0f10050e100200  movups  xmm0,xmmword ptr [stornvme!GUID_NVME_POWER_STATE_TRANSITION_LATENCY_TOLERANCE2 (fffff800`0c175a50)]
fffff800`0c154a42 f30f7f4df0      movdqu  xmmword ptr [rbp-10h],xmm1
fffff800`0c154a47 0f100df20f0200  movups  xmm1,xmmword ptr [stornvme!GUID_NVME_POWER_IDLE_TIMEOUT2 (fffff800`0c175a40)]
fffff800`0c154a4e f30f7f4500      movdqu  xmmword ptr [rbp],xmm0
fffff800`0c154a53 f30f7f4d10      movdqu  xmmword ptr [rbp+10h],xmm1
fffff800`0c154a58 23c6            and     eax,esi
fffff800`0c154a5a 740c            je      stornvme!NVMeHwFindAdapter+0x668 (fffff800`0c154a68)  Branch

stornvme!NVMeHwFindAdapter+0x65c:
fffff800`0c154a5c 0f1005ad0f0200  movups  xmm0,xmmword ptr [stornvme!GUID_NVME_POWER_NOPPME (fffff800`0c175a10)]
fffff800`0c154a63 f30f7f4520      movdqu  xmmword ptr [rbp+20h],xmm0

stornvme!NVMeHwFindAdapter+0x668:
fffff800`0c154a68 f7d8            neg     eax
fffff800`0c154a6a 4c8d4de0        lea     r9,[rbp-20h]
fffff800`0c154a6e 488bd3          mov     rdx,rbx
fffff800`0c154a71 b91a000000      mov     ecx,1Ah
fffff800`0c154a76 451bc0          sbb     r8d,r8d
fffff800`0c154a79 41f7d8          neg     r8d
fffff800`0c154a7c 4183c004        add     r8d,4
fffff800`0c154a80 4c8b1511e60200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154a87 e8749ad5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)

stornvme!NVMeHwFindAdapter+0x68c:
fffff800`0c154a8c 836318fd        and     dword ptr [rbx+18h],0FFFFFFFDh
fffff800`0c154a90 418bf7          mov     esi,r15d
fffff800`0c154a93 e97e010000      jmp     stornvme!NVMeHwFindAdapter+0x816 (fffff800`0c154c16)  Branch

stornvme!NVMeHwFindAdapter+0x698:
fffff800`0c154a98 41be03000000    mov     r14d,3
fffff800`0c154a9e 4c8d3d130c0200  lea     r15,[stornvme!`string` (fffff800`0c1756b8)]
fffff800`0c154aa5 4489731c        mov     dword ptr [rbx+1Ch],r14d
fffff800`0c154aa9 418bf6          mov     esi,r14d

stornvme!NVMeHwFindAdapter+0x6ac:
fffff800`0c154aac 4c8b8308100000  mov     r8,qword ptr [rbx+1008h]
fffff800`0c154ab3 4d85c0          test    r8,r8
fffff800`0c154ab6 7422            je      stornvme!NVMeHwFindAdapter+0x6da (fffff800`0c154ada)  Branch

stornvme!NVMeHwFindAdapter+0x6b8:
fffff800`0c154ab8 488bd3          mov     rdx,rbx
fffff800`0c154abb b922000000      mov     ecx,22h
fffff800`0c154ac0 4c8b15d1e50200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154ac7 e8349ad5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154acc 4c89ab08100000  mov     qword ptr [rbx+1008h],r13
fffff800`0c154ad3 4489ab10100000  mov     dword ptr [rbx+1010h],r13d

stornvme!NVMeHwFindAdapter+0x6da:
fffff800`0c154ada 4c8b83400e0000  mov     r8,qword ptr [rbx+0E40h]
fffff800`0c154ae1 bf01000000      mov     edi,1
fffff800`0c154ae6 4d85c0          test    r8,r8
fffff800`0c154ae9 7418            je      stornvme!NVMeHwFindAdapter+0x703 (fffff800`0c154b03)  Branch

stornvme!NVMeHwFindAdapter+0x6eb:
fffff800`0c154aeb 488bd3          mov     rdx,rbx
fffff800`0c154aee 8bcf            mov     ecx,edi
fffff800`0c154af0 4c8b15a1e50200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154af7 e8049ad5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154afc 4c89ab400e0000  mov     qword ptr [rbx+0E40h],r13

stornvme!NVMeHwFindAdapter+0x703:
fffff800`0c154b03 4c8b8368010000  mov     r8,qword ptr [rbx+168h]
fffff800`0c154b0a 4d85c0          test    r8,r8
fffff800`0c154b0d 7418            je      stornvme!NVMeHwFindAdapter+0x727 (fffff800`0c154b27)  Branch

stornvme!NVMeHwFindAdapter+0x70f:
fffff800`0c154b0f 488bd3          mov     rdx,rbx
fffff800`0c154b12 8bcf            mov     ecx,edi
fffff800`0c154b14 4c8b157de50200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154b1b e8e099d5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154b20 4c89ab68010000  mov     qword ptr [rbx+168h],r13

stornvme!NVMeHwFindAdapter+0x727:
fffff800`0c154b27 4c8b8370010000  mov     r8,qword ptr [rbx+170h]
fffff800`0c154b2e 4d85c0          test    r8,r8
fffff800`0c154b31 7418            je      stornvme!NVMeHwFindAdapter+0x74b (fffff800`0c154b4b)  Branch

stornvme!NVMeHwFindAdapter+0x733:
fffff800`0c154b33 488bd3          mov     rdx,rbx
fffff800`0c154b36 8bcf            mov     ecx,edi
fffff800`0c154b38 4c8b1559e50200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154b3f e8bc99d5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154b44 4c89ab70010000  mov     qword ptr [rbx+170h],r13

stornvme!NVMeHwFindAdapter+0x74b:
fffff800`0c154b4b 4c8b8378010000  mov     r8,qword ptr [rbx+178h]
fffff800`0c154b52 4d85c0          test    r8,r8
fffff800`0c154b55 7418            je      stornvme!NVMeHwFindAdapter+0x76f (fffff800`0c154b6f)  Branch

stornvme!NVMeHwFindAdapter+0x757:
fffff800`0c154b57 488bd3          mov     rdx,rbx
fffff800`0c154b5a 8bcf            mov     ecx,edi
fffff800`0c154b5c 4c8b1535e50200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`0c183098)]
fffff800`0c154b63 e89899d5ff      call    storport!StorPortExtendedFunction (fffff800`0beae500)
fffff800`0c154b68 4c89ab78010000  mov     qword ptr [rbx+178h],r13

stornvme!NVMeHwFindAdapter+0x76f:
fffff800`0c154b6f 8b8350100000    mov     eax,dword ptr [rbx+1050h]
fffff800`0c154b75 4084c7          test    dil,al
fffff800`0c154b78 7408            je      stornvme!NVMeHwFindAdapter+0x782 (fffff800`0c154b82)  Branch

stornvme!NVMeHwFindAdapter+0x77a:
fffff800`0c154b7a 488bcb          mov     rcx,rbx
fffff800`0c154b7d e836960000      call    stornvme!NVMeControllerDeleteLocalCommandPool (fffff800`0c15e1b8)

stornvme!NVMeHwFindAdapter+0x782:
fffff800`0c154b82 44386b14        cmp     byte ptr [rbx+14h],r13b
fffff800`0c154b86 0f858a000000    jne     stornvme!NVMeHwFindAdapter+0x816 (fffff800`0c154c16)  Branch

stornvme!NVMeHwFindAdapter+0x78c:
fffff800`0c154b8c 488bcb          mov     rcx,rbx
fffff800`0c154b8f e87cd4feff      call    stornvme!NVMeControllerStartFailureEventLog (fffff800`0c142010)
fffff800`0c154b94 488bcb          mov     rcx,rbx
fffff800`0c154b97 e880040000      call    stornvme!NVMeLogEtwControllerInfo (fffff800`0c15501c)
fffff800`0c154b9c 488d5580        lea     rdx,[rbp-80h]
fffff800`0c154ba0 488bcb          mov     rcx,rbx
fffff800`0c154ba3 e8d4f6ffff      call    stornvme!FillControllerRuntimeLog (fffff800`0c15427c)
fffff800`0c154ba8 8b4318          mov     eax,dword ptr [rbx+18h]
fffff800`0c154bab 4533c9          xor     r9d,r9d
fffff800`0c154bae 4c896c2468      mov     qword ptr [rsp+68h],r13
fffff800`0c154bb3 4533c0          xor     r8d,r8d
fffff800`0c154bb6 89442468        mov     dword ptr [rsp+68h],eax
fffff800`0c154bba 488bd3          mov     rdx,rbx
fffff800`0c154bbd 8b431c          mov     eax,dword ptr [rbx+1Ch]
fffff800`0c154bc0 0fb7c8          movzx   ecx,ax
fffff800`0c154bc3 8944246c        mov     dword ptr [rsp+6Ch],eax
fffff800`0c154bc7 488d442470      lea     rax,[rsp+70h]
fffff800`0c154bcc 4889442450      mov     qword ptr [rsp+50h],rax
fffff800`0c154bd1 488d442468      lea     rax,[rsp+68h]
fffff800`0c154bd6 4889442448      mov     qword ptr [rsp+48h],rax
fffff800`0c154bdb 488d4580        lea     rax,[rbp-80h]
fffff800`0c154bdf c744244008000000 mov     dword ptr [rsp+40h],8
fffff800`0c154be7 4889442438      mov     qword ptr [rsp+38h],rax
fffff800`0c154bec c744243058000000 mov     dword ptr [rsp+30h],58h
fffff800`0c154bf4 4c897c2428      mov     qword ptr [rsp+28h],r15
fffff800`0c154bf9 894c2420        mov     dword ptr [rsp+20h],ecx
fffff800`0c154bfd b90d100000      mov     ecx,100Dh
fffff800`0c154c02 c7442470020000c1 mov     dword ptr [rsp+70h],0C1000002h
fffff800`0c154c0a 4c8b159fe40200  mov     r10,qword ptr [stornvme!_imp_StorPortNotification (fffff800`0c1830b0)]
fffff800`0c154c11 e82a4cd3ff      call    storport!StorPortNotification (fffff800`0be89840)

stornvme!NVMeHwFindAdapter+0x816:
fffff800`0c154c16 8bc6            mov     eax,esi

stornvme!NVMeHwFindAdapter+0x818:
fffff800`0c154c18 488b4d40        mov     rcx,qword ptr [rbp+40h]
fffff800`0c154c1c 4833cc          xor     rcx,rsp
fffff800`0c154c1f e80c910100      call    stornvme!_security_check_cookie (fffff800`0c16dd30)
fffff800`0c154c24 4c8d9c2450010000 lea     r11,[rsp+150h]
fffff800`0c154c2c 498b5b38        mov     rbx,qword ptr [r11+38h]
fffff800`0c154c30 498b7340        mov     rsi,qword ptr [r11+40h]
fffff800`0c154c34 498b7b48        mov     rdi,qword ptr [r11+48h]
fffff800`0c154c38 498be3          mov     rsp,r11
fffff800`0c154c3b 415f            pop     r15
fffff800`0c154c3d 415e            pop     r14
fffff800`0c154c3f 415d            pop     r13
fffff800`0c154c41 415c            pop     r12
fffff800`0c154c43 5d              pop     rbp
fffff800`0c154c44 c3              ret
