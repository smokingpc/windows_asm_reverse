1: kd> uf iaVROC+0x91f0
iaVROC+0x91f0:
fffff803`962491f0 4053            push    rbx
fffff803`962491f2 55              push    rbp
fffff803`962491f3 56              push    rsi
fffff803`962491f4 57              push    rdi
fffff803`962491f5 4883ec48        sub     rsp,48h
fffff803`962491f9 488b0500de0f00  mov     rax,qword ptr [iaVROC+0x107000 (fffff803`96347000)]
fffff803`96249200 4833c4          xor     rax,rsp
fffff803`96249203 4889442438      mov     qword ptr [rsp+38h],rax
fffff803`96249208 498be9          mov     rbp,r9
fffff803`9624920b 498bf0          mov     rsi,r8
fffff803`9624920e 488bfa          mov     rdi,rdx
fffff803`96249211 e85ae60000      call    iaVROC+0x17870 (fffff803`96257870)
fffff803`96249216 488b18          mov     rbx,qword ptr [rax]
fffff803`96249219 4885db          test    rbx,rbx
fffff803`9624921c 7539            jne     iaVROC+0x9257 (fffff803`96249257)  Branch

iaVROC+0x921e:
fffff803`9624921e 488b0debde0f00  mov     rcx,qword ptr [iaVROC+0x107110 (fffff803`96347110)]
fffff803`96249225 488d05e4de0f00  lea     rax,[iaVROC+0x107110 (fffff803`96347110)]
fffff803`9624922c 483bc8          cmp     rcx,rax
fffff803`9624922f 7422            je      iaVROC+0x9253 (fffff803`96249253)  Branch

iaVROC+0x9231:
fffff803`96249231 f7412c00020000  test    dword ptr [rcx+2Ch],200h
fffff803`96249238 7419            je      iaVROC+0x9253 (fffff803`96249253)  Branch

iaVROC+0x923a:
fffff803`9624923a 80792901        cmp     byte ptr [rcx+29h],1
fffff803`9624923e 7213            jb      iaVROC+0x9253 (fffff803`96249253)  Branch

iaVROC+0x9240:
fffff803`96249240 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`96249244 8d531a          lea     edx,[rbx+1Ah]
fffff803`96249247 4c8d05aac30e00  lea     r8,[iaVROC+0xf55f8 (fffff803`963355f8)]
fffff803`9624924e e8ad7dffff      call    iaVROC+0x1000 (fffff803`96241000)

iaVROC+0x9253:
fffff803`96249253 32c0            xor     al,al
fffff803`96249255 eb73            jmp     iaVROC+0x92ca (fffff803`962492ca)  Branch

iaVROC+0x9257:
fffff803`96249257 e874ae0b00      call    iaVROC+0xc40d0 (fffff803`963040d0)
fffff803`9624925c 83f803          cmp     eax,3
fffff803`9624925f 7432            je      iaVROC+0x9293 (fffff803`96249293)  Branch

iaVROC+0x9261:
fffff803`96249261 488d442430      lea     rax,[rsp+30h]
fffff803`96249266 c744243000000000 mov     dword ptr [rsp+30h],0
fffff803`9624926e 4889442428      mov     qword ptr [rsp+28h],rax
fffff803`96249273 4c8bce          mov     r9,rsi
fffff803`96249276 4c8bc7          mov     r8,rdi
fffff803`96249279 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff803`9624927e 488bd3          mov     rdx,rbx
fffff803`96249281 b902100000      mov     ecx,1002h
fffff803`96249286 ff1514810e00    call    qword ptr [iaVROC+0xf13a0 (fffff803`963313a0)] ;call StorPortIssueDpc()
fffff803`9624928c 0fb6442430      movzx   eax,byte ptr [rsp+30h]
fffff803`96249291 eb37            jmp     iaVROC+0x92ca (fffff803`962492ca)  Branch

iaVROC+0x9293:
fffff803`96249293 488b03          mov     rax,qword ptr [rbx]
fffff803`96249296 488bcb          mov     rcx,rbx
fffff803`96249299 488b80c0000000  mov     rax,qword ptr [rax+0C0h]
fffff803`962492a0 ff1512810e00    call    qword ptr [iaVROC+0xf13b8 (fffff803`963313b8)]
fffff803`962492a6 488b17          mov     rdx,qword ptr [rdi]
fffff803`962492a9 488b0dd0149506  mov     rcx,qword ptr [iaVROC+0x695a780 (fffff803`9cb9a780)]
fffff803`962492b0 48897250        mov     qword ptr [rdx+50h],rsi
fffff803`962492b4 48896a58        mov     qword ptr [rdx+58h],rbp
fffff803`962492b8 488b01          mov     rax,qword ptr [rcx]
fffff803`962492bb 488b4008        mov     rax,qword ptr [rax+8]
fffff803`962492bf ff15f3800e00    call    qword ptr [iaVROC+0xf13b8 (fffff803`963313b8)]
fffff803`962492c5 84c0            test    al,al
fffff803`962492c7 0f95c0          setne   al

iaVROC+0x92ca:
fffff803`962492ca 488b4c2438      mov     rcx,qword ptr [rsp+38h]
fffff803`962492cf 4833cc          xor     rcx,rsp
fffff803`962492d2 e819150c00      call    iaVROC+0xca7f0 (fffff803`9630a7f0)
fffff803`962492d7 4883c448        add     rsp,48h
fffff803`962492db 5f              pop     rdi
fffff803`962492dc 5e              pop     rsi
fffff803`962492dd 5d              pop     rbp
fffff803`962492de 5b              pop     rbx
fffff803`962492df c3              ret
