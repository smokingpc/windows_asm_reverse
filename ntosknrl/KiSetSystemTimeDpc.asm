;VOID __stdcall KiSetSystemTimeDpc(_KDPC *Dpc, VOID *DeferredContext, VOID *SystemArgument1, VOID *SystemArgument2)

11: kd> uf KiSetSystemTimeDpc
nt!KiSetSystemTimeDpc:
fffff801`11c28ef0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff801`11c28ef5 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff801`11c28efa 56              push    rsi
fffff801`11c28efb 57              push    rdi
fffff801`11c28efc 4155            push    r13
fffff801`11c28efe 4156            push    r14
fffff801`11c28f00 4157            push    r15
fffff801`11c28f02 4883ec40        sub     rsp,40h
fffff801`11c28f06 498bd9          mov     rbx,r9        ;SysArg2
fffff801`11c28f09 4d8bf8          mov     r15,r8        ;SysArg1
fffff801`11c28f0c 488bfa          mov     rdi,rdx       ;DeferredContext
fffff801`11c28f0f 83c8ff          or      eax,0FFFFFFFFh
fffff801`11c28f12 f0410fc101      lock xadd dword ptr [r9],eax
fffff801`11c28f17 ffc8            dec     eax
fffff801`11c28f19 41bd00000080    mov     r13d,80000000h
fffff801`11c28f1f 8bf0            mov     esi,eax
fffff801`11c28f21 f7d6            not     esi
fffff801`11c28f23 4123f5          and     esi,r13d
fffff801`11c28f26 a9ffffff7f      test    eax,7FFFFFFFh
fffff801`11c28f2b 741a            je      nt!KiSetSystemTimeDpc+0x57 (fffff801`11c28f47)  Branch

nt!KiSetSystemTimeDpc+0x3d:
fffff801`11c28f2d 8364247800      and     dword ptr [rsp+78h],0

nt!KiSetSystemTimeDpc+0x42:
fffff801`11c28f32 8b03            mov     eax,dword ptr [rbx]
fffff801`11c28f34 4123c5          and     eax,r13d
fffff801`11c28f37 3bc6            cmp     eax,esi
fffff801`11c28f39 7415            je      nt!KiSetSystemTimeDpc+0x60 (fffff801`11c28f50)  Branch

nt!KiSetSystemTimeDpc+0x4b:
fffff801`11c28f3b 488d4c2478      lea     rcx,[rsp+78h]
fffff801`11c28f40 e86b55f0ff      call    nt!KeYieldProcessorEx (fffff801`11b2e4b0)
fffff801`11c28f45 ebeb            jmp     nt!KiSetSystemTimeDpc+0x42 (fffff801`11c28f32)  Branch

nt!KiSetSystemTimeDpc+0x57:
fffff801`11c28f47 418b4104        mov     eax,dword ptr [r9+4]
fffff801`11c28f4b 0bc6            or      eax,esi
fffff801`11c28f4d 418901          mov     dword ptr [r9],eax

nt!KiSetSystemTimeDpc+0x60:
fffff801`11c28f50 65488b2c2520000000 mov   rbp,qword ptr gs:[20h]
fffff801`11c28f59 b201            mov     dl,1
fffff801`11c28f5b 488bcd          mov     rcx,rbp
fffff801`11c28f5e e849010000      call    nt!KiSelectActiveTimerTable (fffff801`11c290ac)
fffff801`11c28f63 807d2100        cmp     byte ptr [rbp+21h],0
fffff801`11c28f67 4c8bf0          mov     r14,rax
fffff801`11c28f6a 0f85b9000000    jne     nt!KiSetSystemTimeDpc+0x139 (fffff801`11c29029)  Branch

