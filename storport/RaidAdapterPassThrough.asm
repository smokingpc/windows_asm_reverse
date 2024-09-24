4: kd> uf storport!RaidAdapterPassThrough
storport!RaidAdapterPassThrough:
fffff807`d7d1bf80 48895c2408      mov     qword ptr [rsp+8],rbx
fffff807`d7d1bf85 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff807`d7d1bf8a 4889742420      mov     qword ptr [rsp+20h],rsi
fffff807`d7d1bf8f 57              push    rdi
fffff807`d7d1bf90 4883ec40        sub     rsp,40h
fffff807`d7d1bf94 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff807`d7d1bf9b 488bf1          mov     rsi,rcx
fffff807`d7d1bf9e 418ae8          mov     bpl,r8b
fffff807`d7d1bfa1 488bda          mov     rbx,rdx
fffff807`d7d1bfa4 488bca          mov     rcx,rdx
fffff807`d7d1bfa7 448b4818        mov     r9d,dword ptr [rax+18h]
fffff807`d7d1bfab 4181e944d00400  sub     r9d,4D044h    ;IOCTL_SCSI_PASS_THROUGH_EX
fffff807`d7d1bfb2 41f7c1fbffffff  test    r9d,0FFFFFFFBh
fffff807`d7d1bfb9 0f8467290000    je      storport!RaidAdapterPassThrough+0x29a6 (fffff807`d7d1e926)  Branch

storport!RaidAdapterPassThrough+0x3f:
fffff807`d7d1bfbf 4032ff          xor     dil,dil
fffff807`d7d1bfc2 e89539fbff      call    storport!PortPassThroughBasicValidation (fffff807`d7ccf95c)

