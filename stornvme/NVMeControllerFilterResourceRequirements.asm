;這從 NVMeHwAdapterControl 呼叫進來的

9: kd> uf stornvme!NVMeControllerFilterResourceRequirements
stornvme!NVMeControllerFilterResourceRequirements:
fffff804`9e88ff40 48895c2408      mov     qword ptr [rsp+8],rbx
fffff804`9e88ff45 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff804`9e88ff4a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff804`9e88ff4f 57              push    rdi
fffff804`9e88ff50 4154            push    r12
fffff804`9e88ff52 4155            push    r13
fffff804`9e88ff54 4156            push    r14
fffff804`9e88ff56 4157            push    r15
fffff804`9e88ff58 4883ec40        sub     rsp,40h
fffff804`9e88ff5c 33db            xor     ebx,ebx
fffff804`9e88ff5e 4c8bea          mov     r13,rdx
fffff804`9e88ff61 8beb            mov     ebp,ebx
fffff804`9e88ff63 448bfb          mov     r15d,ebx
fffff804`9e88ff66 488bf1          mov     rsi,rcx
fffff804`9e88ff69 e84641ffff      call    stornvme!GetProcessorGroupInformation (fffff804`9e8840b4)
fffff804`9e88ff6e 84c0            test    al,al
fffff804`9e88ff70 7545            jne     stornvme!NVMeControllerFilterResourceRequirements+0x77 (fffff804`9e88ffb7)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x32:
fffff804`9e88ff72 488d86e8000000  lea     rax,[rsi+0E8h]
fffff804`9e88ff79 c7462409000000  mov     dword ptr [rsi+24h],9
fffff804`9e88ff80 4889442430      mov     qword ptr [rsp+30h],rax
fffff804`9e88ff85 448d4b0a        lea     r9d,[rbx+0Ah]
fffff804`9e88ff89 488d0510660100  lea     rax,[stornvme!`string` (fffff804`9e8a65a0)]
fffff804`9e88ff90 c744242802000000 mov     dword ptr [rsp+28h],2
fffff804`9e88ff98 4533c0          xor     r8d,r8d
fffff804`9e88ff9b 4889442420      mov     qword ptr [rsp+20h],rax
fffff804`9e88ffa0 488bd6          mov     rdx,rsi
fffff804`9e88ffa3 8d4b62          lea     ecx,[rbx+62h]
fffff804`9e88ffa6 4c8b15abf00100  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff804`9e8af058)]
fffff804`9e88ffad e83e9138b1      call    storport!StorPortExtendedFunction (fffff804`4fc190f0)
fffff804`9e88ffb2 e9c3020000      jmp     stornvme!NVMeControllerFilterResourceRequirements+0x33a (fffff804`9e89027a)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x77:
fffff804`9e88ffb7 498b7d08        mov     rdi,qword ptr [r13+8]
fffff804`9e88ffbb 41bc01000000    mov     r12d,1
fffff804`9e88ffc1 448b7724        mov     r14d,dword ptr [rdi+24h]
fffff804`9e88ffc5 418bd6          mov     edx,r14d
fffff804`9e88ffc8 4585f6          test    r14d,r14d
fffff804`9e88ffcb 7430            je      stornvme!NVMeControllerFilterResourceRequirements+0xbd (fffff804`9e88fffd)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x8d:
fffff804`9e88ffcd 4c8d4729        lea     r8,[rdi+29h]
fffff804`9e88ffd1 458bce          mov     r9d,r14d

stornvme!NVMeControllerFilterResourceRequirements+0x94:
fffff804`9e88ffd4 498d48ff        lea     rcx,[r8-1]
fffff804`9e88ffd8 e8ab40ffff      call    stornvme!IsPci3MsiInterrupt (fffff804`9e884088)
fffff804`9e88ffdd 84c0            test    al,al
fffff804`9e88ffdf 7405            je      stornvme!NVMeControllerFilterResourceRequirements+0xa6 (fffff804`9e88ffe6)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xa1:
fffff804`9e88ffe1 4103ec          add     ebp,r12d
fffff804`9e88ffe4 eb0e            jmp     stornvme!NVMeControllerFilterResourceRequirements+0xb4 (fffff804`9e88fff4)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xa6:
fffff804`9e88ffe6 453820          cmp     byte ptr [r8],r12b
fffff804`9e88ffe9 7509            jne     stornvme!NVMeControllerFilterResourceRequirements+0xb4 (fffff804`9e88fff4)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xab:
fffff804`9e88ffeb 45846003        test    byte ptr [r8+3],r12b
fffff804`9e88ffef 7403            je      stornvme!NVMeControllerFilterResourceRequirements+0xb4 (fffff804`9e88fff4)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xb1:
fffff804`9e88fff1 4503fc          add     r15d,r12d

stornvme!NVMeControllerFilterResourceRequirements+0xb4:
fffff804`9e88fff4 4983c020        add     r8,20h
fffff804`9e88fff8 4d2bcc          sub     r9,r12
fffff804`9e88fffb 75d7            jne     stornvme!NVMeControllerFilterResourceRequirements+0x94 (fffff804`9e88ffd4)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xbd:
fffff804`9e88fffd 0fb78eea000000  movzx   ecx,word ptr [rsi+0EAh]
fffff804`9e890004 8d4101          lea     eax,[rcx+1]
fffff804`9e890007 3be8            cmp     ebp,eax
fffff804`9e890009 0f86c9010000    jbe     stornvme!NVMeControllerFilterResourceRequirements+0x298 (fffff804`9e8901d8)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xcf:
fffff804`9e89000f 488b86f8000000  mov     rax,qword ptr [rsi+0F8h]
fffff804`9e890016 2bcd            sub     ecx,ebp
fffff804`9e890018 41ffc6          inc     r14d
fffff804`9e89001b 448bd3          mov     r10d,ebx
fffff804`9e89001e 4403f1          add     r14d,ecx
fffff804`9e890021 448bdb          mov     r11d,ebx
fffff804`9e890024 448bc3          mov     r8d,ebx
fffff804`9e890027 8bca            mov     ecx,edx
fffff804`9e890029 4c8b4808        mov     r9,qword ptr [rax+8]
fffff804`9e89002d bdfeffffff      mov     ebp,0FFFFFFFEh
fffff804`9e890032 85d2            test    edx,edx
fffff804`9e890034 0f84a6000000    je      stornvme!NVMeControllerFilterResourceRequirements+0x1a0 (fffff804`9e8900e0)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0xfa:
fffff804`9e89003a 418bd0          mov     edx,r8d
fffff804`9e89003d 488d4f28        lea     rcx,[rdi+28h]
fffff804`9e890041 48c1e205        shl     rdx,5
fffff804`9e890045 4803ca          add     rcx,rdx
fffff804`9e890048 e83b40ffff      call    stornvme!IsPci3MsiInterrupt (fffff804`9e884088)
fffff804`9e89004d 84c0            test    al,al
fffff804`9e89004f 7479            je      stornvme!NVMeControllerFilterResourceRequirements+0x18a (fffff804`9e8900ca)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x111:
fffff804`9e890051 4d85c9          test    r9,r9
fffff804`9e890054 740e            je      stornvme!NVMeControllerFilterResourceRequirements+0x124 (fffff804`9e890064)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x116:
fffff804`9e890056 418bc2          mov     eax,r10d
fffff804`9e890059 490fa3c1        bt      r9,rax
fffff804`9e89005d 7205            jb      stornvme!NVMeControllerFilterResourceRequirements+0x124 (fffff804`9e890064)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x11f:
fffff804`9e89005f 4503d4          add     r10d,r12d
fffff804`9e890062 ebf2            jmp     stornvme!NVMeControllerFilterResourceRequirements+0x116 (fffff804`9e890056)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x124:
fffff804`9e890064 b804000000      mov     eax,4
fffff804`9e890069 896c3a30        mov     dword ptr [rdx+rdi+30h],ebp
fffff804`9e89006d 6609443a2c      or      word ptr [rdx+rdi+2Ch],ax
fffff804`9e890072 418bca          mov     ecx,r10d
fffff804`9e890075 6689443a38      mov     word ptr [rdx+rdi+38h],ax
fffff804`9e89007a 498bc4          mov     rax,r12
fffff804`9e89007d 48d3e0          shl     rax,cl
fffff804`9e890080 4889443a40      mov     qword ptr [rdx+rdi+40h],rax
fffff804`9e890085 418bc2          mov     eax,r10d
fffff804`9e890088 490fb3c1        btr     r9,rax
fffff804`9e89008c 896c3a34        mov     dword ptr [rdx+rdi+34h],ebp
fffff804`9e890090 6644895c3a3a    mov     word ptr [rdx+rdi+3Ah],r11w
fffff804`9e890096 c7443a3c03000000 mov     dword ptr [rdx+rdi+3Ch],3
fffff804`9e89009e 4d85c9          test    r9,r9
fffff804`9e8900a1 7527            jne     stornvme!NVMeControllerFilterResourceRequirements+0x18a (fffff804`9e8900ca)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x163:
fffff804`9e8900a3 0fb786e8000000  movzx   eax,word ptr [rsi+0E8h]
fffff804`9e8900aa 412bc4          sub     eax,r12d
fffff804`9e8900ad 443bd8          cmp     r11d,eax
fffff804`9e8900b0 7428            je      stornvme!NVMeControllerFilterResourceRequirements+0x19a (fffff804`9e8900da)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x172:
fffff804`9e8900b2 488b86f8000000  mov     rax,qword ptr [rsi+0F8h]
fffff804`9e8900b9 4503dc          add     r11d,r12d
fffff804`9e8900bc 418bcb          mov     ecx,r11d
fffff804`9e8900bf 448bd3          mov     r10d,ebx
fffff804`9e8900c2 4803c9          add     rcx,rcx
fffff804`9e8900c5 4c8b4cc808      mov     r9,qword ptr [rax+rcx*8+8]

stornvme!NVMeControllerFilterResourceRequirements+0x18a:
fffff804`9e8900ca 8b4f24          mov     ecx,dword ptr [rdi+24h]
fffff804`9e8900cd 4503c4          add     r8d,r12d
fffff804`9e8900d0 443bc1          cmp     r8d,ecx
fffff804`9e8900d3 730b            jae     stornvme!NVMeControllerFilterResourceRequirements+0x1a0 (fffff804`9e8900e0)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x195:
fffff804`9e8900d5 e960ffffff      jmp     stornvme!NVMeControllerFilterResourceRequirements+0xfa (fffff804`9e89003a)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x19a:
fffff804`9e8900da 8b4f24          mov     ecx,dword ptr [rdi+24h]
fffff804`9e8900dd 4503c4          add     r8d,r12d

