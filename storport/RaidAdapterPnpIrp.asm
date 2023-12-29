1: kd> uf storport!RaidAdapterPnpIrp
storport!RaidAdapterPnpIrp:
fffff809`efc12058 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff809`efc1205d 55              push    rbp
fffff809`efc1205e 56              push    rsi
fffff809`efc1205f 57              push    rdi
fffff809`efc12060 4155            push    r13
fffff809`efc12062 4156            push    r14
fffff809`efc12064 4883ec70        sub     rsp,70h
fffff809`efc12068 488b0521c20400  mov     rax,qword ptr [storport!_security_cookie (fffff809`efc5e290)]
fffff809`efc1206f 4833c4          xor     rax,rsp
fffff809`efc12072 4889442460      mov     qword ptr [rsp+60h],rax
fffff809`efc12077 33c0            xor     eax,eax
fffff809`efc12079 488bda          mov     rbx,rdx
fffff809`efc1207c 4889442440      mov     qword ptr [rsp+40h],rax
fffff809`efc12081 488bf9          mov     rdi,rcx
fffff809`efc12084 4889442448      mov     qword ptr [rsp+48h],rax
fffff809`efc12089 e85298ffff      call    storport!RaidAcquireAdapterRemoveLock (fffff809`efc0b8e0)
fffff809`efc1208e 803dcbc7040000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff809`efc5e860)],0
fffff809`efc12095 8bf0            mov     esi,eax
fffff809`efc12097 488b8bb8000000  mov     rcx,qword ptr [rbx+0B8h]
fffff809`efc1209e 0fb66901        movzx   ebp,byte ptr [rcx+1]
fffff809`efc120a2 7430            je      storport!RaidAdapterPnpIrp+0x7c (fffff809`efc120d4)  Branch

storport!RaidAdapterPnpIrp+0x4c:
fffff809`efc120a4 488d542440      lea     rdx,[rsp+40h]
fffff809`efc120a9 488bcb          mov     rcx,rbx
fffff809`efc120ac 48ff159d200500  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff809`efc64150)]
fffff809`efc120b3 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc120b8 83fd16          cmp     ebp,16h
fffff809`efc120bb 770a            ja      storport!RaidAdapterPnpIrp+0x6f (fffff809`efc120c7)  Branch

storport!RaidAdapterPnpIrp+0x65:
fffff809`efc120bd b880004800      mov     eax,480080h
fffff809`efc120c2 0fa3e8          bt      eax,ebp
fffff809`efc120c5 720d            jb      storport!RaidAdapterPnpIrp+0x7c (fffff809`efc120d4)  Branch

storport!RaidAdapterPnpIrp+0x6f:
fffff809`efc120c7 f605f4c6040020  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff809`efc5e7c2)],20h
fffff809`efc120ce 0f85f2330100    jne     storport!RaidAdapterPnpIrp+0x1346e (fffff809`efc254c6)  Branch

