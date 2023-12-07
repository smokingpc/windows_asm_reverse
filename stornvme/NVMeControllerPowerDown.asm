stornvme!NVMeControllerPowerDown:
fffff801`dbeec9ac 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff801`dbeec9b1 4889742420      mov     qword ptr [rsp+20h],rsi
fffff801`dbeec9b6 57              push    rdi
fffff801`dbeec9b7 4883ec30        sub     rsp,30h
fffff801`dbeec9bb 33c0            xor     eax,eax
fffff801`dbeec9bd 488bf9          mov     rdi,rcx
fffff801`dbeec9c0 488b89700e0000  mov     rcx,qword ptr [rcx+0E70h]
fffff801`dbeec9c7 33f6            xor     esi,esi
fffff801`dbeec9c9 89442448        mov     dword ptr [rsp+48h],eax
fffff801`dbeec9cd 4885c9          test    rcx,rcx
fffff801`dbeec9d0 7420            je      stornvme!NVMeControllerPowerDown+0x46 (fffff801`dbeec9f2)  Branch

stornvme!NVMeControllerPowerDown+0x26:
fffff801`dbeec9d2 8b4104          mov     eax,dword ptr [rcx+4]
fffff801`dbeec9d5 488d5108        lea     rdx,[rcx+8]
fffff801`dbeec9d9 448b09          mov     r9d,dword ptr [rcx]
fffff801`dbeec9dc 4533c0          xor     r8d,r8d
fffff801`dbeec9df 89442428        mov     dword ptr [rsp+28h],eax
fffff801`dbeec9e3 488bcf          mov     rcx,rdi
fffff801`dbeec9e6 4889542420      mov     qword ptr [rsp+20h],rdx
fffff801`dbeec9eb 33d2            xor     edx,edx
fffff801`dbeec9ed e8e29b0000      call    stornvme!NVMeSetHostMemoryBuffer (fffff801`dbef65d4)

stornvme!NVMeControllerPowerDown+0x46:
fffff801`dbeec9f2 8a8f780e0000    mov     cl,byte ptr [rdi+0E78h]
fffff801`dbeec9f8 8ac1            mov     al,cl
fffff801`dbeec9fa 2403            and     al,3
fffff801`dbeec9fc 3c03            cmp     al,3
fffff801`dbeec9fe 7509            jne     stornvme!NVMeControllerPowerDown+0x5d (fffff801`dbeeca09)  Branch

stornvme!NVMeControllerPowerDown+0x54:
fffff801`dbeeca00 80c904          or      cl,4
fffff801`dbeeca03 888f780e0000    mov     byte ptr [rdi+0E78h],cl

stornvme!NVMeControllerPowerDown+0x5d:
fffff801`dbeeca09 0fb6472b        movzx   eax,byte ptr [rdi+2Bh]
fffff801`dbeeca0d 488d15e4da0000  lea     rdx,[stornvme!`string` (fffff801`dbefa4f8)] ;"StorNVMe - POWER: Controller D3, waiting %us seconds..."
fffff801`dbeeca14 bb05000000      mov     ebx,5
fffff801`dbeeca19 b903000000      mov     ecx,3
fffff801`dbeeca1e 3bc3            cmp     eax,ebx
fffff801`dbeeca20 0f43d8          cmovae  ebx,eax
fffff801`dbeeca23 448bc3          mov     r8d,ebx
fffff801`dbeeca26 48ff1503260100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff801`dbeff030)]
fffff801`dbeeca2d 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbeeca32 8b4714          mov     eax,dword ptr [rdi+14h]
fffff801`dbeeca35 488bcf          mov     rcx,rdi
fffff801`dbeeca38 83e0fe          and     eax,0FFFFFFFEh
fffff801`dbeeca3b 83c804          or      eax,4
fffff801`dbeeca3e 894714          mov     dword ptr [rdi+14h],eax
fffff801`dbeeca41 e8aae5ffff      call    stornvme!IoQueuesDeletion (fffff801`dbeeaff0)
fffff801`dbeeca46 488b8788000000  mov     rax,qword ptr [rdi+88h]
fffff801`dbeeca4d 8b4014          mov     eax,dword ptr [rax+14h]
fffff801`dbeeca50 488b8f88000000  mov     rcx,qword ptr [rdi+88h]
fffff801`dbeeca57 89442440        mov     dword ptr [rsp+40h],eax
fffff801`dbeeca5b 0fbaf00f        btr     eax,0Fh
fffff801`dbeeca5f 0fbae80e        bts     eax,0Eh
fffff801`dbeeca63 89442440        mov     dword ptr [rsp+40h],eax
fffff801`dbeeca67 894114          mov     dword ptr [rcx+14h],eax
fffff801`dbeeca6a f0093424        lock or dword ptr [rsp],esi
fffff801`dbeeca6e 6bdb64          imul    ebx,ebx,64h
fffff801`dbeeca71 85db            test    ebx,ebx
fffff801`dbeeca73 7434            je      stornvme!NVMeControllerPowerDown+0xfd (fffff801`dbeecaa9)  Branch

stornvme!NVMeControllerPowerDown+0xc9:
fffff801`dbeeca75 488b8788000000  mov     rax,qword ptr [rdi+88h]
fffff801`dbeeca7c 8b401c          mov     eax,dword ptr [rax+1Ch]
fffff801`dbeeca7f 89442448        mov     dword ptr [rsp+48h],eax
fffff801`dbeeca83 240c            and     al,0Ch
fffff801`dbeeca85 3c08            cmp     al,8
fffff801`dbeeca87 7420            je      stornvme!NVMeControllerPowerDown+0xfd (fffff801`dbeecaa9)  Branch

stornvme!NVMeControllerPowerDown+0xdd:
fffff801`dbeeca89 41b810270000    mov     r8d,2710h
fffff801`dbeeca8f 488bd7          mov     rdx,rdi
fffff801`dbeeca92 b951000000      mov     ecx,51h
fffff801`dbeeca97 48ff158a250100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`dbeff028)]
fffff801`dbeeca9e 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbeecaa3 ffc6            inc     esi
fffff801`dbeecaa5 3bf3            cmp     esi,ebx
fffff801`dbeecaa7 72cc            jb      stornvme!NVMeControllerPowerDown+0xc9 (fffff801`dbeeca75)  Branch

stornvme!NVMeControllerPowerDown+0xfd:
fffff801`dbeecaa9 448d04b6        lea     r8d,[rsi+rsi*4]
fffff801`dbeecaad b903000000      mov     ecx,3
fffff801`dbeecab2 4503c0          add     r8d,r8d
fffff801`dbeecab5 488d157cda0000  lea     rdx,[stornvme!`string` (fffff801`dbefa538)]       ;"StorNVMe - POWER: Controller D3, took %ums."
fffff801`dbeecabc 48ff156d250100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff801`dbeff030)]
fffff801`dbeecac3 0f1f440000      nop     dword ptr [rax+rax]
fffff801`dbeecac8 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff801`dbeecacd 488b742458      mov     rsi,qword ptr [rsp+58h]
fffff801`dbeecad2 4883c430        add     rsp,30h
fffff801`dbeecad6 5f              pop     rdi
fffff801`dbeecad7 c3              ret
