32: kd> uf disk!DiskFlushDispatch
disk!DiskFlushDispatch:
fffff807`797f15f0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff807`797f15f5 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff807`797f15fa 4889742418      mov     qword ptr [rsp+18h],rsi
fffff807`797f15ff 57              push    rdi
fffff807`797f1600 4154            push    r12
fffff807`797f1602 4155            push    r13
fffff807`797f1604 4156            push    r14
fffff807`797f1606 4157            push    r15
fffff807`797f1608 4883ec30        sub     rsp,30h
fffff807`797f160c 488b7140        mov     rsi,qword ptr [rcx+40h]   ;get DeviceExtension of disk.sys
fffff807`797f1610 488d5a30        lea     rbx,[rdx+30h]
fffff807`797f1614 4533ff          xor     r15d,r15d
fffff807`797f1617 488be9          mov     rbp,rcx
fffff807`797f161a 488bfa          mov     rdi,rdx
fffff807`797f161d 488d4a32        lea     rcx,[rdx+32h]
fffff807`797f1621 41bd01000000    mov     r13d,1
fffff807`797f1627 33d2            xor     edx,edx
fffff807`797f1629 488b8610020000  mov     rax,qword ptr [rsi+210h]  ;get storage descriptor of this disk, created in classpnp.sys 
fffff807`797f1630 458bf7          mov     r14d,r15d
fffff807`797f1633 458d6720        lea     r12d,[r15+20h]
fffff807`797f1637 4438681e        cmp     byte ptr [rax+1Eh],r13b   ;rax=0x1C, r13b=1
fffff807`797f163b 0f8450010000    je      disk!DiskFlushDispatch+0x1a1 (fffff807`797f1791)  Branch

disk!DiskFlushDispatch+0x51:    ;SCSI_REQUEST_BLOCK version SRB
fffff807`797f1641 458d4756        lea     r8d,[r15+56h]
fffff807`797f1645 e8b61c0000      call    disk!memset (fffff807`797f3300)
fffff807`797f164a b858000000      mov     eax,58h
fffff807`797f164f 668903          mov     word ptr [rbx],ax             ;srb->Length = 0x58
fffff807`797f1652 8b8648020000    mov     eax,dword ptr [rsi+248h]      ;disk->devext->timeout = 0x0A (SCSI_DISK_TIMEOUT)
fffff807`797f1658 c1e002          shl     eax,2
fffff807`797f165b 894314          mov     dword ptr [rbx+14h],eax       ;srb->TimeOutValue = SCSI_DISK_TIMEOUT *4 = 0x28
fffff807`797f165e 66c74308ff20    mov     word ptr [rbx+8],20FFh        ;srb->QueueTag = 0x20FF
fffff807`797f1664 8b8650020000    mov     eax,dword ptr [rsi+250h]      ;0x00200102 
fffff807`797f166a 89430c          mov     dword ptr [rbx+0Ch],eax       ;srb->SrbFlags = SRB_FLAGS_PORT_DRIVER_ALLOCSENSE| SRB_FLAGS_NO_QUEUE_FREEZE | SRB_FLAGS_QUEUE_ACTION_ENABLE

