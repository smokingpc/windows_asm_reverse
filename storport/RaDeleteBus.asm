storport!RaDeleteBus:
fffff807`329ae638 4053            push    rbx
fffff807`329ae63a 4883ec20        sub     rsp,20h
fffff807`329ae63e 803900          cmp     byte ptr [rcx],0
fffff807`329ae641 488bd9          mov     rbx,rcx
fffff807`329ae644 7420            je      storport!RaDeleteBus+0x2e (fffff807`329ae666)  Branch

storport!RaDeleteBus+0xe:
fffff807`329ae646 488b4120        mov     rax,qword ptr [rcx+20h]
fffff807`329ae64a 488b4910        mov     rcx,qword ptr [rcx+10h]
fffff807`329ae64e ff15cc91ffff    call    qword ptr [storport!_guard_dispatch_icall_fptr (fffff807`329a7820)]
fffff807`329ae654 33d2            xor     edx,edx
fffff807`329ae656 c60300          mov     byte ptr [rbx],0
fffff807`329ae659 488d4b08        lea     rcx,[rbx+8]
fffff807`329ae65d 448d4240        lea     r8d,[rdx+40h]
fffff807`329ae661 e89ad7fbff      call    storport!memset (fffff807`3296be00)

storport!RaDeleteBus+0x2e:
fffff807`329ae666 4883c420        add     rsp,20h
fffff807`329ae66a 5b              pop     rbx
fffff807`329ae66b c3              ret

