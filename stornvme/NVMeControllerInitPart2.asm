0: kd> uf stornvme!NVMeControllerInitPart2
stornvme!NVMeControllerInitPart2:
fffff804`9240c7e8 48895c2408      mov     qword ptr [rsp+8],rbx
fffff804`9240c7ed 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff804`9240c7f2 4889742418      mov     qword ptr [rsp+18h],rsi
fffff804`9240c7f7 57              push    rdi
fffff804`9240c7f8 4883ec20        sub     rsp,20h
fffff804`9240c7fc 33ed            xor     ebp,ebp
fffff804`9240c7fe 418af8          mov     dil,r8b
fffff804`9240c801 408af2          mov     sil,dl
fffff804`9240c804 488bd9          mov     rbx,rcx
fffff804`9240c807 84d2            test    dl,dl
fffff804`9240c809 741d            je      stornvme!NVMeControllerInitPart2+0x40 (fffff804`9240c828)  Branch

stornvme!NVMeControllerInitPart2+0x23:
fffff804`9240c80b e8acdeffff      call    stornvme!GetInterruptMessageInformation (fffff804`9240a6bc)
fffff804`9240c810 84c0            test    al,al
fffff804`9240c812 750c            jne     stornvme!NVMeControllerInitPart2+0x38 (fffff804`9240c820)  Branch

stornvme!NVMeControllerInitPart2+0x2c:
fffff804`9240c814 c743180b000000  mov     dword ptr [rbx+18h],0Bh
fffff804`9240c81b e96d010000      jmp     stornvme!NVMeControllerInitPart2+0x1a5 (fffff804`9240c98d)  Branch