storport!RaidAdapterPnpIrp+0x7c:
fffff809`efc120d4 85f6            test    esi,esi
fffff809`efc120d6 0f880f340100    js      storport!RaidAdapterPnpIrp+0x13493 (fffff809`efc254eb)  Branch

storport!RaidAdapterPnpIrp+0x84:
fffff809`efc120dc 41b601          mov     r14b,1
fffff809`efc120df 488b0d1abf0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc120e6 4c8d2d13bf0400  lea     r13,[storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc120ed 493bcd          cmp     rcx,r13
fffff809`efc120f0 740b            je      storport!RaidAdapterPnpIrp+0xa5 (fffff809`efc120fd)  Branch

storport!RaidAdapterPnpIrp+0x9a:
fffff809`efc120f2 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc120f5 a802            test    al,2
fffff809`efc120f7 0f851d340100    jne     storport!RaidAdapterPnpIrp+0x134c2 (fffff809`efc2551a)  Branch

storport!RaidAdapterPnpIrp+0xa5:
fffff809`efc120fd 83fd07          cmp     ebp,7
fffff809`efc12100 0f8693000000    jbe     storport!RaidAdapterPnpIrp+0x141 (fffff809`efc12199)  Branch

storport!RaidAdapterPnpIrp+0xae:
fffff809`efc12106 8bc5            mov     eax,ebp
fffff809`efc12108 83e808          sub     eax,8
fffff809`efc1210b 0f84de000000    je      storport!RaidAdapterPnpIrp+0x197 (fffff809`efc121ef)  Branch

storport!RaidAdapterPnpIrp+0xb9:
fffff809`efc12111 83e801          sub     eax,1
fffff809`efc12114 755f            jne     storport!RaidAdapterPnpIrp+0x11d (fffff809`efc12175)  Branch

storport!RaidAdapterPnpIrp+0xbe:
fffff809`efc12116 488bd3          mov     rdx,rbx
fffff809`efc12119 488bcf          mov     rcx,rdi
fffff809`efc1211c e8a75a0500      call    storport!RaidAdapterQueryCapabilitiesIrp (fffff809`efc67bc8)

storport!RaidAdapterPnpIrp+0xc9:
fffff809`efc12121 8bf0            mov     esi,eax
fffff809`efc12123 488b0dd6be0400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff809`efc5e000)]
fffff809`efc1212a 493bcd          cmp     rcx,r13
fffff809`efc1212d 740b            je      storport!RaidAdapterPnpIrp+0xe2 (fffff809`efc1213a)  Branch

storport!RaidAdapterPnpIrp+0xd7:
fffff809`efc1212f 8b412c          mov     eax,dword ptr [rcx+2Ch]
fffff809`efc12132 a802            test    al,2
fffff809`efc12134 0f8584350100    jne     storport!RaidAdapterPnpIrp+0x13666 (fffff809`efc256be)  Branch

storport!RaidAdapterPnpIrp+0xe2:
fffff809`efc1213a 4584f6          test    r14b,r14b
fffff809`efc1213d 7413            je      storport!RaidAdapterPnpIrp+0xfa (fffff809`efc12152)  Branch

storport!RaidAdapterPnpIrp+0xe7:
fffff809`efc1213f 488b8f00010000  mov     rcx,qword ptr [rdi+100h]
fffff809`efc12146 48ff1543210500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff809`efc64290)]
fffff809`efc1214d 0f1f440000      nop     dword ptr [rax+rax]

storport!RaidAdapterPnpIrp+0xfa:
fffff809`efc12152 8bc6            mov     eax,esi

storport!RaidAdapterPnpIrp+0xfc:
fffff809`efc12154 488b4c2460      mov     rcx,qword ptr [rsp+60h]
fffff809`efc12159 4833cc          xor     rcx,rsp
fffff809`efc1215c e88f0e0100      call    storport!_security_check_cookie (fffff809`efc22ff0)
fffff809`efc12161 488b9c24b0000000 mov     rbx,qword ptr [rsp+0B0h]
fffff809`efc12169 4883c470        add     rsp,70h
fffff809`efc1216d 415e            pop     r14
fffff809`efc1216f 415d            pop     r13
fffff809`efc12171 5f              pop     rdi
fffff809`efc12172 5e              pop     rsi
fffff809`efc12173 5d              pop     rbp
fffff809`efc12174 c3              ret

storport!RaidAdapterPnpIrp+0x11d:
fffff809`efc12175 83e804          sub     eax,4
fffff809`efc12178 0f8401010000    je      storport!RaidAdapterPnpIrp+0x227 (fffff809`efc1227f)  Branch

storport!RaidAdapterPnpIrp+0x126:
fffff809`efc1217e 83e806          sub     eax,6
fffff809`efc12181 0f84e8340100    je      storport!RaidAdapterPnpIrp+0x13617 (fffff809`efc2566f)  Branch

