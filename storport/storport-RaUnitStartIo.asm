16: kd> UF RaUnitStartIo
storport!RaUnitStartIo:
fffff801`8b853430 44884c2420      mov     byte ptr [rsp+20h],r9b
fffff801`8b853435 4c89442418      mov     qword ptr [rsp+18h],r8
fffff801`8b85343a 53              push    rbx
fffff801`8b85343b 55              push    rbp
fffff801`8b85343c 56              push    rsi
fffff801`8b85343d 57              push    rdi
fffff801`8b85343e 4154            push    r12
fffff801`8b853440 4155            push    r13
fffff801`8b853442 4156            push    r14
fffff801`8b853444 4157            push    r15
fffff801`8b853446 4881eca8000000  sub     rsp,0A8h
fffff801`8b85344d 488b7940        mov     rdi,qword ptr [rcx+40h]
fffff801`8b853451 4533f6          xor     r14d,r14d
fffff801`8b853454 33c0            xor     eax,eax
fffff801`8b853456 4489b42480000000 mov     dword ptr [rsp+80h],r14d
fffff801`8b85345e 4889842490000000 mov     qword ptr [rsp+90h],rax
fffff801`8b853466 4532e4          xor     r12b,r12b
fffff801`8b853469 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff801`8b853470 410fb6e9        movzx   ebp,r9b
fffff801`8b853474 488b5f18        mov     rbx,qword ptr [rdi+18h]
fffff801`8b853478 4c8bea          mov     r13,rdx
fffff801`8b85347b 4489b424f8000000 mov     dword ptr [rsp+0F8h],r14d
fffff801`8b853483 458bfe          mov     r15d,r14d
fffff801`8b853486 4c89b42488000000 mov     qword ptr [rsp+88h],r14
fffff801`8b85348e 488b7008        mov     rsi,qword ptr [rax+8]
fffff801`8b853492 44886603        mov     byte ptr [rsi+3],r12b
fffff801`8b853496 4439b3a8100000  cmp     dword ptr [rbx+10A8h],r14d
fffff801`8b85349d 7f47            jg      storport!RaUnitStartIo+0xb6 (fffff801`8b8534e6)  Branch

storport!RaUnitStartIo+0x6f:
fffff801`8b85349f 488d8be0040000  lea     rcx,[rbx+4E0h]
fffff801`8b8534a6 48ff15933c0600  call    qword ptr [storport!_imp_ExQueryDepthSList (fffff801`8b8b7140)]
fffff801`8b8534ad 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8534b2 6685c0          test    ax,ax
fffff801`8b8534b5 742f            je      storport!RaUnitStartIo+0xb6 (fffff801`8b8534e6)  Branch

storport!RaUnitStartIo+0x87:
fffff801`8b8534b7 b801000000      mov     eax,1
fffff801`8b8534bc f00fc183a8100000 lock xadd dword ptr [rbx+10A8h],eax
fffff801`8b8534c4 ffc0            inc     eax
fffff801`8b8534c6 83f801          cmp     eax,1
fffff801`8b8534c9 7514            jne     storport!RaUnitStartIo+0xaf (fffff801`8b8534df)  Branch

storport!RaUnitStartIo+0x9b:
fffff801`8b8534cb 488b5308        mov     rdx,qword ptr [rbx+8]
fffff801`8b8534cf 488d8b80040000  lea     rcx,[rbx+480h]
fffff801`8b8534d6 440fb6c5        movzx   r8d,bpl
fffff801`8b8534da e889e10000      call    storport!RaidProcessDeferredItemsWorker (fffff801`8b861668)

storport!RaUnitStartIo+0xaf:
fffff801`8b8534df f0ff8ba8100000  lock dec dword ptr [rbx+10A8h]

storport!RaUnitStartIo+0xb6:
fffff801`8b8534e6 0fb65e02        movzx   ebx,byte ptr [rsi+2]
fffff801`8b8534ea 80fb28          cmp     bl,28h
fffff801`8b8534ed 0f85b3000000    jne     storport!RaUnitStartIo+0x176 (fffff801`8b8535a6)  Branch

storport!RaUnitStartIo+0xc3:
fffff801`8b8534f3 488b4668        mov     rax,qword ptr [rsi+68h]
fffff801`8b8534f7 8b5618          mov     edx,dword ptr [rsi+18h]
fffff801`8b8534fa 4889842498000000 mov     qword ptr [rsp+98h],rax
fffff801`8b853502 4889b42488000000 mov     qword ptr [rsp+88h],rsi
fffff801`8b85350a 899424f0000000  mov     dword ptr [rsp+0F0h],edx
fffff801`8b853511 44397614        cmp     dword ptr [rsi+14h],r14d
fffff801`8b853515 0f85af000000    jne     storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0xeb:
fffff801`8b85351b 448b5e38        mov     r11d,dword ptr [rsi+38h]
fffff801`8b85351f 458bd6          mov     r10d,r14d
fffff801`8b853522 4585db          test    r11d,r11d
fffff801`8b853525 0f849f000000    je      storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0xfb:
fffff801`8b85352b 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitStartIo+0x100:
fffff801`8b853530 418bc2          mov     eax,r10d
fffff801`8b853533 8b4c8678        mov     ecx,dword ptr [rsi+rax*4+78h]
fffff801`8b853537 81f980000000    cmp     ecx,80h
fffff801`8b85353d 7248            jb      storport!RaUnitStartIo+0x157 (fffff801`8b853587)  Branch

storport!RaUnitStartIo+0x10f:
fffff801`8b85353f 8b5610          mov     edx,dword ptr [rsi+10h]
fffff801`8b853542 3bca            cmp     ecx,edx
fffff801`8b853544 7741            ja      storport!RaUnitStartIo+0x157 (fffff801`8b853587)  Branch

storport!RaUnitStartIo+0x116:
fffff801`8b853546 4c8d0c31        lea     r9,[rcx+rsi]
fffff801`8b85354a 448bc1          mov     r8d,ecx
fffff801`8b85354d 418b09          mov     ecx,dword ptr [r9]
fffff801`8b853550 83e940          sub     ecx,40h
fffff801`8b853553 7429            je      storport!RaUnitStartIo+0x14e (fffff801`8b85357e)  Branch

storport!RaUnitStartIo+0x125:
fffff801`8b853555 83e901          sub     ecx,1
fffff801`8b853558 741e            je      storport!RaUnitStartIo+0x148 (fffff801`8b853578)  Branch

storport!RaUnitStartIo+0x12a:
fffff801`8b85355a 83f901          cmp     ecx,1
fffff801`8b85355d 7528            jne     storport!RaUnitStartIo+0x157 (fffff801`8b853587)  Branch

storport!RaUnitStartIo+0x12f:
fffff801`8b85355f 498d4828        lea     rcx,[r8+28h]
fffff801`8b853563 483bca          cmp     rcx,rdx
fffff801`8b853566 771f            ja      storport!RaUnitStartIo+0x157 (fffff801`8b853587)  Branch

storport!RaUnitStartIo+0x138:
fffff801`8b853568 418b410c        mov     eax,dword ptr [r9+0Ch]
fffff801`8b85356c 4983c120        add     r9,20h
fffff801`8b853570 85c0            test    eax,eax
fffff801`8b853572 4d0f44ce        cmove   r9,r14
fffff801`8b853576 eb23            jmp     storport!RaUnitStartIo+0x16b (fffff801`8b85359b)  Branch

