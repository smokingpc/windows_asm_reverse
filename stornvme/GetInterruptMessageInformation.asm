
;===>這貌似是自建中斷向量表，自己實作 Mask Interrupt!!

24: kd> uf stornvme!GetInterruptMessageInformation
stornvme!GetInterruptMessageInformation:
fffff807`adaebb6c 4c8bdc          mov     r11,rsp
fffff807`adaebb6f 49895b10        mov     qword ptr [r11+10h],rbx
fffff807`adaebb73 49896b18        mov     qword ptr [r11+18h],rbp
fffff807`adaebb77 49897320        mov     qword ptr [r11+20h],rsi
fffff807`adaebb7b 57              push    rdi
fffff807`adaebb7c 4156            push    r14
fffff807`adaebb7e 4157            push    r15
fffff807`adaebb80 4883ec60        sub     rsp,60h
fffff807`adaebb84 488b0575240100  mov     rax,qword ptr [stornvme!_security_cookie (fffff807`adafe000)]
fffff807`adaebb8b 4833c4          xor     rax,rsp
fffff807`adaebb8e 4889442450      mov     qword ptr [rsp+50h],rax
fffff807`adaebb93 33d2            xor     edx,edx
fffff807`adaebb95 488bf9          mov     rdi,rcx
fffff807`adaebb98 498d4bb8        lea     rcx,[r11-48h]
fffff807`adaebb9c 448d4220        lea     r8d,[rdx+20h]
fffff807`adaebba0 e85bc5ffff      call    stornvme!memset (fffff807`adae8100)
fffff807`adaebba5 33db            xor     ebx,ebx
fffff807`adaebba7 33f6            xor     esi,esi
fffff807`adaebba9 448d7b01        lea     r15d,[rbx+1]
fffff807`adaebbad 40387710        cmp     byte ptr [rdi+10h],sil
fffff807`adaebbb1 0f854e010000    jne     stornvme!GetInterruptMessageInformation+0x199 (fffff807`adaebd05)  Branch

stornvme!GetInterruptMessageInformation+0x4b:
fffff807`adaebbb7 488bcf          mov     rcx,rdi
fffff807`adaebbba e879feffff      call    stornvme!FreeMsiInfo (fffff807`adaeba38)
fffff807`adaebbbf 8b470c          mov     eax,dword ptr [rdi+0Ch]       ;eax == 3  (total 3 interrupts???)
fffff807`adaebbc2 83e802          sub     eax,2
fffff807`adaebbc5 413bc7          cmp     eax,r15d
fffff807`adaebbc8 7770            ja      stornvme!GetInterruptMessageInformation+0xce (fffff807`adaebc3a)  Branch

stornvme!GetInterruptMessageInformation+0x5e:
fffff807`adaebbca 448d730d        lea     r14d,[rbx+0Dh]        ;rbx == 0, r14d==0x0d
fffff807`adaebbce 4533c0          xor     r8d,r8d               ;MsgID==0
fffff807`adaebbd1 418bce          mov     ecx,r14d              ;0x0d (ExtFunctionGetMessageInterruptInformation)
fffff807`adaebbd4 4c8d4c2430      lea     r9,[rsp+30h]          ;PMESSAGE_INTERRUPT_INFORMATION structure
fffff807`adaebbd9 488bd7          mov     rdx,rdi               ;rdi == pAE
fffff807`adaebbdc 8bee            mov     ebp,esi
fffff807`adaebbde 48ff1543440100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff807`adb00028)]
fffff807`adaebbe5 0f1f440000      nop     dword ptr [rax+rax]
fffff807`adaebbea 85c0            test    eax,eax
fffff807`adaebbec 7548            jne     stornvme!GetInterruptMessageInformation+0xca (fffff807`adaebc36)  Branch

stornvme!GetInterruptMessageInformation+0x82:
fffff807`adaebbee 6685ed          test    bp,bp     ;if (msgid>0) goto 0x8e => only save (MsgID==0) 's MessageAddress to rbx
fffff807`adaebbf1 7507            jne     stornvme!GetInterruptMessageInformation+0x8e (fffff807`adaebbfa)  Branch

stornvme!GetInterruptMessageInformation+0x87:
fffff807`adaebbf3 488b5c2438      mov     rbx,qword ptr [rsp+38h]       ;copy previous PMESSAGE_INTERRUPT_INFORMATION::MessageAddress to rbx
fffff807`adaebbf8 eb14            jmp     stornvme!GetInterruptMessageInformation+0xa2 (fffff807`adaebc0e)  Branch

