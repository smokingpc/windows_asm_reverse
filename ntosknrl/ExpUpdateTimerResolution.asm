24: kd> uf ExpUpdateTimerResolution
nt!ExpUpdateTimerResolution:
fffff805`34bbb36c 48895c2408      mov     qword ptr [rsp+8],rbx
fffff805`34bbb371 89542410        mov     dword ptr [rsp+10h],edx
fffff805`34bbb375 57              push    rdi
fffff805`34bbb376 4883ec20        sub     rsp,20h
fffff805`34bbb37a 408af9          mov     dil,cl
fffff805`34bbb37d 4d85c0          test    r8,r8
fffff805`34bbb380 0f85ce251300    jne     nt!ExpUpdateTimerResolution+0x1325e8 (fffff805`34ced954)  Branch

nt!ExpUpdateTimerResolution+0x1a:
fffff805`34bbb386 488d0d1b683000  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34bbb38d e81e8a0100      call    nt!KeAcquireSpinLockRaiseToDpc (fffff805`34bd3db0)
fffff805`34bbb392 8b542438        mov     edx,dword ptr [rsp+38h]
fffff805`34bbb396 8ad8            mov     bl,al

nt!ExpUpdateTimerResolution+0x2c:
fffff805`34bbb398 4084ff          test    dil,dil
fffff805`34bbb39b 0f848d000000    je      nt!ExpUpdateTimerResolution+0xc2 (fffff805`34bbb42e)  Branch

nt!ExpUpdateTimerResolution+0x35:
fffff805`34bbb3a1 3b1541eb2f00    cmp     edx,dword ptr [nt!ExpLastRequestedTime (fffff805`34eb9ee8)]
fffff805`34bbb3a7 0f83c0000000    jae     nt!ExpUpdateTimerResolution+0x101 (fffff805`34bbb46d)  Branch

nt!ExpUpdateTimerResolution+0x41:
fffff805`34bbb3ad 391525ef4300    cmp     dword ptr [nt!KeMaximumIncrement (fffff805`34ffa2d8)],edx
fffff805`34bbb3b3 0f86b4000000    jbe     nt!ExpUpdateTimerResolution+0x101 (fffff805`34bbb46d)  Branch

nt!ExpUpdateTimerResolution+0x4d:
fffff805`34bbb3b9 3b15ddef4300    cmp     edx,dword ptr [nt!KeMinimumIncrement (fffff805`34ffa39c)]
fffff805`34bbb3bf 0f4215d6ef4300  cmovb   edx,dword ptr [nt!KeMinimumIncrement (fffff805`34ffa39c)]
fffff805`34bbb3c6 3b151ceb2f00    cmp     edx,dword ptr [nt!ExpLastRequestedTime (fffff805`34eb9ee8)]
fffff805`34bbb3cc 89542438        mov     dword ptr [rsp+38h],edx
fffff805`34bbb3d0 0f8497000000    je      nt!ExpUpdateTimerResolution+0x101 (fffff805`34bbb46d)  Branch

nt!ExpUpdateTimerResolution+0x6a:
fffff805`34bbb3d6 8b3d3cef4300    mov     edi,dword ptr [nt!KeTimeIncrement (fffff805`34ffa318)]
fffff805`34bbb3dc 488d0dc5673000  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34bbb3e3 8915ffea2f00    mov     dword ptr [nt!ExpLastRequestedTime (fffff805`34eb9ee8)],edx
fffff805`34bbb3e9 e83258f6ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff805`34b20c20)
fffff805`34bbb3ee 8b05ecf04300    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`34ffa4e0)]
fffff805`34bbb3f4 85c0            test    eax,eax
fffff805`34bbb3f6 0f8576251300    jne     nt!ExpUpdateTimerResolution+0x132606 (fffff805`34ced972)  Branch

nt!ExpUpdateTimerResolution+0x90:
fffff805`34bbb3fc 0fb6c3          movzx   eax,bl
fffff805`34bbb3ff 440f22c0        mov     tmm,rax
fffff805`34bbb403 4533c0          xor     r8d,r8d
fffff805`34bbb406 488d4c2438      lea     rcx,[rsp+38h]
fffff805`34bbb40b 33d2            xor     edx,edx
fffff805`34bbb40d e856fd0000      call    nt!ExpUpdateTimerConfiguration (fffff805`34bcb168)
fffff805`34bbb412 8b442438        mov     eax,dword ptr [rsp+38h]
fffff805`34bbb416 3bf8            cmp     edi,eax
fffff805`34bbb418 7409            je      nt!ExpUpdateTimerResolution+0xb7 (fffff805`34bbb423)  Branch

nt!ExpUpdateTimerResolution+0xae:
fffff805`34bbb41a e88d000000      call    nt!PoTraceSystemTimerResolutionUpdate (fffff805`34bbb4ac)
fffff805`34bbb41f 8b442438        mov     eax,dword ptr [rsp+38h]

nt!ExpUpdateTimerResolution+0xb7:
fffff805`34bbb423 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff805`34bbb428 4883c420        add     rsp,20h
fffff805`34bbb42c 5f              pop     rdi
fffff805`34bbb42d c3              ret

nt!ExpUpdateTimerResolution+0xc2:
fffff805`34bbb42e 833d7b67300000  cmp     dword ptr [nt!ExpKernelResolutionCount (fffff805`34ec1bb0)],0
fffff805`34bbb435 8b159dee4300    mov     edx,dword ptr [nt!KeMaximumIncrement (fffff805`34ffa2d8)]
fffff805`34bbb43b 89542438        mov     dword ptr [rsp+38h],edx
fffff805`34bbb43f 0f8517251300    jne     nt!ExpUpdateTimerResolution+0x1325f0 (fffff805`34ced95c)  Branch

nt!ExpUpdateTimerResolution+0xd9:
fffff805`34bbb445 488b0d74673000  mov     rcx,qword ptr [nt!ExpTimerResolutionListHead (fffff805`34ec1bc0)]
fffff805`34bbb44c 4c8d056d673000  lea     r8,[nt!ExpTimerResolutionListHead (fffff805`34ec1bc0)]

nt!ExpUpdateTimerResolution+0xe7:
fffff805`34bbb453 493bc8          cmp     rcx,r8
fffff805`34bbb456 0f845dffffff    je      nt!ExpUpdateTimerResolution+0x4d (fffff805`34bbb3b9)  Branch

nt!ExpUpdateTimerResolution+0xf0:
fffff805`34bbb45c f78194fcffff00100000 test dword ptr [rcx-36Ch],1000h
fffff805`34bbb466 752e            jne     nt!ExpUpdateTimerResolution+0x12a (fffff805`34bbb496)  Branch

nt!ExpUpdateTimerResolution+0xfc:
fffff805`34bbb468 488b09          mov     rcx,qword ptr [rcx]
fffff805`34bbb46b ebe6            jmp     nt!ExpUpdateTimerResolution+0xe7 (fffff805`34bbb453)  Branch

nt!ExpUpdateTimerResolution+0x101:
fffff805`34bbb46d 488d0d34673000  lea     rcx,[nt!ExpKernelResolutionLock (fffff805`34ec1ba8)]
fffff805`34bbb474 e8a757f6ff      call    nt!KeReleaseSpinLockFromDpcLevel (fffff805`34b20c20)
fffff805`34bbb479 8b0561f04300    mov     eax,dword ptr [nt!KiIrqlFlags (fffff805`34ffa4e0)]
fffff805`34bbb47f 85c0            test    eax,eax
fffff805`34bbb481 0f852a251300    jne     nt!ExpUpdateTimerResolution+0x132645 (fffff805`34ced9b1)  Branch

nt!ExpUpdateTimerResolution+0x11b:
fffff805`34bbb487 0fb6c3          movzx   eax,bl
fffff805`34bbb48a 440f22c0        mov     tmm,rax
fffff805`34bbb48e 8b0584ee4300    mov     eax,dword ptr [nt!KeTimeIncrement (fffff805`34ffa318)]
fffff805`34bbb494 eb8d            jmp     nt!ExpUpdateTimerResolution+0xb7 (fffff805`34bbb423)  Branch

nt!ExpUpdateTimerResolution+0x12a:
fffff805`34bbb496 8b4118          mov     eax,dword ptr [rcx+18h]
fffff805`34bbb499 3bc2            cmp     eax,edx
fffff805`34bbb49b 0f42d0          cmovb   edx,eax
fffff805`34bbb49e 89542438        mov     dword ptr [rsp+38h],edx
fffff805`34bbb4a2 ebc4            jmp     nt!ExpUpdateTimerResolution+0xfc (fffff805`34bbb468)  Branch

nt!ExpUpdateTimerResolution+0x1325e8:
fffff805`34ced954 418a18          mov     bl,byte ptr [r8]
fffff805`34ced957 e93cdaecff      jmp     nt!ExpUpdateTimerResolution+0x2c (fffff805`34bbb398)  Branch

nt!ExpUpdateTimerResolution+0x1325f0:
fffff805`34ced95c 391552421d00    cmp     dword ptr [nt!ExpKernelRequestedTimerResolution (fffff805`34ec1bb4)],edx
fffff805`34ced962 0f42154b421d00  cmovb   edx,dword ptr [nt!ExpKernelRequestedTimerResolution (fffff805`34ec1bb4)]
fffff805`34ced969 89542438        mov     dword ptr [rsp+38h],edx
fffff805`34ced96d e9d3daecff      jmp     nt!ExpUpdateTimerResolution+0xd9 (fffff805`34bbb445)  Branch

nt!ExpUpdateTimerResolution+0x132606:
fffff805`34ced972 a801            test    al,1
fffff805`34ced974 0f8482daecff    je      nt!ExpUpdateTimerResolution+0x90 (fffff805`34bbb3fc)  Branch

nt!ExpUpdateTimerResolution+0x13260e:
fffff805`34ced97a 440f20c0        mov     rax,tmm
fffff805`34ced97e 3c02            cmp     al,2
fffff805`34ced980 0f8276daecff    jb      nt!ExpUpdateTimerResolution+0x90 (fffff805`34bbb3fc)  Branch

nt!ExpUpdateTimerResolution+0x13261a:
fffff805`34ced986 80fb02          cmp     bl,2
fffff805`34ced989 0f836ddaecff    jae     nt!ExpUpdateTimerResolution+0x90 (fffff805`34bbb3fc)  Branch

nt!ExpUpdateTimerResolution+0x132623:
fffff805`34ced98f 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff805`34ced998 488b81b8610000  mov     rax,qword ptr [rcx+61B8h]
fffff805`34ced99f f08120fffffeff  lock and dword ptr [rax],0FFFEFFFFh
fffff805`34ced9a6 e8b5d1f7ff      call    nt!KiRemoveSystemWorkPriorityKick (fffff805`34c6ab60)
fffff805`34ced9ab 90              nop
fffff805`34ced9ac e94bdaecff      jmp     nt!ExpUpdateTimerResolution+0x90 (fffff805`34bbb3fc)  Branch

nt!ExpUpdateTimerResolution+0x132645:
fffff805`34ced9b1 a801            test    al,1
fffff805`34ced9b3 0f84cedaecff    je      nt!ExpUpdateTimerResolution+0x11b (fffff805`34bbb487)  Branch

nt!ExpUpdateTimerResolution+0x13264d:
fffff805`34ced9b9 440f20c0        mov     rax,tmm
fffff805`34ced9bd 3c02            cmp     al,2
fffff805`34ced9bf 0f82c2daecff    jb      nt!ExpUpdateTimerResolution+0x11b (fffff805`34bbb487)  Branch

nt!ExpUpdateTimerResolution+0x132659:
fffff805`34ced9c5 80fb02          cmp     bl,2
fffff805`34ced9c8 0f83b9daecff    jae     nt!ExpUpdateTimerResolution+0x11b (fffff805`34bbb487)  Branch

nt!ExpUpdateTimerResolution+0x132662:
fffff805`34ced9ce 65488b0c2520000000 mov   rcx,qword ptr gs:[20h]
fffff805`34ced9d7 488b81b8610000  mov     rax,qword ptr [rcx+61B8h]
fffff805`34ced9de f08120fffffeff  lock and dword ptr [rax],0FFFEFFFFh
fffff805`34ced9e5 e876d1f7ff      call    nt!KiRemoveSystemWorkPriorityKick (fffff805`34c6ab60)
fffff805`34ced9ea 90              nop
fffff805`34ced9eb e997daecff      jmp     nt!ExpUpdateTimerResolution+0x11b (fffff805`34bbb487)  Branch
