11: kd> uf stornvme!NVMeHwMSIInterrupt
stornvme!NVMeHwMSIInterrupt:
fffff801`78085fb0 4053            push    rbx
fffff801`78085fb2 56              push    rsi
fffff801`78085fb3 57              push    rdi
fffff801`78085fb4 4156            push    r14
fffff801`78085fb6 4883ec38        sub     rsp,38h
fffff801`78085fba 6683b9e800000001 cmp     word ptr [rcx+0E8h],1
fffff801`78085fc2 8bfa            mov     edi,edx
fffff801`78085fc4 488bd9          mov     rbx,rcx
fffff801`78085fc7 41beffff0000    mov     r14d,0FFFFh
fffff801`78085fcd 0f8411410000    je      stornvme!NVMeHwMSIInterrupt+0x4134 (fffff801`7808a0e4)  Branch

stornvme!NVMeHwMSIInterrupt+0x23:
fffff801`78085fd3 0fb7d7          movzx   edx,di
fffff801`78085fd6 e8f5000000      call    stornvme!RequestPendingCompletion (fffff801`780860d0)
fffff801`78085fdb 0fb6f0          movzx   esi,al
fffff801`78085fde 84c0            test    al,al
fffff801`78085fe0 0f84bd000000    je      stornvme!NVMeHwMSIInterrupt+0xf3 (fffff801`780860a3)  Branch

stornvme!NVMeHwMSIInterrupt+0x36:
fffff801`78085fe6 807b1000        cmp     byte ptr [rbx+10h],0
fffff801`78085fea 48896c2430      mov     qword ptr [rsp+30h],rbp
fffff801`78085fef 0f85f8400000    jne     stornvme!NVMeHwMSIInterrupt+0x413d (fffff801`7808a0ed)  Branch

stornvme!NVMeHwMSIInterrupt+0x45:
fffff801`78085ff5 8b4b68          mov     ecx,dword ptr [rbx+68h]
fffff801`78085ff8 f6c101          test    cl,1
fffff801`78085ffb 0f85ec400000    jne     stornvme!NVMeHwMSIInterrupt+0x413d (fffff801`7808a0ed)  Branch

stornvme!NVMeHwMSIInterrupt+0x51:
fffff801`78086001 4032ed          xor     bpl,bpl

stornvme!NVMeHwMSIInterrupt+0x54:
fffff801`78086004 66413bfe        cmp     di,r14w
fffff801`78086008 0f841c410000    je      stornvme!NVMeHwMSIInterrupt+0x417a (fffff801`7808a12a)  Branch

stornvme!NVMeHwMSIInterrupt+0x5e:
fffff801`7808600e 6683bbe800000001 cmp     word ptr [rbx+0E8h],1
fffff801`78086016 0f860e410000    jbe     stornvme!NVMeHwMSIInterrupt+0x417a (fffff801`7808a12a)  Branch

stornvme!NVMeHwMSIInterrupt+0x6c:
fffff801`7808601c 6685ff          test    di,di
fffff801`7808601f 0f8493000000    je      stornvme!NVMeHwMSIInterrupt+0x108 (fffff801`780860b8)  Branch

stornvme!NVMeHwMSIInterrupt+0x75:
fffff801`78086025 0fb7c7          movzx   eax,di
fffff801`78086028 4869c858010000  imul    rcx,rax,158h
fffff801`7808602f 488b83f8020000  mov     rax,qword ptr [rbx+2F8h]
fffff801`78086036 4c8d80a8feffff  lea     r8,[rax-158h]
fffff801`7808603d 4c03c1          add     r8,rcx

stornvme!NVMeHwMSIInterrupt+0x90:
fffff801`78086040 807b1200        cmp     byte ptr [rbx+12h],0
fffff801`78086044 750e            jne     stornvme!NVMeHwMSIInterrupt+0xa4 (fffff801`78086054)  Branch

