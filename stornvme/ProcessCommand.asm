 3: kd> uf ProcessCommand
stornvme!ProcessCommand:
fffff800`243b2d60 48895c2408      mov     qword ptr [rsp+8],rbx
fffff800`243b2d65 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff800`243b2d6a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff800`243b2d6f 57              push    rdi
fffff800`243b2d70 4154            push    r12
fffff800`243b2d72 4155            push    r13
fffff800`243b2d74 4156            push    r14
fffff800`243b2d76 4157            push    r15
fffff800`243b2d78 4883ec20        sub     rsp,20h
fffff800`243b2d7c 488bd9          mov     rbx,rcx
fffff800`243b2d7f 488bfa          mov     rdi,rdx
fffff800`243b2d82 488bca          mov     rcx,rdx       ;rdx == arg2 == srb
fffff800`243b2d85 e8ba2c0000      call    stornvme!GetSrbExtension (fffff800`243b5a44)
fffff800`243b2d8a 488be8          mov     rbp,rax
fffff800`243b2d8d 4533ed          xor     r13d,r13d
fffff800`243b2d90 0fb78094100000  movzx   eax,word ptr [rax+1094h]  ;Srb+0x1094??
fffff800`243b2d97 6685c0          test    ax,ax
fffff800`243b2d9a 7511            jne     stornvme!ProcessCommand+0x4d (fffff800`243b2dad)  Branch

stornvme!ProcessCommand+0x3c:
fffff800`243b2d9c 440fb7b314010000 movzx   r14d,word ptr [rbx+114h]     ;DevExt+0x114 == 0x100 ??
fffff800`243b2da4 488db320010000  lea     rsi,[rbx+120h]                ;AdmQueue VirtualAddress
fffff800`243b2dab eb20            jmp     stornvme!ProcessCommand+0x6d (fffff800`243b2dcd)  Branch

