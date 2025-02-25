
;RaidUnitSubmitIrpRequest(devext, IRP)

3: kd> uf storport!RaidUnitSubmitIrpRequest
storport!RaidUnitSubmitIrpRequest:
fffff804`3c1e91f0 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff804`3c1e91f5 55              push    rbp
fffff804`3c1e91f6 56              push    rsi
fffff804`3c1e91f7 57              push    rdi
fffff804`3c1e91f8 4154            push    r12
fffff804`3c1e91fa 4155            push    r13
fffff804`3c1e91fc 4156            push    r14
fffff804`3c1e91fe 4157            push    r15
fffff804`3c1e9200 488d6c24d9      lea     rbp,[rsp-27h]
fffff804`3c1e9205 4881ecd0000000  sub     rsp,0D0h
fffff804`3c1e920c 488b056d411000  mov     rax,qword ptr [storport!_security_cookie (fffff804`3c2ed380)]
fffff804`3c1e9213 4833c4          xor     rax,rsp
fffff804`3c1e9216 48894517        mov     qword ptr [rbp+17h],rax
fffff804`3c1e921a 8b5a30          mov     ebx,dword ptr [rdx+30h]
fffff804`3c1e921d 4533ed          xor     r13d,r13d
fffff804`3c1e9220 4c8bb2b8000000  mov     r14,qword ptr [rdx+0B8h]
fffff804`3c1e9227 0f57c0          xorps   xmm0,xmm0
fffff804`3c1e922a 4c896daf        mov     qword ptr [rbp-51h],r13
fffff804`3c1e922e 0f57c9          xorps   xmm1,xmm1
fffff804`3c1e9231 660f7f45b7      movdqa  xmmword ptr [rbp-49h],xmm0
fffff804`3c1e9236 488bfa          mov     rdi,rdx
fffff804`3c1e9239 660f7f4dc7      movdqa  xmmword ptr [rbp-39h],xmm1
fffff804`3c1e923e 488bf1          mov     rsi,rcx
fffff804`3c1e9241 660f7f45d7      movdqa  xmmword ptr [rbp-29h],xmm0
fffff804`3c1e9246 4c896d97        mov     qword ptr [rbp-69h],r13
fffff804`3c1e924a 4c896d9f        mov     qword ptr [rbp-61h],r13
fffff804`3c1e924e 0f114de7        movups  xmmword ptr [rbp-19h],xmm1
fffff804`3c1e9252 85db            test    ebx,ebx
fffff804`3c1e9254 0f8811030000    js      storport!RaidUnitSubmitIrpRequest+0x37b (fffff804`3c1e956b)  Branch

storport!RaidUnitSubmitIrpRequest+0x6a:
fffff804`3c1e925a 488d45e7        lea     rax,[rbp-19h]
fffff804`3c1e925e c745eb04000000  mov     dword ptr [rbp-15h],4
fffff804`3c1e9265 41bf01000000    mov     r15d,1
fffff804`3c1e926b 488945a7        mov     qword ptr [rbp-59h],rax
fffff804`3c1e926f 488d55a7        lea     rdx,[rbp-59h]                     ;RaUnitFillIrpData() filled structure
fffff804`3c1e9273 6644897de7      mov     word ptr [rbp-19h],r15w
fffff804`3c1e9278 488bcf          mov     rcx,rdi
fffff804`3c1e927b e8c0030000      call    storport!RaUnitFillIrpData (fffff804`3c1e9640)
fffff804`3c1e9280 488b45bf        mov     rax,qword ptr [rbp-41h]
fffff804`3c1e9284 0f57c0          xorps   xmm0,xmm0
fffff804`3c1e9287 0f1100          movups  xmmword ptr [rax],xmm0
fffff804`3c1e928a 0f114010        movups  xmmword ptr [rax+10h],xmm0
fffff804`3c1e928e 4c396f38        cmp     qword ptr [rdi+38h],r13
fffff804`3c1e9292 0f8504010000    jne     storport!RaidUnitSubmitIrpRequest+0x1ac (fffff804`3c1e939c)  Branch

storport!RaidUnitSubmitIrpRequest+0xa8:
fffff804`3c1e9298 488d559f        lea     rdx,[rbp-61h]
fffff804`3c1e929c 488bcf          mov     rcx,rdi
fffff804`3c1e929f 4c8b15c2f51000  mov     r10,qword ptr [storport!_imp_IoGetIoAttributionHandle (fffff804`3c2f8868)]
fffff804`3c1e92a6 e875e0416d      call    nt!IoGetIoAttributionHandle (fffff804`a9607320)
fffff804`3c1e92ab 85c0            test    eax,eax
fffff804`3c1e92ad 792d            jns     storport!RaidUnitSubmitIrpRequest+0xec (fffff804`3c1e92dc)  Branch

storport!RaidUnitSubmitIrpRequest+0xbf:
fffff804`3c1e92af 44382d84491000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff804`3c2edc3a)],r13b
fffff804`3c1e92b6 0f8487000000    je      storport!RaidUnitSubmitIrpRequest+0x153 (fffff804`3c1e9343)  Branch

