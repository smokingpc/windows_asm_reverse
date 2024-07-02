24: kd> uf ExpUpdateTimerConfiguration
nt!ExpUpdateTimerConfiguration:
fffff805`34bcb168 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff805`34bcb16d 55              push    rbp
fffff805`34bcb16e 56              push    rsi
fffff805`34bcb16f 57              push    rdi
fffff805`34bcb170 4881ec00010000  sub     rsp,100h
fffff805`34bcb177 488b05021c2f00  mov     rax,qword ptr [nt!_security_cookie (fffff805`34ebcd80)]
fffff805`34bcb17e 4833c4          xor     rax,rsp
fffff805`34bcb181 48898424f0000000 mov     qword ptr [rsp+0F0h],rax
fffff805`34bcb189 498bf0          mov     rsi,r8
fffff805`34bcb18c c744244001001400 mov     dword ptr [rsp+40h],140001h
fffff805`34bcb194 488bfa          mov     rdi,rdx
fffff805`34bcb197 488bd9          mov     rbx,rcx
fffff805`34bcb19a 33d2            xor     edx,edx
fffff805`34bcb19c 488d4c2444      lea     rcx,[rsp+44h]
fffff805`34bcb1a1 41b8a4000000    mov     r8d,0A4h
fffff805`34bcb1a7 bd01000000      mov     ebp,1
fffff805`34bcb1ac e88fc60b00      call    nt!memset (fffff805`34c87840)
fffff805`34bcb1b1 8b15b9e33000    mov     edx,dword ptr [nt!KiClockTimerOwner (fffff805`34ed9570)]
fffff805`34bcb1b7 488d4c2440      lea     rcx,[rsp+40h]
fffff805`34bcb1bc e83f63f5ff      call    nt!KeAddProcessorAffinityEx (fffff805`34b21500)
fffff805`34bcb1c1 448bcd          mov     r9d,ebp
fffff805`34bcb1c4 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff805`34bcb1c9 4c8d442420      lea     r8,[rsp+20h]
fffff805`34bcb1ce 48897c2428      mov     qword ptr [rsp+28h],rdi
fffff805`34bcb1d3 488d1506e5fdff  lea     rdx,[nt!ExpUpdateTimerConfigurationWorker (fffff805`34ba96e0)]
fffff805`34bcb1da 4889742430      mov     qword ptr [rsp+30h],rsi
fffff805`34bcb1df 488d4c2440      lea     rcx,[rsp+40h]
fffff805`34bcb1e4 e82f000000      call    nt!KeGenericProcessorCallback (fffff805`34bcb218)
fffff805`34bcb1e9 8b442438        mov     eax,dword ptr [rsp+38h]
fffff805`34bcb1ed 488b8c24f0000000 mov     rcx,qword ptr [rsp+0F0h]
fffff805`34bcb1f5 4833cc          xor     rcx,rsp
fffff805`34bcb1f8 e8f3f30700      call    nt!_security_check_cookie (fffff805`34c4a5f0)
fffff805`34bcb1fd 488b9c2438010000 mov     rbx,qword ptr [rsp+138h]
fffff805`34bcb205 4881c400010000  add     rsp,100h
fffff805`34bcb20c 5f              pop     rdi
fffff805`34bcb20d 5e              pop     rsi
fffff805`34bcb20e 5d              pop     rbp
fffff805`34bcb20f c3              ret
