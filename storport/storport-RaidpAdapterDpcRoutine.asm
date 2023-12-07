0: kd> uf 0xfffff80e6c5e3c50 
storport!RaidpAdapterDpcRoutine:
fffff80e`6c5e3c50 4c8bdc          mov     r11,rsp
fffff80e`6c5e3c53 53              push    rbx
fffff80e`6c5e3c54 4157            push    r15
fffff80e`6c5e3c56 4881ecc8000000  sub     rsp,0C8h
fffff80e`6c5e3c5d 488b052ca60500  mov     rax,qword ptr [storport!_security_cookie (fffff80e`6c63e290)]
fffff80e`6c5e3c64 4833c4          xor     rax,rsp
fffff80e`6c5e3c67 48898424a0000000 mov     qword ptr [rsp+0A0h],rax
fffff80e`6c5e3c6f 488b5a40        mov     rbx,qword ptr [rdx+40h]       ;RDX == DPC Context == DeviceObject of HBA. DevObj+0x40 == DeviceExtension == AdapterExt
fffff80e`6c5e3c73 33c0            xor     eax,eax
fffff80e`6c5e3c75 498943a8        mov     qword ptr [r11-58h],rax
fffff80e`6c5e3c79 41bf01000000    mov     r15d,1
fffff80e`6c5e3c7f f0440fb1bbf8000000 lock cmpxchg dword ptr [rbx+0F8h],r15d ;AdapterExt->AdapterDpcRoutineLock
fffff80e`6c5e3c88 413bc7          cmp     eax,r15d      ;if(AdapterExt->AdapterDpcRoutineLock already locked) goto 0x1e9 (return)
fffff80e`6c5e3c8b 0f84a8010000    je      storport!RaidpAdapterDpcRoutine+0x1e9 (fffff80e`6c5e3e39)  Branch

storport!RaidpAdapterDpcRoutine+0x41:
fffff80e`6c5e3c91 49896b08        mov     qword ptr [r11+8],rbp
fffff80e`6c5e3c95 49897b20        mov     qword ptr [r11+20h],rdi
fffff80e`6c5e3c99 4d8963e8        mov     qword ptr [r11-18h],r12
fffff80e`6c5e3c9d 4533e4          xor     r12d,r12d
fffff80e`6c5e3ca0 4d896be0        mov     qword ptr [r11-20h],r13
fffff80e`6c5e3ca4 418bec          mov     ebp,r12d
fffff80e`6c5e3ca7 49bd2003000080f7ffff mov r13,0FFFFF78000000320h
fffff80e`6c5e3cb1 498b4500        mov     rax,qword ptr [r13]
fffff80e`6c5e3cb5 443825a4ab0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80e`6c63e860)],r12b
fffff80e`6c5e3cbc 4889442478      mov     qword ptr [rsp+78h],rax
fffff80e`6c5e3cc1 740d            je      storport!RaidpAdapterDpcRoutine+0x80 (fffff80e`6c5e3cd0)  Branch

storport!RaidpAdapterDpcRoutine+0x73:
fffff80e`6c5e3cc3 f605f9aa050004  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff80e`6c63e7c3)],4
fffff80e`6c5e3cca 0f85b2440200    jne     storport!RaidpAdapterDpcRoutine+0x24532 (fffff80e`6c608182)  Branch

storport!RaidpAdapterDpcRoutine+0x80:
fffff80e`6c5e3cd0 4032ff          xor     dil,dil
fffff80e`6c5e3cd3 4c89b424b0000000 mov     qword ptr [rsp+0B0h],r14
fffff80e`6c5e3cdb 4839abf0000000  cmp     qword ptr [rbx+0F0h],rbp          ;is [rbx+0F0h]  AdapterExt->SavedXrbList ?
fffff80e`6c5e3ce2 0f85cc440200    jne     storport!RaidpAdapterDpcRoutine+0x24564 (fffff80e`6c6081b4)  Branch

storport!RaidpAdapterDpcRoutine+0x98:
fffff80e`6c5e3ce8 4532f6          xor     r14b,r14b

storport!RaidpAdapterDpcRoutine+0x9b:
fffff80e`6c5e3ceb 392db3a50500    cmp     dword ptr [storport!DpcCompletionLimit (fffff80e`6c63e2a4)],ebp
fffff80e`6c5e3cf1 7679            jbe     storport!RaidpAdapterDpcRoutine+0x11c (fffff80e`6c5e3d6c)  Branch

storport!RaidpAdapterDpcRoutine+0xa3:
fffff80e`6c5e3cf3 4889b424f0000000 mov     qword ptr [rsp+0F0h],rsi

storport!RaidpAdapterDpcRoutine+0xab:
fffff80e`6c5e3cfb 488b8bf0000000  mov     rcx,qword ptr [rbx+0F0h]
fffff80e`6c5e3d02 4885c9          test    rcx,rcx
fffff80e`6c5e3d05 752b            jne     storport!RaidpAdapterDpcRoutine+0xe2 (fffff80e`6c5e3d32)  Branch

storport!RaidpAdapterDpcRoutine+0xb7:
fffff80e`6c5e3d07 4084ff          test    dil,dil
fffff80e`6c5e3d0a 7558            jne     storport!RaidpAdapterDpcRoutine+0x114 (fffff80e`6c5e3d64)  Branch

storport!RaidpAdapterDpcRoutine+0xbc:
fffff80e`6c5e3d0c 488d8be0000000  lea     rcx,[rbx+0E0h]
fffff80e`6c5e3d13 48ff1546030600  call    qword ptr [storport!_imp_ExpInterlockedFlushSList (fffff80e`6c644060)]
fffff80e`6c5e3d1a 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5e3d1f 488983f0000000  mov     qword ptr [rbx+0F0h],rax
fffff80e`6c5e3d26 410fb6ff        movzx   edi,r15b
fffff80e`6c5e3d2a 488bc8          mov     rcx,rax
fffff80e`6c5e3d2d 4885c0          test    rax,rax
fffff80e`6c5e3d30 7432            je      storport!RaidpAdapterDpcRoutine+0x114 (fffff80e`6c5e3d64)  Branch

storport!RaidpAdapterDpcRoutine+0xe2:
fffff80e`6c5e3d32 488b01          mov     rax,qword ptr [rcx]
fffff80e`6c5e3d35 488d71e0        lea     rsi,[rcx-20h]
fffff80e`6c5e3d39 488983f0000000  mov     qword ptr [rbx+0F0h],rax
fffff80e`6c5e3d40 44847e11        test    byte ptr [rsi+11h],r15b
fffff80e`6c5e3d44 0f8573440200    jne     storport!RaidpAdapterDpcRoutine+0x2456d (fffff80e`6c6081bd)  Branch

