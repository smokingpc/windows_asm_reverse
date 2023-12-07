0: kd> uf stornvme!NVMeCompleteSubmissionQueueRequests
stornvme!NVMeCompleteSubmissionQueueRequests:
fffff803`20c0bd50 4585c0          test    r8d,r8d
fffff803`20c0bd53 0f84d1000000    je      stornvme!NVMeCompleteSubmissionQueueRequests+0xda (fffff803`20c0be2a)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x9:
fffff803`20c0bd59 48895c2408      mov     qword ptr [rsp+8],rbx
fffff803`20c0bd5e 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff803`20c0bd63 56              push    rsi
fffff803`20c0bd64 57              push    rdi
fffff803`20c0bd65 4154            push    r12
fffff803`20c0bd67 4156            push    r14
fffff803`20c0bd69 4157            push    r15
fffff803`20c0bd6b 4883ec20        sub     rsp,20h
fffff803`20c0bd6f 448aa42480000000 mov     r12b,byte ptr [rsp+80h]
fffff803`20c0bd77 458bf1          mov     r14d,r9d
fffff803`20c0bd7a 4c8bfa          mov     r15,rdx
fffff803`20c0bd7d 418be8          mov     ebp,r8d
fffff803`20c0bd80 488bf1          mov     rsi,rcx
fffff803`20c0bd83 33ff            xor     edi,edi

stornvme!NVMeCompleteSubmissionQueueRequests+0x35:
fffff803`20c0bd85 498b4720        mov     rax,qword ptr [r15+20h]
fffff803`20c0bd89 33db            xor     ebx,ebx
fffff803`20c0bd8b 48871c07        xchg    rbx,qword ptr [rdi+rax]
fffff803`20c0bd8f 4885db          test    rbx,rbx
fffff803`20c0bd92 7472            je      stornvme!NVMeCompleteSubmissionQueueRequests+0xb6 (fffff803`20c0be06)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x44:
fffff803`20c0bd94 807b0228        cmp     byte ptr [rbx+2],28h
fffff803`20c0bd98 7509            jne     stornvme!NVMeCompleteSubmissionQueueRequests+0x53 (fffff803`20c0bda3)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x4a:
fffff803`20c0bd9a 8b4334          mov     eax,dword ptr [rbx+34h]
fffff803`20c0bd9d 8a4c180a        mov     cl,byte ptr [rax+rbx+0Ah]
fffff803`20c0bda1 eb03            jmp     stornvme!NVMeCompleteSubmissionQueueRequests+0x56 (fffff803`20c0bda6)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x53:
fffff803`20c0bda3 8a4b07          mov     cl,byte ptr [rbx+7]

stornvme!NVMeCompleteSubmissionQueueRequests+0x56:
fffff803`20c0bda6 807c247801      cmp     byte ptr [rsp+78h],1
fffff803`20c0bdab 440fb6d9        movzx   r11d,cl
fffff803`20c0bdaf 44895c2460      mov     dword ptr [rsp+60h],r11d
fffff803`20c0bdb4 750f            jne     stornvme!NVMeCompleteSubmissionQueueRequests+0x75 (fffff803`20c0bdc5)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x66:
fffff803`20c0bdb6 488bd3          mov     rdx,rbx
fffff803`20c0bdb9 488bce          mov     rcx,rsi
fffff803`20c0bdbc e85bdaffff      call    stornvme!IsInternalSrb (fffff803`20c0981c)
fffff803`20c0bdc1 84c0            test    al,al
fffff803`20c0bdc3 7541            jne     stornvme!NVMeCompleteSubmissionQueueRequests+0xb6 (fffff803`20c0be06)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x75:
fffff803`20c0bdc5 807c247001      cmp     byte ptr [rsp+70h],1
fffff803`20c0bdca 7405            je      stornvme!NVMeCompleteSubmissionQueueRequests+0x81 (fffff803`20c0bdd1)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x7c:
fffff803`20c0bdcc 453bf3          cmp     r14d,r11d
fffff803`20c0bdcf 7535            jne     stornvme!NVMeCompleteSubmissionQueueRequests+0xb6 (fffff803`20c0be06)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x81:
fffff803`20c0bdd1 488bcb          mov     rcx,rbx
fffff803`20c0bdd4 e8bf90ffff      call    stornvme!GetSrbExtension (fffff803`20c04e98)
fffff803`20c0bdd9 44886303        mov     byte ptr [rbx+3],r12b
fffff803`20c0bddd 488b8080100000  mov     rax,qword ptr [rax+1080h]
fffff803`20c0bde4 4885c0          test    rax,rax
fffff803`20c0bde7 740f            je      stornvme!NVMeCompleteSubmissionQueueRequests+0xa8 (fffff803`20c0bdf8)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0x99:
fffff803`20c0bde9 4533c0          xor     r8d,r8d
fffff803`20c0bdec 488bd3          mov     rdx,rbx
fffff803`20c0bdef 488bce          mov     rcx,rsi
fffff803`20c0bdf2 ff15a8320100    call    qword ptr [stornvme!_guard_dispatch_icall_fptr (fffff803`20c1f0a0)]

stornvme!NVMeCompleteSubmissionQueueRequests+0xa8:
fffff803`20c0bdf8 4533c0          xor     r8d,r8d
fffff803`20c0bdfb 488bd3          mov     rdx,rbx
fffff803`20c0bdfe 488bce          mov     rcx,rsi
fffff803`20c0be01 e8ce250000      call    stornvme!NVMeRequestComplete (fffff803`20c0e3d4)

stornvme!NVMeCompleteSubmissionQueueRequests+0xb6:
fffff803`20c0be06 4883c710        add     rdi,10h
fffff803`20c0be0a 4883ed01        sub     rbp,1
fffff803`20c0be0e 0f8571ffffff    jne     stornvme!NVMeCompleteSubmissionQueueRequests+0x35 (fffff803`20c0bd85)  Branch

stornvme!NVMeCompleteSubmissionQueueRequests+0xc4:
fffff803`20c0be14 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff803`20c0be19 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff803`20c0be1e 4883c420        add     rsp,20h
fffff803`20c0be22 415f            pop     r15
fffff803`20c0be24 415e            pop     r14
fffff803`20c0be26 415c            pop     r12
fffff803`20c0be28 5f              pop     rdi
fffff803`20c0be29 5e              pop     rsi

stornvme!NVMeCompleteSubmissionQueueRequests+0xda:
fffff803`20c0be2a c3              ret  Branch
