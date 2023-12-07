1: kd> uf stornvme!NVMeControllerInitPart1
stornvme!NVMeControllerInitPart1:
fffff808`7144dabc 48895c2408      mov     qword ptr [rsp+8],rbx
fffff808`7144dac1 48896c2420      mov     qword ptr [rsp+20h],rbp
fffff808`7144dac6 57              push    rdi
fffff808`7144dac7 4883ec20        sub     rsp,20h
fffff808`7144dacb 408afa          mov     dil,dl
fffff808`7144dace 488bd9          mov     rbx,rcx
fffff808`7144dad1 84d2            test    dl,dl
fffff808`7144dad3 7417            je      stornvme!NVMeControllerInitPart1+0x30 (fffff808`7144daec)  Branch

stornvme!NVMeControllerInitPart1+0x19:
fffff808`7144dad5 e8fed9ffff      call    stornvme!AdminQueueInitialize (fffff808`7144b4d8)
fffff808`7144dada 84c0            test    al,al
fffff808`7144dadc 750e            jne     stornvme!NVMeControllerInitPart1+0x30 (fffff808`7144daec)  Branch

stornvme!NVMeControllerInitPart1+0x22:
fffff808`7144dade c7431807000000  mov     dword ptr [rbx+18h],7

stornvme!NVMeControllerInitPart1+0x29:
fffff808`7144dae5 32c0            xor     al,al
fffff808`7144dae7 e9eb000000      jmp     stornvme!NVMeControllerInitPart1+0x11b (fffff808`7144dbd7)  Branch

stornvme!NVMeControllerInitPart1+0x30:
fffff808`7144daec 0fb78b04010000  movzx   ecx,word ptr [rbx+104h]
fffff808`7144daf3 bd01000000      mov     ebp,1
fffff808`7144daf8 2bcd            sub     ecx,ebp
fffff808`7144dafa 81e1ff0f0000    and     ecx,0FFFh
fffff808`7144db00 8bc1            mov     eax,ecx
fffff808`7144db02 c1e010          shl     eax,10h
fffff808`7144db05 0bc1            or      eax,ecx
fffff808`7144db07 488b8b88000000  mov     rcx,qword ptr [rbx+88h]
fffff808`7144db0e 89442438        mov     dword ptr [rsp+38h],eax   ;write to reserved3
fffff808`7144db12 894124          mov     dword ptr [rcx+24h],eax   ;wite to AQA
fffff808`7144db15 f0830c2400      lock or dword ptr [rsp],0
fffff808`7144db1a 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff808`7144db21 488b8ba0010000  mov     rcx,qword ptr [rbx+1A0h]
fffff808`7144db28 894830          mov     dword ptr [rax+30h],ecx   ;write to ACQ low part
fffff808`7144db2b f0830c2400      lock or dword ptr [rsp],0
fffff808`7144db30 48c1e920        shr     rcx,20h
fffff808`7144db34 894834          mov     dword ptr [rax+34h],ecx   ;write to ACQ high part
fffff808`7144db37 f0830c2400      lock or dword ptr [rsp],0
fffff808`7144db3c 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff808`7144db43 488b8b18010000  mov     rcx,qword ptr [rbx+118h]
fffff808`7144db4a 894828          mov     dword ptr [rax+28h],ecx   ;write to ASQ low part
fffff808`7144db4d f0830c2400      lock or dword ptr [rsp],0
fffff808`7144db52 48c1e920        shr     rcx,20h
fffff808`7144db56 89482c          mov     dword ptr [rax+2Ch],ecx   ;write to ASQ high part
fffff808`7144db59 f0830c2400      lock or dword ptr [rsp],0
fffff808`7144db5e 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff808`7144db65 b900004600      mov     ecx,460000h
fffff808`7144db6a 894c2440        mov     dword ptr [rsp+40h],ecx
fffff808`7144db6e 894814          mov     dword ptr [rax+14h],ecx   ;write to CC -> EN==0 IOSQES==6 , IOCQES==4 (refer to nvme.sys!NvmeEnableAdapter)
fffff808`7144db71 f0830c2400      lock or dword ptr [rsp],0
fffff808`7144db76 b988130000      mov     ecx,1388h                 ;wait 5 milliseconds
fffff808`7144db7b 48ff15be240100  call    qword ptr [stornvme!_imp_StorPortStallExecution (fffff808`71460040)]
fffff808`7144db82 0f1f440000      nop     dword ptr [rax+rax]
fffff808`7144db87 488bcb          mov     rcx,rbx
fffff808`7144db8a e815dcffff      call    stornvme!ControllerEnable (fffff808`7144b7a4)
fffff808`7144db8f 84c0            test    al,al
fffff808`7144db91 750c            jne     stornvme!NVMeControllerInitPart1+0xe3 (fffff808`7144db9f)  Branch

stornvme!NVMeControllerInitPart1+0xd7:
fffff808`7144db93 c7431808000000  mov     dword ptr [rbx+18h],8
fffff808`7144db9a e946ffffff      jmp     stornvme!NVMeControllerInitPart1+0x29 (fffff808`7144dae5)  Branch

stornvme!NVMeControllerInitPart1+0xe3:
fffff808`7144db9f 4084ff          test    dil,dil
fffff808`7144dba2 7507            jne     stornvme!NVMeControllerInitPart1+0xef (fffff808`7144dbab)  Branch

stornvme!NVMeControllerInitPart1+0xe8:
fffff808`7144dba4 8b4314          mov     eax,dword ptr [rbx+14h]
fffff808`7144dba7 a820            test    al,20h
fffff808`7144dba9 7419            je      stornvme!NVMeControllerInitPart1+0x108 (fffff808`7144dbc4)  Branch

stornvme!NVMeControllerInitPart1+0xef:
fffff808`7144dbab 836314df        and     dword ptr [rbx+14h],0FFFFFFDFh
fffff808`7144dbaf 488bcb          mov     rcx,rbx
fffff808`7144dbb2 e85d6e0000      call    stornvme!NVMeControllerIdentify (fffff808`71454a14)
fffff808`7144dbb7 4084ff          test    dil,dil
fffff808`7144dbba 7408            je      stornvme!NVMeControllerInitPart1+0x108 (fffff808`7144dbc4)  Branch

stornvme!NVMeControllerInitPart1+0x100:
fffff808`7144dbbc 488bcb          mov     rcx,rbx
fffff808`7144dbbf e874880000      call    stornvme!NVMeNameSpaceIdentify (fffff808`71456438)