stornvme!NVMeHwMSIInterrupt+0x96:
fffff801`78086046 8b430c          mov     eax,dword ptr [rbx+0Ch]
fffff801`78086049 ffc8            dec     eax
fffff801`7808604b 83f801          cmp     eax,1
fffff801`7808604e 0f86a1400000    jbe     stornvme!NVMeHwMSIInterrupt+0x4145 (fffff801`7808a0f5)  Branch

stornvme!NVMeHwMSIInterrupt+0xa4:
fffff801`78086054 498d4818        lea     rcx,[r8+18h]
fffff801`78086058 488bd3          mov     rdx,rbx
fffff801`7808605b 4084ed          test    bpl,bpl
fffff801`7808605e 0f85b8400000    jne     stornvme!NVMeHwMSIInterrupt+0x416c (fffff801`7808a11c)  Branch

stornvme!NVMeHwMSIInterrupt+0xb4:
fffff801`78086064 33ff            xor     edi,edi
fffff801`78086066 488d442468      lea     rax,[rsp+68h]
fffff801`7808606b 4d8bc8          mov     r9,r8
fffff801`7808606e 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`78086073 4c8bc1          mov     r8,rcx
fffff801`78086076 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff801`7808607b b902100000      mov     ecx,1002h
fffff801`78086080 897c2468        mov     dword ptr [rsp+68h],edi
fffff801`78086084 48ff15859f0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`780a0010)]    ;StorPortIssueDpc()
fffff801`7808608b 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeHwMSIInterrupt+0xe0:
fffff801`78086090 488b6c2430      mov     rbp,qword ptr [rsp+30h]
fffff801`78086095 400fb6c6        movzx   eax,sil
fffff801`78086099 4883c438        add     rsp,38h
fffff801`7808609d 415e            pop     r14
fffff801`7808609f 5f              pop     rdi
fffff801`780860a0 5e              pop     rsi
fffff801`780860a1 5b              pop     rbx
fffff801`780860a2 c3              ret

stornvme!NVMeHwMSIInterrupt+0xf3:
fffff801`780860a3 48ff83b00e0000  inc     qword ptr [rbx+0EB0h]
fffff801`780860aa 400fb6c6        movzx   eax,sil
fffff801`780860ae 4883c438        add     rsp,38h
fffff801`780860b2 415e            pop     r14
fffff801`780860b4 5f              pop     rdi
fffff801`780860b5 5e              pop     rsi
fffff801`780860b6 5b              pop     rbx
fffff801`780860b7 c3              ret

stornvme!NVMeHwMSIInterrupt+0x108:
fffff801`780860b8 4c8d8398010000  lea     r8,[rbx+198h]
fffff801`780860bf e97cffffff      jmp     stornvme!NVMeHwMSIInterrupt+0x90 (fffff801`78086040)  Branch

stornvme!NVMeHwMSIInterrupt+0x4134:
fffff801`7808a0e4 410fb7fe        movzx   edi,r14w
fffff801`7808a0e8 e9e6beffff      jmp     stornvme!NVMeHwMSIInterrupt+0x23 (fffff801`78085fd3)  Branch

stornvme!NVMeHwMSIInterrupt+0x413d:
fffff801`7808a0ed 40b501          mov     bpl,1
fffff801`7808a0f0 e90fbfffff      jmp     stornvme!NVMeHwMSIInterrupt+0x54 (fffff801`78086004)  Branch

