0: kd> uf RaidBusEnumeratorIssueSynchronousRequest
storport!RaidBusEnumeratorIssueSynchronousRequest:
fffff80d`808155cc 4c89442418      mov     qword ptr [rsp+18h],r8
fffff80d`808155d1 48894c2408      mov     qword ptr [rsp+8],rcx
fffff80d`808155d6 55              push    rbp
fffff80d`808155d7 53              push    rbx
fffff80d`808155d8 56              push    rsi
fffff80d`808155d9 57              push    rdi
fffff80d`808155da 4154            push    r12
fffff80d`808155dc 4155            push    r13
fffff80d`808155de 4156            push    r14
fffff80d`808155e0 4157            push    r15
fffff80d`808155e2 488dac2418ffffff lea     rbp,[rsp-0E8h]
fffff80d`808155ea 4881ece8010000  sub     rsp,1E8h
fffff80d`808155f1 488b5a08        mov     rbx,qword ptr [rdx+8]
fffff80d`808155f5 488d4dc0        lea     rcx,[rbp-40h]
fffff80d`808155f9 488364245800    and     qword ptr [rsp+58h],0
fffff80d`808155ff 33d2            xor     edx,edx
fffff80d`80815601 498bf9          mov     rdi,r9
fffff80d`80815604 c7854801000002000000 mov dword ptr [rbp+148h],2
fffff80d`8081560e c6855001000000  mov     byte ptr [rbp+150h],0
fffff80d`80815615 4032f6          xor     sil,sil
fffff80d`80815618 4532f6          xor     r14b,r14b
fffff80d`8081561b 448d4258        lea     r8d,[rdx+58h]
fffff80d`8081561f e8dc670100      call    storport!memset (fffff80d`8082be00)
fffff80d`80815624 488b9540010000  mov     rdx,qword ptr [rbp+140h]
fffff80d`8081562b 4532ff          xor     r15b,r15b
fffff80d`8081562e 4532e4          xor     r12b,r12b
fffff80d`80815631 4088b538010000  mov     byte ptr [rbp+138h],sil
fffff80d`80815638 4532ed          xor     r13b,r13b
fffff80d`8081563b 48895c2468      mov     qword ptr [rsp+68h],rbx
fffff80d`80815640 807f0228        cmp     byte ptr [rdi+2],28h
fffff80d`80815644 4c8b0a          mov     r9,qword ptr [rdx]
fffff80d`80815647 4c894c2450      mov     qword ptr [rsp+50h],r9
fffff80d`8081564c 0f8458020000    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x2de (fffff80d`808158aa)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x86:
fffff80d`80815652 0f102f          movups  xmm5,xmmword ptr [rdi]
fffff80d`80815655 448a7f05        mov     r15b,byte ptr [rdi+5]
fffff80d`80815659 0f106710        movups  xmm4,xmmword ptr [rdi+10h]
fffff80d`8081565d 448a6706        mov     r12b,byte ptr [rdi+6]
fffff80d`80815661 0f105f20        movups  xmm3,xmmword ptr [rdi+20h]
fffff80d`80815665 448a6f07        mov     r13b,byte ptr [rdi+7]
fffff80d`80815669 0f105730        movups  xmm2,xmmword ptr [rdi+30h]
fffff80d`8081566d 8a4748          mov     al,byte ptr [rdi+48h]
fffff80d`80815670 0f104f40        movups  xmm1,xmmword ptr [rdi+40h]
fffff80d`80815674 f20f104750      movsd   xmm0,mmword ptr [rdi+50h]
fffff80d`80815679 0f116db0        movups  xmmword ptr [rbp-50h],xmm5
fffff80d`8081567d 0f1165a0        movups  xmmword ptr [rbp-60h],xmm4
fffff80d`80815681 0f115d90        movups  xmmword ptr [rbp-70h],xmm3
fffff80d`80815685 0f115580        movups  xmmword ptr [rbp-80h],xmm2
fffff80d`80815689 0f114c2470      movups  xmmword ptr [rsp+70h],xmm1
fffff80d`8081568e f20f11442460    movsd   mmword ptr [rsp+60h],xmm0

storport!RaidBusEnumeratorIssueSynchronousRequest+0xc8:
fffff80d`80815694 888538010000    mov     byte ptr [rbp+138h],al

storport!RaidBusEnumeratorIssueSynchronousRequest+0xce:
fffff80d`8081569a 807f0228        cmp     byte ptr [rdi+2],28h
fffff80d`8081569e 0f8449010000    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x221 (fffff80d`808157ed)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0xd8:
fffff80d`808156a4 0f112f          movups  xmmword ptr [rdi],xmm5
fffff80d`808156a7 0f116710        movups  xmmword ptr [rdi+10h],xmm4
fffff80d`808156ab 0f115f20        movups  xmmword ptr [rdi+20h],xmm3
fffff80d`808156af 0f115730        movups  xmmword ptr [rdi+30h],xmm2
fffff80d`808156b3 0f114f40        movups  xmmword ptr [rdi+40h],xmm1
fffff80d`808156b7 f20f114750      movsd   mmword ptr [rdi+50h],xmm0

storport!RaidBusEnumeratorIssueSynchronousRequest+0xf0:
fffff80d`808156bc 488b5208        mov     rdx,qword ptr [rdx+8]
fffff80d`808156c0 4c8bc7          mov     r8,rdi
fffff80d`808156c3 498bc9          mov     rcx,r9
fffff80d`808156c6 e825030000      call    storport!RaidBuildScsiIrp (fffff80d`808159f0)
fffff80d`808156cb 85c0            test    eax,eax
fffff80d`808156cd 0f88ae000000    js      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b5 (fffff80d`80815781)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x107:
fffff80d`808156d3 807f0228        cmp     byte ptr [rdi+2],28h
fffff80d`808156d7 8b83f0040000    mov     eax,dword ptr [rbx+4F0h]
fffff80d`808156dd 0f8489010000    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x2a0 (fffff80d`8081586c)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x117:
fffff80d`808156e3 894714          mov     dword ptr [rdi+14h],eax

storport!RaidBusEnumeratorIssueSynchronousRequest+0x11a:
fffff80d`808156e6 488b542450      mov     rdx,qword ptr [rsp+50h]
fffff80d`808156eb 488b4b08        mov     rcx,qword ptr [rbx+8]
fffff80d`808156ef e84cb1ffff      call    storport!RaSendIrpSynchronous (fffff80d`80810840)


fffff80d`808156f4 8bd8            mov     ebx,eax
fffff80d`808156f6 85c0            test    eax,eax
fffff80d`808156f8 0f884da60100    js      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a77f (fffff80d`8082fd4b)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x132:
fffff80d`808156fe 807f0228        cmp     byte ptr [rdi+2],28h
fffff80d`80815702 0f846c010000    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x2a8 (fffff80d`80815874)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x13c:
fffff80d`80815708 4c8b4f20        mov     r9,qword ptr [rdi+20h]
fffff80d`8081570c 8a4f0b          mov     cl,byte ptr [rdi+0Bh]
fffff80d`8081570f 4c894c2458      mov     qword ptr [rsp+58h],r9
fffff80d`80815714 888d50010000    mov     byte ptr [rbp+150h],cl

storport!RaidBusEnumeratorIssueSynchronousRequest+0x14e:
fffff80d`8081571a 8a5703          mov     dl,byte ptr [rdi+3]
fffff80d`8081571d 84d2            test    dl,dl
fffff80d`8081571f 0f8853a50100    js      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6ac (fffff80d`8082fc78)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x159:
fffff80d`80815725 0fb6c2          movzx   eax,dl
fffff80d`80815728 253fffffff      and     eax,0FFFFFF3Fh
fffff80d`8081572d 83f821          cmp     eax,21h
fffff80d`80815730 0f8798000000    ja      storport!RaidBusEnumeratorIssueSynchronousRequest+0x202 (fffff80d`808157ce)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x16a:
fffff80d`80815736 48b98005000003000000 mov rcx,300000580h
fffff80d`80815740 480fa3c1        bt      rcx,rax
fffff80d`80815744 0f8384000000    jae     storport!RaidBusEnumeratorIssueSynchronousRequest+0x202 (fffff80d`808157ce)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x17e:
fffff80d`8081574a bb0e0000c0      mov     ebx,0C000000Eh

storport!RaidBusEnumeratorIssueSynchronousRequest+0x183:
fffff80d`8081574f 85db            test    ebx,ebx
fffff80d`80815751 790c            jns     storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x187:
fffff80d`80815753 81fb0e0000c0    cmp     ebx,0C000000Eh
fffff80d`80815759 0f8549020000    jne     storport!RaidBusEnumeratorIssueSynchronousRequest+0x3dc (fffff80d`808159a8)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x193:
fffff80d`8081575f 8b8548010000    mov     eax,dword ptr [rbp+148h]
fffff80d`80815765 8bc8            mov     ecx,eax
fffff80d`80815767 ffc8            dec     eax
fffff80d`80815769 898548010000    mov     dword ptr [rbp+148h],eax
fffff80d`8081576f 85c9            test    ecx,ecx
fffff80d`80815771 740c            je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3 (fffff80d`8081577f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a7:
fffff80d`80815773 b800000080      mov     eax,80000000h
fffff80d`80815778 8d0c03          lea     ecx,[rbx+rax]
fffff80d`8081577b 85c8            test    eax,ecx
fffff80d`8081577d 7416            je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1c9 (fffff80d`80815795)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3:
fffff80d`8081577f 8bc3            mov     eax,ebx

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b5:
fffff80d`80815781 4881c4e8010000  add     rsp,1E8h
fffff80d`80815788 415f            pop     r15
fffff80d`8081578a 415e            pop     r14
fffff80d`8081578c 415d            pop     r13
fffff80d`8081578e 415c            pop     r12
fffff80d`80815790 5f              pop     rdi
fffff80d`80815791 5e              pop     rsi
fffff80d`80815792 5b              pop     rbx
fffff80d`80815793 5d              pop     rbp
fffff80d`80815794 c3              ret

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1c9:
fffff80d`80815795 f20f10442460    movsd   xmm0,mmword ptr [rsp+60h]
fffff80d`8081579b 4c8b4c2450      mov     r9,qword ptr [rsp+50h]
fffff80d`808157a0 488b9540010000  mov     rdx,qword ptr [rbp+140h]
fffff80d`808157a7 0f104c2470      movups  xmm1,xmmword ptr [rsp+70h]
fffff80d`808157ac 0f105580        movups  xmm2,xmmword ptr [rbp-80h]
fffff80d`808157b0 0f105d90        movups  xmm3,xmmword ptr [rbp-70h]
fffff80d`808157b4 0f1065a0        movups  xmm4,xmmword ptr [rbp-60h]
fffff80d`808157b8 0f106db0        movups  xmm5,xmmword ptr [rbp-50h]
fffff80d`808157bc 81fb0e0000c0    cmp     ebx,0C000000Eh
fffff80d`808157c2 74bb            je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3 (fffff80d`8081577f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1f8:
fffff80d`808157c4 488b5c2468      mov     rbx,qword ptr [rsp+68h]
fffff80d`808157c9 e9ccfeffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0xce (fffff80d`8081569a)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x202:
fffff80d`808157ce 4084f6          test    sil,sil
fffff80d`808157d1 0f85f2a40100    jne     storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6fd (fffff80d`8082fcc9)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x20b:
fffff80d`808157d7 80fa12          cmp     dl,12h
fffff80d`808157da 0f84fd010000    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x411 (fffff80d`808159dd)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x214:
fffff80d`808157e0 488b442450      mov     rax,qword ptr [rsp+50h]
fffff80d`808157e5 8b5830          mov     ebx,dword ptr [rax+30h]
fffff80d`808157e8 e962ffffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x183 (fffff80d`8081574f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x221:
fffff80d`808157ed 488d4520        lea     rax,[rbp+20h]
fffff80d`808157f1 0f1000          movups  xmm0,xmmword ptr [rax]
fffff80d`808157f4 0f104810        movups  xmm1,xmmword ptr [rax+10h]
fffff80d`808157f8 0f1107          movups  xmmword ptr [rdi],xmm0
fffff80d`808157fb 0f104020        movups  xmm0,xmmword ptr [rax+20h]
fffff80d`808157ff 0f114f10        movups  xmmword ptr [rdi+10h],xmm1
fffff80d`80815803 0f104830        movups  xmm1,xmmword ptr [rax+30h]
fffff80d`80815807 0f114720        movups  xmmword ptr [rdi+20h],xmm0
fffff80d`8081580b 0f104040        movups  xmm0,xmmword ptr [rax+40h]
fffff80d`8081580f 0f114f30        movups  xmmword ptr [rdi+30h],xmm1
fffff80d`80815813 0f104850        movups  xmm1,xmmword ptr [rax+50h]
fffff80d`80815817 0f114740        movups  xmmword ptr [rdi+40h],xmm0
fffff80d`8081581b 0f104060        movups  xmm0,xmmword ptr [rax+60h]
fffff80d`8081581f 0f114f50        movups  xmmword ptr [rdi+50h],xmm1
fffff80d`80815823 0f104870        movups  xmm1,xmmword ptr [rax+70h]
fffff80d`80815827 0f114760        movups  xmmword ptr [rdi+60h],xmm0
fffff80d`8081582b 0f108080000000  movups  xmm0,xmmword ptr [rax+80h]
fffff80d`80815832 0f114f70        movups  xmmword ptr [rdi+70h],xmm1
fffff80d`80815836 0f108890000000  movups  xmm1,xmmword ptr [rax+90h]
fffff80d`8081583d 0f118780000000  movups  xmmword ptr [rdi+80h],xmm0
fffff80d`80815844 0f1080a0000000  movups  xmm0,xmmword ptr [rax+0A0h]
fffff80d`8081584b 488b80b0000000  mov     rax,qword ptr [rax+0B0h]
fffff80d`80815852 0f118f90000000  movups  xmmword ptr [rdi+90h],xmm1
fffff80d`80815859 0f1187a0000000  movups  xmmword ptr [rdi+0A0h],xmm0
fffff80d`80815860 488987b0000000  mov     qword ptr [rdi+0B0h],rax
fffff80d`80815867 e950feffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0xf0 (fffff80d`808156bc)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x2a0:
fffff80d`8081586c 894728          mov     dword ptr [rdi+28h],eax
fffff80d`8081586f e972feffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x11a (fffff80d`808156e6)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x2a8:
fffff80d`80815874 488d8550010000  lea     rax,[rbp+150h]
fffff80d`8081587b 4533c9          xor     r9d,r9d
fffff80d`8081587e 4889442428      mov     qword ptr [rsp+28h],rax
fffff80d`80815883 4533c0          xor     r8d,r8d
fffff80d`80815886 488d442458      lea     rax,[rsp+58h]
fffff80d`8081588b 33d2            xor     edx,edx
fffff80d`8081588d 488bcf          mov     rcx,rdi
fffff80d`80815890 4889442420      mov     qword ptr [rsp+20h],rax
fffff80d`80815895 e83ebb0000      call    storport!GetSrbScsiData (fffff80d`808213d8)
fffff80d`8081589a 8a8d50010000    mov     cl,byte ptr [rbp+150h]
fffff80d`808158a0 4c8b4c2458      mov     r9,qword ptr [rsp+58h]
fffff80d`808158a5 e970feffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x14e (fffff80d`8081571a)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x2de:
fffff80d`808158aa 0f1007          movups  xmm0,xmmword ptr [rdi]
fffff80d`808158ad 488b87b0000000  mov     rax,qword ptr [rdi+0B0h]
fffff80d`808158b4 488d4d20        lea     rcx,[rbp+20h]
fffff80d`808158b8 0f104f10        movups  xmm1,xmmword ptr [rdi+10h]
fffff80d`808158bc 0f1101          movups  xmmword ptr [rcx],xmm0
fffff80d`808158bf 0f104720        movups  xmm0,xmmword ptr [rdi+20h]
fffff80d`808158c3 0f114910        movups  xmmword ptr [rcx+10h],xmm1
fffff80d`808158c7 0f104f30        movups  xmm1,xmmword ptr [rdi+30h]
fffff80d`808158cb 0f114120        movups  xmmword ptr [rcx+20h],xmm0
fffff80d`808158cf 0f104740        movups  xmm0,xmmword ptr [rdi+40h]
fffff80d`808158d3 0f114930        movups  xmmword ptr [rcx+30h],xmm1
fffff80d`808158d7 0f104f50        movups  xmm1,xmmword ptr [rdi+50h]
fffff80d`808158db 0f114140        movups  xmmword ptr [rcx+40h],xmm0
fffff80d`808158df 0f104760        movups  xmm0,xmmword ptr [rdi+60h]
fffff80d`808158e3 0f114950        movups  xmmword ptr [rcx+50h],xmm1
fffff80d`808158e7 0f104f70        movups  xmm1,xmmword ptr [rdi+70h]
fffff80d`808158eb 0f114160        movups  xmmword ptr [rcx+60h],xmm0
fffff80d`808158ef 0f108780000000  movups  xmm0,xmmword ptr [rdi+80h]
fffff80d`808158f6 0f114970        movups  xmmword ptr [rcx+70h],xmm1
fffff80d`808158fa 0f108f90000000  movups  xmm1,xmmword ptr [rdi+90h]
fffff80d`80815901 0f118180000000  movups  xmmword ptr [rcx+80h],xmm0
fffff80d`80815908 0f1087a0000000  movups  xmm0,xmmword ptr [rdi+0A0h]
fffff80d`8081590f 0f118990000000  movups  xmmword ptr [rcx+90h],xmm1
fffff80d`80815916 0f1181a0000000  movups  xmmword ptr [rcx+0A0h],xmm0
fffff80d`8081591d 488981b0000000  mov     qword ptr [rcx+0B0h],rax
fffff80d`80815924 8b4734          mov     eax,dword ptr [rdi+34h]
fffff80d`80815927 4803c7          add     rax,rdi
fffff80d`8081592a 66833801        cmp     word ptr [rax],1
fffff80d`8081592e 750c            jne     storport!RaidBusEnumeratorIssueSynchronousRequest+0x370 (fffff80d`8081593c)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x364:
fffff80d`80815930 448a7808        mov     r15b,byte ptr [rax+8]
fffff80d`80815934 448a6009        mov     r12b,byte ptr [rax+9]
fffff80d`80815938 448a680a        mov     r13b,byte ptr [rax+0Ah]

storport!RaidBusEnumeratorIssueSynchronousRequest+0x370:
fffff80d`8081593c 488364242800    and     qword ptr [rsp+28h],0
fffff80d`80815942 4533c9          xor     r9d,r9d
fffff80d`80815945 488364242000    and     qword ptr [rsp+20h],0
fffff80d`8081594b 4533c0          xor     r8d,r8d
fffff80d`8081594e 33d2            xor     edx,edx
fffff80d`80815950 488bcf          mov     rcx,rdi
fffff80d`80815953 e880ba0000      call    storport!GetSrbScsiData (fffff80d`808213d8)
fffff80d`80815958 f20f104510      movsd   xmm0,mmword ptr [rbp+10h]
fffff80d`8081595d 0f284d00        movaps  xmm1,xmmword ptr [rbp]
fffff80d`80815961 0f2855f0        movaps  xmm2,xmmword ptr [rbp-10h]
fffff80d`80815965 0f285de0        movaps  xmm3,xmmword ptr [rbp-20h]
fffff80d`80815969 0f2865d0        movaps  xmm4,xmmword ptr [rbp-30h]
fffff80d`8081596d 0f286dc0        movaps  xmm5,xmmword ptr [rbp-40h]
fffff80d`80815971 4c8b4c2450      mov     r9,qword ptr [rsp+50h]
fffff80d`80815976 488b9540010000  mov     rdx,qword ptr [rbp+140h]
fffff80d`8081597d f20f11442460    movsd   mmword ptr [rsp+60h],xmm0
fffff80d`80815983 0f114c2470      movups  xmmword ptr [rsp+70h],xmm1
fffff80d`80815988 0f115580        movups  xmmword ptr [rbp-80h],xmm2
fffff80d`8081598c 0f115d90        movups  xmmword ptr [rbp-70h],xmm3
fffff80d`80815990 0f1165a0        movups  xmmword ptr [rbp-60h],xmm4
fffff80d`80815994 0f116db0        movups  xmmword ptr [rbp-50h],xmm5
fffff80d`80815998 4885c0          test    rax,rax
fffff80d`8081599b 0f84f9fcffff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0xce (fffff80d`8081569a)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x3d5:
fffff80d`808159a1 8a00            mov     al,byte ptr [rax]
fffff80d`808159a3 e9ecfcffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0xc8 (fffff80d`80815694)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x3dc:
fffff80d`808159a8 81fb100000c0    cmp     ebx,0C0000010h
fffff80d`808159ae 0f84abfdffff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x3e8:
fffff80d`808159b4 488b0d45b60400  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808159bb 488d053eb60400  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`808159c2 483bc8          cmp     rcx,rax
fffff80d`808159c5 0f8494fdffff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x3ff:
fffff80d`808159cb f7412c00400000  test    dword ptr [rcx+2Ch],4000h
fffff80d`808159d2 0f8487fdffff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x40c:
fffff80d`808159d8 e900a30100      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a711 (fffff80d`8082fcdd)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x411:
fffff80d`808159dd 33db            xor     ebx,ebx
fffff80d`808159df c6470301        mov     byte ptr [rdi+3],1
fffff80d`808159e3 e977fdffff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6ac:
fffff80d`8082fc78 4d85c9          test    r9,r9
fffff80d`8082fc7b 0f84a45afeff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x159 (fffff80d`80815725)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6b5:
fffff80d`8082fc81 4032f6          xor     sil,sil
fffff80d`8082fc84 84c9            test    cl,cl
fffff80d`8082fc86 0f84995afeff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x159 (fffff80d`80815725)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6c0:
fffff80d`8082fc8c 418a01          mov     al,byte ptr [r9]
fffff80d`8082fc8f 247f            and     al,7Fh
fffff80d`8082fc91 0fb6c9          movzx   ecx,cl
fffff80d`8082fc94 2c72            sub     al,72h
fffff80d`8082fc96 4903c9          add     rcx,r9
fffff80d`8082fc99 3c01            cmp     al,1
fffff80d`8082fc9b 498d4108        lea     rax,[r9+8]
fffff80d`8082fc9f 760f            jbe     storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6e4 (fffff80d`8082fcb0)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6d5:
fffff80d`8082fca1 483bc1          cmp     rax,rcx
fffff80d`8082fca4 0f877b5afeff    ja      storport!RaidBusEnumeratorIssueSynchronousRequest+0x159 (fffff80d`80815725)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6de:
fffff80d`8082fcaa 458a7102        mov     r14b,byte ptr [r9+2]
fffff80d`8082fcae eb0d            jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6f1 (fffff80d`8082fcbd)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6e4:
fffff80d`8082fcb0 483bc1          cmp     rax,rcx
fffff80d`8082fcb3 0f876c5afeff    ja      storport!RaidBusEnumeratorIssueSynchronousRequest+0x159 (fffff80d`80815725)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6ed:
fffff80d`8082fcb9 458a7101        mov     r14b,byte ptr [r9+1]

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6f1:
fffff80d`8082fcbd 40b601          mov     sil,1
fffff80d`8082fcc0 4180e60f        and     r14b,0Fh
fffff80d`8082fcc4 e95c5afeff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x159 (fffff80d`80815725)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a6fd:
fffff80d`8082fcc9 4180fe05        cmp     r14b,5
fffff80d`8082fccd 0f85045bfeff    jne     storport!RaidBusEnumeratorIssueSynchronousRequest+0x20b (fffff80d`808157d7)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a707:
fffff80d`8082fcd3 bb0e0000c0      mov     ebx,0C000000Eh
fffff80d`8082fcd8 e9825afeff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a711:
fffff80d`8082fcdd 80792904        cmp     byte ptr [rcx+29h],4
fffff80d`8082fce1 0f82785afeff    jb      storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a71b:
fffff80d`8082fce7 83bd4801000000  cmp     dword ptr [rbp+148h],0
fffff80d`8082fcee 488d052ba90200  lea     rax,[storport!`string' (fffff80d`8085a620)]
fffff80d`8082fcf5 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082fcf9 4c8d1d18a90200  lea     r11,[storport!`string' (fffff80d`8085a618)]
fffff80d`8082fd00 4c0f44d8        cmove   r11,rax
fffff80d`8082fd04 450fb6c5        movzx   r8d,r13b
fffff80d`8082fd08 4c895c2448      mov     qword ptr [rsp+48h],r11
fffff80d`8082fd0d 0fb6c2          movzx   eax,dl
fffff80d`8082fd10 0fb69538010000  movzx   edx,byte ptr [rbp+138h]
fffff80d`8082fd17 89442440        mov     dword ptr [rsp+40h],eax
fffff80d`8082fd1b 488b8530010000  mov     rax,qword ptr [rbp+130h]
fffff80d`8082fd22 89542438        mov     dword ptr [rsp+38h],edx
fffff80d`8082fd26 4489442430      mov     dword ptr [rsp+30h],r8d
fffff80d`8082fd2b 450fb6cc        movzx   r9d,r12b
fffff80d`8082fd2f 44894c2428      mov     dword ptr [rsp+28h],r9d
fffff80d`8082fd34 4c8b08          mov     r9,qword ptr [rax]
fffff80d`8082fd37 450fb6d7        movzx   r10d,r15b
fffff80d`8082fd3b 4489542420      mov     dword ptr [rsp+20h],r10d
fffff80d`8082fd40 e8c7bf0000      call    storport!WPP_SF_qdddDDs (fffff80d`8083bd0c)
fffff80d`8082fd45 90              nop
fffff80d`8082fd46 e9145afeff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x193 (fffff80d`8081575f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a77f:
fffff80d`8082fd4b 488b0dae120300  mov     rcx,qword ptr [storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`8082fd52 488d05a7120300  lea     rax,[storport!WPP_GLOBAL_Control (fffff80d`80861000)]
fffff80d`8082fd59 483bc8          cmp     rcx,rax
fffff80d`8082fd5c 0f841d5afeff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3 (fffff80d`8081577f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a796:
fffff80d`8082fd62 f7412c00400000  test    dword ptr [rcx+2Ch],4000h
fffff80d`8082fd69 0f84105afeff    je      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3 (fffff80d`8081577f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a7a3:
fffff80d`8082fd6f 80792902        cmp     byte ptr [rcx+29h],2
fffff80d`8082fd73 0f82065afeff    jb      storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3 (fffff80d`8081577f)  Branch

storport!RaidBusEnumeratorIssueSynchronousRequest+0x1a7ad:
fffff80d`8082fd79 488b4918        mov     rcx,qword ptr [rcx+18h]
fffff80d`8082fd7d 895c2438        mov     dword ptr [rsp+38h],ebx
fffff80d`8082fd81 410fb6c5        movzx   eax,r13b
fffff80d`8082fd85 89442430        mov     dword ptr [rsp+30h],eax
fffff80d`8082fd89 488b8530010000  mov     rax,qword ptr [rbp+130h]
fffff80d`8082fd90 410fb6d4        movzx   edx,r12b
fffff80d`8082fd94 450fb6c7        movzx   r8d,r15b
fffff80d`8082fd98 89542428        mov     dword ptr [rsp+28h],edx
fffff80d`8082fd9c 4c8b08          mov     r9,qword ptr [rax]
fffff80d`8082fd9f 4489442420      mov     dword ptr [rsp+20h],r8d
fffff80d`8082fda4 e8dfbe0000      call    storport!WPP_SF_qdddD (fffff80d`8083bc88)
fffff80d`8082fda9 90              nop
fffff80d`8082fdaa e9d059feff      jmp     storport!RaidBusEnumeratorIssueSynchronousRequest+0x1b3 (fffff80d`8081577f)  Branch
