0: kd> uf storport!RaDriverScsiIrp
storport!RaDriverScsiIrp:
fffff80d`80807180 4889742418      mov     qword ptr [rsp+18h],rsi
fffff80d`80807185 57              push    rdi
fffff80d`80807186 4883ec30        sub     rsp,30h
fffff80d`8080718a 48896c2448      mov     qword ptr [rsp+48h],rbp
fffff80d`8080718f 488bfa          mov     rdi,rdx               ;IRP
fffff80d`80807192 488bf1          mov     rsi,rcx               ;DeviceObject
fffff80d`80807195 488b0d649e0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`8080719c 488d2d5d9e0500  lea     rbp,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808071a3 483bcd          cmp     rcx,rbp
fffff80d`808071a6 740b            je      storport!RaDriverScsiIrp+0x33 (fffff80d`808071b3)  Branch

storport!RaDriverScsiIrp+0x28:
fffff80d`808071a8 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80d`808071ab a808            test    al,8
fffff80d`808071ad 0f85eb650200    jne     storport!RaDriverScsiIrp+0x2661e (fffff80d`8082d79e)  Branch

storport!RaDriverScsiIrp+0x33:
fffff80d`808071b3 c6878d000000a8  mov     byte ptr [rdi+8Dh],0A8h 
fffff80d`808071ba 488b4e40        mov     rcx,qword ptr [rsi+40h]       ;DeviceExtension of miniport => AdapterExt
fffff80d`808071be 48895c2440      mov     qword ptr [rsp+40h],rbx       
fffff80d`808071c3 8b01            mov     eax,dword ptr [rcx]           ;get AdapterExt->ObjectType
fffff80d`808071c5 85c0            test    eax,eax                       ;if RaidAdapterObject==ObjectType , goto 0x2664b
fffff80d`808071c7 0f84fe650200    je      storport!RaDriverScsiIrp+0x2664b (fffff80d`8082d7cb)  Branch

storport!RaDriverScsiIrp+0x4d:
fffff80d`808071cd 83f801          cmp     eax,1                         ;if RaidUnitObject != ObjectType, goto 0x8a
fffff80d`808071d0 7538            jne     storport!RaDriverScsiIrp+0x8a (fffff80d`8080720a)  Branch

storport!RaDriverScsiIrp+0x52:
fffff80d`808071d2 488bd7          mov     rdx,rdi
fffff80d`808071d5 e846000000      call    storport!RaUnitScsiIrp (fffff80d`80807220)

storport!RaDriverScsiIrp+0x5a:
fffff80d`808071da 8bd8            mov     ebx,eax

storport!RaDriverScsiIrp+0x5c:
fffff80d`808071dc 488b0d1d9e0500  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808071e3 483bcd          cmp     rcx,rbp
fffff80d`808071e6 488b6c2448      mov     rbp,qword ptr [rsp+48h]
fffff80d`808071eb 740b            je      storport!RaDriverScsiIrp+0x78 (fffff80d`808071f8)  Branch

storport!RaDriverScsiIrp+0x6d:
fffff80d`808071ed 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80d`808071f0 a808            test    al,8
fffff80d`808071f2 0f85e1650200    jne     storport!RaDriverScsiIrp+0x26659 (fffff80d`8082d7d9)  Branch

storport!RaDriverScsiIrp+0x78:
fffff80d`808071f8 488b742450      mov     rsi,qword ptr [rsp+50h]
fffff80d`808071fd 8bc3            mov     eax,ebx
fffff80d`808071ff 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff80d`80807204 4883c430        add     rsp,30h
fffff80d`80807208 5f              pop     rdi
fffff80d`80807209 c3              ret

storport!RaDriverScsiIrp+0x8a:
fffff80d`8080720a bb010000c0      mov     ebx,0C0000001h
fffff80d`8080720f ebcb            jmp     storport!RaDriverScsiIrp+0x5c (fffff80d`808071dc)  Branch

storport!RaDriverScsiIrp+0x2661e:
fffff80d`8082d79e 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082d7a2 0f820b9afdff    jb      storport!RaDriverScsiIrp+0x33 (fffff80d`808071b3)  Branch

storport!RaDriverScsiIrp+0x26628:
fffff80d`8082d7a8 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082d7ac 4c8d057dce0200  lea     r8,[storport!WPP_fca335724287372554e4fcd7cdd207c8_Traceguids (fffff80d`8085a630)]
fffff80d`8082d7b3 ba12000000      mov     edx,12h
fffff80d`8082d7b8 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff80d`8082d7bd 4c8bce          mov     r9,rsi
fffff80d`8082d7c0 e863e10000      call    storport!WPP_SF_qq (fffff80d`8083b928)
fffff80d`8082d7c5 90              nop
fffff80d`8082d7c6 e9e899fdff      jmp     storport!RaDriverScsiIrp+0x33 (fffff80d`808071b3)  Branch

storport!RaDriverScsiIrp+0x2664b:
fffff80d`8082d7cb 488bd7          mov     rdx,rdi
fffff80d`8082d7ce e889670400      call    storport!RaidAdapterScsiIrp (fffff80d`80873f5c)
fffff80d`8082d7d3 90              nop
fffff80d`8082d7d4 e9019afdff      jmp     storport!RaDriverScsiIrp+0x5a (fffff80d`808071da)  Branch

storport!RaDriverScsiIrp+0x26659:
fffff80d`8082d7d9 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082d7dd 0f82159afdff    jb      storport!RaDriverScsiIrp+0x78 (fffff80d`808071f8)  Branch

storport!RaDriverScsiIrp+0x26663:
fffff80d`8082d7e3 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082d7e7 4c8d0542ce0200  lea     r8,[storport!WPP_fca335724287372554e4fcd7cdd207c8_Traceguids (fffff80d`8085a630)]
fffff80d`8082d7ee ba13000000      mov     edx,13h
fffff80d`8082d7f3 895c2428        mov     dword ptr [rsp+28h],ebx
fffff80d`8082d7f7 4c8bce          mov     r9,rsi
fffff80d`8082d7fa 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff80d`8082d7ff e874e10000      call    storport!WPP_SF_qqD (fffff80d`8083b978)
fffff80d`8082d804 90              nop
fffff80d`8082d805 e9ee99fdff      jmp     storport!RaDriverScsiIrp+0x78 (fffff80d`808071f8)  Branch
