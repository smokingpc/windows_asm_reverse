0: kd> uf storport!RaidAdapterScsiIrp
storport!RaidAdapterScsiIrp:
fffff80d`80873f5c 4053            push    rbx
fffff80d`80873f5e 4883ec30        sub     rsp,30h
fffff80d`80873f62 488bda          mov     rbx,rdx
fffff80d`80873f65 4c8bc9          mov     r9,rcx
fffff80d`80873f68 488b0d91d0feff  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`80873f6f 488d058ad0feff  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`80873f76 483bc8          cmp     rcx,rax
fffff80d`80873f79 7427            je      storport!RaidAdapterScsiIrp+0x46 (fffff80d`80873fa2)  Branch

storport!RaidAdapterScsiIrp+0x1f:
fffff80d`80873f7b 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff80d`80873f7e a808            test    al,8
fffff80d`80873f80 7420            je      storport!RaidAdapterScsiIrp+0x46 (fffff80d`80873fa2)  Branch

storport!RaidAdapterScsiIrp+0x26:
fffff80d`80873f82 80792903        cmp     byte ptr [rcx+29h],3
fffff80d`80873f86 721a            jb      storport!RaidAdapterScsiIrp+0x46 (fffff80d`80873fa2)  Branch

storport!RaidAdapterScsiIrp+0x2c:
fffff80d`80873f88 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`80873f8c 4c8d052519feff  lea     r8,[storport!WPP_0e11a8d225a936f45e9b3e6eeadbaef4_Traceguids (fffff80d`808558b8)]
fffff80d`80873f93 ba1f000000      mov     edx,1Fh
fffff80d`80873f98 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff80d`80873f9d e88679fcff      call    storport!WPP_SF_qq (fffff80d`8083b928)

storport!RaidAdapterScsiIrp+0x46:
fffff80d`80873fa2 33d2            xor     edx,edx
fffff80d`80873fa4 41b8010000c0    mov     r8d,0C0000001h
fffff80d`80873faa 488bcb          mov     rcx,rbx
fffff80d`80873fad e8be69f9ff      call    storport!RaidCompleteRequestEx (fffff80d`8080a970)
fffff80d`80873fb2 4883c430        add     rsp,30h
fffff80d`80873fb6 5b              pop     rbx
fffff80d`80873fb7 c3              ret
