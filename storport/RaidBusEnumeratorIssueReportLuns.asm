0: kd> uf  storport!RaidBusEnumeratorIssueReportLuns
storport!RaidBusEnumeratorIssueReportLuns:
fffff80d`808154d4 48895c2410      mov     qword ptr [rsp+10h],rbx
fffff80d`808154d9 48896c2418      mov     qword ptr [rsp+18h],rbp
fffff80d`808154de 4889742420      mov     qword ptr [rsp+20h],rsi
fffff80d`808154e3 57              push    rdi
fffff80d`808154e4 4156            push    r14
fffff80d`808154e6 4157            push    r15
fffff80d`808154e8 4883ec30        sub     rsp,30h
fffff80d`808154ec 488d6940        lea     rbp,[rcx+40h]
fffff80d`808154f0 4d8bf8          mov     r15,r8
fffff80d`808154f3 8bda            mov     ebx,edx
fffff80d`808154f5 4c8bc5          mov     r8,rbp
fffff80d`808154f8 418b11          mov     edx,dword ptr [r9]
fffff80d`808154fb 4d8bf1          mov     r14,r9
fffff80d`808154fe 488bf1          mov     rsi,rcx
fffff80d`80815501 e8ea060000      call    storport!RaidBusEnumeratorAllocateReportLunsResources (fffff80d`80815bf0)
fffff80d`80815506 33ff            xor     edi,edi
fffff80d`80815508 85c0            test    eax,eax
fffff80d`8081550a 7841            js      storport!RaidBusEnumeratorIssueReportLuns+0x79 (fffff80d`8081554d)  Branch

storport!RaidBusEnumeratorIssueReportLuns+0x38:
fffff80d`8081550c 458b0e          mov     r9d,dword ptr [r14]
fffff80d`8081550f 488d442450      lea     rax,[rsp+50h]
fffff80d`80815514 4c8bc5          mov     r8,rbp
fffff80d`80815517 4889442420      mov     qword ptr [rsp+20h],rax
fffff80d`8081551c 8bd3            mov     edx,ebx
fffff80d`8081551e 488bce          mov     rcx,rsi
fffff80d`80815521 e88a050000      call    storport!RaidBusEnumeratorBuildReportLuns (fffff80d`80815ab0)
fffff80d`80815526 488b5c2450      mov     rbx,qword ptr [rsp+50h]
fffff80d`8081552b 4c8bc5          mov     r8,rbp
fffff80d`8081552e 4c8bcb          mov     r9,rbx
fffff80d`80815531 498bd7          mov     rdx,r15
fffff80d`80815534 488bce          mov     rcx,rsi
fffff80d`80815537 e890000000      call    storport!RaidBusEnumeratorIssueSynchronousRequest (fffff80d`808155cc)
fffff80d`8081553c 85c0            test    eax,eax
fffff80d`8081553e 7926            jns     storport!RaidBusEnumeratorIssueReportLuns+0x92 (fffff80d`80815566)  Branch

storport!RaidBusEnumeratorIssueReportLuns+0x6c:
fffff80d`80815540 b90e0000c0      mov     ecx,0C000000Eh
fffff80d`80815545 8d7915          lea     edi,[rcx+15h]
fffff80d`80815548 3bc7            cmp     eax,edi
fffff80d`8081554a 0f44c1          cmove   eax,ecx

storport!RaidBusEnumeratorIssueReportLuns+0x79:
fffff80d`8081554d 488b5c2458      mov     rbx,qword ptr [rsp+58h]
fffff80d`80815552 488b6c2460      mov     rbp,qword ptr [rsp+60h]
fffff80d`80815557 488b742468      mov     rsi,qword ptr [rsp+68h]
fffff80d`8081555c 4883c430        add     rsp,30h
fffff80d`80815560 415f            pop     r15
fffff80d`80815562 415e            pop     r14
fffff80d`80815564 5f              pop     rdi
fffff80d`80815565 c3              ret

storport!RaidBusEnumeratorIssueReportLuns+0x92:
fffff80d`80815566 488b06          mov     rax,qword ptr [rsi]
fffff80d`80815569 80b8a201000001  cmp     byte ptr [rax+1A2h],1
fffff80d`80815570 7440            je      storport!RaidBusEnumeratorIssueReportLuns+0xde (fffff80d`808155b2)  Branch

storport!RaidBusEnumeratorIssueReportLuns+0x9e:
fffff80d`80815572 4c8b4318        mov     r8,qword ptr [rbx+18h]

storport!RaidBusEnumeratorIssueReportLuns+0xa2:
fffff80d`80815576 410fb64001      movzx   eax,byte ptr [r8+1]
fffff80d`8081557b 410fb610        movzx   edx,byte ptr [r8]
fffff80d`8081557f c1e208          shl     edx,8
fffff80d`80815582 0bd0            or      edx,eax
fffff80d`80815584 410fb64002      movzx   eax,byte ptr [r8+2]
fffff80d`80815589 c1e208          shl     edx,8
fffff80d`8081558c 0bd0            or      edx,eax
fffff80d`8081558e 410fb64003      movzx   eax,byte ptr [r8+3]
fffff80d`80815593 c1e208          shl     edx,8
fffff80d`80815596 0bd0            or      edx,eax
fffff80d`80815598 418b06          mov     eax,dword ptr [r14]
fffff80d`8081559b 8bca            mov     ecx,edx
fffff80d`8081559d 4883c108        add     rcx,8
fffff80d`808155a1 483bc1          cmp     rax,rcx
fffff80d`808155a4 7212            jb      storport!RaidBusEnumeratorIssueReportLuns+0xe4 (fffff80d`808155b8)  Branch

storport!RaidBusEnumeratorIssueReportLuns+0xd2:
fffff80d`808155a6 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff80d`808155ab 8bc7            mov     eax,edi
fffff80d`808155ad 4c8901          mov     qword ptr [rcx],r8
fffff80d`808155b0 eb9b            jmp     storport!RaidBusEnumeratorIssueReportLuns+0x79 (fffff80d`8081554d)  Branch

storport!RaidBusEnumeratorIssueReportLuns+0xde:
fffff80d`808155b2 4c8b4340        mov     r8,qword ptr [rbx+40h]
fffff80d`808155b6 ebbe            jmp     storport!RaidBusEnumeratorIssueReportLuns+0xa2 (fffff80d`80815576)  Branch

storport!RaidBusEnumeratorIssueReportLuns+0xe4:
fffff80d`808155b8 8d4208          lea     eax,[rdx+8]
fffff80d`808155bb bf230000c0      mov     edi,0C0000023h
fffff80d`808155c0 418906          mov     dword ptr [r14],eax
fffff80d`808155c3 ebe1            jmp     storport!RaidBusEnumeratorIssueReportLuns+0xd2 (fffff80d`808155a6)  Branch
