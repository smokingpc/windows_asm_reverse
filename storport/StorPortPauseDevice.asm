0: kd> uf storport!StorPortPauseDevice
storport!StorPortPauseDevice:
fffff802`b88821b0 4c8bdc          mov     r11,rsp
fffff802`b88821b3 49895b10        mov     qword ptr [r11+10h],rbx
fffff802`b88821b7 49896b18        mov     qword ptr [r11+18h],rbp
fffff802`b88821bb 49897320        mov     qword ptr [r11+20h],rsi
fffff802`b88821bf 57              push    rdi
fffff802`b88821c0 4154            push    r12
fffff802`b88821c2 4155            push    r13
fffff802`b88821c4 4156            push    r14
fffff802`b88821c6 4157            push    r15
fffff802`b88821c8 4883ec60        sub     rsp,60h
fffff802`b88821cc 448ba424b0000000 mov     r12d,dword ptr [rsp+0B0h]
fffff802`b88821d4 33c0            xor     eax,eax
fffff802`b88821d6 498943c8        mov     qword ptr [r11-38h],rax
fffff802`b88821da 418af9          mov     dil,r9b
fffff802`b88821dd 488b41f0        mov     rax,qword ptr [rcx-10h]
fffff802`b88821e1 458af0          mov     r14b,r8b
fffff802`b88821e4 448afa          mov     r15b,dl
fffff802`b88821e7 488bd9          mov     rbx,rcx
fffff802`b88821ea 488b30          mov     rsi,qword ptr [rax]
fffff802`b88821ed 488b05bcf00500  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff802`b88e12b0)]
fffff802`b88821f4 480fbae009      bt      rax,9
fffff802`b88821f9 733e            jae     storport!StorPortPauseDevice+0x89 (fffff802`b8882239)  Branch

storport!StorPortPauseDevice+0x4b:
fffff802`b88821fb 0fb6d2          movzx   edx,dl
fffff802`b88821fe 488bce          mov     rcx,rsi
fffff802`b8882201 c1e208          shl     edx,8
fffff802`b8882204 410fb6c0        movzx   eax,r8b
fffff802`b8882208 4c8b842488000000 mov     r8,qword ptr [rsp+88h]
fffff802`b8882210 0bd0            or      edx,eax
fffff802`b8882212 c1e208          shl     edx,8
fffff802`b8882215 410fb6c1        movzx   eax,r9b
fffff802`b8882219 4c8bce          mov     r9,rsi
fffff802`b888221c 480bd0          or      rdx,rax
fffff802`b888221f 498b43c8        mov     rax,qword ptr [r11-38h]
fffff802`b8882223 498943a8        mov     qword ptr [r11-58h],rax
fffff802`b8882227 498953a0        mov     qword ptr [r11-60h],rdx
fffff802`b888222b ba10000000      mov     edx,10h
fffff802`b8882230 4d896398        mov     qword ptr [r11-68h],r12
fffff802`b8882234 e8bb030000      call    storport!DbgLogRequest (fffff802`b88825f4)

storport!StorPortPauseDevice+0x89:
fffff802`b8882239 4533ed          xor     r13d,r13d
fffff802`b888223c b9ff000000      mov     ecx,0FFh
fffff802`b8882241 4885f6          test    rsi,rsi
fffff802`b8882244 7403            je      storport!StorPortPauseDevice+0x99 (fffff802`b8882249)  Branch

storport!StorPortPauseDevice+0x96:
fffff802`b8882246 8b4e38          mov     ecx,dword ptr [rsi+38h]

storport!StorPortPauseDevice+0x99:
fffff802`b8882249 8a0591f50500    mov     al,byte ptr [storport!Microsoft_Windows_StorPortEnableBits (fffff802`b88e17e0)]
fffff802`b888224f a804            test    al,4
fffff802`b8882251 0f8505a40200    jne     storport!StorPortPauseDevice+0x2a4ac (fffff802`b88ac65c)  Branch

storport!StorPortPauseDevice+0xa7:
fffff802`b8882257 4885f6          test    rsi,rsi
fffff802`b888225a 0f84bf000000    je      storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch

storport!StorPortPauseDevice+0xb0:
fffff802`b8882260 4488bc2490000000 mov     byte ptr [rsp+90h],r15b
fffff802`b8882268 488bce          mov     rcx,rsi
fffff802`b888226b 4488b42491000000 mov     byte ptr [rsp+91h],r14b
fffff802`b8882273 4088bc2492000000 mov     byte ptr [rsp+92h],dil
fffff802`b888227b 8b9c2490000000  mov     ebx,dword ptr [rsp+90h]
fffff802`b8882282 8bd3            mov     edx,ebx
fffff802`b8882284 e86b9b0000      call    storport!RaidAdapterFindUnit (fffff802`b888bdf4)
fffff802`b8882289 488be8          mov     rbp,rax
fffff802`b888228c 4885c0          test    rax,rax
fffff802`b888228f 0f84eda30200    je      storport!StorPortPauseDevice+0x2a4d2 (fffff802`b88ac682)  Branch

