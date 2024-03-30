33: kd> uf storport!RaidAdapterHack
storport!RaidAdapterHack:
fffff80f`2d2dd9c8 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff80f`2d2dd9cd 55              push    rbp
fffff80f`2d2dd9ce 488d6c24a9      lea     rbp,[rsp-57h]
fffff80f`2d2dd9d3 4881ec00010000  sub     rsp,100h
fffff80f`2d2dd9da 488b05af380400  mov     rax,qword ptr [storport!_security_cookie (fffff80f`2d321290)]
fffff80f`2d2dd9e1 4833c4          xor     rax,rsp
fffff80f`2d2dd9e4 48894547        mov     qword ptr [rbp+47h],rax
fffff80f`2d2dd9e8 83658700        and     dword ptr [rbp-79h],0
fffff80f`2d2dd9ec 33d2            xor     edx,edx
fffff80f`2d2dd9ee 488bd9          mov     rbx,rcx
fffff80f`2d2dd9f1 488d4d07        lea     rcx,[rbp+7]
fffff80f`2d2dd9f5 448d4240        lea     r8d,[rdx+40h]
fffff80f`2d2dd9f9 e802e40000      call    storport!memset (fffff80f`2d2ebe00)
fffff80f`2d2dd9fe 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff80f`2d2dda02 488d4db7        lea     rcx,[rbp-49h]
fffff80f`2d2dda06 e875020500      call    storport!RaInitializeBus (fffff80f`2d32dc80)
fffff80f`2d2dda0b 85c0            test    eax,eax
fffff80f`2d2dda0d 7849            js      storport!RaidAdapterHack+0x90 (fffff80f`2d2dda58)  Branch

storport!RaidAdapterHack+0x47:
fffff80f`2d2dda0f 488b4dc7        mov     rcx,qword ptr [rbp-39h]
fffff80f`2d2dda13 4c8d4507        lea     r8,[rbp+7]
fffff80f`2d2dda17 488b45f7        mov     rax,qword ptr [rbp-9]
fffff80f`2d2dda1b 4533c9          xor     r9d,r9d
fffff80f`2d2dda1e c744242040000000 mov     dword ptr [rsp+20h],40h
fffff80f`2d2dda26 418d5104        lea     edx,[r9+4]
fffff80f`2d2dda2a ff15f09d0400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80f`2d327820)]   ;call to BUS_INTERFACE_STANDARD::GetBusData()
fffff80f`2d2dda30 83f80f          cmp     eax,0Fh
fffff80f`2d2dda33 721a            jb      storport!RaidAdapterHack+0x87 (fffff80f`2d2dda4f)  Branch

storport!RaidAdapterHack+0x6d:
fffff80f`2d2dda35 b84d140000      mov     eax,144Dh
fffff80f`2d2dda3a 66394507        cmp     word ptr [rbp+7],ax
fffff80f`2d2dda3e 0f84022f0100    je      storport!RaidAdapterHack+0x12f7e (fffff80f`2d2f0946)  Branch

storport!RaidAdapterHack+0x7c:
fffff80f`2d2dda44 b8de100000      mov     eax,10DEh
fffff80f`2d2dda49 66394507        cmp     word ptr [rbp+7],ax
fffff80f`2d2dda4d 7426            je      storport!RaidAdapterHack+0xad (fffff80f`2d2dda75)  Branch

storport!RaidAdapterHack+0x87:
fffff80f`2d2dda4f 488d4db7        lea     rcx,[rbp-49h]
fffff80f`2d2dda53 e8e00b0500      call    storport!RaDeleteBus (fffff80f`2d32e638)

storport!RaidAdapterHack+0x90:
fffff80f`2d2dda58 488b4d47        mov     rcx,qword ptr [rbp+47h]
fffff80f`2d2dda5c 4833cc          xor     rcx,rsp
fffff80f`2d2dda5f e8fc820000      call    storport!_security_check_cookie (fffff80f`2d2e5d60)
fffff80f`2d2dda64 488b9c2418010000 mov     rbx,qword ptr [rsp+118h]
fffff80f`2d2dda6c 4881c400010000  add     rsp,100h
fffff80f`2d2dda73 5d              pop     rbp
fffff80f`2d2dda74 c3              ret

storport!RaidAdapterHack+0xad:
fffff80f`2d2dda75 c6839415000001  mov     byte ptr [rbx+1594h],1
fffff80f`2d2dda7c ebd1            jmp     storport!RaidAdapterHack+0x87 (fffff80f`2d2dda4f)  Branch

storport!RaidAdapterHack+0x12f7e:
fffff80f`2d2f0946 0fb74509        movzx   eax,word ptr [rbp+9]
fffff80f`2d2f094a b900160000      mov     ecx,1600h
fffff80f`2d2f094f 663bc1          cmp     ax,cx
fffff80f`2d2f0952 7412            je      storport!RaidAdapterHack+0x12f9e (fffff80f`2d2f0966)  Branch

storport!RaidAdapterHack+0x12f8c:
fffff80f`2d2f0954 b900580000      mov     ecx,5800h
fffff80f`2d2f0959 6603c1          add     ax,cx
fffff80f`2d2f095c 6683f801        cmp     ax,1
fffff80f`2d2f0960 0f87e9d0feff    ja      storport!RaidAdapterHack+0x87 (fffff80f`2d2dda4f)  Branch

storport!RaidAdapterHack+0x12f9e:
fffff80f`2d2f0966 488d1553970200  lea     rdx,[storport!`string` (fffff80f`2d31a0c0)]
fffff80f`2d2f096d 488d4d9f        lea     rcx,[rbp-61h]
fffff80f`2d2f0971 48ff1598670300  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d2f0978 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2f097d 488d15ac970200  lea     rdx,[storport!`string` (fffff80f`2d31a130)]
fffff80f`2d2f0984 488d4d8f        lea     rcx,[rbp-71h]
fffff80f`2d2f0988 48ff1581670300  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff80f`2d327110)]
fffff80f`2d2f098f 0f1f440000      nop     dword ptr [rax+rax]
fffff80f`2d2f0994 488b4b20        mov     rcx,qword ptr [rbx+20h]
fffff80f`2d2f0998 488d4587        lea     rax,[rbp-79h]
fffff80f`2d2f099c c744242804000000 mov     dword ptr [rsp+28h],4
fffff80f`2d2f09a4 4c8d458f        lea     r8,[rbp-71h]
fffff80f`2d2f09a8 41b904000000    mov     r9d,4
fffff80f`2d2f09ae 4889442420      mov     qword ptr [rsp+20h],rax
fffff80f`2d2f09b3 488d559f        lea     rdx,[rbp-61h]
fffff80f`2d2f09b7 e818a70300      call    storport!PortRegistryWriteDeviceKey (fffff80f`2d32b0d4)
fffff80f`2d2f09bc 85c0            test    eax,eax
fffff80f`2d2f09be 0f8980d0feff    jns     storport!RaidAdapterHack+0x7c (fffff80f`2d2dda44)  Branch

storport!RaidAdapterHack+0x12ffc:
fffff80f`2d2f09c4 488b0d35060300  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80f`2d321000)]
fffff80f`2d2f09cb 488d152e060300  lea     rdx,[storport!WPP_GLOBAL_Control (fffff80f`2d321000)]
fffff80f`2d2f09d2 483bca          cmp     rcx,rdx
fffff80f`2d2f09d5 0f8469d0feff    je      storport!RaidAdapterHack+0x7c (fffff80f`2d2dda44)  Branch

storport!RaidAdapterHack+0x13013:
fffff80f`2d2f09db f7412c00010000  test    dword ptr [rcx+2Ch],100h
fffff80f`2d2f09e2 0f845cd0feff    je      storport!RaidAdapterHack+0x7c (fffff80f`2d2dda44)  Branch

storport!RaidAdapterHack+0x13020:
fffff80f`2d2f09e8 80792902        cmp     byte ptr [rcx+29h],2
fffff80f`2d2f09ec 0f8252d0feff    jb      storport!RaidAdapterHack+0x7c (fffff80f`2d2dda44)  Branch

storport!RaidAdapterHack+0x1302a:
fffff80f`2d2f09f2 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80f`2d2f09f6 4c8d05bb4e0200  lea     r8,[storport!WPP_0e11a8d225a936f45e9b3e6eeadbaef4_Traceguids (fffff80f`2d3158b8)]
fffff80f`2d2f09fd ba43000000      mov     edx,43h
fffff80f`2d2f0a02 448bc8          mov     r9d,eax
fffff80f`2d2f0a05 e8c6ac0000      call    storport!WPP_SF_D (fffff80f`2d2fb6d0)
fffff80f`2d2f0a0a 90              nop
fffff80f`2d2f0a0b e934d0feff      jmp     storport!RaidAdapterHack+0x7c (fffff80f`2d2dda44)  Branch
