0: kd> uf storport!RaidUnitSendSrbIoControlSynchronously
storport!RaidUnitSendSrbIoControlSynchronously:
fffff80b`78e7e0a0 4c8bdc          mov     r11,rsp
fffff80b`78e7e0a3 49895b08        mov     qword ptr [r11+8],rbx
fffff80b`78e7e0a7 49896b10        mov     qword ptr [r11+10h],rbp
fffff80b`78e7e0ab 49897318        mov     qword ptr [r11+18h],rsi
fffff80b`78e7e0af 49897b20        mov     qword ptr [r11+20h],rdi
fffff80b`78e7e0b3 4154            push    r12
fffff80b`78e7e0b5 4156            push    r14
fffff80b`78e7e0b7 4157            push    r15
fffff80b`78e7e0b9 4883ec30        sub     rsp,30h
fffff80b`78e7e0bd 4c8b7118        mov     r14,qword ptr [rcx+18h]
fffff80b`78e7e0c1 33c0            xor     eax,eax
fffff80b`78e7e0c3 418bf1          mov     esi,r9d
fffff80b`78e7e0c6 498943d8        mov     qword ptr [r11-28h],rax
fffff80b`78e7e0ca 4d8bf8          mov     r15,r8
fffff80b`78e7e0cd 498943e0        mov     qword ptr [r11-20h],rax
fffff80b`78e7e0d1 4c8be2          mov     r12,rdx
fffff80b`78e7e0d4 488bf9          mov     rdi,rcx
fffff80b`78e7e0d7 458a8692010000  mov     r8b,byte ptr [r14+192h]
fffff80b`78e7e0de 8d5002          lea     edx,[rax+2]
fffff80b`78e7e0e1 488b4908        mov     rcx,qword ptr [rcx+8]
fffff80b`78e7e0e5 4533c9          xor     r9d,r9d
fffff80b`78e7e0e8 33ed            xor     ebp,ebp
fffff80b`78e7e0ea e89d8efeff      call    storport!RaidAllocateSrb (fffff80b`78e66f8c)
fffff80b`78e7e0ef 488bd8          mov     rbx,rax
fffff80b`78e7e0f2 4885c0          test    rax,rax
fffff80b`78e7e0f5 0f8491020100    je      storport!RaidUnitSendSrbIoControlSynchronously+0x102ec (fffff80b`78e8e38c)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x5b:
fffff80b`78e7e0fb 8b942480000000  mov     edx,dword ptr [rsp+80h]
fffff80b`78e7e102 81ca02010000    or      edx,102h
fffff80b`78e7e108 80780228        cmp     byte ptr [rax+2],28h
fffff80b`78e7e10c 8d4520          lea     eax,[rbp+20h]
fffff80b`78e7e10f 0f84eb000000    je      storport!RaidUnitSendSrbIoControlSynchronously+0x160 (fffff80b`78e7e200)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x75:
fffff80b`78e7e115 884309          mov     byte ptr [rbx+9],al

storport!RaidUnitSendSrbIoControlSynchronously+0x78:
fffff80b`78e7e118 4180be9201000001 cmp     byte ptr [r14+192h],1
fffff80b`78e7e120 0f84e3000000    je      storport!RaidUnitSendSrbIoControlSynchronously+0x169 (fffff80b`78e7e209)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x86:
fffff80b`78e7e126 c6430202        mov     byte ptr [rbx+2],2
fffff80b`78e7e12a b858000000      mov     eax,58h
fffff80b`78e7e12f 668903          mov     word ptr [rbx],ax
fffff80b`78e7e132 89530c          mov     dword ptr [rbx+0Ch],edx
fffff80b`78e7e135 c64308ff        mov     byte ptr [rbx+8],0FFh
fffff80b`78e7e139 4c897b18        mov     qword ptr [rbx+18h],r15
fffff80b`78e7e13d 897310          mov     dword ptr [rbx+10h],esi
fffff80b`78e7e140 4c896330        mov     qword ptr [rbx+30h],r12
fffff80b`78e7e144 8b8708040000    mov     eax,dword ptr [rdi+408h]
fffff80b`78e7e14a 894314          mov     dword ptr [rbx+14h],eax
fffff80b`78e7e14d 8a4760          mov     al,byte ptr [rdi+60h]
fffff80b`78e7e150 884305          mov     byte ptr [rbx+5],al
fffff80b`78e7e153 8a4761          mov     al,byte ptr [rdi+61h]
fffff80b`78e7e156 884306          mov     byte ptr [rbx+6],al
fffff80b`78e7e159 8a4762          mov     al,byte ptr [rdi+62h]
fffff80b`78e7e15c 884307          mov     byte ptr [rbx+7],al