storport!RaidAdapterPnpIrp+0x12f:
fffff809`efc12187 83e801          sub     eax,1
fffff809`efc1218a 7539            jne     storport!RaidAdapterPnpIrp+0x16d (fffff809`efc121c5)  Branch

storport!RaidAdapterPnpIrp+0x134:
fffff809`efc1218c 488bd3          mov     rdx,rbx
fffff809`efc1218f 488bcf          mov     rcx,rdi
fffff809`efc12192 e8c15a0500      call    storport!RaidAdapterQueryPnpDeviceStateIrp (fffff809`efc67c58)
fffff809`efc12197 eb88            jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x141:
fffff809`efc12199 0f85c6000000    jne     storport!RaidAdapterPnpIrp+0x20d (fffff809`efc12265)  Branch

storport!RaidAdapterPnpIrp+0x147:
fffff809`efc1219f 803dbac6040000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff809`efc5e860)],0
fffff809`efc121a6 740d            je      storport!RaidAdapterPnpIrp+0x15d (fffff809`efc121b5)  Branch

storport!RaidAdapterPnpIrp+0x150:
fffff809`efc121a8 f60513c6040020  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff809`efc5e7c2)],20h
fffff809`efc121af 0f8521340100    jne     storport!RaidAdapterPnpIrp+0x1357e (fffff809`efc255d6)  Branch

storport!RaidAdapterPnpIrp+0x15d:
fffff809`efc121b5 488bd3          mov     rdx,rbx
fffff809`efc121b8 488bcf          mov     rcx,rdi
fffff809`efc121bb e820010000      call    storport!RaidAdapterQueryDeviceRelationsIrp (fffff809`efc122e0)
fffff809`efc121c0 e95cffffff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x16d:
fffff809`efc121c5 83e802          sub     eax,2
fffff809`efc121c8 7535            jne     storport!RaidAdapterPnpIrp+0x1a7 (fffff809`efc121ff)  Branch

storport!RaidAdapterPnpIrp+0x172:
fffff809`efc121ca 380590c60400    cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff809`efc5e860)],al
fffff809`efc121d0 740d            je      storport!RaidAdapterPnpIrp+0x187 (fffff809`efc121df)  Branch

storport!RaidAdapterPnpIrp+0x17a:
fffff809`efc121d2 f605e9c5040020  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff809`efc5e7c2)],20h
fffff809`efc121d9 0f855e340100    jne     storport!RaidAdapterPnpIrp+0x135e5 (fffff809`efc2563d)  Branch

