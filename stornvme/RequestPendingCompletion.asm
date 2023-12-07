stornvme!RequestPendingCompletion:
fffff803`c6566240 4053            push    rbx
fffff803`c6566242 56              push    rsi
fffff803`c6566243 57              push    rdi
fffff803`c6566244 4155            push    r13
fffff803`c6566246 4883ec28        sub     rsp,28h
fffff803`c656624a b8ffff0000      mov     eax,0FFFFh
fffff803`c656624f 4533ed          xor     r13d,r13d
fffff803`c6566252 488bf1          mov     rsi,rcx
fffff803`c6566255 663bd0          cmp     dx,ax
fffff803`c6566258 0f8498400000    je      stornvme!RequestPendingCompletion+0x40b6 (fffff803`c656a2f6)  Branch

stornvme!RequestPendingCompletion+0x1e:
fffff803`c656625e 6685d2          test    dx,dx
fffff803`c6566261 745b            je      stornvme!RequestPendingCompletion+0x7e (fffff803`c65662be)  Branch

stornvme!RequestPendingCompletion+0x23:
fffff803`c6566263 488b9e00030000  mov     rbx,qword ptr [rsi+300h]
fffff803`c656626a 0fb7c2          movzx   eax,dx
fffff803`c656626d 4881c3a8feffff  add     rbx,0FFFFFFFFFFFFFEA8h
fffff803`c6566274 4869c858010000  imul    rcx,rax,158h
fffff803`c656627b 4803d9          add     rbx,rcx

stornvme!RequestPendingCompletion+0x3e:
fffff803`c656627e 0fb783aa000000  movzx   eax,word ptr [rbx+0AAh]
fffff803`c6566285 48c1e004        shl     rax,4
fffff803`c6566289 480303          add     rax,qword ptr [rbx]
fffff803`c656628c 0fb7480e        movzx   ecx,word ptr [rax+0Eh]
fffff803`c6566290 6683e101        and     cx,1
fffff803`c6566294 663b8bac000000  cmp     cx,word ptr [rbx+0ACh]
fffff803`c656629b 400f95c7        setne   dil