storport!RaidUnitSubmitIrpRequest+0xcc:
fffff804`3c1e92bc 44382d8d421000  cmp     byte ptr [storport!UseQPCTime (fffff804`3c2ed550)],r13b

storport!RaidUnitSubmitIrpRequest+0xd3:
fffff804`3c1e92c3 0f8494000000    je      storport!RaidUnitSubmitIrpRequest+0x16d (fffff804`3c1e935d)  Branch

storport!RaidUnitSubmitIrpRequest+0xd9:
fffff804`3c1e92c9 33c9            xor     ecx,ecx
fffff804`3c1e92cb 4c8b1536ed1000  mov     r10,qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff804`3c2f8008)]
fffff804`3c1e92d2 e899e12f6d      call    nt!KeQueryPerformanceCounter (fffff804`a94e7470)
fffff804`3c1e92d7 e98d000000      jmp     storport!RaidUnitSubmitIrpRequest+0x179 (fffff804`3c1e9369)  Branch

storport!RaidUnitSubmitIrpRequest+0xec:
fffff804`3c1e92dc 488d4d97        lea     rcx,[rbp-69h]
fffff804`3c1e92e0 4c8b15e9f41000  mov     r10,qword ptr [storport!_imp_KeQueryUnbiasedInterruptTimePrecise (fffff804`3c2f87d0)]
fffff804`3c1e92e7 e844a62b6d      call    nt!KeQueryUnbiasedInterruptTimePrecise (fffff804`a94a3930)
fffff804`3c1e92ec 488b8fb8000000  mov     rcx,qword ptr [rdi+0B8h]
fffff804`3c1e92f3 0f57c0          xorps   xmm0,xmm0
fffff804`3c1e92f6 f30f7f45fb      movdqu  xmmword ptr [rbp-5],xmm0
fffff804`3c1e92fb 48894597        mov     qword ptr [rbp-69h],rax
fffff804`3c1e92ff 44896d0b        mov     dword ptr [rbp+0Bh],r13d
fffff804`3c1e9303 44897df7        mov     dword ptr [rbp-9],r15d
fffff804`3c1e9307 0fb611          movzx   edx,byte ptr [rcx]
fffff804`3c1e930a 660f7ec1        movd    ecx,xmm0
fffff804`3c1e930e 4889450f        mov     qword ptr [rbp+0Fh],rax
fffff804`3c1e9312 81e100ffffff    and     ecx,0FFFFFF00h
fffff804`3c1e9318 0bca            or      ecx,edx
fffff804`3c1e931a 488d55f7        lea     rdx,[rbp-9]
fffff804`3c1e931e 0fbae908        bts     ecx,8
fffff804`3c1e9322 894dfb          mov     dword ptr [rbp-5],ecx
fffff804`3c1e9325 488b4d9f        mov     rcx,qword ptr [rbp-61h]
fffff804`3c1e9329 4c8b15a8f41000  mov     r10,qword ptr [storport!_imp_IoRecordIoAttribution (fffff804`3c2f87d8)]
fffff804`3c1e9330 e82b1c366d      call    nt!IoRecordIoAttribution (fffff804`a954af60)
fffff804`3c1e9335 488b4620        mov     rax,qword ptr [rsi+20h]
fffff804`3c1e9339 f0ff400c        lock inc dword ptr [rax+0Ch]
fffff804`3c1e933d 488b4597        mov     rax,qword ptr [rbp-69h]
fffff804`3c1e9341 eb2a            jmp     storport!RaidUnitSubmitIrpRequest+0x17d (fffff804`3c1e936d)  Branch

storport!RaidUnitSubmitIrpRequest+0x153:
fffff804`3c1e9343 44392d46411000  cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceEnabled (fffff804`3c2ed490)],r13d
fffff804`3c1e934a 0f843e020000    je      storport!RaidUnitSubmitIrpRequest+0x39e (fffff804`3c1e958e)  Branch