storport!RaUnitStartIo+0x148:
fffff801`8b853578 498d4838        lea     rcx,[r8+38h]
fffff801`8b85357c eb04            jmp     storport!RaUnitStartIo+0x152 (fffff801`8b853582)  Branch

storport!RaUnitStartIo+0x14e:
fffff801`8b85357e 498d4828        lea     rcx,[r8+28h]

storport!RaUnitStartIo+0x152:
fffff801`8b853582 483bca          cmp     rcx,rdx
fffff801`8b853585 760a            jbe     storport!RaUnitStartIo+0x161 (fffff801`8b853591)  Branch

storport!RaUnitStartIo+0x157:
fffff801`8b853587 41ffc2          inc     r10d
fffff801`8b85358a 453bd3          cmp     r10d,r11d
fffff801`8b85358d 72a1            jb      storport!RaUnitStartIo+0x100 (fffff801`8b853530)  Branch

storport!RaUnitStartIo+0x15f:
fffff801`8b85358f eb39            jmp     storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0x161:
fffff801`8b853591 4538710a        cmp     byte ptr [r9+0Ah],r14b
fffff801`8b853595 7633            jbe     storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0x167:
fffff801`8b853597 4983c118        add     r9,18h

storport!RaUnitStartIo+0x16b:
fffff801`8b85359b 4d85c9          test    r9,r9
fffff801`8b85359e 742a            je      storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0x170:
fffff801`8b8535a0 450fb621        movzx   r12d,byte ptr [r9]
fffff801`8b8535a4 eb24            jmp     storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0x176:
fffff801`8b8535a6 488b4e28        mov     rcx,qword ptr [rsi+28h]
fffff801`8b8535aa 8b460c          mov     eax,dword ptr [rsi+0Ch]
fffff801`8b8535ad 440fb66648      movzx   r12d,byte ptr [rsi+48h]
fffff801`8b8535b2 48898c2498000000 mov     qword ptr [rsp+98h],rcx
fffff801`8b8535ba 898424f0000000  mov     dword ptr [rsp+0F0h],eax
fffff801`8b8535c1 4885c9          test    rcx,rcx
fffff801`8b8535c4 7404            je      storport!RaUnitStartIo+0x19a (fffff801`8b8535ca)  Branch

storport!RaUnitStartIo+0x196:
fffff801`8b8535c6 4c897628        mov     qword ptr [rsi+28h],r14

storport!RaUnitStartIo+0x19a:
fffff801`8b8535ca 41f6858e00000020 test    byte ptr [r13+8Eh],20h
fffff801`8b8535d2 7460            je      storport!RaUnitStartIo+0x204 (fffff801`8b853634)  Branch

storport!RaUnitStartIo+0x1a4:
fffff801`8b8535d4 80fb28          cmp     bl,28h
fffff801`8b8535d7 7516            jne     storport!RaUnitStartIo+0x1bf (fffff801`8b8535ef)  Branch

storport!RaUnitStartIo+0x1a9:
fffff801`8b8535d9 488b5e60        mov     rbx,qword ptr [rsi+60h]
fffff801`8b8535dd 4889b42488000000 mov     qword ptr [rsp+88h],rsi
fffff801`8b8535e5 488b4310        mov     rax,qword ptr [rbx+10h]
fffff801`8b8535e9 48894660        mov     qword ptr [rsi+60h],rax
fffff801`8b8535ed eb0c            jmp     storport!RaUnitStartIo+0x1cb (fffff801`8b8535fb)  Branch

storport!RaUnitStartIo+0x1bf:
fffff801`8b8535ef 488b5e30        mov     rbx,qword ptr [rsi+30h]
fffff801`8b8535f3 488b4310        mov     rax,qword ptr [rbx+10h]
fffff801`8b8535f7 48894630        mov     qword ptr [rsi+30h],rax

storport!RaUnitStartIo+0x1cb:
fffff801`8b8535fb 48837b08ff      cmp     qword ptr [rbx+8],0FFFFFFFFFFFFFFFFh
fffff801`8b853600 741e            je      storport!RaUnitStartIo+0x1f0 (fffff801`8b853620)  Branch

storport!RaUnitStartIo+0x1d2:
fffff801`8b853602 48ff159f3a0600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff801`8b8b70a8)]
fffff801`8b853609 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b85360e 4469bf900c0000404b4c00 imul r15d,dword ptr [rdi+0C90h],4C4B40h
fffff801`8b853619 4c2b7b08        sub     r15,qword ptr [rbx+8]
fffff801`8b85361d 4c03f8          add     r15,rax

storport!RaUnitStartIo+0x1f0:
fffff801`8b853620 ba52614354      mov     edx,54436152h
fffff801`8b853625 488bcb          mov     rcx,rbx
fffff801`8b853628 48ff15f93b0600  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff801`8b8b7228)]
fffff801`8b85362f 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitStartIo+0x204:
fffff801`8b853634 f687c201000002  test    byte ptr [rdi+1C2h],2
fffff801`8b85363b 7450            je      storport!RaUnitStartIo+0x25d (fffff801`8b85368d)  Branch

storport!RaUnitStartIo+0x20d:
fffff801`8b85363d 488bce          mov     rcx,rsi
fffff801`8b853640 e81f9d0300      call    storport!RaidIsUnresponsiveBlockedCmd (fffff801`8b88d364)
fffff801`8b853645 84c0            test    al,al
fffff801`8b853647 7444            je      storport!RaUnitStartIo+0x25d (fffff801`8b85368d)  Branch

storport!RaUnitStartIo+0x219:
fffff801`8b853649 488bcf          mov     rcx,rdi
fffff801`8b85364c e87f5e0000      call    storport!RaUnitReleaseRemoveLock (fffff801`8b8594d0)
fffff801`8b853651 807e0228        cmp     byte ptr [rsi+2],28h
fffff801`8b853655 0fb64e03        movzx   ecx,byte ptr [rsi+3]
fffff801`8b853659 750b            jne     storport!RaUnitStartIo+0x236 (fffff801`8b853666)  Branch

