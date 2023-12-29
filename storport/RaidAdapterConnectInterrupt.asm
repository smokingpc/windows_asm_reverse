63: kd> uf RaidAdapterConnectInterrupt
storport!RaidAdapterConnectInterrupt:
fffff803`12562678 4c8bdc          mov     r11,rsp
fffff803`1256267b 55              push    rbp
fffff803`1256267c 53              push    rbx
fffff803`1256267d 56              push    rsi
fffff803`1256267e 57              push    rdi
fffff803`1256267f 488bec          mov     rbp,rsp
fffff803`12562682 4883ec68        sub     rsp,68h
fffff803`12562686 83654000        and     dword ptr [rbp+40h],0
fffff803`1256268a 488bd9          mov     rbx,rcx
fffff803`1256268d 8365d800        and     dword ptr [rbp-28h],0
fffff803`12562691 4881c140010000  add     rcx,140h
fffff803`12562698 0f57c0          xorps   xmm0,xmm0
fffff803`1256269b c6453800        mov     byte ptr [rbp+38h],0
fffff803`1256269f 0f1145e0        movups  xmmword ptr [rbp-20h],xmm0
fffff803`125626a3 c6453000        mov     byte ptr [rbp+30h],0
fffff803`125626a7 48833900        cmp     qword ptr [rcx],0
fffff803`125626ab c6452800        mov     byte ptr [rbp+28h],0
fffff803`125626af 0f8409010000    je      storport!RaidAdapterConnectInterrupt+0x146 (fffff803`125627be)  Branch

storport!RaidAdapterConnectInterrupt+0x3d:
fffff803`125626b5 4883bb4801000000 cmp     qword ptr [rbx+148h],0
fffff803`125626bd 0f84fb000000    je      storport!RaidAdapterConnectInterrupt+0x146 (fffff803`125627be)  Branch