storport!RaidUnitSubmitIrpRequest+0x160:
fffff804`3c1e9350 44382df9411000  cmp     byte ptr [storport!UseQPCTime (fffff804`3c2ed550)],r13b
fffff804`3c1e9357 0f8502020000    jne     storport!RaidUnitSubmitIrpRequest+0x36f (fffff804`3c1e955f)  Branch

storport!RaidUnitSubmitIrpRequest+0x16d:
fffff804`3c1e935d 4c8b157ced1000  mov     r10,qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff804`3c2f80e0)]
fffff804`3c1e9364 e8b722426d      call    nt!KeQueryUnbiasedInterruptTime (fffff804`a960b620)

storport!RaidUnitSubmitIrpRequest+0x179:
fffff804`3c1e9369 48894597        mov     qword ptr [rbp-69h],rax

storport!RaidUnitSubmitIrpRequest+0x17d:
fffff804`3c1e936d 8987a8000000    mov     dword ptr [rdi+0A8h],eax
fffff804`3c1e9373 48c1e820        shr     rax,20h
fffff804`3c1e9377 44382dbc481000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff804`3c2edc3a)],r13b
fffff804`3c1e937e 8987ac000000    mov     dword ptr [rdi+0ACh],eax
fffff804`3c1e9384 0f8518010000    jne     storport!RaidUnitSubmitIrpRequest+0x2b2 (fffff804`3c1e94a2)  Branch

storport!RaidUnitSubmitIrpRequest+0x19a:
fffff804`3c1e938a 488b0587401000  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff804`3c2ed418)]
fffff804`3c1e9391 480fbae00d      bt      rax,0Dh
fffff804`3c1e9396 0f820f020000    jb      storport!RaidUnitSubmitIrpRequest+0x3bb (fffff804`3c1e95ab)  Branch

storport!RaidUnitSubmitIrpRequest+0x1ac:
fffff804`3c1e939c f686ca01000002  test    byte ptr [rsi+1CAh],2
fffff804`3c1e93a3 0f85a7010000    jne     storport!RaidUnitSubmitIrpRequest+0x360 (fffff804`3c1e9550)  Branch

storport!RaidUnitSubmitIrpRequest+0x1b9:
fffff804`3c1e93a9 ba1e000000      mov     edx,1Eh
fffff804`3c1e93ae 488bce          mov     rcx,rsi
fffff804`3c1e93b1 e83af0ffff      call    storport!RaidIsUnitControlSupported (fffff804`3c1e83f0)
fffff804`3c1e93b6 84c0            test    al,al
fffff804`3c1e93b8 0f8477010000    je      storport!RaidUnitSubmitIrpRequest+0x345 (fffff804`3c1e9535)  Branch

storport!RaidUnitSubmitIrpRequest+0x1ce:
fffff804`3c1e93be 410fb60e        movzx   ecx,byte ptr [r14]
fffff804`3c1e93c2 83e903          sub     ecx,3
fffff804`3c1e93c5 0f8406010000    je      storport!RaidUnitSubmitIrpRequest+0x2e1 (fffff804`3c1e94d1)  Branch

storport!RaidUnitSubmitIrpRequest+0x1db:
fffff804`3c1e93cb 413bcf          cmp     ecx,r15d
fffff804`3c1e93ce 0f8561010000    jne     storport!RaidUnitSubmitIrpRequest+0x345 (fffff804`3c1e9535)  Branch

storport!RaidUnitSubmitIrpRequest+0x1e4:
fffff804`3c1e93d4 488b4618        mov     rax,qword ptr [rsi+18h]
fffff804`3c1e93d8 4c8b4f08        mov     r9,qword ptr [rdi+8]
fffff804`3c1e93dc 480538030000    add     rax,338h
fffff804`3c1e93e2 4d85c9          test    r9,r9
fffff804`3c1e93e5 743b            je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x1f7:
fffff804`3c1e93e7 4885c0          test    rax,rax
fffff804`3c1e93ea 7436            je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x1fc:
fffff804`3c1e93ec 488b08          mov     rcx,qword ptr [rax]
fffff804`3c1e93ef 4885c9          test    rcx,rcx
fffff804`3c1e93f2 742e            je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x204:
fffff804`3c1e93f4 488b5108        mov     rdx,qword ptr [rcx+8]
fffff804`3c1e93f8 4885d2          test    rdx,rdx
fffff804`3c1e93fb 7425            je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x20d:
fffff804`3c1e93fd 83781c03        cmp     dword ptr [rax+1Ch],3
fffff804`3c1e9401 0f8cf0010000    jl      storport!RaidUnitSubmitIrpRequest+0x407 (fffff804`3c1e95f7)  Branch