stornvme!NVMeControllerFilterResourceRequirements+0x1a0:
fffff804`9e8900e0 488b86f8000000  mov     rax,qword ptr [rsi+0F8h]
fffff804`9e8900e7 448bcb          mov     r9d,ebx
fffff804`9e8900ea 8bd1            mov     edx,ecx
fffff804`9e8900ec 4c8b5008        mov     r10,qword ptr [rax+8]
fffff804`9e8900f0 443bc1          cmp     r8d,ecx
fffff804`9e8900f3 7373            jae     stornvme!NVMeControllerFilterResourceRequirements+0x228 (fffff804`9e890168)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1b5:
fffff804`9e8900f5 418bc0          mov     eax,r8d
fffff804`9e8900f8 488d4f28        lea     rcx,[rdi+28h]
fffff804`9e8900fc 48c1e005        shl     rax,5
fffff804`9e890100 4803c8          add     rcx,rax
fffff804`9e890103 418bd0          mov     edx,r8d
fffff804`9e890106 e87d3fffff      call    stornvme!IsPci3MsiInterrupt (fffff804`9e884088)
fffff804`9e89010b 84c0            test    al,al
fffff804`9e89010d 7510            jne     stornvme!NVMeControllerFilterResourceRequirements+0x1df (fffff804`9e89011f)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1cf:
fffff804`9e89010f 8b5724          mov     edx,dword ptr [rdi+24h]
fffff804`9e890112 4503c4          add     r8d,r12d
fffff804`9e890115 443bc2          cmp     r8d,edx
fffff804`9e890118 72db            jb      stornvme!NVMeControllerFilterResourceRequirements+0x1b5 (fffff804`9e8900f5)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1da:
fffff804`9e89011a e9b9000000      jmp     stornvme!NVMeControllerFilterResourceRequirements+0x298 (fffff804`9e8901d8)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1df:
fffff804`9e89011f 4d85d2          test    r10,r10
fffff804`9e890122 740e            je      stornvme!NVMeControllerFilterResourceRequirements+0x1f2 (fffff804`9e890132)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1e4:
fffff804`9e890124 418bc1          mov     eax,r9d
fffff804`9e890127 490fa3c2        bt      r10,rax
fffff804`9e89012b 7205            jb      stornvme!NVMeControllerFilterResourceRequirements+0x1f2 (fffff804`9e890132)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1ed:
fffff804`9e89012d 4503cc          add     r9d,r12d
fffff804`9e890130 ebf2            jmp     stornvme!NVMeControllerFilterResourceRequirements+0x1e4 (fffff804`9e890124)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x1f2:
fffff804`9e890132 48c1e205        shl     rdx,5
fffff804`9e890136 b804000000      mov     eax,4
fffff804`9e89013b 418bc9          mov     ecx,r9d
fffff804`9e89013e 6609443a2c      or      word ptr [rdx+rdi+2Ch],ax
fffff804`9e890143 89443a38        mov     dword ptr [rdx+rdi+38h],eax
fffff804`9e890147 498bc4          mov     rax,r12
fffff804`9e89014a 48d3e0          shl     rax,cl
fffff804`9e89014d 4889443a40      mov     qword ptr [rdx+rdi+40h],rax
fffff804`9e890152 4503c4          add     r8d,r12d
fffff804`9e890155 896c3a30        mov     dword ptr [rdx+rdi+30h],ebp
fffff804`9e890159 896c3a34        mov     dword ptr [rdx+rdi+34h],ebp
fffff804`9e89015d c7443a3c03000000 mov     dword ptr [rdx+rdi+3Ch],3
fffff804`9e890165 8b5724          mov     edx,dword ptr [rdi+24h]

stornvme!NVMeControllerFilterResourceRequirements+0x228:
fffff804`9e890168 448bcb          mov     r9d,ebx
fffff804`9e89016b eb1d            jmp     stornvme!NVMeControllerFilterResourceRequirements+0x24a (fffff804`9e89018a)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x22d:
fffff804`9e89016d 418bc0          mov     eax,r8d
fffff804`9e890170 488d4f28        lea     rcx,[rdi+28h]
fffff804`9e890174 48c1e005        shl     rax,5
fffff804`9e890178 4803c8          add     rcx,rax
fffff804`9e89017b e8083fffff      call    stornvme!IsPci3MsiInterrupt (fffff804`9e884088)
fffff804`9e890180 84c0            test    al,al
fffff804`9e890182 750d            jne     stornvme!NVMeControllerFilterResourceRequirements+0x251 (fffff804`9e890191)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x244:
fffff804`9e890184 8b5724          mov     edx,dword ptr [rdi+24h]
fffff804`9e890187 4503c4          add     r8d,r12d

stornvme!NVMeControllerFilterResourceRequirements+0x24a:
fffff804`9e89018a 443bc2          cmp     r8d,edx
fffff804`9e89018d 72de            jb      stornvme!NVMeControllerFilterResourceRequirements+0x22d (fffff804`9e89016d)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x24f:
fffff804`9e89018f eb47            jmp     stornvme!NVMeControllerFilterResourceRequirements+0x298 (fffff804`9e8901d8)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x251:
fffff804`9e890191 458bc8          mov     r9d,r8d
fffff804`9e890194 eb3d            jmp     stornvme!NVMeControllerFilterResourceRequirements+0x293 (fffff804`9e8901d3)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x256:
fffff804`9e890196 418bc0          mov     eax,r8d
fffff804`9e890199 488d4f28        lea     rcx,[rdi+28h]
fffff804`9e89019d 48c1e005        shl     rax,5
fffff804`9e8901a1 4803c8          add     rcx,rax
fffff804`9e8901a4 e8df3effff      call    stornvme!IsPci3MsiInterrupt (fffff804`9e884088)
fffff804`9e8901a9 84c0            test    al,al
fffff804`9e8901ab 7520            jne     stornvme!NVMeControllerFilterResourceRequirements+0x28d (fffff804`9e8901cd)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x26d:
fffff804`9e8901ad 453bc1          cmp     r8d,r9d
fffff804`9e8901b0 7418            je      stornvme!NVMeControllerFilterResourceRequirements+0x28a (fffff804`9e8901ca)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x272:
fffff804`9e8901b2 0f1001          movups  xmm0,xmmword ptr [rcx]
fffff804`9e8901b5 418bc1          mov     eax,r9d
fffff804`9e8901b8 48c1e005        shl     rax,5
fffff804`9e8901bc 0f11443828      movups  xmmword ptr [rax+rdi+28h],xmm0
fffff804`9e8901c1 0f104910        movups  xmm1,xmmword ptr [rcx+10h]
fffff804`9e8901c5 0f114c3838      movups  xmmword ptr [rax+rdi+38h],xmm1

stornvme!NVMeControllerFilterResourceRequirements+0x28a:
fffff804`9e8901ca 4503cc          add     r9d,r12d

stornvme!NVMeControllerFilterResourceRequirements+0x28d:
fffff804`9e8901cd 8b5724          mov     edx,dword ptr [rdi+24h]
fffff804`9e8901d0 4503c4          add     r8d,r12d

stornvme!NVMeControllerFilterResourceRequirements+0x293:
fffff804`9e8901d3 443bc2          cmp     r8d,edx
fffff804`9e8901d6 72be            jb      stornvme!NVMeControllerFilterResourceRequirements+0x256 (fffff804`9e890196)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x298:
fffff804`9e8901d8 4585ff          test    r15d,r15d
fffff804`9e8901db 744a            je      stornvme!NVMeControllerFilterResourceRequirements+0x2e7 (fffff804`9e890227)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x29d:
fffff804`9e8901dd 8bcb            mov     ecx,ebx
fffff804`9e8901df 85d2            test    edx,edx
fffff804`9e8901e1 743f            je      stornvme!NVMeControllerFilterResourceRequirements+0x2e2 (fffff804`9e890222)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x2a3:
fffff804`9e8901e3 8bd1            mov     edx,ecx
fffff804`9e8901e5 48c1e205        shl     rdx,5
fffff804`9e8901e9 4438643a29      cmp     byte ptr [rdx+rdi+29h],r12b
fffff804`9e8901ee 7507            jne     stornvme!NVMeControllerFilterResourceRequirements+0x2b7 (fffff804`9e8901f7)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x2b0:
fffff804`9e8901f0 4484643a2c      test    byte ptr [rdx+rdi+2Ch],r12b
fffff804`9e8901f5 7521            jne     stornvme!NVMeControllerFilterResourceRequirements+0x2d8 (fffff804`9e890218)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x2b7:
fffff804`9e8901f7 3bcb            cmp     ecx,ebx
fffff804`9e8901f9 741a            je      stornvme!NVMeControllerFilterResourceRequirements+0x2d5 (fffff804`9e890215)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x2bb:
fffff804`9e8901fb 0f10443a28      movups  xmm0,xmmword ptr [rdx+rdi+28h]
fffff804`9e890200 8bc3            mov     eax,ebx
fffff804`9e890202 48c1e005        shl     rax,5
fffff804`9e890206 0f11443828      movups  xmmword ptr [rax+rdi+28h],xmm0
fffff804`9e89020b 0f104c3a38      movups  xmm1,xmmword ptr [rdx+rdi+38h]
fffff804`9e890210 0f114c3838      movups  xmmword ptr [rax+rdi+38h],xmm1

stornvme!NVMeControllerFilterResourceRequirements+0x2d5:
fffff804`9e890215 4103dc          add     ebx,r12d

stornvme!NVMeControllerFilterResourceRequirements+0x2d8:
fffff804`9e890218 8b5724          mov     edx,dword ptr [rdi+24h]
fffff804`9e89021b 4103cc          add     ecx,r12d
fffff804`9e89021e 3bca            cmp     ecx,edx
fffff804`9e890220 72c1            jb      stornvme!NVMeControllerFilterResourceRequirements+0x2a3 (fffff804`9e8901e3)  Branch

stornvme!NVMeControllerFilterResourceRequirements+0x2e2:
fffff804`9e890222 2bd9            sub     ebx,ecx
fffff804`9e890224 4403f3          add     r14d,ebx

stornvme!NVMeControllerFilterResourceRequirements+0x2e7:
fffff804`9e890227 8bc2            mov     eax,edx
fffff804`9e890229 488d4f28        lea     rcx,[rdi+28h]
fffff804`9e89022d 48c1e005        shl     rax,5
fffff804`9e890231 488d5728        lea     rdx,[rdi+28h]
fffff804`9e890235 4803d0          add     rdx,rax
fffff804`9e890238 498b4508        mov     rax,qword ptr [r13+8]
fffff804`9e89023c 448b00          mov     r8d,dword ptr [rax]
fffff804`9e89023f 442bc2          sub     r8d,edx
fffff804`9e890242 4403c0          add     r8d,eax
fffff804`9e890245 418bc6          mov     eax,r14d
fffff804`9e890248 48c1e005        shl     rax,5
fffff804`9e89024c 4803c8          add     rcx,rax
fffff804`9e89024f e8ec270000      call    stornvme!memcpy (fffff804`9e892a40)
fffff804`9e890254 448b4724        mov     r8d,dword ptr [rdi+24h]
fffff804`9e890258 498b4508        mov     rax,qword ptr [r13+8]
fffff804`9e89025c 452bc6          sub     r8d,r14d
fffff804`9e89025f 418bd0          mov     edx,r8d
fffff804`9e890262 49c1e005        shl     r8,5
fffff804`9e890266 c1e205          shl     edx,5
fffff804`9e890269 8b08            mov     ecx,dword ptr [rax]
fffff804`9e89026b 492bc8          sub     rcx,r8
fffff804`9e89026e 4803c8          add     rcx,rax
fffff804`9e890271 e8caa1ffff      call    stornvme!NVMeZeroMemory (fffff804`9e88a440)
fffff804`9e890276 44897724        mov     dword ptr [rdi+24h],r14d

stornvme!NVMeControllerFilterResourceRequirements+0x33a:
fffff804`9e89027a 4c8d5c2440      lea     r11,[rsp+40h]
fffff804`9e89027f 498b5b30        mov     rbx,qword ptr [r11+30h]
fffff804`9e890283 498b6b38        mov     rbp,qword ptr [r11+38h]
fffff804`9e890287 498b7340        mov     rsi,qword ptr [r11+40h]
fffff804`9e89028b 498be3          mov     rsp,r11
fffff804`9e89028e 415f            pop     r15
fffff804`9e890290 415e            pop     r14
fffff804`9e890292 415d            pop     r13
fffff804`9e890294 415c            pop     r12
fffff804`9e890296 5f              pop     rdi
fffff804`9e890297 c3              ret
