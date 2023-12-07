9: kd> uf stornvme!GetProcessorGroupInformation 
stornvme!GetProcessorGroupInformation:
fffff804`9e8840b4 48895c2408      mov     qword ptr [rsp+8],rbx
fffff804`9e8840b9 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff804`9e8840be 4889742418      mov     qword ptr [rsp+18h],rsi
fffff804`9e8840c3 57              push    rdi
fffff804`9e8840c4 4156            push    r14
fffff804`9e8840c6 4157            push    r15
fffff804`9e8840c8 4883ec30        sub     rsp,30h
fffff804`9e8840cc 488bf9          mov     rdi,rcx
fffff804`9e8840cf e864010000      call    stornvme!FreeProcessorGroupInfo (fffff804`9e884238)
fffff804`9e8840d4 488db7e8000000  lea     rsi,[rdi+0E8h]
fffff804`9e8840db 488bd7          mov     rdx,rdi
fffff804`9e8840de 4c8bc6          mov     r8,rsi
fffff804`9e8840e1 b912000000      mov     ecx,12h       ;ExtFunctionGetActiveGroupCount
fffff804`9e8840e6 4c8b156baf0200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff804`9e8af058)]
fffff804`9e8840ed e8fe4f39b1      call    storport!StorPortExtendedFunction (fffff804`4fc190f0)
fffff804`9e8840f2 0fb706          movzx   eax,word ptr [rsi]
fffff804`9e8840f5 33ed            xor     ebp,ebp
fffff804`9e8840f7 6685c0          test    ax,ax
fffff804`9e8840fa 0f849aff0000    je      stornvme!GetProcessorGroupInformation+0xffe6 (fffff804`9e89409a)  Branch

stornvme!GetProcessorGroupInformation+0x4c:
fffff804`9e884100 448bc0          mov     r8d,eax
fffff804`9e884103 4c8db7f8000000  lea     r14,[rdi+0F8h]
fffff804`9e88410a 41c1e004        shl     r8d,4
fffff804`9e88410e 41b94e766d65    mov     r9d,656D764Eh
fffff804`9e884114 488bd7          mov     rdx,rdi
fffff804`9e884117 4c89742420      mov     qword ptr [rsp+20h],r14
fffff804`9e88411c 33c9            xor     ecx,ecx       ;ExtFunctionAllocatePool
fffff804`9e88411e 4c8b1533af0200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff804`9e8af058)]
fffff804`9e884125 e8c64f39b1      call    storport!StorPortExtendedFunction (fffff804`4fc190f0)
fffff804`9e88412a 498b0e          mov     rcx,qword ptr [r14]
fffff804`9e88412d 4885c9          test    rcx,rcx
fffff804`9e884130 0f8464ff0000    je      stornvme!GetProcessorGroupInformation+0xffe6 (fffff804`9e89409a)  Branch

