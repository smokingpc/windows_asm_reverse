stornvme!NVMeHwBuildIo:
fffff807`e0f93d20 4889742420      mov     qword ptr [rsp+20h],rsi
fffff807`e0f93d25 57              push    rdi
fffff807`e0f93d26 4883ec30        sub     rsp,30h
fffff807`e0f93d2a 807a0228        cmp     byte ptr [rdx+2],28h  
fffff807`e0f93d2e 488bfa          mov     rdi,rdx
fffff807`e0f93d31 488bf1          mov     rsi,rcx

;===>這段(包括stornvme!NVMeHwBuildIo+0x5cd4那段)就 SrbGetSrbExtension(Srb) 的inline
;if (srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK),  goto 0x5cd4 (get SrbExtension from _SCSI_REQUEST_BLOCK)
fffff807`e0f93d34 0f85ba5c0000    jne     stornvme!NVMeHwBuildIo+0x5cd4 (fffff807`e0f999f4)
stornvme!NVMeHwBuildIo+0x1a:
fffff807`e0f93d3a 488b4a68        mov     rcx,qword ptr [rdx+68h]   ;RCX = Srb->MiniportContext
;<===

;===> init SRB Extension
stornvme!NVMeHwBuildIo+0x1e:
fffff807`e0f93d3e 488bc1          mov     rax,rcx
fffff807`e0f93d41 25ff0f0000      and     eax,0FFFh     ;if RCX is PAGE_ALIGNED, goto 0x32 => Get PAGE_ALIGNED addr of SrbExtension
fffff807`e0f93d46 740a            je      stornvme!NVMeHwBuildIo+0x32 (fffff807`e0f93d52)  Branch

stornvme!NVMeHwBuildIo+0x28:
fffff807`e0f93d48 482bc8          sub     rcx,rax
fffff807`e0f93d4b 4881c100100000  add     rcx,1000h     ;get next PAGE_ALIGNED boundary address from current SRBEXT

stornvme!NVMeHwBuildIo+0x32:
fffff807`e0f93d52 4881c100100000  add     rcx,1000h     ;get next PAGE addr of SrbExt
fffff807`e0f93d59 33d2            xor     edx,edx
fffff807`e0f93d5b 41b8a0000000    mov     r8d,0A0h
fffff807`e0f93d61 e89a430000      call    stornvme!memset (fffff807`e0f98100)   ;memset (RCX, 0, 0xA0)
fffff807`e0f93d66 0fb65702        movzx   edx,byte ptr [rdi+2]
fffff807`e0f93d6a 80fa28          cmp     dl,28h     ;if (srb->Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK),  goto 0x5cdd
fffff807`e0f93d6d 0f858a5c0000    jne     stornvme!NVMeHwBuildIo+0x5cdd (fffff807`e0f999fd)  Branch

stornvme!NVMeHwBuildIo+0x53:
fffff807`e0f93d73 8b4714          mov     eax,dword ptr [rdi+14h]   ;EAX == Srb->SrbFunction

stornvme!NVMeHwBuildIo+0x56:
fffff807`e0f93d76 48895c2448      mov     qword ptr [rsp+48h],rbx
fffff807`e0f93d7b 4c89742450      mov     qword ptr [rsp+50h],r14   ;should be push regs....
fffff807`e0f93d80 85c0            test    eax,eax                   ;if (Function != SRB_FUNCTION_EXECUTE_SCSI) goto 0xb8
fffff807`e0f93d82 7554            jne     stornvme!NVMeHwBuildIo+0xb8 (fffff807`e0f93dd8)  Branch

stornvme!NVMeHwBuildIo+0x64:
fffff807`e0f93d84 8b4614          mov     eax,dword ptr [rsi+14h]   ;HwExtension+0x14
fffff807`e0f93d87 a801            test    al,1      ;(猜測) if(DevExt->RejectCmd()) goto 0x60c7
fffff807`e0f93d89 0f8458600000    je      stornvme!NVMeHwBuildIo+0x60c7 (fffff807`e0f99de7)  Branch

