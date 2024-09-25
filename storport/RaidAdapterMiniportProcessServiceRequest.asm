0: kd> uf RaidAdapterMiniportProcessServiceRequest
storport!RaidAdapterMiniportProcessServiceRequest:
fffff80a`52388510 48895c2408      mov     qword ptr [rsp+8],rbx
fffff80a`52388515 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff80a`5238851a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff80a`5238851f 57              push    rdi
fffff80a`52388520 4883ec40        sub     rsp,40h
fffff80a`52388524 488bf9          mov     rdi,rcx   ;AdapterExt
fffff80a`52388527 488bf2          mov     rsi,rdx   ;IRP
fffff80a`5238852a bbbb0000c0      mov     ebx,0C00000BBh
fffff80a`5238852f bd03010000      mov     ebp,103h
fffff80a`52388534 4881c138010000  add     rcx,138h  ;RCX = AdapterExt->Miniport
fffff80a`5238853b 744d            je      storport!RaidAdapterMiniportProcessServiceRequest+0x7a (fffff80a`5238858a)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0x2d:
fffff80a`5238853d 4c8b81e8000000  mov     r8,qword ptr [rcx+0E8h]   ;R8 = AdapterExt->Miniport->HwInitializeData
fffff80a`52388544 4d85c0          test    r8,r8
fffff80a`52388547 7441            je      storport!RaidAdapterMiniportProcessServiceRequest+0x7a (fffff80a`5238858a)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0x39:
fffff80a`52388549 80bfa211000000  cmp     byte ptr [rdi+11A2h],0    ;if AdapterExt->Contiguous != 0, goto 0x7a
fffff80a`52388550 7538            jne     storport!RaidAdapterMiniportProcessServiceRequest+0x7a (fffff80a`5238858a)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0x42:
fffff80a`52388552 f681f800000004  test    byte ptr [rcx+0F8h],4     ;if(!Miniport->Flags->IsVirtual) goto 0x7a
fffff80a`52388559 742f            je      storport!RaidAdapterMiniportProcessServiceRequest+0x7a (fffff80a`5238858a)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0x4b:
fffff80a`5238855b 4983b89000000000 cmp     qword ptr [r8+90h],0     ;check IPR->Tail.Overlay.DriverContext??
fffff80a`52388563 7425            je      storport!RaidAdapterMiniportProcessServiceRequest+0x7a (fffff80a`5238858a)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0x55:
fffff80a`52388565 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff80a`5238856c 80480301        or      byte ptr [rax+3],1
fffff80a`52388570 488b89f0000000  mov     rcx,qword ptr [rcx+0F0h]
fffff80a`52388577 498b8090000000  mov     rax,qword ptr [r8+90h]
fffff80a`5238857e 4883c110        add     rcx,10h
fffff80a`52388582 ff15a0f20200    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff80a`523b7828)]
fffff80a`52388588 8bdd            mov     ebx,ebp

storport!RaidAdapterMiniportProcessServiceRequest+0x7a:
fffff80a`5238858a 3bdd            cmp     ebx,ebp
fffff80a`5238858c 7472            je      storport!RaidAdapterMiniportProcessServiceRequest+0xf0 (fffff80a`52388600)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0x7e:
fffff80a`5238858e 488b86b8000000  mov     rax,qword ptr [rsi+0B8h]
fffff80a`52388595 448bc3          mov     r8d,ebx
fffff80a`52388598 33d2            xor     edx,edx
fffff80a`5238859a 488bce          mov     rcx,rsi
fffff80a`5238859d 8b6818          mov     ebp,dword ptr [rax+18h]
fffff80a`523885a0 e81b49fdff      call    storport!RaidCompleteRequestEx (fffff80a`5235cec0)
fffff80a`523885a5 488b8f10010000  mov     rcx,qword ptr [rdi+110h]
fffff80a`523885ac 8bd8            mov     ebx,eax
fffff80a`523885ae 48ff15dbec0200  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff80a`523b7290)]
fffff80a`523885b5 0f1f440000      nop     dword ptr [rax+rax]
fffff80a`523885ba 488b0d3f8a0200  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80a`523b1000)]
fffff80a`523885c1 488d05388a0200  lea     rax,[storport!WPP_GLOBAL_Control (fffff80a`523b1000)]
fffff80a`523885c8 483bc8          cmp     rcx,rax
fffff80a`523885cb 7433            je      storport!RaidAdapterMiniportProcessServiceRequest+0xf0 (fffff80a`52388600)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0xbd:
fffff80a`523885cd 8b512c          mov     edx,dword ptr [rcx+2Ch]
fffff80a`523885d0 f6c210          test    dl,10h
fffff80a`523885d3 742b            je      storport!RaidAdapterMiniportProcessServiceRequest+0xf0 (fffff80a`52388600)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0xc5:
fffff80a`523885d5 80792904        cmp     byte ptr [rcx+29h],4
fffff80a`523885d9 7225            jb      storport!RaidAdapterMiniportProcessServiceRequest+0xf0 (fffff80a`52388600)  Branch

storport!RaidAdapterMiniportProcessServiceRequest+0xcb:
fffff80a`523885db 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80a`523885df 4c8d0522d20100  lea     r8,[storport!WPP_ee373d4617d135effa352ef8f4082bcf_Traceguids (fffff80a`523a5808)]
fffff80a`523885e6 895c2430        mov     dword ptr [rsp+30h],ebx
fffff80a`523885ea ba20000000      mov     edx,20h
fffff80a`523885ef 896c2428        mov     dword ptr [rsp+28h],ebp
fffff80a`523885f3 4c8bcf          mov     r9,rdi
fffff80a`523885f6 4889742420      mov     qword ptr [rsp+20h],rsi
fffff80a`523885fb e828370000      call    storport!WPP_SF_qqDD (fffff80a`5238bd28)

storport!RaidAdapterMiniportProcessServiceRequest+0xf0:
fffff80a`52388600 488b6c2458      mov     rbp,qword ptr [rsp+58h]
fffff80a`52388605 8bc3            mov     eax,ebx
fffff80a`52388607 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff80a`5238860c 488b742460      mov     rsi,qword ptr [rsp+60h]
fffff80a`52388611 4883c440        add     rsp,40h
fffff80a`52388615 5f              pop     rdi
fffff80a`52388616 c3              ret