stornvme!GetProcessorGroupInformation+0x82:
fffff804`9e884136 0fb716          movzx   edx,word ptr [rsi]
fffff804`9e884139 c1e204          shl     edx,4
fffff804`9e88413c e8ff620000      call    stornvme!NVMeZeroMemory (fffff804`9e88a440)
fffff804`9e884141 663b2e          cmp     bp,word ptr [rsi]
fffff804`9e884144 0f83cb000000    jae     stornvme!GetProcessorGroupInformation+0x161 (fffff804`9e884215)  Branch

stornvme!GetProcessorGroupInformation+0x96:
fffff804`9e88414a 498b06          mov     rax,qword ptr [r14]
fffff804`9e88414d 41bf33333333    mov     r15d,33333333h

stornvme!GetProcessorGroupInformation+0x9f:
fffff804`9e884153 4c8d4808        lea     r9,[rax+8]
fffff804`9e884157 0fb7dd          movzx   ebx,bp
fffff804`9e88415a 48c1e304        shl     rbx,4
fffff804`9e88415e 488bd7          mov     rdx,rdi
fffff804`9e884161 4c03cb          add     r9,rbx
fffff804`9e884164 440fb7c5        movzx   r8d,bp
fffff804`9e884168 b913000000      mov     ecx,13h       ;ExtFunctionGetGroupAffinity
fffff804`9e88416d 4c8b15e4ae0200  mov     r10,qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff804`9e8af058)]
fffff804`9e884174 e8774f39b1      call    storport!StorPortExtendedFunction (fffff804`4fc190f0)
fffff804`9e884179 498b06          mov     rax,qword ptr [r14]
fffff804`9e88417c 66892c03        mov     word ptr [rbx+rax],bp
fffff804`9e884180 66ffc5          inc     bp
fffff804`9e884183 4d8b06          mov     r8,qword ptr [r14]
fffff804`9e884186 428b540308      mov     edx,dword ptr [rbx+r8+8]
fffff804`9e88418b 8bc2            mov     eax,edx
fffff804`9e88418d d1e8            shr     eax,1
fffff804`9e88418f 2555555555      and     eax,55555555h
fffff804`9e884194 2bd0            sub     edx,eax
fffff804`9e884196 8bca            mov     ecx,edx
fffff804`9e884198 4123d7          and     edx,r15d
fffff804`9e88419b c1e902          shr     ecx,2
fffff804`9e88419e 4123cf          and     ecx,r15d
fffff804`9e8841a1 03ca            add     ecx,edx
fffff804`9e8841a3 8bc1            mov     eax,ecx
fffff804`9e8841a5 c1e804          shr     eax,4
fffff804`9e8841a8 03c1            add     eax,ecx
fffff804`9e8841aa 250f0f0f0f      and     eax,0F0F0F0Fh
fffff804`9e8841af 69c001010101    imul    eax,eax,1010101h
fffff804`9e8841b5 c1e818          shr     eax,18h
fffff804`9e8841b8 664289440302    mov     word ptr [rbx+r8+2],ax
fffff804`9e8841be 498b16          mov     rdx,qword ptr [r14]
fffff804`9e8841c1 488b4c1308      mov     rcx,qword ptr [rbx+rdx+8]
fffff804`9e8841c6 48c1e920        shr     rcx,20h
fffff804`9e8841ca 8bc1            mov     eax,ecx
fffff804`9e8841cc d1e8            shr     eax,1
fffff804`9e8841ce 2555555555      and     eax,55555555h
fffff804`9e8841d3 2bc8            sub     ecx,eax
fffff804`9e8841d5 8bc1            mov     eax,ecx
fffff804`9e8841d7 4123cf          and     ecx,r15d
fffff804`9e8841da c1e802          shr     eax,2
fffff804`9e8841dd 4123c7          and     eax,r15d
fffff804`9e8841e0 03c1            add     eax,ecx
fffff804`9e8841e2 8bc8            mov     ecx,eax
fffff804`9e8841e4 c1e904          shr     ecx,4
fffff804`9e8841e7 03c8            add     ecx,eax
fffff804`9e8841e9 81e10f0f0f0f    and     ecx,0F0F0F0Fh
fffff804`9e8841ef 69c901010101    imul    ecx,ecx,1010101h
fffff804`9e8841f5 c1e918          shr     ecx,18h
fffff804`9e8841f8 66014c1302      add     word ptr [rbx+rdx+2],cx
fffff804`9e8841fd 498b06          mov     rax,qword ptr [r14]
fffff804`9e884200 0fb74c0302      movzx   ecx,word ptr [rbx+rax+2]
fffff804`9e884205 66018fea000000  add     word ptr [rdi+0EAh],cx
fffff804`9e88420c 663b2e          cmp     bp,word ptr [rsi]
fffff804`9e88420f 0f823effffff    jb      stornvme!GetProcessorGroupInformation+0x9f (fffff804`9e884153)  Branch

stornvme!GetProcessorGroupInformation+0x161:
fffff804`9e884215 b001            mov     al,1

stornvme!GetProcessorGroupInformation+0x163:
fffff804`9e884217 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff804`9e88421c 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff804`9e884221 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff804`9e884226 4883c430        add     rsp,30h
fffff804`9e88422a 415f            pop     r15
fffff804`9e88422c 415e            pop     r14
fffff804`9e88422e 5f              pop     rdi
fffff804`9e88422f c3              ret

stornvme!GetProcessorGroupInformation+0xffe6:
fffff804`9e89409a 488bcf          mov     rcx,rdi
fffff804`9e89409d e89601ffff      call    stornvme!FreeProcessorGroupInfo (fffff804`9e884238)
fffff804`9e8940a2 32c0            xor     al,al
fffff804`9e8940a4 e96e01ffff      jmp     stornvme!GetProcessorGroupInformation+0x163 (fffff804`9e884217)  Branch