stornvme!NVMeHwBuildIo+0x6f:
fffff807`e0f93d8f 488bd7          mov     rdx,rdi       ;Srb
fffff807`e0f93d92 488bce          mov     rcx,rsi       ;HBAExtension
fffff807`e0f93d95 e886000000      call    stornvme!ScsiToNVMe (fffff807`e0f93e20)

stornvme!NVMeHwBuildIo+0x7a:
fffff807`e0f93d9a 807f0300        cmp     byte ptr [rdi+3],0
fffff807`e0f93d9e 4c8b742450      mov     r14,qword ptr [rsp+50h]
fffff807`e0f93da3 488b5c2448      mov     rbx,qword ptr [rsp+48h]
fffff807`e0f93da8 750d            jne     stornvme!NVMeHwBuildIo+0x97 (fffff807`e0f93db7)  ;if(Srb->SrbStatus != SRB_STATUS_PENDING) goto 0x97

stornvme!NVMeHwBuildIo+0x8a:
fffff807`e0f93daa b001            mov     al,1
fffff807`e0f93dac 488b742458      mov     rsi,qword ptr [rsp+58h]
fffff807`e0f93db1 4883c430        add     rsp,30h
fffff807`e0f93db5 5f              pop     rdi
fffff807`e0f93db6 c3              ret

stornvme!NVMeHwBuildIo+0x97:
fffff807`e0f93db7 4c8bc7          mov     r8,rdi
fffff807`e0f93dba 488bd6          mov     rdx,rsi
fffff807`e0f93dbd 33c9            xor     ecx,ecx
fffff807`e0f93dbf 48ff154ac20100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff807`e0fb0010)]    ;complete this convert (ScsiToNvme) failed SRB
fffff807`e0f93dc6 0f1f440000      nop     dword ptr [rax+rax]
fffff807`e0f93dcb 488b742458      mov     rsi,qword ptr [rsp+58h]
fffff807`e0f93dd0 32c0            xor     al,al
fffff807`e0f93dd2 4883c430        add     rsp,30h
fffff807`e0f93dd6 5f              pop     rdi
fffff807`e0f93dd7 c3              ret

stornvme!NVMeHwBuildIo+0xb8:
fffff807`e0f93dd8 83c0fe          add     eax,0FFFFFFFEh
fffff807`e0f93ddb 83f829          cmp     eax,29h
fffff807`e0f93dde 77ba            ja      stornvme!NVMeHwBuildIo+0x7a (fffff807`e0f93d9a)  Branch


;switch case to handle different SRB_FUNCTION_* cmds
stornvme!NVMeHwBuildIo+0xc0:
fffff807`e0f93de0 4c8d0519c2ffff  lea     r8,[stornvme!  <PERF> (stornvme+0x0) (fffff807`e0f90000)]
fffff807`e0f93de7 418b8c805cb50100 mov     ecx,dword ptr [r8+rax*4+1B55Ch]
fffff807`e0f93def 4903c8          add     rcx,r8
fffff807`e0f93df2 ffe1            jmp     rcx

stornvme!NVMeHwBuildIo+0x5cd4:
fffff807`e0f999f4 488b4a38        mov     rcx,qword ptr [rdx+38h]       ;RCX = _SCSI_REQUEST_BLOCK::SrbExtension
fffff807`e0f999f8 e941a3ffff      jmp     stornvme!NVMeHwBuildIo+0x1e (fffff807`e0f93d3e)  Branch

stornvme!NVMeHwBuildIo+0x5cdd:
fffff807`e0f999fd 0fb6c2          movzx   eax,dl
fffff807`e0f99a00 e971a3ffff      jmp     stornvme!NVMeHwBuildIo+0x56 (fffff807`e0f93d76)  Branch

stornvme!NVMeHwBuildIo+0x60c7:
fffff807`e0f99de7 41b120          mov     r9b,20h
fffff807`e0f99dea b208            mov     dl,8
fffff807`e0f99dec 488bcf          mov     rcx,rdi
fffff807`e0f99def e8e00a0000      call    stornvme!NVMeSetSenseData (fffff807`e0f9a8d4)
fffff807`e0f99df4 90              nop
fffff807`e0f99df5 e9a09fffff      jmp     stornvme!NVMeHwBuildIo+0x7a (fffff807`e0f93d9a)  Branch
