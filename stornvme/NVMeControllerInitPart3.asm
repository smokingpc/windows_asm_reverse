0: kd> uf NVMeControllerInitPart3
stornvme!NVMeControllerInitPart3:
fffff801`78086510 48895c2408      mov     qword ptr [rsp+8],rbx
fffff801`78086515 57              push    rdi
fffff801`78086516 4883ec20        sub     rsp,20h
fffff801`7808651a 408afa          mov     dil,dl
fffff801`7808651d 488bd9          mov     rbx,rcx
fffff801`78086520 e8bbf10000      call    stornvme!NVMeGetCommandEffectsLog (fffff801`780956e0)
fffff801`78086525 8b4334          mov     eax,dword ptr [rbx+34h]
fffff801`78086528 a804            test    al,4
fffff801`7808652a 750b            jne     stornvme!NVMeControllerInitPart3+0x27 (fffff801`78086537)  Branch

stornvme!NVMeControllerInitPart3+0x1c:
fffff801`7808652c 408ad7          mov     dl,dil
fffff801`7808652f 488bcb          mov     rcx,rbx
fffff801`78086532 e835f30000      call    stornvme!NVMeGetTemperatureThreshold (fffff801`7809586c)

stornvme!NVMeControllerInitPart3+0x27:
fffff801`78086537 408ad7          mov     dl,dil
fffff801`7808653a 488bcb          mov     rcx,rbx
fffff801`7808653d e8c6e30000      call    stornvme!NVMeConfigAsyncEvent (fffff801`78094908)
fffff801`78086542 488bcb          mov     rcx,rbx
fffff801`78086545 e892930000      call    stornvme!NVMeStartAsyncEventCommands (fffff801`7808f8dc)
fffff801`7808654a 488b83f8050000  mov     rax,qword ptr [rbx+5F8h]
fffff801`78086551 f6800802000040  test    byte ptr [rax+208h],40h
fffff801`78086558 7408            je      stornvme!NVMeControllerInitPart3+0x52 (fffff801`78086562)  Branch

stornvme!NVMeControllerInitPart3+0x4a:
fffff801`7808655a 488bcb          mov     rcx,rbx
fffff801`7808655d e86a150100      call    stornvme!NVMeSyncHostTime (fffff801`78097acc)

stornvme!NVMeControllerInitPart3+0x52:
fffff801`78086562 488bcb          mov     rcx,rbx
fffff801`78086565 e81e000000      call    stornvme!NVMeLogEtwControllerInfo (fffff801`78086588)
fffff801`7808656a 83631800        and     dword ptr [rbx+18h],0
fffff801`7808656e b001            mov     al,1
fffff801`78086570 814b1401020000  or      dword ptr [rbx+14h],201h
fffff801`78086577 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff801`7808657c 4883c420        add     rsp,20h
fffff801`78086580 5f              pop     rdi
fffff801`78086581 c3              ret