stornvme!NVMeHwMSIInterrupt+0x4145:
fffff801`7808a0f5 410fb688a8000000 movzx   ecx,byte ptr [r8+0A8h]
fffff801`7808a0fd ba01000000      mov     edx,1
fffff801`7808a102 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff801`7808a109 d3e2            shl     edx,cl
fffff801`7808a10b 89500c          mov     dword ptr [rax+0Ch],edx
fffff801`7808a10e f0830c2400      lock or dword ptr [rsp],0
fffff801`7808a113 c6431201        mov     byte ptr [rbx+12h],1
fffff801`7808a117 e938bfffff      jmp     stornvme!NVMeHwMSIInterrupt+0xa4 (fffff801`78086054)  Branch

stornvme!NVMeHwMSIInterrupt+0x416c:
fffff801`7808a11c 4533c9          xor     r9d,r9d
fffff801`7808a11f e8cc77ffff      call    stornvme!NVMeCompletionDpcRoutine (fffff801`780818f0)
fffff801`7808a124 90              nop
fffff801`7808a125 e966bfffff      jmp     stornvme!NVMeHwMSIInterrupt+0xe0 (fffff801`78086090)  Branch

stornvme!NVMeHwMSIInterrupt+0x417a:
fffff801`7808a12a 0fb78b42020000  movzx   ecx,word ptr [rbx+242h]
fffff801`7808a131 4c8d9398010000  lea     r10,[rbx+198h]
fffff801`7808a138 498b02          mov     rax,qword ptr [r10]
fffff801`7808a13b 4803c9          add     rcx,rcx
fffff801`7808a13e 33ff            xor     edi,edi
fffff801`7808a140 0fb754c80e      movzx   edx,word ptr [rax+rcx*8+0Eh]
fffff801`7808a145 6683e201        and     dx,1
fffff801`7808a149 66413b92ac000000 cmp     dx,word ptr [r10+0ACh]
fffff801`7808a151 7453            je      stornvme!NVMeHwMSIInterrupt+0x41f6 (fffff801`7808a1a6)  Branch

stornvme!NVMeHwMSIInterrupt+0x41a3:
fffff801`7808a153 410fb792a8000000 movzx   edx,word ptr [r10+0A8h]
fffff801`7808a15b 488bcb          mov     rcx,rbx
fffff801`7808a15e e89dc20000      call    stornvme!NVMeMaskInterrupt (fffff801`78096400)
fffff801`7808a163 498d4a18        lea     rcx,[r10+18h]
fffff801`7808a167 488bd3          mov     rdx,rbx
fffff801`7808a16a 4084ed          test    bpl,bpl
fffff801`7808a16d 752c            jne     stornvme!NVMeHwMSIInterrupt+0x41eb (fffff801`7808a19b)  Branch

stornvme!NVMeHwMSIInterrupt+0x41bf:
fffff801`7808a16f 488d442460      lea     rax,[rsp+60h]
fffff801`7808a174 897c2460        mov     dword ptr [rsp+60h],edi
fffff801`7808a178 4c8bc1          mov     r8,rcx
fffff801`7808a17b 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`7808a180 4d8bca          mov     r9,r10
fffff801`7808a183 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff801`7808a188 b902100000      mov     ecx,1002h
fffff801`7808a18d 48ff157c5e0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`780a0010)]    ;StorPortIssueDpc()
fffff801`7808a194 0f1f440000      nop     dword ptr [rax+rax]
fffff801`7808a199 eb0b            jmp     stornvme!NVMeHwMSIInterrupt+0x41f6 (fffff801`7808a1a6)  Branch

stornvme!NVMeHwMSIInterrupt+0x41eb:
fffff801`7808a19b 4533c9          xor     r9d,r9d
fffff801`7808a19e 4d8bc2          mov     r8,r10
fffff801`7808a1a1 e84a77ffff      call    stornvme!NVMeCompletionDpcRoutine (fffff801`780818f0)

