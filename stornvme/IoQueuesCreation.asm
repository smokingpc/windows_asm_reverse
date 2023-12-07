13: kd> uf stornvme!IoQueuesCreation
stornvme!IoQueuesCreation:
fffff809`a8a4af50 48895c2408      mov     qword ptr [rsp+8],rbx
fffff809`a8a4af55 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff809`a8a4af5a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff809`a8a4af5f 57              push    rdi
fffff809`a8a4af60 4883ec20        sub     rsp,20h
fffff809`a8a4af64 bd01000000      mov     ebp,1
fffff809`a8a4af69 408af2          mov     sil,dl
fffff809`a8a4af6c 488bd9          mov     rbx,rcx
fffff809`a8a4af6f 0fb7fd          movzx   edi,bp
fffff809`a8a4af72 663ba90a010000  cmp     bp,word ptr [rcx+10Ah]
fffff809`a8a4af79 771e            ja      stornvme!IoQueuesCreation+0x49 (fffff809`a8a4af99)  Branch

stornvme!IoQueuesCreation+0x2b:
fffff809`a8a4af7b 448ac6          mov     r8b,sil
fffff809`a8a4af7e 0fb7d7          movzx   edx,di
fffff809`a8a4af81 488bcb          mov     rcx,rbx
fffff809`a8a4af84 e847960000      call    stornvme!NVMeIoCompletionQueueCreate (fffff809`a8a545d0)
fffff809`a8a4af89 84c0            test    al,al
fffff809`a8a4af8b 744e            je      stornvme!IoQueuesCreation+0x8b (fffff809`a8a4afdb)  Branch

stornvme!IoQueuesCreation+0x3d:
fffff809`a8a4af8d 6603fd          add     di,bp
fffff809`a8a4af90 663bbb0a010000  cmp     di,word ptr [rbx+10Ah]
fffff809`a8a4af97 76e2            jbe     stornvme!IoQueuesCreation+0x2b (fffff809`a8a4af7b)  Branch

stornvme!IoQueuesCreation+0x49:
fffff809`a8a4af99 0fb7fd          movzx   edi,bp
fffff809`a8a4af9c 663bab08010000  cmp     bp,word ptr [rbx+108h]
fffff809`a8a4afa3 771e            ja      stornvme!IoQueuesCreation+0x73 (fffff809`a8a4afc3)  Branch

stornvme!IoQueuesCreation+0x55:
fffff809`a8a4afa5 448ac6          mov     r8b,sil
fffff809`a8a4afa8 0fb7d7          movzx   edx,di
fffff809`a8a4afab 488bcb          mov     rcx,rbx
fffff809`a8a4afae e8799a0000      call    stornvme!NVMeIoSubmissionQueueCreate (fffff809`a8a54a2c)
fffff809`a8a4afb3 84c0            test    al,al
fffff809`a8a4afb5 7424            je      stornvme!IoQueuesCreation+0x8b (fffff809`a8a4afdb)  Branch

stornvme!IoQueuesCreation+0x67:
fffff809`a8a4afb7 6603fd          add     di,bp
fffff809`a8a4afba 663bbb08010000  cmp     di,word ptr [rbx+108h]
fffff809`a8a4afc1 76e2            jbe     stornvme!IoQueuesCreation+0x55 (fffff809`a8a4afa5)  Branch

stornvme!IoQueuesCreation+0x73:
fffff809`a8a4afc3 408ac5          mov     al,bpl

stornvme!IoQueuesCreation+0x76:
fffff809`a8a4afc6 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff809`a8a4afcb 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff809`a8a4afd0 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff809`a8a4afd5 4883c420        add     rsp,20h
fffff809`a8a4afd9 5f              pop     rdi
fffff809`a8a4afda c3              ret

stornvme!IoQueuesCreation+0x8b:
fffff809`a8a4afdb 488bcb          mov     rcx,rbx
fffff809`a8a4afde e8fd010000      call    stornvme!IoQueuesFreeResources (fffff809`a8a4b1e0)
fffff809`a8a4afe3 32c0            xor     al,al
fffff809`a8a4afe5 ebdf            jmp     stornvme!IoQueuesCreation+0x76 (fffff809`a8a4afc6)  Branch