storport!RaidAdapterPnpIrp+0x187:
fffff809`efc121df 488bd3          mov     rdx,rbx
fffff809`efc121e2 488bcf          mov     rcx,rdi
fffff809`efc121e5 e816faffff      call    storport!RaidAdapterDeviceUsageNotificationIrp (fffff809`efc11c00)
fffff809`efc121ea e932ffffff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x197:
fffff809`efc121ef 488bd3          mov     rdx,rbx
fffff809`efc121f2 488bcf          mov     rcx,rdi
fffff809`efc121f5 e846e00000      call    storport!RaidAdapterQueryInterfaceIrp (fffff809`efc20240)
fffff809`efc121fa e922ffffff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x1a7:
fffff809`efc121ff 83f801          cmp     eax,1
fffff809`efc12202 0f8421340100    je      storport!RaidAdapterPnpIrp+0x135d1 (fffff809`efc25629)  Branch

storport!RaidAdapterPnpIrp+0x1b0:
fffff809`efc12208 488b8f00010000  mov     rcx,qword ptr [rdi+100h]
fffff809`efc1220f 48ff157a200500  call    qword ptr [storport!_imp_ExReleaseRundownProtectionCacheAware (fffff809`efc64290)]
fffff809`efc12216 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc1221b 4532f6          xor     r14b,r14b
fffff809`efc1221e 4438353bc60400  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff809`efc5e860)],r14b
fffff809`efc12225 742d            je      storport!RaidAdapterPnpIrp+0x1fc (fffff809`efc12254)  Branch

storport!RaidAdapterPnpIrp+0x1cf:
fffff809`efc12227 33c0            xor     eax,eax
fffff809`efc12229 488d542450      lea     rdx,[rsp+50h]
fffff809`efc1222e 488bcb          mov     rcx,rbx
fffff809`efc12231 4889442450      mov     qword ptr [rsp+50h],rax
fffff809`efc12236 4889442458      mov     qword ptr [rsp+58h],rax
fffff809`efc1223b 48ff150e1f0500  call    qword ptr [storport!_imp_IoGetActivityIdIrp (fffff809`efc64150)]
fffff809`efc12242 0f1f440000      nop     dword ptr [rax+rax]
fffff809`efc12247 f60574c5040020  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff809`efc5e7c2)],20h
fffff809`efc1224e 0f85b4330100    jne     storport!RaidAdapterPnpIrp+0x135b0 (fffff809`efc25608)  Branch

storport!RaidAdapterPnpIrp+0x1fc:
fffff809`efc12254 488b4f18        mov     rcx,qword ptr [rdi+18h]
fffff809`efc12258 488bd3          mov     rdx,rbx
fffff809`efc1225b e838000000      call    storport!RaForwardIrp (fffff809`efc12298)
fffff809`efc12260 e9bcfeffff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x20d:
fffff809`efc12265 8bc5            mov     eax,ebp
fffff809`efc12267 85ed            test    ebp,ebp
fffff809`efc12269 0f85dc320100    jne     storport!RaidAdapterPnpIrp+0x134f3 (fffff809`efc2554b)  Branch

storport!RaidAdapterPnpIrp+0x217:
fffff809`efc1226f 488bd3          mov     rdx,rbx
fffff809`efc12272 488bcf          mov     rcx,rdi
fffff809`efc12275 e8f2710000      call    storport!RaidAdapterStartDeviceIrp (fffff809`efc1946c)
fffff809`efc1227a e9a2feffff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x227:
fffff809`efc1227f 488bd3          mov     rdx,rbx
fffff809`efc12282 488bcf          mov     rcx,rdi
fffff809`efc12285 e826b20500      call    storport!RaidAdapterFilterResourceRequirementsIrp (fffff809`efc6d4b0)
fffff809`efc1228a e992feffff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x1346e:
fffff809`efc254c6 488b4708        mov     rax,qword ptr [rdi+8]
fffff809`efc254ca 4c8d442440      lea     r8,[rsp+40h]
fffff809`efc254cf 4889442430      mov     qword ptr [rsp+30h],rax
fffff809`efc254d4 4c8bcb          mov     r9,rbx
fffff809`efc254d7 8364242800      and     dword ptr [rsp+28h],0
fffff809`efc254dc 896c2420        mov     dword ptr [rsp+20h],ebp
fffff809`efc254e0 e80bcf0000      call    storport!McTemplateK0pddp (fffff809`efc323f0)
fffff809`efc254e5 90              nop
fffff809`efc254e6 e9e9cbfeff      jmp     storport!RaidAdapterPnpIrp+0x7c (fffff809`efc120d4)  Branch

storport!RaidAdapterPnpIrp+0x13493:
fffff809`efc254eb 81fe560000c0    cmp     esi,0C0000056h
fffff809`efc254f1 750f            jne     storport!RaidAdapterPnpIrp+0x134aa (fffff809`efc25502)  Branch

storport!RaidAdapterPnpIrp+0x1349b:
fffff809`efc254f3 83fd02          cmp     ebp,2
fffff809`efc254f6 750a            jne     storport!RaidAdapterPnpIrp+0x134aa (fffff809`efc25502)  Branch

storport!RaidAdapterPnpIrp+0x134a0:
fffff809`efc254f8 837f5805        cmp     dword ptr [rdi+58h],5
fffff809`efc254fc 0f84dacbfeff    je      storport!RaidAdapterPnpIrp+0x84 (fffff809`efc120dc)  Branch