storport!StorPortPauseDevice+0xe5:
fffff802`b8882295 ff8048080000    inc     dword ptr [rax+848h]
fffff802`b888229b 488b0d5eed0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff802`b88e1000)]
fffff802`b88822a2 488d0557ed0500  lea     rax,[storport!WPP_GLOBAL_Control (fffff802`b88e1000)]
fffff802`b88822a9 483bc8          cmp     rcx,rax
fffff802`b88822ac 740b            je      storport!StorPortPauseDevice+0x109 (fffff802`b88822b9)  Branch

storport!StorPortPauseDevice+0xfe:
fffff802`b88822ae 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff802`b88822b1 a820            test    al,20h
fffff802`b88822b3 0f8525a40200    jne     storport!StorPortPauseDevice+0x2a52e (fffff802`b88ac6de)  Branch

storport!StorPortPauseDevice+0x109:
fffff802`b88822b9 b904200708      mov     ecx,8072004h
fffff802`b88822be 488dbd10050000  lea     rdi,[rbp+510h]
fffff802`b88822c5 8d4101          lea     eax,[rcx+1]
fffff802`b88822c8 f00fb14f10      lock cmpxchg dword ptr [rdi+10h],ecx
fffff802`b88822cd 490f45fd        cmovne  rdi,r13
fffff802`b88822d1 4885ff          test    rdi,rdi
fffff802`b88822d4 0f843ea40200    je      storport!StorPortPauseDevice+0x2a568 (fffff802`b88ac718)  Branch

storport!StorPortPauseDevice+0x12a:
fffff802`b88822da 488bcd          mov     rcx,rbp
fffff802`b88822dd c7472005000000  mov     dword ptr [rdi+20h],5
fffff802`b88822e4 895f24          mov     dword ptr [rdi+24h],ebx
fffff802`b88822e7 44896728        mov     dword ptr [rdi+28h],r12d
fffff802`b88822eb e8b8010000      call    storport!RaidPauseUnitQueue (fffff802`b88824a8)
fffff802`b88822f0 488d8e80040000  lea     rcx,[rsi+480h]
fffff802`b88822f7 488bd7          mov     rdx,rdi
fffff802`b88822fa e86d010000      call    storport!RaidQueueDeferredItem (fffff802`b888246c)
fffff802`b88822ff b001            mov     al,1

storport!StorPortPauseDevice+0x151:
fffff802`b8882301 4c8d5c2460      lea     r11,[rsp+60h]
fffff802`b8882306 498b5b38        mov     rbx,qword ptr [r11+38h]
fffff802`b888230a 498b6b40        mov     rbp,qword ptr [r11+40h]
fffff802`b888230e 498b7348        mov     rsi,qword ptr [r11+48h]
fffff802`b8882312 498be3          mov     rsp,r11
fffff802`b8882315 415f            pop     r15
fffff802`b8882317 415e            pop     r14
fffff802`b8882319 415d            pop     r13
fffff802`b888231b 415c            pop     r12
fffff802`b888231d 5f              pop     rdi
fffff802`b888231e c3              ret

storport!StorPortPauseDevice+0x16f:
fffff802`b888231f 32c0            xor     al,al
fffff802`b8882321 ebde            jmp     storport!StorPortPauseDevice+0x151 (fffff802`b8882301)  Branch

storport!StorPortPauseDevice+0x2a4ac:
fffff802`b88ac65c 40887c2440      mov     byte ptr [rsp+40h],dil
fffff802`b88ac661 4c8bcb          mov     r9,rbx
fffff802`b88ac664 4488742438      mov     byte ptr [rsp+38h],r14b
fffff802`b88ac669 44887c2430      mov     byte ptr [rsp+30h],r15b
fffff802`b88ac66e 894c2428        mov     dword ptr [rsp+28h],ecx
fffff802`b88ac672 4489642420      mov     dword ptr [rsp+20h],r12d
fffff802`b88ac677 e89c100100      call    storport!McTemplateK0pqquuu (fffff802`b88bd718)
fffff802`b88ac67c 90              nop
fffff802`b88ac67d e9d55bfdff      jmp     storport!StorPortPauseDevice+0xa7 (fffff802`b8882257)  Branch

storport!StorPortPauseDevice+0x2a4d2:
fffff802`b88ac682 488b0d77490300  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff802`b88e1000)]
fffff802`b88ac689 488d0570490300  lea     rax,[storport!WPP_GLOBAL_Control (fffff802`b88e1000)]
fffff802`b88ac690 483bc8          cmp     rcx,rax
fffff802`b88ac693 0f84865cfdff    je      storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch

