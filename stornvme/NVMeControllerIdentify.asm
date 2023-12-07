4: kd> UF stornvme!NVMeControllerIdentify
stornvme!NVMeControllerIdentify:
fffff806`451c8ef8 48895c2408      mov     qword ptr [rsp+8],rbx
fffff806`451c8efd 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff806`451c8f02 57              push    rdi
fffff806`451c8f03 4883ec20        sub     rsp,20h
fffff806`451c8f07 33ed            xor     ebp,ebp
fffff806`451c8f09 488bf9          mov     rdi,rcx
fffff806`451c8f0c 4088a953030000  mov     byte ptr [rcx+353h],bpl
fffff806`451c8f13 33d2            xor     edx,edx
fffff806`451c8f15 488b89a8030000  mov     rcx,qword ptr [rcx+3A8h]
fffff806`451c8f1c 41b8a0100000    mov     r8d,10A0h
fffff806`451c8f22 e8d9fefeff      call    stornvme!memset (fffff806`451b8e00)
fffff806`451c8f27 488b87a8030000  mov     rax,qword ptr [rdi+3A8h]
fffff806`451c8f2e 8bd5            mov     edx,ebp
fffff806`451c8f30 4889a888100000  mov     qword ptr [rax+1088h],rbp
fffff806`451c8f37 488b87a8030000  mov     rax,qword ptr [rdi+3A8h]
fffff806`451c8f3e 48898788030000  mov     qword ptr [rdi+388h],rax
fffff806`451c8f45 c7874803000001000000 mov dword ptr [rdi+348h],1

stornvme!NVMeControllerIdentify+0x57:
fffff806`451c8f4f 488b8fa8030000  mov     rcx,qword ptr [rdi+3A8h]
fffff806`451c8f56 8d4201          lea     eax,[rdx+1]
fffff806`451c8f59 ffc2            inc     edx
fffff806`451c8f5b 08819d100000    or      byte ptr [rcx+109Dh],al
fffff806`451c8f61 83fa02          cmp     edx,2
fffff806`451c8f64 7ce9            jl      stornvme!NVMeControllerIdentify+0x57 (fffff806`451c8f4f)  Branch

stornvme!NVMeControllerIdentify+0x6e:
fffff806`451c8f66 488b87a8030000  mov     rax,qword ptr [rdi+3A8h]
fffff806`451c8f6d 488d9f50030000  lea     rbx,[rdi+350h]
fffff806`451c8f74 488bd3          mov     rdx,rbx
fffff806`451c8f77 6689a894100000  mov     word ptr [rax+1094h],bp
fffff806`451c8f7e 488b8fa8030000  mov     rcx,qword ptr [rdi+3A8h]
fffff806`451c8f85 488b8760060000  mov     rax,qword ptr [rdi+660h]
fffff806`451c8f8c c6810010000006  mov     byte ptr [rcx+1000h],6
fffff806`451c8f93 89a904100000    mov     dword ptr [rcx+1004h],ebp
fffff806`451c8f99 48898118100000  mov     qword ptr [rcx+1018h],rax
fffff806`451c8fa0 c6812810000001  mov     byte ptr [rcx+1028h],1
fffff806`451c8fa7 488bcf          mov     rcx,rdi
fffff806`451c8faa e8519cfeff      call    stornvme!ProcessCommand (fffff806`451b2c00)
fffff806`451c8faf 41b980969800    mov     r9d,989680h                       ;wait 1 second for this cmd complete.
fffff806`451c8fb5 41b001          mov     r8b,1
fffff806`451c8fb8 488bd3          mov     rdx,rbx
fffff806`451c8fbb 488bcf          mov     rcx,rdi
fffff806`451c8fbe e8294a0000      call    stornvme!WaitForCommandCompleteWithCustomTimeout (fffff806`451cd9ec)
fffff806`451c8fc3 488bcf          mov     rcx,rdi
fffff806`451c8fc6 e87924ffff      call    stornvme!IsIntelChatham (fffff806`451bb444)
fffff806`451c8fcb 84c0            test    al,al
fffff806`451c8fcd 746e            je      stornvme!NVMeControllerIdentify+0x145 (fffff806`451c903d)  Branch

stornvme!NVMeControllerIdentify+0xd7:
fffff806`451c8fcf 488b9f58060000  mov     rbx,qword ptr [rdi+658h]
fffff806`451c8fd6 bf86800000      mov     edi,8086h
fffff806`451c8fdb 66393b          cmp     word ptr [rbx],di
fffff806`451c8fde 745d            je      stornvme!NVMeControllerIdentify+0x145 (fffff806`451c903d)  Branch

stornvme!NVMeControllerIdentify+0xe8:
fffff806`451c8fe0 33d2            xor     edx,edx
fffff806`451c8fe2 41b800100000    mov     r8d,1000h
fffff806`451c8fe8 488bcb          mov     rcx,rbx
fffff806`451c8feb e810fefeff      call    stornvme!memset (fffff806`451b8e00)
fffff806`451c8ff0 808b0501000001  or      byte ptr [rbx+105h],1
fffff806`451c8ff7 48b84368617468616d32 mov rax,326D616874616843h
fffff806`451c9001 48894318        mov     qword ptr [rbx+18h],rax
fffff806`451c9005 b823040000      mov     eax,423h
fffff806`451c900a 66894349        mov     word ptr [rbx+49h],ax
fffff806`451c900e c70386801120    mov     dword ptr [rbx],20118086h
fffff806`451c9014 c7430432303132  mov     dword ptr [rbx+4],32313032h
fffff806`451c901b c6434030        mov     byte ptr [rbx+40h],30h
fffff806`451c901f c6434801        mov     byte ptr [rbx+48h],1
fffff806`451c9023 c6830301000003  mov     byte ptr [rbx+103h],3
fffff806`451c902a 66c783000200006644 mov   word ptr [rbx+200h],4466h
fffff806`451c9033 c7830402000001000000 mov dword ptr [rbx+204h],1

stornvme!NVMeControllerIdentify+0x145:
fffff806`451c903d 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff806`451c9042 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff806`451c9047 4883c420        add     rsp,20h
fffff806`451c904b 5f              pop     rdi
fffff806`451c904c c3              ret