stornvme!NVMeControllerInitPart1+0x108:
fffff808`7144dbc4 807b1000        cmp     byte ptr [rbx+10h],0
fffff808`7144dbc8 741d            je      stornvme!NVMeControllerInitPart1+0x12b (fffff808`7144dbe7)  Branch

stornvme!NVMeControllerInitPart1+0x10e:
fffff808`7144dbca c783c000000001000100 mov dword ptr [rbx+0C0h],10001h

stornvme!NVMeControllerInitPart1+0x118:
fffff808`7144dbd4 408ac5          mov     al,bpl

stornvme!NVMeControllerInitPart1+0x11b:
fffff808`7144dbd7 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff808`7144dbdc 488b6c2448      mov     rbp,qword ptr [rsp+48h]
fffff808`7144dbe1 4883c420        add     rsp,20h
fffff808`7144dbe5 5f              pop     rdi
fffff808`7144dbe6 c3              ret

stornvme!NVMeControllerInitPart1+0x12b:
fffff808`7144dbe7 488bcb          mov     rcx,rbx
fffff808`7144dbea e835e2ffff      call    stornvme!GetProcessorInformation (fffff808`7144be24)
fffff808`7144dbef 84c0            test    al,al
fffff808`7144dbf1 75e1            jne     stornvme!NVMeControllerInitPart1+0x118 (fffff808`7144dbd4)  Branch

stornvme!NVMeControllerInitPart1+0x137:
fffff808`7144dbf3 c743180a000000  mov     dword ptr [rbx+18h],0Ah
fffff808`7144dbfa e9e6feffff      jmp     stornvme!NVMeControllerInitPart1+0x29 (fffff808`7144dae5)  Branch
