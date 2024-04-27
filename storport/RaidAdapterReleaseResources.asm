0: kd> UF RaidAdapterReleaseResources
storport!RaidAdapterReleaseResources:
fffff802`e1bc2d3c 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff802`e1bc2d41 48897c2418      mov     qword ptr [rsp+18h],rdi
fffff802`e1bc2d46 4156            push    r14
fffff802`e1bc2d48 4883ec30        sub     rsp,30h
fffff802`e1bc2d4c 4883b92801000000 cmp     qword ptr [rcx+128h],0
fffff802`e1bc2d54 488bd9          mov     rbx,rcx
fffff802`e1bc2d57 7422            je      storport!RaidAdapterReleaseResources+0x3f (fffff802`e1bc2d7b)  Branch

storport!RaidAdapterReleaseResources+0x1d:
fffff802`e1bc2d59 f6416d20        test    byte ptr [rcx+6Dh],20h
fffff802`e1bc2d5d 741c            je      storport!RaidAdapterReleaseResources+0x3f (fffff802`e1bc2d7b)  Branch

storport!RaidAdapterReleaseResources+0x23:
fffff802`e1bc2d5f 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff802`e1bc2d66 4533c9          xor     r9d,r9d
fffff802`e1bc2d69 8364242000      and     dword ptr [rsp+20h],0
fffff802`e1bc2d6e 488b4908        mov     rcx,qword ptr [rcx+8]
fffff802`e1bc2d72 0fb65001        movzx   edx,byte ptr [rax+1]
fffff802`e1bc2d76 e8f912faff      call    storport!RaidPnPPassToMiniPort (fffff802`e1b64074)    //call 

storport!RaidAdapterReleaseResources+0x3f:
fffff802`e1bc2d7b 488b8b90160000  mov     rcx,qword ptr [rbx+1690h]
fffff802`e1bc2d82 4885c9          test    rcx,rcx       ;if (AdapterExt->PowerWorkItem->WorkItem) IoFreeWorkItem(AdapterExtension->PowerWorkItem);
fffff802`e1bc2d85 7414            je      storport!RaidAdapterReleaseResources+0x5f (fffff802`e1bc2d9b)  Branch

storport!RaidAdapterReleaseResources+0x4b:
fffff802`e1bc2d87 48ff158234ffff  call    qword ptr [storport!_imp_IoFreeWorkItem (fffff802`e1bb6210)]
fffff802`e1bc2d8e 0f1f440000      nop     dword ptr [rax+rax]
fffff802`e1bc2d93 4883a39016000000 and     qword ptr [rbx+1690h],0      ;AdapterExtension->PowerWorkItem = NULL;

storport!RaidAdapterReleaseResources+0x5f:
fffff802`e1bc2d9b 488bcb          mov     rcx,rbx
fffff802`e1bc2d9e e895eefcff      call    storport!RaAdapterDeregisterFromIdleDetection (fffff802`e1b91c38)
fffff802`e1bc2da3 488b8b60150000  mov     rcx,qword ptr [rbx+1560h]
fffff802`e1bc2daa 4885c9          test    rcx,rcx
fffff802`e1bc2dad 7419            je      storport!RaidAdapterReleaseResources+0x8c (fffff802`e1bc2dc8)  Branch ;if(NULL==AdapterExtension->D3ColdInterface) goto 0x8c

storport!RaidAdapterReleaseResources+0x73:
fffff802`e1bc2daf ba52615057      mov     edx,57506152h
fffff802`e1bc2db4 48ff157534ffff  call    qword ptr [storport!_imp_ExFreePoolWithTag (fffff802`e1bb6230)] ;free D3ColdInterface
fffff802`e1bc2dbb 0f1f440000      nop     dword ptr [rax+rax]
fffff802`e1bc2dc0 4883a36015000000 and     qword ptr [rbx+1560h],0  ;D3ColdInterface = NULL;