stornvme!NVMeHwMSIInterrupt+0x41f6:
fffff801`7808a1a6 488b8bf8020000  mov     rcx,qword ptr [rbx+2F8h]
fffff801`7808a1ad 448bf7          mov     r14d,edi
fffff801`7808a1b0 4885c9          test    rcx,rcx
fffff801`7808a1b3 0f84d7beffff    je      stornvme!NVMeHwMSIInterrupt+0xe0 (fffff801`78086090)  Branch

stornvme!NVMeHwMSIInterrupt+0x4209:
fffff801`7808a1b9 0fb7830a010000  movzx   eax,word ptr [rbx+10Ah]
fffff801`7808a1c0 443bf0          cmp     r14d,eax
fffff801`7808a1c3 0f83c7beffff    jae     stornvme!NVMeHwMSIInterrupt+0xe0 (fffff801`78086090)  Branch

stornvme!NVMeHwMSIInterrupt+0x4219:
fffff801`7808a1c9 418bc6          mov     eax,r14d
fffff801`7808a1cc 4c69d058010000  imul    r10,rax,158h
fffff801`7808a1d3 4c03d1          add     r10,rcx
fffff801`7808a1d6 410fb78aaa000000 movzx   ecx,word ptr [r10+0AAh]
fffff801`7808a1de 498b02          mov     rax,qword ptr [r10]
fffff801`7808a1e1 4803c9          add     rcx,rcx
fffff801`7808a1e4 0fb74cc80e      movzx   ecx,word ptr [rax+rcx*8+0Eh]
fffff801`7808a1e9 6683e101        and     cx,1
fffff801`7808a1ed 66413b8aac000000 cmp     cx,word ptr [r10+0ACh]
fffff801`7808a1f5 7453            je      stornvme!NVMeHwMSIInterrupt+0x429a (fffff801`7808a24a)  Branch

stornvme!NVMeHwMSIInterrupt+0x4247:
fffff801`7808a1f7 410fb792a8000000 movzx   edx,word ptr [r10+0A8h]
fffff801`7808a1ff 488bcb          mov     rcx,rbx
fffff801`7808a202 e8f9c10000      call    stornvme!NVMeMaskInterrupt (fffff801`78096400)
fffff801`7808a207 498d4a18        lea     rcx,[r10+18h]
fffff801`7808a20b 488bd3          mov     rdx,rbx
fffff801`7808a20e 4084ed          test    bpl,bpl
fffff801`7808a211 752c            jne     stornvme!NVMeHwMSIInterrupt+0x428f (fffff801`7808a23f)  Branch

stornvme!NVMeHwMSIInterrupt+0x4263:
fffff801`7808a213 488d442470      lea     rax,[rsp+70h]
fffff801`7808a218 897c2470        mov     dword ptr [rsp+70h],edi
fffff801`7808a21c 4c8bc1          mov     r8,rcx
fffff801`7808a21f 4889442428      mov     qword ptr [rsp+28h],rax
fffff801`7808a224 4d8bca          mov     r9,r10
fffff801`7808a227 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff801`7808a22c b902100000      mov     ecx,1002h
fffff801`7808a231 48ff15d85d0100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`780a0010)]    ;StorPortIssueDpc()
fffff801`7808a238 0f1f440000      nop     dword ptr [rax+rax]
fffff801`7808a23d eb0b            jmp     stornvme!NVMeHwMSIInterrupt+0x429a (fffff801`7808a24a)  Branch

stornvme!NVMeHwMSIInterrupt+0x428f:
fffff801`7808a23f 4533c9          xor     r9d,r9d
fffff801`7808a242 4d8bc2          mov     r8,r10
fffff801`7808a245 e8a676ffff      call    stornvme!NVMeCompletionDpcRoutine (fffff801`780818f0)

stornvme!NVMeHwMSIInterrupt+0x429a:
fffff801`7808a24a 488b8bf8020000  mov     rcx,qword ptr [rbx+2F8h]
fffff801`7808a251 41ffc6          inc     r14d
fffff801`7808a254 4885c9          test    rcx,rcx
fffff801`7808a257 0f855cffffff    jne     stornvme!NVMeHwMSIInterrupt+0x4209 (fffff801`7808a1b9)  Branch

stornvme!NVMeHwMSIInterrupt+0x42ad:
fffff801`7808a25d e92ebeffff      jmp     stornvme!NVMeHwMSIInterrupt+0xe0 (fffff801`78086090)  Branch