storport!RaidUnitSubmitIrpRequest+0x217:
fffff804`3c1e9407 488b82f0000000  mov     rax,qword ptr [rdx+0F0h]
fffff804`3c1e940e 4885c0          test    rax,rax
fffff804`3c1e9411 0f84e0010000    je      storport!RaidUnitSubmitIrpRequest+0x407 (fffff804`3c1e95f7)  Branch

storport!RaidUnitSubmitIrpRequest+0x227:
fffff804`3c1e9417 4533c0          xor     r8d,r8d
fffff804`3c1e941a 498bd1          mov     rdx,r9
fffff804`3c1e941d e85e23b96d      call    nt!KscpCfgDispatchUserCallTargetEsSmep (fffff804`a9d7b780)

storport!RaidUnitSubmitIrpRequest+0x232:
fffff804`3c1e9422 488b4618        mov     rax,qword ptr [rsi+18h]
fffff804`3c1e9426 8b08            mov     ecx,dword ptr [rax]
fffff804`3c1e9428 81f952544441    cmp     ecx,41445452h
fffff804`3c1e942e 0f85e7010000    jne     storport!RaidUnitSubmitIrpRequest+0x42b (fffff804`3c1e961b)  Branch

storport!RaidUnitSubmitIrpRequest+0x244:
fffff804`3c1e9434 488d8868020000  lea     rcx,[rax+268h]
fffff804`3c1e943b 480560020000    add     rax,260h

storport!RaidUnitSubmitIrpRequest+0x251:
fffff804`3c1e9441 488b00          mov     rax,qword ptr [rax]   ;rax = _RAID_MINIPORT+0xe8 ptr, 
fffff804`3c1e9444 488b80c8000000  mov     rax,qword ptr [rax+0C8h]  ;get HwUnitControl callback ptr
fffff804`3c1e944b 4885c0          test    rax,rax
fffff804`3c1e944e 0f84e1000000    je      storport!RaidUnitSubmitIrpRequest+0x345 (fffff804`3c1e9535)  Branch

storport!RaidUnitSubmitIrpRequest+0x264:
fffff804`3c1e9454 488b09          mov     rcx,qword ptr [rcx]   ;
fffff804`3c1e9457 4c8d45a7        lea     r8,[rbp-59h]
fffff804`3c1e945b 4883c110        add     rcx,10h
fffff804`3c1e945f ba1e000000      mov     edx,1Eh
fffff804`3c1e9464 e81723b96d      call    nt!KscpCfgDispatchUserCallTargetEsSmep (fffff804`a9d7b780)    ;similar as guard_call , jmp to rax
fffff804`3c1e9469 f7d8            neg     eax
fffff804`3c1e946b 1bc0            sbb     eax,eax
fffff804`3c1e946d 25010000c0      and     eax,0C0000001h
fffff804`3c1e9472 85c0            test    eax,eax
fffff804`3c1e9474 0f85c0000000    jne     storport!RaidUnitSubmitIrpRequest+0x34a (fffff804`3c1e953a)  Branch

storport!RaidUnitSubmitIrpRequest+0x28a:
fffff804`3c1e947a 488b4d17        mov     rcx,qword ptr [rbp+17h]
fffff804`3c1e947e 4833cc          xor     rcx,rsp
fffff804`3c1e9481 e8ca690d00      call    storport!_security_check_cookie (fffff804`3c2bfe50)
fffff804`3c1e9486 488b9c2420010000 mov     rbx,qword ptr [rsp+120h]
fffff804`3c1e948e 4881c4d0000000  add     rsp,0D0h
fffff804`3c1e9495 415f            pop     r15
fffff804`3c1e9497 415e            pop     r14
fffff804`3c1e9499 415d            pop     r13
fffff804`3c1e949b 415c            pop     r12
fffff804`3c1e949d 5f              pop     rdi
fffff804`3c1e949e 5e              pop     rsi
fffff804`3c1e949f 5d              pop     rbp
fffff804`3c1e94a0 c3              ret

