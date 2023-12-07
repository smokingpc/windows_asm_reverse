2: kd> UF RaidAllocateSrb
storport!RaidAllocateSrb:
fffff806`c7d1c2b4 488bc4          mov     rax,rsp
fffff806`c7d1c2b7 48895808        mov     qword ptr [rax+8],rbx
fffff806`c7d1c2bb 48896810        mov     qword ptr [rax+10h],rbp
fffff806`c7d1c2bf 48897018        mov     qword ptr [rax+18h],rsi
fffff806`c7d1c2c3 48897820        mov     qword ptr [rax+20h],rdi
fffff806`c7d1c2c7 4155            push    r13
fffff806`c7d1c2c9 4156            push    r14
fffff806`c7d1c2cb 4157            push    r15
fffff806`c7d1c2cd 4883ec20        sub     rsp,20h
fffff806`c7d1c2d1 33ff            xor     edi,edi
fffff806`c7d1c2d3 8bda            mov     ebx,edx
fffff806`c7d1c2d5 448d7f01        lea     r15d,[rdi+1]
fffff806`c7d1c2d9 453ac7          cmp     r8b,r15b      ;if SrbType == 1(STORAGE_REQUEST_BLOCK) , goto 0x79
fffff806`c7d1c2dc 744f            je      storport!RaidAllocateSrb+0x79 (fffff806`c7d1c32d)  Branch 

storport!RaidAllocateSrb+0x2a:
fffff806`c7d1c2de 4c8bc9          mov     r9,rcx
fffff806`c7d1c2e1 8d5f58          lea     ebx,[rdi+58h]
fffff806`c7d1c2e4 8bd3            mov     edx,ebx
fffff806`c7d1c2e6 41b852615372    mov     r8d,72536152h
fffff806`c7d1c2ec b900020000      mov     ecx,200h
fffff806`c7d1c2f1 e81e010000      call    storport!RaidAllocatePool (fffff806`c7d1c414)
fffff806`c7d1c2f6 488bf8          mov     rdi,rax
fffff806`c7d1c2f9 4885c0          test    rax,rax
fffff806`c7d1c2fc 740d            je      storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x4a:
fffff806`c7d1c2fe 448bc3          mov     r8d,ebx
fffff806`c7d1c301 33d2            xor     edx,edx
fffff806`c7d1c303 488bc8          mov     rcx,rax
fffff806`c7d1c306 e8f5fa0100      call    storport!memset (fffff806`c7d3be00)

storport!RaidAllocateSrb+0x57:
fffff806`c7d1c30b 488bc7          mov     rax,rdi

storport!RaidAllocateSrb+0x5a:
fffff806`c7d1c30e 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff806`c7d1c313 488b6c2448      mov     rbp,qword ptr [rsp+48h]
fffff806`c7d1c318 488b742450      mov     rsi,qword ptr [rsp+50h]
fffff806`c7d1c31d 488b7c2458      mov     rdi,qword ptr [rsp+58h]
fffff806`c7d1c322 4883c420        add     rsp,20h
fffff806`c7d1c326 415f            pop     r15
fffff806`c7d1c328 415e            pop     r14
fffff806`c7d1c32a 415d            pop     r13
fffff806`c7d1c32c c3              ret

storport!RaidAllocateSrb+0x79:
fffff806`c7d1c32d 41bd02000000    mov     r13d,2
fffff806`c7d1c333 83fb17          cmp     ebx,17h
fffff806`c7d1c336 0f879d000000    ja      storport!RaidAllocateSrb+0x125 (fffff806`c7d1c3d9)  Branch

storport!RaidAllocateSrb+0x88:
fffff806`c7d1c33c 0f84a9000000    je      storport!RaidAllocateSrb+0x137 (fffff806`c7d1c3eb)  Branch

storport!RaidAllocateSrb+0x8e:
fffff806`c7d1c342 85db            test    ebx,ebx
fffff806`c7d1c344 0f84ae000000    je      storport!RaidAllocateSrb+0x144 (fffff806`c7d1c3f8)  Branch

storport!RaidAllocateSrb+0x96:
fffff806`c7d1c34a 413bdd          cmp     ebx,r13d
fffff806`c7d1c34d 0f85d1220200    jne     storport!RaidAllocateSrb+0x22370 (fffff806`c7d3e624)  Branch

storport!RaidAllocateSrb+0x9f:
fffff806`c7d1c353 be90000000      mov     esi,90h
fffff806`c7d1c358 33ed            xor     ebp,ebp