storport!RaidpAdapterDpcRoutine+0xfa:
fffff80e`6c5e3d4a 488b8690020000  mov     rax,qword ptr [rsi+290h]      ;RSI=PortContext, PortContext+0x290 == IoResource+0x2B0 == CompletionCallback
fffff80e`6c5e3d51 488bce          mov     rcx,rsi   ;rsi == PortContext
fffff80e`6c5e3d54 ff157e0a0600    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80e`6c6447d8)]
fffff80e`6c5e3d5a ffc5            inc     ebp
fffff80e`6c5e3d5c 3b2d42a50500    cmp     ebp,dword ptr [storport!DpcCompletionLimit (fffff80e`6c63e2a4)]       ;Default 0x80
fffff80e`6c5e3d62 7297            jb      storport!RaidpAdapterDpcRoutine+0xab (fffff80e`6c5e3cfb)  Branch

storport!RaidpAdapterDpcRoutine+0x114:
fffff80e`6c5e3d64 488bb424f0000000 mov     rsi,qword ptr [rsp+0F0h]

storport!RaidpAdapterDpcRoutine+0x11c:
fffff80e`6c5e3d6c 4c39a3f0000000  cmp     qword ptr [rbx+0F0h],r12
fffff80e`6c5e3d73 0f855e440200    jne     storport!RaidpAdapterDpcRoutine+0x24587 (fffff80e`6c6081d7)  Branch

storport!RaidpAdapterDpcRoutine+0x129:
fffff80e`6c5e3d79 4032ff          xor     dil,dil

storport!RaidpAdapterDpcRoutine+0x12c:
fffff80e`6c5e3d7c 4489a3f8000000  mov     dword ptr [rbx+0F8h],r12d
fffff80e`6c5e3d83 4084ff          test    dil,dil
fffff80e`6c5e3d86 0f8554440200    jne     storport!RaidpAdapterDpcRoutine+0x24590 (fffff80e`6c6081e0)  Branch

storport!RaidpAdapterDpcRoutine+0x13c:
fffff80e`6c5e3d8c 4584f6          test    r14b,r14b
fffff80e`6c5e3d8f 750c            jne     storport!RaidpAdapterDpcRoutine+0x14d (fffff80e`6c5e3d9d)  Branch

storport!RaidpAdapterDpcRoutine+0x141:
fffff80e`6c5e3d91 488b4308        mov     rax,qword ptr [rbx+8]
fffff80e`6c5e3d95 664489a0ca000000 mov     word ptr [rax+0CAh],r12w

storport!RaidpAdapterDpcRoutine+0x14d:
fffff80e`6c5e3d9d 488d8be0000000  lea     rcx,[rbx+0E0h]                ;RCX = AdapterExt->CompleteList
fffff80e`6c5e3da4 48ff1595030600  call    qword ptr [storport!_imp_ExQueryDepthSList (fffff80e`6c644140)]
fffff80e`6c5e3dab 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5e3db0 6685c0          test    ax,ax
fffff80e`6c5e3db3 0f859b000000    jne     storport!RaidpAdapterDpcRoutine+0x204 (fffff80e`6c5e3e54)  Branch

storport!RaidpAdapterDpcRoutine+0x169:
fffff80e`6c5e3db9 81bb18030000ffff0000 cmp dword ptr [rbx+318h],0FFFFh      ;if (AdapterExt->Gateway->PendingIoCount>=0xffff) goto 0x204
fffff80e`6c5e3dc3 0f838b000000    jae     storport!RaidpAdapterDpcRoutine+0x204 (fffff80e`6c5e3e54)  Branch

storport!RaidpAdapterDpcRoutine+0x179:
fffff80e`6c5e3dc9 498b4500        mov     rax,qword ptr [r13]
fffff80e`6c5e3dcd 4c8bac24b8000000 mov     r13,qword ptr [rsp+0B8h]
fffff80e`6c5e3dd5 4889442468      mov     qword ptr [rsp+68h],rax
fffff80e`6c5e3dda 488b4c2468      mov     rcx,qword ptr [rsp+68h]
fffff80e`6c5e3ddf 488b442478      mov     rax,qword ptr [rsp+78h]
fffff80e`6c5e3de4 482bc8          sub     rcx,rax
fffff80e`6c5e3de7 894c2468        mov     dword ptr [rsp+68h],ecx
fffff80e`6c5e3deb 8b442468        mov     eax,dword ptr [rsp+68h]
fffff80e`6c5e3def 3b83b8120000    cmp     eax,dword ptr [rbx+12B8h]     ;calculate SqmMaxDpcCompletionTimeTicks
fffff80e`6c5e3df5 0f8782000000    ja      storport!RaidpAdapterDpcRoutine+0x22d (fffff80e`6c5e3e7d)  Branch

storport!RaidpAdapterDpcRoutine+0x1ab:
fffff80e`6c5e3dfb 3babb4120000    cmp     ebp,dword ptr [rbx+12B4h]
fffff80e`6c5e3e01 7772            ja      storport!RaidpAdapterDpcRoutine+0x225 (fffff80e`6c5e3e75)  Branch

storport!RaidpAdapterDpcRoutine+0x1b3:
fffff80e`6c5e3e03 44382556aa0500  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff80e`6c63e860)],r12b
fffff80e`6c5e3e0a 740d            je      storport!RaidpAdapterDpcRoutine+0x1c9 (fffff80e`6c5e3e19)  Branch

