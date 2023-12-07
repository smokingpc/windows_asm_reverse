0: kd> uf stornvme!ProcessCompletionQueues
stornvme!ProcessCompletionQueues:
fffff803`c6577d5c 48895c2408      mov     qword ptr [rsp+8],rbx
fffff803`c6577d61 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff803`c6577d66 56              push    rsi
fffff803`c6577d67 57              push    rdi
fffff803`c6577d68 4156            push    r14
fffff803`c6577d6a 4883ec30        sub     rsp,30h
fffff803`c6577d6e 33ed            xor     ebp,ebp
fffff803`c6577d70 488bd9          mov     rbx,rcx
fffff803`c6577d73 448d7501        lea     r14d,[rbp+1]      ;r14d==1
fffff803`c6577d77 40386910        cmp     byte ptr [rcx+10h],bpl        ;if( *[pAE+0x10] != 0) goto 0x31
fffff803`c6577d7b 7510            jne     stornvme!ProcessCompletionQueues+0x31 (fffff803`c6577d8d)  Branch

stornvme!ProcessCompletionQueues+0x21:
fffff803`c6577d7d 4584c0          test    r8b,r8b       ;if(arg3) goto 0x31
fffff803`c6577d80 750b            jne     stornvme!ProcessCompletionQueues+0x31 (fffff803`c6577d8d)  Branch

stornvme!ProcessCompletionQueues+0x26:
fffff803`c6577d82 8b4168          mov     eax,dword ptr [rcx+68h]
fffff803`c6577d85 408afd          mov     dil,bpl
fffff803`c6577d88 4184c6          test    r14b,al
fffff803`c6577d8b 7403            je      stornvme!ProcessCompletionQueues+0x34 (fffff803`c6577d90)  Branch

stornvme!ProcessCompletionQueues+0x31:
fffff803`c6577d8d 418afe          mov     dil,r14b      ;???

stornvme!ProcessCompletionQueues+0x34:
fffff803`c6577d90 b8ffff0000      mov     eax,0FFFFh
fffff803`c6577d95 663bd0          cmp     dx,ax         ;if arg2(QID) == INVALID_QID, goto 0xd4 (AdminQ handler)
fffff803`c6577d98 0f8492000000    je      stornvme!ProcessCompletionQueues+0xd4 (fffff803`c6577e30)  Branch

stornvme!ProcessCompletionQueues+0x42:
fffff803`c6577d9e 664439b1f0000000 cmp     word ptr [rcx+0F0h],r14w ;pAE+0xF0 is allocated interrupt counter
fffff803`c6577da6 0f8684000000    jbe     stornvme!ProcessCompletionQueues+0xd4 (fffff803`c6577e30)  Branch ;if [rcx+0F0h] < 1 goto 0xd4 => if interrupt not allocated, treat this in admnin queue???

stornvme!ProcessCompletionQueues+0x50:
fffff803`c6577dac 6685d2          test    dx,dx     ;if QID!=0 goto 0x5e
fffff803`c6577daf 7509            jne     stornvme!ProcessCompletionQueues+0x5e (fffff803`c6577dba)  Branch

stornvme!ProcessCompletionQueues+0x55:
fffff803`c6577db1 4c8d91a0010000  lea     r10,[rcx+1A0h]        ;read CplQ VA => Admin CplQ
fffff803`c6577db8 eb1b            jmp     stornvme!ProcessCompletionQueues+0x79 (fffff803`c6577dd5)  Branch

stornvme!ProcessCompletionQueues+0x5e:
fffff803`c6577dba 4c8b9300030000  mov     r10,qword ptr [rbx+300h]
fffff803`c6577dc1 0fb7c2          movzx   eax,dx
fffff803`c6577dc4 4981c2a8feffff  add     r10,0FFFFFFFFFFFFFEA8h
fffff803`c6577dcb 4869c858010000  imul    rcx,rax,158h
fffff803`c6577dd2 4c03d1          add     r10,rcx

stornvme!ProcessCompletionQueues+0x79:
fffff803`c6577dd5 410fb792a8000000 movzx   edx,word ptr [r10+0A8h]
fffff803`c6577ddd 488bcb          mov     rcx,rbx
fffff803`c6577de0 e8cbe6ffff      call    stornvme!NVMeMaskInterrupt (fffff803`c65764b0)    ;mask interrupts then poll queue myself?
fffff803`c6577de5 498d4a18        lea     rcx,[r10+18h]
fffff803`c6577de9 488bd3          mov     rdx,rbx
fffff803`c6577dec 4084ff          test    dil,dil
fffff803`c6577def 752f            jne     stornvme!ProcessCompletionQueues+0xc4 (fffff803`c6577e20)  Branch