storport!RaUnitStartIo+0x22b:
fffff801`8b85365b c0f907          sar     cl,7
fffff801`8b85365e 80e180          and     cl,80h
fffff801`8b853661 80c138          add     cl,38h
fffff801`8b853664 eb12            jmp     storport!RaUnitStartIo+0x248 (fffff801`8b853678)  Branch

storport!RaUnitStartIo+0x236:
fffff801`8b853666 84c9            test    cl,cl
fffff801`8b853668 b838000000      mov     eax,38h
fffff801`8b85366d bab8000000      mov     edx,0B8h
fffff801`8b853672 0f48c2          cmovs   eax,edx
fffff801`8b853675 0fb6c8          movzx   ecx,al

storport!RaUnitStartIo+0x248:
fffff801`8b853678 884e03          mov     byte ptr [rsi+3],cl
fffff801`8b85367b bd0a0500c0      mov     ebp,0C000050Ah
fffff801`8b853680 f048ff8720080000 lock inc qword ptr [rdi+820h]
fffff801`8b853688 e962030000      jmp     storport!RaUnitStartIo+0x5bf (fffff801`8b8539ef)  Branch

storport!RaUnitStartIo+0x25d:
fffff801`8b85368d 48ff152c3b0600  call    qword ptr [storport!_imp_KeGetCurrentNodeNumber (fffff801`8b8b71c0)]
fffff801`8b853694 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b853699 0fb7c8          movzx   ecx,ax
fffff801`8b85369c 48c1e106        shl     rcx,6
fffff801`8b8536a0 48038f00020000  add     rcx,qword ptr [rdi+200h]
fffff801`8b8536a7 48ff15023a0600  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff801`8b8b70b0)]
fffff801`8b8536ae 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8536b3 4885c0          test    rax,rax
fffff801`8b8536b6 755c            jne     storport!RaUnitStartIo+0x2e4 (fffff801`8b853714)  Branch

storport!RaUnitStartIo+0x288:
fffff801`8b8536b8 48ff15c93a0600  call    qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff801`8b8b7188)]
fffff801`8b8536bf 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8536c4 0fb7e8          movzx   ebp,ax
fffff801`8b8536c7 ffc5            inc     ebp
fffff801`8b8536c9 0f1f8000000000  nop     dword ptr [rax]

storport!RaUnitStartIo+0x2a0:
fffff801`8b8536d0 33db            xor     ebx,ebx
fffff801`8b8536d2 85ed            test    ebp,ebp
fffff801`8b8536d4 742e            je      storport!RaUnitStartIo+0x2d4 (fffff801`8b853704)  Branch

storport!RaUnitStartIo+0x2a6:
fffff801`8b8536d6 66660f1f840000000000 nop word ptr [rax+rax]

storport!RaUnitStartIo+0x2b0:
fffff801`8b8536e0 8bcb            mov     ecx,ebx
fffff801`8b8536e2 48c1e106        shl     rcx,6
fffff801`8b8536e6 48038f00020000  add     rcx,qword ptr [rdi+200h]
fffff801`8b8536ed 48ff15bc390600  call    qword ptr [storport!_imp_ExpInterlockedPopEntrySList (fffff801`8b8b70b0)]
fffff801`8b8536f4 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b8536f9 4885c0          test    rax,rax
fffff801`8b8536fc 7516            jne     storport!RaUnitStartIo+0x2e4 (fffff801`8b853714)  Branch

storport!RaUnitStartIo+0x2ce:
fffff801`8b8536fe ffc3            inc     ebx
fffff801`8b853700 3bdd            cmp     ebx,ebp
fffff801`8b853702 72dc            jb      storport!RaUnitStartIo+0x2b0 (fffff801`8b8536e0)  Branch

storport!RaUnitStartIo+0x2d4:
fffff801`8b853704 41ffc6          inc     r14d
fffff801`8b853707 4183fe0a        cmp     r14d,0Ah
fffff801`8b85370b 75c3            jne     storport!RaUnitStartIo+0x2a0 (fffff801`8b8536d0)  Branch

storport!RaUnitStartIo+0x2dd:
fffff801`8b85370d b8ffffffff      mov     eax,0FFFFFFFFh
fffff801`8b853712 eb03            jmp     storport!RaUnitStartIo+0x2e7 (fffff801`8b853717)  Branch

storport!RaUnitStartIo+0x2e4:
fffff801`8b853714 8b4008          mov     eax,dword ptr [rax+8]

storport!RaUnitStartIo+0x2e7:
fffff801`8b853717 488b8c2400010000 mov     rcx,qword ptr [rsp+100h]
fffff801`8b85371f 498bd5          mov     rdx,r13
fffff801`8b853722 4c8bb42498000000 mov     r14,qword ptr [rsp+98h]
fffff801`8b85372a 4c8bc9          mov     r9,rcx
fffff801`8b85372d 4d8bc6          mov     r8,r14
fffff801`8b853730 c78424f800000001000000 mov dword ptr [rsp+0F8h],1
fffff801`8b85373b 8901            mov     dword ptr [rcx],eax
fffff801`8b85373d 488bcf          mov     rcx,rdi
fffff801`8b853740 e80b070000      call    storport!RaidUnitClaimIrp (fffff801`8b853e50)
fffff801`8b853745 8be8            mov     ebp,eax
fffff801`8b853747 85c0            test    eax,eax       ;if(!RaidUnitClaimIrp()) goto 0x328
fffff801`8b853749 790d            jns     storport!RaUnitStartIo+0x328 (fffff801`8b853758)  Branch

storport!RaUnitStartIo+0x31b:
fffff801`8b85374b 488bcf          mov     rcx,rdi
fffff801`8b85374e e87d5d0000      call    storport!RaUnitReleaseRemoveLock (fffff801`8b8594d0)
fffff801`8b853753 e997020000      jmp     storport!RaUnitStartIo+0x5bf (fffff801`8b8539ef)  Branch

storport!RaUnitStartIo+0x328:
fffff801`8b853758 488b4718        mov     rax,qword ptr [rdi+18h]       ;UnitExt->Adapter
fffff801`8b85375c c784248000000001000000 mov dword ptr [rsp+80h],1
fffff801`8b853767 83b8ac08000000  cmp     dword ptr [rax+8ACh],0        ;if(UnitExt->AdapterExt->LinkUp) goto 0x35e
fffff801`8b85376e 751e            jne     storport!RaUnitStartIo+0x35e (fffff801`8b85378e)  Branch

; ignore error handing....  ==>
storport!RaUnitStartIo+0x340:
fffff801`8b853770 4180fc12        cmp     r12b,12h
fffff801`8b853774 7418            je      storport!RaUnitStartIo+0x35e (fffff801`8b85378e)  Branch

storport!RaUnitStartIo+0x346:
fffff801`8b853776 4180fca0        cmp     r12b,0A0h
fffff801`8b85377a 7412            je      storport!RaUnitStartIo+0x35e (fffff801`8b85378e)  Branch

storport!RaUnitStartIo+0x34c:
fffff801`8b85377c b125            mov     cl,25h
fffff801`8b85377e c6460325        mov     byte ptr [rsi+3],25h
fffff801`8b853782 e865a40000      call    storport!RaidSrbStatusToNtStatus (fffff801`8b85dbec)
fffff801`8b853787 8be8            mov     ebp,eax
fffff801`8b853789 e961020000      jmp     storport!RaUnitStartIo+0x5bf (fffff801`8b8539ef)  Branch
; ignore error handing.... <==

storport!RaUnitStartIo+0x35e:
fffff801`8b85378e 80bfc101000000  cmp     byte ptr [rdi+1C1h],0     ;if(!UnitExt->Flags[1].RegisteredForPoFx) goto 0x39a
fffff801`8b853795 7d33            jge     storport!RaUnitStartIo+0x39a (fffff801`8b8537ca)  Branch

storport!RaUnitStartIo+0x367:
fffff801`8b853797 83bfec01000001  cmp     dword ptr [rdi+1ECh],1
fffff801`8b85379e 742a            je      storport!RaUnitStartIo+0x39a (fffff801`8b8537ca)  Branch

storport!RaUnitStartIo+0x370:
fffff801`8b8537a0 488bd6          mov     rdx,rsi
fffff801`8b8537a3 488bcf          mov     rcx,rdi
fffff801`8b8537a6 e8c59c0300      call    storport!RaidSrbIsPowerRequired (fffff801`8b88d470)
fffff801`8b8537ab 84c0            test    al,al
fffff801`8b8537ad 741b            je      storport!RaUnitStartIo+0x39a (fffff801`8b8537ca)  Branch

storport!RaUnitStartIo+0x37f:
fffff801`8b8537af f78424f000000000001000 test dword ptr [rsp+0F0h],100000h
fffff801`8b8537ba 740e            je      storport!RaUnitStartIo+0x39a (fffff801`8b8537ca)  Branch

storport!RaUnitStartIo+0x38c:
fffff801`8b8537bc bd010000c0      mov     ebp,0C0000001h
fffff801`8b8537c1 c6460324        mov     byte ptr [rsi+3],24h
fffff801`8b8537c5 e925020000      jmp     storport!RaUnitStartIo+0x5bf (fffff801`8b8539ef)  Branch

storport!RaUnitStartIo+0x39a:
fffff801`8b8537ca 498b85b8000000  mov     rax,qword ptr [r13+0B8h]      ;r13 == IRP , set rax = Irp->Tail.Overlay.CurrentStackLocation 
fffff801`8b8537d1 488b5808        mov     rbx,qword ptr [rax+8]         ;set rbx = CurrentStackLocation.Parameters.Srb
fffff801`8b8537d5 807b0228        cmp     byte ptr [rbx+2],28h          ;if(CurrentStackLocation.Parameters.Srb.Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x3b1
fffff801`8b8537d9 7506            jne     storport!RaUnitStartIo+0x3b1 (fffff801`8b8537e1)  Branch

storport!RaUnitStartIo+0x3ab:
fffff801`8b8537db 488b5b60        mov     rbx,qword ptr [rbx+60h]   ;set rbx = Srb->PortContext = XRB
fffff801`8b8537df eb04            jmp     storport!RaUnitStartIo+0x3b5 (fffff801`8b8537e5)  Branch

storport!RaUnitStartIo+0x3b1:
fffff801`8b8537e1 488b5b30        mov     rbx,qword ptr [rbx+30h]   ;set rbx = scsi srb->OriginalRequest

storport!RaUnitStartIo+0x3b5:
fffff801`8b8537e5 4c89b300030000  mov     qword ptr [rbx+300h],r14
fffff801`8b8537ec 488d05dd800000  lea     rax,[storport!RaidUnitCompleteRequest (fffff801`8b85b8d0)]
fffff801`8b8537f3 48898390020000  mov     qword ptr [rbx+290h],rax
fffff801`8b8537fa 4d85ff          test    r15,r15
fffff801`8b8537fd 0f85d7000000    jne     storport!RaUnitStartIo+0x4aa (fffff801`8b8538da)  Branch