storport!RaidAdapterPassThrough+0x47:
fffff807`d7d1bfc7 85c0            test    eax,eax
fffff807`d7d1bfc9 0f8895290000    js      storport!RaidAdapterPassThrough+0x29e4 (fffff807`d7d1e964)  Branch

storport!RaidAdapterPassThrough+0x4f:
fffff807`d7d1bfcf 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff807`d7d1bfd3 4084ff          test    dil,dil
fffff807`d7d1bfd6 0f8558290000    jne     storport!RaidAdapterPassThrough+0x29b4 (fffff807`d7d1e934)  Branch

storport!RaidAdapterPassThrough+0x5c:
fffff807`d7d1bfdc 8a4203          mov     al,byte ptr [rdx+3]
fffff807`d7d1bfdf 88442458        mov     byte ptr [rsp+58h],al
fffff807`d7d1bfe3 8a4204          mov     al,byte ptr [rdx+4]
fffff807`d7d1bfe6 88442459        mov     byte ptr [rsp+59h],al
fffff807`d7d1bfea 8a4205          mov     al,byte ptr [rdx+5]

storport!RaidAdapterPassThrough+0x6d:
fffff807`d7d1bfed 8844245a        mov     byte ptr [rsp+5Ah],al
fffff807`d7d1bff1 488bce          mov     rcx,rsi
fffff807`d7d1bff4 8b542458        mov     edx,dword ptr [rsp+58h]
fffff807`d7d1bff8 e80bfef9ff      call    storport!RaidAdapterFindUnit (fffff807`d7cbbe08)
fffff807`d7d1bffd 488bf8          mov     rdi,rax
fffff807`d7d1c000 4885c0          test    rax,rax
fffff807`d7d1c003 0f845b290000    je      storport!RaidAdapterPassThrough+0x29e4 (fffff807`d7d1e964)  Branch

storport!RaidAdapterPassThrough+0x89:
fffff807`d7d1c009 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]
fffff807`d7d1c010 80780100        cmp     byte ptr [rax+1],0
fffff807`d7d1c014 750d            jne     storport!RaidAdapterPassThrough+0xa3 (fffff807`d7d1c023)  Branch

storport!RaidAdapterPassThrough+0x96:
fffff807`d7d1c016 f687a000000001  test    byte ptr [rdi+0A0h],1
fffff807`d7d1c01d 0f8539290000    jne     storport!RaidAdapterPassThrough+0x29dc (fffff807`d7d1e95c)  Branch

storport!RaidAdapterPassThrough+0xa3:
fffff807`d7d1c023 448b9648010000  mov     r10d,dword ptr [rsi+148h]
fffff807`d7d1c02a 408ad5          mov     dl,bpl
fffff807`d7d1c02d 448b9e4c010000  mov     r11d,dword ptr [rsi+14Ch]
fffff807`d7d1c034 488bcb          mov     rcx,rbx
fffff807`d7d1c037 80480301        or      byte ptr [rax+3],1
fffff807`d7d1c03b e8cc38fbff      call    storport!RaidSqmRecordPassthroughData (fffff807`d7ccf90c)
fffff807`d7d1c040 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff807`d7d1c044 448ac5          mov     r8b,bpl
fffff807`d7d1c047 48897c2438      mov     qword ptr [rsp+38h],rdi
fffff807`d7d1c04c 488bd3          mov     rdx,rbx
fffff807`d7d1c04f 4489542428      mov     dword ptr [rsp+28h],r10d
fffff807`d7d1c054 44895c2420      mov     dword ptr [rsp+20h],r11d
fffff807`d7d1c059 e8f2000000      call    storport!PortPassThroughExSendAsync (fffff807`d7d1c150)
fffff807`d7d1c05e b803010000      mov     eax,103h

storport!RaidAdapterPassThrough+0xe3:
fffff807`d7d1c063 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff807`d7d1c068 488b6c2460      mov     rbp,qword ptr [rsp+60h]
fffff807`d7d1c06d 488b742468      mov     rsi,qword ptr [rsp+68h]
fffff807`d7d1c072 4883c440        add     rsp,40h
fffff807`d7d1c076 5f              pop     rdi
fffff807`d7d1c077 c3              ret

storport!RaidAdapterPassThrough+0x29a6:
fffff807`d7d1e926 40b701          mov     dil,1
fffff807`d7d1e929 e8c609feff      call    storport!PortPassThroughExBasicValidation (fffff807`d7cff2f4)
fffff807`d7d1e92e 90              nop
fffff807`d7d1e92f e993d6ffff      jmp     storport!RaidAdapterPassThrough+0x47 (fffff807`d7d1bfc7)  Branch

storport!RaidAdapterPassThrough+0x29b4:
fffff807`d7d1e934 8b4a18          mov     ecx,dword ptr [rdx+18h]
fffff807`d7d1e937 4803ca          add     rcx,rdx
fffff807`d7d1e93a 66833901        cmp     word ptr [rcx],1
fffff807`d7d1e93e 7524            jne     storport!RaidAdapterPassThrough+0x29e4 (fffff807`d7d1e964)  Branch

storport!RaidAdapterPassThrough+0x29c0:
fffff807`d7d1e940 83790404        cmp     dword ptr [rcx+4],4
fffff807`d7d1e944 721e            jb      storport!RaidAdapterPassThrough+0x29e4 (fffff807`d7d1e964)  Branch

storport!RaidAdapterPassThrough+0x29c6:
fffff807`d7d1e946 8a4108          mov     al,byte ptr [rcx+8]
fffff807`d7d1e949 88442458        mov     byte ptr [rsp+58h],al
fffff807`d7d1e94d 8a4109          mov     al,byte ptr [rcx+9]
fffff807`d7d1e950 88442459        mov     byte ptr [rsp+59h],al
fffff807`d7d1e954 8a410a          mov     al,byte ptr [rcx+0Ah]
fffff807`d7d1e957 e991d6ffff      jmp     storport!RaidAdapterPassThrough+0x6d (fffff807`d7d1bfed)  Branch

storport!RaidAdapterPassThrough+0x29dc:
fffff807`d7d1e95c 41b8100000c0    mov     r8d,0C0000010h
fffff807`d7d1e962 eb06            jmp     storport!RaidAdapterPassThrough+0x29ea (fffff807`d7d1e96a)  Branch

storport!RaidAdapterPassThrough+0x29e4:
fffff807`d7d1e964 41b80e0000c0    mov     r8d,0C000000Eh

storport!RaidAdapterPassThrough+0x29ea:
fffff807`d7d1e96a 33d2            xor     edx,edx
fffff807`d7d1e96c 488bcb          mov     rcx,rbx
fffff807`d7d1e96f e83cacf9ff      call    storport!RaidCompleteRequestEx (fffff807`d7cb95b0)
fffff807`d7d1e974 90              nop
fffff807`d7d1e975 e9e9d6ffff      jmp     storport!RaidAdapterPassThrough+0xe3 (fffff807`d7d1c063)  Branch
