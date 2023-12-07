1: kd> uf stornvme!InitializePerfOptions
stornvme!InitializePerfOptions:
fffff801`5273ae00 488bc4          mov     rax,rsp
fffff801`5273ae03 48895808        mov     qword ptr [rax+8],rbx
fffff801`5273ae07 48897010        mov     qword ptr [rax+10h],rsi
fffff801`5273ae0b 48897818        mov     qword ptr [rax+18h],rdi
fffff801`5273ae0f 4c897820        mov     qword ptr [rax+20h],r15
fffff801`5273ae13 55              push    rbp
fffff801`5273ae14 488bec          mov     rbp,rsp
fffff801`5273ae17 4883ec50        sub     rsp,50h
fffff801`5273ae1b 488bd9          mov     rbx,rcx
fffff801`5273ae1e 41bf28000000    mov     r15d,28h          ;sizeof(_PERF_CONFIGURATION_DATA)
fffff801`5273ae24 458bc7          mov     r8d,r15d
fffff801`5273ae27 488d4dd0        lea     rcx,[rbp-30h]     ;ffffe1816ae8b510-0x30
fffff801`5273ae2b 33d2            xor     edx,edx
fffff801`5273ae2d e88ebaffff      call    stornvme!memset (fffff801`527368c0)
fffff801`5273ae32 807b1000        cmp     byte ptr [rbx+10h],0          ;if([devext+0x10]==0) goto 0x41
fffff801`5273ae36 7409            je      stornvme!InitializePerfOptions+0x41 (fffff801`5273ae41)  Branch

stornvme!InitializePerfOptions+0x38:
fffff801`5273ae38 418d47d9        lea     eax,[r15-27h]
fffff801`5273ae3c e9ee000000      jmp     stornvme!InitializePerfOptions+0x12f (fffff801`5273af2f)  Branch

stornvme!InitializePerfOptions+0x41:
fffff801`5273ae41 bf01000000      mov     edi,1
fffff801`5273ae46 c745d005000000  mov     dword ptr [rbp-30h],5
fffff801`5273ae4d 4c8d4dd0        lea     r9,[rbp-30h]              ;PERF_CONFIGURATION_DATA *
fffff801`5273ae51 44897dd4        mov     dword ptr [rbp-2Ch],r15d
fffff801`5273ae55 448bc7          mov     r8d,edi                   ;TRUE (query)
fffff801`5273ae58 488bd3          mov     rdx,rbx                   ;HwDeviceExt
fffff801`5273ae5b 8d4f0d          lea     ecx,[rdi+0Dh]             ;0x0e => ExtFunctionInitializePerformanceOptimizations
fffff801`5273ae5e 48ff15c3410100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`5274f028)]
fffff801`5273ae65 0f1f440000      nop     dword ptr [rax+rax]
fffff801`5273ae6a 85c0            test    eax,eax
fffff801`5273ae6c 0f85bb000000    jne     stornvme!InitializePerfOptions+0x12d (fffff801`5273af2d)  Branch

                                    ;0x72 ~ 0x9a 這段檢查五個Flag
                                    ;STOR_PERF_DPC_REDIRECTION
                                    ;STOR_PERF_CONCURRENT_CHANNELS
                                    ;STOR_PERF_INTERRUPT_MESSAGE_RANGES
                                    ;STOR_PERF_ADV_CONFIG_LOCALITY
                                    ;STOR_PERF_NO_SGL
                                    ;但 2019 原始Query 出來的Flag是 0x7F
                                    
stornvme!InitializePerfOptions+0x72:
fffff801`5273ae72 8b45d8          mov     eax,dword ptr [rbp-28h]
fffff801`5273ae75 4084c7          test    dil,al    ;if !(perf->Flags & STOR_PERF_DPC_REDIRECTION)  goto End
fffff801`5273ae78 0f84af000000    je      stornvme!InitializePerfOptions+0x12d (fffff801`5273af2d)  Branch

stornvme!InitializePerfOptions+0x7e:
fffff801`5273ae7e a802            test    al,2    ;if !(perf->Flags & STOR_PERF_CONCURRENT_CHANNELS)  goto End
fffff801`5273ae80 0f84a7000000    je      stornvme!InitializePerfOptions+0x12d (fffff801`5273af2d)  Branch

stornvme!InitializePerfOptions+0x86:
fffff801`5273ae86 a804            test    al,4    ;if !(perf->Flags & STOR_PERF_INTERRUPT_MESSAGE_RANGES)  goto End
fffff801`5273ae88 0f849f000000    je      stornvme!InitializePerfOptions+0x12d (fffff801`5273af2d)  Branch

stornvme!InitializePerfOptions+0x8e:
fffff801`5273ae8e a808            test    al,8    ;if !(perf->Flags & STOR_PERF_ADV_CONFIG_LOCALITY)  goto End
fffff801`5273ae90 0f8497000000    je      stornvme!InitializePerfOptions+0x12d (fffff801`5273af2d)  Branch

stornvme!InitializePerfOptions+0x96:
fffff801`5273ae96 a840            test    al,40h    ;if !(perf->Flags & STOR_PERF_NO_SGL)  goto End
fffff801`5273ae98 7504            jne     stornvme!InitializePerfOptions+0x9e (fffff801`5273ae9e)  Branch