stornvme!NVMeControllerInitPart2+0x38:
fffff804`9240c820 488bcb          mov     rcx,rbx
fffff804`9240c823 e8906b0000      call    stornvme!NVMeBuildPollingConfiguration (fffff804`924133b8)

stornvme!NVMeControllerInitPart2+0x40:
fffff804`9240c828 4084f6          test    sil,sil
fffff804`9240c82b 448ac7          mov     r8b,dil
fffff804`9240c82e 488bcb          mov     rcx,rbx
fffff804`9240c831 0f94c2          sete    dl
fffff804`9240c834 e863a00000      call    stornvme!NVMeSetIoQueueCount (fffff804`9241689c)
fffff804`9240c839 6639ab0a010000  cmp     word ptr [rbx+10Ah],bp
fffff804`9240c840 0f8440010000    je      stornvme!NVMeControllerInitPart2+0x19e (fffff804`9240c986)  Branch

stornvme!NVMeControllerInitPart2+0x5e:
fffff804`9240c846 6639ab08010000  cmp     word ptr [rbx+108h],bp
fffff804`9240c84d 0f8433010000    je      stornvme!NVMeControllerInitPart2+0x19e (fffff804`9240c986)  Branch

stornvme!NVMeControllerInitPart2+0x6b:
fffff804`9240c853 8b4334          mov     eax,dword ptr [rbx+34h]
fffff804`9240c856 a804            test    al,4
fffff804`9240c858 751d            jne     stornvme!NVMeControllerInitPart2+0x8f (fffff804`9240c877)  Branch

stornvme!NVMeControllerInitPart2+0x72:
fffff804`9240c85a 408ad7          mov     dl,dil
fffff804`9240c85d 488bcb          mov     rcx,rbx
fffff804`9240c860 e8239f0000      call    stornvme!NVMeSetInterruptCoalescing (fffff804`92416788)
fffff804`9240c865 8b4334          mov     eax,dword ptr [rbx+34h]
fffff804`9240c868 a804            test    al,4
fffff804`9240c86a 750b            jne     stornvme!NVMeControllerInitPart2+0x8f (fffff804`9240c877)  Branch

stornvme!NVMeControllerInitPart2+0x84:
fffff804`9240c86c 408ad7          mov     dl,dil
fffff804`9240c86f 488bcb          mov     rcx,rbx
fffff804`9240c872 e8559b0000      call    stornvme!NVMeSetArbitration (fffff804`924163cc)

stornvme!NVMeControllerInitPart2+0x8f:
fffff804`9240c877 4084f6          test    sil,sil
fffff804`9240c87a 7465            je      stornvme!NVMeControllerInitPart2+0xf9 (fffff804`9240c8e1)  Branch

stornvme!NVMeControllerInitPart2+0x94:
fffff804`9240c87c 488bcb          mov     rcx,rbx
fffff804`9240c87f e87ce5ffff      call    stornvme!InitializePerfOptions (fffff804`9240ae00)
fffff804`9240c884 84c0            test    al,al
fffff804`9240c886 7512            jne     stornvme!NVMeControllerInitPart2+0xb2 (fffff804`9240c89a)  Branch

stornvme!NVMeControllerInitPart2+0xa0:
fffff804`9240c888 89ab08010000    mov     dword ptr [rbx+108h],ebp
fffff804`9240c88e c7431815000000  mov     dword ptr [rbx+18h],15h
fffff804`9240c895 e9f3000000      jmp     stornvme!NVMeControllerInitPart2+0x1a5 (fffff804`9240c98d)  Branch

stornvme!NVMeControllerInitPart2+0xb2:
fffff804`9240c89a 488bcb          mov     rcx,rbx
fffff804`9240c89d e8b2ebffff      call    stornvme!IoQueuesInitialize (fffff804`9240b454)
fffff804`9240c8a2 84c0            test    al,al
fffff804`9240c8a4 750c            jne     stornvme!NVMeControllerInitPart2+0xca (fffff804`9240c8b2)  Branch

stornvme!NVMeControllerInitPart2+0xbe:
fffff804`9240c8a6 c743180d000000  mov     dword ptr [rbx+18h],0Dh
fffff804`9240c8ad e9db000000      jmp     stornvme!NVMeControllerInitPart2+0x1a5 (fffff804`9240c98d)  Branch

stornvme!NVMeControllerInitPart2+0xca:
fffff804`9240c8b2 40386b10        cmp     byte ptr [rbx+10h],bpl
fffff804`9240c8b6 7521            jne     stornvme!NVMeControllerInitPart2+0xf1 (fffff804`9240c8d9)  Branch

stornvme!NVMeControllerInitPart2+0xd0:
fffff804`9240c8b8 6639ab1e030000  cmp     word ptr [rbx+31Eh],bp
fffff804`9240c8bf 7418            je      stornvme!NVMeControllerInitPart2+0xf1 (fffff804`9240c8d9)  Branch

stornvme!NVMeControllerInitPart2+0xd9:
fffff804`9240c8c1 488bcb          mov     rcx,rbx
fffff804`9240c8c4 e8e7f0ffff      call    stornvme!IoReservedQueuesInitialize (fffff804`9240b9b0)
fffff804`9240c8c9 84c0            test    al,al
fffff804`9240c8cb 750c            jne     stornvme!NVMeControllerInitPart2+0xf1 (fffff804`9240c8d9)  Branch

stornvme!NVMeControllerInitPart2+0xe5:
fffff804`9240c8cd c7431811000000  mov     dword ptr [rbx+18h],11h
fffff804`9240c8d4 e9b4000000      jmp     stornvme!NVMeControllerInitPart2+0x1a5 (fffff804`9240c98d)  Branch

stornvme!NVMeControllerInitPart2+0xf1:
fffff804`9240c8d9 488bcb          mov     rcx,rbx
fffff804`9240c8dc e8dbf1ffff      call    stornvme!IoSqToIoCqMapping (fffff804`9240babc)

stornvme!NVMeControllerInitPart2+0xf9:
fffff804`9240c8e1 408ad7          mov     dl,dil
fffff804`9240c8e4 488bcb          mov     rcx,rbx
fffff804`9240c8e7 e864e6ffff      call    stornvme!IoQueuesCreation (fffff804`9240af50)
fffff804`9240c8ec 84c0            test    al,al
fffff804`9240c8ee 750c            jne     stornvme!NVMeControllerInitPart2+0x114 (fffff804`9240c8fc)  Branch

stornvme!NVMeControllerInitPart2+0x108:
fffff804`9240c8f0 c743180e000000  mov     dword ptr [rbx+18h],0Eh
fffff804`9240c8f7 e991000000      jmp     stornvme!NVMeControllerInitPart2+0x1a5 (fffff804`9240c98d)  Branch

stornvme!NVMeControllerInitPart2+0x114:
fffff804`9240c8fc 408ad7          mov     dl,dil
fffff804`9240c8ff 488bcb          mov     rcx,rbx
fffff804`9240c902 e8f9790000      call    stornvme!NVMeGetCommandEffectsLog (fffff804`92414300)
fffff804`9240c907 8b4334          mov     eax,dword ptr [rbx+34h]
fffff804`9240c90a a804            test    al,4
fffff804`9240c90c 752c            jne     stornvme!NVMeControllerInitPart2+0x152 (fffff804`9240c93a)  Branch

stornvme!NVMeControllerInitPart2+0x126:
fffff804`9240c90e 408ad7          mov     dl,dil
fffff804`9240c911 488bcb          mov     rcx,rbx
fffff804`9240c914 e8737b0000      call    stornvme!NVMeGetTemperatureThreshold (fffff804`9241448c)
fffff804`9240c919 8b4334          mov     eax,dword ptr [rbx+34h]
fffff804`9240c91c a804            test    al,4
fffff804`9240c91e 751a            jne     stornvme!NVMeControllerInitPart2+0x152 (fffff804`9240c93a)  Branch

stornvme!NVMeControllerInitPart2+0x138:
fffff804`9240c920 408ad7          mov     dl,dil
fffff804`9240c923 488bcb          mov     rcx,rbx
fffff804`9240c926 e8fd6b0000      call    stornvme!NVMeConfigAsyncEvent (fffff804`92413528)
fffff804`9240c92b 8b4334          mov     eax,dword ptr [rbx+34h]
fffff804`9240c92e a804            test    al,4
fffff804`9240c930 7508            jne     stornvme!NVMeControllerInitPart2+0x152 (fffff804`9240c93a)  Branch

stornvme!NVMeControllerInitPart2+0x14a:
fffff804`9240c932 488bcb          mov     rcx,rbx
fffff804`9240c935 e8ca1b0000      call    stornvme!NVMeStartAsyncEventCommands (fffff804`9240e504)

stornvme!NVMeControllerInitPart2+0x152:
fffff804`9240c93a 488bcb          mov     rcx,rbx
fffff804`9240c93d e8ce070000      call    stornvme!NVMeInitHostMemoryBuffer (fffff804`9240d110)
fffff804`9240c942 8a83780e0000    mov     al,byte ptr [rbx+0E78h]
fffff804`9240c948 2405            and     al,5
fffff804`9240c94a 3c05            cmp     al,5
fffff804`9240c94c 750a            jne     stornvme!NVMeControllerInitPart2+0x170 (fffff804`9240c958)  Branch

stornvme!NVMeControllerInitPart2+0x166:
fffff804`9240c94e b2ff            mov     dl,0FFh
fffff804`9240c950 488bcb          mov     rcx,rbx
fffff804`9240c953 e82c0a0000      call    stornvme!NVMeInitStreams (fffff804`9240d384)

stornvme!NVMeControllerInitPart2+0x170:
fffff804`9240c958 488b83f8050000  mov     rax,qword ptr [rbx+5F8h]
fffff804`9240c95f f6800802000040  test    byte ptr [rax+208h],40h
fffff804`9240c966 7408            je      stornvme!NVMeControllerInitPart2+0x188 (fffff804`9240c970)  Branch

stornvme!NVMeControllerInitPart2+0x180:
fffff804`9240c968 488bcb          mov     rcx,rbx
fffff804`9240c96b e82ca40000      call    stornvme!NVMeSyncHostTime (fffff804`92416d9c)

stornvme!NVMeControllerInitPart2+0x188:
fffff804`9240c970 488bcb          mov     rcx,rbx
fffff804`9240c973 e8b897ffff      call    stornvme!NVMeLogEtwControllerInfo (fffff804`92406130)
fffff804`9240c978 814b1401020000  or      dword ptr [rbx+14h],201h
fffff804`9240c97f b001            mov     al,1
fffff804`9240c981 896b18          mov     dword ptr [rbx+18h],ebp
fffff804`9240c984 eb09            jmp     stornvme!NVMeControllerInitPart2+0x1a7 (fffff804`9240c98f)  Branch

stornvme!NVMeControllerInitPart2+0x19e:
fffff804`9240c986 c743180c000000  mov     dword ptr [rbx+18h],0Ch

stornvme!NVMeControllerInitPart2+0x1a5:
fffff804`9240c98d 32c0            xor     al,al

stornvme!NVMeControllerInitPart2+0x1a7:
fffff804`9240c98f 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff804`9240c994 488b6c2438      mov     rbp,qword ptr [rsp+38h]
fffff804`9240c999 488b742440      mov     rsi,qword ptr [rsp+40h]
fffff804`9240c99e 4883c420        add     rsp,20h
fffff804`9240c9a2 5f              pop     rdi
fffff804`9240c9a3 c3              ret
