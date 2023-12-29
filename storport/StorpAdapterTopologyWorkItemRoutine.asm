0: kd> uf storport!StorpAdapterTopologyWorkItemRoutine
storport!StorpAdapterTopologyWorkItemRoutine:
fffff80c`cedb1570 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff80c`cedb1575 4889742420      mov     qword ptr [rsp+20h],rsi
fffff80c`cedb157a 55              push    rbp
fffff80c`cedb157b 57              push    rdi
fffff80c`cedb157c 4154            push    r12
fffff80c`cedb157e 4156            push    r14
fffff80c`cedb1580 4157            push    r15
fffff80c`cedb1582 488d6c24c9      lea     rbp,[rsp-37h]
fffff80c`cedb1587 4881ec90000000  sub     rsp,90h
fffff80c`cedb158e 488b05fbfc0400  mov     rax,qword ptr [storport!_security_cookie (fffff80c`cee01290)]
fffff80c`cedb1595 4833c4          xor     rax,rsp
fffff80c`cedb1598 4889452f        mov     qword ptr [rbp+2Fh],rax
fffff80c`cedb159c 4c8b7140        mov     r14,qword ptr [rcx+40h]
fffff80c`cedb15a0 33c0            xor     eax,eax
fffff80c`cedb15a2 33db            xor     ebx,ebx
fffff80c`cedb15a4 4889450f        mov     qword ptr [rbp+0Fh],rax
fffff80c`cedb15a8 48894517        mov     qword ptr [rbp+17h],rax
fffff80c`cedb15ac 4532e4          xor     r12b,r12b
fffff80c`cedb15af 488945f7        mov     qword ptr [rbp-9],rax
fffff80c`cedb15b3 488bf2          mov     rsi,rdx
fffff80c`cedb15b6 488945ff        mov     qword ptr [rbp-1],rax
fffff80c`cedb15ba 48894507        mov     qword ptr [rbp+7],rax
fffff80c`cedb15be 4889451f        mov     qword ptr [rbp+1Fh],rax
fffff80c`cedb15c2 894527          mov     dword ptr [rbp+27h],eax
fffff80c`cedb15c5 440f20c0        mov     rax,cr8
fffff80c`cedb15c9 84c0            test    al,al
fffff80c`cedb15cb 0f85ce000000    jne     storport!StorpAdapterTopologyWorkItemRoutine+0x12f (fffff80c`cedb169f)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x61:
fffff80c`cedb15d1 4533c0          xor     r8d,r8d
fffff80c`cedb15d4 488d4df7        lea     rcx,[rbp-9]       ;KEVENT
fffff80c`cedb15d8 33d2            xor     edx,edx
fffff80c`cedb15da bf50490000      mov     edi,4950h
fffff80c`cedb15df 48ff15625c0500  call    qword ptr [storport!_imp_KeInitializeEvent (fffff80c`cee07248)]
fffff80c`cedb15e6 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedb15eb 41b852615465    mov     r8d,65546152h
fffff80c`cedb15f1 8bd7            mov     edx,edi
fffff80c`cedb15f3 b900020000      mov     ecx,200h                  ;NonPagedPoolNx
fffff80c`cedb15f8 48ff15115c0500  call    qword ptr [storport!_imp_ExAllocatePoolWithTag (fffff80c`cee07210)]
fffff80c`cedb15ff 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedb1604 488bd8          mov     rbx,rax
fffff80c`cedb1607 4885c0          test    rax,rax
fffff80c`cedb160a 0f848f000000    je      storport!StorpAdapterTopologyWorkItemRoutine+0x12f (fffff80c`cedb169f)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0xa0:
fffff80c`cedb1610 448bff          mov     r15d,edi

storport!StorpAdapterTopologyWorkItemRoutine+0xa3:
fffff80c`cedb1613 4d8bc7          mov     r8,r15
fffff80c`cedb1616 33d2            xor     edx,edx
fffff80c`cedb1618 488bcb          mov     rcx,rbx
fffff80c`cedb161b e8e0a70100      call    storport!memset (fffff80c`cedcbe00)
fffff80c`cedb1620 83652300        and     dword ptr [rbp+23h],0
fffff80c`cedb1624 488d450f        lea     rax,[rbp+0Fh]
fffff80c`cedb1628 4889442440      mov     qword ptr [rsp+40h],rax       ;&IoStatusBlock
fffff80c`cedb162d 4c8d451f        lea     r8,[rbp+1Fh]                  ;InputBuffer = PSTORAGE_PROPERTY_QUERY，所以size = 0x0C
fffff80c`cedb1631 488d45f7        lea     rax,[rbp-9]
fffff80c`cedb1635 c7451f35000000  mov     dword ptr [rbp+1Fh],35h
fffff80c`cedb163c 498b5608        mov     rdx,qword ptr [r14+8]         ;DevObj
fffff80c`cedb1640 41b90c000000    mov     r9d,0Ch                       ;InputBufferSize
fffff80c`cedb1646 4889442438      mov     qword ptr [rsp+38h],rax       ;&Event
fffff80c`cedb164b b900142d00      mov     ecx,2D1400h                   ;IOCTL_STORAGE_QUERY_PROPERTY
fffff80c`cedb1650 c644243000      mov     byte ptr [rsp+30h],0          ;InternalDeviceIoControl = FALSE
fffff80c`cedb1655 897c2428        mov     dword ptr [rsp+28h],edi       ;OutputBufferSize
fffff80c`cedb1659 48895c2420      mov     qword ptr [rsp+20h],rbx       ;OutputBuffer
fffff80c`cedb165e 48ff15c35f0500  call    qword ptr [storport!_imp_IoBuildDeviceIoControlRequest (fffff80c`cee07628)]
fffff80c`cedb1665 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedb166a 4885c0          test    rax,rax
fffff80c`cedb166d 7430            je      storport!StorpAdapterTopologyWorkItemRoutine+0x12f (fffff80c`cedb169f)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0xff:
fffff80c`cedb166f c74030bb0000c0  mov     dword ptr [rax+30h],0C00000BBh
fffff80c`cedb1676 488bd0          mov     rdx,rax
fffff80c`cedb1679 498b4e08        mov     rcx,qword ptr [r14+8]
fffff80c`cedb167d 48ff15945b0500  call    qword ptr [storport!_imp_IofCallDriver (fffff80c`cee07218)]
fffff80c`cedb1684 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedb1689 3d03010000      cmp     eax,103h
fffff80c`cedb168e 0f84b6030200    je      storport!StorpAdapterTopologyWorkItemRoutine+0x204da (fffff80c`cedd1a4a)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x124:
fffff80c`cedb1694 8b4304          mov     eax,dword ptr [rbx+4]
fffff80c`cedb1697 3bc7            cmp     eax,edi
fffff80c`cedb1699 0f87cf030200    ja      storport!StorpAdapterTopologyWorkItemRoutine+0x204fe (fffff80c`cedd1a6e)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x12f:
fffff80c`cedb169f 498b8e10010000  mov     rcx,qword ptr [r14+110h]
fffff80c`cedb16a6 48ff15e35b0500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff80c`cee07290)]
fffff80c`cedb16ad 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedb16b2 4885db          test    rbx,rbx
fffff80c`cedb16b5 7414            je      storport!StorpAdapterTopologyWorkItemRoutine+0x15b (fffff80c`cedb16cb)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x147:
fffff80c`cedb16b7 ba52615465      mov     edx,65546152h
fffff80c`cedb16bc 488bcb          mov     rcx,rbx
fffff80c`cedb16bf 48ff15625b0500  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff80c`cee07228)]
fffff80c`cedb16c6 0f1f440000      nop     dword ptr [rax+rax]

storport!StorpAdapterTopologyWorkItemRoutine+0x15b:
fffff80c`cedb16cb 4885f6          test    rsi,rsi
fffff80c`cedb16ce 740f            je      storport!StorpAdapterTopologyWorkItemRoutine+0x16f (fffff80c`cedb16df)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x160:
fffff80c`cedb16d0 488bce          mov     rcx,rsi
fffff80c`cedb16d3 48ff152e5b0500  call    qword ptr [storport!_imp_IoFreeWorkItem (fffff80c`cee07208)]
fffff80c`cedb16da 0f1f440000      nop     dword ptr [rax+rax]

storport!StorpAdapterTopologyWorkItemRoutine+0x16f:
fffff80c`cedb16df 488b4d2f        mov     rcx,qword ptr [rbp+2Fh]
fffff80c`cedb16e3 4833cc          xor     rcx,rsp
fffff80c`cedb16e6 e875460100      call    storport!_security_check_cookie (fffff80c`cedc5d60)
fffff80c`cedb16eb 4c8d9c2490000000 lea     r11,[rsp+90h]
fffff80c`cedb16f3 498b5b40        mov     rbx,qword ptr [r11+40h]
fffff80c`cedb16f7 498b7348        mov     rsi,qword ptr [r11+48h]
fffff80c`cedb16fb 498be3          mov     rsp,r11
fffff80c`cedb16fe 415f            pop     r15
fffff80c`cedb1700 415e            pop     r14
fffff80c`cedb1702 415c            pop     r12
fffff80c`cedb1704 5f              pop     rdi
fffff80c`cedb1705 5d              pop     rbp
fffff80c`cedb1706 c3              ret

storport!StorpAdapterTopologyWorkItemRoutine+0x204da:
fffff80c`cedd1a4a 488364242000    and     qword ptr [rsp+20h],0
fffff80c`cedd1a50 488d4df7        lea     rcx,[rbp-9]
fffff80c`cedd1a54 4533c9          xor     r9d,r9d
fffff80c`cedd1a57 4533c0          xor     r8d,r8d
fffff80c`cedd1a5a 33d2            xor     edx,edx
fffff80c`cedd1a5c 48ff150d580300  call    qword ptr [storport!_imp_KeWaitForSingleObject (fffff80c`cee07270)]
fffff80c`cedd1a63 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedd1a68 90              nop
fffff80c`cedd1a69 e926fcfdff      jmp     storport!StorpAdapterTopologyWorkItemRoutine+0x124 (fffff80c`cedb1694)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x204fe:
fffff80c`cedd1a6e 4584e4          test    r12b,r12b
fffff80c`cedd1a71 0f8528fcfdff    jne     storport!StorpAdapterTopologyWorkItemRoutine+0x12f (fffff80c`cedb169f)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x20507:
fffff80c`cedd1a77 ba52615465      mov     edx,65546152h
fffff80c`cedd1a7c 488bcb          mov     rcx,rbx
fffff80c`cedd1a7f 488bf8          mov     rdi,rax
fffff80c`cedd1a82 48ff159f570300  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff80c`cee07228)]
fffff80c`cedd1a89 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedd1a8e 4533c0          xor     r8d,r8d
fffff80c`cedd1a91 488d4df7        lea     rcx,[rbp-9]
fffff80c`cedd1a95 33d2            xor     edx,edx
fffff80c`cedd1a97 41b401          mov     r12b,1
fffff80c`cedd1a9a 48ff15a7570300  call    qword ptr [storport!_imp_KeInitializeEvent (fffff80c`cee07248)]
fffff80c`cedd1aa1 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedd1aa6 41b852615465    mov     r8d,65546152h
fffff80c`cedd1aac 488bd7          mov     rdx,rdi
fffff80c`cedd1aaf b900020000      mov     ecx,200h
fffff80c`cedd1ab4 4c8bff          mov     r15,rdi
fffff80c`cedd1ab7 48ff1552570300  call    qword ptr [storport!_imp_ExAllocatePoolWithTag (fffff80c`cee07210)]
fffff80c`cedd1abe 0f1f440000      nop     dword ptr [rax+rax]
fffff80c`cedd1ac3 488bd8          mov     rbx,rax
fffff80c`cedd1ac6 4885c0          test    rax,rax
fffff80c`cedd1ac9 0f8544fbfdff    jne     storport!StorpAdapterTopologyWorkItemRoutine+0xa3 (fffff80c`cedb1613)  Branch

storport!StorpAdapterTopologyWorkItemRoutine+0x2055f:
fffff80c`cedd1acf e9cbfbfdff      jmp     storport!StorpAdapterTopologyWorkItemRoutine+0x12f (fffff80c`cedb169f)  Branch