storport!RaidpAdapterDpcRoutine+0x1bc:
fffff80e`6c5e3e0c f605b0a9050004  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff80e`6c63e7c3)],4
fffff80e`6c5e3e13 0f856d440200    jne     storport!RaidpAdapterDpcRoutine+0x24636 (fffff80e`6c608286)  Branch

storport!RaidpAdapterDpcRoutine+0x1c9:
fffff80e`6c5e3e19 4c8bb424b0000000 mov     r14,qword ptr [rsp+0B0h]
fffff80e`6c5e3e21 488bbc24f8000000 mov     rdi,qword ptr [rsp+0F8h]
fffff80e`6c5e3e29 488bac24e0000000 mov     rbp,qword ptr [rsp+0E0h]
fffff80e`6c5e3e31 4c8ba424c0000000 mov     r12,qword ptr [rsp+0C0h]

storport!RaidpAdapterDpcRoutine+0x1e9:
fffff80e`6c5e3e39 488b8c24a0000000 mov     rcx,qword ptr [rsp+0A0h]
fffff80e`6c5e3e41 4833cc          xor     rcx,rsp
fffff80e`6c5e3e44 e8a7f10100      call    storport!_security_check_cookie (fffff80e`6c602ff0)
fffff80e`6c5e3e49 4881c4c8000000  add     rsp,0C8h
fffff80e`6c5e3e50 415f            pop     r15
fffff80e`6c5e3e52 5b              pop     rbx
fffff80e`6c5e3e53 c3              ret

