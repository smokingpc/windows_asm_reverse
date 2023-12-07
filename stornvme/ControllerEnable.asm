3: kd> uf stornvme!ControllerEnable
stornvme!ControllerEnable:
fffff809`6956b7a4 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff809`6956b7a9 4889742420      mov     qword ptr [rsp+20h],rsi
fffff809`6956b7ae 57              push    rdi
fffff809`6956b7af 4883ec20        sub     rsp,20h
fffff809`6956b7b3 33c0            xor     eax,eax
fffff809`6956b7b5 488bf9          mov     rdi,rcx                   ;rcx == Device Extension
fffff809`6956b7b8 89442430        mov     dword ptr [rsp+30h],eax
fffff809`6956b7bc b8cdcccccc      mov     eax,0CCCCCCCDh
fffff809`6956b7c1 f7a1a4000000    mul     eax,dword ptr [rcx+0A4h]
fffff809`6956b7c7 488b8188000000  mov     rax,qword ptr [rcx+88h]   ;Load PNVME_CONTROLLER_REGISTERS to rax
fffff809`6956b7ce 8bf2            mov     esi,edx
fffff809`6956b7d0 c1ee03          shr     esi,3
fffff809`6956b7d3 8b4014          mov     eax,dword ptr [rax+14h]   ;read CC to eax
fffff809`6956b7d6 488b8988000000  mov     rcx,qword ptr [rcx+88h]   ;load PNVME_CONTROLLER_REGISTERS to rcx
fffff809`6956b7dd 89442438        mov     dword ptr [rsp+38h],eax   ;copy CC to rsp+38
fffff809`6956b7e1 83c801          or      eax,1
fffff809`6956b7e4 89442438        mov     dword ptr [rsp+38h],eax   ;set CC.EN = 1
fffff809`6956b7e8 33db            xor     ebx,ebx                   ;set EBX to 0, use it as loop i
fffff809`6956b7ea 894114          mov     dword ptr [rcx+14h],eax   ;writeback back to CC registers
fffff809`6956b7ed f0091c24        lock or dword ptr [rsp],ebx
fffff809`6956b7f1 488b8788000000  mov     rax,qword ptr [rdi+88h]   ;load PNVME_CONTROLLER_REGISTERS to rax
fffff809`6956b7f8 eb1e            jmp     stornvme!ControllerEnable+0x74 (fffff809`6956b818)  Branch

stornvme!ControllerEnable+0x56:
fffff809`6956b7fa 3bde            cmp     ebx,esi
fffff809`6956b7fc 7325            jae     stornvme!ControllerEnable+0x7f (fffff809`6956b823)  Branch

stornvme!ControllerEnable+0x5a:
fffff809`6956b7fe b910270000      mov     ecx,2710h     ;sleep 10000 microseconds
fffff809`6956b803 48ff1536480100  call    qword ptr [stornvme!_imp_StorPortStallExecution (fffff809`69580040)]
fffff809`6956b80a 0f1f440000      nop     dword ptr [rax+rax]
fffff809`6956b80f 488b8788000000  mov     rax,qword ptr [rdi+88h]
fffff809`6956b816 ffc3            inc     ebx

stornvme!ControllerEnable+0x74:
fffff809`6956b818 8b401c          mov     eax,dword ptr [rax+1Ch]   ;load CTCS to eax
fffff809`6956b81b 89442430        mov     dword ptr [rsp+30h],eax
fffff809`6956b81f a801            test    al,1                      ;if CTCS.RDY != 1 goto 0x56
fffff809`6956b821 74d7            je      stornvme!ControllerEnable+0x56 (fffff809`6956b7fa)  Branch

stornvme!ControllerEnable+0x7f:
fffff809`6956b823 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff809`6956b828 2401            and     al,1
fffff809`6956b82a 488b742448      mov     rsi,qword ptr [rsp+48h]
fffff809`6956b82f 4883c420        add     rsp,20h
fffff809`6956b833 5f              pop     rdi
fffff809`6956b834 c3              ret