disk!DiskFlushDispatch+0x7d:
fffff807`797f166d 4c8d258c790000  lea     r12,[disk!WPP_GLOBAL_Control (fffff807`797f9000)]
fffff807`797f1674 4484ae80020000  test    byte ptr [rsi+280h],r13b
fffff807`797f167b 7456            je      disk!DiskFlushDispatch+0xe3 (fffff807`797f16d3)  Branch

disk!DiskFlushDispatch+0x8d:
fffff807`797f167d 488b8610020000  mov     rax,qword ptr [rsi+210h]
fffff807`797f1684 4438681e        cmp     byte ptr [rax+1Eh],r13b
fffff807`797f1688 0f840a260000    je      disk!DiskFlushDispatch+0x26a8 (fffff807`797f3c98)  Branch

disk!DiskFlushDispatch+0x9e:
fffff807`797f168e 44887302        mov     byte ptr [rbx+2],r14b         ;disk.sys uses SCSI_REQUEST_BLOCK, not STORAGE_REQUEST_BLOCK. set Function = SRB_EXECUTE_SCSI
fffff807`797f1692 c6430a0a        mov     byte ptr [rbx+0Ah],0Ah        ;srb->CdbLength = 10, indicates this SRB uses CDB10
fffff807`797f1696 c6434835        mov     byte ptr [rbx+48h],35h        ;srb->CDB->OpCode = SCSIOP_SYNCHRONIZE_CACHE

disk!DiskFlushDispatch+0xaa:
fffff807`797f169a 488b0d5f790000  mov     rcx,qword ptr [disk!WPP_GLOBAL_Control (fffff807`797f9000)]
fffff807`797f16a1 493bcc          cmp     rcx,r12
fffff807`797f16a4 740d            je      disk!DiskFlushDispatch+0xc3 (fffff807`797f16b3)  Branch

disk!DiskFlushDispatch+0xb6:
fffff807`797f16a6 f7412c00000200  test    dword ptr [rcx+2Ch],20000h
fffff807`797f16ad 0f8528260000    jne     disk!DiskFlushDispatch+0x26eb (fffff807`797f3cdb)  Branch

disk!DiskFlushDispatch+0xc3:
fffff807`797f16b3 4533c9          xor     r9d,r9d
fffff807`797f16b6 44886c2420      mov     byte ptr [rsp+20h],r13b
fffff807`797f16bb 4533c0          xor     r8d,r8d
fffff807`797f16be 488bd3          mov     rdx,rbx
fffff807`797f16c1 488bcd          mov     rcx,rbp
fffff807`797f16c4 4c8b15059a0000  mov     r10,qword ptr [disk!_imp_ClassSendSrbSynchronous (fffff807`797fb0d0)]
fffff807`797f16cb e850990200      call    CLASSPNP!ClassSendSrbSynchronous (fffff807`7981b020)  ;Send SCSIOP_SYNCHRONIZE_CACHE10 to storport
fffff807`797f16d0 448bf0          mov     r14d,eax

disk!DiskFlushDispatch+0xe3:
fffff807`797f16d3 488b8e10020000  mov     rcx,qword ptr [rsi+210h]
fffff807`797f16da 4438691e        cmp     byte ptr [rcx+1Eh],r13b
fffff807`797f16de 0f8429010000    je      disk!DiskFlushDispatch+0x21d (fffff807`797f180d)  Branch

disk!DiskFlushDispatch+0xf4:
fffff807`797f16e4 c6430208        mov     byte ptr [rbx+2],8
fffff807`797f16e8 44887b0a        mov     byte ptr [rbx+0Ah],r15b
fffff807`797f16ec 488b4710        mov     rax,qword ptr [rdi+10h]
fffff807`797f16f0 814b0c00000020  or      dword ptr [rbx+0Ch],20000000h
fffff807`797f16f7 48894330        mov     qword ptr [rbx+30h],rax
fffff807`797f16fb 44887b04        mov     byte ptr [rbx+4],r15b

disk!DiskFlushDispatch+0x10f:
fffff807`797f16ff 44887b03        mov     byte ptr [rbx+3],r15b
fffff807`797f1703 488b4710        mov     rax,qword ptr [rdi+10h]
fffff807`797f1707 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff807`797f170e 4c897920        mov     qword ptr [rcx+20h],r15
fffff807`797f1712 488b4710        mov     rax,qword ptr [rdi+10h]
fffff807`797f1716 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff807`797f171d c641b80f        mov     byte ptr [rcx-48h],0Fh
fffff807`797f1721 488959c0        mov     qword ptr [rcx-40h],rbx
fffff807`797f1725 488b4710        mov     rax,qword ptr [rdi+10h]
fffff807`797f1729 488b88b8000000  mov     rcx,qword ptr [rax+0B8h]
fffff807`797f1730 488d0509010000  lea     rax,[disk!DiskFlushComplete (fffff807`797f1840)]
fffff807`797f1737 488941f0        mov     qword ptr [rcx-10h],rax
fffff807`797f173b 4963c6          movsxd  rax,r14d
fffff807`797f173e 488941f8        mov     qword ptr [rcx-8],rax
fffff807`797f1742 c641bbe0        mov     byte ptr [rcx-45h],0E0h
fffff807`797f1746 488b0db3780000  mov     rcx,qword ptr [disk!WPP_GLOBAL_Control (fffff807`797f9000)]
fffff807`797f174d 493bcc          cmp     rcx,r12
fffff807`797f1750 740d            je      disk!DiskFlushDispatch+0x16f (fffff807`797f175f)  Branch

disk!DiskFlushDispatch+0x162:
fffff807`797f1752 f7412c00000200  test    dword ptr [rcx+2Ch],20000h
fffff807`797f1759 0f85a1250000    jne     disk!DiskFlushDispatch+0x2710 (fffff807`797f3d00)  Branch

