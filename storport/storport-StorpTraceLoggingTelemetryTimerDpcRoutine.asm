3: kd> uf storport!StorpTraceLoggingTelemetryTimerDpcRoutine
storport!StorpTraceLoggingTelemetryTimerDpcRoutine:
fffff809`efc05040 48895c2408      mov     qword ptr [rsp+8],rbx
fffff809`efc05045 48896c2410      mov     qword ptr [rsp+10h],rbp
fffff809`efc0504a 4889742418      mov     qword ptr [rsp+18h],rsi
fffff809`efc0504f 57              push    rdi
fffff809`efc05050 4883ec30        sub     rsp,30h
fffff809`efc05054 48bb2003000080f7ffff mov rbx,0FFFFF78000000320h
fffff809`efc0505e 33ed            xor     ebp,ebp
fffff809`efc05060 488bf1          mov     rsi,rcx
fffff809`efc05063 0fb7fd          movzx   edi,bp
fffff809`efc05066 488b1b          mov     rbx,qword ptr [rbx]
fffff809`efc05069 48ff15e8f20500  call    qword ptr [storport!_imp_KeQueryTimeIncrement (fffff809`efc64358)]
fffff809`efc05070 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc05075 4c63c0          movsxd  r8,eax
fffff809`efc05078 48b8bd427ae5d594bfd6 mov rax,0D6BF94D5E57A42BDh
fffff809`efc05082 4c0fafc3        imul    r8,rbx
fffff809`efc05086 488d1d93940500  lea     rbx,[storport!g_StorpTraceLoggingPerformanceTimerDpc (fffff809`efc5e520)]
fffff809`efc0508d 49f7e8          imul    r8
fffff809`efc05090 4903d0          add     rdx,r8
fffff809`efc05093 48c1fa17        sar     rdx,17h
fffff809`efc05097 488bc2          mov     rax,rdx
fffff809`efc0509a 48c1e83f        shr     rax,3Fh
fffff809`efc0509e 4803d0          add     rdx,rax
fffff809`efc050a1 48891528970500  mov     qword ptr [storport!g_SystemUptime_s (fffff809`efc5e7d0)],rdx
fffff809`efc050a8 483bf3          cmp     rsi,rbx
fffff809`efc050ab 7573            jne     storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xe0 (fffff809`efc05120)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x6d:
fffff809`efc050ad 392d1d920500    cmp     dword ptr [storport!g_StorpTraceLoggingPerformanceEnabled (fffff809`efc5e2d0)],ebp    ;0xFFFFFFFF
fffff809`efc050b3 7403            je      storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x78 (fffff809`efc050b8)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x75:
fffff809`efc050b5 8d7d04          lea     edi,[rbp+4]

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x78:
fffff809`efc050b8 392d1a920500    cmp     dword ptr [storport!g_StorpTraceLoggingErrorDataEnabled (fffff809`efc5e2d8)],ebp      ;0xFFFFFFFF
fffff809`efc050be 7404            je      storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x84 (fffff809`efc050c4)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x80:
fffff809`efc050c0 6683cf10        or      di,10h

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x84:
fffff809`efc050c4 392d16920500    cmp     dword ptr [storport!g_StorpTraceLoggingDeviceHealthEnabled (fffff809`efc5e2e0)],ebp   ;0xFFFFFFFF
fffff809`efc050ca 7408            je      storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x94 (fffff809`efc050d4)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x8c:
fffff809`efc050cc b880000000      mov     eax,80h
fffff809`efc050d1 660bf8          or      di,ax

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x94:
fffff809`efc050d4 6683cf60        or      di,60h
fffff809`efc050d8 0fb7cf          movzx   ecx,di
fffff809`efc050db e8d80e0000      call    storport!StorpLogStatistics (fffff809`efc05fb8)   ;call進去StorpLogPerAdapterStatistics的路徑
fffff809`efc050e0 48ba00983b9ef7ffffff mov rdx,0FFFFFFF79E3B9800h
fffff809`efc050ea 488d0def920500  lea     rcx,[storport!g_StorpTraceLoggingPerformanceTimer (fffff809`efc5e3e0)]
fffff809`efc050f1 41b9e0930400    mov     r9d,493E0h

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xb7:
fffff809`efc050f7 4533c0          xor     r8d,r8d
fffff809`efc050fa 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff809`efc050ff 48ff15daf10500  call    qword ptr [storport!_imp_KeSetCoalescableTimer (fffff809`efc642e0)]
fffff809`efc05106 0f1f440000      nop     dword ptr [rax+rax]

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xcb:
fffff809`efc0510b 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff809`efc05110 488b6c2448      mov     rbp,qword ptr [rsp+48h]
fffff809`efc05115 488b742450      mov     rsi,qword ptr [rsp+50h]
fffff809`efc0511a 4883c430        add     rsp,30h
fffff809`efc0511e 5f              pop     rdi
fffff809`efc0511f c3              ret

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xe0:
fffff809`efc05120 488d1db9930500  lea     rbx,[storport!g_StorpTraceLoggingHierarchicalResetTimerDpc (fffff809`efc5e4e0)]
fffff809`efc05127 483bf3          cmp     rsi,rbx
fffff809`efc0512a 0f84ba5b0200    je      storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x25caa (fffff809`efc2acea)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xf0:
fffff809`efc05130 488d1d69920500  lea     rbx,[storport!g_StorpTraceLoggingDailyTimerDpc (fffff809`efc5e3a0)]
fffff809`efc05137 483bf3          cmp     rsi,rbx
fffff809`efc0513a 75cf            jne     storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xcb (fffff809`efc0510b)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xfc:
fffff809`efc0513c b908000000      mov     ecx,8
fffff809`efc05141 e8720e0000      call    storport!StorpLogStatistics (fffff809`efc05fb8)
fffff809`efc05146 48ba004096d536ffffff mov rdx,0FFFFFF36D5964000h
fffff809`efc05150 488d0d49930500  lea     rcx,[storport!g_StorpTraceLoggingDailyTimer (fffff809`efc5e4a0)]
fffff809`efc05157 41b9a0bb0d00    mov     r9d,0DBBA0h
fffff809`efc0515d eb98            jmp     storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xb7 (fffff809`efc050f7)  Branch

storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0x25caa:
fffff809`efc2acea b903000000      mov     ecx,3
fffff809`efc2acef e8c4b2fdff      call    storport!StorpLogStatistics (fffff809`efc05fb8)
fffff809`efc2acf4 48ba001c8fdedfffffff mov rdx,0FFFFFFDFDE8F1C00h
fffff809`efc2acfe 488d0d5b360300  lea     rcx,[storport!g_StorpTraceLoggingHierarchicalResetTimer (fffff809`efc5e360)]
fffff809`efc2ad05 41b9e0930400    mov     r9d,493E0h
fffff809`efc2ad0b e9e7a3fdff      jmp     storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xb7 (fffff809`efc050f7)  Branch