nt!KiSetSystemTimeDpc+0x80:
fffff801`11c28f70 83c8ff          or      eax,0FFFFFFFFh
fffff801`11c28f73 f00fc103        lock xadd dword ptr [rbx],eax
fffff801`11c28f77 ffc8            dec     eax
fffff801`11c28f79 8bf0            mov     esi,eax
fffff801`11c28f7b f7d6            not     esi
fffff801`11c28f7d 4123f5          and     esi,r13d
fffff801`11c28f80 a9ffffff7f      test    eax,7FFFFFFFh
fffff801`11c28f85 7420            je      nt!KiSetSystemTimeDpc+0xb7 (fffff801`11c28fa7)  Branch

nt!KiSetSystemTimeDpc+0x97:
fffff801`11c28f87 83a4248800000000 and     dword ptr [rsp+88h],0

nt!KiSetSystemTimeDpc+0x9f:
fffff801`11c28f8f 8b03            mov     eax,dword ptr [rbx]
fffff801`11c28f91 4123c5          and     eax,r13d
fffff801`11c28f94 3bc6            cmp     eax,esi
fffff801`11c28f96 7416            je      nt!KiSetSystemTimeDpc+0xbe (fffff801`11c28fae)  Branch

nt!KiSetSystemTimeDpc+0xa8:
fffff801`11c28f98 488d8c2488000000 lea     rcx,[rsp+88h]
fffff801`11c28fa0 e80b55f0ff      call    nt!KeYieldProcessorEx (fffff801`11b2e4b0)
fffff801`11c28fa5 ebe8            jmp     nt!KiSetSystemTimeDpc+0x9f (fffff801`11c28f8f)  Branch

nt!KiSetSystemTimeDpc+0xb7:
fffff801`11c28fa7 8b4304          mov     eax,dword ptr [rbx+4]
fffff801`11c28faa 0bc6            or      eax,esi
fffff801`11c28fac 8903            mov     dword ptr [rbx],eax

nt!KiSetSystemTimeDpc+0xbe:
fffff801`11c28fae 48837f1800      cmp     qword ptr [rdi+18h],0
fffff801`11c28fb3 7441            je      nt!KiSetSystemTimeDpc+0x106 (fffff801`11c28ff6)  Branch

nt!KiSetSystemTimeDpc+0xc5:
fffff801`11c28fb5 4d85f6          test    r14,r14
fffff801`11c28fb8 0f85c5000000    jne     nt!KiSetSystemTimeDpc+0x193 (fffff801`11c29083)  Branch

nt!KiSetSystemTimeDpc+0xce:
fffff801`11c28fbe 83c8ff          or      eax,0FFFFFFFFh
fffff801`11c28fc1 f00fc103        lock xadd dword ptr [rbx],eax
fffff801`11c28fc5 ffc8            dec     eax
fffff801`11c28fc7 8bf8            mov     edi,eax
fffff801`11c28fc9 f7d7            not     edi
fffff801`11c28fcb 4123fd          and     edi,r13d
fffff801`11c28fce a9ffffff7f      test    eax,7FFFFFFFh
fffff801`11c28fd3 741a            je      nt!KiSetSystemTimeDpc+0xff (fffff801`11c28fef)  Branch

nt!KiSetSystemTimeDpc+0xe5:
fffff801`11c28fd5 8364243000      and     dword ptr [rsp+30h],0

nt!KiSetSystemTimeDpc+0xea:
fffff801`11c28fda 8b03            mov     eax,dword ptr [rbx]
fffff801`11c28fdc 4123c5          and     eax,r13d
fffff801`11c28fdf 3bc7            cmp     eax,edi
fffff801`11c28fe1 7413            je      nt!KiSetSystemTimeDpc+0x106 (fffff801`11c28ff6)  Branch

