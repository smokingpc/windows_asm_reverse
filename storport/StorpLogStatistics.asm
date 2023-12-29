;會觸發 QueryAdapterTopology
;00 ffff8708`99c45698 fffff809`efc054b3     nt!IoQueueWorkItem
;01 ffff8708`99c456a0 fffff809`efc06097     storport!StorpLogPerAdapterStatistics+0xff
;02 ffff8708`99c45870 fffff809`efc050e0     storport!StorpLogStatistics+0xdf
;03 ffff8708`99c45920 fffff804`0e892129     storport!StorpTraceLoggingTelemetryTimerDpcRoutine+0xa0
;04 ffff8708`99c45960 fffff804`0e893077     nt!KiProcessExpiredTimerList+0x159
;05 ffff8708`99c45a50 fffff804`0e9d1a6a     nt!KiRetireDpcList+0x4a7
;06 ffff8708`99c45c60 00000000`00000000     nt!KiIdleLoop+0x5a
;從 RaidGetPortData推斷，這邊已經進入 per Adapter 的 scope??
;猜測是 DiskPerf 功能造成的？

3: kd> uf storport!StorpLogStatistics
storport!StorpLogStatistics:
fffff809`efc05fb8 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff809`efc05fbd 55              push    rbp
fffff809`efc05fbe 56              push    rsi
fffff809`efc05fbf 57              push    rdi
fffff809`efc05fc0 4154            push    r12
fffff809`efc05fc2 4155            push    r13
fffff809`efc05fc4 4156            push    r14
fffff809`efc05fc6 4157            push    r15
fffff809`efc05fc8 4883ec70        sub     rsp,70h
fffff809`efc05fcc 440fb7f9        movzx   r15d,cx
fffff809`efc05fd0 440fb7e1        movzx   r12d,cx
fffff809`efc05fd4 410fb7c7        movzx   eax,r15w
fffff809`efc05fd8 b9fc000000      mov     ecx,0FCh
fffff809`efc05fdd 6623c1          and     ax,cx
fffff809`efc05fe0 664183e443      and     r12w,43h
fffff809`efc05fe5 66898424b0000000 mov     word ptr [rsp+0B0h],ax
fffff809`efc05fed 664489a424b8000000 mov   word ptr [rsp+0B8h],r12w
fffff809`efc05ff6 e86df1ffff      call    storport!RaidGetPortData (fffff809`efc05168)
fffff809`efc05ffb 48898424c0000000 mov     qword ptr [rsp+0C0h],rax
fffff809`efc06003 488be8          mov     rbp,rax
fffff809`efc06006 4885c0          test    rax,rax
fffff809`efc06009 0f8442010000    je      storport!StorpLogStatistics+0x199 (fffff809`efc06151)  Branch

storport!StorpLogStatistics+0x57:
fffff809`efc0600f 488d4818        lea     rcx,[rax+18h]
fffff809`efc06013 488d542450      lea     rdx,[rsp+50h]
fffff809`efc06018 48ff1591e20500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff809`efc642b0)]
fffff809`efc0601f 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc06024 4c8d6d08        lea     r13,[rbp+8]
fffff809`efc06028 498b7d00        mov     rdi,qword ptr [r13]

storport!StorpLogStatistics+0x74:
fffff809`efc0602c 493bfd          cmp     rdi,r13
fffff809`efc0602f 0f8403010000    je      storport!StorpLogStatistics+0x180 (fffff809`efc06138)  Branch

storport!StorpLogStatistics+0x7d:
fffff809`efc06035 488d4f38        lea     rcx,[rdi+38h]
fffff809`efc06039 488d542438      lea     rdx,[rsp+38h]
fffff809`efc0603e 48ff156be20500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff809`efc642b0)]
fffff809`efc06045 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc0604a 4c8d7720        lea     r14,[rdi+20h]             ;rdi+0x20 => ;AdapterExt->NextAdapter
fffff809`efc0604e 498b36          mov     rsi,qword ptr [r14]       ;AdapterExt->NextAdapter
fffff809`efc06051 493bf6          cmp     rsi,r14
fffff809`efc06054 7516            jne     storport!StorpLogStatistics+0xb4 (fffff809`efc0606c)  Branch

storport!StorpLogStatistics+0x9e:
fffff809`efc06056 488d4c2438      lea     rcx,[rsp+38h]
fffff809`efc0605b 48ff15cedf0500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff809`efc64030)]
fffff809`efc06062 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc06067 488b3f          mov     rdi,qword ptr [rdi]
fffff809`efc0606a ebc0            jmp     storport!StorpLogStatistics+0x74 (fffff809`efc0602c)  Branch

storport!StorpLogStatistics+0xb4:
fffff809`efc0606c 440fb7ac24b0000000 movzx r13d,word ptr [rsp+0B0h]
fffff809`efc06075 33ed            xor     ebp,ebp

storport!StorpLogStatistics+0xbf:
fffff809`efc06077 488d4ec0        lea     rcx,[rsi-40h]
fffff809`efc0607b e860580000      call    storport!RaidAcquireAdapterRemoveLock (fffff809`efc0b8e0)
fffff809`efc06080 85c0            test    eax,eax
fffff809`efc06082 0f8893000000    js      storport!StorpLogStatistics+0x163 (fffff809`efc0611b)  Branch