storport!RaidAdapterPnpIrp+0x134aa:
fffff809`efc25502 4883633800      and     qword ptr [rbx+38h],0
fffff809`efc25507 448bc6          mov     r8d,esi
fffff809`efc2550a 33d2            xor     edx,edx
fffff809`efc2550c 488bcb          mov     rcx,rbx
fffff809`efc2550f e89c40feff      call    storport!RaidCompleteRequestEx (fffff809`efc095b0)
fffff809`efc25514 90              nop
fffff809`efc25515 e93accfeff      jmp     storport!RaidAdapterPnpIrp+0xfc (fffff809`efc12154)  Branch

storport!RaidAdapterPnpIrp+0x134c2:
fffff809`efc2551a 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc2551e 0f82d9cbfeff    jb      storport!RaidAdapterPnpIrp+0xa5 (fffff809`efc120fd)  Branch

storport!RaidAdapterPnpIrp+0x134cc:
fffff809`efc25524 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`efc25528 4c8d0509190300  lea     r8,[storport!WPP_dd435e78b7a432f8405f8f56a0e26d40_Traceguids (fffff809`efc56e38)]
fffff809`efc2552f ba0c000000      mov     edx,0Ch
fffff809`efc25534 896c2428        mov     dword ptr [rsp+28h],ebp
fffff809`efc25538 4c8bcf          mov     r9,rdi
fffff809`efc2553b 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff809`efc25540 e877260100      call    storport!WPP_SF_qqD (fffff809`efc37bbc)
fffff809`efc25545 90              nop
fffff809`efc25546 e9b2cbfeff      jmp     storport!RaidAdapterPnpIrp+0xa5 (fffff809`efc120fd)  Branch

storport!RaidAdapterPnpIrp+0x134f3:
fffff809`efc2554b 83e801          sub     eax,1 ;if(MINOR CODE == IRP_MN_QUERY_REMOVE_DEVICE) call RaidAdapterQueryRemoveDeviceIrp()
fffff809`efc2554e 7475            je      storport!RaidAdapterPnpIrp+0x1356d (fffff809`efc255c5)  Branch

storport!RaidAdapterPnpIrp+0x134f8:
fffff809`efc25550 83e801          sub     eax,1
fffff809`efc25553 745c            je      storport!RaidAdapterPnpIrp+0x13559 (fffff809`efc255b1)  Branch

storport!RaidAdapterPnpIrp+0x134fd:
fffff809`efc25555 83e801          sub     eax,1
fffff809`efc25558 7446            je      storport!RaidAdapterPnpIrp+0x13548 (fffff809`efc255a0)  Branch

storport!RaidAdapterPnpIrp+0x13502:
fffff809`efc2555a 83e801          sub     eax,1
fffff809`efc2555d 7430            je      storport!RaidAdapterPnpIrp+0x13537 (fffff809`efc2558f)  Branch

storport!RaidAdapterPnpIrp+0x13507:
fffff809`efc2555f 83e801          sub     eax,1
fffff809`efc25562 741a            je      storport!RaidAdapterPnpIrp+0x13526 (fffff809`efc2557e)  Branch