storport!RaidUnitSubmitIrpRequest+0x2b2:
fffff804`3c1e94a2 0fb605b84d1000  movzx   eax,byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x1 (fffff804`3c2ee261)]
fffff804`3c1e94a9 a808            test    al,8
fffff804`3c1e94ab 7508            jne     storport!RaidUnitSubmitIrpRequest+0x2c5 (fffff804`3c1e94b5)  Branch

storport!RaidUnitSubmitIrpRequest+0x2bd:
fffff804`3c1e94ad a810            test    al,10h
fffff804`3c1e94af 0f84e1000000    je      storport!RaidUnitSubmitIrpRequest+0x3a6 (fffff804`3c1e9596)  Branch

storport!RaidUnitSubmitIrpRequest+0x2c5:
fffff804`3c1e94b5 410fb606        movzx   eax,byte ptr [r14]
fffff804`3c1e94b9 2c03            sub     al,3
fffff804`3c1e94bb 413ac7          cmp     al,r15b
fffff804`3c1e94be 0f87c6feffff    ja      storport!RaidUnitSubmitIrpRequest+0x19a (fffff804`3c1e938a)  Branch

storport!RaidUnitSubmitIrpRequest+0x2d4:
fffff804`3c1e94c4 488bcf          mov     rcx,rdi
fffff804`3c1e94c7 e85c83fdff      call    storport!StorEtwIORequestDispatch (fffff804`3c1c1828)
fffff804`3c1e94cc e9b9feffff      jmp     storport!RaidUnitSubmitIrpRequest+0x19a (fffff804`3c1e938a)  Branch

storport!RaidUnitSubmitIrpRequest+0x2e1:
fffff804`3c1e94d1 488b4618        mov     rax,qword ptr [rsi+18h]
fffff804`3c1e94d5 4c8b4f08        mov     r9,qword ptr [rdi+8]
fffff804`3c1e94d9 480538030000    add     rax,338h
fffff804`3c1e94df 4d85c9          test    r9,r9
fffff804`3c1e94e2 0f843affffff    je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x2f8:
fffff804`3c1e94e8 4885c0          test    rax,rax
fffff804`3c1e94eb 0f8431ffffff    je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x301:
fffff804`3c1e94f1 488b08          mov     rcx,qword ptr [rax]
fffff804`3c1e94f4 4885c9          test    rcx,rcx
fffff804`3c1e94f7 0f8425ffffff    je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x30d:
fffff804`3c1e94fd 488b5108        mov     rdx,qword ptr [rcx+8]
fffff804`3c1e9501 4885d2          test    rdx,rdx
fffff804`3c1e9504 0f8418ffffff    je      storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x31a:
fffff804`3c1e950a 83781c03        cmp     dword ptr [rax+1Ch],3
fffff804`3c1e950e 0f8ceb000000    jl      storport!RaidUnitSubmitIrpRequest+0x40f (fffff804`3c1e95ff)  Branch

storport!RaidUnitSubmitIrpRequest+0x324:
fffff804`3c1e9514 488b82f0000000  mov     rax,qword ptr [rdx+0F0h]
fffff804`3c1e951b 4885c0          test    rax,rax
fffff804`3c1e951e 0f84db000000    je      storport!RaidUnitSubmitIrpRequest+0x40f (fffff804`3c1e95ff)  Branch

storport!RaidUnitSubmitIrpRequest+0x334:
fffff804`3c1e9524 450fb6c7        movzx   r8d,r15b
fffff804`3c1e9528 498bd1          mov     rdx,r9
fffff804`3c1e952b e85022b96d      call    nt!KscpCfgDispatchUserCallTargetEsSmep (fffff804`a9d7b780)
fffff804`3c1e9530 e9edfeffff      jmp     storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x345:
fffff804`3c1e9535 b8bb0000c0      mov     eax,0C00000BBh

storport!RaidUnitSubmitIrpRequest+0x34a:
fffff804`3c1e953a 8bd3            mov     edx,ebx
fffff804`3c1e953c 894730          mov     dword ptr [rdi+30h],eax
fffff804`3c1e953f 488bcf          mov     rcx,rdi
fffff804`3c1e9542 4c896f38        mov     qword ptr [rdi+38h],r13
fffff804`3c1e9546 e89516feff      call    storport!RaidUnitCompleteIrpRequest (fffff804`3c1cabe0)
fffff804`3c1e954b e92affffff      jmp     storport!RaidUnitSubmitIrpRequest+0x28a (fffff804`3c1e947a)  Branch