storport!StorpLogStatistics+0xd0:
fffff809`efc06088 664585e4        test    r12w,r12w
fffff809`efc0608c 7409            je      storport!StorpLogStatistics+0xdf (fffff809`efc06097)  Branch

storport!StorpLogStatistics+0xd6:
fffff809`efc0608e 488d4ec0        lea     rcx,[rsi-40h]
fffff809`efc06092 e81df3ffff      call    storport!StorpLogPerAdapterStatistics (fffff809`efc053b4)

storport!StorpLogStatistics+0xdf:
fffff809`efc06097 664585ed        test    r13w,r13w
fffff809`efc0609b 7452            je      storport!StorpLogStatistics+0x137 (fffff809`efc060ef)  Branch

storport!StorpLogStatistics+0xe5:
fffff809`efc0609d 488d4e30        lea     rcx,[rsi+30h]
fffff809`efc060a1 488d542420      lea     rdx,[rsp+20h]
fffff809`efc060a6 48ff1503e20500  call    qword ptr [storport!_imp_KeAcquireInStackQueuedSpinLock (fffff809`efc642b0)]
fffff809`efc060ad 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc060b2 4c8d6638        lea     r12,[rsi+38h]
fffff809`efc060b6 4d8b3424        mov     r14,qword ptr [r12]
fffff809`efc060ba eb10            jmp     storport!StorpLogStatistics+0x114 (fffff809`efc060cc)  Branch

storport!StorpLogStatistics+0x104:
fffff809`efc060bc 498d4ec8        lea     rcx,[r14-38h]
fffff809`efc060c0 410fb7d7        movzx   edx,r15w
fffff809`efc060c4 e8a7000000      call    storport!StorpLogPerUnitStatistics (fffff809`efc06170)
fffff809`efc060c9 4d8b36          mov     r14,qword ptr [r14]

storport!StorpLogStatistics+0x114:
fffff809`efc060cc 4d3bf4          cmp     r14,r12
fffff809`efc060cf 75eb            jne     storport!StorpLogStatistics+0x104 (fffff809`efc060bc)  Branch

storport!StorpLogStatistics+0x119:
fffff809`efc060d1 488d4c2420      lea     rcx,[rsp+20h]
fffff809`efc060d6 48ff1553df0500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff809`efc64030)]
fffff809`efc060dd 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc060e2 440fb7a424b8000000 movzx r12d,word ptr [rsp+0B8h]
fffff809`efc060eb 4c8d7720        lea     r14,[rdi+20h]

storport!StorpLogStatistics+0x137:
fffff809`efc060ef 41f6c720        test    r15b,20h
fffff809`efc060f3 7406            je      storport!StorpLogStatistics+0x143 (fffff809`efc060fb)  Branch

storport!StorpLogStatistics+0x13d:
fffff809`efc060f5 89ae00150000    mov     dword ptr [rsi+1500h],ebp

storport!StorpLogStatistics+0x143:
fffff809`efc060fb 41f6c740        test    r15b,40h
fffff809`efc060ff 7407            je      storport!StorpLogStatistics+0x150 (fffff809`efc06108)  Branch

storport!StorpLogStatistics+0x149:
fffff809`efc06101 4889ae04150000  mov     qword ptr [rsi+1504h],rbp

storport!StorpLogStatistics+0x150:
fffff809`efc06108 488b8ec0000000  mov     rcx,qword ptr [rsi+0C0h]
fffff809`efc0610f 48ff157ae10500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff809`efc64290)]
fffff809`efc06116 0f1f440000      nop     dword ptr [rax+rax]

storport!StorpLogStatistics+0x163:
fffff809`efc0611b 488b36          mov     rsi,qword ptr [rsi]
fffff809`efc0611e 493bf6          cmp     rsi,r14
fffff809`efc06121 0f8550ffffff    jne     storport!StorpLogStatistics+0xbf (fffff809`efc06077)  Branch

storport!StorpLogStatistics+0x16f:
fffff809`efc06127 488bac24c0000000 mov     rbp,qword ptr [rsp+0C0h]
fffff809`efc0612f 4c8d6d08        lea     r13,[rbp+8]
fffff809`efc06133 e91effffff      jmp     storport!StorpLogStatistics+0x9e (fffff809`efc06056)  Branch

storport!StorpLogStatistics+0x180:
fffff809`efc06138 488d4c2450      lea     rcx,[rsp+50h]
fffff809`efc0613d 48ff15ecde0500  call    qword ptr [storport!_imp_KeReleaseInStackQueuedSpinLock (fffff809`efc64030)]
fffff809`efc06144 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc06149 488bcd          mov     rcx,rbp
fffff809`efc0614c e893f0ffff      call    storport!RaidReleasePortData (fffff809`efc051e4)

storport!StorpLogStatistics+0x199:
fffff809`efc06151 488b9c24c8000000 mov     rbx,qword ptr [rsp+0C8h]
fffff809`efc06159 4883c470        add     rsp,70h
fffff809`efc0615d 415f            pop     r15
fffff809`efc0615f 415e            pop     r14
fffff809`efc06161 415d            pop     r13
fffff809`efc06163 415c            pop     r12
fffff809`efc06165 5f              pop     rdi
fffff809`efc06166 5e              pop     rsi
fffff809`efc06167 5d              pop     rbp
fffff809`efc06168 c3              ret