storport!RaidpAdapterDpcRoutine+0x204:
fffff80e`6c5e3e54 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff80e`6c5e3e58 4533c0          xor     r8d,r8d
fffff80e`6c5e3e5b 4881c1c8000000  add     rcx,0C8h
fffff80e`6c5e3e62 33d2            xor     edx,edx
fffff80e`6c5e3e64 48ff15ad080600  call    qword ptr [storport!_imp_KeInsertQueueDpc (fffff80e`6c644718)]
fffff80e`6c5e3e6b 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5e3e70 e954ffffff      jmp     storport!RaidpAdapterDpcRoutine+0x179 (fffff80e`6c5e3dc9)  Branch

storport!RaidpAdapterDpcRoutine+0x225:
fffff80e`6c5e3e75 89abb4120000    mov     dword ptr [rbx+12B4h],ebp
fffff80e`6c5e3e7b eb86            jmp     storport!RaidpAdapterDpcRoutine+0x1b3 (fffff80e`6c5e3e03)  Branch

storport!RaidpAdapterDpcRoutine+0x22d:
fffff80e`6c5e3e7d 8b442468        mov     eax,dword ptr [rsp+68h]
fffff80e`6c5e3e81 8983b8120000    mov     dword ptr [rbx+12B8h],eax
fffff80e`6c5e3e87 89abbc120000    mov     dword ptr [rbx+12BCh],ebp
fffff80e`6c5e3e8d e969ffffff      jmp     storport!RaidpAdapterDpcRoutine+0x1ab (fffff80e`6c5e3dfb)  Branch

storport!RaidpAdapterDpcRoutine+0x24532:
fffff80e`6c608182 40382db7660300  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],bpl
fffff80e`6c608189 7410            je      storport!RaidpAdapterDpcRoutine+0x2454b (fffff80e`6c60819b)  Branch

storport!RaidpAdapterDpcRoutine+0x2453b:
fffff80e`6c60818b 33c9            xor     ecx,ecx
fffff80e`6c60818d 48ff156cbe0300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff80e`6c644000)]
fffff80e`6c608194 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c608199 eb0c            jmp     storport!RaidpAdapterDpcRoutine+0x24557 (fffff80e`6c6081a7)  Branch

storport!RaidpAdapterDpcRoutine+0x2454b:
fffff80e`6c60819b 48ff1506bf0300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`6c6440a8)]
fffff80e`6c6081a2 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidpAdapterDpcRoutine+0x24557:
fffff80e`6c6081a7 4889842480000000 mov     qword ptr [rsp+80h],rax
fffff80e`6c6081af e91cbbfdff      jmp     storport!RaidpAdapterDpcRoutine+0x80 (fffff80e`6c5e3cd0)  Branch

storport!RaidpAdapterDpcRoutine+0x24564:
fffff80e`6c6081b4 450fb6f7        movzx   r14d,r15b
fffff80e`6c6081b8 e92ebbfdff      jmp     storport!RaidpAdapterDpcRoutine+0x9b (fffff80e`6c5e3ceb)  Branch

storport!RaidpAdapterDpcRoutine+0x2456d:
fffff80e`6c6081bd 8b96ec020000    mov     edx,dword ptr [rsi+2ECh]
fffff80e`6c6081c3 4533c0          xor     r8d,r8d
fffff80e`6c6081c6 488bcb          mov     rcx,rbx
fffff80e`6c6081c9 e8c27cffff      call    storport!RaidAdapterPoFxIdleComponent (fffff80e`6c5ffe90)
fffff80e`6c6081ce 806611fe        and     byte ptr [rsi+11h],0FEh
fffff80e`6c6081d2 e973bbfdff      jmp     storport!RaidpAdapterDpcRoutine+0xfa (fffff80e`6c5e3d4a)  Branch

storport!RaidpAdapterDpcRoutine+0x24587:
fffff80e`6c6081d7 410fb6ff        movzx   edi,r15b
fffff80e`6c6081db e99cbbfdff      jmp     storport!RaidpAdapterDpcRoutine+0x12c (fffff80e`6c5e3d7c)  Branch