storport!RaUnitStartIo+0x3d3:
fffff801`8b853803 807e0228        cmp     byte ptr [rsi+2],28h
fffff801`8b853807 0f85cd000000    jne     storport!RaUnitStartIo+0x4aa (fffff801`8b8538da)  Branch

storport!RaUnitStartIo+0x3dd:
fffff801`8b85380d 8b4604          mov     eax,dword ptr [rsi+4]
fffff801`8b853810 4c8bf6          mov     r14,rsi
fffff801`8b853813 4889b42488000000 mov     qword ptr [rsp+88h],rsi
fffff801`8b85381b 85c0            test    eax,eax
fffff801`8b85381d 7509            jne     storport!RaUnitStartIo+0x3f8 (fffff801`8b853828)  Branch

storport!RaUnitStartIo+0x3ef:
fffff801`8b85381f 39461c          cmp     dword ptr [rsi+1Ch],eax
fffff801`8b853822 0f84ba000000    je      storport!RaUnitStartIo+0x4b2 (fffff801`8b8538e2)  Branch

storport!RaUnitStartIo+0x3f8:
fffff801`8b853828 803d61e0050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],0
fffff801`8b85382f 898424f0000000  mov     dword ptr [rsp+0F0h],eax
fffff801`8b853836 8b461c          mov     eax,dword ptr [rsi+1Ch]
fffff801`8b853839 898424f4000000  mov     dword ptr [rsp+0F4h],eax
fffff801`8b853840 c7461c00000000  mov     dword ptr [rsi+1Ch],0
fffff801`8b853847 c7460400000000  mov     dword ptr [rsi+4],0
fffff801`8b85384e 7422            je      storport!RaUnitStartIo+0x442 (fffff801`8b853872)  Branch

storport!RaUnitStartIo+0x420:
fffff801`8b853850 803d19e0050000  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],0

storport!RaUnitStartIo+0x427:
fffff801`8b853857 7434            je      storport!RaUnitStartIo+0x45d (fffff801`8b85388d)  Branch

storport!RaUnitStartIo+0x429:
fffff801`8b853859 488d8c2490000000 lea     rcx,[rsp+90h]
fffff801`8b853861 48ff1598370600  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff801`8b8b7000)]
fffff801`8b853868 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b85386d 4c8bf8          mov     r15,rax
fffff801`8b853870 eb2f            jmp     storport!RaUnitStartIo+0x471 (fffff801`8b8538a1)  Branch

storport!RaUnitStartIo+0x442:
fffff801`8b853872 833d5bda050000  cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceEnabled (fffff801`8b8b12d4)],0
fffff801`8b853879 7423            je      storport!RaUnitStartIo+0x46e (fffff801`8b85389e)  Branch

storport!RaUnitStartIo+0x44b:
fffff801`8b85387b 803deedf050000  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],0
fffff801`8b853882 7409            je      storport!RaUnitStartIo+0x45d (fffff801`8b85388d)  Branch

storport!RaUnitStartIo+0x454:
fffff801`8b853884 833d4dda050000  cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceHighResolutionTimer (fffff801`8b8b12d8)],0
fffff801`8b85388b ebca            jmp     storport!RaUnitStartIo+0x427 (fffff801`8b853857)  Branch

