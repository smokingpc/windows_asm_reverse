13: kd> uf stornvme!NVMeIoSubmissionQueueCreate
stornvme!NVMeIoSubmissionQueueCreate:
fffff809`a8a54a2c 488bc4          mov     rax,rsp
fffff809`a8a54a2f 48895808        mov     qword ptr [rax+8],rbx
fffff809`a8a54a33 48896810        mov     qword ptr [rax+10h],rbp
fffff809`a8a54a37 48897018        mov     qword ptr [rax+18h],rsi
fffff809`a8a54a3b 48897820        mov     qword ptr [rax+20h],rdi
fffff809`a8a54a3f 4156            push    r14
fffff809`a8a54a41 4883ec20        sub     rsp,20h
fffff809`a8a54a45 418af8          mov     dil,r8b
fffff809`a8a54a48 0fb7da          movzx   ebx,dx
fffff809`a8a54a4b 488bf1          mov     rsi,rcx
fffff809`a8a54a4e 33ed            xor     ebp,ebp
fffff809`a8a54a50 4088a92b030000  mov     byte ptr [rcx+32Bh],bpl
fffff809`a8a54a57 33d2            xor     edx,edx
fffff809`a8a54a59 488b8980030000  mov     rcx,qword ptr [rcx+380h]
fffff809`a8a54a60 41b8a0100000    mov     r8d,10A0h
fffff809`a8a54a66 e8551effff      call    stornvme!memset (fffff809`a8a468c0)
fffff809`a8a54a6b 488b8680030000  mov     rax,qword ptr [rsi+380h]
fffff809`a8a54a72 448d7501        lea     r14d,[rbp+1]
fffff809`a8a54a76 4869d388000000  imul    rdx,rbx,88h
fffff809`a8a54a7d 4889a888100000  mov     qword ptr [rax+1088h],rbp
fffff809`a8a54a84 488b8680030000  mov     rax,qword ptr [rsi+380h]
fffff809`a8a54a8b 48898660030000  mov     qword ptr [rsi+360h],rax
fffff809`a8a54a92 4489b620030000  mov     dword ptr [rsi+320h],r14d
fffff809`a8a54a99 4408b09d100000  or      byte ptr [rax+109Dh],r14b
fffff809`a8a54aa0 488b8680030000  mov     rax,qword ptr [rsi+380h]
fffff809`a8a54aa7 80a09d100000fd  and     byte ptr [rax+109Dh],0FDh
fffff809`a8a54aae 488b8680030000  mov     rax,qword ptr [rsi+380h]
fffff809`a8a54ab5 6689a894100000  mov     word ptr [rax+1094h],bp
fffff809`a8a54abc 4c8b8680030000  mov     r8,qword ptr [rsi+380h]
fffff809`a8a54ac3 4981c000100000  add     r8,1000h
fffff809`a8a54aca 458830          mov     byte ptr [r8],r14b
fffff809`a8a54acd 488b86f0020000  mov     rax,qword ptr [rsi+2F0h]
fffff809`a8a54ad4 488b4c0280      mov     rcx,qword ptr [rdx+rax-80h]
fffff809`a8a54ad9 49894818        mov     qword ptr [r8+18h],rcx
fffff809`a8a54add 6641895828      mov     word ptr [r8+28h],bx
fffff809`a8a54ae2 488d9e28030000  lea     rbx,[rsi+328h]
fffff809`a8a54ae9 0fb78606010000  movzx   eax,word ptr [rsi+106h]
fffff809`a8a54af0 66412bc6        sub     ax,r14w
fffff809`a8a54af4 664189402a      mov     word ptr [r8+2Ah],ax
fffff809`a8a54af9 418b402c        mov     eax,dword ptr [r8+2Ch]
fffff809`a8a54afd 83e0fd          and     eax,0FFFFFFFDh
fffff809`a8a54b00 83c805          or      eax,5
fffff809`a8a54b03 4189402c        mov     dword ptr [r8+2Ch],eax
fffff809`a8a54b07 488b86f0020000  mov     rax,qword ptr [rsi+2F0h]
fffff809`a8a54b0e 0fb74c02aa      movzx   ecx,word ptr [rdx+rax-56h]
fffff809`a8a54b13 488bd3          mov     rdx,rbx
fffff809`a8a54b16 664189482e      mov     word ptr [r8+2Eh],cx
fffff809`a8a54b1b 488bce          mov     rcx,rsi
fffff809`a8a54b1e e8f5defeff      call    stornvme!ProcessCommand (fffff809`a8a42a18)
fffff809`a8a54b23 41b910270000    mov     r9d,2710h
fffff809`a8a54b29 448ac7          mov     r8b,dil
fffff809`a8a54b2c 488bd3          mov     rdx,rbx
fffff809`a8a54b2f 488bce          mov     rcx,rsi
fffff809`a8a54b32 e85d280000      call    stornvme!WaitForCommandCompleteWithCustomTimeout (fffff809`a8a57394)
fffff809`a8a54b37 4438b62b030000  cmp     byte ptr [rsi+32Bh],r14b
fffff809`a8a54b3e 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff809`a8a54b43 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff809`a8a54b48 0f94c0          sete    al
fffff809`a8a54b4b 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff809`a8a54b50 488b7c2448      mov     rdi,qword ptr [rsp+48h]
fffff809`a8a54b55 4883c420        add     rsp,20h
fffff809`a8a54b59 415e            pop     r14
fffff809`a8a54b5b c3              ret