disk!DiskFlushDispatch+0x16f:
fffff807`797f175f 488b5710        mov     rdx,qword ptr [rdi+10h]
fffff807`797f1763 488b4e10        mov     rcx,qword ptr [rsi+10h]
fffff807`797f1767 4c8b15229a0000  mov     r10,qword ptr [disk!_imp_IofCallDriver (fffff807`797fb190)]
fffff807`797f176e e8fd7705fa      call    nt!IofCallDriver (fffff807`73848f70)      ;send SRB_FUNCTION_FLUSH to storport

disk!DiskFlushDispatch+0x183:
fffff807`797f1773 488b5c2460      mov     rbx,qword ptr [rsp+60h]
fffff807`797f1778 488b6c2468      mov     rbp,qword ptr [rsp+68h]
fffff807`797f177d 488b742470      mov     rsi,qword ptr [rsp+70h]
fffff807`797f1782 4883c430        add     rsp,30h
fffff807`797f1786 415f            pop     r15
fffff807`797f1788 415e            pop     r14
fffff807`797f178a 415d            pop     r13
fffff807`797f178c 415c            pop     r12
fffff807`797f178e 5f              pop     rdi
fffff807`797f178f c3              ret

disk!DiskFlushDispatch+0x1a1:       ;STORAGE_REQUEST_BLOCK version SRB filling
fffff807`797f1791 41b8b6000000    mov     r8d,0B6h
fffff807`797f1797 e8641b0000      call    disk!memset (fffff807`797f3300)
fffff807`797f179c b808000000      mov     eax,8
fffff807`797f17a1 c6430228        mov     byte ptr [rbx+2],28h
fffff807`797f17a5 668903          mov     word ptr [rbx],ax
fffff807`797f17a8 c7430858425253  mov     dword ptr [rbx+8],53524258h
fffff807`797f17af 44896b0c        mov     dword ptr [rbx+0Ch],r13d
fffff807`797f17b3 c74310b8000000  mov     dword ptr [rbx+10h],0B8h
fffff807`797f17ba 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff807`797f17be 4c8b15eb9a0000  mov     r10,qword ptr [disk!_imp_IoGetIoPriorityHint (fffff807`797fb2b0)]
fffff807`797f17c5 e8c62c13fa      call    nt!IoGetIoPriorityHint (fffff807`73924490)
fffff807`797f17ca 66894324        mov     word ptr [rbx+24h],ax
fffff807`797f17ce c7433480000000  mov     dword ptr [rbx+34h],80h
fffff807`797f17d5 8b8648020000    mov     eax,dword ptr [rsi+248h]
fffff807`797f17db c74320ff000000  mov     dword ptr [rbx+20h],0FFh
fffff807`797f17e2 6644896326      mov     word ptr [rbx+26h],r12w
fffff807`797f17e7 c1e002          shl     eax,2
fffff807`797f17ea 894328          mov     dword ptr [rbx+28h],eax
fffff807`797f17ed 8b8650020000    mov     eax,dword ptr [rsi+250h]
fffff807`797f17f3 894318          mov     dword ptr [rbx+18h],eax
fffff807`797f17f6 664489ab80000000 mov     word ptr [rbx+80h],r13w
fffff807`797f17fe c7838400000004000000 mov dword ptr [rbx+84h],4
fffff807`797f1808 e960feffff      jmp     disk!DiskFlushDispatch+0x7d (fffff807`797f166d)  Branch

disk!DiskFlushDispatch+0x21d:
fffff807`797f180d b808000000      mov     eax,8
fffff807`797f1812 44897b38        mov     dword ptr [rbx+38h],r15d
fffff807`797f1816 894314          mov     dword ptr [rbx+14h],eax
fffff807`797f1819 44897b78        mov     dword ptr [rbx+78h],r15d
fffff807`797f181d 488b4f10        mov     rcx,qword ptr [rdi+10h]
fffff807`797f1821 814b1800000020  or      dword ptr [rbx+18h],20000000h
fffff807`797f1828 48894b50        mov     qword ptr [rbx+50h],rcx
fffff807`797f182c e9cefeffff      jmp     disk!DiskFlushDispatch+0x10f (fffff807`797f16ff)  Branch