storport!RaidAdapterConnectInterrupt+0x4b:
fffff803`125626c3 8a9390100000    mov     dl,byte ptr [rbx+1090h]
fffff803`125626c9 488d4528        lea     rax,[rbp+28h]
fffff803`125626cd 498943b0        mov     qword ptr [r11-50h],rax
fffff803`125626d1 4c8d4d38        lea     r9,[rbp+38h]
fffff803`125626d5 488d45e0        lea     rax,[rbp-20h]
fffff803`125626d9 498943a8        mov     qword ptr [r11-58h],rax
fffff803`125626dd 4c8d4540        lea     r8,[rbp+40h]
fffff803`125626e1 488d4530        lea     rax,[rbp+30h]
fffff803`125626e5 498943a0        mov     qword ptr [r11-60h],rax
fffff803`125626e9 488d45d8        lea     rax,[rbp-28h]
fffff803`125626ed 49894398        mov     qword ptr [r11-68h],rax
fffff803`125626f1 e8826e0100      call    storport!RaidGetResourceListInterrupt (fffff803`12579578)
fffff803`125626f6 8bf8            mov     edi,eax
fffff803`125626f8 85c0            test    eax,eax
fffff803`125626fa 793e            jns     storport!RaidAdapterConnectInterrupt+0xc2 (fffff803`1256273a)  Branch

storport!RaidAdapterConnectInterrupt+0x84:
fffff803`125626fc 488b0dfd180400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`125a4000)]
fffff803`12562703 488d15f6180400  lea     rdx,[storport!WPP_GLOBAL_Control (fffff803`125a4000)]
fffff803`1256270a 483bca          cmp     rcx,rdx
fffff803`1256270d 7424            je      storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0x97:
fffff803`1256270f f7412c00200000  test    dword ptr [rcx+2Ch],2000h
fffff803`12562716 741b            je      storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0xa0:
fffff803`12562718 80792902        cmp     byte ptr [rcx+29h],2
fffff803`1256271c 7215            jb      storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0xa6:
fffff803`1256271e ba14000000      mov     edx,14h

storport!RaidAdapterConnectInterrupt+0xab:
fffff803`12562723 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff803`12562727 4c8d05023c0300  lea     r8,[storport!WPP_4aa03a9dc1f03838a78971cbb08684eb_Traceguids (fffff803`12596330)]
fffff803`1256272e e849790000      call    storport!WPP_SF_ (fffff803`1256a07c)

storport!RaidAdapterConnectInterrupt+0xbb:
fffff803`12562733 8bc7            mov     eax,edi
fffff803`12562735 e986000000      jmp     storport!RaidAdapterConnectInterrupt+0x148 (fffff803`125627c0)  Branch

storport!RaidAdapterConnectInterrupt+0xc2:
fffff803`1256273a 80bb9010000000  cmp     byte ptr [rbx+1090h],0
fffff803`12562741 488bcb          mov     rcx,rbx
fffff803`12562744 740e            je      storport!RaidAdapterConnectInterrupt+0xdc (fffff803`12562754)  Branch

storport!RaidAdapterConnectInterrupt+0xce:
fffff803`12562746 408a7528        mov     sil,byte ptr [rbp+28h]
fffff803`1256274a 408ad6          mov     dl,sil
fffff803`1256274d e8fe390500      call    storport!RaidAdapterConnectMSIInterrupt (fffff803`125b6150)
fffff803`12562752 eb29            jmp     storport!RaidAdapterConnectInterrupt+0x105 (fffff803`1256277d)  Branch

storport!RaidAdapterConnectInterrupt+0xdc:
fffff803`12562754 408a7538        mov     sil,byte ptr [rbp+38h]
fffff803`12562758 488d45e0        lea     rax,[rbp-20h]
fffff803`1256275c 8b5540          mov     edx,dword ptr [rbp+40h]
fffff803`1256275f 448ace          mov     r9b,sil
fffff803`12562762 4889442430      mov     qword ptr [rsp+30h],rax
fffff803`12562767 448ac6          mov     r8b,sil
fffff803`1256276a 8a4530          mov     al,byte ptr [rbp+30h]
fffff803`1256276d 88442428        mov     byte ptr [rsp+28h],al
fffff803`12562771 c6839110000000  mov     byte ptr [rbx+1091h],0
fffff803`12562778 e8873b0500      call    storport!RaidAdapterConnectNonMSIInterrupt (fffff803`125b6304)

storport!RaidAdapterConnectInterrupt+0x105:
fffff803`1256277d 8bf8            mov     edi,eax
fffff803`1256277f 85c0            test    eax,eax
fffff803`12562781 792c            jns     storport!RaidAdapterConnectInterrupt+0x137 (fffff803`125627af)  Branch

storport!RaidAdapterConnectInterrupt+0x10b:
fffff803`12562783 488b0d76180400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff803`125a4000)]
fffff803`1256278a 488d156f180400  lea     rdx,[storport!WPP_GLOBAL_Control (fffff803`125a4000)]
fffff803`12562791 483bca          cmp     rcx,rdx
fffff803`12562794 749d            je      storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0x11e:
fffff803`12562796 f7412c00200000  test    dword ptr [rcx+2Ch],2000h
fffff803`1256279d 7494            je      storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0x127:
fffff803`1256279f 80792902        cmp     byte ptr [rcx+29h],2
fffff803`125627a3 728e            jb      storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0x12d:
fffff803`125627a5 ba15000000      mov     edx,15h
fffff803`125627aa e974ffffff      jmp     storport!RaidAdapterConnectInterrupt+0xab (fffff803`12562723)  Branch

storport!RaidAdapterConnectInterrupt+0x137:
fffff803`125627af 400fb6c6        movzx   eax,sil
fffff803`125627b3 8983d8020000    mov     dword ptr [rbx+2D8h],eax
fffff803`125627b9 e975ffffff      jmp     storport!RaidAdapterConnectInterrupt+0xbb (fffff803`12562733)  Branch

storport!RaidAdapterConnectInterrupt+0x146:
fffff803`125627be 33c0            xor     eax,eax

storport!RaidAdapterConnectInterrupt+0x148:
fffff803`125627c0 4883c468        add     rsp,68h
fffff803`125627c4 5f              pop     rdi
fffff803`125627c5 5e              pop     rsi
fffff803`125627c6 5b              pop     rbx
fffff803`125627c7 5d              pop     rbp
fffff803`125627c8 c3              ret
