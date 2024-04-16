;RaDriverAddDevice => RaidAdapterHack

12: kd> uf storport!RaidAdapterHack
storport!RaidAdapterHack:
fffff807`3295d9c8 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff807`3295d9cd 55              push    rbp
fffff807`3295d9ce 488d6c24a9      lea     rbp,[rsp-57h]
fffff807`3295d9d3 4881ec00010000  sub     rsp,100h
fffff807`3295d9da 488b05af380400  mov     rax,qword ptr [storport!_security_cookie (fffff807`329a1290)]
fffff807`3295d9e1 4833c4          xor     rax,rsp
fffff807`3295d9e4 48894547        mov     qword ptr [rbp+47h],rax
fffff807`3295d9e8 83658700        and     dword ptr [rbp-79h],0
fffff807`3295d9ec 33d2            xor     edx,edx
fffff807`3295d9ee 488bd9          mov     rbx,rcx
fffff807`3295d9f1 488d4d07        lea     rcx,[rbp+7]
fffff807`3295d9f5 448d4240        lea     r8d,[rdx+40h]
fffff807`3295d9f9 e802e40000      call    storport!memset (fffff807`3296be00)
fffff807`3295d9fe 488b5318        mov     rdx,qword ptr [rbx+18h]
fffff807`3295da02 488d4db7        lea     rcx,[rbp-49h]
fffff807`3295da06 e875020500      call    storport!RaInitializeBus (fffff807`329adc80)  ;RaQueryInterface
fffff807`3295da0b 85c0            test    eax,eax
fffff807`3295da0d 7849            js      storport!RaidAdapterHack+0x90 (fffff807`3295da58)  Branch

storport!RaidAdapterHack+0x47:
fffff807`3295da0f 488b4dc7        mov     rcx,qword ptr [rbp-39h]
fffff807`3295da13 4c8d4507        lea     r8,[rbp+7]
fffff807`3295da17 488b45f7        mov     rax,qword ptr [rbp-9]
fffff807`3295da1b 4533c9          xor     r9d,r9d
fffff807`3295da1e c744242040000000 mov     dword ptr [rsp+20h],40h
fffff807`3295da26 418d5104        lea     edx,[r9+4]    ;Call PDO's GetBusData
fffff807`3295da2a ff15f09d0400    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff807`329a7820)]
fffff807`3295da30 83f80f          cmp     eax,0Fh
fffff807`3295da33 721a            jb      storport!RaidAdapterHack+0x87 (fffff807`3295da4f)  Branch

storport!RaidAdapterHack+0x6d:
fffff807`3295da35 b84d140000      mov     eax,144Dh ;三爽 VendorID
fffff807`3295da3a 66394507        cmp     word ptr [rbp+7],ax   ;[rbp+7==PCI_COMMON_HEADER] if VendorID==0x144d goto 0x12f7e
fffff807`3295da3e 0f84022f0100    je      storport!RaidAdapterHack+0x12f7e (fffff807`32970946)  Branch

storport!RaidAdapterHack+0x7c:
fffff807`3295da44 b8de100000      mov     eax,10DEh;nVidia VendirID
fffff807`3295da49 66394507        cmp     word ptr [rbp+7],ax
fffff807`3295da4d 7426            je      storport!RaidAdapterHack+0xad (fffff807`3295da75)  Branch

storport!RaidAdapterHack+0x87:
fffff807`3295da4f 488d4db7        lea     rcx,[rbp-49h]
fffff807`3295da53 e8e00b0500      call    storport!RaDeleteBus (fffff807`329ae638)

storport!RaidAdapterHack+0x90:
fffff807`3295da58 488b4d47        mov     rcx,qword ptr [rbp+47h]
fffff807`3295da5c 4833cc          xor     rcx,rsp
fffff807`3295da5f e8fc820000      call    storport!_security_check_cookie (fffff807`32965d60)
fffff807`3295da64 488b9c2418010000 mov     rbx,qword ptr [rsp+118h]
fffff807`3295da6c 4881c400010000  add     rsp,100h
fffff807`3295da73 5d              pop     rbp
fffff807`3295da74 c3              ret

storport!RaidAdapterHack+0xad:
fffff807`3295da75 c6839415000001  mov     byte ptr [rbx+1594h],1
fffff807`3295da7c ebd1            jmp     storport!RaidAdapterHack+0x87 (fffff807`3295da4f)  Branch

storport!RaidAdapterHack+0x12f7e:
fffff807`32970946 0fb74509        movzx   eax,word ptr [rbp+9]
fffff807`3297094a b900160000      mov     ecx,1600h
fffff807`3297094f 663bc1          cmp     ax,cx
fffff807`32970952 7412            je      storport!RaidAdapterHack+0x12f9e (fffff807`32970966)  Branch

storport!RaidAdapterHack+0x12f8c:
fffff807`32970954 b900580000      mov     ecx,5800h
fffff807`32970959 6603c1          add     ax,cx
fffff807`3297095c 6683f801        cmp     ax,1
fffff807`32970960 0f87e9d0feff    ja      storport!RaidAdapterHack+0x87 (fffff807`3295da4f)  Branch

storport!RaidAdapterHack+0x12f9e:
fffff807`32970966 488d1553970200  lea     rdx,[storport!`string` (fffff807`3299a0c0)]
fffff807`3297096d 488d4d9f        lea     rcx,[rbp-61h]
fffff807`32970971 48ff1598670300  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff807`329a7110)]
fffff807`32970978 0f1f440000      nop     dword ptr [rax+rax]
fffff807`3297097d 488d15ac970200  lea     rdx,[storport!`string` (fffff807`3299a130)]
fffff807`32970984 488d4d8f        lea     rcx,[rbp-71h]
fffff807`32970988 48ff1581670300  call    qword ptr [storport!_imp_RtlInitUnicodeString (fffff807`329a7110)]
fffff807`3297098f 0f1f440000      nop     dword ptr [rax+rax]
fffff807`32970994 488b4b20        mov     rcx,qword ptr [rbx+20h]
fffff807`32970998 488d4587        lea     rax,[rbp-79h]
fffff807`3297099c c744242804000000 mov     dword ptr [rsp+28h],4
fffff807`329709a4 4c8d458f        lea     r8,[rbp-71h]
fffff807`329709a8 41b904000000    mov     r9d,4
fffff807`329709ae 4889442420      mov     qword ptr [rsp+20h],rax
fffff807`329709b3 488d559f        lea     rdx,[rbp-61h]
fffff807`329709b7 e818a70300      call    storport!PortRegistryWriteDeviceKey (fffff807`329ab0d4)
fffff807`329709bc 85c0            test    eax,eax
fffff807`329709be 0f8980d0feff    jns     storport!RaidAdapterHack+0x7c (fffff807`3295da44)  Branch

storport!RaidAdapterHack+0x12ffc:
fffff807`329709c4 488b0d35060300  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff807`329a1000)]
fffff807`329709cb 488d152e060300  lea     rdx,[storport!WPP_GLOBAL_Control (fffff807`329a1000)]
fffff807`329709d2 483bca          cmp     rcx,rdx
fffff807`329709d5 0f8469d0feff    je      storport!RaidAdapterHack+0x7c (fffff807`3295da44)  Branch

storport!RaidAdapterHack+0x13013:
fffff807`329709db f7412c00010000  test    dword ptr [rcx+2Ch],100h
fffff807`329709e2 0f845cd0feff    je      storport!RaidAdapterHack+0x7c (fffff807`3295da44)  Branch

storport!RaidAdapterHack+0x13020:
fffff807`329709e8 80792902        cmp     byte ptr [rcx+29h],2
fffff807`329709ec 0f8252d0feff    jb      storport!RaidAdapterHack+0x7c (fffff807`3295da44)  Branch

storport!RaidAdapterHack+0x1302a:
fffff807`329709f2 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`329709f6 4c8d05bb4e0200  lea     r8,[storport!WPP_0e11a8d225a936f45e9b3e6eeadbaef4_Traceguids (fffff807`329958b8)]
fffff807`329709fd ba43000000      mov     edx,43h
fffff807`32970a02 448bc8          mov     r9d,eax
fffff807`32970a05 e8c6ac0000      call    storport!WPP_SF_D (fffff807`3297b6d0)
fffff807`32970a0a 90              nop
fffff807`32970a0b e934d0feff      jmp     storport!RaidAdapterHack+0x7c (fffff807`3295da44)  Branch