storport!RaidAdapterPnpIrp+0x1350c:
fffff809`efc25564 83f801          cmp     eax,1
fffff809`efc25567 0f859bccfeff    jne     storport!RaidAdapterPnpIrp+0x1b0 (fffff809`efc12208)  Branch

storport!RaidAdapterPnpIrp+0x13515:
fffff809`efc2556d 488bd3          mov     rdx,rbx
fffff809`efc25570 488bcf          mov     rcx,rdi
fffff809`efc25573 e8b09e0400      call    storport!RaidAdapterCancelRemoveDeviceIrp (fffff809`efc6f428)
fffff809`efc25578 90              nop
fffff809`efc25579 e9a3cbfeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x13526:
fffff809`efc2557e 488bd3          mov     rdx,rbx
fffff809`efc25581 488bcf          mov     rcx,rdi
fffff809`efc25584 e827b60400      call    storport!RaidAdapterQueryStopDeviceIrp (fffff809`efc70bb0)
fffff809`efc25589 90              nop
fffff809`efc2558a e992cbfeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x13537:
fffff809`efc2558f 488bd3          mov     rdx,rbx
fffff809`efc25592 488bcf          mov     rcx,rdi
fffff809`efc25595 e882b90400      call    storport!RaidAdapterStopDeviceIrp (fffff809`efc70f1c)
fffff809`efc2559a 90              nop
fffff809`efc2559b e981cbfeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x13548:
fffff809`efc255a0 488bd3          mov     rdx,rbx
fffff809`efc255a3 488bcf          mov     rcx,rdi
fffff809`efc255a6 e87d9e0400      call    storport!RaidAdapterCancelRemoveDeviceIrp (fffff809`efc6f428)
fffff809`efc255ab 90              nop
fffff809`efc255ac e970cbfeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x13559:
fffff809`efc255b1 4532f6          xor     r14b,r14b
fffff809`efc255b4 488bd3          mov     rdx,rbx
fffff809`efc255b7 488bcf          mov     rcx,rdi
fffff809`efc255ba e835b80400      call    storport!RaidAdapterRemoveDeviceIrp (fffff809`efc70df4)
fffff809`efc255bf 90              nop
fffff809`efc255c0 e95ccbfeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x1356d:
fffff809`efc255c5 488bd3          mov     rdx,rbx
fffff809`efc255c8 488bcf          mov     rcx,rdi
fffff809`efc255cb e83cb50400      call    storport!RaidAdapterQueryRemoveDeviceIrp (fffff809`efc70b0c)
fffff809`efc255d0 90              nop
fffff809`efc255d1 e94bcbfeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x1357e:
fffff809`efc255d6 488b4708        mov     rax,qword ptr [rdi+8]
fffff809`efc255da 4c8d442440      lea     r8,[rsp+40h]
fffff809`efc255df 488b8bb8000000  mov     rcx,qword ptr [rbx+0B8h]
fffff809`efc255e6 4c8bcb          mov     r9,rbx
fffff809`efc255e9 4889442430      mov     qword ptr [rsp+30h],rax
fffff809`efc255ee 8b4108          mov     eax,dword ptr [rcx+8]
fffff809`efc255f1 89442428        mov     dword ptr [rsp+28h],eax
fffff809`efc255f5 c744242007000000 mov     dword ptr [rsp+20h],7
fffff809`efc255fd e8eecd0000      call    storport!McTemplateK0pddp (fffff809`efc323f0)
fffff809`efc25602 90              nop
fffff809`efc25603 e9adcbfeff      jmp     storport!RaidAdapterPnpIrp+0x15d (fffff809`efc121b5)  Branch

storport!RaidAdapterPnpIrp+0x135b0:
fffff809`efc25608 8b4330          mov     eax,dword ptr [rbx+30h]
fffff809`efc2560b 4c8d442450      lea     r8,[rsp+50h]
fffff809`efc25610 4c8bcb          mov     r9,rbx
fffff809`efc25613 89442420        mov     dword ptr [rsp+20h],eax
fffff809`efc25617 488d153a170300  lea     rdx,[storport!EventPnpRequestComplete (fffff809`efc56d58)]
fffff809`efc2561e e8cdcc0000      call    storport!McTemplateK0pd (fffff809`efc322f0)
fffff809`efc25623 90              nop
fffff809`efc25624 e92bccfeff      jmp     storport!RaidAdapterPnpIrp+0x1fc (fffff809`efc12254)  Branch

storport!RaidAdapterPnpIrp+0x135d1:
fffff809`efc25629 4532f6          xor     r14b,r14b
fffff809`efc2562c 488bd3          mov     rdx,rbx
fffff809`efc2562f 488bcf          mov     rcx,rdi
fffff809`efc25632 e8a5ba0400      call    storport!RaidAdapterSurpriseRemovalIrp (fffff809`efc710dc)
fffff809`efc25637 90              nop
fffff809`efc25638 e9e4cafeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x135e5:
fffff809`efc2563d 488b4708        mov     rax,qword ptr [rdi+8]
fffff809`efc25641 4c8d442440      lea     r8,[rsp+40h]
fffff809`efc25646 488b8bb8000000  mov     rcx,qword ptr [rbx+0B8h]
fffff809`efc2564d 4c8bcb          mov     r9,rbx
fffff809`efc25650 4889442430      mov     qword ptr [rsp+30h],rax
fffff809`efc25655 8b4110          mov     eax,dword ptr [rcx+10h]
fffff809`efc25658 89442428        mov     dword ptr [rsp+28h],eax
fffff809`efc2565c c744242016000000 mov     dword ptr [rsp+20h],16h
fffff809`efc25664 e887cd0000      call    storport!McTemplateK0pddp (fffff809`efc323f0)
fffff809`efc25669 90              nop
fffff809`efc2566a e970cbfeff      jmp     storport!RaidAdapterPnpIrp+0x187 (fffff809`efc121df)  Branch

storport!RaidAdapterPnpIrp+0x13617:
fffff809`efc2566f 803dea91030000  cmp     byte ptr [storport!StorEtwLoggingEnabled (fffff809`efc5e860)],0
fffff809`efc25676 7435            je      storport!RaidAdapterPnpIrp+0x13655 (fffff809`efc256ad)  Branch

storport!RaidAdapterPnpIrp+0x13620:
fffff809`efc25678 f6054391030020  test    byte ptr [storport!Microsoft_Windows_StorPortEnableBits+0x2 (fffff809`efc5e7c2)],20h
fffff809`efc2567f 742c            je      storport!RaidAdapterPnpIrp+0x13655 (fffff809`efc256ad)  Branch

