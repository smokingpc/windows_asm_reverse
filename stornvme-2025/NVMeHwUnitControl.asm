3: kd> uf NVMeHwUnitControl
Flow analysis was incomplete, some code may be missing
stornvme!NVMeHwUnitControl:
fffff804`3c490860 4057            push    rdi
fffff804`3c490862 4883ec20        sub     rsp,20h
fffff804`3c490866 498bf8          mov     rdi,r8
fffff804`3c490869 4c8bc9          mov     r9,rcx
fffff804`3c49086c 4885c9          test    rcx,rcx
fffff804`3c49086f 740c            je      stornvme!NVMeHwUnitControl+0x1d (fffff804`3c49087d)  Branch

stornvme!NVMeHwUnitControl+0x11:
fffff804`3c490871 f781380f000000100000 test dword ptr [rcx+0F38h],1000h
fffff804`3c49087b 7528            jne     stornvme!NVMeHwUnitControl+0x45 (fffff804`3c4908a5)  Branch

;   switch(ControlType)
;   0:ScsiQuerySupportedUnitControlTypes
;   2:ScsiUnitStart
;   9:ScsiUnitRemove
;   10:ScsiUnitSurpriseRemoval
;
;


stornvme!NVMeHwUnitControl+0x1d:
fffff804`3c49087d 48895c2430      mov     qword ptr [rsp+30h],rbx
fffff804`3c490882 4889742438      mov     qword ptr [rsp+38h],rsi
fffff804`3c490887 83fa03          cmp     edx,3     ;if (3rd arg != ScsiUnitPower) goto 0x22fce
fffff804`3c49088a 0f859e2f0200    jne     stornvme!NVMeHwUnitControl+0x22fce (fffff804`3c4b382e)  Branch
                                            ;bypass ScsiUnitPower ?
stornvme!NVMeHwUnitControl+0x30:
fffff804`3c490890 33db            xor     ebx,ebx

stornvme!NVMeHwUnitControl+0x32:
fffff804`3c490892 488b742438      mov     rsi,qword ptr [rsp+38h]
fffff804`3c490897 8bc3            mov     eax,ebx
fffff804`3c490899 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff804`3c49089e 4883c420        add     rsp,20h
fffff804`3c4908a2 5f              pop     rdi
fffff804`3c4908a3 c3              ret

stornvme!NVMeHwUnitControl+0x45:
fffff804`3c4908a5 33c0            xor     eax,eax
fffff804`3c4908a7 4883c420        add     rsp,20h
fffff804`3c4908ab 5f              pop     rdi
fffff804`3c4908ac c3              ret

stornvme!NVMeHwUnitControl+0x22fce:
fffff804`3c4b382e 83fa1f          cmp     edx,1Fh   ;if(ControlType>0x1F) return ScsiUnitControlUnsuccessful;
fffff804`3c4b3831 0f87e1000000    ja      stornvme!NVMeHwUnitControl+0x230b8 (fffff804`3c4b3918)  Branch


;=>according this SCSI_UNIT_CONTROL_TYPE dispatch table, 
; stornvme only accept following SCSI_UNIT_CONTROL_TYPE :
;    ScsiQuerySupportedUnitControlTypes,
;    ScsiUnitUsage,
;    ScsiUnitStart,
;    ScsiUnitRemove,
;    ScsiUnitSurpriseRemoval,
;    ScsiUnitRichDescription,
;    ScsiUnitQueryFruId,
;    0x0E (new code),
;    0x1E (new code),
;    0x1F (new code),  <= could be new I/O path

;3: kd> db fffff804`3c480000+3a59e
;fffff804`3c4ba59e  00 01 02 0a 0a 0a 0a 0a-0a 03 04 05 0a 06 07 0a  ................
;fffff804`3c4ba5ae  0a 0a 0a 0a 0a 0a 0a 0a-0a 0a 0a 0a 0a 0a 08 09  ................
;fffff804`3c4ba5be  5b 1d 00 00 47 1d 00 00-91 1b 00 00 cb 1d 00 00  [...G...........
;fffff804`3c4ba5ce  cb 1d 00 00 f8 1d 00 00-db 1b 00 00 cb 1d 00 00  ................
;fffff804`3c4ba5de  cb 1d 00 00 ce 1b 00 00-cb 1d 00 00 cb 1d 00 00  ................
;fffff804`3c4ba5ee  37 1d 00 00 b5 1d 00 00-80 1d 00 00 90 1d 00 00  7...............
;fffff804`3c4ba5fe  d5 1d 00 00 08 1e 00 00-cb 1d 00 00 d4 e8 02 00  ................
;fffff804`3c4ba60e  1a 1e 00 00 48 1e 00 00-96 1e 00 00 7e 1e 00 00  ....H.......~...


;=>this table has 12 entries valid for unit control...
;3: kd> dd fffff804`3c480000+3a572
;fffff804`3c4ba572  00033859 000338d2 000338fb 00033922
;fffff804`3c4ba582  00033941 0003396e 00033985 000339d4
;fffff804`3c4ba592  00033a1a 00033a43 00033918 0a020100
;fffff804`3c4ba5a2  0a0a0a0a 0504030a 0a07060a 0a0a0a0a
;fffff804`3c4ba5b2  0a0a0a0a 0a0a0a0a 09080a0a 00001d5b
;fffff804`3c4ba5c2  00001d47 00001b91 00001dcb 00001dcb
;fffff804`3c4ba5d2  00001df8 00001bdb 00001dcb 00001dcb
;fffff804`3c4ba5e2  00001bce 00001dcb 00001dcb 00001d37
;3: kd> dd
;fffff804`3c4ba5f2  00001db5 00001d80 00001d90 00001dd5
;fffff804`3c4ba602  00001e08 00001dcb 0002e8d4 00001e1a
;fffff804`3c4ba612  00001e48 00001e96 00001e7e 0002e9b6
;fffff804`3c4ba622  00001ed0 00001f0d 00001f49 000117e5
;fffff804`3c4ba632  0001180c 00011822 0001183d 0001184d
;fffff804`3c4ba642  0001185d 00011879 00011889 000118ac
;fffff804`3c4ba652  000117ef 0001193d 000118e0 00011936
;fffff804`3c4ba662  000118e7 000118ed 03020100 07060504


stornvme!NVMeHwUnitControl+0x22fd7:
fffff804`3c4b3837 4863c2          movsxd  rax,edx   ;rax = rdx = SCSI_UNIT_CONTROL_TYPE ControlType
fffff804`3c4b383a 488d15bfc7fcff  lea     rdx,[stornvme!NVMeControllerRemove <PERF> (stornvme+0x0) (fffff804`3c480000)]
fffff804`3c4b3841 0fb684029ea50300 movzx   eax,byte ptr [rdx+rax+3A59Eh]    ;eax=fffff804`3c480000+3a59e[SCSI_UNIT_CONTROL_TYPE code]
fffff804`3c4b3849 8b8c8272a50300  mov     ecx,dword ptr [rdx+rax*4+3A572h]  ;ecx=
fffff804`3c4b3850 4803ca          add     rcx,rdx
fffff804`3c4b3853 ffe1            jmp     rcx
;since stornvme!NVMeHwUnitControl+0x22ff9 is a switch case block...

stornvme!NVMeHwUnitControl+0x230b8:
fffff804`3c4b3918 bb01000000      mov     ebx,1 ;ScsiUnitControlUnsuccessful
fffff804`3c4b391d e970cffdff      jmp     stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)  Branch




;[case ScsiQuerySupportedUnitControlTypes]
3: kd> u fffff804`3c480000+00033859
stornvme!NVMeHwUnitControl+0x22ff9:
fffff804`3c4b3859 418b00          mov     eax,dword ptr [r8]    ;eax = PSCSI_SUPPORTED_CONTROL_TYPE_LIST::MaxControlType
fffff804`3c4b385c 85c0            test    eax,eax
fffff804`3c4b385e 7405            je      stornvme!NVMeHwUnitControl+0x23005 (fffff804`3c4b3865)
fffff804`3c4b3860 41c6400401      mov     byte ptr [r8+4],1 ;if(MaxControlType > 0) SupportedTypeList[0] = TRUE;
fffff804`3c4b3865 83f801          cmp     eax,1
fffff804`3c4b3868 7605            jbe     stornvme!NVMeHwUnitControl+0x2300f (fffff804`3c4b386f)
fffff804`3c4b386a 41c6400501      mov     byte ptr [r8+5],1 ;if(MaxControlType >= ScsiUnitUsage) SupportedTypeList[ScsiUnitUsage] = TRUE;
fffff804`3c4b386f 83f802          cmp     eax,2
fffff804`3c4b3872 7605            jbe     stornvme!NVMeHwUnitControl+0x23019 (fffff804`3c4b3879)
fffff804`3c4b3874 41c6400601      mov     byte ptr [r8+6],1 ;if(MaxControlType >= ScsiUnitStart) SupportedTypeList[ScsiUnitStart] = TRUE;
fffff804`3c4b3879 83f803          cmp     eax,3
fffff804`3c4b387c 7605            jbe     stornvme!NVMeHwUnitControl+0x23023 (fffff804`3c4b3883)
fffff804`3c4b387e 41c6400701      mov     byte ptr [r8+7],1 ;if(MaxControlType >= ScsiUnitPower) SupportedTypeList[ScsiUnitPower] = TRUE;
fffff804`3c4b3883 83f809          cmp     eax,9
fffff804`3c4b3886 7605            jbe     stornvme!NVMeHwUnitControl+0x2302d (fffff804`3c4b388d)
fffff804`3c4b3888 41c6400d01      mov     byte ptr [r8+0Dh],1   ;if(MaxControlType >= ScsiUnitRemove) SupportedTypeList[ScsiUnitRemove] = TRUE;
fffff804`3c4b388d 83f80a          cmp     eax,0Ah
fffff804`3c4b3890 7605            jbe     stornvme!NVMeHwUnitControl+0x23037 (fffff804`3c4b3897)
fffff804`3c4b3892 41c6400e01      mov     byte ptr [r8+0Eh],1   ;if(MaxControlType >= ScsiUnitSurpriseRemoval) SupportedTypeList[ScsiUnitSurpriseRemoval] = TRUE;
fffff804`3c4b3897 83f80b          cmp     eax,0Bh
fffff804`3c4b389a 7605            jbe     stornvme!NVMeHwUnitControl+0x23041 (fffff804`3c4b38a1)
fffff804`3c4b389c 41c6400f01      mov     byte ptr [r8+0Fh],1   ;if(MaxControlType >= ScsiUnitRichDescription) SupportedTypeList[ScsiUnitRichDescription] = TRUE;
fffff804`3c4b38a1 83f80d          cmp     eax,0Dh
fffff804`3c4b38a4 7605            jbe     stornvme!NVMeHwUnitControl+0x2304b (fffff804`3c4b38ab)
fffff804`3c4b38a6 41c6401101      mov     byte ptr [r8+11h],1   ;if(MaxControlType >= ScsiUnitQueryFruId) SupportedTypeList[ScsiUnitQueryFruId] = TRUE;
fffff804`3c4b38ab 83f80e          cmp     eax,0Eh
fffff804`3c4b38ae 7605            jbe     stornvme!NVMeHwUnitControl+0x23055 (fffff804`3c4b38b5)
fffff804`3c4b38b0 41c6401201      mov     byte ptr [r8+12h],1   ;if(MaxControlType >= 0x0D) SupportedTypeList[0x0D] = TRUE;
fffff804`3c4b38b5 83f81e          cmp     eax,1Eh
fffff804`3c4b38b8 7605            jbe     stornvme!NVMeHwUnitControl+0x2305f (fffff804`3c4b38bf)
fffff804`3c4b38ba 41c6402201      mov     byte ptr [r8+22h],1   ;if(MaxControlType >= 0x1E) SupportedTypeList[0x1E] = TRUE;
fffff804`3c4b38bf 83f81f          cmp     eax,1Fh
fffff804`3c4b38c2 0f86c8cffdff    jbe     stornvme!NVMeHwUnitControl+0x30 (fffff804`3c490890)
fffff804`3c4b38c8 41c6402301      mov     byte ptr [r8+23h],1   ;if(MaxControlType >= 0x1F) SupportedTypeList[0x1F] = TRUE;
fffff804`3c4b38cd e9becffdff      jmp     stornvme!NVMeHwUnitControl+0x30 (fffff804`3c490890)   ;return ScsiUnitControlSuccess;

;[case SCSI_UNIT_CONTROL_TYPE 0x1E]
;3: kd> u fffff804`3c480000+000339d4
stornvme!NVMeHwUnitControl+0x23174:
fffff804`3c4b39d4 bb01000000      mov     ebx,1     ;ScsiUnitControlUnsuccessful
fffff804`3c4b39d9 4885ff          test    rdi,rdi
fffff804`3c4b39dc 0f84b0cefdff    je      stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)   ;if(3rd arg == NULL) return ScsiUnitControlUnsuccessful;
fffff804`3c4b39e2 4183780420      cmp     dword ptr [r8+4],20h
fffff804`3c4b39e7 0f82a5cefdff    jb      stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)
fffff804`3c4b39ed 41395810        cmp     dword ptr [r8+10h],ebx
fffff804`3c4b39f1 0f859bcefdff    jne     stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)
fffff804`3c4b39f7 498b4008        mov     rax,qword ptr [r8+8]
fffff804`3c4b39fb 498bc9          mov     rcx,r9            ;R9 == devext
fffff804`3c4b39fe 4d8b4018        mov     r8,qword ptr [r8+18h]     ;[R8+0x18] == IRP->Tail
fffff804`3c4b3a02 0fb6500a        movzx   edx,byte ptr [rax+0Ah]
fffff804`3c4b3a06 498b94d1e8050000 mov     rdx,qword ptr [r9+rdx*8+5E8h]
fffff804`3c4b3a0e e82193ffff      call    stornvme!NVMeSendLunInternalData (fffff804`3c4acd34)
fffff804`3c4b3a13 8bd8            mov     ebx,eax
fffff804`3c4b3a15 e978cefdff      jmp     stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)
fffff804`3c4b3a1a bb01000000      mov     ebx,1
fffff804`3c4b3a1f 4885ff          test    rdi,rdi
fffff804`3c4b3a22 0f846acefdff    je      stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)
fffff804`3c4b3a28 49833800        cmp     qword ptr [r8],0
fffff804`3c4b3a2c 0f8460cefdff    je      stornvme!NVMeHwUnitControl+0x32 (fffff804`3c490892)
fffff804`3c4b3a32 488bd7          mov     rdx,rdi   ;some structure contains IRP?
fffff804`3c4b3a35 498bc9          mov     rcx,r9    ;devext
fffff804`3c4b3a38 e883a8fdff      call    stornvme!ProcessIrpCommand (fffff804`3c48e2c0)
fffff804`3c4b3a3d 90              nop
fffff804`3c4b3a3e e94dcefdff      jmp     stornvme!NVMeHwUnitControl+0x30 (fffff804`3c490890)

;[case SCSI_UNIT_CONTROL_TYPE 0x1F]
00033a1a