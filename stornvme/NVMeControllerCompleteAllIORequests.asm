0 kd uf stornvme!NVMeControllerCompleteAllIORequests
stornvme!NVMeControllerCompleteAllIORequests
fffff803`20c0c274 488bc4          mov     rax,rsp
fffff803`20c0c277 48895808        mov     qword ptr [rax+8],rbx
fffff803`20c0c27b 48896810        mov     qword ptr [rax+10h],rbp
fffff803`20c0c27f 48897018        mov     qword ptr [rax+18h],rsi
fffff803`20c0c283 48897820        mov     qword ptr [rax+20h],rdi
fffff803`20c0c287 4156            push    r14
fffff803`20c0c289 4883ec40        sub     rsp,40h
fffff803`20c0c28d 408af2          mov     sil,dl
fffff803`20c0c290 488bd9          mov     rbx,rcx
fffff803`20c0c293 488bd1          mov     rdx,rcx
fffff803`20c0c296 41b810270000    mov     r8d,2710h			;100000 micro seconds
fffff803`20c0c29c b951000000      mov     ecx,51h				;ExtFunctionDelayExecution
fffff803`20c0c2a1 48ff15802d0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff803`20c1f028)]
fffff803`20c0c2a8 0f1f440000      nop     dword ptr [rax+rax]
fffff803`20c0c2ad 33ed            xor     ebp,ebp
fffff803`20c0c2af 8bfd            mov     edi,ebp
fffff803`20c0c2b1 448d7501        lea     r14d,[rbp+1]
fffff803`20c0c2b5 663bab08010000  cmp     bp,word ptr [rbx+108h]		;rbx should be pAE
fffff803`20c0c2bc 7340            jae     stornvme!NVMeControllerCompleteAllIORequests+0x8a (fffff803`20c0c2fe)  Branch

stornvme!NVMeControllerCompleteAllIORequests+0x4a
fffff803`20c0c2be 440fb78306010000 movzx   r8d,word ptr [rbx+106h]
fffff803`20c0c2c6 4533c9          xor     r9d,r9d
fffff803`20c0c2c9 8bc7            mov     eax,edi
fffff803`20c0c2cb 488bcb          mov     rcx,rbx
fffff803`20c0c2ce 4869d088000000  imul    rdx,rax,88h
fffff803`20c0c2d5 4088742430      mov     byte ptr [rsp+30h],sil
fffff803`20c0c2da 480393f0020000  add     rdx,qword ptr [rbx+2F0h]
fffff803`20c0c2e1 40886c2428      mov     byte ptr [rsp+28h],bpl
fffff803`20c0c2e6 4488742420      mov     byte ptr [rsp+20h],r14b
fffff803`20c0c2eb e860faffff      call    stornvme!NVMeCompleteSubmissionQueueRequests (fffff803`20c0bd50)
fffff803`20c0c2f0 0fb78308010000  movzx   eax,word ptr [rbx+108h]
fffff803`20c0c2f7 4103fe          add     edi,r14d
fffff803`20c0c2fa 3bf8            cmp     edi,eax
fffff803`20c0c2fc 72c0            jb      stornvme!NVMeControllerCompleteAllIORequests+0x4a (fffff803`20c0c2be)  Branch

stornvme!NVMeControllerCompleteAllIORequests+0x8a
fffff803`20c0c2fe 0fb7fd          movzx   edi,bp
fffff803`20c0c301 eb1f            jmp     stornvme!NVMeControllerCompleteAllIORequests+0xae (fffff803`20c0c322)  Branch

stornvme!NVMeControllerCompleteAllIORequests+0x8f
fffff803`20c0c303 b888130000      mov     eax,1388h				
fffff803`20c0c308 663bf8          cmp     di,ax					;if di==5000, goto 0xba
fffff803`20c0c30b 7321            jae     stornvme!NVMeControllerCompleteAllIORequests+0xba (fffff803`20c0c32e)  Branch

stornvme!NVMeControllerCompleteAllIORequests+0x99
fffff803`20c0c30d b90a000000      mov     ecx,0Ah
fffff803`20c0c312 48ff15272d0100  call    qword ptr [stornvme!_imp_StorPortStallExecution (fffff803`20c1f040)]
fffff803`20c0c319 0f1f440000      nop     dword ptr [rax+rax]
fffff803`20c0c31e 664103fe        add     di,r14w

stornvme!NVMeControllerCompleteAllIORequests+0xae
fffff803`20c0c322 0fb78318030000  movzx   eax,word ptr [rbx+318h]
fffff803`20c0c329 6685c0          test    ax,ax
fffff803`20c0c32c 75d5            jne     stornvme!NVMeControllerCompleteAllIORequests+0x8f (fffff803`20c0c303)  Branch

stornvme!NVMeControllerCompleteAllIORequests+0xba
fffff803`20c0c32e 440fb78304010000 movzx   r8d,word ptr [rbx+104h]
fffff803`20c0c336 488d9310010000  lea     rdx,[rbx+110h]
fffff803`20c0c33d 4088742430      mov     byte ptr [rsp+30h],sil
fffff803`20c0c342 4533c9          xor     r9d,r9d
fffff803`20c0c345 40886c2428      mov     byte ptr [rsp+28h],bpl
fffff803`20c0c34a 488bcb          mov     rcx,rbx
fffff803`20c0c34d 4488742420      mov     byte ptr [rsp+20h],r14b
fffff803`20c0c352 e8f9f9ffff      call    stornvme!NVMeCompleteSubmissionQueueRequests (fffff803`20c0bd50)
fffff803`20c0c357 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff803`20c0c35c 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff803`20c0c361 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff803`20c0c366 488b7c2468      mov     rdi,qword ptr [rsp+68h]
fffff803`20c0c36b 4883c440        add     rsp,40h
fffff803`20c0c36f 415e            pop     r14
fffff803`20c0c371 c3              ret