storport!RaidAdapterPnpIrp+0x13629:
fffff809`efc25681 488b4708        mov     rax,qword ptr [rdi+8]
fffff809`efc25685 4c8d442440      lea     r8,[rsp+40h]
fffff809`efc2568a 488b8bb8000000  mov     rcx,qword ptr [rbx+0B8h]
fffff809`efc25691 4c8bcb          mov     r9,rbx
fffff809`efc25694 4889442430      mov     qword ptr [rsp+30h],rax
fffff809`efc25699 8b4108          mov     eax,dword ptr [rcx+8]
fffff809`efc2569c 89442428        mov     dword ptr [rsp+28h],eax
fffff809`efc256a0 c744242013000000 mov     dword ptr [rsp+20h],13h
fffff809`efc256a8 e843cd0000      call    storport!McTemplateK0pddp (fffff809`efc323f0)

storport!RaidAdapterPnpIrp+0x13655:
fffff809`efc256ad 488bd3          mov     rdx,rbx
fffff809`efc256b0 488bcf          mov     rcx,rdi
fffff809`efc256b3 e88cf20000      call    storport!RaidAdapterQueryIdIrp (fffff809`efc34944)
fffff809`efc256b8 90              nop
fffff809`efc256b9 e963cafeff      jmp     storport!RaidAdapterPnpIrp+0xc9 (fffff809`efc12121)  Branch

storport!RaidAdapterPnpIrp+0x13666:
fffff809`efc256be 80792904        cmp     byte ptr [rcx+29h],4
fffff809`efc256c2 0f8272cafeff    jb      storport!RaidAdapterPnpIrp+0xe2 (fffff809`efc1213a)  Branch

storport!RaidAdapterPnpIrp+0x13670:
fffff809`efc256c8 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff809`efc256cc 4c8d0565170300  lea     r8,[storport!WPP_dd435e78b7a432f8405f8f56a0e26d40_Traceguids (fffff809`efc56e38)]
fffff809`efc256d3 89742430        mov     dword ptr [rsp+30h],esi
fffff809`efc256d7 ba0d000000      mov     edx,0Dh
fffff809`efc256dc 896c2428        mov     dword ptr [rsp+28h],ebp
fffff809`efc256e0 4c8bcf          mov     r9,rdi
fffff809`efc256e3 48895c2420      mov     qword ptr [rsp+20h],rbx
fffff809`efc256e8 e82f250100      call    storport!WPP_SF_qqDD (fffff809`efc37c1c)
fffff809`efc256ed 90              nop
fffff809`efc256ee e947cafeff      jmp     storport!RaidAdapterPnpIrp+0xe2 (fffff809`efc1213a)  Branch
