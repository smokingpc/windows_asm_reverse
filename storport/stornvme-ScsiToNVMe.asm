stornvme!ScsiToNVMe:
fffff807`e0f93e20 4055            push    rbp
fffff807`e0f93e22 53              push    rbx
fffff807`e0f93e23 56              push    rsi
fffff807`e0f93e24 57              push    rdi
fffff807`e0f93e25 4154            push    r12
fffff807`e0f93e27 4156            push    r14
fffff807`e0f93e29 4157            push    r15
fffff807`e0f93e2b 488d6c24d9      lea     rbp,[rsp-27h]
fffff807`e0f93e30 4881ecc0000000  sub     rsp,0C0h
fffff807`e0f93e37 488b05c2a10100  mov     rax,qword ptr [stornvme!_security_cookie (fffff807`e0fae000)]
fffff807`e0f93e3e 4833c4          xor     rax,rsp
fffff807`e0f93e41 4889451f        mov     qword ptr [rbp+1Fh],rax
fffff807`e0f93e45 440fb65a02      movzx   r11d,byte ptr [rdx+2]
fffff807`e0f93e4a 4533f6          xor     r14d,r14d
fffff807`e0f93e4d 4532c9          xor     r9b,r9b
fffff807`e0f93e50 448975a3        mov     dword ptr [rbp-5Dh],r14d
fffff807`e0f93e54 488bda          mov     rbx,rdx
fffff807`e0f93e57 488bf9          mov     rdi,rcx
fffff807`e0f93e5a 458bfe          mov     r15d,r14d
fffff807`e0f93e5d 418bf6          mov     esi,r14d

;===> SrbGetCdb()->SrbGetScsiData() 的 inline?
fffff807`e0f93e60 4180fb28        cmp     r11b,28h
fffff807`e0f93e64 0f85bb000000    jne     stornvme!ScsiToNVMe+0x105 (fffff807`e0f93f25)  Branch
stornvme!ScsiToNVMe+0x4a:
fffff807`e0f93e6a 44397214        cmp     dword ptr [rdx+14h],r14d          ;check Srb->SrbFunction, if (Srb->SrbFunction != SRB_EXECUTE_SCSI) goto 0xe7
fffff807`e0f93e6e 0f8593000000    jne     stornvme!ScsiToNVMe+0xe7 (fffff807`e0f93f07)  Branch

stornvme!ScsiToNVMe+0x54:
fffff807`e0f93e74 8b4238          mov     eax,dword ptr [rdx+38h]       ;read Srb->NumSrbExData to EAX
fffff807`e0f93e77 85c0            test    eax,eax
fffff807`e0f93e79 0f8488000000    je      stornvme!ScsiToNVMe+0xe7 (fffff807`e0f93f07)  Branch

stornvme!ScsiToNVMe+0x5f:
fffff807`e0f93e7f 4c8d4278        lea     r8,[rdx+78h]              ;R8 => cursor = &SrbExDataOffset[0]
fffff807`e0f93e83 448bd0          mov     r10d,eax

;limit = Srb->NumSrbExData
;for(limit = Srb->NumSrbExData; limit > 0; limit--)
stornvme!ScsiToNVMe+0x66:
fffff807`e0f93e86 418b00          mov     eax,dword ptr [r8]
fffff807`e0f93e89 3d80000000      cmp     eax,80h                   ;if SrbExDataOffset[0] < 0x80  goto 0xd8 => 0x80 好像是size最低下限？
fffff807`e0f93e8e 7268            jb      stornvme!ScsiToNVMe+0xd8 (fffff807`e0f93ef8)  Branch

stornvme!ScsiToNVMe+0x70:
fffff807`e0f93e90 3b4310          cmp     eax,dword ptr [rbx+10h]   ;if((SrbEx->SrbExDataOffset[0] >= SrbEx->SrbLength)) goto 0xd8
fffff807`e0f93e93 7763            ja      stornvme!ScsiToNVMe+0xd8 (fffff807`e0f93ef8)  Branch

stornvme!ScsiToNVMe+0x75:
;SrbExData = (PSRBEX_DATA)((PUCHAR)SrbEx + SrbEx->SrbExDataOffset[i]);
;EDX = SrbExData->Type
fffff807`e0f93e95 8b1403          mov     edx,dword ptr [rbx+rax]   
fffff807`e0f93e98 488d0c03        lea     rcx,[rbx+rax]     ;RCX = SrbExData
;switch(SrbExData->Type)
;case SrbExDataTypeScsiCdb16:           <==通常 SCSI WRITE 走這邊
fffff807`e0f93e9c 83ea40          sub     edx,40h
fffff807`e0f93e9f 7442            je      stornvme!ScsiToNVMe+0xc3 (fffff807`e0f93ee3)  Branch  
;case SrbExDataTypeScsiCdb32:
stornvme!ScsiToNVMe+0x81:
fffff807`e0f93ea1 83ea01          sub     edx,1
fffff807`e0f93ea4 7421            je      stornvme!ScsiToNVMe+0xa7 (fffff807`e0f93ec7)  Branch
;case SrbExDataTypeScsiCdbVar:
stornvme!ScsiToNVMe+0x86:
fffff807`e0f93ea6 83fa01          cmp     edx,1
fffff807`e0f93ea9 754d            jne     stornvme!ScsiToNVMe+0xd8 (fffff807`e0f93ef8)  Branch

stornvme!ScsiToNVMe+0x8b:
fffff807`e0f93eab 448b790c        mov     r15d,dword ptr [rcx+0Ch]
fffff807`e0f93eaf 488d4120        lea     rax,[rcx+20h]
fffff807`e0f93eb3 4585ff          test    r15d,r15d
fffff807`e0f93eb6 44897da3        mov     dword ptr [rbp-5Dh],r15d
fffff807`e0f93eba 440fb6ca        movzx   r9d,dl
fffff807`e0f93ebe 480f44c6        cmove   rax,rsi
fffff807`e0f93ec2 488bf0          mov     rsi,rax
fffff807`e0f93ec5 eb31            jmp     stornvme!ScsiToNVMe+0xd8 (fffff807`e0f93ef8)  Branch

stornvme!ScsiToNVMe+0xa7:
fffff807`e0f93ec7 440fb6790a      movzx   r15d,byte ptr [rcx+0Ah]
fffff807`e0f93ecc 488d4118        lea     rax,[rcx+18h]
fffff807`e0f93ed0 4584ff          test    r15b,r15b
fffff807`e0f93ed3 44897da3        mov     dword ptr [rbp-5Dh],r15d
fffff807`e0f93ed7 41b101          mov     r9b,1
fffff807`e0f93eda 480f44c6        cmove   rax,rsi
fffff807`e0f93ede 488bf0          mov     rsi,rax
fffff807`e0f93ee1 eb15            jmp     stornvme!ScsiToNVMe+0xd8 (fffff807`e0f93ef8)  Branch

stornvme!ScsiToNVMe+0xc3:
fffff807`e0f93ee3 440fb6790a      movzx   r15d,byte ptr [rcx+0Ah]   ;R15b = ((PSRBEX_DATA_SCSI_CDB16) SrbExData)->CdbLength;
fffff807`e0f93ee8 41b101          mov     r9b,1                     ;R9B ==> BOOLEAN found
fffff807`e0f93eeb 44897da3        mov     dword ptr [rbp-5Dh],r15d  ;return CdbLength8 arg of SrbGetScsiData()
fffff807`e0f93eef 4584ff          test    r15b,r15b                 ;if CdbLength == 0, goto 0xd8
fffff807`e0f93ef2 7404            je      stornvme!ScsiToNVMe+0xd8 (fffff807`e0f93ef8)  Branch

stornvme!ScsiToNVMe+0xd4:
fffff807`e0f93ef4 488d7118        lea     rsi,[rcx+18h]             ;RSI = &((PSRBEX_DATA_SCSI_CDB16) SrbExData)->Cdb;

stornvme!ScsiToNVMe+0xd8:
fffff807`e0f93ef8 4983c004        add     r8,4                      ;R8 (cursor ptr) ++
fffff807`e0f93efc 4983ea01        sub     r10,1                     ;limit--
fffff807`e0f93f00 7584            jne     stornvme!ScsiToNVMe+0x66 (fffff807`e0f93e86)  Branch
;======> for loop end

stornvme!ScsiToNVMe+0xe2:
fffff807`e0f93f02 4584c9          test    r9b,r9b       ;if found, goto 0xee
fffff807`e0f93f05 7507            jne     stornvme!ScsiToNVMe+0xee (fffff807`e0f93f0e)  Branch

stornvme!ScsiToNVMe+0xe7:
fffff807`e0f93f07 458bfe          mov     r15d,r14d
fffff807`e0f93f0a 448975a3        mov     dword ptr [rbp-5Dh],r14d

stornvme!ScsiToNVMe+0xee:
fffff807`e0f93f0e 4532e4          xor     r12b,r12b
fffff807`e0f93f11 448865af        mov     byte ptr [rbp-51h],r12b
fffff807`e0f93f15 4180fb28        cmp     r11b,28h          ;if (Srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x11e
fffff807`e0f93f19 7523            jne     stornvme!ScsiToNVMe+0x11e (fffff807`e0f93f3e)  Branch

stornvme!ScsiToNVMe+0xfb:
fffff807`e0f93f1b 8b4334          mov     eax,dword ptr [rbx+34h]       ;EAX = Srb->AddressOffset
fffff807`e0f93f1e 0fb64c180a      movzx   ecx,byte ptr [rax+rbx+0Ah]    ;ECX = SrbGetLun()
fffff807`e0f93f23 eb1d            jmp     stornvme!ScsiToNVMe+0x122 (fffff807`e0f93f42)  Branch

stornvme!ScsiToNVMe+0x105:
fffff807`e0f93f25 4584db          test    r11b,r11b         ;if (Srb->Function != SRB_EXECUTE_SCSI) goto 0xe7
fffff807`e0f93f28 75dd            jne     stornvme!ScsiToNVMe+0xe7 (fffff807`e0f93f07)  Branch

stornvme!ScsiToNVMe+0x10a:
fffff807`e0f93f2a 440fb67a0a      movzx   r15d,byte ptr [rdx+0Ah]
fffff807`e0f93f2f 44897da3        mov     dword ptr [rbp-5Dh],r15d
fffff807`e0f93f33 4584ff          test    r15b,r15b
fffff807`e0f93f36 74d6            je      stornvme!ScsiToNVMe+0xee (fffff807`e0f93f0e)  Branch

stornvme!ScsiToNVMe+0x118:
fffff807`e0f93f38 488d7248        lea     rsi,[rdx+48h]
fffff807`e0f93f3c ebd0            jmp     stornvme!ScsiToNVMe+0xee (fffff807`e0f93f0e)  Branch

stornvme!ScsiToNVMe+0x11e:
fffff807`e0f93f3e 0fb64b07        movzx   ecx,byte ptr [rbx+7]

stornvme!ScsiToNVMe+0x122:
fffff807`e0f93f42 0fb6c1          movzx   eax,cl            ;EAX = LunID
fffff807`e0f93f45 8945d3          mov     dword ptr [rbp-2Dh],eax
fffff807`e0f93f48 4183ff06        cmp     r15d,6        ;if CdbLength < 6 , goto 0x98b (this is invalid CDB length)
fffff807`e0f93f4c 0f8259080000    jb      stornvme!ScsiToNVMe+0x98b (fffff807`e0f947ab)  Branch

stornvme!ScsiToNVMe+0x132:
fffff807`e0f93f52 4885f6          test    rsi,rsi       ;if Cdb ptr == NULL , goto 0x98b
fffff807`e0f93f55 0f8450080000    je      stornvme!ScsiToNVMe+0x98b (fffff807`e0f947ab)  Branch

stornvme!ScsiToNVMe+0x13b:
fffff807`e0f93f5b 0fb60e          movzx   ecx,byte ptr [rsi]    ;get CDB->CDB6GENERIC.OperationCode
fffff807`e0f93f5e 80f9a0          cmp     cl,0A0h               ;if opcode == SCSIOP_REPORT_LUNS , goto 0x15e
fffff807`e0f93f61 741b            je      stornvme!ScsiToNVMe+0x15e (fffff807`e0f93f7e)  Branch

stornvme!ScsiToNVMe+0x143:          ;switch case to dispatch SCSI opcode
fffff807`e0f93f63 488b94c770060000 mov     rdx,qword ptr [rdi+rax*8+670h]
fffff807`e0f93f6b 4885d2          test    rdx,rdx
fffff807`e0f93f6e 7406            je      stornvme!ScsiToNVMe+0x156 (fffff807`e0f93f76)  Branch

stornvme!ScsiToNVMe+0x150:
fffff807`e0f93f70 44397234        cmp     dword ptr [rdx+34h],r14d
fffff807`e0f93f74 7508            jne     stornvme!ScsiToNVMe+0x15e (fffff807`e0f93f7e)  Branch

stornvme!ScsiToNVMe+0x156:
fffff807`e0f93f76 41b125          mov     r9b,25h
fffff807`e0f93f79 e930080000      jmp     stornvme!ScsiToNVMe+0x98e (fffff807`e0f947ae)  Branch

stornvme!ScsiToNVMe+0x15e:
fffff807`e0f93f7e 0fb6c1          movzx   eax,cl
fffff807`e0f93f81 4c89ac2410010000 mov     qword ptr [rsp+110h],r13
fffff807`e0f93f89 3db5000000      cmp     eax,0B5h          ;if opcode >= SCSIOP_SECURITY_PROTOCOL_OUT, goto 0x922
fffff807`e0f93f8e 0f87ae070000    ja      stornvme!ScsiToNVMe+0x922 (fffff807`e0f94742)  Branch

stornvme!ScsiToNVMe+0x174:
fffff807`e0f93f94 488d1565c0ffff  lea     rdx,[stornvme!IoctlQueryProtocolInfoProcess <PERF> (stornvme+0x0) (fffff807`e0f90000)]
fffff807`e0f93f9b 8b8c824cb60100  mov     ecx,dword ptr [rdx+rax*4+1B64Ch]
fffff807`e0f93fa2 4803ca          add     rcx,rdx
fffff807`e0f93fa5 ffe1            jmp     rcx   ;Jump to SCSI opcode dispatcher... rdx is base and rax is OPCode

stornvme!ScsiToNVMe+0x922:
fffff807`e0f94742 41b120          mov     r9b,20h
fffff807`e0f94745 b206            mov     dl,6
fffff807`e0f94747 488bcb          mov     rcx,rbx
fffff807`e0f9474a e885610000      call    stornvme!NVMeSetSenseData (fffff807`e0f9a8d4)
fffff807`e0f9474f 41be070000c1    mov     r14d,0C1000007h
fffff807`e0f94755 807b0300        cmp     byte ptr [rbx+3],0
fffff807`e0f94759 4c8bac2410010000 mov     r13,qword ptr [rsp+110h]
fffff807`e0f94761 7543            jne     stornvme!ScsiToNVMe+0x986 (fffff807`e0f947a6)  Branch

stornvme!ScsiToNVMe+0x943:
fffff807`e0f94763 8b4734          mov     eax,dword ptr [rdi+34h]
fffff807`e0f94766 488bd3          mov     rdx,rbx
fffff807`e0f94769 488bcf          mov     rcx,rdi
fffff807`e0f9476c a808            test    al,8
fffff807`e0f9476e 7407            je      stornvme!ScsiToNVMe+0x957 (fffff807`e0f94777)  Branch

stornvme!ScsiToNVMe+0x950:
fffff807`e0f94770 e87b000000      call    stornvme!MdlToPrp (fffff807`e0f947f0)
fffff807`e0f94775 eb05            jmp     stornvme!ScsiToNVMe+0x95c (fffff807`e0f9477c)  Branch

stornvme!ScsiToNVMe+0x957:
fffff807`e0f94777 e8e4fd0000      call    stornvme!SglToPrp (fffff807`e0fa4560)

stornvme!ScsiToNVMe+0x95c:
fffff807`e0f9477c 85c0            test    eax,eax
fffff807`e0f9477e 7406            je      stornvme!ScsiToNVMe+0x966 (fffff807`e0f94786)  Branch

stornvme!ScsiToNVMe+0x960:
fffff807`e0f94780 ff87c00e0000    inc     dword ptr [rdi+0EC0h]     ;DevExt->inflight? or ???

stornvme!ScsiToNVMe+0x966:
fffff807`e0f94786 448bf0          mov     r14d,eax
fffff807`e0f94789 85c0            test    eax,eax
fffff807`e0f9478b 7515            jne     stornvme!ScsiToNVMe+0x982 (fffff807`e0f947a2)  Branch

stornvme!ScsiToNVMe+0x96d:
fffff807`e0f9478d 4584e4          test    r12b,r12b
fffff807`e0f94790 7414            je      stornvme!ScsiToNVMe+0x986 (fffff807`e0f947a6)  Branch

stornvme!ScsiToNVMe+0x972:
fffff807`e0f94792 488bd3          mov     rdx,rbx
fffff807`e0f94795 488bcf          mov     rcx,rdi
fffff807`e0f94798 e893e50000      call    stornvme!NVMeSplitIoCommand (fffff807`e0fa2d30)
fffff807`e0f9479d 418bc6          mov     eax,r14d
fffff807`e0f947a0 eb1b            jmp     stornvme!ScsiToNVMe+0x99d (fffff807`e0f947bd)  Branch

stornvme!ScsiToNVMe+0x982:
fffff807`e0f947a2 c6430304        mov     byte ptr [rbx+3],4

stornvme!ScsiToNVMe+0x986:
fffff807`e0f947a6 418bc6          mov     eax,r14d
fffff807`e0f947a9 eb12            jmp     stornvme!ScsiToNVMe+0x99d (fffff807`e0f947bd)  Branch

stornvme!ScsiToNVMe+0x98b:
fffff807`e0f947ab 41b120          mov     r9b,20h

stornvme!ScsiToNVMe+0x98e:
fffff807`e0f947ae b208            mov     dl,8
fffff807`e0f947b0 488bcb          mov     rcx,rbx
fffff807`e0f947b3 e81c610000      call    stornvme!NVMeSetSenseData (fffff807`e0f9a8d4)
fffff807`e0f947b8 b8070000c1      mov     eax,0C1000007h

stornvme!ScsiToNVMe+0x99d:
fffff807`e0f947bd 488b4d1f        mov     rcx,qword ptr [rbp+1Fh]
fffff807`e0f947c1 4833cc          xor     rcx,rsp
fffff807`e0f947c4 e8f71d0000      call    stornvme!_security_check_cookie (fffff807`e0f965c0)
fffff807`e0f947c9 4881c4c0000000  add     rsp,0C0h
fffff807`e0f947d0 415f            pop     r15
fffff807`e0f947d2 415e            pop     r14
fffff807`e0f947d4 415c            pop     r12
fffff807`e0f947d6 5f              pop     rdi
fffff807`e0f947d7 5e              pop     rsi
fffff807`e0f947d8 5b              pop     rbx
fffff807`e0f947d9 5d              pop     rbp
fffff807`e0f947da c3              ret
