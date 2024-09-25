9: kd> uf storport!RaidRestartIoQueue
storport!RaidRestartIoQueue:
fffff801`ed80d29c 488bc4          mov     rax,rsp
fffff801`ed80d29f 48895808        mov     qword ptr [rax+8],rbx
fffff801`ed80d2a3 48896810        mov     qword ptr [rax+10h],rbp
fffff801`ed80d2a7 48897018        mov     qword ptr [rax+18h],rsi
fffff801`ed80d2ab 48897820        mov     qword ptr [rax+20h],rdi
fffff801`ed80d2af 4156            push    r14
fffff801`ed80d2b1 4883ec50        sub     rsp,50h
fffff801`ed80d2b5 448af2          mov     r14b,dl
fffff801`ed80d2b8 488bd9          mov     rbx,rcx
fffff801`ed80d2bb 4032ff          xor     dil,dil
fffff801`ed80d2be 440f20c5        mov     rbp,tmm
fffff801`ed80d2c2 4080fd02        cmp     bpl,2
fffff801`ed80d2c6 7535            jne     storport!RaidRestartIoQueue+0x61 (fffff801`ed80d2fd)  Branch

storport!RaidRestartIoQueue+0x2c:
fffff801`ed80d2c8 488d8b90020000  lea     rcx,[rbx+290h]
fffff801`ed80d2cf e890000000      call    storport!RaidNormalizeDeviceQueue (fffff801`ed80d364)
fffff801`ed80d2d4 488bf0          mov     rsi,rax
fffff801`ed80d2d7 4885c0          test    rax,rax
fffff801`ed80d2da 7545            jne     storport!RaidRestartIoQueue+0x85 (fffff801`ed80d321)  Branch

storport!RaidRestartIoQueue+0x40:
fffff801`ed80d2dc 4080fd02        cmp     bpl,2
fffff801`ed80d2e0 752e            jne     storport!RaidRestartIoQueue+0x74 (fffff801`ed80d310)  Branch

storport!RaidRestartIoQueue+0x46:
fffff801`ed80d2e2 488b5c2460      mov     rbx,qword ptr [rsp+60h]
fffff801`ed80d2e7 488b6c2468      mov     rbp,qword ptr [rsp+68h]
fffff801`ed80d2ec 488b742470      mov     rsi,qword ptr [rsp+70h]
fffff801`ed80d2f1 488b7c2478      mov     rdi,qword ptr [rsp+78h]
fffff801`ed80d2f6 4883c450        add     rsp,50h
fffff801`ed80d2fa 415e            pop     r14
fffff801`ed80d2fc c3              ret

storport!RaidRestartIoQueue+0x61:
fffff801`ed80d2fd b102            mov     cl,2
fffff801`ed80d2ff 48ff154a9f0500  call    qword ptr [storport!_imp_KfRaiseIrql (fffff801`ed867250)]
fffff801`ed80d306 0f1f440000      nop     dword ptr [rax+rax]
fffff801`ed80d30b 408af8          mov     dil,al
fffff801`ed80d30e ebb8            jmp     storport!RaidRestartIoQueue+0x2c (fffff801`ed80d2c8)  Branch

storport!RaidRestartIoQueue+0x74:
fffff801`ed80d310 408acf          mov     cl,dil
fffff801`ed80d313 48ff15869e0500  call    qword ptr [storport!_imp_KeLowerIrql (fffff801`ed8671a0)]
fffff801`ed80d31a 0f1f440000      nop     dword ptr [rax+rax]
fffff801`ed80d31f ebc1            jmp     storport!RaidRestartIoQueue+0x46 (fffff801`ed80d2e2)  Branch

storport!RaidRestartIoQueue+0x85:
fffff801`ed80d321 488b8b98020000  mov     rcx,qword ptr [rbx+298h]
fffff801`ed80d328 4c8d442430      lea     r8,[rsp+30h]
fffff801`ed80d32d 488bd6          mov     rdx,rsi
fffff801`ed80d330 e823040000      call    storport!StorSubmitIoGatewayItem (fffff801`ed80d758)
fffff801`ed80d335 84c0            test    al,al
fffff801`ed80d337 75a3            jne     storport!RaidRestartIoQueue+0x40 (fffff801`ed80d2dc)  Branch

storport!RaidRestartIoQueue+0x9d:
fffff801`ed80d339 488b8388020000  mov     rax,qword ptr [rbx+288h]
fffff801`ed80d340 488d5688        lea     rdx,[rsi-78h]
fffff801`ed80d344 488b8b80020000  mov     rcx,qword ptr [rbx+280h]
fffff801`ed80d34b 4c8d442430      lea     r8,[rsp+30h]
fffff801`ed80d350 458ace          mov     r9b,r14b
fffff801`ed80d353 ff15cfa40500    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff801`ed867828)]
fffff801`ed80d359 eb81            jmp     storport!RaidRestartIoQueue+0x40 (fffff801`ed80d2dc)  Branch