stornvme!ProcessCommand+0x4d:
fffff800`243b2dad 488bb300030000  mov     rsi,qword ptr [rbx+300h]
fffff800`243b2db4 440fb7b316010000 movzx   r14d,word ptr [rbx+116h]
fffff800`243b2dbc 4881c678ffffff  add     rsi,0FFFFFFFFFFFFFF78h
fffff800`243b2dc3 4869c888000000  imul    rcx,rax,88h
fffff800`243b2dca 4803f1          add     rsi,rcx

stornvme!ProcessCommand+0x6d:
fffff800`243b2dcd 450fb7ce        movzx   r9d,r14w
fffff800`243b2dd1 4c8bc6          mov     r8,rsi
fffff800`243b2dd4 488bcb          mov     rcx,rbx
fffff800`243b2dd7 e8b40b0000      call    stornvme!ProcessCommandInSpecificQueue (fffff800`243b3990)
fffff800`243b2ddc 84c0            test    al,al
fffff800`243b2dde 0f85f1000000    jne     stornvme!ProcessCommand+0x175 (fffff800`243b2ed5)  Branch

stornvme!ProcessCommand+0x84:
fffff800`243b2de4 8a4703          mov     al,byte ptr [rdi+3]
fffff800`243b2de7 3c05            cmp     al,5
fffff800`243b2de9 0f85d8000000    jne     stornvme!ProcessCommand+0x167 (fffff800`243b2ec7)  Branch

stornvme!ProcessCommand+0x8f:
fffff800`243b2def 6644396e28      cmp     word ptr [rsi+28h],r13w
fffff800`243b2df4 0f8481000000    je      stornvme!ProcessCommand+0x11b (fffff800`243b2e7b)  Branch

stornvme!ProcessCommand+0x9a:
fffff800`243b2dfa 0fb78318010000  movzx   eax,word ptr [rbx+118h]
fffff800`243b2e01 458bfd          mov     r15d,r13d
fffff800`243b2e04 808d9d10000010  or      byte ptr [rbp+109Dh],10h
fffff800`243b2e0b 448be0          mov     r12d,eax
fffff800`243b2e0e 85c0            test    eax,eax
fffff800`243b2e10 0f84b1000000    je      stornvme!ProcessCommand+0x167 (fffff800`243b2ec7)  Branch

stornvme!ProcessCommand+0xb6:
fffff800`243b2e16 0fb74628        movzx   eax,word ptr [rsi+28h]
fffff800`243b2e1a 33d2            xor     edx,edx
fffff800`243b2e1c 0fb78b18010000  movzx   ecx,word ptr [rbx+118h]
fffff800`243b2e23 ffc0            inc     eax
fffff800`243b2e25 f7f1            div     eax,ecx
fffff800`243b2e27 b801000000      mov     eax,1
fffff800`243b2e2c 450fb7ce        movzx   r9d,r14w
fffff800`243b2e30 6685d2          test    dx,dx
fffff800`243b2e33 660f45c2        cmovne  ax,dx
fffff800`243b2e37 488bd7          mov     rdx,rdi
fffff800`243b2e3a 0fb7c0          movzx   eax,ax
fffff800`243b2e3d 4869c888000000  imul    rcx,rax,88h
fffff800`243b2e44 66898594100000  mov     word ptr [rbp+1094h],ax
fffff800`243b2e4b 488bb300030000  mov     rsi,qword ptr [rbx+300h]
fffff800`243b2e52 4881c678ffffff  add     rsi,0FFFFFFFFFFFFFF78h
fffff800`243b2e59 4803f1          add     rsi,rcx
fffff800`243b2e5c 488bcb          mov     rcx,rbx
fffff800`243b2e5f 4c8bc6          mov     r8,rsi
fffff800`243b2e62 e8290b0000      call    stornvme!ProcessCommandInSpecificQueue (fffff800`243b3990)
fffff800`243b2e67 84c0            test    al,al
fffff800`243b2e69 756a            jne     stornvme!ProcessCommand+0x175 (fffff800`243b2ed5)  Branch

stornvme!ProcessCommand+0x10b:
fffff800`243b2e6b 807f0305        cmp     byte ptr [rdi+3],5
fffff800`243b2e6f 7556            jne     stornvme!ProcessCommand+0x167 (fffff800`243b2ec7)  Branch

stornvme!ProcessCommand+0x111:
fffff800`243b2e71 41ffc7          inc     r15d
fffff800`243b2e74 453bfc          cmp     r15d,r12d
fffff800`243b2e77 729d            jb      stornvme!ProcessCommand+0xb6 (fffff800`243b2e16)  Branch

stornvme!ProcessCommand+0x119:
fffff800`243b2e79 eb4c            jmp     stornvme!ProcessCommand+0x167 (fffff800`243b2ec7)  Branch

stornvme!ProcessCommand+0x11b:
fffff800`243b2e7b 3c05            cmp     al,5
fffff800`243b2e7d 7548            jne     stornvme!ProcessCommand+0x167 (fffff800`243b2ec7)  Branch

stornvme!ProcessCommand+0x11f:
fffff800`243b2e7f 6644396e28      cmp     word ptr [rsi+28h],r13w
fffff800`243b2e84 7541            jne     stornvme!ProcessCommand+0x167 (fffff800`243b2ec7)  Branch

stornvme!ProcessCommand+0x126:
fffff800`243b2e86 418bed          mov     ebp,r13d

stornvme!ProcessCommand+0x129:
fffff800`243b2e89 41b8e8030000    mov     r8d,3E8h
fffff800`243b2e8f 488bd3          mov     rdx,rbx
fffff800`243b2e92 b951000000      mov     ecx,51h
fffff800`243b2e97 4c8b158a510200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff800`243d8028)]
fffff800`243b2e9e e82dc8f4ff      call    storport!StorPortExtendedFunction (fffff800`242ff6d0)
fffff800`243b2ea3 f0ff8338030000  lock inc dword ptr [rbx+338h]
fffff800`243b2eaa 450fb7ce        movzx   r9d,r14w
fffff800`243b2eae 4c8bc6          mov     r8,rsi
fffff800`243b2eb1 488bd7          mov     rdx,rdi
fffff800`243b2eb4 488bcb          mov     rcx,rbx
fffff800`243b2eb7 e8d40a0000      call    stornvme!ProcessCommandInSpecificQueue (fffff800`243b3990)
fffff800`243b2ebc 84c0            test    al,al
fffff800`243b2ebe 7515            jne     stornvme!ProcessCommand+0x175 (fffff800`243b2ed5)  Branch

stornvme!ProcessCommand+0x160:
fffff800`243b2ec0 ffc5            inc     ebp
fffff800`243b2ec2 83fd04          cmp     ebp,4
fffff800`243b2ec5 72c2            jb      stornvme!ProcessCommand+0x129 (fffff800`243b2e89)  Branch

stornvme!ProcessCommand+0x167:
fffff800`243b2ec7 4533c0          xor     r8d,r8d
fffff800`243b2eca 488bd7          mov     rdx,rdi
fffff800`243b2ecd 488bcb          mov     rcx,rbx
fffff800`243b2ed0 e8ffd90000      call    stornvme!NVMeRequestComplete (fffff800`243c08d4)

stornvme!ProcessCommand+0x175:
fffff800`243b2ed5 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff800`243b2eda 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff800`243b2edf 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff800`243b2ee4 4883c420        add     rsp,20h
fffff800`243b2ee8 415f            pop     r15
fffff800`243b2eea 415e            pop     r14
fffff800`243b2eec 415d            pop     r13
fffff800`243b2eee 415c            pop     r12
fffff800`243b2ef0 5f              pop     rdi
fffff800`243b2ef1 c3              ret