disk!DiskFlushDispatch+0x26a8:
fffff807`797f3c98 c7437890000000  mov     dword ptr [rbx+78h],90h
fffff807`797f3c9f 817b10b8000000  cmp     dword ptr [rbx+10h],0B8h
fffff807`797f3ca6 44897b14        mov     dword ptr [rbx+14h],r15d
fffff807`797f3caa 44896b38        mov     dword ptr [rbx+38h],r13d
fffff807`797f3cae 0f82bfdaffff    jb      disk!DiskFlushDispatch+0x183 (fffff807`797f1773)  Branch

disk!DiskFlushDispatch+0x26c4:
fffff807`797f3cb4 c7839000000040000000 mov dword ptr [rbx+90h],40h
fffff807`797f3cbe c7839400000020000000 mov dword ptr [rbx+94h],20h
fffff807`797f3cc8 c6839a0000000a  mov     byte ptr [rbx+9Ah],0Ah
fffff807`797f3ccf c683a800000035  mov     byte ptr [rbx+0A8h],35h
fffff807`797f3cd6 e9bfd9ffff      jmp     disk!DiskFlushDispatch+0xaa (fffff807`797f169a)  Branch

disk!DiskFlushDispatch+0x26eb:
fffff807`797f3cdb 80792905        cmp     byte ptr [rcx+29h],5
fffff807`797f3cdf 0f82ced9ffff    jb      disk!DiskFlushDispatch+0xc3 (fffff807`797f16b3)  Branch

disk!DiskFlushDispatch+0x26f5:
fffff807`797f3ce5 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`797f3ce9 4c8d0578390000  lea     r8,[disk!WPP_3ffac18a7a983b7d8f32395e08eb24fe_Traceguids (fffff807`797f7668)]
fffff807`797f3cf0 ba19000000      mov     edx,19h
fffff807`797f3cf5 e80e1a0000      call    disk!WPP_SF_ (fffff807`797f5708)
fffff807`797f3cfa 90              nop
fffff807`797f3cfb e9b3d9ffff      jmp     disk!DiskFlushDispatch+0xc3 (fffff807`797f16b3)  Branch

disk!DiskFlushDispatch+0x2710:
fffff807`797f3d00 80792905        cmp     byte ptr [rcx+29h],5
fffff807`797f3d04 0f8255daffff    jb      disk!DiskFlushDispatch+0x16f (fffff807`797f175f)  Branch

disk!DiskFlushDispatch+0x271a:
fffff807`797f3d0a 4c8b4f10        mov     r9,qword ptr [rdi+10h]
fffff807`797f3d0e 4c8d0553390000  lea     r8,[disk!WPP_3ffac18a7a983b7d8f32395e08eb24fe_Traceguids (fffff807`797f7668)]
fffff807`797f3d15 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff807`797f3d19 ba1a000000      mov     edx,1Ah
fffff807`797f3d1e e8291c0000      call    disk!WPP_SF_q (fffff807`797f594c)
fffff807`797f3d23 90              nop
fffff807`797f3d24 e936daffff      jmp     disk!DiskFlushDispatch+0x16f (fffff807`797f175f)  Branch
