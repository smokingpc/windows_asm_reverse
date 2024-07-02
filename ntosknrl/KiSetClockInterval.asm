24: kd> uf KiSetClockInterval
nt!KiSetClockInterval:
fffff805`34ba983c 48895c2408      mov     qword ptr [rsp+8],rbx
fffff805`34ba9841 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff805`34ba9846 4889742418      mov     qword ptr [rsp+18h],rsi
fffff805`34ba984b 57              push    rdi
fffff805`34ba984c 4883ec20        sub     rsp,20h
fffff805`34ba9850 4180781800      cmp     byte ptr [r8+18h],0
fffff805`34ba9855 488d350c7e3e00  lea     rsi,[nt!KiClockIntervalRequests (fffff805`34f91668)]
fffff805`34ba985c 498bd8          mov     rbx,r8
fffff805`34ba985f 408aea          mov     bpl,dl
fffff805`34ba9862 8bf9            mov     edi,ecx
fffff805`34ba9864 740b            je      nt!KiSetClockInterval+0x35 (fffff805`34ba9871)  Branch

nt!KiSetClockInterval+0x2a:
fffff805`34ba9866 488bd3          mov     rdx,rbx
fffff805`34ba9869 488bce          mov     rcx,rsi
fffff805`34ba986c e85fb2faff      call    nt!RtlRbRemoveNode (fffff805`34b54ad0)

nt!KiSetClockInterval+0x35:
fffff805`34ba9871 897b1c          mov     dword ptr [rbx+1Ch],edi
fffff805`34ba9874 488b05f57d3e00  mov     rax,qword ptr [nt!KiClockIntervalRequests+0x8 (fffff805`34f91670)]
fffff805`34ba987b 488b15e67d3e00  mov     rdx,qword ptr [nt!KiClockIntervalRequests (fffff805`34f91668)]
fffff805`34ba9882 a801            test    al,1
fffff805`34ba9884 7408            je      nt!KiSetClockInterval+0x52 (fffff805`34ba988e)  Branch

nt!KiSetClockInterval+0x4a:
fffff805`34ba9886 4885d2          test    rdx,rdx
fffff805`34ba9889 7403            je      nt!KiSetClockInterval+0x52 (fffff805`34ba988e)  Branch

nt!KiSetClockInterval+0x4f:
fffff805`34ba988b 4833d6          xor     rdx,rsi

nt!KiSetClockInterval+0x52:
fffff805`34ba988e 0fb6c8          movzx   ecx,al
fffff805`34ba9891 4532c0          xor     r8b,r8b
fffff805`34ba9894 83e101          and     ecx,1
fffff805`34ba9897 4885d2          test    rdx,rdx
fffff805`34ba989a 743b            je      nt!KiSetClockInterval+0x9b (fffff805`34ba98d7)  Branch

nt!KiSetClockInterval+0x60:
fffff805`34ba989c 3b7a1c          cmp     edi,dword ptr [rdx+1Ch]
fffff805`34ba989f 721a            jb      nt!KiSetClockInterval+0x7f (fffff805`34ba98bb)  Branch

nt!KiSetClockInterval+0x65:
fffff805`34ba98a1 488b4208        mov     rax,qword ptr [rdx+8]
fffff805`34ba98a5 85c9            test    ecx,ecx
fffff805`34ba98a7 7408            je      nt!KiSetClockInterval+0x75 (fffff805`34ba98b1)  Branch

nt!KiSetClockInterval+0x6d:
fffff805`34ba98a9 4885c0          test    rax,rax
fffff805`34ba98ac 7408            je      nt!KiSetClockInterval+0x7a (fffff805`34ba98b6)  Branch

nt!KiSetClockInterval+0x72:
fffff805`34ba98ae 4833c2          xor     rax,rdx

nt!KiSetClockInterval+0x75:
fffff805`34ba98b1 4885c0          test    rax,rax
fffff805`34ba98b4 7519            jne     nt!KiSetClockInterval+0x93 (fffff805`34ba98cf)  Branch

nt!KiSetClockInterval+0x7a:
fffff805`34ba98b6 41b001          mov     r8b,1
fffff805`34ba98b9 eb1c            jmp     nt!KiSetClockInterval+0x9b (fffff805`34ba98d7)  Branch

nt!KiSetClockInterval+0x7f:
fffff805`34ba98bb 488b02          mov     rax,qword ptr [rdx]
fffff805`34ba98be 85c9            test    ecx,ecx
fffff805`34ba98c0 7408            je      nt!KiSetClockInterval+0x8e (fffff805`34ba98ca)  Branch

nt!KiSetClockInterval+0x86:
fffff805`34ba98c2 4885c0          test    rax,rax
fffff805`34ba98c5 740d            je      nt!KiSetClockInterval+0x98 (fffff805`34ba98d4)  Branch

nt!KiSetClockInterval+0x8b:
fffff805`34ba98c7 4833c2          xor     rax,rdx

nt!KiSetClockInterval+0x8e:
fffff805`34ba98ca 4885c0          test    rax,rax
fffff805`34ba98cd 7405            je      nt!KiSetClockInterval+0x98 (fffff805`34ba98d4)  Branch

nt!KiSetClockInterval+0x93:
fffff805`34ba98cf 488bd0          mov     rdx,rax
fffff805`34ba98d2 ebc8            jmp     nt!KiSetClockInterval+0x60 (fffff805`34ba989c)  Branch

nt!KiSetClockInterval+0x98:
fffff805`34ba98d4 4532c0          xor     r8b,r8b

nt!KiSetClockInterval+0x9b:
fffff805`34ba98d7 4c8bcb          mov     r9,rbx
fffff805`34ba98da 488bce          mov     rcx,rsi
fffff805`34ba98dd e8aeaafaff      call    nt!RtlRbInsertNodeEx (fffff805`34b54390)
fffff805`34ba98e2 c6431801        mov     byte ptr [rbx+18h],1
fffff805`34ba98e6 e851010000      call    nt!KiSetClockIntervalToMinimumRequested (fffff805`34ba9a3c)
fffff805`34ba98eb 8bf0            mov     esi,eax
fffff805`34ba98ed 4084ed          test    bpl,bpl
fffff805`34ba98f0 7406            je      nt!KiSetClockInterval+0xbc (fffff805`34ba98f8)  Branch

nt!KiSetClockInterval+0xb6:
fffff805`34ba98f2 893d380c4500    mov     dword ptr [nt!KeNonHrTimeIncrement (fffff805`34ffa530)],edi

nt!KiSetClockInterval+0xbc:
fffff805`34ba98f8 8b5320          mov     edx,dword ptr [rbx+20h]
fffff805`34ba98fb 85d2            test    edx,edx
fffff805`34ba98fd 7407            je      nt!KiSetClockInterval+0xca (fffff805`34ba9906)  Branch

nt!KiSetClockInterval+0xc3:
fffff805`34ba98ff 8bcf            mov     ecx,edi
fffff805`34ba9901 e876000000      call    nt!PoTraceSystemTimerResolutionKernel (fffff805`34ba997c)

nt!KiSetClockInterval+0xca:
fffff805`34ba9906 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff805`34ba990b 8bc6            mov     eax,esi
fffff805`34ba990d 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff805`34ba9912 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff805`34ba9917 4883c420        add     rsp,20h
fffff805`34ba991b 5f              pop     rdi
fffff805`34ba991c c3              ret
