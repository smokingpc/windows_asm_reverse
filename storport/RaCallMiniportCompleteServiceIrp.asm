1: kd> uf storport!RaCallMiniportCompleteServiceIrp
storport!RaCallMiniportCompleteServiceIrp:
fffff809`efc39b7c 4883ec28        sub     rsp,28h
fffff809`efc39b80 4c8b8118020000  mov     r8,qword ptr [rcx+218h]
fffff809`efc39b87 4d85c0          test    r8,r8             ;if (NULL == AdapterExt->Miniport.PrivateDeviceExt) goto 0x44 (return)
fffff809`efc39b8a 7434            je      storport!RaCallMiniportCompleteServiceIrp+0x44 (fffff809`efc39bc0)  Branch

storport!RaCallMiniportCompleteServiceIrp+0x10:
fffff809`efc39b8c 488b9110020000  mov     rdx,qword ptr [rcx+210h]
fffff809`efc39b93 4885d2          test    rdx,rdx             ;if (NULL == AdapterExt->Miniport.HwInitializationData) goto 0x44 (return)
fffff809`efc39b96 7428            je      storport!RaCallMiniportCompleteServiceIrp+0x44 (fffff809`efc39bc0)  Branch

storport!RaCallMiniportCompleteServiceIrp+0x1c:
fffff809`efc39b98 80b96211000000  cmp     byte ptr [rcx+1162h],0    ;if(AdapterExt->Contiguous != FALSE) goto 0x44 (return)
fffff809`efc39b9f 751f            jne     storport!RaCallMiniportCompleteServiceIrp+0x44 (fffff809`efc39bc0)  Branch

storport!RaCallMiniportCompleteServiceIrp+0x25:
fffff809`efc39ba1 f6812002000004  test    byte ptr [rcx+220h],4     ;if(!AdapterExt->Miniport.Flags.IsVirtual) goto 0x44 (return)
fffff809`efc39ba8 7416            je      storport!RaCallMiniportCompleteServiceIrp+0x44 (fffff809`efc39bc0)  Branch

storport!RaCallMiniportCompleteServiceIrp+0x2e:
fffff809`efc39baa 488b8298000000  mov     rax,qword ptr [rdx+98h]
fffff809`efc39bb1 4885c0          test    rax,rax              ;if(HwInitializationData.HwCompleteServiceIrp == NULL) goto 0x44 (return)
fffff809`efc39bb4 740a            je      storport!RaCallMiniportCompleteServiceIrp+0x44 (fffff809`efc39bc0)  Branch

storport!RaCallMiniportCompleteServiceIrp+0x3a:
fffff809`efc39bb6 498d4810        lea     rcx,[r8+10h]
fffff809`efc39bba ff1518ac0200    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff809`efc647d8)]

storport!RaCallMiniportCompleteServiceIrp+0x44:
fffff809`efc39bc0 4883c428        add     rsp,28h
fffff809`efc39bc4 c3              ret
