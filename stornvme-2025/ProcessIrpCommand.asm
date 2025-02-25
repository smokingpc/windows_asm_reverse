
;ProcessIrpCommand(devext, struct IrpData*)
3: kd> uf stornvme!ProcessIrpCommand
stornvme!ProcessIrpCommand:
fffff804`3c48e2c0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff804`3c48e2c5 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff804`3c48e2ca 4889742418      mov     qword ptr [rsp+18h],rsi
fffff804`3c48e2cf 57              push    rdi
fffff804`3c48e2d0 4883ec40        sub     rsp,40h
fffff804`3c48e2d4 448b4a10        mov     r9d,dword ptr [rdx+10h]
fffff804`3c48e2d8 488bda          mov     rbx,rdx
fffff804`3c48e2db 488b7218        mov     rsi,qword ptr [rdx+18h]
fffff804`3c48e2df 488bf9          mov     rdi,rcx
fffff804`3c48e2e2 488b2a          mov     rbp,qword ptr [rdx]
fffff804`3c48e2e5 4585c9          test    r9d,r9d
fffff804`3c48e2e8 750b            jne     stornvme!ProcessIrpCommand+0x35 (fffff804`3c48e2f5)  Branch

stornvme!ProcessIrpCommand+0x2a:
fffff804`3c48e2ea 41b901000000    mov     r9d,1
fffff804`3c48e2f0 e938010000      jmp     stornvme!ProcessIrpCommand+0x16d (fffff804`3c48e42d)  Branch

stornvme!ProcessIrpCommand+0x35:
fffff804`3c48e2f5 8b89380f0000    mov     ecx,dword ptr [rcx+0F38h]
fffff804`3c48e2fb 0fbae108        bt      ecx,8
fffff804`3c48e2ff 730b            jae     stornvme!ProcessIrpCommand+0x4c (fffff804`3c48e30c)  Branch

stornvme!ProcessIrpCommand+0x41:
fffff804`3c48e301 41b938000000    mov     r9d,38h
fffff804`3c48e307 e921010000      jmp     stornvme!ProcessIrpCommand+0x16d (fffff804`3c48e42d)  Branch

stornvme!ProcessIrpCommand+0x4c:
fffff804`3c48e30c 8b4718          mov     eax,dword ptr [rdi+18h]
fffff804`3c48e30f a801            test    al,1
fffff804`3c48e311 7511            jne     stornvme!ProcessIrpCommand+0x64 (fffff804`3c48e324)  Branch

stornvme!ProcessIrpCommand+0x53:
fffff804`3c48e313 0fbae109        bt      ecx,9
fffff804`3c48e317 720b            jb      stornvme!ProcessIrpCommand+0x64 (fffff804`3c48e324)  Branch

stornvme!ProcessIrpCommand+0x59:
fffff804`3c48e319 41b908000000    mov     r9d,8
fffff804`3c48e31f e909010000      jmp     stornvme!ProcessIrpCommand+0x16d (fffff804`3c48e42d)  Branch

stornvme!ProcessIrpCommand+0x64:
fffff804`3c48e324 0fb6450a        movzx   eax,byte ptr [rbp+0Ah]
fffff804`3c48e328 488b8cc7e8050000 mov     rcx,qword ptr [rdi+rax*8+5E8h]
fffff804`3c48e330 80794200        cmp     byte ptr [rcx+42h],0
fffff804`3c48e334 448b4134        mov     r8d,dword ptr [rcx+34h]
fffff804`3c48e338 4c8b5938        mov     r11,qword ptr [rcx+38h]
fffff804`3c48e33c 0f85e5000000    jne     stornvme!ProcessIrpCommand+0x167 (fffff804`3c48e427)  Branch

stornvme!ProcessIrpCommand+0x82:
fffff804`3c48e342 6683793000      cmp     word ptr [rcx+30h],0
fffff804`3c48e347 0f85da000000    jne     stornvme!ProcessIrpCommand+0x167 (fffff804`3c48e427)  Branch

stornvme!ProcessIrpCommand+0x8d:
fffff804`3c48e34d 4585c0          test    r8d,r8d
fffff804`3c48e350 743d            je      stornvme!ProcessIrpCommand+0xcf (fffff804`3c48e38f)  Branch

stornvme!ProcessIrpCommand+0x92:
fffff804`3c48e352 33d2            xor     edx,edx
fffff804`3c48e354 418bc1          mov     eax,r9d
fffff804`3c48e357 41f7f0          div     eax,r8d
fffff804`3c48e35a 85d2            test    edx,edx
fffff804`3c48e35c 7526            jne     stornvme!ProcessIrpCommand+0xc4 (fffff804`3c48e384)  Branch

stornvme!ProcessIrpCommand+0x9e:
fffff804`3c48e35e 488b4308        mov     rax,qword ptr [rbx+8]
fffff804`3c48e362 4899            cqo
fffff804`3c48e364 49f7f8          idiv    rax,r8
fffff804`3c48e367 4c8bd0          mov     r10,rax
fffff804`3c48e36a 4885d2          test    rdx,rdx
fffff804`3c48e36d 7515            jne     stornvme!ProcessIrpCommand+0xc4 (fffff804`3c48e384)  Branch

stornvme!ProcessIrpCommand+0xaf:
fffff804`3c48e36f 493bc3          cmp     rax,r11
fffff804`3c48e372 7310            jae     stornvme!ProcessIrpCommand+0xc4 (fffff804`3c48e384)  Branch