storport!StorPortPauseDevice+0x2a4e9:
fffff802`b88ac699 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff802`b88ac69c a820            test    al,20h
fffff802`b88ac69e 0f847b5cfdff    je      storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch

storport!StorPortPauseDevice+0x2a4f4:
fffff802`b88ac6a4 80792903        cmp     byte ptr [rcx+29h],3
fffff802`b88ac6a8 0f82715cfdff    jb      storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch

storport!StorPortPauseDevice+0x2a4fe:
fffff802`b88ac6ae 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff802`b88ac6b2 ba10000000      mov     edx,10h
fffff802`b88ac6b7 400fb6c7        movzx   eax,dil
fffff802`b88ac6bb 450fb6c6        movzx   r8d,r14b
fffff802`b88ac6bf 89442428        mov     dword ptr [rsp+28h],eax
fffff802`b88ac6c3 4489442420      mov     dword ptr [rsp+20h],r8d
fffff802`b88ac6c8 4c8d0569940200  lea     r8,[storport!WPP_890ff0257e5a37fc61b1814295f1a13c_Traceguids (fffff802`b88d5b38)]
fffff802`b88ac6cf 450fb6cf        movzx   r9d,r15b
fffff802`b88ac6d3 e88cf00000      call    storport!WPP_SF_DDD (fffff802`b88bb764)
fffff802`b88ac6d8 90              nop
fffff802`b88ac6d9 e9415cfdff      jmp     storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch

storport!StorPortPauseDevice+0x2a52e:
fffff802`b88ac6de 80792903        cmp     byte ptr [rcx+29h],3
fffff802`b88ac6e2 0f82d15bfdff    jb      storport!StorPortPauseDevice+0x109 (fffff802`b88822b9)  Branch

storport!StorPortPauseDevice+0x2a538:
fffff802`b88ac6e8 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff802`b88ac6ec ba11000000      mov     edx,11h
fffff802`b88ac6f1 400fb6c7        movzx   eax,dil
fffff802`b88ac6f5 450fb6c6        movzx   r8d,r14b
fffff802`b88ac6f9 89442428        mov     dword ptr [rsp+28h],eax
fffff802`b88ac6fd 4489442420      mov     dword ptr [rsp+20h],r8d
fffff802`b88ac702 4c8d052f940200  lea     r8,[storport!WPP_890ff0257e5a37fc61b1814295f1a13c_Traceguids (fffff802`b88d5b38)]
fffff802`b88ac709 450fb6cf        movzx   r9d,r15b
fffff802`b88ac70d e852f00000      call    storport!WPP_SF_DDD (fffff802`b88bb764)
fffff802`b88ac712 90              nop
fffff802`b88ac713 e9a15bfdff      jmp     storport!StorPortPauseDevice+0x109 (fffff802`b88822b9)  Branch

storport!StorPortPauseDevice+0x2a568:
fffff802`b88ac718 f0ff05e1510300  lock inc dword ptr [storport!RaidUnloggedErrors (fffff802`b88e1900)]
fffff802`b88ac71f 488b058a4b0300  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff802`b88e12b0)]
fffff802`b88ac726 480fbae00b      bt      rax,0Bh
fffff802`b88ac72b 0f83ee5bfdff    jae     storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch

storport!StorPortPauseDevice+0x2a581:
fffff802`b88ac731 4c8b842488000000 mov     r8,qword ptr [rsp+88h]
fffff802`b88ac739 33c0            xor     eax,eax
fffff802`b88ac73b 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`b88ac740 41b915020000    mov     r9d,215h
fffff802`b88ac746 4c896c2428      mov     qword ptr [rsp+28h],r13
fffff802`b88ac74b 488bce          mov     rcx,rsi
fffff802`b88ac74e 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff802`b88ac753 8d5016          lea     edx,[rax+16h]
fffff802`b88ac756 e8995efdff      call    storport!DbgLogRequest (fffff802`b88825f4)
fffff802`b88ac75b 90              nop
fffff802`b88ac75c e9be5bfdff      jmp     storport!StorPortPauseDevice+0x16f (fffff802`b888231f)  Branch