storport!RaidAllocateSrb+0xa6:
fffff806`c7d1c35a 4c8bc9          mov     r9,rcx
fffff806`c7d1c35d 8bd6            mov     edx,esi
fffff806`c7d1c35f b900020000      mov     ecx,200h
fffff806`c7d1c364 448bf6          mov     r14d,esi
fffff806`c7d1c367 41b852615372    mov     r8d,72536152h
fffff806`c7d1c36d e8a2000000      call    storport!RaidAllocatePool (fffff806`c7d1c414)
fffff806`c7d1c372 488bf8          mov     rdi,rax
fffff806`c7d1c375 4885c0          test    rax,rax
fffff806`c7d1c378 7491            je      storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0xc6:
fffff806`c7d1c37a 458bc6          mov     r8d,r14d
fffff806`c7d1c37d 33d2            xor     edx,edx
fffff806`c7d1c37f 488bc8          mov     rcx,rax
fffff806`c7d1c382 e879fa0100      call    storport!memset (fffff806`c7d3be00)
fffff806`c7d1c387 c6470228        mov     byte ptr [rdi+2],28h
fffff806`c7d1c38b b808000000      mov     eax,8
fffff806`c7d1c390 668907          mov     word ptr [rdi],ax
fffff806`c7d1c393 c7470858425253  mov     dword ptr [rdi+8],53524258h
fffff806`c7d1c39a 44897f0c        mov     dword ptr [rdi+0Ch],r15d
fffff806`c7d1c39e 897710          mov     dword ptr [rdi+10h],esi
fffff806`c7d1c3a1 895f14          mov     dword ptr [rdi+14h],ebx
fffff806`c7d1c3a4 6644896f24      mov     word ptr [rdi+24h],r13w
fffff806`c7d1c3a9 c7473480000000  mov     dword ptr [rdi+34h],80h
fffff806`c7d1c3b0 896f38          mov     dword ptr [rdi+38h],ebp
fffff806`c7d1c3b3 664489bf80000000 mov     word ptr [rdi+80h],r15w
fffff806`c7d1c3bb c7878400000004000000 mov dword ptr [rdi+84h],4
fffff806`c7d1c3c5 85ed            test    ebp,ebp
fffff806`c7d1c3c7 0f843effffff    je      storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x119:
fffff806`c7d1c3cd c7477890000000  mov     dword ptr [rdi+78h],90h
fffff806`c7d1c3d4 e932ffffff      jmp     storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x125:
fffff806`c7d1c3d9 83fb20          cmp     ebx,20h
fffff806`c7d1c3dc 0f8471ffffff    je      storport!RaidAllocateSrb+0x9f (fffff806`c7d1c353)  Branch

storport!RaidAllocateSrb+0x12e:
fffff806`c7d1c3e2 83fb25          cmp     ebx,25h
fffff806`c7d1c3e5 0f8559220200    jne     storport!RaidAllocateSrb+0x22390 (fffff806`c7d3e644)  Branch

storport!RaidAllocateSrb+0x137:
fffff806`c7d1c3eb bea8000000      mov     esi,0A8h

storport!RaidAllocateSrb+0x13c:
fffff806`c7d1c3f0 418bef          mov     ebp,r15d
fffff806`c7d1c3f3 e962ffffff      jmp     storport!RaidAllocateSrb+0xa6 (fffff806`c7d1c35a)  Branch

storport!RaidAllocateSrb+0x144:
fffff806`c7d1c3f8 4584cf          test    r15b,r9b
fffff806`c7d1c3fb 7407            je      storport!RaidAllocateSrb+0x150 (fffff806`c7d1c404)  Branch

storport!RaidAllocateSrb+0x149:
fffff806`c7d1c3fd beb8000000      mov     esi,0B8h
fffff806`c7d1c402 ebec            jmp     storport!RaidAllocateSrb+0x13c (fffff806`c7d1c3f0)  Branch

storport!RaidAllocateSrb+0x150:
fffff806`c7d1c404 33c0            xor     eax,eax
fffff806`c7d1c406 e903ffffff      jmp     storport!RaidAllocateSrb+0x5a (fffff806`c7d1c30e)  Branch

storport!RaidAllocateSrb+0x22370:
fffff806`c7d3e624 83fb09          cmp     ebx,9
fffff806`c7d3e627 0f8426ddfdff    je      storport!RaidAllocateSrb+0x9f (fffff806`c7d1c353)  Branch

storport!RaidAllocateSrb+0x22379:
fffff806`c7d3e62d 83fb10          cmp     ebx,10h
fffff806`c7d3e630 0f841dddfdff    je      storport!RaidAllocateSrb+0x9f (fffff806`c7d1c353)  Branch

storport!RaidAllocateSrb+0x22382:
fffff806`c7d3e636 83fb13          cmp     ebx,13h
fffff806`c7d3e639 0f8414ddfdff    je      storport!RaidAllocateSrb+0x9f (fffff806`c7d1c353)  Branch

storport!RaidAllocateSrb+0x2238b:
fffff806`c7d3e63f e9c7dcfdff      jmp     storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x22390:
fffff806`c7d3e644 0f86c1dcfdff    jbe     storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x22396:
fffff806`c7d3e64a 83fb27          cmp     ebx,27h
fffff806`c7d3e64d 0f8600ddfdff    jbe     storport!RaidAllocateSrb+0x9f (fffff806`c7d1c353)  Branch

storport!RaidAllocateSrb+0x2239f:
fffff806`c7d3e653 83fb29          cmp     ebx,29h
fffff806`c7d3e656 0f86afdcfdff    jbe     storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x223a8:
fffff806`c7d3e65c 83fb2b          cmp     ebx,2Bh
fffff806`c7d3e65f 0f87a6dcfdff    ja      storport!RaidAllocateSrb+0x57 (fffff806`c7d1c30b)  Branch

storport!RaidAllocateSrb+0x223b1:
fffff806`c7d3e665 e9e9dcfdff      jmp     storport!RaidAllocateSrb+0x9f (fffff806`c7d1c353)  Branch
