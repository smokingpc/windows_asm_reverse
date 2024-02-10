1: kd> uf iavroc+23e20
iaVROC+0x23e20:
fffff803`96263e20 48895c2408      mov     qword ptr [rsp+8],rbx
fffff803`96263e25 4889742410      mov     qword ptr [rsp+10h],rsi
fffff803`96263e2a 57              push    rdi
fffff803`96263e2b 4883ec30        sub     rsp,30h
fffff803`96263e2f 488b0542189106  mov     rax,qword ptr [iaVROC+0x6935678 (fffff803`9cb75678)]
fffff803`96263e36 488d35d3320e00  lea     rsi,[iaVROC+0x107110 (fffff803`96347110)]
fffff803`96263e3d 8bfa            mov     edi,edx
fffff803`96263e3f 488bd9          mov     rbx,rcx
fffff803`96263e42 833800          cmp     dword ptr [rax],0
fffff803`96263e45 7530            jne     iaVROC+0x23e77 (fffff803`96263e77)  Branch

iaVROC+0x23e47:
fffff803`96263e47 488b0dc2320e00  mov     rcx,qword ptr [iaVROC+0x107110 (fffff803`96347110)]
fffff803`96263e4e 483bce          cmp     rcx,rsi
fffff803`96263e51 7424            je      iaVROC+0x23e77 (fffff803`96263e77)  Branch

iaVROC+0x23e53:
fffff803`96263e53 f7412c00000020  test    dword ptr [rcx+2Ch],20000000h
fffff803`96263e5a 741b            je      iaVROC+0x23e77 (fffff803`96263e77)  Branch

iaVROC+0x23e5c:
fffff803`96263e5c 80792901        cmp     byte ptr [rcx+29h],1
fffff803`96263e60 7215            jb      iaVROC+0x23e77 (fffff803`96263e77)  Branch

iaVROC+0x23e62:
fffff803`96263e62 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`96263e66 4c8d05db3f0d00  lea     r8,[iaVROC+0xf7e48 (fffff803`96337e48)]
fffff803`96263e6d ba0d000000      mov     edx,0Dh
fffff803`96263e72 e889d1fdff      call    iaVROC+0x1000 (fffff803`96241000)

iaVROC+0x23e77:
fffff803`96263e77 488b05fa179106  mov     rax,qword ptr [iaVROC+0x6935678 (fffff803`9cb75678)]
fffff803`96263e7e 8b08            mov     ecx,dword ptr [rax]
fffff803`96263e80 83f903          cmp     ecx,3
fffff803`96263e83 754e            jne     iaVROC+0x23ed3 (fffff803`96263ed3)  Branch

iaVROC+0x23e85:
fffff803`96263e85 488b0d84320e00  mov     rcx,qword ptr [iaVROC+0x107110 (fffff803`96347110)]
fffff803`96263e8c 483bce          cmp     rcx,rsi
fffff803`96263e8f 0f84d3000000    je      iaVROC+0x23f68 (fffff803`96263f68)  Branch

iaVROC+0x23e95:
fffff803`96263e95 f7412c00020000  test    dword ptr [rcx+2Ch],200h
fffff803`96263e9c 0f84c6000000    je      iaVROC+0x23f68 (fffff803`96263f68)  Branch