stornvme!InitializePerfOptions+0x9a:
fffff801`5273ae9a 836334f7        and     dword ptr [rbx+34h],0FFFFFFF7h

stornvme!InitializePerfOptions+0x9e:
fffff801`5273ae9e 8b7334          mov     esi,dword ptr [rbx+34h]       ;esi == 0
fffff801`5273aea1 488d4dd0        lea     rcx,[rbp-30h]     ;PERF_CONFIGURATION_DATA *
fffff801`5273aea5 4d8bc7          mov     r8,r15            ;sizeof(_PERF_CONFIGURATION_DATA)
fffff801`5273aea8 33d2            xor     edx,edx           ;0
fffff801`5273aeaa e811baffff      call    stornvme!memset (fffff801`527368c0)
fffff801`5273aeaf b80f000000      mov     eax,0Fh
fffff801`5273aeb4 c745d005000000  mov     dword ptr [rbp-30h],5     ;STOR_PERF_VERSION_5 ??
fffff801`5273aebb 40f6c608        test    sil,8
fffff801`5273aebf 44897dd4        mov     dword ptr [rbp-2Ch],r15d  ;_PERF_CONFIGURATION_DATA.Size = 0x28
fffff801`5273aec3 8d4840          lea     ecx,[rax+40h]
fffff801`5273aec6 0f45c1          cmovne  eax,ecx                   ;ecx=0x4f, eax=0x0f
fffff801`5273aec9 8945d8          mov     dword ptr [rbp-28h],eax   ;_PERF_CONFIGURATION_DATA.Flags = 0xF (拔掉了STOR_PERF_NO_SGL)
fffff801`5273aecc 6639bbe8000000  cmp     word ptr [rbx+0E8h],di    ;if([rbx+0E8h] <= di) goto 0xe4  ([rbx+0xe8]==9, di==1)，照後面來看是計算MSIX ID上限？
fffff801`5273aed3 760f            jbe     stornvme!InitializePerfOptions+0xe4 (fffff801`5273aee4)  Branch

stornvme!InitializePerfOptions+0xd5:
fffff801`5273aed5 0fb7830a010000  movzx   eax,word ptr [rbx+10Ah]
fffff801`5273aedc 8945e4          mov     dword ptr [rbp-1Ch],eax       ;_PERF_CONFIGURATION_DATA.LastRedirectionMessageNumber
fffff801`5273aedf 897de0          mov     dword ptr [rbp-20h],edi       ;_PERF_CONFIGURATION_DATA.FirstRedirectionMessageNumber
fffff801`5273aee2 eb08            jmp     stornvme!InitializePerfOptions+0xec (fffff801`5273aeec)  Branch

stornvme!InitializePerfOptions+0xe4:            ;看起來應該是 "若無配置MSIX msgid 就清掉 MSI Redirection Message 兩個欄位"
fffff801`5273aee4 8365e000        and     dword ptr [rbp-20h],0
fffff801`5273aee8 8365e400        and     dword ptr [rbp-1Ch],0

stornvme!InitializePerfOptions+0xec:
fffff801`5273aeec 0fb783c2000000  movzx   eax,word ptr [rbx+0C2h]   
fffff801`5273aef3 4c8d4dd0        lea     r9,[rbp-30h]              ;PERF_CONFIGURATION_DATA *
fffff801`5273aef7 4533c0          xor     r8d,r8d                   ;FALSE (save)
fffff801`5273aefa 8945dc          mov     dword ptr [rbp-24h],eax   ;_PERF_CONFIGURATION_DATA.ConcurrentChannels = CPU cores
fffff801`5273aefd 488b83f8000000  mov     rax,qword ptr [rbx+0F8h]
fffff801`5273af04 488bd3          mov     rdx,rbx                   ;HwDeviceExt
fffff801`5273af07 488945f0        mov     qword ptr [rbp-10h],rax   ;設定 _PERF_CONFIGURATION_DATA.MessageTargets
fffff801`5273af0b 418d480e        lea     ecx,[r8+0Eh]              ;0x0e => ExtFunctionInitializePerformanceOptimizations
fffff801`5273af0f 48ff1512410100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`5274f028)]
fffff801`5273af16 0f1f440000      nop     dword ptr [rax+rax]
fffff801`5273af1b 85c0            test    eax,eax
fffff801`5273af1d 750e            jne     stornvme!InitializePerfOptions+0x12d (fffff801`5273af2d)  Branch

stornvme!InitializePerfOptions+0x11f:
fffff801`5273af1f 8b45e8          mov     eax,dword ptr [rbp-18h]
fffff801`5273af22 8983cc000000    mov     dword ptr [rbx+0CCh],eax
fffff801`5273af28 408ac7          mov     al,dil
fffff801`5273af2b eb02            jmp     stornvme!InitializePerfOptions+0x12f (fffff801`5273af2f)  Branch

stornvme!InitializePerfOptions+0x12d:
fffff801`5273af2d 32c0            xor     al,al

stornvme!InitializePerfOptions+0x12f:
fffff801`5273af2f 488b5c2460      mov     rbx,qword ptr [rsp+60h]
fffff801`5273af34 488b742468      mov     rsi,qword ptr [rsp+68h]
fffff801`5273af39 488b7c2470      mov     rdi,qword ptr [rsp+70h]
fffff801`5273af3e 4c8b7c2478      mov     r15,qword ptr [rsp+78h]
fffff801`5273af43 4883c450        add     rsp,50h
fffff801`5273af47 5d              pop     rbp
fffff801`5273af48 c3              ret