stornvme!RequestPendingCompletion+0x5f:
fffff803`c656629f 4084ff          test    dil,dil
fffff803`c65662a2 740c            je      stornvme!RequestPendingCompletion+0x70 (fffff803`c65662b0)  Branch

stornvme!RequestPendingCompletion+0x64:
fffff803`c65662a4 8b4e68          mov     ecx,dword ptr [rsi+68h]
fffff803`c65662a7 f6c102          test    cl,2
fffff803`c65662aa 0f85d5400000    jne     stornvme!RequestPendingCompletion+0x4145 (fffff803`c656a385)  Branch

stornvme!RequestPendingCompletion+0x70:
fffff803`c65662b0 400fb6c7        movzx   eax,dil

stornvme!RequestPendingCompletion+0x74:
fffff803`c65662b4 4883c428        add     rsp,28h
fffff803`c65662b8 415d            pop     r13
fffff803`c65662ba 5f              pop     rdi
fffff803`c65662bb 5e              pop     rsi
fffff803`c65662bc 5b              pop     rbx
fffff803`c65662bd c3              ret

stornvme!RequestPendingCompletion+0x7e:
fffff803`c65662be 488d99a0010000  lea     rbx,[rcx+1A0h]
fffff803`c65662c5 ebb7            jmp     stornvme!RequestPendingCompletion+0x3e (fffff803`c656627e)  Branch

stornvme!RequestPendingCompletion+0x40b6:
fffff803`c656a2f6 0fb7814a020000  movzx   eax,word ptr [rcx+24Ah]
fffff803`c656a2fd 488d99a0010000  lea     rbx,[rcx+1A0h]
fffff803`c656a304 48c1e004        shl     rax,4
fffff803`c656a308 480303          add     rax,qword ptr [rbx]
fffff803`c656a30b 0fb7500e        movzx   edx,word ptr [rax+0Eh]
fffff803`c656a30f 6683e201        and     dx,1
fffff803`c656a313 663b93ac000000  cmp     dx,word ptr [rbx+0ACh]
fffff803`c656a31a 410f95c1        setne   r9b
fffff803`c656a31e 410fb6f9        movzx   edi,r9b
fffff803`c656a322 0f8577bfffff    jne     stornvme!RequestPendingCompletion+0x5f (fffff803`c656629f)  Branch

stornvme!RequestPendingCompletion+0x40e8:
fffff803`c656a328 4c8b9100030000  mov     r10,qword ptr [rcx+300h]
fffff803`c656a32f 458bc5          mov     r8d,r13d
fffff803`c656a332 4d85d2          test    r10,r10
fffff803`c656a335 0f8464bfffff    je      stornvme!RequestPendingCompletion+0x5f (fffff803`c656629f)  Branch

stornvme!RequestPendingCompletion+0x40fb:
fffff803`c656a33b 440fb78912010000 movzx   r9d,word ptr [rcx+112h]

stornvme!RequestPendingCompletion+0x4103:
fffff803`c656a343 453bc1          cmp     r8d,r9d
fffff803`c656a346 0f8353bfffff    jae     stornvme!RequestPendingCompletion+0x5f (fffff803`c656629f)  Branch

stornvme!RequestPendingCompletion+0x410c:
fffff803`c656a34c 418bc0          mov     eax,r8d
fffff803`c656a34f 4869d858010000  imul    rbx,rax,158h
fffff803`c656a356 4903da          add     rbx,r10
fffff803`c656a359 0fb783aa000000  movzx   eax,word ptr [rbx+0AAh]
fffff803`c656a360 48c1e004        shl     rax,4
fffff803`c656a364 480303          add     rax,qword ptr [rbx]
fffff803`c656a367 0fb7500e        movzx   edx,word ptr [rax+0Eh]
fffff803`c656a36b 6683e201        and     dx,1
fffff803`c656a36f 663b93ac000000  cmp     dx,word ptr [rbx+0ACh]
fffff803`c656a376 400f95c7        setne   dil
fffff803`c656a37a 0f851fbfffff    jne     stornvme!RequestPendingCompletion+0x5f (fffff803`c656629f)  Branch

stornvme!RequestPendingCompletion+0x4140:
fffff803`c656a380 41ffc0          inc     r8d
fffff803`c656a383 ebbe            jmp     stornvme!RequestPendingCompletion+0x4103 (fffff803`c656a343)  Branch

stornvme!RequestPendingCompletion+0x4145:
fffff803`c656a385 0fb7480e        movzx   ecx,word ptr [rax+0Eh]
fffff803`c656a389 48896c2450      mov     qword ptr [rsp+50h],rbp
fffff803`c656a38e 6683e101        and     cx,1
fffff803`c656a392 0fb7abaa000000  movzx   ebp,word ptr [rbx+0AAh]
fffff803`c656a399 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff803`c656a39e 440fb7bbac000000 movzx   r15d,word ptr [rbx+0ACh]
fffff803`c656a3a6 66413bcf        cmp     cx,r15w
fffff803`c656a3aa 0f841a010000    je      stornvme!RequestPendingCompletion+0x428a (fffff803`c656a4ca)  Branch

stornvme!RequestPendingCompletion+0x4170:
fffff803`c656a3b0 4c89642458      mov     qword ptr [rsp+58h],r12
fffff803`c656a3b5 4c89742468      mov     qword ptr [rsp+68h],r14

stornvme!RequestPendingCompletion+0x417a:
fffff803`c656a3ba 0fb7480a        movzx   ecx,word ptr [rax+0Ah]
fffff803`c656a3be 0fb7500c        movzx   edx,word ptr [rax+0Ch]
fffff803`c656a3c2 664439aba8000000 cmp     word ptr [rbx+0A8h],r13w
fffff803`c656a3ca 740b            je      stornvme!RequestPendingCompletion+0x4197 (fffff803`c656a3d7)  Branch

stornvme!RequestPendingCompletion+0x418c:
fffff803`c656a3cc 8b4614          mov     eax,dword ptr [rsi+14h]
fffff803`c656a3cf a801            test    al,1
fffff803`c656a3d1 0f84e3000000    je      stornvme!RequestPendingCompletion+0x427a (fffff803`c656a4ba)  Branch

stornvme!RequestPendingCompletion+0x4197:
fffff803`c656a3d7 6685c9          test    cx,cx
fffff803`c656a3da 7511            jne     stornvme!RequestPendingCompletion+0x41ad (fffff803`c656a3ed)  Branch

stornvme!RequestPendingCompletion+0x419c:
fffff803`c656a3dc 440fb7a60c010000 movzx   r12d,word ptr [rsi+10Ch]
fffff803`c656a3e4 488d8638010000  lea     rax,[rsi+138h]
fffff803`c656a3eb eb20            jmp     stornvme!RequestPendingCompletion+0x41cd (fffff803`c656a40d)  Branch

stornvme!RequestPendingCompletion+0x41ad:
fffff803`c656a3ed 440fb7a60e010000 movzx   r12d,word ptr [rsi+10Eh]
fffff803`c656a3f5 0fb7c1          movzx   eax,cx
fffff803`c656a3f8 4869c888000000  imul    rcx,rax,88h
fffff803`c656a3ff 488b86f8020000  mov     rax,qword ptr [rsi+2F8h]
fffff803`c656a406 4883c098        add     rax,0FFFFFFFFFFFFFF98h
fffff803`c656a40a 4803c1          add     rax,rcx

stornvme!RequestPendingCompletion+0x41cd:
fffff803`c656a40d 488b00          mov     rax,qword ptr [rax]
fffff803`c656a410 0fb7ca          movzx   ecx,dx
fffff803`c656a413 4803c9          add     rcx,rcx
fffff803`c656a416 4c8b1cc8        mov     r11,qword ptr [rax+rcx*8]
fffff803`c656a41a 4d85db          test    r11,r11
fffff803`c656a41d 0f8497000000    je      stornvme!RequestPendingCompletion+0x427a (fffff803`c656a4ba)  Branch

stornvme!RequestPendingCompletion+0x41e3:
fffff803`c656a423 498bd3          mov     rdx,r11
fffff803`c656a426 488bce          mov     rcx,rsi
fffff803`c656a429 e87a080000      call    stornvme!IsInternalSrb (fffff803`c656aca8)
fffff803`c656a42e 84c0            test    al,al
fffff803`c656a430 0f8584000000    jne     stornvme!RequestPendingCompletion+0x427a (fffff803`c656a4ba)  Branch

stornvme!RequestPendingCompletion+0x41f6:
fffff803`c656a436 498bcb          mov     rcx,r11
fffff803`c656a439 e83aabffff      call    stornvme!GetSrbExtension (fffff803`c6564f78)
fffff803`c656a43e 4c8bf0          mov     r14,rax
fffff803`c656a441 4c39a840100000  cmp     qword ptr [rax+1040h],r13
fffff803`c656a448 762d            jbe     stornvme!RequestPendingCompletion+0x4237 (fffff803`c656a477)  Branch

stornvme!RequestPendingCompletion+0x420a:
fffff803`c656a44a 33c0            xor     eax,eax
fffff803`c656a44c 4c8d4c2460      lea     r9,[rsp+60h]
fffff803`c656a451 4533c0          xor     r8d,r8d
fffff803`c656a454 4889442460      mov     qword ptr [rsp+60h],rax
fffff803`c656a459 488bd6          mov     rdx,rsi
fffff803`c656a45c 8d482f          lea     ecx,[rax+2Fh]
fffff803`c656a45f 48ff15c25b0100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff803`c6580028)]
fffff803`c656a466 0f1f440000      nop     dword ptr [rax+rax]
fffff803`c656a46b 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff803`c656a470 49898e50100000  mov     qword ptr [r14+1050h],rcx

stornvme!RequestPendingCompletion+0x4237:
fffff803`c656a477 410fb7cc        movzx   ecx,r12w
fffff803`c656a47b ffc9            dec     ecx
fffff803`c656a47d 0fb7c5          movzx   eax,bp
fffff803`c656a480 3bc1            cmp     eax,ecx
fffff803`c656a482 7d05            jge     stornvme!RequestPendingCompletion+0x4249 (fffff803`c656a489)  Branch

stornvme!RequestPendingCompletion+0x4244:
fffff803`c656a484 66ffc5          inc     bp
fffff803`c656a487 eb15            jmp     stornvme!RequestPendingCompletion+0x425e (fffff803`c656a49e)  Branch