stornvme!GetInterruptMessageInformation+0x8e:
fffff807`adaebbfa 483b5c2438      cmp     rbx,qword ptr [rsp+38h]       ;if got same message address, goto to 0xa2 to detect next
fffff807`adaebbff 750d            jne     stornvme!GetInterruptMessageInformation+0xa2 (fffff807`adaebc0e)  Branch

stornvme!GetInterruptMessageInformation+0x95:
fffff807`adaebc01 837f0c03        cmp     dword ptr [rdi+0Ch],3         ;if check state ok, goto to 0xa2 to detect next
fffff807`adaebc05 7407            je      stornvme!GetInterruptMessageInformation+0xa2 (fffff807`adaebc0e)  Branch

stornvme!GetInterruptMessageInformation+0x9b:
fffff807`adaebc07 c7470c02000000  mov     dword ptr [rdi+0Ch],2

stornvme!GetInterruptMessageInformation+0xa2:
fffff807`adaebc0e 664103ef        add     bp,r15w               ;bp++
fffff807`adaebc12 4c8d4c2430      lea     r9,[rsp+30h]          ;PMESSAGE_INTERRUPT_INFORMATION structure
fffff807`adaebc17 440fb7c5        movzx   r8d,bp                ;MsgID = bp++
fffff807`adaebc1b 488bd7          mov     rdx,rdi               
fffff807`adaebc1e 418bce          mov     ecx,r14d              ;0x0d (ExtFunctionGetMessageInterruptInformation)
fffff807`adaebc21 48ff1500440100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff807`adb00028)]
fffff807`adaebc28 0f1f440000      nop     dword ptr [rax+rax]
fffff807`adaebc2d 85c0            test    eax,eax
fffff807`adaebc2f 74bd            je      stornvme!GetInterruptMessageInformation+0x82 (fffff807`adaebbee)  Branch

stornvme!GetInterruptMessageInformation+0xc5:
fffff807`adaebc31 6685ed          test    bp,bp         ;traverse all allocated MSIX(default 64) until ExtFunctionGetMessageInterruptInformation failed.
fffff807`adaebc34 7508            jne     stornvme!GetInterruptMessageInformation+0xd2 (fffff807`adaebc3e)  Branch
                                                        ;bp is 0x41 here...
stornvme!GetInterruptMessageInformation+0xca:
fffff807`adaebc36 44897f0c        mov     dword ptr [rdi+0Ch],r15d

stornvme!GetInterruptMessageInformation+0xce:
fffff807`adaebc3a 410fb7ef        movzx   ebp,r15w

stornvme!GetInterruptMessageInformation+0xd2:
fffff807`adaebc3e 0fb7c5          movzx   eax,bp        ;eax == 0x41
fffff807`adaebc41 488d9ff8000000  lea     rbx,[rdi+0F8h]                ;pAE+0xF8
fffff807`adaebc48 6689aff0000000  mov     word ptr [rdi+0F0h],bp        ;save bp to pAE+0xF0 => pAE+0xF0 could be a structure
fffff807`adaebc4f 488bd7          mov     rdx,rdi
fffff807`adaebc52 bd4e766d65      mov     ebp,656D764Eh
fffff807`adaebc57 48895c2420      mov     qword ptr [rsp+20h],rbx   ;rbx is 5th arg of AllocatePool=> PVOID* out ptr
fffff807`adaebc5c 448bcd          mov     r9d,ebp
fffff807`adaebc5f 33c9            xor     ecx,ecx                   ;ExtFunctionAllocatePool
fffff807`adaebc61 448d0440        lea     r8d,[rax+rax*2]           ;0x41+0x41*2 => 0xc3
fffff807`adaebc65 41c1e003        shl     r8d,3                     ;size == 0x618 (r8d)
fffff807`adaebc69 48ff15b8430100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff807`adb00028)]
fffff807`adaebc70 0f1f440000      nop     dword ptr [rax+rax]
fffff807`adaebc75 488b0b          mov     rcx,qword ptr [rbx]
fffff807`adaebc78 4885c9          test    rcx,rcx
fffff807`adaebc7b 0f84ae000000    je      stornvme!GetInterruptMessageInformation+0x1c3 (fffff807`adaebd2f)  Branch