storport!RaidpAdapterDpcRoutine+0x24590:
fffff80e`6c6081e0 48ff15d9bf0300  call    qword ptr [storport!_imp_KeGetCurrentNodeNumber (fffff80e`6c6441c0)]
fffff80e`6c6081e7 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c6081ec 4533c0          xor     r8d,r8d
fffff80e`6c6081ef 488d942490000000 lea     rdx,[rsp+90h]
fffff80e`6c6081f7 0fb7c8          movzx   ecx,ax
fffff80e`6c6081fa 48ff154fbe0300  call    qword ptr [storport!_imp_KeQueryNodeActiveAffinity (fffff80e`6c644050)]
fffff80e`6c608201 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c608206 488d4c2460      lea     rcx,[rsp+60h]
fffff80e`6c60820b 48ff15bec00300  call    qword ptr [storport!_imp_KeGetCurrentProcessorNumberEx (fffff80e`6c6442d0)]
fffff80e`6c608212 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c608217 0fb64c2462      movzx   ecx,byte ptr [rsp+62h]
fffff80e`6c60821c 488b942490000000 mov     rdx,qword ptr [rsp+90h]
fffff80e`6c608224 fec1            inc     cl
fffff80e`6c608226 884c2462        mov     byte ptr [rsp+62h],cl
fffff80e`6c60822a 80f940          cmp     cl,40h
fffff80e`6c60822d 731b            jae     storport!RaidpAdapterDpcRoutine+0x245fa (fffff80e`6c60824a)  Branch

storport!RaidpAdapterDpcRoutine+0x245df:
fffff80e`6c60822f 0fb6c1          movzx   eax,cl
fffff80e`6c608232 480fa3c2        bt      rdx,rax
fffff80e`6c608236 720d            jb      storport!RaidpAdapterDpcRoutine+0x245f5 (fffff80e`6c608245)  Branch

storport!RaidpAdapterDpcRoutine+0x245e8:
fffff80e`6c608238 fec1            inc     cl
fffff80e`6c60823a 884c2462        mov     byte ptr [rsp+62h],cl
fffff80e`6c60823e 80f940          cmp     cl,40h
fffff80e`6c608241 72ec            jb      storport!RaidpAdapterDpcRoutine+0x245df (fffff80e`6c60822f)  Branch

storport!RaidpAdapterDpcRoutine+0x245f3:
fffff80e`6c608243 eb05            jmp     storport!RaidpAdapterDpcRoutine+0x245fa (fffff80e`6c60824a)  Branch

storport!RaidpAdapterDpcRoutine+0x245f5:
fffff80e`6c608245 80f940          cmp     cl,40h
fffff80e`6c608248 721a            jb      storport!RaidpAdapterDpcRoutine+0x24614 (fffff80e`6c608264)  Branch

storport!RaidpAdapterDpcRoutine+0x245fa:
fffff80e`6c60824a 32c9            xor     cl,cl
fffff80e`6c60824c 884c2462        mov     byte ptr [rsp+62h],cl
fffff80e`6c608250 4184d7          test    r15b,dl
fffff80e`6c608253 750f            jne     storport!RaidpAdapterDpcRoutine+0x24614 (fffff80e`6c608264)  Branch

