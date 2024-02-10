63: kd> uf iaVROC+4e70
iaVROC+0x4e70:
fffff806`5f3c4e70 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff806`5f3c4e75 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff806`5f3c4e7a 56              push    rsi
fffff806`5f3c4e7b 4156            push    r14
fffff806`5f3c4e7d 4157            push    r15
fffff806`5f3c4e7f 4883ec30        sub     rsp,30h
fffff806`5f3c4e83 4d8bf1          mov     r14,r9
fffff806`5f3c4e86 488bf1          mov     rsi,rcx
fffff806`5f3c4e89 488b0d80221000  mov     rcx,qword ptr [iaVROC+0x107110 (fffff806`5f4c7110)]
fffff806`5f3c4e90 4c8d3d79221000  lea     r15,[iaVROC+0x107110 (fffff806`5f4c7110)]
fffff806`5f3c4e97 493bcf          cmp     rcx,r15
fffff806`5f3c4e9a 7427            je      iaVROC+0x4ec3 (fffff806`5f3c4ec3)  Branch

iaVROC+0x4e9c:
fffff806`5f3c4e9c 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff806`5f3c4e9f a802            test    al,2
fffff806`5f3c4ea1 7420            je      iaVROC+0x4ec3 (fffff806`5f3c4ec3)  Branch

iaVROC+0x4ea3:
fffff806`5f3c4ea3 80792907        cmp     byte ptr [rcx+29h],7
fffff806`5f3c4ea7 721a            jb      iaVROC+0x4ec3 (fffff806`5f3c4ec3)  Branch

iaVROC+0x4ea9:
fffff806`5f3c4ea9 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff806`5f3c4ead 4c8d0534070f00  lea     r8,[iaVROC+0xf55e8 (fffff806`5f4b55e8)]
fffff806`5f3c4eb4 ba27000000      mov     edx,27h
fffff806`5f3c4eb9 4889742428      mov     qword ptr [rsp+28h],rsi
fffff806`5f3c4ebe e88dd2ffff      call    iaVROC+0x2150 (fffff806`5f3c2150) ;WmiTraceMessage, and another unknown operation.

iaVROC+0x4ec3:
fffff806`5f3c4ec3 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff806`5f3c4ec8 488bce          mov     rcx,rsi
fffff806`5f3c4ecb c7463803000000  mov     dword ptr [rsi+38h],3
fffff806`5f3c4ed2 448b4364        mov     r8d,dword ptr [rbx+64h]
fffff806`5f3c4ed6 8b5304          mov     edx,dword ptr [rbx+4]
fffff806`5f3c4ed9 e8f21d0c00      call    iaVROC+0xc6cd0 (fffff806`5f486cd0)
fffff806`5f3c4ede 488be8          mov     rbp,rax
fffff806`5f3c4ee1 4885c0          test    rax,rax
fffff806`5f3c4ee4 7508            jne     iaVROC+0x4eee (fffff806`5f3c4eee)  Branch

iaVROC+0x4ee6:
fffff806`5f3c4ee6 8d4502          lea     eax,[rbp+2]
fffff806`5f3c4ee9 e9ec010000      jmp     iaVROC+0x50da (fffff806`5f3c50da)  Branch

iaVROC+0x4eee:
fffff806`5f3c4eee 48897c2450      mov     qword ptr [rsp+50h],rdi
fffff806`5f3c4ef3 e8d8f10b00      call    iaVROC+0xc40d0 (fffff806`5f4840d0)
fffff806`5f3c4ef8 33ff            xor     edi,edi
fffff806`5f3c4efa 83f803          cmp     eax,3
fffff806`5f3c4efd 750f            jne     iaVROC+0x4f0e (fffff806`5f3c4f0e)  Branch

iaVROC+0x4eff:
fffff806`5f3c4eff 833d6e07930612  cmp     dword ptr [iaVROC+0x6935674 (fffff806`65cf5674)],12h
fffff806`5f3c4f06 7c06            jl      iaVROC+0x4f0e (fffff806`5f3c4f0e)  Branch