stornvme!ProcessCompletionQueues+0x95:
fffff803`c6577df1 488d442458      lea     rax,[rsp+58h]
fffff803`c6577df6 896c2458        mov     dword ptr [rsp+58h],ebp
fffff803`c6577dfa 4c8bc1          mov     r8,rcx
fffff803`c6577dfd 4889442428      mov     qword ptr [rsp+28h],rax
fffff803`c6577e02 4d8bca          mov     r9,r10
fffff803`c6577e05 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff803`c6577e0a b902100000      mov     ecx,1002h                 ;IssueDPC
fffff803`c6577e0f 48ff15fa810000  call    qword ptr [stornvme!_imp_StorPortNotification (fffff803`c6580010)]
fffff803`c6577e16 0f1f440000      nop     dword ptr [rax+rax]
fffff803`c6577e1b e934010000      jmp     stornvme!ProcessCompletionQueues+0x1f8 (fffff803`c6577f54)  Branch

stornvme!ProcessCompletionQueues+0xc4:
fffff803`c6577e20 4533c9          xor     r9d,r9d
fffff803`c6577e23 4d8bc2          mov     r8,r10
fffff803`c6577e26 e8a597feff      call    stornvme!NVMeCompletionDpcRoutine (fffff803`c65615d0)
fffff803`c6577e2b e924010000      jmp     stornvme!ProcessCompletionQueues+0x1f8 (fffff803`c6577f54)  Branch