storport!RaidpAdapterDpcRoutine+0x24605:
fffff80e`6c608255 fec1            inc     cl
fffff80e`6c608257 0fb6c1          movzx   eax,cl
fffff80e`6c60825a 480fa3c2        bt      rdx,rax
fffff80e`6c60825e 73f5            jae     storport!RaidpAdapterDpcRoutine+0x24605 (fffff80e`6c608255)  Branch

storport!RaidpAdapterDpcRoutine+0x24610:
fffff80e`6c608260 884c2462        mov     byte ptr [rsp+62h],cl

storport!RaidpAdapterDpcRoutine+0x24614:
fffff80e`6c608264 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff80e`6c608268 488d542460      lea     rdx,[rsp+60h]
fffff80e`6c60826d 4881c1c8000000  add     rcx,0C8h
fffff80e`6c608274 48ff1575be0300  call    qword ptr [storport!_imp_KeSetTargetProcessorDpcEx (fffff80e`6c6440f0)]
fffff80e`6c60827b 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c608280 90              nop
fffff80e`6c608281 e9cebbfdff      jmp     storport!RaidpAdapterDpcRoutine+0x204 (fffff80e`6c5e3e54)  Branch

storport!RaidpAdapterDpcRoutine+0x24636:
fffff80e`6c608286 83fd19          cmp     ebp,19h
fffff80e`6c608289 0f828abbfdff    jb      storport!RaidpAdapterDpcRoutine+0x1c9 (fffff80e`6c5e3e19)  Branch

storport!RaidpAdapterDpcRoutine+0x2463f:
fffff80e`6c60828f 443825aa650300  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],r12b
fffff80e`6c608296 4c897c2470      mov     qword ptr [rsp+70h],r15
fffff80e`6c60829b 7413            je      storport!RaidpAdapterDpcRoutine+0x24660 (fffff80e`6c6082b0)  Branch

storport!RaidpAdapterDpcRoutine+0x2464d:
fffff80e`6c60829d 488d4c2470      lea     rcx,[rsp+70h]
fffff80e`6c6082a2 48ff1557bd0300  call    qword ptr [storport!_imp_KeQueryPerformanceCounter (fffff80e`6c644000)]
fffff80e`6c6082a9 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c6082ae eb0c            jmp     storport!RaidpAdapterDpcRoutine+0x2466c (fffff80e`6c6082bc)  Branch

storport!RaidpAdapterDpcRoutine+0x24660:
fffff80e`6c6082b0 48ff15f1bd0300  call    qword ptr [storport!_imp_KeQueryUnbiasedInterruptTime (fffff80e`6c6440a8)]
fffff80e`6c6082b7 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidpAdapterDpcRoutine+0x2466c:
fffff80e`6c6082bc 4c8bc8          mov     r9,rax
fffff80e`6c6082bf 488b842480000000 mov     rax,qword ptr [rsp+80h]
fffff80e`6c6082c7 4d85c9          test    r9,r9
fffff80e`6c6082ca 7e0d            jle     storport!RaidpAdapterDpcRoutine+0x24689 (fffff80e`6c6082d9)  Branch

storport!RaidpAdapterDpcRoutine+0x2467c:
fffff80e`6c6082cc 4c3bc8          cmp     r9,rax
fffff80e`6c6082cf 7d08            jge     storport!RaidpAdapterDpcRoutine+0x24689 (fffff80e`6c6082d9)  Branch

storport!RaidpAdapterDpcRoutine+0x24681:
fffff80e`6c6082d1 4c2bc8          sub     r9,rax
fffff80e`6c6082d4 49ffc9          dec     r9
fffff80e`6c6082d7 eb03            jmp     storport!RaidpAdapterDpcRoutine+0x2468c (fffff80e`6c6082dc)  Branch

storport!RaidpAdapterDpcRoutine+0x24689:
fffff80e`6c6082d9 4c2bc8          sub     r9,rax

storport!RaidpAdapterDpcRoutine+0x2468c:
fffff80e`6c6082dc 4438255d650300  cmp     byte ptr [storport!UseQPCTime (fffff80e`6c63e840)],r12b
fffff80e`6c6082e3 4c898c2488000000 mov     qword ptr [rsp+88h],r9
fffff80e`6c6082eb 744b            je      storport!RaidpAdapterDpcRoutine+0x246e8 (fffff80e`6c608338)  Branch

storport!RaidpAdapterDpcRoutine+0x2469d:
fffff80e`6c6082ed 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff80e`6c6082f2 4d8bc4          mov     r8,r12
fffff80e`6c6082f5 4885c9          test    rcx,rcx
fffff80e`6c6082f8 7441            je      storport!RaidpAdapterDpcRoutine+0x246eb (fffff80e`6c60833b)  Branch

