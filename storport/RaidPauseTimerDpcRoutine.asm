9: kd> uf storport!RaidPauseTimerDpcRoutine
storport!RaidPauseTimerDpcRoutine:
fffff801`ed83b430 4053            push    rbx
fffff801`ed83b432 4883ec20        sub     rsp,20h
fffff801`ed83b436 488b5a40        mov     rbx,qword ptr [rdx+40h]
fffff801`ed83b43a 488bcb          mov     rcx,rbx
fffff801`ed83b43d e8ca8efdff      call    storport!RaidResumeAdapterQueue (fffff801`ed81430c)
fffff801`ed83b442 85c0            test    eax,eax
fffff801`ed83b444 750a            jne     storport!RaidPauseTimerDpcRoutine+0x20 (fffff801`ed83b450)  Branch

storport!RaidPauseTimerDpcRoutine+0x16:
fffff801`ed83b446 33d2            xor     edx,edx
fffff801`ed83b448 488bcb          mov     rcx,rbx
fffff801`ed83b44b e8e087fdff      call    storport!RaidAdapterRestartQueues (fffff801`ed813c30)

storport!RaidPauseTimerDpcRoutine+0x20:
fffff801`ed83b450 4883c420        add     rsp,20h
fffff801`ed83b454 5b              pop     rbx
fffff801`ed83b455 c3              ret