stornvme!GetInterruptMessageInformation+0x115:
fffff807`adaebc81 0fb787f0000000  movzx   eax,word ptr [rdi+0F0h]
fffff807`adaebc88 8d1440          lea     edx,[rax+rax*2]
fffff807`adaebc8b c1e203          shl     edx,3
fffff807`adaebc8e e89d93ffff      call    stornvme!NVMeZeroMemory (fffff807`adae5030)
fffff807`adaebc93 440fb787f0000000 movzx   r8d,word ptr [rdi+0F0h]      ;r8d=> 0x41
fffff807`adaebc9b 4c8db700010000  lea     r14,[rdi+100h]
fffff807`adaebca2 41c1e004        shl     r8d,4                         ;r8d * 0x10 => 0x410
fffff807`adaebca6 448bcd          mov     r9d,ebp                       ;tag
fffff807`adaebca9 488bd7          mov     rdx,rdi                       ;pAE
fffff807`adaebcac 4c89742420      mov     qword ptr [rsp+20h],r14   ;5th arg => out ptr 
fffff807`adaebcb1 33c9            xor     ecx,ecx                   ;ExtFunctionAllocatePool
fffff807`adaebcb3 48ff156e430100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff807`adb00028)]
fffff807`adaebcba 0f1f440000      nop     dword ptr [rax+rax]
fffff807`adaebcbf 498b0e          mov     rcx,qword ptr [r14]
fffff807`adaebcc2 4885c9          test    rcx,rcx
fffff807`adaebcc5 7468            je      stornvme!GetInterruptMessageInformation+0x1c3 (fffff807`adaebd2f)  Branch

stornvme!GetInterruptMessageInformation+0x15b:
fffff807`adaebcc7 0fb797f0000000  movzx   edx,word ptr [rdi+0F0h]
fffff807`adaebcce c1e204          shl     edx,4
fffff807`adaebcd1 e85a93ffff      call    stornvme!NVMeZeroMemory (fffff807`adae5030)
fffff807`adaebcd6 eb24            jmp     stornvme!GetInterruptMessageInformation+0x190 (fffff807`adaebcfc)  Branch

stornvme!GetInterruptMessageInformation+0x16c:
fffff807`adaebcd8 488b03          mov     rax,qword ptr [rbx]
fffff807`adaebcdb 440fb7c6        movzx   r8d,si
fffff807`adaebcdf 0fb7ce          movzx   ecx,si
fffff807`adaebce2 4b8d1440        lea     rdx,[r8+r8*2]         ;calculate rdx as offset by r8 
fffff807`adaebce6 49c1e004        shl     r8,4
fffff807`adaebcea 890cd0          mov     dword ptr [rax+rdx*8],ecx
fffff807`adaebced 4d0306          add     r8,qword ptr [r14]        ;r8 = r8 + (2nd allocated pool ptr)
fffff807`adaebcf0 488b03          mov     rax,qword ptr [rbx]
fffff807`adaebcf3 664103f7        add     si,r15w
fffff807`adaebcf7 4c8944d008      mov     qword ptr [rax+rdx*8+8],r8

stornvme!GetInterruptMessageInformation+0x190:
fffff807`adaebcfc 663bb7f0000000  cmp     si,word ptr [rdi+0F0h]        ;if(total interrupts > processed items) goto 0x16c
fffff807`adaebd03 72d3            jb      stornvme!GetInterruptMessageInformation+0x16c (fffff807`adaebcd8)  Branch

stornvme!GetInterruptMessageInformation+0x199:
fffff807`adaebd05 418ac7          mov     al,r15b

stornvme!GetInterruptMessageInformation+0x19c:
fffff807`adaebd08 488b4c2450      mov     rcx,qword ptr [rsp+50h]
fffff807`adaebd0d 4833cc          xor     rcx,rsp
fffff807`adaebd10 e8aba8ffff      call    stornvme!_security_check_cookie (fffff807`adae65c0)
fffff807`adaebd15 4c8d5c2460      lea     r11,[rsp+60h]
fffff807`adaebd1a 498b5b28        mov     rbx,qword ptr [r11+28h]
fffff807`adaebd1e 498b6b30        mov     rbp,qword ptr [r11+30h]
fffff807`adaebd22 498b7338        mov     rsi,qword ptr [r11+38h]
fffff807`adaebd26 498be3          mov     rsp,r11
fffff807`adaebd29 415f            pop     r15
fffff807`adaebd2b 415e            pop     r14
fffff807`adaebd2d 5f              pop     rdi
fffff807`adaebd2e c3              ret

stornvme!GetInterruptMessageInformation+0x1c3:
fffff807`adaebd2f 488bcf          mov     rcx,rdi
fffff807`adaebd32 e801fdffff      call    stornvme!FreeMsiInfo (fffff807`adaeba38)
fffff807`adaebd37 32c0            xor     al,al
fffff807`adaebd39 ebcd            jmp     stornvme!GetInterruptMessageInformation+0x19c (fffff807`adaebd08)  Branch