iaVROC+0x4f08:
fffff806`5f3c4f08 89bbd8000000    mov     dword ptr [rbx+0D8h],edi

iaVROC+0x4f0e:
fffff806`5f3c4f0e e8bdf10b00      call    iaVROC+0xc40d0 (fffff806`5f4840d0)
fffff806`5f3c4f13 83f803          cmp     eax,3
fffff806`5f3c4f16 752d            jne     iaVROC+0x4f45 (fffff806`5f3c4f45)  Branch

iaVROC+0x4f18:
fffff806`5f3c4f18 813be0000000    cmp     dword ptr [rbx],0E0h
fffff806`5f3c4f1e 760c            jbe     iaVROC+0x4f2c (fffff806`5f3c4f2c)  Branch

iaVROC+0x4f20:
fffff806`5f3c4f20 c7054a07930613000000 mov dword ptr [iaVROC+0x6935674 (fffff806`65cf5674)],13h
fffff806`5f3c4f2a eb26            jmp     iaVROC+0x4f52 (fffff806`5f3c4f52)  Branch

iaVROC+0x4f2c:
fffff806`5f3c4f2c 750c            jne     iaVROC+0x4f3a (fffff806`5f3c4f3a)  Branch

iaVROC+0x4f2e:
fffff806`5f3c4f2e c7053c07930612000000 mov dword ptr [iaVROC+0x6935674 (fffff806`65cf5674)],12h
fffff806`5f3c4f38 eb18            jmp     iaVROC+0x4f52 (fffff806`5f3c4f52)  Branch

iaVROC+0x4f3a:
fffff806`5f3c4f3a 893d34079306    mov     dword ptr [iaVROC+0x6935674 (fffff806`65cf5674)],edi
fffff806`5f3c4f40 e9d0000000      jmp     iaVROC+0x5015 (fffff806`5f3c5015)  Branch

iaVROC+0x4f45:
fffff806`5f3c4f45 833d2807930612  cmp     dword ptr [iaVROC+0x6935674 (fffff806`65cf5674)],12h
fffff806`5f3c4f4c 0f8cc3000000    jl      iaVROC+0x5015 (fffff806`5f3c5015)  Branch

iaVROC+0x4f52:
fffff806`5f3c4f52 e879f10b00      call    iaVROC+0xc40d0 (fffff806`5f4840d0)
fffff806`5f3c4f57 83f803          cmp     eax,3
fffff806`5f3c4f5a 754d            jne     iaVROC+0x4fa9 (fffff806`5f3c4fa9)  Branch

iaVROC+0x4f5c:
fffff806`5f3c4f5c 488b7b40        mov     rdi,qword ptr [rbx+40h]
fffff806`5f3c4f60 4885ff          test    rdi,rdi
fffff806`5f3c4f63 0f84ac000000    je      iaVROC+0x5015 (fffff806`5f3c5015)  Branch

iaVROC+0x4f69:
fffff806`5f3c4f69 488b0508079306  mov     rax,qword ptr [iaVROC+0x6935678 (fffff806`65cf5678)]
fffff806`5f3c4f70 0fb68bc5000000  movzx   ecx,byte ptr [rbx+0C5h]
fffff806`5f3c4f77 48893d92069306  mov     qword ptr [iaVROC+0x6935610 (fffff806`65cf5610)],rdi
fffff806`5f3c4f7e 884804          mov     byte ptr [rax+4],cl
fffff806`5f3c4f81 488b5708        mov     rdx,qword ptr [rdi+8]
fffff806`5f3c4f85 8b4710          mov     eax,dword ptr [rdi+10h]
fffff806`5f3c4f88 488d8aff0f0000  lea     rcx,[rdx+0FFFh]
fffff806`5f3c4f8f 4881e100f0ffff  and     rcx,0FFFFFFFFFFFFF000h
fffff806`5f3c4f96 2bc1            sub     eax,ecx
fffff806`5f3c4f98 48890d79069306  mov     qword ptr [iaVROC+0x6935618 (fffff806`65cf5618)],rcx
fffff806`5f3c4f9f 03c2            add     eax,edx
fffff806`5f3c4fa1 8905c9069306    mov     dword ptr [iaVROC+0x6935670 (fffff806`65cf5670)],eax
fffff806`5f3c4fa7 eb6c            jmp     iaVROC+0x5015 (fffff806`5f3c5015)  Branch

iaVROC+0x4fa9:
fffff806`5f3c4fa9 48393d68069306  cmp     qword ptr [iaVROC+0x6935618 (fffff806`65cf5618)],rdi
fffff806`5f3c4fb0 7563            jne     iaVROC+0x5015 (fffff806`5f3c5015)  Branch

iaVROC+0x4fb2:
fffff806`5f3c4fb2 488d8d20020000  lea     rcx,[rbp+220h]
fffff806`5f3c4fb9 ba00001004      mov     edx,4100000h
fffff806`5f3c4fbe 4c8d05fba10e00  lea     r8,[iaVROC+0xef1c0 (fffff806`5f4af1c0)]
fffff806`5f3c4fc5 e896e30b00      call    iaVROC+0xc3360 (fffff806`5f483360)    ;return 一個 pointer
fffff806`5f3c4fca 488bd0          mov     rdx,rax
fffff806`5f3c4fcd 4885c0          test    rax,rax
fffff806`5f3c4fd0 7443            je      iaVROC+0x5015 (fffff806`5f3c5015)  Branch

iaVROC+0x4fd2:
fffff806`5f3c4fd2 488b0d37069306  mov     rcx,qword ptr [iaVROC+0x6935610 (fffff806`65cf5610)]
fffff806`5f3c4fd9 4885c9          test    rcx,rcx
fffff806`5f3c4fdc 752c            jne     iaVROC+0x500a (fffff806`5f3c500a)  Branch

iaVROC+0x4fde:
fffff806`5f3c4fde 488d05e3d90e00  lea     rax,[iaVROC+0xf29c8 (fffff806`5f4b29c8)]
fffff806`5f3c4fe5 b940000000      mov     ecx,40h
fffff806`5f3c4fea 4889052f069306  mov     qword ptr [iaVROC+0x6935620 (fffff806`65cf5620)],rax
fffff806`5f3c4ff1 488d3d30069306  lea     rdi,[iaVROC+0x6935628 (fffff806`65cf5628)]
fffff806`5f3c4ff8 33c0            xor     eax,eax
fffff806`5f3c4ffa f3aa            rep stos byte ptr [rdi]
fffff806`5f3c4ffc 488d0d1d069306  lea     rcx,[iaVROC+0x6935620 (fffff806`65cf5620)]
fffff806`5f3c5003 48890d06069306  mov     qword ptr [iaVROC+0x6935610 (fffff806`65cf5610)],rcx

