2: kd> uf RaidAdapterRequestComplete
storport!RaidAdapterRequestComplete: ;RaidAdapterRequestComplete(AdapterExt, Srb->PortContext, 0)

fffff80e`6c5eecf0 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff80e`6c5eecf5 57              push    rdi
fffff80e`6c5eecf6 4881ecc0000000  sub     rsp,0C0h
fffff80e`6c5eecfd 488b058cf50400  mov     rax,qword ptr [storport!_security_cookie (fffff80e`6c63e290)]
fffff80e`6c5eed04 4833c4          xor     rax,rsp
fffff80e`6c5eed07 48898424b0000000 mov     qword ptr [rsp+0B0h],rax
fffff80e`6c5eed0f f6812002000002  test    byte ptr [rcx+220h],2 ;if AdapterExt->Miniport.Flags != 2 (HBA is in ResetBus), goto 0x208b8
fffff80e`6c5eed16 488bda          mov     rbx,rdx       ;Srb->PortContext
fffff80e`6c5eed19 488bf9          mov     rdi,rcx       ;AdapterExt
fffff80e`6c5eed1c 0f8586080200    jne     storport!RaidAdapterRequestComplete+0x208b8 (fffff80e`6c60f5a8)  Branch

storport!RaidAdapterRequestComplete+0x32:
fffff80e`6c5eed22 488b0587f50400  mov     rax,qword ptr [storport!g_RaidLogControl+0x8 (fffff80e`6c63e2b0)]
fffff80e`6c5eed29 a808            test    al,8
fffff80e`6c5eed2b 0f854f010000    jne     storport!RaidAdapterRequestComplete+0x190 (fffff80e`6c5eee80)  Branch

storport!RaidAdapterRequestComplete+0x41:
fffff80e`6c5eed31 4584c0          test    r8b,r8b
fffff80e`6c5eed34 750f            jne     storport!RaidAdapterRequestComplete+0x55 (fffff80e`6c5eed45)  Branch

storport!RaidAdapterRequestComplete+0x46:
fffff80e`6c5eed36 0fb6870c020000  movzx   eax,byte ptr [rdi+20Ch]
fffff80e`6c5eed3d 2410            and     al,10h            ;if (AdapterExt->Portconfig.FeatureSupport & STOR_ADAPTER_FEATURE_ABORT_COMMAND) , goto 0x208CD
fffff80e`6c5eed3f 0f8578080200    jne     storport!RaidAdapterRequestComplete+0x208cd (fffff80e`6c60f5bd)  Branch

storport!RaidAdapterRequestComplete+0x55:  ;RBX is Srb->PortContext
fffff80e`6c5eed45 488b8ba0000000  mov     rcx,qword ptr [rbx+0A0h]  ;RBX is Srb->PortContext
fffff80e`6c5eed4c 4885c9          test    rcx,rcx
fffff80e`6c5eed4f 7418            je      storport!RaidAdapterRequestComplete+0x79 (fffff80e`6c5eed69)  Branch

storport!RaidAdapterRequestComplete+0x61:
fffff80e`6c5eed51 0fb6818d000000  movzx   eax,byte ptr [rcx+8Dh]
fffff80e`6c5eed58 0455            add     al,55h
fffff80e`6c5eed5a 3c01            cmp     al,1
fffff80e`6c5eed5c 0f8634010000    jbe     storport!RaidAdapterRequestComplete+0x1a6 (fffff80e`6c5eee96)  Branch

storport!RaidAdapterRequestComplete+0x72:
fffff80e`6c5eed62 c6818d000000ab  mov     byte ptr [rcx+8Dh],0ABh

storport!RaidAdapterRequestComplete+0x79:
fffff80e`6c5eed69 0fb64310        movzx   eax,byte ptr [rbx+10h]
fffff80e`6c5eed6d b9ffff0000      mov     ecx,0FFFFh
fffff80e`6c5eed72 24f3            and     al,0F3h
fffff80e`6c5eed74 0c10            or      al,10h
fffff80e`6c5eed76 884310          mov     byte ptr [rbx+10h],al
fffff80e`6c5eed79 8b4312          mov     eax,dword ptr [rbx+12h]
fffff80e`6c5eed7c 89442434        mov     dword ptr [rsp+34h],eax
fffff80e`6c5eed80 663bc1          cmp     ax,cx
fffff80e`6c5eed83 0f84b7000000    je      storport!RaidAdapterRequestComplete+0x150 (fffff80e`6c5eee40)  Branch