iaVROC+0x23ea2:
fffff803`96263ea2 80792901        cmp     byte ptr [rcx+29h],1
fffff803`96263ea6 0f82bc000000    jb      iaVROC+0x23f68 (fffff803`96263f68)  Branch

iaVROC+0x23eac:
fffff803`96263eac 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`96263eb0 4c8d05f1380d00  lea     r8,[iaVROC+0xf77a8 (fffff803`963377a8)]
fffff803`96263eb7 ba19000000      mov     edx,19h
fffff803`96263ebc e83fd1fdff      call    iaVROC+0x1000 (fffff803`96241000)
fffff803`96263ec1 b001            mov     al,1
fffff803`96263ec3 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff803`96263ec8 488b742448      mov     rsi,qword ptr [rsp+48h]
fffff803`96263ecd 4883c430        add     rsp,30h
fffff803`96263ed1 5f              pop     rdi
fffff803`96263ed2 c3              ret

iaVROC+0x23ed3:
fffff803`96263ed3 488b9b88030000  mov     rbx,qword ptr [rbx+388h]
fffff803`96263eda 85c9            test    ecx,ecx
fffff803`96263edc 7530            jne     iaVROC+0x23f0e (fffff803`96263f0e)  Branch

iaVROC+0x23ede:
fffff803`96263ede 488b0d2b320e00  mov     rcx,qword ptr [iaVROC+0x107110 (fffff803`96347110)]
fffff803`96263ee5 483bce          cmp     rcx,rsi
fffff803`96263ee8 7424            je      iaVROC+0x23f0e (fffff803`96263f0e)  Branch

iaVROC+0x23eea:
fffff803`96263eea f7412c00000020  test    dword ptr [rcx+2Ch],20000000h
fffff803`96263ef1 741b            je      iaVROC+0x23f0e (fffff803`96263f0e)  Branch

iaVROC+0x23ef3:
fffff803`96263ef3 80792901        cmp     byte ptr [rcx+29h],1
fffff803`96263ef7 7215            jb      iaVROC+0x23f0e (fffff803`96263f0e)  Branch

iaVROC+0x23ef9:
fffff803`96263ef9 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`96263efd 4c8d05443f0d00  lea     r8,[iaVROC+0xf7e48 (fffff803`96337e48)]
fffff803`96263f04 ba0d000000      mov     edx,0Dh
fffff803`96263f09 e8f2d0fdff      call    iaVROC+0x1000 (fffff803`96241000)

iaVROC+0x23f0e:
fffff803`96263f0e 488b0563179106  mov     rax,qword ptr [iaVROC+0x6935678 (fffff803`9cb75678)]
fffff803`96263f15 833803          cmp     dword ptr [rax],3
fffff803`96263f18 7513            jne     iaVROC+0x23f2d (fffff803`96263f2d)  Branch

iaVROC+0x23f1a:
fffff803`96263f1a cc              int     3
fffff803`96263f1b b001            mov     al,1
fffff803`96263f1d 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff803`96263f22 488b742448      mov     rsi,qword ptr [rsp+48h]
fffff803`96263f27 4883c430        add     rsp,30h
fffff803`96263f2b 5f              pop     rdi
fffff803`96263f2c c3              ret

iaVROC+0x23f2d:
fffff803`96263f2d 4c8b8390040000  mov     r8,qword ptr [rbx+490h]
fffff803`96263f34 4d85c0          test    r8,r8
fffff803`96263f37 7541            jne     iaVROC+0x23f7a (fffff803`96263f7a)  Branch

iaVROC+0x23f39:
fffff803`96263f39 488b0dd0310e00  mov     rcx,qword ptr [iaVROC+0x107110 (fffff803`96347110)]
fffff803`96263f40 483bce          cmp     rcx,rsi
fffff803`96263f43 7423            je      iaVROC+0x23f68 (fffff803`96263f68)  Branch

iaVROC+0x23f45:
fffff803`96263f45 f7412c00020000  test    dword ptr [rcx+2Ch],200h
fffff803`96263f4c 741a            je      iaVROC+0x23f68 (fffff803`96263f68)  Branch

iaVROC+0x23f4e:
fffff803`96263f4e 80792901        cmp     byte ptr [rcx+29h],1
fffff803`96263f52 7214            jb      iaVROC+0x23f68 (fffff803`96263f68)  Branch

iaVROC+0x23f54:
fffff803`96263f54 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`96263f58 418d500e        lea     edx,[r8+0Eh]
fffff803`96263f5c 4c8d05f5160d00  lea     r8,[iaVROC+0xf5658 (fffff803`96335658)]
fffff803`96263f63 e898d0fdff      call    iaVROC+0x1000 (fffff803`96241000)

iaVROC+0x23f68:
fffff803`96263f68 b001            mov     al,1
fffff803`96263f6a 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff803`96263f6f 488b742448      mov     rsi,qword ptr [rsp+48h]
fffff803`96263f74 4883c430        add     rsp,30h
fffff803`96263f78 5f              pop     rdi
fffff803`96263f79 c3              ret

iaVROC+0x23f7a:
fffff803`96263f7a 488b83e0000000  mov     rax,qword ptr [rbx+0E0h]
fffff803`96263f81 8bd7            mov     edx,edi
fffff803`96263f83 488b4808        mov     rcx,qword ptr [rax+8]
fffff803`96263f87 498bc0          mov     rax,r8
fffff803`96263f8a ff1528d40c00    call    qword ptr [iaVROC+0xf13b8 (fffff803`963313b8)] ;call  iaVROC+0xcfb70()
fffff803`96263f90 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff803`96263f95 84c0            test    al,al
fffff803`96263f97 488b742448      mov     rsi,qword ptr [rsp+48h]
fffff803`96263f9c 0f95c0          setne   al
fffff803`96263f9f 4883c430        add     rsp,30h
fffff803`96263fa3 5f              pop     rdi
fffff803`96263fa4 c3              ret