stornvme!RequestPendingCompletion+0x4249:
fffff803`c656a489 b801000000      mov     eax,1
fffff803`c656a48e 418bed          mov     ebp,r13d
fffff803`c656a491 66443bf8        cmp     r15w,ax
fffff803`c656a495 66410f44c5      cmove   ax,r13w
fffff803`c656a49a 440fb7f8        movzx   r15d,ax

stornvme!RequestPendingCompletion+0x425e:
fffff803`c656a49e 0fb7c5          movzx   eax,bp
fffff803`c656a4a1 48c1e004        shl     rax,4
fffff803`c656a4a5 480303          add     rax,qword ptr [rbx]
fffff803`c656a4a8 0fb7480e        movzx   ecx,word ptr [rax+0Eh]
fffff803`c656a4ac 6683e101        and     cx,1
fffff803`c656a4b0 66413bcf        cmp     cx,r15w
fffff803`c656a4b4 0f8500ffffff    jne     stornvme!RequestPendingCompletion+0x417a (fffff803`c656a3ba)  Branch

stornvme!RequestPendingCompletion+0x427a:
fffff803`c656a4ba 4c8b742468      mov     r14,qword ptr [rsp+68h]
fffff803`c656a4bf 400fb6c7        movzx   eax,dil
fffff803`c656a4c3 4c8b642458      mov     r12,qword ptr [rsp+58h]
fffff803`c656a4c8 eb04            jmp     stornvme!RequestPendingCompletion+0x428e (fffff803`c656a4ce)  Branch

stornvme!RequestPendingCompletion+0x428a:
fffff803`c656a4ca 400fb6c7        movzx   eax,dil

stornvme!RequestPendingCompletion+0x428e:
fffff803`c656a4ce 488b6c2450      mov     rbp,qword ptr [rsp+50h]
fffff803`c656a4d3 4c8b7c2420      mov     r15,qword ptr [rsp+20h]
fffff803`c656a4d8 e9d7bdffff      jmp     stornvme!RequestPendingCompletion+0x74 (fffff803`c65662b4)  Branch
