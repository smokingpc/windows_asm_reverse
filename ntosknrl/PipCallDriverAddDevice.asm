1: kd> uf nt!PipCallDriverAddDevice
nt!PipCallDriverAddDevice:
fffff802`38d9b87c 48895c2418      mov     qword ptr [rsp+18h],rbx
fffff802`38d9b881 55              push    rbp
fffff802`38d9b882 56              push    rsi
fffff802`38d9b883 57              push    rdi
fffff802`38d9b884 4154            push    r12
fffff802`38d9b886 4155            push    r13
fffff802`38d9b888 4156            push    r14
fffff802`38d9b88a 4157            push    r15
fffff802`38d9b88c 488d6c2480      lea     rbp,[rsp-80h]
fffff802`38d9b891 4881ec80010000  sub     rsp,180h
fffff802`38d9b898 488b05a1d4d1ff  mov     rax,qword ptr [nt!_security_cookie (fffff802`38ab8d40)]
fffff802`38d9b89f 4833c4          xor     rax,rsp
fffff802`38d9b8a2 48894570        mov     qword ptr [rbp+70h],rax
fffff802`38d9b8a6 4533f6          xor     r14d,r14d
fffff802`38d9b8a9 488bf2          mov     rsi,rdx
fffff802`38d9b8ac 488bf9          mov     rdi,rcx
fffff802`38d9b8af 4488742468      mov     byte ptr [rsp+68h],r14b
fffff802`38d9b8b4 33d2            xor     edx,edx
fffff802`38d9b8b6 4c897590        mov     qword ptr [rbp-70h],r14
fffff802`38d9b8ba 488d4dd0        lea     rcx,[rbp-30h]
fffff802`38d9b8be 448974246c      mov     dword ptr [rsp+6Ch],r14d
fffff802`38d9b8c3 458d4640        lea     r8d,[r14+40h]
fffff802`38d9b8c7 448974247c      mov     dword ptr [rsp+7Ch],r14d
fffff802`38d9b8cc 458afe          mov     r15b,r14b
fffff802`38d9b8cf 4c89742470      mov     qword ptr [rsp+70h],r14
fffff802`38d9b8d4 458aee          mov     r13b,r14b
fffff802`38d9b8d7 e82476aeff      call    nt!memset (fffff802`38882f00)
fffff802`38d9b8dc 418d4606        lea     eax,[r14+6]
fffff802`38d9b8e0 6644897520      mov     word ptr [rbp+20h],r14w
fffff802`38d9b8e5 488945c0        mov     qword ptr [rbp-40h],rax
fffff802`38d9b8e9 4c897580        mov     qword ptr [rbp-80h],r14
fffff802`38d9b8ed 4c8975a0        mov     qword ptr [rbp-60h],r14
fffff802`38d9b8f1 4c8975a8        mov     qword ptr [rbp-58h],r14
fffff802`38d9b8f5 4438b7b0020000  cmp     byte ptr [rdi+2B0h],r14b
fffff802`38d9b8fc 7410            je      nt!PipCallDriverAddDevice+0x92 (fffff802`38d9b90e)  Branch

nt!PipCallDriverAddDevice+0x82:
fffff802`38d9b8fe 44387604        cmp     byte ptr [rsi+4],r14b
fffff802`38d9b902 750a            jne     nt!PipCallDriverAddDevice+0x92 (fffff802`38d9b90e)  Branch

nt!PipCallDriverAddDevice+0x88:
fffff802`38d9b904 bb010000c0      mov     ebx,0C0000001h
fffff802`38d9b909 e927040000      jmp     nt!PipCallDriverAddDevice+0x4b9 (fffff802`38d9bd35)  Branch