iaVROC+0x500a:
fffff806`5f3c500a 48895108        mov     qword ptr [rcx+8],rdx
fffff806`5f3c500e c7411000001004  mov     dword ptr [rcx+10h],4100000h

iaVROC+0x5015:
fffff806`5f3c5015 488bd6          mov     rdx,rsi
fffff806`5f3c5018 488bcd          mov     rcx,rbp
fffff806`5f3c501b e8f0ed0b00      call    iaVROC+0xc3e10 (fffff806`5f483e10)
fffff806`5f3c5020 833d4d06930612  cmp     dword ptr [iaVROC+0x6935674 (fffff806`65cf5674)],12h
fffff806`5f3c5027 0f9dc0          setge   al
fffff806`5f3c502a 8885f0140000    mov     byte ptr [rbp+14F0h],al
fffff806`5f3c5030 488b3da9e19006  mov     rdi,qword ptr [iaVROC+0x69131e0 (fffff806`65cd31e0)]
fffff806`5f3c5037 4885ff          test    rdi,rdi
fffff806`5f3c503a 740a            je      iaVROC+0x5046 (fffff806`5f3c5046)  Branch

iaVROC+0x503c:
fffff806`5f3c503c e88ff00b00      call    iaVROC+0xc40d0 (fffff806`5f4840d0)
fffff806`5f3c5041 83f803          cmp     eax,3
fffff806`5f3c5044 756b            jne     iaVROC+0x50b1 (fffff806`5f3c50b1)  Branch

iaVROC+0x5046:
fffff806`5f3c5046 33c0            xor     eax,eax
fffff806`5f3c5048 488d3d01431006  lea     rdi,[iaVROC+0x6109350 (fffff806`654c9350)]
fffff806`5f3c504f b9909e8000      mov     ecx,809E90h
fffff806`5f3c5054 f3aa            rep stos byte ptr [rdi]
fffff806`5f3c5056 488d0df3421006  lea     rcx,[iaVROC+0x6109350 (fffff806`654c9350)]
fffff806`5f3c505d e8be020000      call    iaVROC+0x5320 (fffff806`5f3c5320) ;傳回一個pointer
fffff806`5f3c5062 48890577e19006  mov     qword ptr [iaVROC+0x69131e0 (fffff806`65cd31e0)],rax
fffff806`5f3c5069 488bf8          mov     rdi,rax
fffff806`5f3c506c 4885c0          test    rax,rax
fffff806`5f3c506f 7540            jne     iaVROC+0x50b1 (fffff806`5f3c50b1)  Branch

iaVROC+0x5071:
fffff806`5f3c5071 38855a130000    cmp     byte ptr [rbp+135Ah],al
fffff806`5f3c5077 7538            jne     iaVROC+0x50b1 (fffff806`5f3c50b1)  Branch

iaVROC+0x5079:
fffff806`5f3c5079 488b0d90201000  mov     rcx,qword ptr [iaVROC+0x107110 (fffff806`5f4c7110)]
fffff806`5f3c5080 493bcf          cmp     rcx,r15
fffff806`5f3c5083 7425            je      iaVROC+0x50aa (fffff806`5f3c50aa)  Branch

iaVROC+0x5085:
fffff806`5f3c5085 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff806`5f3c5088 a802            test    al,2
fffff806`5f3c508a 741e            je      iaVROC+0x50aa (fffff806`5f3c50aa)  Branch

iaVROC+0x508c:
fffff806`5f3c508c 80792901        cmp     byte ptr [rcx+29h],1
fffff806`5f3c5090 7218            jb      iaVROC+0x50aa (fffff806`5f3c50aa)  Branch

iaVROC+0x5092:
fffff806`5f3c5092 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff806`5f3c5096 8d5729          lea     edx,[rdi+29h]
fffff806`5f3c5099 4c8d0548050f00  lea     r8,[iaVROC+0xf55e8 (fffff806`5f4b55e8)]
fffff806`5f3c50a0 4889742428      mov     qword ptr [rsp+28h],rsi
fffff806`5f3c50a5 e8a6d0ffff      call    iaVROC+0x2150 (fffff806`5f3c2150)

iaVROC+0x50aa:
fffff806`5f3c50aa b801000000      mov     eax,1
fffff806`5f3c50af eb24            jmp     iaVROC+0x50d5 (fffff806`5f3c50d5)  Branch

iaVROC+0x50b1:
fffff806`5f3c50b1 f0ff87889e8000  lock inc dword ptr [rdi+809E88h]
fffff806`5f3c50b8 4d8bce          mov     r9,r14
fffff806`5f3c50bb 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff806`5f3c50c0 4c8bc6          mov     r8,rsi
fffff806`5f3c50c3 488bd5          mov     rdx,rbp
fffff806`5f3c50c6 488bcf          mov     rcx,rdi
fffff806`5f3c50c9 e892f8ffff      call    iaVROC+0x4960 (fffff806`5f3c4960) ;用 +505d 取得的 pointer 當RCX
;從這邊開始 BAR0~BAR2都已map進來
fffff806`5f3c50ce f0ff8f889e8000  lock dec dword ptr [rdi+809E88h]

iaVROC+0x50d5:
fffff806`5f3c50d5 488b7c2450      mov     rdi,qword ptr [rsp+50h]

iaVROC+0x50da:
fffff806`5f3c50da 488b5c2458      mov     rbx,qword ptr [rsp+58h]
fffff806`5f3c50df 488b6c2460      mov     rbp,qword ptr [rsp+60h]
fffff806`5f3c50e4 4883c430        add     rsp,30h
fffff806`5f3c50e8 415f            pop     r15
fffff806`5f3c50ea 415e            pop     r14
fffff806`5f3c50ec 5e              pop     rsi
fffff806`5f3c50ed c3              ret
