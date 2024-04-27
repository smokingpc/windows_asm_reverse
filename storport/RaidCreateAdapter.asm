;建立 AdapterExt ，只有一個參數 RCX
;RaDriverAddDevice()->RaidCreateAdapter()

0: kd> uf RaidCreateAdapter
storport!RaidCreateAdapter:
fffff808`d87cc310 4053            push    rbx
fffff808`d87cc312 4883ec30        sub     rsp,30h
fffff808`d87cc316 33d2            xor     edx,edx
fffff808`d87cc318 41b800170000    mov     r8d,1700h ;sizeof(_RAID_ADAPTER_EXTENSION)
fffff808`d87cc31e 488bd9          mov     rbx,rcx
fffff808`d87cc321 e85a000100      call    storport!memset (fffff808`d87dc380)
fffff808`d87cc326 832300          and     dword ptr [rbx],0
fffff808`d87cc329 488d8388000000  lea     rax,[rbx+88h]
fffff808`d87cc330 488d8b80000000  lea     rcx,[rbx+80h]
fffff808`d87cc337 48894008        mov     qword ptr [rax+8],rax
fffff808`d87cc33b 488900          mov     qword ptr [rax],rax
fffff808`d87cc33e 48ff15dbad0400  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff808`d8817120)]
fffff808`d87cc345 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc34a 488d83d8000000  lea     rax,[rbx+0D8h]
fffff808`d87cc351 488d8bd0000000  lea     rcx,[rbx+0D0h]
fffff808`d87cc358 48894008        mov     qword ptr [rax+8],rax
fffff808`d87cc35c 488900          mov     qword ptr [rax],rax
fffff808`d87cc35f 48ff15baad0400  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff808`d8817120)]
fffff808`d87cc366 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc36b 488d8bf0000000  lea     rcx,[rbx+0F0h]
fffff808`d87cc372 48ff150faf0400  call    qword ptr [storport!_imp_InitializeSListHead (fffff808`d8817288)]
fffff808`d87cc379 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc37e 488d8b10140000  lea     rcx,[rbx+1410h]
fffff808`d87cc385 48ff15fcae0400  call    qword ptr [storport!_imp_InitializeSListHead (fffff808`d8817288)]
fffff808`d87cc38c 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc391 834b38ff        or      dword ptr [rbx+38h],0FFFFFFFFh
fffff808`d87cc395 488d8ba0000000  lea     rcx,[rbx+0A0h]
fffff808`d87cc39c e8f7010000      call    storport!StorCreateDictionary (fffff808`d87cc598)
fffff808`d87cc3a1 85c0            test    eax,eax
fffff808`d87cc3a3 0f8841010000    js      storport!RaidCreateAdapter+0x1da (fffff808`d87cc4ea)  Branch

storport!RaidCreateAdapter+0x99:
fffff808`d87cc3a9 ba5261526d      mov     edx,6D526152h
fffff808`d87cc3ae b900020000      mov     ecx,200h
fffff808`d87cc3b3 48ff151eae0400  call    qword ptr [storport!_imp_ExAllocateCacheAwareRundownProtection (fffff808`d88171d8)]
fffff808`d87cc3ba 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc3bf 48898310010000  mov     qword ptr [rbx+110h],rax
fffff808`d87cc3c6 4885c0          test    rax,rax
fffff808`d87cc3c9 0f841b010000    je      storport!RaidCreateAdapter+0x1da (fffff808`d87cc4ea)  Branch

storport!RaidCreateAdapter+0xbf:
fffff808`d87cc3cf 488d8b38010000  lea     rcx,[rbx+138h]
fffff808`d87cc3d6 e8bd010500      call    storport!RaCreateMiniport (fffff808`d881c598)
fffff808`d87cc3db 488d8bd0020000  lea     rcx,[rbx+2D0h]
fffff808`d87cc3e2 e891010500      call    storport!RaidCreateDma (fffff808`d881c578)
fffff808`d87cc3e7 83a31801000000  and     dword ptr [rbx+118h],0
fffff808`d87cc3ee 488d8b28010000  lea     rcx,[rbx+128h]
fffff808`d87cc3f5 83a31c01000000  and     dword ptr [rbx+11Ch],0
fffff808`d87cc3fc 83a32001000000  and     dword ptr [rbx+120h],0
fffff808`d87cc403 c6832401000000  mov     byte ptr [rbx+124h],0
fffff808`d87cc40a e825e50400      call    storport!RaidCreateResourceList (fffff808`d881a934)
fffff808`d87cc40f 488d8b68020000  lea     rcx,[rbx+268h]
fffff808`d87cc416 e8f5e40400      call    storport!RaCreateBus (fffff808`d881a910)
fffff808`d87cc41b 33c0            xor     eax,eax
fffff808`d87cc41d 488d8b40030000  lea     rcx,[rbx+340h]
fffff808`d87cc424 488983f0020000  mov     qword ptr [rbx+2F0h],rax
fffff808`d87cc42b 488983f8020000  mov     qword ptr [rbx+2F8h],rax
fffff808`d87cc432 48898300030000  mov     qword ptr [rbx+300h],rax
fffff808`d87cc439 e8fe000000      call    storport!StorCreateIoGateway (fffff808`d87cc53c)
fffff808`d87cc43e 488d8b80040000  lea     rcx,[rbx+480h]
fffff808`d87cc445 e8ae000000      call    storport!RaidCreateDeferredQueue (fffff808`d87cc4f8)
fffff808`d87cc44a 488d8b00060000  lea     rcx,[rbx+600h]
fffff808`d87cc451 e8a2000000      call    storport!RaidCreateDeferredQueue (fffff808`d87cc4f8)
fffff808`d87cc456 b805200708      mov     eax,8072005h
fffff808`d87cc45b 488d8bc0060000  lea     rcx,[rbx+6C0h]
fffff808`d87cc462 898310050000    mov     dword ptr [rbx+510h],eax
fffff808`d87cc468 898360050000    mov     dword ptr [rbx+560h],eax
fffff808`d87cc46e 8983b0050000    mov     dword ptr [rbx+5B0h],eax
fffff808`d87cc474 48ff15b5ac0400  call    qword ptr [storport!_imp_KeInitializeTimer (fffff808`d8817130)]
fffff808`d87cc47b 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc480 488d8b80070000  lea     rcx,[rbx+780h]
fffff808`d87cc487 48ff15a2ac0400  call    qword ptr [storport!_imp_KeInitializeTimer (fffff808`d8817130)]
fffff808`d87cc48e 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc493 488d8bb8100000  lea     rcx,[rbx+10B8h]
fffff808`d87cc49a 48ff158fac0400  call    qword ptr [storport!_imp_KeInitializeTimer (fffff808`d8817130)]
fffff808`d87cc4a1 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc4a6 488d8bb0150000  lea     rcx,[rbx+15B0h]
fffff808`d87cc4ad 48ff157cac0400  call    qword ptr [storport!_imp_KeInitializeTimer (fffff808`d8817130)]
fffff808`d87cc4b4 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc4b9 488d8bc0020000  lea     rcx,[rbx+2C0h]
fffff808`d87cc4c0 c7435802000000  mov     dword ptr [rbx+58h],2
fffff808`d87cc4c7 c6436a01        mov     byte ptr [rbx+6Ah],1
fffff808`d87cc4cb 48ff154eac0400  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff808`d8817120)]
fffff808`d87cc4d2 0f1f440000      nop     dword ptr [rax+rax]
fffff808`d87cc4d7 488d8b30160000  lea     rcx,[rbx+1630h]
fffff808`d87cc4de 48ff153bac0400  call    qword ptr [storport!_imp_KeInitializeSpinLock (fffff808`d8817120)]
fffff808`d87cc4e5 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidCreateAdapter+0x1da:
fffff808`d87cc4ea 4883c430        add     rsp,30h
fffff808`d87cc4ee 5b              pop     rbx
fffff808`d87cc4ef c3              ret