storport!RaidAdapterReleaseResources+0x8c:
fffff802`e1bc2dc8 488bcb          mov     rcx,rbx
fffff802`e1bc2dcb e89441fcff      call    storport!RaidAdapterDeleteAsyncCallbacks (fffff802`e1b86f64)
fffff802`e1bc2dd0 4c8d442440      lea     r8,[rsp+40h]
fffff802`e1bc2dd5 48c7442440806967ff mov   qword ptr [rsp+40h],0FFFFFFFFFF676980h   ;-10000000 ticks => 1second
fffff802`e1bc2dde 33d2            xor     edx,edx
fffff802`e1bc2de0 33c9            xor     ecx,ecx
fffff802`e1bc2de2 48ff153732ffff  call    qword ptr [storport!_imp_KeDelayExecutionThread (fffff802`e1bb6020)]  ;sleep 1 second
fffff802`e1bc2de9 0f1f440000      nop     dword ptr [rax+rax]
fffff802`e1bc2dee 488bcb          mov     rcx,rbx
fffff802`e1bc2df1 e8da39faff      call    storport!RaidAdapterStop (fffff802`e1b667d0)      ;stop the adapter, call to NVMeHwAdapterControl()
fffff802`e1bc2df6 33ff            xor     edi,edi
fffff802`e1bc2df8 4c8d3501d2feff  lea     r14,[storport!WPP_GLOBAL_Control (fffff802`e1bb0000)]

storport!RaidAdapterReleaseResources+0xc3:
fffff802`e1bc2dff 83bb7813000000  cmp     dword ptr [rbx+1378h],0       ;rbx == adapter extension, if (NumWorkItems>0) goto 0xd5
fffff802`e1bc2e06 7709            ja      storport!RaidAdapterReleaseResources+0xd5 (fffff802`e1bc2e11)  Branch

storport!RaidAdapterReleaseResources+0xcc:
fffff802`e1bc2e08 83bb7010000000  cmp     dword ptr [rbx+1070h],0       ;if (AdditionalTimers <= 0) goto 0x130 , AdditionalTimers decreased when call to StorpFreeTimer()
fffff802`e1bc2e0f 765b            jbe     storport!RaidAdapterReleaseResources+0x130 (fffff802`e1bc2e6c)  Branch

storport!RaidAdapterReleaseResources+0xd5:
fffff802`e1bc2e11 83ff32          cmp     edi,32h           ;???
fffff802`e1bc2e14 732e            jae     storport!RaidAdapterReleaseResources+0x108 (fffff802`e1bc2e44)  Branch

storport!RaidAdapterReleaseResources+0xda:
fffff802`e1bc2e16 488b0de3d1feff  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff802`e1bb0000)]
fffff802`e1bc2e1d 493bce          cmp     rcx,r14
fffff802`e1bc2e20 7422            je      storport!RaidAdapterReleaseResources+0x108 (fffff802`e1bc2e44)  Branch

storport!RaidAdapterReleaseResources+0xe6:
fffff802`e1bc2e22 8b412c          mov     eax,dword ptr [rcx+2Ch]       ;what is RCX?
fffff802`e1bc2e25 a802            test    al,2
fffff802`e1bc2e27 741b            je      storport!RaidAdapterReleaseResources+0x108 (fffff802`e1bc2e44)  Branch

storport!RaidAdapterReleaseResources+0xed:
fffff802`e1bc2e29 80792904        cmp     byte ptr [rcx+29h],4
fffff802`e1bc2e2d 7215            jb      storport!RaidAdapterReleaseResources+0x108 (fffff802`e1bc2e44)  Branch

storport!RaidAdapterReleaseResources+0xf3:
fffff802`e1bc2e2f 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff802`e1bc2e33 4c8d054e67feff  lea     r8,[storport!WPP_7d46767ce9ae350e9ff383a597919e06_Traceguids (fffff802`e1ba9588)]
fffff802`e1bc2e3a ba1b000000      mov     edx,1Bh
fffff802`e1bc2e3f e8e082fcff      call    storport!WPP_SF_ (fffff802`e1b8b124)      ;ETW?

storport!RaidAdapterReleaseResources+0x108:
fffff802`e1bc2e44 4c8d442440      lea     r8,[rsp+40h]
fffff802`e1bc2e49 48c7442440c0bdf0ff mov   qword ptr [rsp+40h],0FFFFFFFFFFF0BDC0h       ;-1000000 => 100ms
fffff802`e1bc2e52 33d2            xor     edx,edx
fffff802`e1bc2e54 33c9            xor     ecx,ecx
fffff802`e1bc2e56 48ff15c331ffff  call    qword ptr [storport!_imp_KeDelayExecutionThread (fffff802`e1bb6020)]
fffff802`e1bc2e5d 0f1f440000      nop     dword ptr [rax+rax]
fffff802`e1bc2e62 ffc7            inc     edi
fffff802`e1bc2e64 81ff58020000    cmp     edi,258h                      ;for (int i=0;i<600;i++) KeDelayExecutionThread(100ms);  => wait 60 seconds
fffff802`e1bc2e6a 7293            jb      storport!RaidAdapterReleaseResources+0xc3 (fffff802`e1bc2dff)  Branch

storport!RaidAdapterReleaseResources+0x130:
fffff802`e1bc2e6c 81ff58020000    cmp     edi,258h      ;if edi < 600, goto 0x166
fffff802`e1bc2e72 722e            jb      storport!RaidAdapterReleaseResources+0x166 (fffff802`e1bc2ea2)  Branch

storport!RaidAdapterReleaseResources+0x138:
fffff802`e1bc2e74 488b0d85d1feff  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff802`e1bb0000)]
fffff802`e1bc2e7b 493bce          cmp     rcx,r14
fffff802`e1bc2e7e 7422            je      storport!RaidAdapterReleaseResources+0x166 (fffff802`e1bc2ea2)  Branch

storport!RaidAdapterReleaseResources+0x144:
fffff802`e1bc2e80 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff802`e1bc2e83 a802            test    al,2
fffff802`e1bc2e85 741b            je      storport!RaidAdapterReleaseResources+0x166 (fffff802`e1bc2ea2)  Branch

storport!RaidAdapterReleaseResources+0x14b:
fffff802`e1bc2e87 80792902        cmp     byte ptr [rcx+29h],2
fffff802`e1bc2e8b 7215            jb      storport!RaidAdapterReleaseResources+0x166 (fffff802`e1bc2ea2)  Branch

storport!RaidAdapterReleaseResources+0x151:
fffff802`e1bc2e8d 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff802`e1bc2e91 4c8d05f066feff  lea     r8,[storport!WPP_7d46767ce9ae350e9ff383a597919e06_Traceguids (fffff802`e1ba9588)]
fffff802`e1bc2e98 ba1c000000      mov     edx,1Ch
fffff802`e1bc2e9d e88282fcff      call    storport!WPP_SF_ (fffff802`e1b8b124)

storport!RaidAdapterReleaseResources+0x166:
fffff802`e1bc2ea2 448a8362110000  mov     r8b,byte ptr [rbx+1162h]
fffff802`e1bc2ea9 488d8b40030000  lea     rcx,[rbx+340h]
fffff802`e1bc2eb0 488b5308        mov     rdx,qword ptr [rbx+8]
fffff802`e1bc2eb4 e89f88fdff      call    storport!RaFreeRaidResources (fffff802`e1b9b758)
fffff802`e1bc2eb9 488d8bf8020000  lea     rcx,[rbx+2F8h]
fffff802`e1bc2ec0 e81b27fdff      call    storport!RaidFreeMappingList (fffff802`e1b955e0)
fffff802`e1bc2ec5 488b5c2448      mov     rbx,qword ptr [rsp+48h]
fffff802`e1bc2eca 488b7c2450      mov     rdi,qword ptr [rsp+50h]
fffff802`e1bc2ecf 4883c430        add     rsp,30h
fffff802`e1bc2ed3 415e            pop     r14
fffff802`e1bc2ed5 c3              ret