storport!RaidAdapterRequestComplete+0x99:
fffff80e`6c5eed89 f6876311000002  test    byte ptr [rdi+1163h],2    ;if (AdapterExt->PerfOptFlags.DpcUseCurrentCpu) goto 0x176
fffff80e`6c5eed90 0f85d0000000    jne     storport!RaidAdapterRequestComplete+0x176 (fffff80e`6c5eee66)  Branch

storport!RaidAdapterRequestComplete+0xa6:
fffff80e`6c5eed96 0fb7c8          movzx   ecx,ax
fffff80e`6c5eed99 3b0d65fa0400    cmp     ecx,dword ptr [storport!g_RaidPerfRedirectGroupCount (fffff80e`6c63e804)]
fffff80e`6c5eed9f 0f839b000000    jae     storport!RaidAdapterRequestComplete+0x150 (fffff80e`6c5eee40)  Branch

storport!RaidAdapterRequestComplete+0xb5:
fffff80e`6c5eeda5 440fb6442436    movzx   r8d,byte ptr [rsp+36h]
fffff80e`6c5eedab 0fb7d0          movzx   edx,ax
fffff80e`6c5eedae 488b052bfa0400  mov     rax,qword ptr [storport!g_RaidDPCRedirectionProcessors (fffff80e`6c63e7e0)]
fffff80e`6c5eedb5 443b0490        cmp     r8d,dword ptr [rax+rdx*4]
fffff80e`6c5eedb9 0f8381000000    jae     storport!RaidAdapterRequestComplete+0x150 (fffff80e`6c5eee40)  Branch

storport!RaidAdapterRequestComplete+0xcf:
fffff80e`6c5eedbf c1e106          shl     ecx,6
fffff80e`6c5eedc2 488d5320        lea     rdx,[rbx+20h]
fffff80e`6c5eedc6 4403c1          add     r8d,ecx
fffff80e`6c5eedc9 488b0d38fa0400  mov     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff80e`6c63e808)]
fffff80e`6c5eedd0 4883c140        add     rcx,40h
fffff80e`6c5eedd4 49c1e007        shl     r8,7
fffff80e`6c5eedd8 4903c8          add     rcx,r8
fffff80e`6c5eeddb 48ff15ee520500  call    qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff80e`6c6440d0)]
fffff80e`6c5eede2 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5eede7 4885c0          test    rax,rax
fffff80e`6c5eedea 7533            jne     storport!RaidAdapterRequestComplete+0x12f (fffff80e`6c5eee1f)  Branch