storport!RaUnitStartIo+0x45d:
fffff801`8b85388d 48ff1514380600  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff801`8b8b70a8)]
fffff801`8b853894 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b853899 4c8bf8          mov     r15,rax
fffff801`8b85389c eb03            jmp     storport!RaUnitStartIo+0x471 (fffff801`8b8538a1)  Branch

storport!RaUnitStartIo+0x46e:
fffff801`8b85389e 4533ff          xor     r15d,r15d

storport!RaUnitStartIo+0x471:
fffff801`8b8538a1 4c2bbc24f0000000 sub     r15,qword ptr [rsp+0F0h]
fffff801`8b8538a9 803dc0df050000  cmp     byte ptr [storport!UseQPCTime (fffff801`8b8b1870)],0
fffff801`8b8538b0 7430            je      storport!RaUnitStartIo+0x4b2 (fffff801`8b8538e2)  Branch

storport!RaUnitStartIo+0x482:
fffff801`8b8538b2 833d1fda050000  cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceHighResolutionTimer (fffff801`8b8b12d8)],0
fffff801`8b8538b9 7509            jne     storport!RaUnitStartIo+0x494 (fffff801`8b8538c4)  Branch

storport!RaUnitStartIo+0x48b:
fffff801`8b8538bb 803dcedf050000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff801`8b8b1890)],0
fffff801`8b8538c2 741e            je      storport!RaUnitStartIo+0x4b2 (fffff801`8b8538e2)  Branch

storport!RaUnitStartIo+0x494:
fffff801`8b8538c4 4969c780969800  imul    rax,r15,989680h
fffff801`8b8538cb 33d2            xor     edx,edx
fffff801`8b8538cd 48f7b42490000000 div     rax,qword ptr [rsp+90h]
fffff801`8b8538d5 4c8bf8          mov     r15,rax
fffff801`8b8538d8 eb08            jmp     storport!RaUnitStartIo+0x4b2 (fffff801`8b8538e2)  Branch

storport!RaUnitStartIo+0x4aa:
fffff801`8b8538da 4c8bb42488000000 mov     r14,qword ptr [rsp+88h]

storport!RaUnitStartIo+0x4b2:
fffff801`8b8538e2 4c89bbb0020000  mov     qword ptr [rbx+2B0h],r15
fffff801`8b8538e9 4c3b3d00da0500  cmp     r15,qword ptr [storport!DeviceQueueIoWaitThreshold (fffff801`8b8b12f0)]
fffff801`8b8538f0 7225            jb      storport!RaUnitStartIo+0x4e7 (fffff801`8b853917)  Branch

storport!RaUnitStartIo+0x4c2:
fffff801`8b8538f2 41bb01000000    mov     r11d,1
fffff801`8b8538f8 f04c0fc19fa0080000 lock xadd qword ptr [rdi+8A0h],r11
fffff801`8b853901 49ffc3          inc     r11
fffff801`8b853904 4983fb01        cmp     r11,1
fffff801`8b853908 0f85a2000000    jne     storport!RaUnitStartIo+0x580 (fffff801`8b8539b0)  Branch

storport!RaUnitStartIo+0x4de:
fffff801`8b85390e 488d2d4f230500  lea     rbp,[storport!`string` (fffff801`8b8a5c64)]
fffff801`8b853915 eb1a            jmp     storport!RaUnitStartIo+0x501 (fffff801`8b853931)  Branch

storport!RaUnitStartIo+0x4e7:
fffff801`8b853917 4533db          xor     r11d,r11d
fffff801`8b85391a 4c879fa0080000  xchg    r11,qword ptr [rdi+8A0h]
fffff801`8b853921 4d85db          test    r11,r11
fffff801`8b853924 0f8486000000    je      storport!RaUnitStartIo+0x580 (fffff801`8b8539b0)  Branch

storport!RaUnitStartIo+0x4fa:
fffff801`8b85392a 488d2d3b230500  lea     rbp,[storport!`string` (fffff801`8b8a5c6c)]

storport!RaUnitStartIo+0x501:
fffff801`8b853931 f605adde050010  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x5 (fffff801`8b8b17e5)],10h
fffff801`8b853938 7476            je      storport!RaUnitStartIo+0x580 (fffff801`8b8539b0)  Branch

storport!RaUnitStartIo+0x50a:
fffff801`8b85393a 4c8b4f18        mov     r9,qword ptr [rdi+18h]
fffff801`8b85393e 488d87ba000000  lea     rax,[rdi+0BAh]
fffff801`8b853945 4c895c2478      mov     qword ptr [rsp+78h],r11
fffff801`8b85394a 488d8fa9000000  lea     rcx,[rdi+0A9h]
fffff801`8b853951 48896c2468      mov     qword ptr [rsp+68h],rbp
fffff801`8b853956 488d97a0000000  lea     rdx,[rdi+0A0h]
fffff801`8b85395d 4889442460      mov     qword ptr [rsp+60h],rax
fffff801`8b853962 4c8d87b8070000  lea     r8,[rdi+7B8h]
fffff801`8b853969 0fb64762        movzx   eax,byte ptr [rdi+62h]
fffff801`8b85396d 4d8d9188140000  lea     r10,[r9+1488h]
fffff801`8b853974 48894c2458      mov     qword ptr [rsp+58h],rcx
fffff801`8b853979 4889542450      mov     qword ptr [rsp+50h],rdx
fffff801`8b85397e 4c89442448      mov     qword ptr [rsp+48h],r8
fffff801`8b853983 88442440        mov     byte ptr [rsp+40h],al
fffff801`8b853987 0fb64761        movzx   eax,byte ptr [rdi+61h]
fffff801`8b85398b 88442438        mov     byte ptr [rsp+38h],al
fffff801`8b85398f 0fb64760        movzx   eax,byte ptr [rdi+60h]
fffff801`8b853993 88442430        mov     byte ptr [rsp+30h],al
fffff801`8b853997 418b4138        mov     eax,dword ptr [r9+38h]
fffff801`8b85399b 4d8b8900130000  mov     r9,qword ptr [r9+1300h]
fffff801`8b8539a2 4c89542428      mov     qword ptr [rsp+28h],r10
fffff801`8b8539a7 89442420        mov     dword ptr [rsp+20h],eax
fffff801`8b8539ab e8d83b0200      call    storport!McTemplateK0zqjuuujssssxx (fffff801`8b877588)

storport!RaUnitStartIo+0x580:
fffff801`8b8539b0 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff801`8b8539b4 4883b98816000000 cmp     qword ptr [rcx+1688h],0
fffff801`8b8539bc 7464            je      storport!RaUnitStartIo+0x5f2 (fffff801`8b853a22)  Branch

storport!RaUnitStartIo+0x58e:
fffff801`8b8539be 488bd3          mov     rdx,rbx
fffff801`8b8539c1 e87e380300      call    storport!RaidAdapterAcquireCryptoKeyResources (fffff801`8b887244)
fffff801`8b8539c6 8be8            mov     ebp,eax
fffff801`8b8539c8 3d03010000      cmp     eax,103h
fffff801`8b8539cd 0f8462040000    je      storport!RaUnitStartIo+0xa05 (fffff801`8b853e35)  Branch

storport!RaUnitStartIo+0x5a3:
fffff801`8b8539d3 85c0            test    eax,eax
fffff801`8b8539d5 794b            jns     storport!RaUnitStartIo+0x5f2 (fffff801`8b853a22)  Branch

storport!RaUnitStartIo+0x5a7:
fffff801`8b8539d7 807e0228        cmp     byte ptr [rsi+2],28h
fffff801`8b8539db 750b            jne     storport!RaUnitStartIo+0x5b8 (fffff801`8b8539e8)  Branch

storport!RaUnitStartIo+0x5ad:
fffff801`8b8539dd 41c6460330      mov     byte ptr [r14+3],30h
fffff801`8b8539e2 4189462c        mov     dword ptr [r14+2Ch],eax
fffff801`8b8539e6 eb07            jmp     storport!RaUnitStartIo+0x5bf (fffff801`8b8539ef)  Branch

storport!RaUnitStartIo+0x5b8:
fffff801`8b8539e8 c6460330        mov     byte ptr [rsi+3],30h
fffff801`8b8539ec 894640          mov     dword ptr [rsi+40h],eax

storport!RaUnitStartIo+0x5bf:
fffff801`8b8539ef 4533c0          xor     r8d,r8d
fffff801`8b8539f2 498bd5          mov     rdx,r13
fffff801`8b8539f5 488bcf          mov     rcx,rdi
fffff801`8b8539f8 e89f360200      call    storport!RaidUpdateZoneIoMetadata (fffff801`8b87709c)

storport!RaUnitStartIo+0x5cd:
fffff801`8b8539fd 498b85b8000000  mov     rax,qword ptr [r13+0B8h]
fffff801`8b853a04 488b7008        mov     rsi,qword ptr [rax+8]
fffff801`8b853a08 0fb64602        movzx   eax,byte ptr [rsi+2]
fffff801`8b853a0c 3c28            cmp     al,28h
fffff801`8b853a0e 0f85aa020000    jne     storport!RaUnitStartIo+0x88e (fffff801`8b853cbe)  Branch

storport!RaUnitStartIo+0x5e4:
fffff801`8b853a14 8b5614          mov     edx,dword ptr [rsi+14h]
fffff801`8b853a17 4c8bfe          mov     r15,rsi
fffff801`8b853a1a 8b4e18          mov     ecx,dword ptr [rsi+18h]
fffff801`8b853a1d e9aa020000      jmp     storport!RaUnitStartIo+0x89c (fffff801`8b853ccc)  Branch

storport!RaUnitStartIo+0x5f2:
fffff801`8b853a22 4c8b7718        mov     r14,qword ptr [rdi+18h]
fffff801`8b853a26 4180bea211000000 cmp     byte ptr [r14+11A2h],0
fffff801`8b853a2e 0f840f020000    je      storport!RaUnitStartIo+0x813 (fffff801`8b853c43)  Branch

storport!RaUnitStartIo+0x604:
fffff801`8b853a34 488b8ba8000000  mov     rcx,qword ptr [rbx+0A8h]
fffff801`8b853a3b 0fb65102        movzx   edx,byte ptr [rcx+2]
fffff801`8b853a3f 80fa28          cmp     dl,28h
fffff801`8b853a42 7505            jne     storport!RaUnitStartIo+0x619 (fffff801`8b853a49)  Branch

storport!RaUnitStartIo+0x614:
fffff801`8b853a44 8b7118          mov     esi,dword ptr [rcx+18h]
fffff801`8b853a47 eb03            jmp     storport!RaUnitStartIo+0x61c (fffff801`8b853a4c)  Branch

storport!RaUnitStartIo+0x619:
fffff801`8b853a49 8b710c          mov     esi,dword ptr [rcx+0Ch]

storport!RaUnitStartIo+0x61c:
fffff801`8b853a4c 41f686a311000004 test    byte ptr [r14+11A3h],4
fffff801`8b853a54 0f8565010000    jne     storport!RaUnitStartIo+0x78f (fffff801`8b853bbf)  Branch

storport!RaUnitStartIo+0x62a:
fffff801`8b853a5a 4883bb8800000000 cmp     qword ptr [rbx+88h],0
fffff801`8b853a62 7410            je      storport!RaUnitStartIo+0x644 (fffff801`8b853a74)  Branch

storport!RaUnitStartIo+0x634:
fffff801`8b853a64 488bd3          mov     rdx,rbx
fffff801`8b853a67 498bce          mov     rcx,r14
fffff801`8b853a6a e8c5590300      call    storport!RaidAdapterScatterGatherExecuteBidirectionalRequest (fffff801`8b889434)
fffff801`8b853a6f e9da010000      jmp     storport!RaUnitStartIo+0x81e (fffff801`8b853c4e)  Branch

storport!RaUnitStartIo+0x644:
fffff801`8b853a74 40f6c6c0        test    sil,0C0h
fffff801`8b853a78 0f84c5010000    je      storport!RaUnitStartIo+0x813 (fffff801`8b853c43)  Branch

storport!RaUnitStartIo+0x64e:
fffff801`8b853a7e 80fa28          cmp     dl,28h
fffff801`8b853a81 750c            jne     storport!RaUnitStartIo+0x65f (fffff801`8b853a8f)  Branch

storport!RaUnitStartIo+0x653:
fffff801`8b853a83 448b7918        mov     r15d,dword ptr [rcx+18h]
fffff801`8b853a87 8b713c          mov     esi,dword ptr [rcx+3Ch]
fffff801`8b853a8a 8b6914          mov     ebp,dword ptr [rcx+14h]
fffff801`8b853a8d eb0a            jmp     storport!RaUnitStartIo+0x669 (fffff801`8b853a99)  Branch

storport!RaUnitStartIo+0x65f:
fffff801`8b853a8f 448b790c        mov     r15d,dword ptr [rcx+0Ch]
fffff801`8b853a93 8b7110          mov     esi,dword ptr [rcx+10h]
fffff801`8b853a96 0fb6ea          movzx   ebp,dl

storport!RaUnitStartIo+0x669:
fffff801`8b853a99 418b861c020000  mov     eax,dword ptr [r14+21Ch]
fffff801`8b853aa0 418bcf          mov     ecx,r15d
fffff801`8b853aa3 41c1ef07        shr     r15d,7
fffff801`8b853aa7 83e140          and     ecx,40h
fffff801`8b853aaa 4180e701        and     r15b,1
fffff801`8b853aae a808            test    al,8
fffff801`8b853ab0 751f            jne     storport!RaUnitStartIo+0x6a1 (fffff801`8b853ad1)  Branch

storport!RaUnitStartIo+0x682:
fffff801`8b853ab2 41f6466d02      test    byte ptr [r14+6Dh],2
fffff801`8b853ab7 7518            jne     storport!RaUnitStartIo+0x6a1 (fffff801`8b853ad1)  Branch

storport!RaUnitStartIo+0x689:
fffff801`8b853ab9 85c9            test    ecx,ecx
fffff801`8b853abb 41b001          mov     r8b,1
fffff801`8b853abe 488b4b68        mov     rcx,qword ptr [rbx+68h]
fffff801`8b853ac2 0f95c2          setne   dl
fffff801`8b853ac5 48ff158c360600  call    qword ptr [storport!_imp_KeFlushIoBuffers (fffff801`8b8b7158)]
fffff801`8b853acc 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitStartIo+0x6a1:
fffff801`8b853ad1 83fd17          cmp     ebp,17h
fffff801`8b853ad4 750c            jne     storport!RaUnitStartIo+0x6b2 (fffff801`8b853ae2)  Branch

storport!RaUnitStartIo+0x6a6:
fffff801`8b853ad6 488b4368        mov     rax,qword ptr [rbx+68h]
fffff801`8b853ada 8b4828          mov     ecx,dword ptr [rax+28h]
fffff801`8b853add 3bce            cmp     ecx,esi
fffff801`8b853adf 0f47f1          cmova   esi,ecx

storport!RaUnitStartIo+0x6b2:
fffff801`8b853ae2 4c8b8bb8000000  mov     r9,qword ptr [rbx+0B8h]
fffff801`8b853ae9 4d8da6d0020000  lea     r12,[r14+2D0h]
fffff801`8b853af0 4c8b4368        mov     r8,qword ptr [rbx+68h]
fffff801`8b853af4 4c8d1d65f8ffff  lea     r11,[storport!RaidpAdapterContinueScatterGather (fffff801`8b853360)]
fffff801`8b853afb 498b5608        mov     rdx,qword ptr [r14+8]
fffff801`8b853aff 4d85e4          test    r12,r12
fffff801`8b853b02 7453            je      storport!RaUnitStartIo+0x727 (fffff801`8b853b57)  Branch

storport!RaUnitStartIo+0x6d4:
fffff801`8b853b04 498b0c24        mov     rcx,qword ptr [r12]
fffff801`8b853b08 4885c9          test    rcx,rcx
fffff801`8b853b0b 744a            je      storport!RaUnitStartIo+0x727 (fffff801`8b853b57)  Branch

storport!RaUnitStartIo+0x6dd:
fffff801`8b853b0d 488b4108        mov     rax,qword ptr [rcx+8]
fffff801`8b853b11 4885c0          test    rax,rax
fffff801`8b853b14 7441            je      storport!RaUnitStartIo+0x727 (fffff801`8b853b57)  Branch

storport!RaUnitStartIo+0x6e6:
fffff801`8b853b16 488b4070        mov     rax,qword ptr [rax+70h]
fffff801`8b853b1a 4885c0          test    rax,rax
fffff801`8b853b1d 7438            je      storport!RaUnitStartIo+0x727 (fffff801`8b853b57)  Branch

storport!RaUnitStartIo+0x6ef:
fffff801`8b853b1f c7442448a8010000 mov     dword ptr [rsp+48h],1A8h
fffff801`8b853b27 4c8d93e8000000  lea     r10,[rbx+0E8h]
fffff801`8b853b2e 4c89542440      mov     qword ptr [rsp+40h],r10
fffff801`8b853b33 44887c2438      mov     byte ptr [rsp+38h],r15b
fffff801`8b853b38 48895c2430      mov     qword ptr [rsp+30h],rbx
fffff801`8b853b3d 4c895c2428      mov     qword ptr [rsp+28h],r11
fffff801`8b853b42 89742420        mov     dword ptr [rsp+20h],esi
fffff801`8b853b46 ff15dc3c0600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff801`8b8b7828)]
fffff801`8b853b4c 8be8            mov     ebp,eax
fffff801`8b853b4e 4c8d1d0bf8ffff  lea     r11,[storport!RaidpAdapterContinueScatterGather (fffff801`8b853360)]
fffff801`8b853b55 eb05            jmp     storport!RaUnitStartIo+0x72c (fffff801`8b853b5c)  Branch

storport!RaUnitStartIo+0x727:
fffff801`8b853b57 bd0d0000c0      mov     ebp,0C000000Dh

storport!RaUnitStartIo+0x72c:
fffff801`8b853b5c 81fd230000c0    cmp     ebp,0C0000023h
fffff801`8b853b62 0f85e8000000    jne     storport!RaUnitStartIo+0x820 (fffff801`8b853c50)  Branch

storport!RaUnitStartIo+0x738:
fffff801`8b853b68 4d85e4          test    r12,r12
fffff801`8b853b6b 7448            je      storport!RaUnitStartIo+0x785 (fffff801`8b853bb5)  Branch

storport!RaUnitStartIo+0x73d:
fffff801`8b853b6d 498b0c24        mov     rcx,qword ptr [r12]
fffff801`8b853b71 4885c9          test    rcx,rcx
fffff801`8b853b74 743f            je      storport!RaUnitStartIo+0x785 (fffff801`8b853bb5)  Branch

storport!RaUnitStartIo+0x746:
fffff801`8b853b76 488b4108        mov     rax,qword ptr [rcx+8]
fffff801`8b853b7a 4885c0          test    rax,rax
fffff801`8b853b7d 7436            je      storport!RaUnitStartIo+0x785 (fffff801`8b853bb5)  Branch

storport!RaUnitStartIo+0x74f:
fffff801`8b853b7f 488b4058        mov     rax,qword ptr [rax+58h]
fffff801`8b853b83 4885c0          test    rax,rax
fffff801`8b853b86 742d            je      storport!RaUnitStartIo+0x785 (fffff801`8b853bb5)  Branch

storport!RaUnitStartIo+0x758:
fffff801`8b853b88 4c8b8bb8000000  mov     r9,qword ptr [rbx+0B8h]
fffff801`8b853b8f 4c8b4368        mov     r8,qword ptr [rbx+68h]
fffff801`8b853b93 498b5608        mov     rdx,qword ptr [r14+8]
fffff801`8b853b97 44887c2438      mov     byte ptr [rsp+38h],r15b
fffff801`8b853b9c 48895c2430      mov     qword ptr [rsp+30h],rbx
fffff801`8b853ba1 4c895c2428      mov     qword ptr [rsp+28h],r11
fffff801`8b853ba6 89742420        mov     dword ptr [rsp+20h],esi
fffff801`8b853baa ff15783c0600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff801`8b8b7828)]
fffff801`8b853bb0 e999000000      jmp     storport!RaUnitStartIo+0x81e (fffff801`8b853c4e)  Branch

storport!RaUnitStartIo+0x785:
fffff801`8b853bb5 bd0d0000c0      mov     ebp,0C000000Dh
fffff801`8b853bba e991000000      jmp     storport!RaUnitStartIo+0x820 (fffff801`8b853c50)  Branch

storport!RaUnitStartIo+0x78f:
fffff801`8b853bbf 4c8b4b68        mov     r9,qword ptr [rbx+68h]
fffff801`8b853bc3 c1ee06          shr     esi,6
fffff801`8b853bc6 4080e601        and     sil,1
fffff801`8b853bca 4d85c9          test    r9,r9
fffff801`8b853bcd 7458            je      storport!RaUnitStartIo+0x7f7 (fffff801`8b853c27)  Branch

storport!RaUnitStartIo+0x79f:
fffff801`8b853bcf 498d8ed0020000  lea     rcx,[r14+2D0h]
fffff801`8b853bd6 4885c9          test    rcx,rcx
fffff801`8b853bd9 744c            je      storport!RaUnitStartIo+0x7f7 (fffff801`8b853c27)  Branch

storport!RaUnitStartIo+0x7ab:
fffff801`8b853bdb 488b09          mov     rcx,qword ptr [rcx]
fffff801`8b853bde 4885c9          test    rcx,rcx
fffff801`8b853be1 7444            je      storport!RaUnitStartIo+0x7f7 (fffff801`8b853c27)  Branch

storport!RaUnitStartIo+0x7b3:
fffff801`8b853be3 488b4108        mov     rax,qword ptr [rcx+8]
fffff801`8b853be7 4885c0          test    rax,rax
fffff801`8b853bea 743b            je      storport!RaUnitStartIo+0x7f7 (fffff801`8b853c27)  Branch

storport!RaUnitStartIo+0x7bc:
fffff801`8b853bec 4183beec02000003 cmp     dword ptr [r14+2ECh],3
fffff801`8b853bf4 7c1b            jl      storport!RaUnitStartIo+0x7e1 (fffff801`8b853c11)  Branch

storport!RaUnitStartIo+0x7c6:
fffff801`8b853bf6 488b80f0000000  mov     rax,qword ptr [rax+0F0h]
fffff801`8b853bfd 4885c0          test    rax,rax
fffff801`8b853c00 740f            je      storport!RaUnitStartIo+0x7e1 (fffff801`8b853c11)  Branch

storport!RaUnitStartIo+0x7d2:
fffff801`8b853c02 440fb6c6        movzx   r8d,sil
fffff801`8b853c06 498bd1          mov     rdx,r9
fffff801`8b853c09 ff15193c0600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff801`8b8b7828)]
fffff801`8b853c0f eb16            jmp     storport!RaUnitStartIo+0x7f7 (fffff801`8b853c27)  Branch

storport!RaUnitStartIo+0x7e1:
fffff801`8b853c11 41b001          mov     r8b,1
fffff801`8b853c14 400fb6d6        movzx   edx,sil
fffff801`8b853c18 498bc9          mov     rcx,r9
fffff801`8b853c1b 48ff1536350600  call    qword ptr [storport!_imp_KeFlushIoBuffers (fffff801`8b8b7158)]
fffff801`8b853c22 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitStartIo+0x7f7:
fffff801`8b853c27 488b9388000000  mov     rdx,qword ptr [rbx+88h]
fffff801`8b853c2e 4885d2          test    rdx,rdx
fffff801`8b853c31 7410            je      storport!RaUnitStartIo+0x813 (fffff801`8b853c43)  Branch

storport!RaUnitStartIo+0x803:
fffff801`8b853c33 498d8ed0020000  lea     rcx,[r14+2D0h]
fffff801`8b853c3a 440fb6c6        movzx   r8d,sil
fffff801`8b853c3e e869180200      call    storport!RaidDmaFlushDmaBuffers (fffff801`8b8754ac)

storport!RaUnitStartIo+0x813:
fffff801`8b853c43 488bd3          mov     rdx,rbx
fffff801`8b853c46 498bce          mov     rcx,r14
fffff801`8b853c49 e8520d0000      call    storport!RaidAdapterPostScatterGatherExecute (fffff801`8b8549a0)      ;Call to Miniport StartIo

storport!RaUnitStartIo+0x81e:
fffff801`8b853c4e 8be8            mov     ebp,eax

storport!RaUnitStartIo+0x820:
fffff801`8b853c50 85ed            test    ebp,ebp
fffff801`8b853c52 0f88a5fdffff    js      storport!RaUnitStartIo+0x5cd (fffff801`8b8539fd)  Branch

storport!RaUnitStartIo+0x828:
fffff801`8b853c58 488b5f18        mov     rbx,qword ptr [rdi+18h]
fffff801`8b853c5c 83bba810000000  cmp     dword ptr [rbx+10A8h],0
fffff801`8b853c63 0f8fcc010000    jg      storport!RaUnitStartIo+0xa05 (fffff801`8b853e35)  Branch

