0: kd> uf StorpInitializeAdapterTelemetry
storport!StorpInitializeAdapterTelemetry:
fffff807`0987bf20 4883ec28        sub     rsp,28h
fffff807`0987bf24 4c8bc1          mov     r8,rcx
fffff807`0987bf27 e8bc95feff      call    storport!StorpInitializeHierarchicalResetBuckets (fffff807`098654e8)
fffff807`0987bf2c 48a10800000080f7ffff mov rax,qword ptr [FFFFF78000000008h]
fffff807`0987bf36 498980d8140000  mov     qword ptr [r8+14D8h],rax  ;AdapterExt->LastCSStateChange
fffff807`0987bf3d 33c0            xor     eax,eax
fffff807`0987bf3f 498980e0140000  mov     qword ptr [r8+14E0h],rax  ;AdapterExt->LastIOCoalescingOnStartTime
fffff807`0987bf46 498980e8140000  mov     qword ptr [r8+14E8h],rax  ;AdapterExt->IOCoalescingOnDuration
fffff807`0987bf4d 498980f0140000  mov     qword ptr [r8+14F0h],rax  ;AdapterExt->FirstDPNRTimeAfterCS
fffff807`0987bf54 498980f8140000  mov     qword ptr [r8+14F8h],rax  ;AdapterExt->LastDPNRStartTime
fffff807`0987bf5b 49898000150000  mov     qword ptr [r8+1500h],rax  ;AdapterExt->DPNRDurationInCS
fffff807`0987bf62 49898008150000  mov     qword ptr [r8+1508h],rax  ;AdapterExt->LastF1StartTime
fffff807`0987bf69 49898010150000  mov     qword ptr [r8+1510h],rax  ;AdapterExt->F1DurationInCS
fffff807`0987bf70 49898018150000  mov     qword ptr [r8+1518h],rax  ;AdapterExt->ActiveReferencesInCS
fffff807`0987bf77 49898020150000  mov     qword ptr [r8+1520h],rax  ;AdapterExt->ActiveReferencesInCoalescing
fffff807`0987bf7e 49898028150000  mov     qword ptr [r8+1528h],rax  ;AdapterExt->UnitTimeoutsInCS
fffff807`0987bf85 41898038150000  mov     dword ptr [r8+1538h],eax  ;AdapterExt->D0TransitionsLongSinceCSStateChange
fffff807`0987bf8c 4188803c150000  mov     byte ptr [r8+153Ch],al    ;AdapterExt->TopologyInfoLogged
fffff807`0987bf93 49c7803015000001000000 mov qword ptr [r8+1530h],1 ;AdapterExt->D0TransitionsSinceCSStateChange
fffff807`0987bf9e 4883c428        add     rsp,28h
fffff807`0987bfa2 c3              ret