storport!RaidUnitSubmitIrpRequest+0x360:
fffff804`3c1e9550 f048ff86a8080000 lock inc qword ptr [rsi+8A8h]
fffff804`3c1e9558 b80a0500c0      mov     eax,0C000050Ah
fffff804`3c1e955d ebdb            jmp     storport!RaidUnitSubmitIrpRequest+0x34a (fffff804`3c1e953a)  Branch

storport!RaidUnitSubmitIrpRequest+0x36f:
fffff804`3c1e955f 44392d2e3f1000  cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceHighResolutionTimer (fffff804`3c2ed494)],r13d
fffff804`3c1e9566 e958fdffff      jmp     storport!RaidUnitSubmitIrpRequest+0xd3 (fffff804`3c1e92c3)  Branch

storport!RaidUnitSubmitIrpRequest+0x37b:
fffff804`3c1e956b 4584c0          test    r8b,r8b
fffff804`3c1e956e 0f85e6fcffff    jne     storport!RaidUnitSubmitIrpRequest+0x6a (fffff804`3c1e925a)  Branch

storport!RaidUnitSubmitIrpRequest+0x384:
fffff804`3c1e9574 410fb606        movzx   eax,byte ptr [r14]
fffff804`3c1e9578 458bfd          mov     r15d,r13d
fffff804`3c1e957b 2c03            sub     al,3
fffff804`3c1e957d 3c01            cmp     al,1
fffff804`3c1e957f 0f8735240e00    ja      storport!RaidUnitSubmitIrpRequest+0xe27ca (fffff804`3c2cb9ba)  Branch

storport!RaidUnitSubmitIrpRequest+0x395:
fffff804`3c1e9585 458b7e08        mov     r15d,dword ptr [r14+8]
fffff804`3c1e9589 e92c240e00      jmp     storport!RaidUnitSubmitIrpRequest+0xe27ca (fffff804`3c2cb9ba)  Branch

storport!RaidUnitSubmitIrpRequest+0x39e:
fffff804`3c1e958e 498bc5          mov     rax,r13
fffff804`3c1e9591 e9d3fdffff      jmp     storport!RaidUnitSubmitIrpRequest+0x179 (fffff804`3c1e9369)  Branch

storport!RaidUnitSubmitIrpRequest+0x3a6:
fffff804`3c1e9596 a802            test    al,2
fffff804`3c1e9598 0f8517ffffff    jne     storport!RaidUnitSubmitIrpRequest+0x2c5 (fffff804`3c1e94b5)  Branch

storport!RaidUnitSubmitIrpRequest+0x3ae:
fffff804`3c1e959e a804            test    al,4
fffff804`3c1e95a0 0f84e4fdffff    je      storport!RaidUnitSubmitIrpRequest+0x19a (fffff804`3c1e938a)  Branch

storport!RaidUnitSubmitIrpRequest+0x3b6:
fffff804`3c1e95a6 e90affffff      jmp     storport!RaidUnitSubmitIrpRequest+0x2c5 (fffff804`3c1e94b5)  Branch

storport!RaidUnitSubmitIrpRequest+0x3bb:
fffff804`3c1e95ab 8b4e68          mov     ecx,dword ptr [rsi+68h]
fffff804`3c1e95ae 4c8bc7          mov     r8,rdi
fffff804`3c1e95b1 8bc1            mov     eax,ecx
fffff804`3c1e95b3 ba31000000      mov     edx,31h
fffff804`3c1e95b8 c1e808          shr     eax,8
fffff804`3c1e95bb 440fb6c8        movzx   r9d,al
fffff804`3c1e95bf 0fb6c1          movzx   eax,cl
fffff804`3c1e95c2 48c1e008        shl     rax,8
fffff804`3c1e95c6 4c0bc8          or      r9,rax
fffff804`3c1e95c9 c1e910          shr     ecx,10h
fffff804`3c1e95cc 0fb6c1          movzx   eax,cl
fffff804`3c1e95cf 488b4e18        mov     rcx,qword ptr [rsi+18h]
fffff804`3c1e95d3 49c1e108        shl     r9,8
fffff804`3c1e95d7 4c0bc8          or      r9,rax
fffff804`3c1e95da 488b4597        mov     rax,qword ptr [rbp-69h]
fffff804`3c1e95de 4889442430      mov     qword ptr [rsp+30h],rax
fffff804`3c1e95e3 4c896c2428      mov     qword ptr [rsp+28h],r13
fffff804`3c1e95e8 4c896c2420      mov     qword ptr [rsp+20h],r13
fffff804`3c1e95ed e8ce9d0000      call    storport!DbgLogRequest (fffff804`3c1f33c0)
fffff804`3c1e95f2 e9a5fdffff      jmp     storport!RaidUnitSubmitIrpRequest+0x1ac (fffff804`3c1e939c)  Branch

storport!RaidUnitSubmitIrpRequest+0x407:
fffff804`3c1e95f7 450fb6c7        movzx   r8d,r15b
fffff804`3c1e95fb 33d2            xor     edx,edx
fffff804`3c1e95fd eb08            jmp     storport!RaidUnitSubmitIrpRequest+0x417 (fffff804`3c1e9607)  Branch

storport!RaidUnitSubmitIrpRequest+0x40f:
fffff804`3c1e95ff 450fb6c7        movzx   r8d,r15b
fffff804`3c1e9603 410fb6d7        movzx   edx,r15b

storport!RaidUnitSubmitIrpRequest+0x417:
fffff804`3c1e9607 498bc9          mov     rcx,r9
fffff804`3c1e960a 4c8b158feb1000  mov     r10,qword ptr [storport!_imp_KeFlushIoBuffers (fffff804`3c2f81a0)]
fffff804`3c1e9611 e8ea8e3c6d      call    nt!KeFlushIoBuffers (fffff804`a95b2500)
fffff804`3c1e9616 e907feffff      jmp     storport!RaidUnitSubmitIrpRequest+0x232 (fffff804`3c1e9422)  Branch

storport!RaidUnitSubmitIrpRequest+0x42b:
fffff804`3c1e961b 81f94441564e    cmp     ecx,4E564144h
fffff804`3c1e9621 0f8562240e00    jne     storport!RaidUnitSubmitIrpRequest+0xe2899 (fffff804`3c2cba89)  Branch

storport!RaidUnitSubmitIrpRequest+0x437:
fffff804`3c1e9627 488d8898010000  lea     rcx,[rax+198h]
fffff804`3c1e962e 480590010000    add     rax,190h
fffff804`3c1e9634 e908feffff      jmp     storport!RaidUnitSubmitIrpRequest+0x251 (fffff804`3c1e9441)  Branch

storport!RaidUnitSubmitIrpRequest+0xe27ca:
fffff804`3c2cb9ba 488b4920        mov     rcx,qword ptr [rcx+20h]
fffff804`3c2cb9be 4883c118        add     rcx,18h
fffff804`3c2cb9c2 4c8b1597c60200  mov     r10,qword ptr [storport!_imp_KeAcquireSpinLockRaiseToDpc (fffff804`3c2f8060)]
fffff804`3c2cb9c9 e8b2d6136d      call    nt!KeAcquireSpinLockRaiseToDpc (fffff804`a9409080)
fffff804`3c2cb9ce 488b5620        mov     rdx,qword ptr [rsi+20h]
fffff804`3c2cb9d2 440fb6e0        movzx   r12d,al
fffff804`3c2cb9d6 488d4a30        lea     rcx,[rdx+30h]
fffff804`3c2cb9da 483909          cmp     qword ptr [rcx],rcx
fffff804`3c2cb9dd 753c            jne     storport!RaidUnitSubmitIrpRequest+0xe282b (fffff804`3c2cba1b)  Branch

storport!RaidUnitSubmitIrpRequest+0xe27ef:
fffff804`3c2cb9df 8b4204          mov     eax,dword ptr [rdx+4]
fffff804`3c2cb9e2 83f808          cmp     eax,8
fffff804`3c2cb9e5 7d34            jge     storport!RaidUnitSubmitIrpRequest+0xe282b (fffff804`3c2cba1b)  Branch

storport!RaidUnitSubmitIrpRequest+0xe27f7:
fffff804`3c2cb9e7 817a0800000400  cmp     dword ptr [rdx+8],40000h
fffff804`3c2cb9ee 7d2b            jge     storport!RaidUnitSubmitIrpRequest+0xe282b (fffff804`3c2cba1b)  Branch

storport!RaidUnitSubmitIrpRequest+0xe2800:
fffff804`3c2cb9f0 ffc0            inc     eax
fffff804`3c2cb9f2 894204          mov     dword ptr [rdx+4],eax
fffff804`3c2cb9f5 410fb6d4        movzx   edx,r12b
fffff804`3c2cb9f9 488b4620        mov     rax,qword ptr [rsi+20h]
fffff804`3c2cb9fd 44017808        add     dword ptr [rax+8],r15d
fffff804`3c2cba01 488b4e20        mov     rcx,qword ptr [rsi+20h]
fffff804`3c2cba05 4883c118        add     rcx,18h
fffff804`3c2cba09 4c8b15a8c70200  mov     r10,qword ptr [storport!_imp_KeReleaseSpinLock (fffff804`3c2f81b8)]
fffff804`3c2cba10 e82bcc136d      call    nt!KeReleaseSpinLock (fffff804`a9408640)
fffff804`3c2cba15 90              nop
fffff804`3c2cba16 e93fd8f1ff      jmp     storport!RaidUnitSubmitIrpRequest+0x6a (fffff804`3c1e925a)  Branch

storport!RaidUnitSubmitIrpRequest+0xe282b:
fffff804`3c2cba1b 488d559f        lea     rdx,[rbp-61h]
fffff804`3c2cba1f 488bcf          mov     rcx,rdi
fffff804`3c2cba22 4c8b153fce0200  mov     r10,qword ptr [storport!_imp_IoGetIoAttributionHandle (fffff804`3c2f8868)]
fffff804`3c2cba29 e8f2b8336d      call    nt!IoGetIoAttributionHandle (fffff804`a9607320)
fffff804`3c2cba2e 85c0            test    eax,eax
fffff804`3c2cba30 780c            js      storport!RaidUnitSubmitIrpRequest+0xe284e (fffff804`3c2cba3e)  Branch

storport!RaidUnitSubmitIrpRequest+0xe2842:
fffff804`3c2cba32 4c8b459f        mov     r8,qword ptr [rbp-61h]
fffff804`3c2cba36 488bd7          mov     rdx,rdi
fffff804`3c2cba39 e8fad5f7ff      call    storport!RaUnitAttributedIoQueued (fffff804`3c249038)

storport!RaidUnitSubmitIrpRequest+0xe284e:
fffff804`3c2cba3e 488b4620        mov     rax,qword ptr [rsi+20h]
fffff804`3c2cba42 4881c7a8000000  add     rdi,0A8h
fffff804`3c2cba49 4883c030        add     rax,30h
fffff804`3c2cba4d 488b4808        mov     rcx,qword ptr [rax+8]
fffff804`3c2cba51 483901          cmp     qword ptr [rcx],rax
fffff804`3c2cba54 7407            je      storport!RaidUnitSubmitIrpRequest+0xe286d (fffff804`3c2cba5d)  Branch

storport!RaidUnitSubmitIrpRequest+0xe2866:
fffff804`3c2cba56 b903000000      mov     ecx,3
fffff804`3c2cba5b cd29            int     29h

storport!RaidUnitSubmitIrpRequest+0xe286d:
fffff804`3c2cba5d 48894f08        mov     qword ptr [rdi+8],rcx
fffff804`3c2cba61 410fb6d4        movzx   edx,r12b
fffff804`3c2cba65 488907          mov     qword ptr [rdi],rax
fffff804`3c2cba68 488939          mov     qword ptr [rcx],rdi
fffff804`3c2cba6b 48897808        mov     qword ptr [rax+8],rdi
fffff804`3c2cba6f 488b4e20        mov     rcx,qword ptr [rsi+20h]
fffff804`3c2cba73 4883c118        add     rcx,18h
fffff804`3c2cba77 4c8b153ac70200  mov     r10,qword ptr [storport!_imp_KeReleaseSpinLock (fffff804`3c2f81b8)]
fffff804`3c2cba7e e8bdcb136d      call    nt!KeReleaseSpinLock (fffff804`a9408640)
fffff804`3c2cba83 90              nop
fffff804`3c2cba84 e9f1d9f1ff      jmp     storport!RaidUnitSubmitIrpRequest+0x28a (fffff804`3c1e947a)  Branch

storport!RaidUnitSubmitIrpRequest+0xe2899:
fffff804`3c2cba89 b9f0000000      mov     ecx,0F0h
fffff804`3c2cba8e 8d41f8          lea     eax,[rcx-8]
fffff804`3c2cba91 e9abd9f1ff      jmp     storport!RaidUnitSubmitIrpRequest+0x251 (fffff804`3c1e9441)  Branch