nt!KiSetSystemTimeDpc+0xf3:
fffff801`11c28fe3 488d4c2430      lea     rcx,[rsp+30h]
fffff801`11c28fe8 e8c354f0ff      call    nt!KeYieldProcessorEx (fffff801`11b2e4b0)
fffff801`11c28fed ebeb            jmp     nt!KiSetSystemTimeDpc+0xea (fffff801`11c28fda)  Branch

nt!KiSetSystemTimeDpc+0xff:
fffff801`11c28fef 8b4304          mov     eax,dword ptr [rbx+4]
fffff801`11c28ff2 0bc7            or      eax,edi
fffff801`11c28ff4 8903            mov     dword ptr [rbx],eax

nt!KiSetSystemTimeDpc+0x106:
fffff801`11c28ff6 f041ff0f        lock dec dword ptr [r15]
fffff801`11c28ffa 4533c9          xor     r9d,r9d
fffff801`11c28ffd 33d2            xor     edx,edx
fffff801`11c28fff c644242002      mov     byte ptr [rsp+20h],2
fffff801`11c29004 488bcd          mov     rcx,rbp
fffff801`11c29007 458d4101        lea     r8d,[r9+1]
fffff801`11c2900b e8404cf3ff      call    nt!KiExitDispatcher (fffff801`11b5dc50)
fffff801`11c29010 4c8d5c2440      lea     r11,[rsp+40h]
fffff801`11c29015 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff801`11c29019 498b6b40        mov     rbp,qword ptr [r11+40h]
fffff801`11c2901d 498be3          mov     rsp,r11
fffff801`11c29020 415f            pop     r15
fffff801`11c29022 415e            pop     r14
fffff801`11c29024 415d            pop     r13
fffff801`11c29026 5f              pop     rdi
fffff801`11c29027 5e              pop     rsi
fffff801`11c29028 c3              ret

nt!KiSetSystemTimeDpc+0x139:
fffff801`11c29029 48ba1400000080f7ffff mov rdx,0FFFFF78000000014h
fffff801`11c29033 488b12          mov     rdx,qword ptr [rdx]
fffff801`11c29036 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff801`11c2903a 488911          mov     qword ptr [rcx],rdx
fffff801`11c2903d 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff801`11c29041 8b4704          mov     eax,dword ptr [rdi+4]
fffff801`11c29044 4c8b09          mov     r9,qword ptr [rcx]
fffff801`11c29047 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff801`11c2904b 4c894f18        mov     qword ptr [rdi+18h],r9
fffff801`11c2904f 4c2b09          sub     r9,qword ptr [rcx]
fffff801`11c29052 4c894f18        mov     qword ptr [rdi+18h],r9
fffff801`11c29056 498bc9          mov     rcx,r9
fffff801`11c29059 a801            test    al,1
fffff801`11c2905b 7439            je      nt!KiSetSystemTimeDpc+0x1a6 (fffff801`11c29096)  Branch

nt!KiSetSystemTimeDpc+0x16d:
fffff801`11c2905d d1e8            shr     eax,1
fffff801`11c2905f 2401            and     al,1
fffff801`11c29061 8ad0            mov     dl,al
fffff801`11c29063 e840aefeff      call    nt!KeAdjustInterruptTime (fffff801`11c13ea8)
fffff801`11c29068 84c0            test    al,al
fffff801`11c2906a 0f8400ffffff    je      nt!KiSetSystemTimeDpc+0x80 (fffff801`11c28f70)  Branch

nt!KiSetSystemTimeDpc+0x180:
fffff801`11c29070 488b4718        mov     rax,qword ptr [rdi+18h]
fffff801`11c29074 48f7d8          neg     rax
fffff801`11c29077 c60701          mov     byte ptr [rdi],1
fffff801`11c2907a 48894718        mov     qword ptr [rdi+18h],rax
fffff801`11c2907e e9edfeffff      jmp     nt!KiSetSystemTimeDpc+0x80 (fffff801`11c28f70)  Branch

nt!KiSetSystemTimeDpc+0x193:
fffff801`11c29083 4c8bc7          mov     r8,rdi
fffff801`11c29086 498bd6          mov     rdx,r14
fffff801`11c29089 488bcd          mov     rcx,rbp
fffff801`11c2908c e84b000000      call    nt!KiAdjustTimerDueTimes (fffff801`11c290dc)
fffff801`11c29091 e928ffffff      jmp     nt!KiSetSystemTimeDpc+0xce (fffff801`11c28fbe)  Branch

nt!KiSetSystemTimeDpc+0x1a6:
fffff801`11c29096 448bc0          mov     r8d,eax
fffff801`11c29099 33d2            xor     edx,edx
fffff801`11c2909b e8e8c2ffff      call    nt!KiUpdateSystemTime (fffff801`11c25388)
fffff801`11c290a0 e9cbfeffff      jmp     nt!KiSetSystemTimeDpc+0x80 (fffff801`11c28f70)  Branch