storport!RaidpAdapterDpcRoutine+0x246aa:
fffff80e`6c6082fa 4d85c9          test    r9,r9
fffff80e`6c6082fd 743c            je      storport!RaidpAdapterDpcRoutine+0x246eb (fffff80e`6c60833b)  Branch

storport!RaidpAdapterDpcRoutine+0x246af:
fffff80e`6c6082ff 33d2            xor     edx,edx
fffff80e`6c608301 498bc1          mov     rax,r9
fffff80e`6c608304 48f7f1          div     rax,rcx
fffff80e`6c608307 4c8bc0          mov     r8,rax
fffff80e`6c60830a 4869c2e8030000  imul    rax,rdx,3E8h
fffff80e`6c608311 4d69c0e8030000  imul    r8,r8,3E8h
fffff80e`6c608318 33d2            xor     edx,edx
fffff80e`6c60831a 48f7f1          div     rax,rcx
fffff80e`6c60831d 4c03c0          add     r8,rax
fffff80e`6c608320 4869c210270000  imul    rax,rdx,2710h
fffff80e`6c608327 4d69c010270000  imul    r8,r8,2710h
fffff80e`6c60832e 33d2            xor     edx,edx
fffff80e`6c608330 48f7f1          div     rax,rcx
fffff80e`6c608333 4c03c0          add     r8,rax
fffff80e`6c608336 eb03            jmp     storport!RaidpAdapterDpcRoutine+0x246eb (fffff80e`6c60833b)  Branch

storport!RaidpAdapterDpcRoutine+0x246e8:
fffff80e`6c608338 4d8bc1          mov     r8,r9

storport!RaidpAdapterDpcRoutine+0x246eb:
fffff80e`6c60833b f6058164030004  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x3 (fffff80e`6c63e7c3)],4
fffff80e`6c608342 4c89442478      mov     qword ptr [rsp+78h],r8
fffff80e`6c608347 0f84ccbafdff    je      storport!RaidpAdapterDpcRoutine+0x1c9 (fffff80e`6c5e3e19)  Branch

storport!RaidpAdapterDpcRoutine+0x246fd:
fffff80e`6c60834d 4084ff          test    dil,dil
fffff80e`6c608350 7505            jne     storport!RaidpAdapterDpcRoutine+0x24707 (fffff80e`6c608357)  Branch

storport!RaidpAdapterDpcRoutine+0x24702:
fffff80e`6c608352 4584f6          test    r14b,r14b
fffff80e`6c608355 7403            je      storport!RaidpAdapterDpcRoutine+0x2470a (fffff80e`6c60835a)  Branch

storport!RaidpAdapterDpcRoutine+0x24707:
fffff80e`6c608357 458bfc          mov     r15d,r12d

storport!RaidpAdapterDpcRoutine+0x2470a:
fffff80e`6c60835a 44897c2450      mov     dword ptr [rsp+50h],r15d
fffff80e`6c60835f 400fb6c7        movzx   eax,dil
fffff80e`6c608363 89442448        mov     dword ptr [rsp+48h],eax
fffff80e`6c608367 488b442478      mov     rax,qword ptr [rsp+78h]
fffff80e`6c60836c 4889442440      mov     qword ptr [rsp+40h],rax
fffff80e`6c608371 8b4338          mov     eax,dword ptr [rbx+38h]
fffff80e`6c608374 4c894c2438      mov     qword ptr [rsp+38h],r9
fffff80e`6c608379 4c8d0dd0b8fdff  lea     r9,[storport!RaidpAdapterDpcRoutine (fffff80e`6c5e3c50)]
fffff80e`6c608380 896c2430        mov     dword ptr [rsp+30h],ebp
fffff80e`6c608384 89442428        mov     dword ptr [rsp+28h],eax
fffff80e`6c608388 488d0549e70200  lea     rax,[storport!`string` (fffff80e`6c636ad8)]
fffff80e`6c60838f 4889442420      mov     qword ptr [rsp+20h],rax
fffff80e`6c608394 e88ba30000      call    storport!McTemplateK0pzqqxxtt (fffff80e`6c612724)
fffff80e`6c608399 90              nop
fffff80e`6c60839a e97abafdff      jmp     storport!RaidpAdapterDpcRoutine+0x1c9 (fffff80e`6c5e3e19)  Branch
