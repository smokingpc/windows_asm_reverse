0: kd> uf stornvme!NVMeControllerReset
stornvme!NVMeControllerReset:
fffff804`9240cd48 48895c2408      mov     qword ptr [rsp+8],rbx
fffff804`9240cd4d 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff804`9240cd52 4889742418      mov     qword ptr [rsp+18h],rsi
fffff804`9240cd57 57              push    rdi
fffff804`9240cd58 4883ec20        sub     rsp,20h
fffff804`9240cd5c 408af2          mov     sil,dl
fffff804`9240cd5f 488bd9          mov     rbx,rcx
fffff804`9240cd62 bf01000000      mov     edi,1
fffff804`9240cd67 488d15aac90000  lea     rdx,[stornvme!`string` (fffff804`92419718)]	;"StorNVMe - Controller Reset START"
fffff804`9240cd6e 8d6f02          lea     ebp,[rdi+2]
fffff804`9240cd71 8bcd            mov     ecx,ebp
fffff804`9240cd73 48ff15b6220100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff804`9241f030)]
fffff804`9240cd7a 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240cd7f f00fbaab8c0e000000 lock bts dword ptr [rbx+0E8Ch],0
fffff804`9240cd88 730c            jae     stornvme!NVMeControllerReset+0x4e (fffff804`9240cd96)  Branch

stornvme!NVMeControllerReset+0x42:
fffff804`9240cd8a 488d15afc90000  lea     rdx,[stornvme!`string` (fffff804`92419740)]	;"StorNVMe - Controller Reset Already in Progress."
fffff804`9240cd91 e95b010000      jmp     stornvme!NVMeControllerReset+0x1a9 (fffff804`9240cef1)  Branch

stornvme!NVMeControllerReset+0x4e:
fffff804`9240cd96 ba78000000      mov     edx,78h
fffff804`9240cd9b 488bcb          mov     rcx,rbx
fffff804`9240cd9e 48ff15a3220100  call    qword ptr [stornvme!_imp_StorPortPause (fffff804`9241f048)]
fffff804`9240cda5 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240cdaa 8b4314          mov     eax,dword ptr [rbx+14h]		;read previous CC in DevExt
fffff804`9240cdad b20e            mov     dl,0Eh
fffff804`9240cdaf 83e0fe          and     eax,0FFFFFFFEh
fffff804`9240cdb2 488bcb          mov     rcx,rbx
fffff804`9240cdb5 83c810          or      eax,10h
fffff804`9240cdb8 894314          mov     dword ptr [rbx+14h],eax		;write previous CC.EN == 0 && CC.CSS==1
fffff804`9240cdbb e8b4f4ffff      call    stornvme!NVMeControllerCompleteAllIORequests (fffff804`9240c274)
fffff804`9240cdc0 488bcb          mov     rcx,rbx
fffff804`9240cdc3 e8e892ffff      call    stornvme!NVMeCancelAllCompletionQueueDpc (fffff804`924060b0)
fffff804`9240cdc8 4084f6          test    sil,sil			;if(sil==0) goto 0x119 to call stornvme!ControllerReset()
fffff804`9240cdcb 0f8490000000    je      stornvme!NVMeControllerReset+0x119 (fffff804`9240ce61)  Branch

stornvme!NVMeControllerReset+0x89:
fffff804`9240cdd1 488b8398000000  mov     rax,qword ptr [rbx+98h]					;DevExt+0x98
fffff804`9240cdd8 48b90000000010000000 mov rcx,1000000000h								;
fffff804`9240cde2 4885c1          test    rcx,rax								;if(CAP.Reserved2 != 1) goto 0xff
fffff804`9240cde5 7460            je      stornvme!NVMeControllerReset+0xff (fffff804`9240ce47)  Branch

stornvme!NVMeControllerReset+0x9f:
fffff804`9240cde7 488b8388000000  mov     rax,qword ptr [rbx+88h]
fffff804`9240cdee c74020654d564e  mov     dword ptr [rax+20h],4E564D65h				;4E564D65h=> 'NVMe'
fffff804`9240cdf5 f0830c2400      lock or dword ptr [rsp],0
fffff804`9240cdfa b988130000      mov     ecx,1388h									;stall 5 milliseconds
fffff804`9240cdff 48ff153a220100  call    qword ptr [stornvme!_imp_StorPortStallExecution (fffff804`9241f040)]
fffff804`9240ce06 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240ce0b 8a8b780e0000    mov     cl,byte ptr [rbx+0E78h]
fffff804`9240ce11 8ac1            mov     al,cl
fffff804`9240ce13 4022c5          and     al,bpl
fffff804`9240ce16 403ac5          cmp     al,bpl
fffff804`9240ce19 7509            jne     stornvme!NVMeControllerReset+0xdc (fffff804`9240ce24)  Branch

stornvme!NVMeControllerReset+0xd3:
fffff804`9240ce1b 80c904          or      cl,4
fffff804`9240ce1e 888b780e0000    mov     byte ptr [rbx+0E78h],cl

stornvme!NVMeControllerReset+0xdc:
fffff804`9240ce24 836314ef        and     dword ptr [rbx+14h],0FFFFFFEFh
fffff804`9240ce28 488bcb          mov     rcx,rbx
fffff804`9240ce2b e884140000      call    stornvme!NVMeQueuesReInit (fffff804`9240e2b4)
fffff804`9240ce30 33d2            xor     edx,edx
fffff804`9240ce32 488bcb          mov     rcx,rbx
fffff804`9240ce35 e862f8ffff      call    stornvme!NVMeControllerInitPart1 (fffff804`9240c69c)
fffff804`9240ce3a 84c0            test    al,al				;if(NVMeControllerInitPart1() != FALSE) goto 0x12e 
fffff804`9240ce3c 7538            jne     stornvme!NVMeControllerReset+0x12e (fffff804`9240ce76)  Branch

stornvme!NVMeControllerReset+0xf6:
fffff804`9240ce3e 488d15bbc90000  lea     rdx,[stornvme!`string` (fffff804`92419800)]	;"StorNVMe - Controller Reset FAILED (NVMeControllerInitPart1() ==" FALSE)."
fffff804`9240ce45 eb07            jmp     stornvme!NVMeControllerReset+0x106 (fffff804`9240ce4e)  Branch

stornvme!NVMeControllerReset+0xff:
fffff804`9240ce47 488d152ac90000  lea     rdx,[stornvme!`string` (fffff804`92419778)]	;"StorNVMe - Controller Reset FAILED (CAP.NSSRS == 0)"

stornvme!NVMeControllerReset+0x106:
fffff804`9240ce4e 8bcd            mov     ecx,ebp
fffff804`9240ce50 48ff15d9210100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff804`9241f030)]
fffff804`9240ce57 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240ce5c 4032ff          xor     dil,dil
fffff804`9240ce5f eb64            jmp     stornvme!NVMeControllerReset+0x17d (fffff804`9240cec5)  Branch

stornvme!NVMeControllerReset+0x119:
fffff804`9240ce61 488bcb          mov     rcx,rbx
fffff804`9240ce64 e8d3d5ffff      call    stornvme!ControllerReset (fffff804`9240a43c)
fffff804`9240ce69 84c0            test    al,al
fffff804`9240ce6b 75b7            jne     stornvme!NVMeControllerReset+0xdc (fffff804`9240ce24)  Branch

stornvme!NVMeControllerReset+0x125:
fffff804`9240ce6d 488d153cc90000  lea     rdx,[stornvme!`string` (fffff804`924197b0)]		;"StorNVMe - Controller Reset FAILED (ControllerReset() == FALSE)."
fffff804`9240ce74 ebd8            jmp     stornvme!NVMeControllerReset+0x106 (fffff804`9240ce4e)  Branch

stornvme!NVMeControllerReset+0x12e:
fffff804`9240ce76 448ac7          mov     r8b,dil
fffff804`9240ce79 33d2            xor     edx,edx
fffff804`9240ce7b 488bcb          mov     rcx,rbx
fffff804`9240ce7e e865f9ffff      call    stornvme!NVMeControllerInitPart2 (fffff804`9240c7e8)
fffff804`9240ce83 84c0            test    al,al				;if(FALSE==NVMeControllerInitPart2()) StorPortDebugPrint() with 0x13F
fffff804`9240ce85 7509            jne     stornvme!NVMeControllerReset+0x148 (fffff804`9240ce90)  Branch

stornvme!NVMeControllerReset+0x13f:
fffff804`9240ce87 488d15c2c90000  lea     rdx,[stornvme!`string` (fffff804`92419850)]		;"StorNVMe - Controller Reset FAILED (NVMeControllerInitPart2() == FALSE)."
fffff804`9240ce8e ebbe            jmp     stornvme!NVMeControllerReset+0x106 (fffff804`9240ce4e)  Branch

stornvme!NVMeControllerReset+0x148:
fffff804`9240ce90 33d2            xor     edx,edx
fffff804`9240ce92 3993b8000000    cmp     dword ptr [rbx+0B8h],edx
fffff804`9240ce98 7e2b            jle     stornvme!NVMeControllerReset+0x17d (fffff804`9240cec5)  Branch

stornvme!NVMeControllerReset+0x152:
fffff804`9240ce9a 488d8b68060000  lea     rcx,[rbx+668h]

stornvme!NVMeControllerReset+0x159:
fffff804`9240cea1 488b01          mov     rax,qword ptr [rcx]
fffff804`9240cea4 4885c0          test    rax,rax
fffff804`9240cea7 740e            je      stornvme!NVMeControllerReset+0x16f (fffff804`9240ceb7)  Branch

stornvme!NVMeControllerReset+0x161:
fffff804`9240cea9 4084f6          test    sil,sil
fffff804`9240ceac 7506            jne     stornvme!NVMeControllerReset+0x16c (fffff804`9240ceb4)  Branch

stornvme!NVMeControllerReset+0x166:
fffff804`9240ceae 017828          add     dword ptr [rax+28h],edi
fffff804`9240ceb1 488b01          mov     rax,qword ptr [rcx]

stornvme!NVMeControllerReset+0x16c:
fffff804`9240ceb4 01782c          add     dword ptr [rax+2Ch],edi

stornvme!NVMeControllerReset+0x16f:
fffff804`9240ceb7 03d7            add     edx,edi
fffff804`9240ceb9 4883c108        add     rcx,8
fffff804`9240cebd 3b93b8000000    cmp     edx,dword ptr [rbx+0B8h]
fffff804`9240cec3 7cdc            jl      stornvme!NVMeControllerReset+0x159 (fffff804`9240cea1)  Branch

stornvme!NVMeControllerReset+0x17d:
fffff804`9240cec5 83a38c0e0000fe  and     dword ptr [rbx+0E8Ch],0FFFFFFFEh
fffff804`9240cecc 488bcb          mov     rcx,rbx
fffff804`9240cecf 48ff1562210100  call    qword ptr [stornvme!_imp_StorPortResume (fffff804`9241f038)]
fffff804`9240ced6 0f1f440000      nop     dword ptr [rax+rax]
fffff804`9240cedb 4084ff          test    dil,dil
fffff804`9240cede 750a            jne     stornvme!NVMeControllerReset+0x1a2 (fffff804`9240ceea)  Branch

stornvme!NVMeControllerReset+0x198:
fffff804`9240cee0 488bcb          mov     rcx,rbx
fffff804`9240cee3 e878c9ffff      call    stornvme!NVMeControllerStartFailureEventLog (fffff804`92409860)
fffff804`9240cee8 eb15            jmp     stornvme!NVMeControllerReset+0x1b7 (fffff804`9240ceff)  Branch

stornvme!NVMeControllerReset+0x1a2:
fffff804`9240ceea 488d15afc90000  lea     rdx,[stornvme!`string` (fffff804`924198a0)]		;StorNVMe - Controller Reset SUCCESS."

stornvme!NVMeControllerReset+0x1a9:
fffff804`9240cef1 8bcd            mov     ecx,ebp
fffff804`9240cef3 48ff1536210100  call    qword ptr [stornvme!_imp_StorPortDebugPrint (fffff804`9241f030)]
fffff804`9240cefa 0f1f440000      nop     dword ptr [rax+rax]

stornvme!NVMeControllerReset+0x1b7:
fffff804`9240ceff 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff804`9240cf04 408ac7          mov     al,dil
fffff804`9240cf07 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff804`9240cf0c 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff804`9240cf11 4883c420        add     rsp,20h
fffff804`9240cf15 5f              pop     rdi
fffff804`9240cf16 c3              ret