storport!RaidUnitSendSrbIoControlSynchronously+0xbf:
fffff80b`78e7e15f 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80b`78e7e163 4c8d4c2420      lea     r9,[rsp+20h]
fffff80b`78e7e168 488bd3          mov     rdx,rbx
fffff80b`78e7e16b e850010000      call    storport!StorBuildSynchronousScsiRequest (fffff80b`78e7e2c0)
fffff80b`78e7e170 488bf0          mov     rsi,rax
fffff80b`78e7e173 4885c0          test    rax,rax
fffff80b`78e7e176 0f841a020100    je      storport!RaidUnitSendSrbIoControlSynchronously+0x102f6 (fffff80b`78e8e396)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0xdc:
fffff80b`78e7e17c 4180be9201000001 cmp     byte ptr [r14+192h],1
fffff80b`78e7e184 0f84c1000000    je      storport!RaidUnitSendSrbIoControlSynchronously+0x1ab (fffff80b`78e7e24b)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0xea:
fffff80b`78e7e18a 48894330        mov     qword ptr [rbx+30h],rax

storport!RaidUnitSendSrbIoControlSynchronously+0xee:
fffff80b`78e7e18e 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80b`78e7e192 488bd6          mov     rdx,rsi
fffff80b`78e7e195 e8665dfeff      call    storport!RaSendIrpSynchronous (fffff80b`78e63f00)
fffff80b`78e7e19a 8bf8            mov     edi,eax
fffff80b`78e7e19c 85c0            test    eax,eax
fffff80b`78e7e19e 780b            js      storport!RaidUnitSendSrbIoControlSynchronously+0x10b (fffff80b`78e7e1ab)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x100:
fffff80b`78e7e1a0 8b7e30          mov     edi,dword ptr [rsi+30h]
fffff80b`78e7e1a3 85ff            test    edi,edi
fffff80b`78e7e1a5 0f89f5010100    jns     storport!RaidUnitSendSrbIoControlSynchronously+0x10300 (fffff80b`78e8e3a0)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x10b:
fffff80b`78e7e1ab 488bce          mov     rcx,rsi
fffff80b`78e7e1ae e8c1000000      call    storport!StorFreeSynchronousScsiRequest (fffff80b`78e7e274)

storport!RaidUnitSendSrbIoControlSynchronously+0x113:
fffff80b`78e7e1b3 4180be9201000001 cmp     byte ptr [r14+192h],1
fffff80b`78e7e1bb 0f8496000000    je      storport!RaidUnitSendSrbIoControlSynchronously+0x1b7 (fffff80b`78e7e257)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x121:
fffff80b`78e7e1c1 4883633000      and     qword ptr [rbx+30h],0
fffff80b`78e7e1c6 4883633800      and     qword ptr [rbx+38h],0

storport!RaidUnitSendSrbIoControlSynchronously+0x12b:
fffff80b`78e7e1cb ba52615372      mov     edx,72536152h
fffff80b`78e7e1d0 488bcb          mov     rcx,rbx
fffff80b`78e7e1d3 48ff154e600400  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff80b`78ec4228)]
fffff80b`78e7e1da 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidUnitSendSrbIoControlSynchronously+0x13f:
fffff80b`78e7e1df 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff80b`78e7e1e4 8bc7            mov     eax,edi
fffff80b`78e7e1e6 488b7c2468      mov     rdi,qword ptr [rsp+68h]
fffff80b`78e7e1eb 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff80b`78e7e1f0 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff80b`78e7e1f5 4883c430        add     rsp,30h
fffff80b`78e7e1f9 415f            pop     r15
fffff80b`78e7e1fb 415e            pop     r14
fffff80b`78e7e1fd 415c            pop     r12
fffff80b`78e7e1ff c3              ret

storport!RaidUnitSendSrbIoControlSynchronously+0x160:
fffff80b`78e7e200 66894326        mov     word ptr [rbx+26h],ax
fffff80b`78e7e204 e90fffffff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0x78 (fffff80b`78e7e118)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x169:
fffff80b`78e7e209 834b20ff        or      dword ptr [rbx+20h],0FFFFFFFFh
fffff80b`78e7e20d 488beb          mov     rbp,rbx
fffff80b`78e7e210 8b4b34          mov     ecx,dword ptr [rbx+34h]
fffff80b`78e7e213 c7431402000000  mov     dword ptr [rbx+14h],2
fffff80b`78e7e21a 895318          mov     dword ptr [rbx+18h],edx
fffff80b`78e7e21d 4c897b40        mov     qword ptr [rbx+40h],r15
fffff80b`78e7e221 89733c          mov     dword ptr [rbx+3Ch],esi
fffff80b`78e7e224 4c896350        mov     qword ptr [rbx+50h],r12
fffff80b`78e7e228 8b8708040000    mov     eax,dword ptr [rdi+408h]
fffff80b`78e7e22e 894328          mov     dword ptr [rbx+28h],eax
fffff80b`78e7e231 8a4760          mov     al,byte ptr [rdi+60h]
fffff80b`78e7e234 88441908        mov     byte ptr [rcx+rbx+8],al
fffff80b`78e7e238 8a4761          mov     al,byte ptr [rdi+61h]
fffff80b`78e7e23b 88441909        mov     byte ptr [rcx+rbx+9],al
fffff80b`78e7e23f 8a4762          mov     al,byte ptr [rdi+62h]
fffff80b`78e7e242 8844190a        mov     byte ptr [rcx+rbx+0Ah],al
fffff80b`78e7e246 e914ffffff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0xbf (fffff80b`78e7e15f)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x1ab:
fffff80b`78e7e24b 488beb          mov     rbp,rbx
fffff80b`78e7e24e 48897350        mov     qword ptr [rbx+50h],rsi
fffff80b`78e7e252 e937ffffff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0xee (fffff80b`78e7e18e)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x1b7:
fffff80b`78e7e257 4885ed          test    rbp,rbp
fffff80b`78e7e25a 480f44eb        cmove   rbp,rbx
fffff80b`78e7e25e 4883655000      and     qword ptr [rbp+50h],0
fffff80b`78e7e263 4883656800      and     qword ptr [rbp+68h],0
fffff80b`78e7e268 e95effffff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0x12b (fffff80b`78e7e1cb)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x102ec:
fffff80b`78e8e38c bf170000c0      mov     edi,0C0000017h
fffff80b`78e8e391 e949fefeff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0x13f (fffff80b`78e7e1df)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x102f6:
fffff80b`78e8e396 bf170000c0      mov     edi,0C0000017h
fffff80b`78e8e39b e913fefeff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0x113 (fffff80b`78e7e1b3)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x10300:
fffff80b`78e8e3a0 488b442470      mov     rax,qword ptr [rsp+70h]
fffff80b`78e8e3a5 4885c0          test    rax,rax
fffff80b`78e8e3a8 740c            je      storport!RaidUnitSendSrbIoControlSynchronously+0x10316 (fffff80b`78e8e3b6)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x1030a:
fffff80b`78e8e3aa 418b4f14        mov     ecx,dword ptr [r15+14h]
fffff80b`78e8e3ae ff1524640300    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80b`78ec47d8)]
fffff80b`78e8e3b4 8bf8            mov     edi,eax

storport!RaidUnitSendSrbIoControlSynchronously+0x10316:
fffff80b`78e8e3b6 85ff            test    edi,edi
fffff80b`78e8e3b8 0f88edfdfeff    js      storport!RaidUnitSendSrbIoControlSynchronously+0x10b (fffff80b`78e7e1ab)  Branch

storport!RaidUnitSendSrbIoControlSynchronously+0x1031e:
fffff80b`78e8e3be 8a4b03          mov     cl,byte ptr [rbx+3]
fffff80b`78e8e3c1 e85e13feff      call    storport!PortSrbTranslateSrbToNtStatus (fffff80b`78e6f724)
fffff80b`78e8e3c6 8bf8            mov     edi,eax
fffff80b`78e8e3c8 e9defdfeff      jmp     storport!RaidUnitSendSrbIoControlSynchronously+0x10b (fffff80b`78e7e1ab)  Branch
