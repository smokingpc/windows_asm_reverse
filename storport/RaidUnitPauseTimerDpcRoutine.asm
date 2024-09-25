9: kd> uf storport!RaidUnitPauseTimerDpcRoutine
storport!RaidUnitPauseTimerDpcRoutine:
fffff801`ed8164b0 4053            push    rbx
fffff801`ed8164b2 4883ec20        sub     rsp,20h
fffff801`ed8164b6 488b5a40        mov     rbx,qword ptr [rdx+40h]
fffff801`ed8164ba 488bcb          mov     rcx,rbx
fffff801`ed8164bd e852c2feff      call    storport!RaidResumeUnitQueue (fffff801`ed802714)
fffff801`ed8164c2 85c0            test    eax,eax
fffff801`ed8164c4 740a            je      storport!RaidUnitPauseTimerDpcRoutine+0x20 (fffff801`ed8164d0)  Branch

storport!RaidUnitPauseTimerDpcRoutine+0x16:
fffff801`ed8164c6 33d2            xor     edx,edx
fffff801`ed8164c8 488bcb          mov     rcx,rbx
fffff801`ed8164cb e8cc6dffff      call    storport!RaidRestartIoQueue (fffff801`ed80d29c)

storport!RaidUnitPauseTimerDpcRoutine+0x20:
fffff801`ed8164d0 4883c420        add     rsp,20h
fffff801`ed8164d4 5b              pop     rbx
fffff801`ed8164d5 c3              ret