stornvme!ProcessCompletionQueues+0xd4:
fffff803`c6577e30 4c8d91a0010000  lea     r10,[rcx+1A0h]            ;rcx+0x1A0 ©ñ AdminCplQ va
fffff803`c6577e37 410fb78aaa000000 movzx   ecx,word ptr [r10+0AAh]  ;rcx+0x1A0+0xAA => CplDBHead ?
fffff803`c6577e3f 498b02          mov     rax,qword ptr [r10]       ; Admin CplQ va
fffff803`c6577e42 4803c9          add     rcx,rcx                   ; calculate CplHeadPtr?
fffff803`c6577e45 0fb754c80e      movzx   edx,word ptr [rax+rcx*8+0Eh]  ;read NVME_COMMAND_STATUS of cpl entry
fffff803`c6577e4a 664123d6        and     dx,r14w                       ;AND to get PhaseTag
fffff803`c6577e4e 66413b92ac000000 cmp     dx,word ptr [r10+0ACh]       ;rcx+0x1A0+0xAC => Current PhaseTag?
fffff803`c6577e56 7453            je      stornvme!ProcessCompletionQueues+0x14f (fffff803`c6577eab)  Branch    ;if same PhaseTag => return....

stornvme!ProcessCompletionQueues+0xfc:
fffff803`c6577e58 410fb792a8000000 movzx   edx,word ptr [r10+0A8h]
fffff803`c6577e60 488bcb          mov     rcx,rbx
fffff803`c6577e63 e848e6ffff      call    stornvme!NVMeMaskInterrupt (fffff803`c65764b0)
fffff803`c6577e68 498d4a18        lea     rcx,[r10+18h]
fffff803`c6577e6c 488bd3          mov     rdx,rbx
fffff803`c6577e6f 4084ff          test    dil,dil
fffff803`c6577e72 752c            jne     stornvme!ProcessCompletionQueues+0x144 (fffff803`c6577ea0)  Branch

stornvme!ProcessCompletionQueues+0x118:
fffff803`c6577e74 488d442458      lea     rax,[rsp+58h]
fffff803`c6577e79 896c2458        mov     dword ptr [rsp+58h],ebp
fffff803`c6577e7d 4c8bc1          mov     r8,rcx
fffff803`c6577e80 4889442428      mov     qword ptr [rsp+28h],rax
fffff803`c6577e85 4d8bca          mov     r9,r10
fffff803`c6577e88 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff803`c6577e8d b902100000      mov     ecx,1002h
fffff803`c6577e92 48ff1577810000  call    qword ptr [stornvme!_imp_StorPortNotification (fffff803`c6580010)]
fffff803`c6577e99 0f1f440000      nop     dword ptr [rax+rax]
fffff803`c6577e9e eb0b            jmp     stornvme!ProcessCompletionQueues+0x14f (fffff803`c6577eab)  Branch

stornvme!ProcessCompletionQueues+0x144:
fffff803`c6577ea0 4533c9          xor     r9d,r9d
fffff803`c6577ea3 4d8bc2          mov     r8,r10
fffff803`c6577ea6 e82597feff      call    stornvme!NVMeCompletionDpcRoutine (fffff803`c65615d0)

stornvme!ProcessCompletionQueues+0x14f:
fffff803`c6577eab 8bf5            mov     esi,ebp
fffff803`c6577ead e992000000      jmp     stornvme!ProcessCompletionQueues+0x1e8 (fffff803`c6577f44)  Branch

stornvme!ProcessCompletionQueues+0x156:
fffff803`c6577eb2 0fb78312010000  movzx   eax,word ptr [rbx+112h]
fffff803`c6577eb9 3bf0            cmp     esi,eax
fffff803`c6577ebb 0f8393000000    jae     stornvme!ProcessCompletionQueues+0x1f8 (fffff803`c6577f54)  Branch

stornvme!ProcessCompletionQueues+0x165:
fffff803`c6577ec1 8bc6            mov     eax,esi
fffff803`c6577ec3 4c69d058010000  imul    r10,rax,158h
fffff803`c6577eca 4c03d1          add     r10,rcx
fffff803`c6577ecd 410fb78aaa000000 movzx   ecx,word ptr [r10+0AAh]
fffff803`c6577ed5 498b02          mov     rax,qword ptr [r10]
fffff803`c6577ed8 4803c9          add     rcx,rcx
fffff803`c6577edb 0fb74cc80e      movzx   ecx,word ptr [rax+rcx*8+0Eh]
fffff803`c6577ee0 664123ce        and     cx,r14w
fffff803`c6577ee4 66413b8aac000000 cmp     cx,word ptr [r10+0ACh]
fffff803`c6577eec 7453            je      stornvme!ProcessCompletionQueues+0x1e5 (fffff803`c6577f41)  Branch

stornvme!ProcessCompletionQueues+0x192:
fffff803`c6577eee 410fb792a8000000 movzx   edx,word ptr [r10+0A8h]
fffff803`c6577ef6 488bcb          mov     rcx,rbx
fffff803`c6577ef9 e8b2e5ffff      call    stornvme!NVMeMaskInterrupt (fffff803`c65764b0)
fffff803`c6577efe 498d4a18        lea     rcx,[r10+18h]
fffff803`c6577f02 488bd3          mov     rdx,rbx
fffff803`c6577f05 4084ff          test    dil,dil
fffff803`c6577f08 752c            jne     stornvme!ProcessCompletionQueues+0x1da (fffff803`c6577f36)  Branch

stornvme!ProcessCompletionQueues+0x1ae:
fffff803`c6577f0a 488d442458      lea     rax,[rsp+58h]
fffff803`c6577f0f 896c2458        mov     dword ptr [rsp+58h],ebp
fffff803`c6577f13 4c8bc1          mov     r8,rcx
fffff803`c6577f16 4889442428      mov     qword ptr [rsp+28h],rax
fffff803`c6577f1b 4d8bca          mov     r9,r10
fffff803`c6577f1e 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff803`c6577f23 b902100000      mov     ecx,1002h
fffff803`c6577f28 48ff15e1800000  call    qword ptr [stornvme!_imp_StorPortNotification (fffff803`c6580010)]
fffff803`c6577f2f 0f1f440000      nop     dword ptr [rax+rax]
fffff803`c6577f34 eb0b            jmp     stornvme!ProcessCompletionQueues+0x1e5 (fffff803`c6577f41)  Branch

stornvme!ProcessCompletionQueues+0x1da:
fffff803`c6577f36 4533c9          xor     r9d,r9d
fffff803`c6577f39 4d8bc2          mov     r8,r10
fffff803`c6577f3c e88f96feff      call    stornvme!NVMeCompletionDpcRoutine (fffff803`c65615d0)

stornvme!ProcessCompletionQueues+0x1e5:
fffff803`c6577f41 4103f6          add     esi,r14d

stornvme!ProcessCompletionQueues+0x1e8:
fffff803`c6577f44 488b8b00030000  mov     rcx,qword ptr [rbx+300h]
fffff803`c6577f4b 4885c9          test    rcx,rcx
fffff803`c6577f4e 0f855effffff    jne     stornvme!ProcessCompletionQueues+0x156 (fffff803`c6577eb2)  Branch

stornvme!ProcessCompletionQueues+0x1f8:
fffff803`c6577f54 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff803`c6577f59 488b6c2460      mov     rbp,qword ptr [rsp+60h]
fffff803`c6577f5e 4883c430        add     rsp,30h
fffff803`c6577f62 415e            pop     r14
fffff803`c6577f64 5f              pop     rdi
fffff803`c6577f65 5e              pop     rsi
fffff803`c6577f66 c3              ret
