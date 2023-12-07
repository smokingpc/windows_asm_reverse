0: kd> uf storport!StorPortResumeDevice
storport!StorPortResumeDevice:
fffff802`b8882330 4c8bdc          mov     r11,rsp
fffff802`b8882333 49895b10        mov     qword ptr [r11+10h],rbx
fffff802`b8882337 49896b18        mov     qword ptr [r11+18h],rbp
fffff802`b888233b 49897320        mov     qword ptr [r11+20h],rsi
fffff802`b888233f 57              push    rdi
fffff802`b8882340 4156            push    r14
fffff802`b8882342 4157            push    r15
fffff802`b8882344 4883ec50        sub     rsp,50h
fffff802`b8882348 33c0            xor     eax,eax
fffff802`b888234a 4533ff          xor     r15d,r15d
fffff802`b888234d 498943d8        mov     qword ptr [r11-28h],rax
fffff802`b8882351 418ad9          mov     bl,r9b
fffff802`b8882354 488b41f0        mov     rax,qword ptr [rcx-10h]
fffff802`b8882358 418af0          mov     sil,r8b
fffff802`b888235b 408aea          mov     bpl,dl
fffff802`b888235e 4c8bf1          mov     r14,rcx
fffff802`b8882361 488b38          mov     rdi,qword ptr [rax]
fffff802`b8882364 488b0545ef0500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff802`b88e12b0)]
fffff802`b888236b 480fbae009      bt      rax,9
fffff802`b8882370 7339            jae     storport!StorPortResumeDevice+0x7b (fffff802`b88823ab)  Branch

storport!StorPortResumeDevice+0x42:
fffff802`b8882372 0fb6ca          movzx   ecx,dl
fffff802`b8882375 4c8bcf          mov     r9,rdi
fffff802`b8882378 c1e108          shl     ecx,8
fffff802`b888237b 418d5711        lea     edx,[r15+11h]
fffff802`b888237f 410fb6c0        movzx   eax,r8b
fffff802`b8882383 4c8b442468      mov     r8,qword ptr [rsp+68h]
fffff802`b8882388 0bc8            or      ecx,eax
fffff802`b888238a c1e108          shl     ecx,8
fffff802`b888238d 0fb6c3          movzx   eax,bl
fffff802`b8882390 480bc8          or      rcx,rax
fffff802`b8882393 498b43d8        mov     rax,qword ptr [r11-28h]
fffff802`b8882397 498943c8        mov     qword ptr [r11-38h],rax
fffff802`b888239b 49894bc0        mov     qword ptr [r11-40h],rcx
fffff802`b888239f 488bcf          mov     rcx,rdi
fffff802`b88823a2 4d897bb8        mov     qword ptr [r11-48h],r15
fffff802`b88823a6 e849020000      call    storport!DbgLogRequest (fffff802`b88825f4)

storport!StorPortResumeDevice+0x7b:
fffff802`b88823ab b9ff000000      mov     ecx,0FFh
fffff802`b88823b0 4885ff          test    rdi,rdi
fffff802`b88823b3 7403            je      storport!StorPortResumeDevice+0x88 (fffff802`b88823b8)  Branch

storport!StorPortResumeDevice+0x85:
fffff802`b88823b5 8b4f38          mov     ecx,dword ptr [rdi+38h]

storport!StorPortResumeDevice+0x88:
fffff802`b88823b8 8a0522f40500    mov     al,byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff802`b88e17e0)]
fffff802`b88823be a804            test    al,4
fffff802`b88823c0 0f859ca30200    jne     storport!StorPortResumeDevice+0x2a432 (fffff802`b88ac762)  Branch

storport!StorPortResumeDevice+0x96:
fffff802`b88823c6 4885ff          test    rdi,rdi
fffff802`b88823c9 0f8492000000    je      storport!StorPortResumeDevice+0x131 (fffff802`b8882461)  Branch

storport!StorPortResumeDevice+0x9f:
fffff802`b88823cf 40886c2470      mov     byte ptr [rsp+70h],bpl
fffff802`b88823d4 4088742471      mov     byte ptr [rsp+71h],sil
fffff802`b88823d9 885c2472        mov     byte ptr [rsp+72h],bl
fffff802`b88823dd 488b0d1cec0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff802`b88e1000)]
fffff802`b88823e4 488d0515ec0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff802`b88e1000)]
fffff802`b88823eb 483bc8          cmp     rcx,rax
fffff802`b88823ee 740b            je      storport!StorPortResumeDevice+0xcb (fffff802`b88823fb)  Branch

storport!StorPortResumeDevice+0xc0:
fffff802`b88823f0 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff802`b88823f3 a820            test    al,20h
fffff802`b88823f5 0f8587a30200    jne     storport!StorPortResumeDevice+0x2a452 (fffff802`b88ac782)  Branch

storport!StorPortResumeDevice+0xcb:
fffff802`b88823fb 8b5c2470        mov     ebx,dword ptr [rsp+70h]
fffff802`b88823ff 488bcf          mov     rcx,rdi
fffff802`b8882402 8bd3            mov     edx,ebx
fffff802`b8882404 e8eb990000      call    storport!RaidAdapterFindUnit (fffff802`b888bdf4)
fffff802`b8882409 4885c0          test    rax,rax
fffff802`b888240c 7453            je      storport!StorPortResumeDevice+0x131 (fffff802`b8882461)  Branch