storport!RaUnitStartIo+0x839:
fffff801`8b853c69 488d8be0040000  lea     rcx,[rbx+4E0h]
fffff801`8b853c70 48ff15c9340600  call    qword ptr [storport!_imp_ExQueryDepthSList (fffff801`8b8b7140)]
fffff801`8b853c77 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b853c7c 6685c0          test    ax,ax
fffff801`8b853c7f 0f84b0010000    je      storport!RaUnitStartIo+0xa05 (fffff801`8b853e35)  Branch

storport!RaUnitStartIo+0x855:
fffff801`8b853c85 b801000000      mov     eax,1
fffff801`8b853c8a f00fc183a8100000 lock xadd dword ptr [rbx+10A8h],eax
fffff801`8b853c92 ffc0            inc     eax
fffff801`8b853c94 83f801          cmp     eax,1
fffff801`8b853c97 7519            jne     storport!RaUnitStartIo+0x882 (fffff801`8b853cb2)  Branch

storport!RaUnitStartIo+0x869:
fffff801`8b853c99 440fb6842408010000 movzx r8d,byte ptr [rsp+108h]
fffff801`8b853ca2 488d8b80040000  lea     rcx,[rbx+480h]
fffff801`8b853ca9 488b5308        mov     rdx,qword ptr [rbx+8]
fffff801`8b853cad e8b6d90000      call    storport!RaidProcessDeferredItemsWorker (fffff801`8b861668)

storport!RaUnitStartIo+0x882:
fffff801`8b853cb2 f0ff8ba8100000  lock dec dword ptr [rbx+10A8h]
fffff801`8b853cb9 e977010000      jmp     storport!RaUnitStartIo+0xa05 (fffff801`8b853e35)  Branch

