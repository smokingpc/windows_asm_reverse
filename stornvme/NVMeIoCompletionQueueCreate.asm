13: kd> uf stornvme!NVMeIoCompletionQueueCreate
stornvme!NVMeIoCompletionQueueCreate:
fffff809`a8a545d0 488bc4          mov     rax,rsp
fffff809`a8a545d3 48895808        mov     qword ptr [rax+8],rbx
fffff809`a8a545d7 48896810        mov     qword ptr [rax+10h],rbp
fffff809`a8a545db 48897018        mov     qword ptr [rax+18h],rsi
fffff809`a8a545df 48897820        mov     qword ptr [rax+20h],rdi
fffff809`a8a545e3 4156            push    r14
fffff809`a8a545e5 4883ec20        sub     rsp,20h
fffff809`a8a545e9 418af0          mov     sil,r8b
fffff809`a8a545ec 0fb7da          movzx   ebx,dx
fffff809`a8a545ef 488bf9          mov     rdi,rcx
fffff809`a8a545f2 33ed            xor     ebp,ebp
fffff809`a8a545f4 4088a92b030000  mov     byte ptr [rcx+32Bh],bpl
fffff809`a8a545fb 33d2            xor     edx,edx
fffff809`a8a545fd 488b8980030000  mov     rcx,qword ptr [rcx+380h]
fffff809`a8a54604 41b8a0100000    mov     r8d,10A0h
fffff809`a8a5460a e8b122ffff      call    stornvme!memset (fffff809`a8a468c0)
fffff809`a8a5460f 488b8780030000  mov     rax,qword ptr [rdi+380h]
fffff809`a8a54616 448d7501        lea     r14d,[rbp+1]
fffff809`a8a5461a 4c69c358010000  imul    r8,rbx,158h
fffff809`a8a54621 4889a888100000  mov     qword ptr [rax+1088h],rbp
fffff809`a8a54628 488b8780030000  mov     rax,qword ptr [rdi+380h]
fffff809`a8a5462f 48898760030000  mov     qword ptr [rdi+360h],rax
fffff809`a8a54636 4489b720030000  mov     dword ptr [rdi+320h],r14d
fffff809`a8a5463d 4408b09d100000  or      byte ptr [rax+109Dh],r14b
fffff809`a8a54644 488b8780030000  mov     rax,qword ptr [rdi+380h]
fffff809`a8a5464b 80a09d100000fd  and     byte ptr [rax+109Dh],0FDh
fffff809`a8a54652 488b8780030000  mov     rax,qword ptr [rdi+380h]
fffff809`a8a54659 6689a894100000  mov     word ptr [rax+1094h],bp
fffff809`a8a54660 488b9780030000  mov     rdx,qword ptr [rdi+380h]
fffff809`a8a54667 4c8b8ff8020000  mov     r9,qword ptr [rdi+2F8h]
fffff809`a8a5466e 4881c200100000  add     rdx,1000h
fffff809`a8a54675 c60205          mov     byte ptr [rdx],5
fffff809`a8a54678 488b87f8020000  mov     rax,qword ptr [rdi+2F8h]
fffff809`a8a5467f 498b8c00b0feffff mov     rcx,qword ptr [r8+rax-150h]
fffff809`a8a54687 48894a18        mov     qword ptr [rdx+18h],rcx
fffff809`a8a5468b 66895a28        mov     word ptr [rdx+28h],bx
fffff809`a8a5468f 0fb78706010000  movzx   eax,word ptr [rdi+106h]
fffff809`a8a54696 66412bc6        sub     ax,r14w
fffff809`a8a5469a 6689422a        mov     word ptr [rdx+2Ah],ax
fffff809`a8a5469e 8b422c          mov     eax,dword ptr [rdx+2Ch]
fffff809`a8a546a1 410bc6          or      eax,r14d
fffff809`a8a546a4 89422c          mov     dword ptr [rdx+2Ch],eax
fffff809`a8a546a7 40386f10        cmp     byte ptr [rdi+10h],bpl
fffff809`a8a546ab 750f            jne     stornvme!NVMeIoCompletionQueueCreate+0xec (fffff809`a8a546bc)  Branch

stornvme!NVMeIoCompletionQueueCreate+0xdd:
fffff809`a8a546ad 4338ac0870ffffff cmp     byte ptr [r8+r9-90h],bpl
fffff809`a8a546b5 7505            jne     stornvme!NVMeIoCompletionQueueCreate+0xec (fffff809`a8a546bc)  Branch

stornvme!NVMeIoCompletionQueueCreate+0xe7:
fffff809`a8a546b7 83c802          or      eax,2
fffff809`a8a546ba eb03            jmp     stornvme!NVMeIoCompletionQueueCreate+0xef (fffff809`a8a546bf)  Branch

stornvme!NVMeIoCompletionQueueCreate+0xec:
fffff809`a8a546bc 83e0fd          and     eax,0FFFFFFFDh

stornvme!NVMeIoCompletionQueueCreate+0xef:
fffff809`a8a546bf 89422c          mov     dword ptr [rdx+2Ch],eax
fffff809`a8a546c2 488d9f28030000  lea     rbx,[rdi+328h]
fffff809`a8a546c9 488b87f8020000  mov     rax,qword ptr [rdi+2F8h]
fffff809`a8a546d0 410fb78c0058ffffff movzx ecx,word ptr [r8+rax-0A8h]
fffff809`a8a546d9 66894a2e        mov     word ptr [rdx+2Eh],cx
fffff809`a8a546dd 488bd3          mov     rdx,rbx
fffff809`a8a546e0 488bcf          mov     rcx,rdi
fffff809`a8a546e3 e830e3feff      call    stornvme!ProcessCommand (fffff809`a8a42a18)
fffff809`a8a546e8 41b910270000    mov     r9d,2710h
fffff809`a8a546ee 448ac6          mov     r8b,sil
fffff809`a8a546f1 488bd3          mov     rdx,rbx
fffff809`a8a546f4 488bcf          mov     rcx,rdi
fffff809`a8a546f7 e8982c0000      call    stornvme!WaitForCommandCompleteWithCustomTimeout (fffff809`a8a57394)
fffff809`a8a546fc 4438b72b030000  cmp     byte ptr [rdi+32Bh],r14b
fffff809`a8a54703 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff809`a8a54708 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff809`a8a5470d 0f94c0          sete    al
fffff809`a8a54710 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff809`a8a54715 488b7c2448      mov     rdi,qword ptr [rsp+48h]
fffff809`a8a5471a 4883c420        add     rsp,20h
fffff809`a8a5471e 415e            pop     r14
fffff809`a8a54720 c3              ret