storport!StorPortResumeDevice+0xde:
fffff802`b888240e b904200708      mov     ecx,8072004h
fffff802`b8882413 488d9060050000  lea     rdx,[rax+560h]
fffff802`b888241a 8d4101          lea     eax,[rcx+1]
fffff802`b888241d f00fb14a10      lock cmpxchg dword ptr [rdx+10h],ecx
fffff802`b8882422 490f45d7        cmovne  rdx,r15
fffff802`b8882426 4885d2          test    rdx,rdx
fffff802`b8882429 0f848ca30200    je      storport!StorPortResumeDevice+0x2a48b (fffff802`b88ac7bb)  Branch

storport!StorPortResumeDevice+0xff:
fffff802`b888242f 488d8f80040000  lea     rcx,[rdi+480h]
fffff802`b8882436 c7422006000000  mov     dword ptr [rdx+20h],6
fffff802`b888243d 895a24          mov     dword ptr [rdx+24h],ebx
fffff802`b8882440 e827000000      call    storport!RaidQueueDeferredItem (fffff802`b888246c)
fffff802`b8882445 b001            mov     al,1

storport!StorPortResumeDevice+0x117:
fffff802`b8882447 4c8d5c2450      lea     r11,[rsp+50h]
fffff802`b888244c 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff802`b8882450 498b6b30        mov     rbp,qword ptr [r11+30h]
fffff802`b8882454 498b7338        mov     rsi,qword ptr [r11+38h]
fffff802`b8882458 498be3          mov     rsp,r11
fffff802`b888245b 415f            pop     r15
fffff802`b888245d 415e            pop     r14
fffff802`b888245f 5f              pop     rdi
fffff802`b8882460 c3              ret

storport!StorPortResumeDevice+0x131:
fffff802`b8882461 32c0            xor     al,al
fffff802`b8882463 ebe2            jmp     storport!StorPortResumeDevice+0x117 (fffff802`b8882447)  Branch

storport!StorPortResumeDevice+0x2a432:
fffff802`b88ac762 885c2438        mov     byte ptr [rsp+38h],bl
fffff802`b88ac766 4d8bce          mov     r9,r14
fffff802`b88ac769 4088742430      mov     byte ptr [rsp+30h],sil
fffff802`b88ac76e 40886c2428      mov     byte ptr [rsp+28h],bpl
fffff802`b88ac773 894c2420        mov     dword ptr [rsp+20h],ecx
fffff802`b88ac777 e844110100      call    storport!McTemplateK0pquuu (fffff802`b88bd8c0)
fffff802`b88ac77c 90              nop
fffff802`b88ac77d e9445cfdff      jmp     storport!StorPortResumeDevice+0x96 (fffff802`b88823c6)  Branch

storport!StorPortResumeDevice+0x2a452:
fffff802`b88ac782 80792903        cmp     byte ptr [rcx+29h],3
fffff802`b88ac786 0f826f5cfdff    jb      storport!StorPortResumeDevice+0xcb (fffff802`b88823fb)  Branch

storport!StorPortResumeDevice+0x2a45c:
fffff802`b88ac78c 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff802`b88ac790 ba12000000      mov     edx,12h
fffff802`b88ac795 0fb6c3          movzx   eax,bl
fffff802`b88ac798 440fb6c6        movzx   r8d,sil
fffff802`b88ac79c 89442428        mov     dword ptr [rsp+28h],eax
fffff802`b88ac7a0 4489442420      mov     dword ptr [rsp+20h],r8d
fffff802`b88ac7a5 4c8d058c930200  lea     r8,[storport!WPP_890ff0257e5a37fc61b1814295f1a13c_Traceguids (fffff802`b88d5b38)]
fffff802`b88ac7ac 440fb6cd        movzx   r9d,bpl
fffff802`b88ac7b0 e8afef0000      call    storport!WPP_SF_DDD (fffff802`b88bb764)
fffff802`b88ac7b5 90              nop
fffff802`b88ac7b6 e9405cfdff      jmp     storport!StorPortResumeDevice+0xcb (fffff802`b88823fb)  Branch

storport!StorPortResumeDevice+0x2a48b:
fffff802`b88ac7bb f0ff053e510300  lock inc dword ptr [storport!RaidUnloggedErrors (fffff802`b88e1900)]
fffff802`b88ac7c2 488b05e74a0300  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff802`b88e12b0)]
fffff802`b88ac7c9 480fbae00b      bt      rax,0Bh
fffff802`b88ac7ce 0f838d5cfdff    jae     storport!StorPortResumeDevice+0x131 (fffff802`b8882461)  Branch

storport!StorPortResumeDevice+0x2a4a4:
fffff802`b88ac7d4 4c8b442468      mov     r8,qword ptr [rsp+68h]
fffff802`b88ac7d9 33c0            xor     eax,eax
fffff802`b88ac7db 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`b88ac7e0 41b985020000    mov     r9d,285h
fffff802`b88ac7e6 4c897c2428      mov     qword ptr [rsp+28h],r15
fffff802`b88ac7eb 488bcf          mov     rcx,rdi
fffff802`b88ac7ee 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff802`b88ac7f3 8d5016          lea     edx,[rax+16h]
fffff802`b88ac7f6 e8f95dfdff      call    storport!DbgLogRequest (fffff802`b88825f4)
fffff802`b88ac7fb 90              nop
fffff802`b88ac7fc e9605cfdff      jmp     storport!StorPortResumeDevice+0x131 (fffff802`b8882461)  Branch