storport!RaidAdapterRequestComplete+0xfc:
fffff80e`6c5eedec 0fb74c2434      movzx   ecx,word ptr [rsp+34h]
fffff80e`6c5eedf1 0fb6442436      movzx   eax,byte ptr [rsp+36h]
fffff80e`6c5eedf6 c1e106          shl     ecx,6
fffff80e`6c5eedf9 03c8            add     ecx,eax
fffff80e`6c5eedfb 48c1e107        shl     rcx,7
fffff80e`6c5eedff 48030d02fa0400  add     rcx,qword ptr [storport!g_RaidPerProcessorState (fffff80e`6c63e808)]
fffff80e`6c5eee06 83795002        cmp     dword ptr [rcx+50h],2
fffff80e`6c5eee0a 7413            je      storport!RaidAdapterRequestComplete+0x12f (fffff80e`6c5eee1f)  Branch

storport!RaidAdapterRequestComplete+0x11c:
fffff80e`6c5eee0c 488b5708        mov     rdx,qword ptr [rdi+8]

storport!RaidAdapterRequestComplete+0x120:
fffff80e`6c5eee10 4533c0          xor     r8d,r8d
fffff80e`6c5eee13 48ff15fe580500  call    qword ptr [storport!_imp_KeInsertQueueDpc (fffff80e`6c644718)]
fffff80e`6c5eee1a 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterRequestComplete+0x12f:
fffff80e`6c5eee1f 488b8c24b0000000 mov     rcx,qword ptr [rsp+0B0h]
fffff80e`6c5eee27 4833cc          xor     rcx,rsp
fffff80e`6c5eee2a e8c1410100      call    storport!_security_check_cookie (fffff80e`6c602ff0)
fffff80e`6c5eee2f 488b9c24e0000000 mov     rbx,qword ptr [rsp+0E0h]
fffff80e`6c5eee37 4881c4c0000000  add     rsp,0C0h
fffff80e`6c5eee3e 5f              pop     rdi
fffff80e`6c5eee3f c3              ret

storport!RaidAdapterRequestComplete+0x150:
fffff80e`6c5eee40 488d5320        lea     rdx,[rbx+20h]         
fffff80e`6c5eee44 488d8fe0000000  lea     rcx,[rdi+0E0h]        ;AdapterExt->CompleteList
fffff80e`6c5eee4b 48ff157e520500  call    qword ptr [storport!_imp_ExpInterlockedPushEntrySList (fffff80e`6c6440d0)]
fffff80e`6c5eee52 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5eee57 488b4f08        mov     rcx,qword ptr [rdi+8]
fffff80e`6c5eee5b 4881c1c8000000  add     rcx,0C8h      ;RCX = DeviceObject->DPC
fffff80e`6c5eee62 33d2            xor     edx,edx
fffff80e`6c5eee64 ebaa            jmp     storport!RaidAdapterRequestComplete+0x120 (fffff80e`6c5eee10)  Branch

storport!RaidAdapterRequestComplete+0x176:
fffff80e`6c5eee66 488d4c2434      lea     rcx,[rsp+34h]
fffff80e`6c5eee6b 48ff155e540500  call    qword ptr [storport!_imp_KeGetCurrentProcessorNumberEx (fffff80e`6c6442d0)]
fffff80e`6c5eee72 0f1f440000      nop     dword ptr [rax+rax]
fffff80e`6c5eee77 8b442434        mov     eax,dword ptr [rsp+34h]
fffff80e`6c5eee7b e916ffffff      jmp     storport!RaidAdapterRequestComplete+0xa6 (fffff80e`6c5eed96)  Branch

storport!RaidAdapterRequestComplete+0x190:
fffff80e`6c5eee80 4584c0          test    r8b,r8b
fffff80e`6c5eee83 0f85bcfeffff    jne     storport!RaidAdapterRequestComplete+0x55 (fffff80e`6c5eed45)  Branch

storport!RaidAdapterRequestComplete+0x199:
fffff80e`6c5eee89 488bcb          mov     rcx,rbx
fffff80e`6c5eee8c e81b000000      call    storport!RaidLogMiniportCompletion (fffff80e`6c5eeeac)
fffff80e`6c5eee91 e9a0feffff      jmp     storport!RaidAdapterRequestComplete+0x46 (fffff80e`6c5eed36)  Branch

storport!RaidAdapterRequestComplete+0x1a6:
fffff80e`6c5eee96 833dbbf1040005  cmp     dword ptr [storport!StorPortEventProvider_Context+0x48 (fffff80e`6c63e058)],5
fffff80e`6c5eee9d 7680            jbe     storport!RaidAdapterRequestComplete+0x12f (fffff80e`6c5eee1f)  Branch

storport!RaidAdapterRequestComplete+0x1af:
fffff80e`6c5eee9f e932070200      jmp     storport!RaidAdapterRequestComplete+0x208e6 (fffff80e`6c60f5d6)  Branch

storport!RaidAdapterRequestComplete+0x208b8:
fffff80e`6c60f5a8 4584c0          test    r8b,r8b
fffff80e`6c60f5ab 0f8571f7fdff    jne     storport!RaidAdapterRequestComplete+0x32 (fffff80e`6c5eed22)  Branch

storport!RaidAdapterRequestComplete+0x208c1:
fffff80e`6c60f5b1 f0ff8158140000  lock inc dword ptr [rcx+1458h]
fffff80e`6c60f5b8 e965f7fdff      jmp     storport!RaidAdapterRequestComplete+0x32 (fffff80e`6c5eed22)  Branch

storport!RaidAdapterRequestComplete+0x208cd:
fffff80e`6c60f5bd b804000000      mov     eax,4
fffff80e`6c60f5c2 878308030000    xchg    eax,dword ptr [rbx+308h]
fffff80e`6c60f5c8 83f801          cmp     eax,1
fffff80e`6c60f5cb 0f844ef8fdff    je      storport!RaidAdapterRequestComplete+0x12f (fffff80e`6c5eee1f)  Branch

storport!RaidAdapterRequestComplete+0x208e1:
fffff80e`6c60f5d1 e96ff7fdff      jmp     storport!RaidAdapterRequestComplete+0x55 (fffff80e`6c5eed45)  Branch

storport!RaidAdapterRequestComplete+0x208e6:
fffff80e`6c60f5d6 48ba0000000000400000 mov rdx,400000000000h
fffff80e`6c60f5e0 e8f35cfdff      call    storport!TlgKeywordOn (fffff80e`6c5e52d8)
fffff80e`6c60f5e5 84c0            test    al,al
fffff80e`6c60f5e7 0f8432f8fdff    je      storport!RaidAdapterRequestComplete+0x12f (fffff80e`6c5eee1f)  Branch

storport!RaidAdapterRequestComplete+0x208fd:
fffff80e`6c60f5ed 8b4738          mov     eax,dword ptr [rdi+38h]
fffff80e`6c60f5f0 488d8c2480000000 lea     rcx,[rsp+80h]
fffff80e`6c60f5f8 488b97c0120000  mov     rdx,qword ptr [rdi+12C0h] ;AdapterExt->SqmMiniportName 
fffff80e`6c60f5ff 4c8b97c8120000  mov     r10,qword ptr [rdi+12C8h] ;AdapterExt->SqmAdapterId
fffff80e`6c60f606 8944243c        mov     dword ptr [rsp+3Ch],eax
fffff80e`6c60f60a 0fb68704110000  movzx   eax,byte ptr [rdi+1104h]  ;AdapterExt->Parameters.BusType
fffff80e`6c60f611 88442430        mov     byte ptr [rsp+30h],al
fffff80e`6c60f615 488d8748140000  lea     rax,[rdi+1448h]           ;AdapterExt->AdapterGuid
fffff80e`6c60f61c 4889442460      mov     qword ptr [rsp+60h],rax
fffff80e`6c60f621 488d44243c      lea     rax,[rsp+3Ch]
fffff80e`6c60f626 4889442470      mov     qword ptr [rsp+70h],rax
fffff80e`6c60f62b 48c744246810000000 mov   qword ptr [rsp+68h],10h
fffff80e`6c60f634 48c744247804000000 mov   qword ptr [rsp+78h],4
fffff80e`6c60f63d e87e62fdff      call    storport!TlgCreateWsz (fffff80e`6c5e58c0)
fffff80e`6c60f642 488d4c2430      lea     rcx,[rsp+30h]
fffff80e`6c60f647 48c784249800000001000000 mov qword ptr [rsp+98h],1
fffff80e`6c60f653 48898c2490000000 mov     qword ptr [rsp+90h],rcx
fffff80e`6c60f65b 498bd2          mov     rdx,r10
fffff80e`6c60f65e 488d8c24a0000000 lea     rcx,[rsp+0A0h]
fffff80e`6c60f666 e85562fdff      call    storport!TlgCreateWsz (fffff80e`6c5e58c0)
fffff80e`6c60f66b 488d442440      lea     rax,[rsp+40h]
fffff80e`6c60f670 4889442428      mov     qword ptr [rsp+28h],rax
fffff80e`6c60f675 488d15f4430200  lea     rdx,[storport!TraceLoggingMetadata+0x248 (fffff80e`6c633a70)]
fffff80e`6c60f67c c744242007000000 mov     dword ptr [rsp+20h],7
fffff80e`6c60f684 e8835cfdff      call    storport!TlgWrite (fffff80e`6c5e530c)
fffff80e`6c60f689 90              nop
fffff80e`6c60f68a e990f7fdff      jmp     storport!RaidAdapterRequestComplete+0x12f (fffff80e`6c5eee1f)  Branch