nt!PipCallDriverAddDevice+0x92:
fffff802`38d9b90e 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9b912 488d442470      lea     rax,[rsp+70h]
fffff802`38d9b917 4c89742438      mov     qword ptr [rsp+38h],r14
fffff802`38d9b91c 4533c9          xor     r9d,r9d
fffff802`38d9b91f 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9b924 4488b7b0020000  mov     byte ptr [rdi+2B0h],r14b
fffff802`38d9b92b 488b0d0643dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9b932 458d4110        lea     r8d,[r9+10h]
fffff802`38d9b936 4488742428      mov     byte ptr [rsp+28h],r14b
fffff802`38d9b93b c744242019000200 mov     dword ptr [rsp+20h],20019h
fffff802`38d9b943 e84878f5ff      call    nt!_CmOpenDeviceRegKey (fffff802`38cf3190)
fffff802`38d9b948 8bd8            mov     ebx,eax
fffff802`38d9b94a 85c0            test    eax,eax
fffff802`38d9b94c 0f88de030000    js      nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xd6:
fffff802`38d9b952 488b4720        mov     rax,qword ptr [rdi+20h]
fffff802`38d9b956 bb04000000      mov     ebx,4
fffff802`38d9b95b f7403000000002  test    dword ptr [rax+30h],2000000h
fffff802`38d9b962 0f8484000000    je      nt!PipCallDriverAddDevice+0x170 (fffff802`38d9b9ec)  Branch

nt!PipCallDriverAddDevice+0xec:
fffff802`38d9b968 4c8b4c2470      mov     r9,qword ptr [rsp+70h]
fffff802`38d9b96d 488d442464      lea     rax,[rsp+64h]
fffff802`38d9b972 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9b976 448d43fd        lea     r8d,[rbx-3]
fffff802`38d9b97a 488b0db742dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9b981 4489742450      mov     dword ptr [rsp+50h],r14d
fffff802`38d9b986 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9b98b 488d44247c      lea     rax,[rsp+7Ch]
fffff802`38d9b990 895c2440        mov     dword ptr [rsp+40h],ebx
fffff802`38d9b994 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`38d9b999 488d4588        lea     rax,[rbp-78h]
fffff802`38d9b99d 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9b9a2 488d059ff1c8ff  lea     rax,[nt!DEVPKEY_Device_DebuggerSafe (fffff802`38a2ab48)]
fffff802`38d9b9a9 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9b9ae 4c89742420      mov     qword ptr [rsp+20h],r14
fffff802`38d9b9b3 e85043f5ff      call    nt!_PnpGetObjectProperty (fffff802`38cefd08)
fffff802`38d9b9b8 85c0            test    eax,eax
fffff802`38d9b9ba 7813            js      nt!PipCallDriverAddDevice+0x153 (fffff802`38d9b9cf)  Branch

nt!PipCallDriverAddDevice+0x140:
fffff802`38d9b9bc 837d8807        cmp     dword ptr [rbp-78h],7
fffff802`38d9b9c0 750d            jne     nt!PipCallDriverAddDevice+0x153 (fffff802`38d9b9cf)  Branch

nt!PipCallDriverAddDevice+0x146:
fffff802`38d9b9c2 395c2464        cmp     dword ptr [rsp+64h],ebx
fffff802`38d9b9c6 7507            jne     nt!PipCallDriverAddDevice+0x153 (fffff802`38d9b9cf)  Branch

nt!PipCallDriverAddDevice+0x14c:
fffff802`38d9b9c8 443974247c      cmp     dword ptr [rsp+7Ch],r14d
fffff802`38d9b9cd 751d            jne     nt!PipCallDriverAddDevice+0x170 (fffff802`38d9b9ec)  Branch

nt!PipCallDriverAddDevice+0x153:
fffff802`38d9b9cf 41b835000000    mov     r8d,35h

nt!PipCallDriverAddDevice+0x159:
fffff802`38d9b9d5 4533c9          xor     r9d,r9d

nt!PipCallDriverAddDevice+0x15c:
fffff802`38d9b9d8 33d2            xor     edx,edx
fffff802`38d9b9da 488bcf          mov     rcx,rdi
fffff802`38d9b9dd e85a840000      call    nt!PnpRequestDeviceRemoval (fffff802`38da3e3c)
fffff802`38d9b9e2 bbce0200c0      mov     ebx,0C00002CEh
fffff802`38d9b9e7 e944030000      jmp     nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0x170:
fffff802`38d9b9ec 83bf94020000ff  cmp     dword ptr [rdi+294h],0FFFFFFFFh
fffff802`38d9b9f3 0f850b010000    jne     nt!PipCallDriverAddDevice+0x288 (fffff802`38d9bb04)  Branch

nt!PipCallDriverAddDevice+0x17d:
fffff802`38d9b9f9 4c3935484cd5ff  cmp     qword ptr [nt!PnpQueryProximityNode (fffff802`38af0648)],r14
fffff802`38d9ba00 0f8480000000    je      nt!PipCallDriverAddDevice+0x20a (fffff802`38d9ba86)  Branch

nt!PipCallDriverAddDevice+0x18a:
fffff802`38d9ba06 4c8b4c2470      mov     r9,qword ptr [rsp+70h]
fffff802`38d9ba0b 488d442464      lea     rax,[rsp+64h]
fffff802`38d9ba10 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9ba14 41b801000000    mov     r8d,1
fffff802`38d9ba1a 488b0d1742dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9ba21 4489742450      mov     dword ptr [rsp+50h],r14d
fffff802`38d9ba26 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9ba2b 488d44247c      lea     rax,[rsp+7Ch]
fffff802`38d9ba30 895c2440        mov     dword ptr [rsp+40h],ebx
fffff802`38d9ba34 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`38d9ba39 488d4588        lea     rax,[rbp-78h]
fffff802`38d9ba3d 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9ba42 488d05a72ec7ff  lea     rax,[nt!DEVPKEY_Device_Numa_Proximity_Domain (fffff802`38a0e8f0)]
fffff802`38d9ba49 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9ba4e 4c89742420      mov     qword ptr [rsp+20h],r14
fffff802`38d9ba53 e8b042f5ff      call    nt!_PnpGetObjectProperty (fffff802`38cefd08)
fffff802`38d9ba58 85c0            test    eax,eax
fffff802`38d9ba5a 782a            js      nt!PipCallDriverAddDevice+0x20a (fffff802`38d9ba86)  Branch

nt!PipCallDriverAddDevice+0x1e0:
fffff802`38d9ba5c 8b4c247c        mov     ecx,dword ptr [rsp+7Ch]
fffff802`38d9ba60 81f9ff000000    cmp     ecx,0FFh
fffff802`38d9ba66 771e            ja      nt!PipCallDriverAddDevice+0x20a (fffff802`38d9ba86)  Branch

nt!PipCallDriverAddDevice+0x1ec:
fffff802`38d9ba68 488b05d94bd5ff  mov     rax,qword ptr [nt!PnpQueryProximityNode (fffff802`38af0648)]
fffff802`38d9ba6f 488d5598        lea     rdx,[rbp-68h]
fffff802`38d9ba73 e838c4adff      call    nt!guard_dispatch_icall (fffff802`38877eb0)
fffff802`38d9ba78 85c0            test    eax,eax
fffff802`38d9ba7a 780a            js      nt!PipCallDriverAddDevice+0x20a (fffff802`38d9ba86)  Branch

nt!PipCallDriverAddDevice+0x200:
fffff802`38d9ba7c 0fb74598        movzx   eax,word ptr [rbp-68h]
fffff802`38d9ba80 898794020000    mov     dword ptr [rdi+294h],eax

nt!PipCallDriverAddDevice+0x20a:
fffff802`38d9ba86 8b8794020000    mov     eax,dword ptr [rdi+294h]
fffff802`38d9ba8c b9feffffff      mov     ecx,0FFFFFFFEh
fffff802`38d9ba91 83f8ff          cmp     eax,0FFFFFFFFh
fffff802`38d9ba94 751f            jne     nt!PipCallDriverAddDevice+0x239 (fffff802`38d9bab5)  Branch

nt!PipCallDriverAddDevice+0x21a:
fffff802`38d9ba96 488b4710        mov     rax,qword ptr [rdi+10h]
fffff802`38d9ba9a 4885c0          test    rax,rax
fffff802`38d9ba9d 740e            je      nt!PipCallDriverAddDevice+0x231 (fffff802`38d9baad)  Branch

nt!PipCallDriverAddDevice+0x223:
fffff802`38d9ba9f 8b8094020000    mov     eax,dword ptr [rax+294h]
fffff802`38d9baa5 898794020000    mov     dword ptr [rdi+294h],eax
fffff802`38d9baab eb08            jmp     nt!PipCallDriverAddDevice+0x239 (fffff802`38d9bab5)  Branch

nt!PipCallDriverAddDevice+0x231:
fffff802`38d9baad 898f94020000    mov     dword ptr [rdi+294h],ecx
fffff802`38d9bab3 8bc1            mov     eax,ecx

nt!PipCallDriverAddDevice+0x239:
fffff802`38d9bab5 3bc1            cmp     eax,ecx
fffff802`38d9bab7 744b            je      nt!PipCallDriverAddDevice+0x288 (fffff802`38d9bb04)  Branch

nt!PipCallDriverAddDevice+0x23d:
fffff802`38d9bab9 4c8b4c2470      mov     r9,qword ptr [rsp+70h]
fffff802`38d9babe 41b801000000    mov     r8d,1
fffff802`38d9bac4 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9bac8 488b0d6941dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9bacf 4489742448      mov     dword ptr [rsp+48h],r14d
fffff802`38d9bad4 895c2440        mov     dword ptr [rsp+40h],ebx
fffff802`38d9bad8 8944247c        mov     dword ptr [rsp+7Ch],eax
fffff802`38d9badc 488d44247c      lea     rax,[rsp+7Ch]
fffff802`38d9bae1 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`38d9bae6 488d0573f0c8ff  lea     rax,[nt!DEVPKEY_Device_Numa_Node (fffff802`38a2ab60)]
fffff802`38d9baed c744243007000000 mov     dword ptr [rsp+30h],7
fffff802`38d9baf5 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9bafa 4c89742420      mov     qword ptr [rsp+20h],r14
fffff802`38d9baff e850e7ffff      call    nt!_PnpSetObjectProperty (fffff802`38d9a254)

nt!PipCallDriverAddDevice+0x288:
fffff802`38d9bb04 4c8b4c2470      mov     r9,qword ptr [rsp+70h]
fffff802`38d9bb09 488d442464      lea     rax,[rsp+64h]
fffff802`38d9bb0e 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9bb12 41b801000000    mov     r8d,1
fffff802`38d9bb18 488b0d1941dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9bb1f 4489742450      mov     dword ptr [rsp+50h],r14d
fffff802`38d9bb24 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9bb29 488d4510        lea     rax,[rbp+10h]
fffff802`38d9bb2d c744244008000000 mov     dword ptr [rsp+40h],8
fffff802`38d9bb35 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`38d9bb3a 488d4588        lea     rax,[rbp-78h]
fffff802`38d9bb3e 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9bb43 488d058e2dc7ff  lea     rax,[nt!DEVPKEY_Device_PreventDriverLoad (fffff802`38a0e8d8)]
fffff802`38d9bb4a 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9bb4f 4c89742420      mov     qword ptr [rsp+20h],r14
fffff802`38d9bb54 e8af41f5ff      call    nt!_PnpGetObjectProperty (fffff802`38cefd08)
fffff802`38d9bb59 b900000080      mov     ecx,80000000h
fffff802`38d9bb5e 8bd8            mov     ebx,eax
fffff802`38d9bb60 03c1            add     eax,ecx
fffff802`38d9bb62 85c1            test    ecx,eax
fffff802`38d9bb64 7508            jne     nt!PipCallDriverAddDevice+0x2f2 (fffff802`38d9bb6e)  Branch

nt!PipCallDriverAddDevice+0x2ea:
fffff802`38d9bb66 81fb230000c0    cmp     ebx,0C0000023h
fffff802`38d9bb6c 7579            jne     nt!PipCallDriverAddDevice+0x36b (fffff802`38d9bbe7)  Branch

nt!PipCallDriverAddDevice+0x2f2:
fffff802`38d9bb6e 488d4db0        lea     rcx,[rbp-50h]
fffff802`38d9bb72 e8291e1400      call    nt!PnpGetStableSystemBootTime (fffff802`38edd9a0)
fffff802`38d9bb77 85c0            test    eax,eax
fffff802`38d9bb79 786c            js      nt!PipCallDriverAddDevice+0x36b (fffff802`38d9bbe7)  Branch

nt!PipCallDriverAddDevice+0x2ff:
fffff802`38d9bb7b 81fb230000c0    cmp     ebx,0C0000023h
fffff802`38d9bb81 7424            je      nt!PipCallDriverAddDevice+0x32b (fffff802`38d9bba7)  Branch

nt!PipCallDriverAddDevice+0x307:
fffff802`38d9bb83 837d8810        cmp     dword ptr [rbp-78h],10h
fffff802`38d9bb87 751e            jne     nt!PipCallDriverAddDevice+0x32b (fffff802`38d9bba7)  Branch

nt!PipCallDriverAddDevice+0x30d:
fffff802`38d9bb89 837c246408      cmp     dword ptr [rsp+64h],8
fffff802`38d9bb8e 7517            jne     nt!PipCallDriverAddDevice+0x32b (fffff802`38d9bba7)  Branch

nt!PipCallDriverAddDevice+0x314:
fffff802`38d9bb90 44383561a3d1ff  cmp     byte ptr [nt!PnpBootMode (fffff802`38ab5ef8)],r14b
fffff802`38d9bb97 750e            jne     nt!PipCallDriverAddDevice+0x32b (fffff802`38d9bba7)  Branch

nt!PipCallDriverAddDevice+0x31d:
fffff802`38d9bb99 488b4510        mov     rax,qword ptr [rbp+10h]
fffff802`38d9bb9d 483945b0        cmp     qword ptr [rbp-50h],rax
fffff802`38d9bba1 0f8484010000    je      nt!PipCallDriverAddDevice+0x4af (fffff802`38d9bd2b)  Branch

nt!PipCallDriverAddDevice+0x32b:
fffff802`38d9bba7 4c8b4c2470      mov     r9,qword ptr [rsp+70h]
fffff802`38d9bbac 488d05252dc7ff  lea     rax,[nt!DEVPKEY_Device_PreventDriverLoad (fffff802`38a0e8d8)]
fffff802`38d9bbb3 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9bbb7 41b801000000    mov     r8d,1
fffff802`38d9bbbd 488b0d7440dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9bbc4 4489742448      mov     dword ptr [rsp+48h],r14d
fffff802`38d9bbc9 4489742440      mov     dword ptr [rsp+40h],r14d
fffff802`38d9bbce 4c89742438      mov     qword ptr [rsp+38h],r14
fffff802`38d9bbd3 4489742430      mov     dword ptr [rsp+30h],r14d
fffff802`38d9bbd8 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9bbdd 4c89742420      mov     qword ptr [rsp+20h],r14
fffff802`38d9bbe2 e86de6ffff      call    nt!_PnpSetObjectProperty (fffff802`38d9a254)

nt!PipCallDriverAddDevice+0x36b:
fffff802`38d9bbe7 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9bbec 488d442460      lea     rax,[rsp+60h]
fffff802`38d9bbf1 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9bbf5 41b909000000    mov     r9d,9
fffff802`38d9bbfb 488b0d3640dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9bc02 4489742438      mov     dword ptr [rsp+38h],r14d
fffff802`38d9bc07 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9bc0c 488d4520        lea     rax,[rbp+20h]
fffff802`38d9bc10 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9bc15 488d442478      lea     rax,[rsp+78h]
fffff802`38d9bc1a 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9bc1f c74424604e000000 mov     dword ptr [rsp+60h],4Eh
fffff802`38d9bc27 e81070f5ff      call    nt!_CmGetDeviceRegProp (fffff802`38cf2c3c)
fffff802`38d9bc2c 85c0            test    eax,eax
fffff802`38d9bc2e 0f8803020000    js      nt!PipCallDriverAddDevice+0x5bb (fffff802`38d9be37)  Branch

nt!PipCallDriverAddDevice+0x3b8:
fffff802`38d9bc34 837c247801      cmp     dword ptr [rsp+78h],1
fffff802`38d9bc39 0f85f8010000    jne     nt!PipCallDriverAddDevice+0x5bb (fffff802`38d9be37)  Branch

nt!PipCallDriverAddDevice+0x3c3:
fffff802`38d9bc3f 4439742460      cmp     dword ptr [rsp+60h],r14d
fffff802`38d9bc44 0f84ed010000    je      nt!PipCallDriverAddDevice+0x5bb (fffff802`38d9be37)  Branch

nt!PipCallDriverAddDevice+0x3ce:
fffff802`38d9bc4a 488d5520        lea     rdx,[rbp+20h]
fffff802`38d9bc4e 488d4db0        lea     rcx,[rbp-50h]
fffff802`38d9bc52 e8090c9cff      call    nt!RtlInitUnicodeStringEx (fffff802`3875c860)
fffff802`38d9bc57 4439358e05d5ff  cmp     dword ptr [nt!InitSafeBootMode (fffff802`38aec1ec)],r14d
fffff802`38d9bc5e 0f84a8010000    je      nt!PipCallDriverAddDevice+0x590 (fffff802`38d9be0c)  Branch

nt!PipCallDriverAddDevice+0x3e8:
fffff802`38d9bc64 488d542468      lea     rdx,[rsp+68h]
fffff802`38d9bc69 488d4db0        lea     rcx,[rbp-50h]
fffff802`38d9bc6d e88e471300      call    nt!IopSafebootDriverLoad (fffff802`38ed0400)
fffff802`38d9bc72 84c0            test    al,al
fffff802`38d9bc74 0f858d010000    jne     nt!PipCallDriverAddDevice+0x58b (fffff802`38d9be07)  Branch

nt!PipCallDriverAddDevice+0x3fe:
fffff802`38d9bc7a be5070656e      mov     esi,6E657050h
fffff802`38d9bc7f c744246000010000 mov     dword ptr [rsp+60h],100h
fffff802`38d9bc87 448bc6          mov     r8d,esi
fffff802`38d9bc8a ba00010000      mov     edx,100h
fffff802`38d9bc8f b901000000      mov     ecx,1
fffff802`38d9bc94 e87733c6ff      call    nt!ExAllocatePoolWithTag (fffff802`389ff010)
fffff802`38d9bc99 488bd8          mov     rbx,rax
fffff802`38d9bc9c 4885c0          test    rax,rax
fffff802`38d9bc9f 7470            je      nt!PipCallDriverAddDevice+0x495 (fffff802`38d9bd11)  Branch

nt!PipCallDriverAddDevice+0x425:
fffff802`38d9bca1 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9bca6 488d442460      lea     rax,[rsp+60h]
fffff802`38d9bcab 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9bcaf 41b901000000    mov     r9d,1
fffff802`38d9bcb5 488b0d7c3fdfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9bcbc 4489742438      mov     dword ptr [rsp+38h],r14d
fffff802`38d9bcc1 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9bcc6 488d442478      lea     rax,[rsp+78h]
fffff802`38d9bccb 48895c2428      mov     qword ptr [rsp+28h],rbx
fffff802`38d9bcd0 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9bcd5 e8626ff5ff      call    nt!_CmGetDeviceRegProp (fffff802`38cf2c3c)
fffff802`38d9bcda 3d230000c0      cmp     eax,0C0000023h
fffff802`38d9bcdf 7520            jne     nt!PipCallDriverAddDevice+0x485 (fffff802`38d9bd01)  Branch

nt!PipCallDriverAddDevice+0x465:
fffff802`38d9bce1 33d2            xor     edx,edx
fffff802`38d9bce3 488bcb          mov     rcx,rbx
fffff802`38d9bce6 e8753fc6ff      call    nt!ExFreePoolWithTag (fffff802`389ffc60)
fffff802`38d9bceb 8b542460        mov     edx,dword ptr [rsp+60h]
fffff802`38d9bcef 448bc6          mov     r8d,esi
fffff802`38d9bcf2 b901000000      mov     ecx,1
fffff802`38d9bcf7 e81433c6ff      call    nt!ExAllocatePoolWithTag (fffff802`389ff010)
fffff802`38d9bcfc 488bd8          mov     rbx,rax
fffff802`38d9bcff eb10            jmp     nt!PipCallDriverAddDevice+0x495 (fffff802`38d9bd11)  Branch

nt!PipCallDriverAddDevice+0x485:
fffff802`38d9bd01 85c0            test    eax,eax
fffff802`38d9bd03 780c            js      nt!PipCallDriverAddDevice+0x495 (fffff802`38d9bd11)  Branch

nt!PipCallDriverAddDevice+0x489:
fffff802`38d9bd05 488bd3          mov     rdx,rbx
fffff802`38d9bd08 488d4db0        lea     rcx,[rbp-50h]
fffff802`38d9bd0c e88ffd93ff      call    nt!RtlInitUnicodeString (fffff802`386dbaa0)

nt!PipCallDriverAddDevice+0x495:
fffff802`38d9bd11 33d2            xor     edx,edx
fffff802`38d9bd13 488d4db0        lea     rcx,[rbp-50h]
fffff802`38d9bd17 e8dc77feff      call    nt!IopBootLog (fffff802`38d834f8)
fffff802`38d9bd1c 4885db          test    rbx,rbx
fffff802`38d9bd1f 740a            je      nt!PipCallDriverAddDevice+0x4af (fffff802`38d9bd2b)  Branch

nt!PipCallDriverAddDevice+0x4a5:
fffff802`38d9bd21 33d2            xor     edx,edx
fffff802`38d9bd23 488bcb          mov     rcx,rbx
fffff802`38d9bd26 e8353fc6ff      call    nt!ExFreePoolWithTag (fffff802`389ffc60)

nt!PipCallDriverAddDevice+0x4af:
fffff802`38d9bd2b bb010000c0      mov     ebx,0C0000001h

nt!PipCallDriverAddDevice+0x4b4:
fffff802`38d9bd30 b806000000      mov     eax,6

nt!PipCallDriverAddDevice+0x4b9:
fffff802`38d9bd35 488d75e0        lea     rsi,[rbp-20h]
fffff802`38d9bd39 4533e4          xor     r12d,r12d

nt!PipCallDriverAddDevice+0x4c0:
fffff802`38d9bd3c 488b3e          mov     rdi,qword ptr [rsi]
fffff802`38d9bd3f 4885ff          test    rdi,rdi
fffff802`38d9bd42 7433            je      nt!PipCallDriverAddDevice+0x4fb (fffff802`38d9bd77)  Branch

nt!PipCallDriverAddDevice+0x4c8:
fffff802`38d9bd44 4438256fcfd4ff  cmp     byte ptr [nt!PnPBootDriversInitialized (fffff802`38ae8cba)],r12b
fffff802`38d9bd4b 4c8bf7          mov     r14,rdi
fffff802`38d9bd4e 488b7f08        mov     rdi,qword ptr [rdi+8]
fffff802`38d9bd52 7408            je      nt!PipCallDriverAddDevice+0x4e0 (fffff802`38d9bd5c)  Branch

nt!PipCallDriverAddDevice+0x4d8:
fffff802`38d9bd54 498b0e          mov     rcx,qword ptr [r14]
fffff802`38d9bd57 e818e00100      call    nt!PnpUnloadAttachedDriver (fffff802`38db9d74)

nt!PipCallDriverAddDevice+0x4e0:
fffff802`38d9bd5c 498b0e          mov     rcx,qword ptr [r14]
fffff802`38d9bd5f e89c0994ff      call    nt!ObfDereferenceObject (fffff802`386dc700)       ;<==
fffff802`38d9bd64 33d2            xor     edx,edx
fffff802`38d9bd66 498bce          mov     rcx,r14
fffff802`38d9bd69 e8f23ec6ff      call    nt!ExFreePoolWithTag (fffff802`389ffc60)
fffff802`38d9bd6e 4885ff          test    rdi,rdi
fffff802`38d9bd71 75d1            jne     nt!PipCallDriverAddDevice+0x4c8 (fffff802`38d9bd44)  Branch

nt!PipCallDriverAddDevice+0x4f7:
fffff802`38d9bd73 488b45c0        mov     rax,qword ptr [rbp-40h]

nt!PipCallDriverAddDevice+0x4fb:
fffff802`38d9bd77 4883c608        add     rsi,8
fffff802`38d9bd7b 4883e801        sub     rax,1
fffff802`38d9bd7f 488945c0        mov     qword ptr [rbp-40h],rax
fffff802`38d9bd83 75b7            jne     nt!PipCallDriverAddDevice+0x4c0 (fffff802`38d9bd3c)  Branch

nt!PipCallDriverAddDevice+0x509:
fffff802`38d9bd85 488b4c2470      mov     rcx,qword ptr [rsp+70h]
fffff802`38d9bd8a 4c8b65a0        mov     r12,qword ptr [rbp-60h]
fffff802`38d9bd8e 4885c9          test    rcx,rcx
fffff802`38d9bd91 7405            je      nt!PipCallDriverAddDevice+0x51c (fffff802`38d9bd98)  Branch

nt!PipCallDriverAddDevice+0x517:
fffff802`38d9bd93 e8c8e9acff      call    nt!ZwClose (fffff802`3886a760)

nt!PipCallDriverAddDevice+0x51c:
fffff802`38d9bd98 488b4d90        mov     rcx,qword ptr [rbp-70h]
fffff802`38d9bd9c 4885c9          test    rcx,rcx
fffff802`38d9bd9f 7405            je      nt!PipCallDriverAddDevice+0x52a (fffff802`38d9bda6)  Branch

nt!PipCallDriverAddDevice+0x525:
fffff802`38d9bda1 e8bae9acff      call    nt!ZwClose (fffff802`3886a760)

nt!PipCallDriverAddDevice+0x52a:
fffff802`38d9bda6 4d85e4          test    r12,r12
fffff802`38d9bda9 740d            je      nt!PipCallDriverAddDevice+0x53c (fffff802`38d9bdb8)  Branch

nt!PipCallDriverAddDevice+0x52f:
fffff802`38d9bdab ba506e7065      mov     edx,65706E50h
fffff802`38d9bdb0 498bcc          mov     rcx,r12
fffff802`38d9bdb3 e8083d94ff      call    nt!ObfDereferenceObjectWithTag (fffff802`386dfac0)

nt!PipCallDriverAddDevice+0x53c:
fffff802`38d9bdb8 488b45a8        mov     rax,qword ptr [rbp-58h]
fffff802`38d9bdbc 4885c0          test    rax,rax
fffff802`38d9bdbf 740d            je      nt!PipCallDriverAddDevice+0x552 (fffff802`38d9bdce)  Branch

nt!PipCallDriverAddDevice+0x545:
fffff802`38d9bdc1 ba506e7065      mov     edx,65706E50h
fffff802`38d9bdc6 488bc8          mov     rcx,rax
fffff802`38d9bdc9 e8f23c94ff      call    nt!ObfDereferenceObjectWithTag (fffff802`386dfac0)

nt!PipCallDriverAddDevice+0x552:
fffff802`38d9bdce 488b4d80        mov     rcx,qword ptr [rbp-80h]
fffff802`38d9bdd2 4885c9          test    rcx,rcx
fffff802`38d9bdd5 7407            je      nt!PipCallDriverAddDevice+0x562 (fffff802`38d9bdde)  Branch

nt!PipCallDriverAddDevice+0x55b:
fffff802`38d9bdd7 33d2            xor     edx,edx
fffff802`38d9bdd9 e8823ec6ff      call    nt!ExFreePoolWithTag (fffff802`389ffc60)

nt!PipCallDriverAddDevice+0x562:
fffff802`38d9bdde 8bc3            mov     eax,ebx
fffff802`38d9bde0 488b4d70        mov     rcx,qword ptr [rbp+70h]
fffff802`38d9bde4 4833cc          xor     rcx,rsp
fffff802`38d9bde7 e8d4b3aaff      call    nt!_security_check_cookie (fffff802`388471c0)
fffff802`38d9bdec 488b9c24d0010000 mov     rbx,qword ptr [rsp+1D0h]
fffff802`38d9bdf4 4881c480010000  add     rsp,180h
fffff802`38d9bdfb 415f            pop     r15
fffff802`38d9bdfd 415e            pop     r14
fffff802`38d9bdff 415d            pop     r13
fffff802`38d9be01 415c            pop     r12
fffff802`38d9be03 5f              pop     rdi
fffff802`38d9be04 5e              pop     rsi
fffff802`38d9be05 5d              pop     rbp
fffff802`38d9be06 c3              ret

nt!PipCallDriverAddDevice+0x58b:
fffff802`38d9be07 448a7c2468      mov     r15b,byte ptr [rsp+68h]

nt!PipCallDriverAddDevice+0x590:
fffff802`38d9be0c 488b0d253edfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9be13 488d4590        lea     rax,[rbp-70h]
fffff802`38d9be17 4c89742438      mov     qword ptr [rsp+38h],r14
fffff802`38d9be1c 488d5520        lea     rdx,[rbp+20h]
fffff802`38d9be20 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9be25 4488742428      mov     byte ptr [rsp+28h],r14b
fffff802`38d9be2a c744242019000200 mov     dword ptr [rsp+20h],20019h
fffff802`38d9be32 e8ad91eaff      call    nt!CmOpenInstallerClassRegKey (fffff802`38c44fe4)

nt!PipCallDriverAddDevice+0x5bb:
fffff802`38d9be37 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9be3c 488d442460      lea     rax,[rsp+60h]
fffff802`38d9be41 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9be45 41b90b000000    mov     r9d,0Bh
fffff802`38d9be4b 488b0de63ddfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9be52 4489742438      mov     dword ptr [rsp+38h],r14d
fffff802`38d9be57 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9be5c 488d44246c      lea     rax,[rsp+6Ch]
fffff802`38d9be61 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9be66 488d442478      lea     rax,[rsp+78h]
fffff802`38d9be6b 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9be70 c744246004000000 mov     dword ptr [rsp+60h],4
fffff802`38d9be78 e8bf6df5ff      call    nt!_CmGetDeviceRegProp (fffff802`38cf2c3c)
fffff802`38d9be7d 85c0            test    eax,eax
fffff802`38d9be7f 780e            js      nt!PipCallDriverAddDevice+0x613 (fffff802`38d9be8f)  Branch

nt!PipCallDriverAddDevice+0x605:
fffff802`38d9be81 837c247804      cmp     dword ptr [rsp+78h],4
fffff802`38d9be86 7507            jne     nt!PipCallDriverAddDevice+0x613 (fffff802`38d9be8f)  Branch

nt!PipCallDriverAddDevice+0x60c:
fffff802`38d9be88 837c246004      cmp     dword ptr [rsp+60h],4
fffff802`38d9be8d 7405            je      nt!PipCallDriverAddDevice+0x618 (fffff802`38d9be94)  Branch

nt!PipCallDriverAddDevice+0x613:
fffff802`38d9be8f 448974246c      mov     dword ptr [rsp+6Ch],r14d

nt!PipCallDriverAddDevice+0x618:
fffff802`38d9be94 ba00020000      mov     edx,200h
fffff802`38d9be99 488975d8        mov     qword ptr [rbp-28h],rsi
fffff802`38d9be9d be5070656e      mov     esi,6E657050h
fffff802`38d9bea2 48897dd0        mov     qword ptr [rbp-30h],rdi
fffff802`38d9bea6 448bc6          mov     r8d,esi
fffff802`38d9bea9 89542460        mov     dword ptr [rsp+60h],edx
fffff802`38d9bead b901000000      mov     ecx,1
fffff802`38d9beb2 418bde          mov     ebx,r14d
fffff802`38d9beb5 e85631c6ff      call    nt!ExAllocatePoolWithTag (fffff802`389ff010)
fffff802`38d9beba 48894580        mov     qword ptr [rbp-80h],rax
fffff802`38d9bebe 41be02000000    mov     r14d,2
fffff802`38d9bec4 4885c0          test    rax,rax
fffff802`38d9bec7 750a            jne     nt!PipCallDriverAddDevice+0x657 (fffff802`38d9bed3)  Branch

nt!PipCallDriverAddDevice+0x64d:
fffff802`38d9bec9 bb9a0000c0      mov     ebx,0C000009Ah
fffff802`38d9bece e9d0030000      jmp     nt!PipCallDriverAddDevice+0xa27 (fffff802`38d9c2a3)  Branch

nt!PipCallDriverAddDevice+0x657:
fffff802`38d9bed3 f744246c00000800 test    dword ptr [rsp+6Ch],80000h
fffff802`38d9bedb 0f84e5010000    je      nt!PipCallDriverAddDevice+0x84a (fffff802`38d9c0c6)  Branch

nt!PipCallDriverAddDevice+0x665:
fffff802`38d9bee1 488b4d90        mov     rcx,qword ptr [rbp-70h]
fffff802`38d9bee5 4885c9          test    rcx,rcx
fffff802`38d9bee8 0f842e010000    je      nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x672:
fffff802`38d9beee 488d45d0        lea     rax,[rbp-30h]
fffff802`38d9bef2 4533c0          xor     r8d,r8d
fffff802`38d9bef5 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9befa 4c8d0dcf05c7ff  lea     r9,[nt!DEVPKEY_DeviceClass_ConfigFilters (fffff802`38a0c4d0)]
fffff802`38d9bf01 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`38d9bf06 488d4520        lea     rax,[rbp+20h]
fffff802`38d9bf0a 215c2438        and     dword ptr [rsp+38h],ebx
fffff802`38d9bf0e 488d542460      lea     rdx,[rsp+60h]
fffff802`38d9bf13 c644243001      mov     byte ptr [rsp+30h],1
fffff802`38d9bf18 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff802`38d9bf1d 488d4d80        lea     rcx,[rbp-80h]
fffff802`38d9bf21 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9bf26 e87d070000      call    nt!PnpCallDriverQueryServiceHelper (fffff802`38d9c6a8)
fffff802`38d9bf2b 8bd8            mov     ebx,eax
fffff802`38d9bf2d 3d340000c0      cmp     eax,0C0000034h
fffff802`38d9bf32 7407            je      nt!PipCallDriverAddDevice+0x6bf (fffff802`38d9bf3b)  Branch

nt!PipCallDriverAddDevice+0x6b8:
fffff802`38d9bf34 3d250200c0      cmp     eax,0C0000225h
fffff802`38d9bf39 7502            jne     nt!PipCallDriverAddDevice+0x6c1 (fffff802`38d9bf3d)  Branch

nt!PipCallDriverAddDevice+0x6bf:
fffff802`38d9bf3b 33db            xor     ebx,ebx

nt!PipCallDriverAddDevice+0x6c1:
fffff802`38d9bf3d 85db            test    ebx,ebx
fffff802`38d9bf3f 0f88d7000000    js      nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x6c9:
fffff802`38d9bf45 8364245000      and     dword ptr [rsp+50h],0
fffff802`38d9bf4a 488d442464      lea     rax,[rsp+64h]
fffff802`38d9bf4f 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9bf54 8b442460        mov     eax,dword ptr [rsp+60h]
fffff802`38d9bf58 89442440        mov     dword ptr [rsp+40h],eax
fffff802`38d9bf5c 488b4580        mov     rax,qword ptr [rbp-80h]
fffff802`38d9bf60 4889442438      mov     qword ptr [rsp+38h],rax
fffff802`38d9bf65 eb5c            jmp     nt!PipCallDriverAddDevice+0x747 (fffff802`38d9bfc3)  Branch

nt!PipCallDriverAddDevice+0x6eb:
fffff802`38d9bf67 8b442460        mov     eax,dword ptr [rsp+60h]
fffff802`38d9bf6b 39442464        cmp     dword ptr [rsp+64h],eax
fffff802`38d9bf6f 0f86c3020000    jbe     nt!PipCallDriverAddDevice+0x9bc (fffff802`38d9c238)  Branch

nt!PipCallDriverAddDevice+0x6f9:
fffff802`38d9bf75 488b4d80        mov     rcx,qword ptr [rbp-80h]
fffff802`38d9bf79 33d2            xor     edx,edx
fffff802`38d9bf7b e8e03cc6ff      call    nt!ExFreePoolWithTag (fffff802`389ffc60)
fffff802`38d9bf80 8b442464        mov     eax,dword ptr [rsp+64h]
fffff802`38d9bf84 448bc6          mov     r8d,esi
fffff802`38d9bf87 8bd0            mov     edx,eax
fffff802`38d9bf89 89442460        mov     dword ptr [rsp+60h],eax
fffff802`38d9bf8d b901000000      mov     ecx,1
fffff802`38d9bf92 e87930c6ff      call    nt!ExAllocatePoolWithTag (fffff802`389ff010)
fffff802`38d9bf97 48894580        mov     qword ptr [rbp-80h],rax
fffff802`38d9bf9b 488bc8          mov     rcx,rax
fffff802`38d9bf9e 4885c0          test    rax,rax
fffff802`38d9bfa1 0f8487020000    je      nt!PipCallDriverAddDevice+0x9b2 (fffff802`38d9c22e)  Branch

nt!PipCallDriverAddDevice+0x72b:
fffff802`38d9bfa7 8364245000      and     dword ptr [rsp+50h],0
fffff802`38d9bfac 488d442464      lea     rax,[rsp+64h]
fffff802`38d9bfb1 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9bfb6 8b442460        mov     eax,dword ptr [rsp+60h]
fffff802`38d9bfba 89442440        mov     dword ptr [rsp+40h],eax
fffff802`38d9bfbe 48894c2438      mov     qword ptr [rsp+38h],rcx

nt!PipCallDriverAddDevice+0x747:
fffff802`38d9bfc3 4c8b4d90        mov     r9,qword ptr [rbp-70h]
fffff802`38d9bfc7 488d459c        lea     rax,[rbp-64h]
fffff802`38d9bfcb 488b0d663cdfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9bfd2 488d5520        lea     rdx,[rbp+20h]
fffff802`38d9bfd6 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9bfdb 458bc6          mov     r8d,r14d
fffff802`38d9bfde 488d05d304c7ff  lea     rax,[nt!DEVPKEY_DeviceClass_ConfigNotifyWnfTriggers (fffff802`38a0c4b8)]
fffff802`38d9bfe5 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9bfea 488364242000    and     qword ptr [rsp+20h],0
fffff802`38d9bff0 e8133df5ff      call    nt!_PnpGetObjectProperty (fffff802`38cefd08)
fffff802`38d9bff5 8bd8            mov     ebx,eax
fffff802`38d9bff7 3d230000c0      cmp     eax,0C0000023h
fffff802`38d9bffc 0f8465ffffff    je      nt!PipCallDriverAddDevice+0x6eb (fffff802`38d9bf67)  Branch

nt!PipCallDriverAddDevice+0x786:
fffff802`38d9c002 85db            test    ebx,ebx
fffff802`38d9c004 0f8938020000    jns     nt!PipCallDriverAddDevice+0x9c6 (fffff802`38d9c242)  Branch

nt!PipCallDriverAddDevice+0x78e:
fffff802`38d9c00a 81fb340000c0    cmp     ebx,0C0000034h
fffff802`38d9c010 7408            je      nt!PipCallDriverAddDevice+0x79e (fffff802`38d9c01a)  Branch

nt!PipCallDriverAddDevice+0x796:
fffff802`38d9c012 81fb250200c0    cmp     ebx,0C0000225h
fffff802`38d9c018 7502            jne     nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x79e:
fffff802`38d9c01a 33db            xor     ebx,ebx

nt!PipCallDriverAddDevice+0x7a0:
fffff802`38d9c01c 48837de000      cmp     qword ptr [rbp-20h],0
fffff802`38d9c021 0f8597000000    jne     nt!PipCallDriverAddDevice+0x842 (fffff802`38d9c0be)  Branch

nt!PipCallDriverAddDevice+0x7ab:
fffff802`38d9c027 8364243800      and     dword ptr [rsp+38h],0
fffff802`38d9c02c 488d442464      lea     rax,[rsp+64h]
fffff802`38d9c031 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9c036 be04000000      mov     esi,4
fffff802`38d9c03b 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9c03f 488b0df23bdfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9c046 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9c04b 488d44246c      lea     rax,[rsp+6Ch]
fffff802`38d9c050 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c055 448d4e07        lea     r9d,[rsi+7]
fffff802`38d9c059 488d442478      lea     rax,[rsp+78h]
fffff802`38d9c05e 89742464        mov     dword ptr [rsp+64h],esi
fffff802`38d9c062 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c067 e8d06bf5ff      call    nt!_CmGetDeviceRegProp (fffff802`38cf2c3c)
fffff802`38d9c06c 85c0            test    eax,eax
fffff802`38d9c06e 784e            js      nt!PipCallDriverAddDevice+0x842 (fffff802`38d9c0be)  Branch

nt!PipCallDriverAddDevice+0x7f4:
fffff802`38d9c070 39742478        cmp     dword ptr [rsp+78h],esi
fffff802`38d9c074 7548            jne     nt!PipCallDriverAddDevice+0x842 (fffff802`38d9c0be)  Branch

nt!PipCallDriverAddDevice+0x7fa:
fffff802`38d9c076 39742464        cmp     dword ptr [rsp+64h],esi
fffff802`38d9c07a 7542            jne     nt!PipCallDriverAddDevice+0x842 (fffff802`38d9c0be)  Branch

nt!PipCallDriverAddDevice+0x800:
fffff802`38d9c07c 8b44246c        mov     eax,dword ptr [rsp+6Ch]
fffff802`38d9c080 0fbae013        bt      eax,13h
fffff802`38d9c084 7338            jae     nt!PipCallDriverAddDevice+0x842 (fffff802`38d9c0be)  Branch

nt!PipCallDriverAddDevice+0x80a:
fffff802`38d9c086 8364243800      and     dword ptr [rsp+38h],0
fffff802`38d9c08b 448d4e07        lea     r9d,[rsi+7]
fffff802`38d9c08f 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9c094 0fbaf013        btr     eax,13h
fffff802`38d9c098 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9c09c 488b0d953bdfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9c0a3 8944246c        mov     dword ptr [rsp+6Ch],eax
fffff802`38d9c0a7 488d44246c      lea     rax,[rsp+6Ch]
fffff802`38d9c0ac 89742430        mov     dword ptr [rsp+30h],esi
fffff802`38d9c0b0 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c0b5 89742420        mov     dword ptr [rsp+20h],esi
fffff802`38d9c0b9 e8a2b5ffff      call    nt!_CmSetDeviceRegProp (fffff802`38d97660)

nt!PipCallDriverAddDevice+0x842:
fffff802`38d9c0be 85db            test    ebx,ebx
fffff802`38d9c0c0 0f88dd010000    js      nt!PipCallDriverAddDevice+0xa27 (fffff802`38d9c2a3)  Branch

nt!PipCallDriverAddDevice+0x84a:
fffff802`38d9c0c6 be00000004      mov     esi,4000000h
fffff802`38d9c0cb 85b78c010000    test    dword ptr [rdi+18Ch],esi
fffff802`38d9c0d1 755f            jne     nt!PipCallDriverAddDevice+0x8b6 (fffff802`38d9c132)  Branch

nt!PipCallDriverAddDevice+0x857:
fffff802`38d9c0d3 488d45d0        lea     rax,[rbp-30h]
fffff802`38d9c0d7 4533c9          xor     r9d,r9d
fffff802`38d9c0da 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9c0df 488d542460      lea     rdx,[rsp+60h]
fffff802`38d9c0e4 488b442470      mov     rax,qword ptr [rsp+70h]
fffff802`38d9c0e9 488d4d80        lea     rcx,[rbp-80h]
fffff802`38d9c0ed 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`38d9c0f2 c744243801000000 mov     dword ptr [rsp+38h],1
fffff802`38d9c0fa 458d4113        lea     r8d,[r9+13h]
fffff802`38d9c0fe c644243000      mov     byte ptr [rsp+30h],0
fffff802`38d9c103 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c108 488b4730        mov     rax,qword ptr [rdi+30h]
fffff802`38d9c10c 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c111 e892050000      call    nt!PnpCallDriverQueryServiceHelper (fffff802`38d9c6a8)
fffff802`38d9c116 8bd8            mov     ebx,eax
fffff802`38d9c118 3d340000c0      cmp     eax,0C0000034h
fffff802`38d9c11d 7407            je      nt!PipCallDriverAddDevice+0x8aa (fffff802`38d9c126)  Branch

nt!PipCallDriverAddDevice+0x8a3:
fffff802`38d9c11f 3d250200c0      cmp     eax,0C0000225h
fffff802`38d9c124 750c            jne     nt!PipCallDriverAddDevice+0x8b6 (fffff802`38d9c132)  Branch

nt!PipCallDriverAddDevice+0x8aa:
fffff802`38d9c126 8bd6            mov     edx,esi
fffff802`38d9c128 488bcf          mov     rcx,rdi
fffff802`38d9c12b e8e8dbffff      call    nt!PipSetDevNodeFlags (fffff802`38d99d18)
fffff802`38d9c130 33db            xor     ebx,ebx

nt!PipCallDriverAddDevice+0x8b6:
fffff802`38d9c132 85db            test    ebx,ebx
fffff802`38d9c134 0f8869010000    js      nt!PipCallDriverAddDevice+0xa27 (fffff802`38d9c2a3)  Branch

nt!PipCallDriverAddDevice+0x8be:
fffff802`38d9c13a 488b4d90        mov     rcx,qword ptr [rbp-70h]
fffff802`38d9c13e 4885c9          test    rcx,rcx
fffff802`38d9c141 746a            je      nt!PipCallDriverAddDevice+0x931 (fffff802`38d9c1ad)  Branch

nt!PipCallDriverAddDevice+0x8c7:
fffff802`38d9c143 be00000008      mov     esi,8000000h
fffff802`38d9c148 85b78c010000    test    dword ptr [rdi+18Ch],esi
fffff802`38d9c14e 755d            jne     nt!PipCallDriverAddDevice+0x931 (fffff802`38d9c1ad)  Branch

nt!PipCallDriverAddDevice+0x8d4:
fffff802`38d9c150 488d45d0        lea     rax,[rbp-30h]
fffff802`38d9c154 41b813000000    mov     r8d,13h
fffff802`38d9c15a 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9c15f 4c8d0d1a02c7ff  lea     r9,[nt!DEVPKEY_DeviceClass_CompoundLowerFilters (fffff802`38a0c380)]
fffff802`38d9c166 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`38d9c16b 488d4520        lea     rax,[rbp+20h]
fffff802`38d9c16f 4489742438      mov     dword ptr [rsp+38h],r14d
fffff802`38d9c174 488d542460      lea     rdx,[rsp+60h]
fffff802`38d9c179 c644243001      mov     byte ptr [rsp+30h],1
fffff802`38d9c17e 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff802`38d9c183 488d4d80        lea     rcx,[rbp-80h]
fffff802`38d9c187 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c18c e817050000      call    nt!PnpCallDriverQueryServiceHelper (fffff802`38d9c6a8)
fffff802`38d9c191 8bd8            mov     ebx,eax
fffff802`38d9c193 3d340000c0      cmp     eax,0C0000034h
fffff802`38d9c198 7407            je      nt!PipCallDriverAddDevice+0x925 (fffff802`38d9c1a1)  Branch

nt!PipCallDriverAddDevice+0x91e:
fffff802`38d9c19a 3d250200c0      cmp     eax,0C0000225h
fffff802`38d9c19f 750c            jne     nt!PipCallDriverAddDevice+0x931 (fffff802`38d9c1ad)  Branch

nt!PipCallDriverAddDevice+0x925:
fffff802`38d9c1a1 8bd6            mov     edx,esi
fffff802`38d9c1a3 488bcf          mov     rcx,rdi
fffff802`38d9c1a6 e86ddbffff      call    nt!PipSetDevNodeFlags (fffff802`38d99d18)
fffff802`38d9c1ab 33db            xor     ebx,ebx

nt!PipCallDriverAddDevice+0x931:
fffff802`38d9c1ad 85db            test    ebx,ebx
fffff802`38d9c1af 0f88ee000000    js      nt!PipCallDriverAddDevice+0xa27 (fffff802`38d9c2a3)  Branch

nt!PipCallDriverAddDevice+0x939:
fffff802`38d9c1b5 be00000010      mov     esi,10000000h
fffff802`38d9c1ba 85b78c010000    test    dword ptr [rdi+18Ch],esi
fffff802`38d9c1c0 0f85d8000000    jne     nt!PipCallDriverAddDevice+0xa22 (fffff802`38d9c29e)  Branch

nt!PipCallDriverAddDevice+0x94a:
fffff802`38d9c1c6 488d45d0        lea     rax,[rbp-30h]
fffff802`38d9c1ca 4533c9          xor     r9d,r9d
fffff802`38d9c1cd 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9c1d2 488d542460      lea     rdx,[rsp+60h]
fffff802`38d9c1d7 488b442470      mov     rax,qword ptr [rsp+70h]
fffff802`38d9c1dc 488d4d80        lea     rcx,[rbp-80h]
fffff802`38d9c1e0 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`38d9c1e5 c744243803000000 mov     dword ptr [rsp+38h],3
fffff802`38d9c1ed 458d4105        lea     r8d,[r9+5]
fffff802`38d9c1f1 c644243000      mov     byte ptr [rsp+30h],0
fffff802`38d9c1f6 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c1fb 488b4730        mov     rax,qword ptr [rdi+30h]
fffff802`38d9c1ff 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c204 e89f040000      call    nt!PnpCallDriverQueryServiceHelper (fffff802`38d9c6a8)    ;<== call DriverEntry
fffff802`38d9c209 8bd8            mov     ebx,eax
fffff802`38d9c20b 3d340000c0      cmp     eax,0C0000034h
fffff802`38d9c210 740b            je      nt!PipCallDriverAddDevice+0x9a1 (fffff802`38d9c21d)  Branch

nt!PipCallDriverAddDevice+0x996:
fffff802`38d9c212 3d250200c0      cmp     eax,0C0000225h
fffff802`38d9c217 0f8586000000    jne     nt!PipCallDriverAddDevice+0xa27 (fffff802`38d9c2a3)  Branch

nt!PipCallDriverAddDevice+0x9a1:
fffff802`38d9c21d 8bd6            mov     edx,esi
fffff802`38d9c21f 488bcf          mov     rcx,rdi
fffff802`38d9c222 bb340000c0      mov     ebx,0C0000034h
fffff802`38d9c227 e8ecdaffff      call    nt!PipSetDevNodeFlags (fffff802`38d99d18)
fffff802`38d9c22c eb75            jmp     nt!PipCallDriverAddDevice+0xa27 (fffff802`38d9c2a3)  Branch

nt!PipCallDriverAddDevice+0x9b2:
fffff802`38d9c22e bb9a0000c0      mov     ebx,0C000009Ah
fffff802`38d9c233 e9cafdffff      jmp     nt!PipCallDriverAddDevice+0x786 (fffff802`38d9c002)  Branch

nt!PipCallDriverAddDevice+0x9bc:
fffff802`38d9c238 bb010000c0      mov     ebx,0C0000001h
fffff802`38d9c23d e9dafdffff      jmp     nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x9c6:
fffff802`38d9c242 817d9c03100000  cmp     dword ptr [rbp-64h],1003h
fffff802`38d9c249 0f85cdfdffff    jne     nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x9d3:
fffff802`38d9c24f 8b742464        mov     esi,dword ptr [rsp+64h]
fffff802`38d9c253 40f6c607        test    sil,7
fffff802`38d9c257 0f85bffdffff    jne     nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x9e1:
fffff802`38d9c25d 85f6            test    esi,esi
fffff802`38d9c25f 0f84b7fdffff    je      nt!PipCallDriverAddDevice+0x7a0 (fffff802`38d9c01c)  Branch

nt!PipCallDriverAddDevice+0x9e9:
fffff802`38d9c265 488b5d80        mov     rbx,qword ptr [rbp-80h]
fffff802`38d9c269 c1ee03          shr     esi,3

nt!PipCallDriverAddDevice+0x9f0:
fffff802`38d9c26c 8364243000      and     dword ptr [rsp+30h],0
fffff802`38d9c271 4533c9          xor     r9d,r9d
fffff802`38d9c274 8364242800      and     dword ptr [rsp+28h],0
fffff802`38d9c279 4533c0          xor     r8d,r8d
fffff802`38d9c27c 488364242000    and     qword ptr [rsp+20h],0
fffff802`38d9c282 33d2            xor     edx,edx
fffff802`38d9c284 488bcb          mov     rcx,rbx
fffff802`38d9c287 e8d41badff      call    nt!ZwUpdateWnfStateData (fffff802`3886de60)
fffff802`38d9c28c 4883c308        add     rbx,8
fffff802`38d9c290 83c6ff          add     esi,0FFFFFFFFh
fffff802`38d9c293 75d7            jne     nt!PipCallDriverAddDevice+0x9f0 (fffff802`38d9c26c)  Branch

nt!PipCallDriverAddDevice+0xa19:
fffff802`38d9c295 448d4638        lea     r8d,[rsi+38h]
fffff802`38d9c299 e937f7ffff      jmp     nt!PipCallDriverAddDevice+0x159 (fffff802`38d9b9d5)  Branch

nt!PipCallDriverAddDevice+0xa22:
fffff802`38d9c29e bb340000c0      mov     ebx,0C0000034h

nt!PipCallDriverAddDevice+0xa27:
fffff802`38d9c2a3 8b8f8c010000    mov     ecx,dword ptr [rdi+18Ch]
fffff802`38d9c2a9 0fbae10c        bt      ecx,0Ch
fffff802`38d9c2ad 7307            jae     nt!PipCallDriverAddDevice+0xa3a (fffff802`38d9c2b6)  Branch

nt!PipCallDriverAddDevice+0xa33:
fffff802`38d9c2af 33db            xor     ebx,ebx
fffff802`38d9c2b1 e97afaffff      jmp     nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xa3a:
fffff802`38d9c2b6 85db            test    ebx,ebx
fffff802`38d9c2b8 7823            js      nt!PipCallDriverAddDevice+0xa61 (fffff802`38d9c2dd)  Branch

nt!PipCallDriverAddDevice+0xa3e:
fffff802`38d9c2ba 488b45f8        mov     rax,qword ptr [rbp-8]
fffff802`38d9c2be 4883780800      cmp     qword ptr [rax+8],0
fffff802`38d9c2c3 7447            je      nt!PipCallDriverAddDevice+0xa90 (fffff802`38d9c30c)  Branch

nt!PipCallDriverAddDevice+0xa49:
fffff802`38d9c2c5 ba13000000      mov     edx,13h
fffff802`38d9c2ca 41b8820100c0    mov     r8d,0C0000182h
fffff802`38d9c2d0 488bcf          mov     rcx,rdi
fffff802`38d9c2d3 e8b87e0000      call    nt!PipSetDevNodeProblem (fffff802`38da4190)
fffff802`38d9c2d8 e94efaffff      jmp     nt!PipCallDriverAddDevice+0x4af (fffff802`38d9bd2b)  Branch

nt!PipCallDriverAddDevice+0xa61:
fffff802`38d9c2dd 81fb340000c0    cmp     ebx,0C0000034h
fffff802`38d9c2e3 0f8547faffff    jne     nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xa6d:
fffff802`38d9c2e9 f7873002000000010000 test dword ptr [rdi+230h],100h
fffff802`38d9c2f3 0f8432faffff    je      nt!PipCallDriverAddDevice+0x4af (fffff802`38d9bd2b)  Branch

nt!PipCallDriverAddDevice+0xa7d:
fffff802`38d9c2f9 488bcf          mov     rcx,rdi
fffff802`38d9c2fc e82779ffff      call    nt!PipClearDevNodeProblem (fffff802`38d93c28)
fffff802`38d9c301 8b8f8c010000    mov     ecx,dword ptr [rdi+18Ch]
fffff802`38d9c307 33db            xor     ebx,ebx
fffff802`38d9c309 41b501          mov     r13b,1

nt!PipCallDriverAddDevice+0xa90:
fffff802`38d9c30c be00000020      mov     esi,20000000h
fffff802`38d9c311 85ce            test    esi,ecx
fffff802`38d9c313 755f            jne     nt!PipCallDriverAddDevice+0xaf8 (fffff802`38d9c374)  Branch

nt!PipCallDriverAddDevice+0xa99:
fffff802`38d9c315 488d45d0        lea     rax,[rbp-30h]
fffff802`38d9c319 4533c9          xor     r9d,r9d
fffff802`38d9c31c 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9c321 488d542460      lea     rdx,[rsp+60h]
fffff802`38d9c326 488b442470      mov     rax,qword ptr [rsp+70h]
fffff802`38d9c32b 488d4d80        lea     rcx,[rbp-80h]
fffff802`38d9c32f 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`38d9c334 c744243804000000 mov     dword ptr [rsp+38h],4
fffff802`38d9c33c 458d4112        lea     r8d,[r9+12h]
fffff802`38d9c340 c644243000      mov     byte ptr [rsp+30h],0
fffff802`38d9c345 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c34a 488b4730        mov     rax,qword ptr [rdi+30h]
fffff802`38d9c34e 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c353 e850030000      call    nt!PnpCallDriverQueryServiceHelper (fffff802`38d9c6a8)
fffff802`38d9c358 8bd8            mov     ebx,eax
fffff802`38d9c35a 3d340000c0      cmp     eax,0C0000034h
fffff802`38d9c35f 7407            je      nt!PipCallDriverAddDevice+0xaec (fffff802`38d9c368)  Branch

nt!PipCallDriverAddDevice+0xae5:
fffff802`38d9c361 3d250200c0      cmp     eax,0C0000225h
fffff802`38d9c366 750c            jne     nt!PipCallDriverAddDevice+0xaf8 (fffff802`38d9c374)  Branch

nt!PipCallDriverAddDevice+0xaec:
fffff802`38d9c368 8bd6            mov     edx,esi
fffff802`38d9c36a 488bcf          mov     rcx,rdi
fffff802`38d9c36d e8a6d9ffff      call    nt!PipSetDevNodeFlags (fffff802`38d99d18)
fffff802`38d9c372 33db            xor     ebx,ebx

nt!PipCallDriverAddDevice+0xaf8:
fffff802`38d9c374 85db            test    ebx,ebx
fffff802`38d9c376 0f88b4f9ffff    js      nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xb00:
fffff802`38d9c37c 488b4d90        mov     rcx,qword ptr [rbp-70h]
fffff802`38d9c380 4885c9          test    rcx,rcx
fffff802`38d9c383 7473            je      nt!PipCallDriverAddDevice+0xb7c (fffff802`38d9c3f8)  Branch

nt!PipCallDriverAddDevice+0xb09:
fffff802`38d9c385 be00000040      mov     esi,40000000h
fffff802`38d9c38a 85b78c010000    test    dword ptr [rdi+18Ch],esi
fffff802`38d9c390 7566            jne     nt!PipCallDriverAddDevice+0xb7c (fffff802`38d9c3f8)  Branch

nt!PipCallDriverAddDevice+0xb16:
fffff802`38d9c392 488d45d0        lea     rax,[rbp-30h]
fffff802`38d9c396 41b812000000    mov     r8d,12h
fffff802`38d9c39c 4889442448      mov     qword ptr [rsp+48h],rax
fffff802`38d9c3a1 4c8d0dc0ffc6ff  lea     r9,[nt!DEVPKEY_DeviceClass_CompoundUpperFilters (fffff802`38a0c368)]
fffff802`38d9c3a8 44887c2440      mov     byte ptr [rsp+40h],r15b
fffff802`38d9c3ad 488d4520        lea     rax,[rbp+20h]
fffff802`38d9c3b1 c744243805000000 mov     dword ptr [rsp+38h],5
fffff802`38d9c3b9 488d542460      lea     rdx,[rsp+60h]
fffff802`38d9c3be c644243001      mov     byte ptr [rsp+30h],1
fffff802`38d9c3c3 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff802`38d9c3c8 488d4d80        lea     rcx,[rbp-80h]
fffff802`38d9c3cc 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c3d1 e8d2020000      call    nt!PnpCallDriverQueryServiceHelper (fffff802`38d9c6a8)
fffff802`38d9c3d6 8bd8            mov     ebx,eax
fffff802`38d9c3d8 3d340000c0      cmp     eax,0C0000034h
fffff802`38d9c3dd 740d            je      nt!PipCallDriverAddDevice+0xb70 (fffff802`38d9c3ec)  Branch

nt!PipCallDriverAddDevice+0xb63:
fffff802`38d9c3df 3d250200c0      cmp     eax,0C0000225h
fffff802`38d9c3e4 7406            je      nt!PipCallDriverAddDevice+0xb70 (fffff802`38d9c3ec)  Branch

nt!PipCallDriverAddDevice+0xb6a:
fffff802`38d9c3e6 85c0            test    eax,eax
fffff802`38d9c3e8 780e            js      nt!PipCallDriverAddDevice+0xb7c (fffff802`38d9c3f8)  Branch

nt!PipCallDriverAddDevice+0xb6e:
fffff802`38d9c3ea eb14            jmp     nt!PipCallDriverAddDevice+0xb84 (fffff802`38d9c400)  Branch

nt!PipCallDriverAddDevice+0xb70:
fffff802`38d9c3ec 8bd6            mov     edx,esi
fffff802`38d9c3ee 488bcf          mov     rcx,rdi
fffff802`38d9c3f1 e822d9ffff      call    nt!PipSetDevNodeFlags (fffff802`38d99d18)
fffff802`38d9c3f6 33db            xor     ebx,ebx

nt!PipCallDriverAddDevice+0xb7c:
fffff802`38d9c3f8 85db            test    ebx,ebx
fffff802`38d9c3fa 0f8830f9ffff    js      nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xb84:
fffff802`38d9c400 488b45d0        mov     rax,qword ptr [rbp-30h]
fffff802`38d9c404 488b5c2470      mov     rbx,qword ptr [rsp+70h]
fffff802`38d9c409 f7803002000000001000 test dword ptr [rax+230h],100000h
fffff802`38d9c413 750c            jne     nt!PipCallDriverAddDevice+0xba5 (fffff802`38d9c421)  Branch

nt!PipCallDriverAddDevice+0xb99:
fffff802`38d9c415 488d4dd0        lea     rcx,[rbp-30h]
fffff802`38d9c419 e8e63b0100      call    nt!PipDmgGetDeviceDmarPolicy (fffff802`38db0004)
fffff802`38d9c41e 448bf0          mov     r14d,eax

nt!PipCallDriverAddDevice+0xba5:
fffff802`38d9c421 488b4dd0        mov     rcx,qword ptr [rbp-30h]
fffff802`38d9c425 458bc6          mov     r8d,r14d
fffff802`38d9c428 488bd3          mov     rdx,rbx
fffff802`38d9c42b e8143b0100      call    nt!PipDmgSaveDeviceDmarPolicy (fffff802`38daff44)
fffff802`38d9c430 8bd8            mov     ebx,eax
fffff802`38d9c432 85c0            test    eax,eax
fffff802`38d9c434 0f88f6f8ffff    js      nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xbbe:
fffff802`38d9c43a 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff802`38d9c43e ba506e7065      mov     edx,65706E50h
fffff802`38d9c443 4533f6          xor     r14d,r14d
fffff802`38d9c446 e8e10193ff      call    nt!IoGetAttachedDeviceReferenceWithTag (fffff802`386cc62c)    ;query attached device
fffff802`38d9c44b 488945a0        mov     qword ptr [rbp-60h],rax
fffff802`38d9c44f 32db            xor     bl,bl

; for(int i=0; i<6; i++) {

nt!PipCallDriverAddDevice+0xbd5:
fffff802`38d9c451 80fb03          cmp     bl,3      
fffff802`38d9c454 752b            jne     nt!PipCallDriverAddDevice+0xc05 (fffff802`38d9c481)  Branch

nt!PipCallDriverAddDevice+0xbda:
fffff802`38d9c456 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff802`38d9c45a ba506e7065      mov     edx,65706E50h
fffff802`38d9c45f e8c80193ff      call    nt!IoGetAttachedDeviceReferenceWithTag (fffff802`386cc62c) 
fffff802`38d9c464 488945a8        mov     qword ptr [rbp-58h],rax
fffff802`38d9c468 4584ed          test    r13b,r13b
fffff802`38d9c46b 7414            je      nt!PipCallDriverAddDevice+0xc05 (fffff802`38d9c481)  Branch

nt!PipCallDriverAddDevice+0xbf1:
fffff802`38d9c46d 48837df800      cmp     qword ptr [rbp-8],0
fffff802`38d9c472 750d            jne     nt!PipCallDriverAddDevice+0xc05 (fffff802`38d9c481)  Branch

nt!PipCallDriverAddDevice+0xbf8:
fffff802`38d9c474 ba03030000      mov     edx,303h
fffff802`38d9c479 488bcf          mov     rcx,rdi
fffff802`38d9c47c e8771ea7ff      call    nt!PipSetDevNodeState (fffff802`3880e2f8)

nt!PipCallDriverAddDevice+0xc05:
fffff802`38d9c481 0fb6cb          movzx   ecx,bl
fffff802`38d9c484 4c8b7ccde0      mov     r15,qword ptr [rbp+rcx*8-20h]
fffff802`38d9c489 498bf7          mov     rsi,r15
fffff802`38d9c48c 4d85ff          test    r15,r15
fffff802`38d9c48f 7457            je      nt!PipCallDriverAddDevice+0xc6c (fffff802`38d9c4e8)  Branch

nt!PipCallDriverAddDevice+0xc15:
fffff802`38d9c491 440fb6e3        movzx   r12d,bl

nt!PipCallDriverAddDevice+0xc19:
fffff802`38d9c495 488b16          mov     rdx,qword ptr [rsi]
fffff802`38d9c498 458bcc          mov     r9d,r12d
fffff802`38d9c49b 488bcf          mov     rcx,rdi
fffff802`38d9c49e 488b4230        mov     rax,qword ptr [rdx+30h]
fffff802`38d9c4a2 4c8b4008        mov     r8,qword ptr [rax+8]
fffff802`38d9c4a6 e8c51b0200      call    nt!PnpCallAddDevice (fffff802`38dbe070)
fffff802`38d9c4ab 488b0e          mov     rcx,qword ptr [rsi]       ;這邊回傳 0xC000000E 所以add device失敗
fffff802`38d9c4ae 448bd8          mov     r11d,eax
fffff802`38d9c4b1 0fba69100a      bts     dword ptr [rcx+10h],0Ah
fffff802`38d9c4b6 85c0            test    eax,eax
fffff802`38d9c4b8 781c            js      nt!PipCallDriverAddDevice+0xc5a (fffff802`38d9c4d6)  Branch

nt!PipCallDriverAddDevice+0xc3e:
fffff802`38d9c4ba 80fb03          cmp     bl,3
fffff802`38d9c4bd 7508            jne     nt!PipCallDriverAddDevice+0xc4b (fffff802`38d9c4c7)  Branch

nt!PipCallDriverAddDevice+0xc43:
fffff802`38d9c4bf 488b45a8        mov     rax,qword ptr [rbp-58h]
fffff802`38d9c4c3 4c8b7018        mov     r14,qword ptr [rax+18h]

nt!PipCallDriverAddDevice+0xc4b:
fffff802`38d9c4c7 ba03030000      mov     edx,303h
fffff802`38d9c4cc 488bcf          mov     rcx,rdi
fffff802`38d9c4cf e8241ea7ff      call    nt!PipSetDevNodeState (fffff802`3880e2f8)
fffff802`38d9c4d4 eb09            jmp     nt!PipCallDriverAddDevice+0xc63 (fffff802`38d9c4df)  Branch

nt!PipCallDriverAddDevice+0xc5a:
fffff802`38d9c4d6 80fb03          cmp     bl,3
fffff802`38d9c4d9 0f84cd000000    je      nt!PipCallDriverAddDevice+0xd30 (fffff802`38d9c5ac)  Branch

nt!PipCallDriverAddDevice+0xc63:
fffff802`38d9c4df 488b7608        mov     rsi,qword ptr [rsi+8]
fffff802`38d9c4e3 4885f6          test    rsi,rsi
fffff802`38d9c4e6 75ad            jne     nt!PipCallDriverAddDevice+0xc19 (fffff802`38d9c495)  Branch

nt!PipCallDriverAddDevice+0xc6c:
fffff802`38d9c4e8 84db            test    bl,bl
fffff802`38d9c4ea 0f85a2000000    jne     nt!PipCallDriverAddDevice+0xd16 (fffff802`38d9c592)  Branch

nt!PipCallDriverAddDevice+0xc74:
fffff802`38d9c4f0 4d85ff          test    r15,r15
fffff802`38d9c4f3 0f8499000000    je      nt!PipCallDriverAddDevice+0xd16 (fffff802`38d9c592)  Branch

nt!PipCallDriverAddDevice+0xc7d:
fffff802`38d9c4f9 8364243800      and     dword ptr [rsp+38h],0
fffff802`38d9c4fe 488d442464      lea     rax,[rsp+64h]
fffff802`38d9c503 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9c508 be04000000      mov     esi,4
fffff802`38d9c50d 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9c511 488b0d2037dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9c518 4889442430      mov     qword ptr [rsp+30h],rax
fffff802`38d9c51d 488d44246c      lea     rax,[rsp+6Ch]
fffff802`38d9c522 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c527 448d7e07        lea     r15d,[rsi+7]
fffff802`38d9c52b 488d442478      lea     rax,[rsp+78h]
fffff802`38d9c530 89742464        mov     dword ptr [rsp+64h],esi
fffff802`38d9c534 458bcf          mov     r9d,r15d
fffff802`38d9c537 4889442420      mov     qword ptr [rsp+20h],rax
fffff802`38d9c53c e8fb66f5ff      call    nt!_CmGetDeviceRegProp (fffff802`38cf2c3c)
fffff802`38d9c541 85c0            test    eax,eax
fffff802`38d9c543 784d            js      nt!PipCallDriverAddDevice+0xd16 (fffff802`38d9c592)  Branch

nt!PipCallDriverAddDevice+0xcc9:
fffff802`38d9c545 39742478        cmp     dword ptr [rsp+78h],esi
fffff802`38d9c549 7547            jne     nt!PipCallDriverAddDevice+0xd16 (fffff802`38d9c592)  Branch

nt!PipCallDriverAddDevice+0xccf:
fffff802`38d9c54b 39742464        cmp     dword ptr [rsp+64h],esi
fffff802`38d9c54f 7541            jne     nt!PipCallDriverAddDevice+0xd16 (fffff802`38d9c592)  Branch

nt!PipCallDriverAddDevice+0xcd5:
fffff802`38d9c551 8b44246c        mov     eax,dword ptr [rsp+6Ch]
fffff802`38d9c555 0fbae013        bt      eax,13h
fffff802`38d9c559 7337            jae     nt!PipCallDriverAddDevice+0xd16 (fffff802`38d9c592)  Branch

nt!PipCallDriverAddDevice+0xcdf:
fffff802`38d9c55b 8364243800      and     dword ptr [rsp+38h],0
fffff802`38d9c560 0fbaf013        btr     eax,13h
fffff802`38d9c564 4c8b442470      mov     r8,qword ptr [rsp+70h]
fffff802`38d9c569 458bcf          mov     r9d,r15d
fffff802`38d9c56c 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9c570 488b0dc136dfff  mov     rcx,qword ptr [nt!PiPnpRtlCtx (fffff802`38b8fc38)]
fffff802`38d9c577 8944246c        mov     dword ptr [rsp+6Ch],eax
fffff802`38d9c57b 488d44246c      lea     rax,[rsp+6Ch]
fffff802`38d9c580 89742430        mov     dword ptr [rsp+30h],esi
fffff802`38d9c584 4889442428      mov     qword ptr [rsp+28h],rax
fffff802`38d9c589 89742420        mov     dword ptr [rsp+20h],esi
fffff802`38d9c58d e8ceb0ffff      call    nt!_CmSetDeviceRegProp (fffff802`38d97660)

nt!PipCallDriverAddDevice+0xd16:
fffff802`38d9c592 fec3            inc     bl
fffff802`38d9c594 80fb06          cmp     bl,6
fffff802`38d9c597 0f82b4feffff    jb      nt!PipCallDriverAddDevice+0xbd5 (fffff802`38d9c451)  Branch ; }

nt!PipCallDriverAddDevice+0xd21:
fffff802`38d9c59d 4d85f6          test    r14,r14
fffff802`38d9c5a0 7437            je      nt!PipCallDriverAddDevice+0xd5d (fffff802`38d9c5d9)  Branch

nt!PipCallDriverAddDevice+0xd26:
fffff802`38d9c5a2 4584ed          test    r13b,r13b
fffff802`38d9c5a5 7532            jne     nt!PipCallDriverAddDevice+0xd5d (fffff802`38d9c5d9)  Branch

nt!PipCallDriverAddDevice+0xd2b:
fffff802`38d9c5a7 4533c9          xor     r9d,r9d
fffff802`38d9c5aa eb33            jmp     nt!PipCallDriverAddDevice+0xd63 (fffff802`38d9c5df)  Branch

nt!PipCallDriverAddDevice+0xd30:
fffff802`38d9c5ac 4c8b65a0        mov     r12,qword ptr [rbp-60h]
fffff802`38d9c5b0 4533c9          xor     r9d,r9d
fffff802`38d9c5b3 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff802`38d9c5b7 4d8bc6          mov     r8,r14
fffff802`38d9c5ba 498b542418      mov     rdx,qword ptr [r12+18h]
fffff802`38d9c5bf e80c74a7ff      call    nt!IovUtilMarkStack (fffff802`388139d0)
fffff802`38d9c5c4 458bcb          mov     r9d,r11d
fffff802`38d9c5c7 44899f88010000  mov     dword ptr [rdi+188h],r11d
fffff802`38d9c5ce 41b81f000000    mov     r8d,1Fh
fffff802`38d9c5d4 e9fff3ffff      jmp     nt!PipCallDriverAddDevice+0x15c (fffff802`38d9b9d8)  Branch

nt!PipCallDriverAddDevice+0xd5d:
fffff802`38d9c5d9 41b901000000    mov     r9d,1

nt!PipCallDriverAddDevice+0xd63:
fffff802`38d9c5df 4c8b65a0        mov     r12,qword ptr [rbp-60h]
fffff802`38d9c5e3 4d8bc6          mov     r8,r14
fffff802`38d9c5e6 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff802`38d9c5ea 498b542418      mov     rdx,qword ptr [r12+18h]
fffff802`38d9c5ef e8dc73a7ff      call    nt!IovUtilMarkStack (fffff802`388139d0)
fffff802`38d9c5f4 4c8b4d90        mov     r9,qword ptr [rbp-70h]
fffff802`38d9c5f8 4c8d4520        lea     r8,[rbp+20h]
fffff802`38d9c5fc 488b542470      mov     rdx,qword ptr [rsp+70h]
fffff802`38d9c601 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff802`38d9c605 44886c2420      mov     byte ptr [rsp+20h],r13b
fffff802`38d9c60a e8a98b0000      call    nt!PipChangeDeviceObjectFromRegistryProperties (fffff802`38da51b8)
fffff802`38d9c60f 85c0            test    eax,eax
fffff802`38d9c611 790e            jns     nt!PipCallDriverAddDevice+0xda5 (fffff802`38d9c621)  Branch

nt!PipCallDriverAddDevice+0xd97:
fffff802`38d9c613 448bc8          mov     r9d,eax
fffff802`38d9c616 41b832000000    mov     r8d,32h
fffff802`38d9c61c e9b7f3ffff      jmp     nt!PipCallDriverAddDevice+0x15c (fffff802`38d9b9d8)  Branch

nt!PipCallDriverAddDevice+0xda5:
fffff802`38d9c621 488b4f20        mov     rcx,qword ptr [rdi+20h]
fffff802`38d9c625 4c8d8fc4010000  lea     r9,[rdi+1C4h]
fffff802`38d9c62c 4c8d87c0010000  lea     r8,[rdi+1C0h]
fffff802`38d9c633 e8b0610100      call    nt!IopQueryLegacyBusInformation (fffff802`38db27e8)
fffff802`38d9c638 85c0            test    eax,eax
fffff802`38d9c63a 7817            js      nt!PipCallDriverAddDevice+0xdd7 (fffff802`38d9c653)  Branch

nt!PipCallDriverAddDevice+0xdc0:
fffff802`38d9c63c 448b87c4010000  mov     r8d,dword ptr [rdi+1C4h]
fffff802`38d9c643 488bcf          mov     rcx,rdi
fffff802`38d9c646 8b97c0010000    mov     edx,dword ptr [rdi+1C0h]
fffff802`38d9c64c e85fd20600      call    nt!IopInsertLegacyBusDeviceNode (fffff802`38e098b0)
fffff802`38d9c651 eb11            jmp     nt!PipCallDriverAddDevice+0xde8 (fffff802`38d9c664)  Branch

nt!PipCallDriverAddDevice+0xdd7:
fffff802`38d9c653 838fc0010000ff  or      dword ptr [rdi+1C0h],0FFFFFFFFh
fffff802`38d9c65a c787c4010000f0ffffff mov dword ptr [rdi+1C4h],0FFFFFFF0h

nt!PipCallDriverAddDevice+0xde8:
fffff802`38d9c664 488b5730        mov     rdx,qword ptr [rdi+30h]
fffff802`38d9c668 41b817000000    mov     r8d,17h
fffff802`38d9c66e e82de0ffff      call    nt!_PnpRaiseNtPlugPlayDevicePropertyChangeEvent (fffff802`38d9a6a0)
fffff802`38d9c673 f7873002000000001000 test dword ptr [rdi+230h],100000h
fffff802`38d9c67d 7412            je      nt!PipCallDriverAddDevice+0xe15 (fffff802`38d9c691)  Branch

nt!PipCallDriverAddDevice+0xe03:
fffff802`38d9c67f 488bcf          mov     rcx,rdi
fffff802`38d9c682 e88dae1500      call    nt!PiProcessDriversLoadedOnSecureDevice (fffff802`38ef7514)
fffff802`38d9c687 8bd8            mov     ebx,eax
fffff802`38d9c689 85c0            test    eax,eax
fffff802`38d9c68b 0f889ff6ffff    js      nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch

nt!PipCallDriverAddDevice+0xe15:
fffff802`38d9c691 488bcf          mov     rcx,rdi
fffff802`38d9c694 e86f6f0100      call    nt!PiDmaGuardAddDevice (fffff802`38db3608)
fffff802`38d9c699 8bd8            mov     ebx,eax
fffff802`38d9c69b e990f6ffff      jmp     nt!PipCallDriverAddDevice+0x4b4 (fffff802`38d9bd30)  Branch