storport!RaUnitStartIo+0x88e:
fffff801`8b853cbe 8b4e0c          mov     ecx,dword ptr [rsi+0Ch]
fffff801`8b853cc1 4c8bbc2488000000 mov     r15,qword ptr [rsp+88h]
fffff801`8b853cc9 0fb6d0          movzx   edx,al

storport!RaUnitStartIo+0x89c:
fffff801`8b853ccc e853720000      call    storport!IsUntaggedRequest (fffff801`8b85af24)
fffff801`8b853cd1 4c8ba42400010000 mov     r12,qword ptr [rsp+100h]
fffff801`8b853cd9 4533f6          xor     r14d,r14d
fffff801`8b853cdc 85c0            test    eax,eax
fffff801`8b853cde 410f95c6        setne   r14b
fffff801`8b853ce2 83bc24f800000000 cmp     dword ptr [rsp+0F8h],0
fffff801`8b853cea 744f            je      storport!RaUnitStartIo+0x90b (fffff801`8b853d3b)  Branch

storport!RaUnitStartIo+0x8bc:
fffff801`8b853cec 418b1c24        mov     ebx,dword ptr [r12]
fffff801`8b853cf0 48ff1591340600  call    qword ptr [storport!_imp_KeQueryHighestNodeNumber (fffff801`8b8b7188)]
fffff801`8b853cf7 0f1f440000      nop     dword ptr [rax+rax]
fffff801`8b853cfc 33d2            xor     edx,edx
fffff801`8b853cfe 440fb7c0        movzx   r8d,ax
fffff801`8b853d02 8bc3            mov     eax,ebx
fffff801`8b853d04 f7b748020000    div     eax,dword ptr [rdi+248h]
fffff801`8b853d0a 418d4801        lea     ecx,[r8+1]
fffff801`8b853d0e 8bd3            mov     edx,ebx
fffff801`8b853d10 48c1e204        shl     rdx,4
fffff801`8b853d14 48039740020000  add     rdx,qword ptr [rdi+240h]
fffff801`8b853d1b 3bc1            cmp     eax,ecx
fffff801`8b853d1d 440f42c0        cmovb   r8d,eax
fffff801`8b853d21 418bc8          mov     ecx,r8d
fffff801`8b853d24 48c1e106        shl     rcx,6
fffff801`8b853d28 48038f00020000  add     rcx,qword ptr [rdi+200h]
fffff801`8b853d2f 48ff159a330600  call    qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff801`8b8b70d0)]
fffff801`8b853d36 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitStartIo+0x90b:
fffff801`8b853d3b 488d8f90020000  lea     rcx,[rdi+290h]
fffff801`8b853d42 418bd6          mov     edx,r14d
fffff801`8b853d45 e8c61b0100      call    storport!RaidDeleteDeviceQueueEntry (fffff801`8b865910)
fffff801`8b853d4a 83bc248000000000 cmp     dword ptr [rsp+80h],0
fffff801`8b853d52 7408            je      storport!RaUnitStartIo+0x92c (fffff801`8b853d5c)  Branch

storport!RaUnitStartIo+0x924:
fffff801`8b853d54 498bcd          mov     rcx,r13
fffff801`8b853d57 e8f84f0000      call    storport!RaidUnitReleaseIrp (fffff801`8b858d54)

storport!RaUnitStartIo+0x92c:
fffff801`8b853d5c 488b8f98020000  mov     rcx,qword ptr [rdi+298h]
fffff801`8b853d63 4533c0          xor     r8d,r8d
fffff801`8b853d66 498bd4          mov     rdx,r12
fffff801`8b853d69 e8228f0000      call    storport!StorRemoveIoGatewayItem (fffff801`8b85cc90)
fffff801`8b853d6e 49c7453800000000 mov     qword ptr [r13+38h],0
fffff801`8b853d76 f646033f        test    byte ptr [rsi+3],3Fh
fffff801`8b853d7a 0fb6d8          movzx   ebx,al
fffff801`8b853d7d 752f            jne     storport!RaUnitStartIo+0x97e (fffff801`8b853dae)  Branch

storport!RaUnitStartIo+0x94f:
fffff801`8b853d7f 8bcd            mov     ecx,ebp
fffff801`8b853d81 e8a2220400      call    storport!RaidNtStatusToSrbStatus (fffff801`8b896028)
fffff801`8b853d86 0fb6c8          movzx   ecx,al
fffff801`8b853d89 884e03          mov     byte ptr [rsi+3],cl
fffff801`8b853d8c 81e13fffffff    and     ecx,0FFFFFF3Fh
fffff801`8b853d92 80f930          cmp     cl,30h
fffff801`8b853d95 7517            jne     storport!RaUnitStartIo+0x97e (fffff801`8b853dae)  Branch

storport!RaUnitStartIo+0x967:
fffff801`8b853d97 807e0228        cmp     byte ptr [rsi+2],28h
fffff801`8b853d9b 750a            jne     storport!RaUnitStartIo+0x977 (fffff801`8b853da7)  Branch

storport!RaUnitStartIo+0x96d:
fffff801`8b853d9d 41c7472c9a0000c0 mov     dword ptr [r15+2Ch],0C000009Ah
fffff801`8b853da5 eb07            jmp     storport!RaUnitStartIo+0x97e (fffff801`8b853dae)  Branch

storport!RaUnitStartIo+0x977:
fffff801`8b853da7 c746409a0000c0  mov     dword ptr [rsi+40h],0C000009Ah

storport!RaUnitStartIo+0x97e:
fffff801`8b853dae 488b0d4bd20500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff801`8b8b1000)]
fffff801`8b853db5 488d0544d20500  lea     rax,[storport!WPP_GLOBAL_Control (fffff801`8b8b1000)]
fffff801`8b853dbc 483bc8          cmp     rcx,rax
fffff801`8b853dbf 7433            je      storport!RaUnitStartIo+0x9c4 (fffff801`8b853df4)  Branch

storport!RaUnitStartIo+0x991:
fffff801`8b853dc1 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff801`8b853dc4 a808            test    al,8
fffff801`8b853dc6 742c            je      storport!RaUnitStartIo+0x9c4 (fffff801`8b853df4)  Branch

storport!RaUnitStartIo+0x998:
fffff801`8b853dc8 80792902        cmp     byte ptr [rcx+29h],2
fffff801`8b853dcc 7226            jb      storport!RaUnitStartIo+0x9c4 (fffff801`8b853df4)  Branch

storport!RaUnitStartIo+0x99e:
fffff801`8b853dce 418b4530        mov     eax,dword ptr [r13+30h]
fffff801`8b853dd2 4c8d05e71e0500  lea     r8,[storport!WPP_99c9bf4d7da4363d93328a929abc4697_Traceguids (fffff801`8b8a5cc0)]
fffff801`8b853dd9 4c8b4f08        mov     r9,qword ptr [rdi+8]
fffff801`8b853ddd ba19000000      mov     edx,19h
fffff801`8b853de2 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff801`8b853de6 89442428        mov     dword ptr [rsp+28h],eax
fffff801`8b853dea 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff801`8b853def e8547e0300      call    storport!WPP_SF_qqD (fffff801`8b88bc48)

storport!RaUnitStartIo+0x9c4:
fffff801`8b853df4 498bd5          mov     rdx,r13
fffff801`8b853df7 488bcf          mov     rcx,rdi
fffff801`8b853dfa e83d5f0400      call    storport!RaidUnitEndDeviceBusy (fffff801`8b899d3c)
fffff801`8b853dff 448bc5          mov     r8d,ebp
fffff801`8b853e02 33d2            xor     edx,edx
fffff801`8b853e04 498bcd          mov     rcx,r13
fffff801`8b853e07 e894900000      call    storport!RaidCompleteRequestEx (fffff801`8b85cea0)
fffff801`8b853e0c 4533c0          xor     r8d,r8d
fffff801`8b853e0f 33d2            xor     edx,edx
fffff801`8b853e11 85db            test    ebx,ebx
fffff801`8b853e13 740d            je      storport!RaUnitStartIo+0x9f2 (fffff801`8b853e22)  Branch

storport!RaUnitStartIo+0x9e5:
fffff801`8b853e15 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff801`8b853e19 4881c140070000  add     rcx,740h
fffff801`8b853e20 eb07            jmp     storport!RaUnitStartIo+0x9f9 (fffff801`8b853e29)  Branch

storport!RaUnitStartIo+0x9f2:
fffff801`8b853e22 488d8fa0040000  lea     rcx,[rdi+4A0h]

storport!RaUnitStartIo+0x9f9:
fffff801`8b853e29 48ff1518390600  call    qword ptr [storport!_imp_KeInsertQueueDpc (fffff801`8b8b7748)]
fffff801`8b853e30 0f1f440000      nop     dword ptr [rax+rax]

storport!RaUnitStartIo+0xa05:
fffff801`8b853e35 4881c4a8000000  add     rsp,0A8h
fffff801`8b853e3c 415f            pop     r15
fffff801`8b853e3e 415e            pop     r14
fffff801`8b853e40 415d            pop     r13
fffff801`8b853e42 415c            pop     r12
fffff801`8b853e44 5f              pop     rdi
fffff801`8b853e45 5e              pop     rsi
fffff801`8b853e46 5d              pop     rbp
fffff801`8b853e47 5b              pop     rbx
fffff801`8b853e48 c3              ret