stornvme!ProcessIrpCommand+0xb4:
fffff804`3c48e374 418bc1          mov     eax,r9d
fffff804`3c48e377 4d2bda          sub     r11,r10
fffff804`3c48e37a 41f7f0          div     eax,r8d
fffff804`3c48e37d 8bc8            mov     ecx,eax
fffff804`3c48e37f 4c3bd9          cmp     r11,rcx
fffff804`3c48e382 730b            jae     stornvme!ProcessIrpCommand+0xcf (fffff804`3c48e38f)  Branch

stornvme!ProcessIrpCommand+0xc4:
fffff804`3c48e384 41b928000000    mov     r9d,28h
fffff804`3c48e38a e99e000000      jmp     stornvme!ProcessIrpCommand+0x16d (fffff804`3c48e42d)  Branch

stornvme!ProcessIrpCommand+0xcf:
fffff804`3c48e38f 8b4338          mov     eax,dword ptr [rbx+38h]
fffff804`3c48e392 488bcf          mov     rcx,rdi
fffff804`3c48e395 440fb74334      movzx   r8d,word ptr [rbx+34h]
fffff804`3c48e39a 8b5330          mov     edx,dword ptr [rbx+30h]
fffff804`3c48e39d c1e804          shr     eax,4
fffff804`3c48e3a0 2401            and     al,1
fffff804`3c48e3a2 88442430        mov     byte ptr [rsp+30h],al
fffff804`3c48e3a6 c644242800      mov     byte ptr [rsp+28h],0
fffff804`3c48e3ab c644242000      mov     byte ptr [rsp+20h],0
fffff804`3c48e3b0 e8ab000000      call    stornvme!AssignQueueId (fffff804`3c48e460)
fffff804`3c48e3b5 0fb64d0a        movzx   ecx,byte ptr [rbp+0Ah]
fffff804`3c48e3b9 884e03          mov     byte ptr [rsi+3],cl
fffff804`3c48e3bc 0fb7d0          movzx   edx,ax
fffff804`3c48e3bf b801000000      mov     eax,1
fffff804`3c48e3c4 668906          mov     word ptr [rsi],ax
fffff804`3c48e3c7 448b4310        mov     r8d,dword ptr [rbx+10h]
fffff804`3c48e3cb 44894604        mov     dword ptr [rsi+4],r8d
fffff804`3c48e3cf 894610          mov     dword ptr [rsi+10h],eax
fffff804`3c48e3d2 448b4f78        mov     r9d,dword ptr [rdi+78h]
fffff804`3c48e3d6 4585c9          test    r9d,r9d
fffff804`3c48e3d9 7423            je      stornvme!ProcessIrpCommand+0x13e (fffff804`3c48e3fe)  Branch

stornvme!ProcessIrpCommand+0x11b:
fffff804`3c48e3db 48837b0800      cmp     qword ptr [rbx+8],0
fffff804`3c48e3e0 741c            je      stornvme!ProcessIrpCommand+0x13e (fffff804`3c48e3fe)  Branch

stornvme!ProcessIrpCommand+0x122:
fffff804`3c48e3e2 488b8ccfe8050000 mov     rcx,qword ptr [rdi+rcx*8+5E8h]
fffff804`3c48e3ea 8b4134          mov     eax,dword ptr [rcx+34h]
fffff804`3c48e3ed 418d49ff        lea     ecx,[r9-1]
fffff804`3c48e3f1 03c8            add     ecx,eax
fffff804`3c48e3f3 f7d8            neg     eax
fffff804`3c48e3f5 23c8            and     ecx,eax
fffff804`3c48e3f7 442bc1          sub     r8d,ecx
fffff804`3c48e3fa 44894604        mov     dword ptr [rsi+4],r8d

stornvme!ProcessIrpCommand+0x13e:
fffff804`3c48e3fe 488d0c52        lea     rcx,[rdx+rdx*2]
fffff804`3c48e402 4c8bcb          mov     r9,rbx
fffff804`3c48e405 488b9798030000  mov     rdx,qword ptr [rdi+398h]
fffff804`3c48e40c 4c8bc6          mov     r8,rsi
fffff804`3c48e40f 48c1e106        shl     rcx,6
fffff804`3c48e413 4881c240ffffff  add     rdx,0FFFFFFFFFFFFFF40h
fffff804`3c48e41a 4803d1          add     rdx,rcx
fffff804`3c48e41d 488bcf          mov     rcx,rdi
fffff804`3c48e420 e8cb030000      call    stornvme!ProcessPendingIoCommands (fffff804`3c48e7f0)
fffff804`3c48e425 eb1d            jmp     stornvme!ProcessIrpCommand+0x184 (fffff804`3c48e444)  Branch

stornvme!ProcessIrpCommand+0x167:
fffff804`3c48e427 41b920000000    mov     r9d,20h

stornvme!ProcessIrpCommand+0x16d:
fffff804`3c48e42d 4c8bc6          mov     r8,rsi
fffff804`3c48e430 488bd7          mov     rdx,rdi
fffff804`3c48e433 b900200000      mov     ecx,2000h
fffff804`3c48e438 4c8b15714c0300  mov     r10,qword ptr [stornvme!_imp_StorPortNotification (fffff804`3c4c30b0)]
fffff804`3c48e43f e8fcb3d3ff      call    storport!StorPortNotification (fffff804`3c1c9840)

stornvme!ProcessIrpCommand+0x184:
fffff804`3c48e444 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff804`3c48e449 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff804`3c48e44e 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff804`3c48e453 4883c440        add     rsp,40h
fffff804`3c48e457 5f              pop     rdi
fffff804`3c48e458 c3              ret
