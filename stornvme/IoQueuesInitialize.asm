1: kd> uf stornvme!IoQueuesInitialize
stornvme!IoQueuesInitialize:
fffff801`d2c4c904 4055            push    rbp
fffff801`d2c4c906 53              push    rbx
fffff801`d2c4c907 56              push    rsi
fffff801`d2c4c908 57              push    rdi
fffff801`d2c4c909 4154            push    r12
fffff801`d2c4c90b 4155            push    r13
fffff801`d2c4c90d 4156            push    r14
fffff801`d2c4c90f 4157            push    r15
fffff801`d2c4c911 488bec          mov     rbp,rsp
fffff801`d2c4c914 4883ec68        sub     rsp,68h
fffff801`d2c4c918 4533e4          xor     r12d,r12d
fffff801`d2c4c91b 488bd9          mov     rbx,rcx
fffff801`d2c4c91e 4c8965d8        mov     qword ptr [rbp-28h],r12
fffff801`d2c4c922 4c896560        mov     qword ptr [rbp+60h],r12
fffff801`d2c4c926 4c896558        mov     qword ptr [rbp+58h],r12
fffff801`d2c4c92a 418d442401      lea     eax,[r12+1]
fffff801`d2c4c92f 448be8          mov     r13d,eax
fffff801`d2c4c932 0fb78112010000  movzx   eax,word ptr [rcx+112h]       ;0x0004
fffff801`d2c4c939 6685c0          test    ax,ax
fffff801`d2c4c93c 0f84a3040000    je      stornvme!IoQueuesInitialize+0x4e1 (fffff801`d2c4cde5)  Branch

stornvme!IoQueuesInitialize+0x3e:
fffff801`d2c4c942 440fb78910010000 movzx   r9d,word ptr [rcx+110h]      ;0x0004
fffff801`d2c4c94a 664585c9        test    r9w,r9w
fffff801`d2c4c94e 0f8491040000    je      stornvme!IoQueuesInitialize+0x4e1 (fffff801`d2c4cde5)  Branch

stornvme!IoQueuesInitialize+0x50:
fffff801`d2c4c954 440fb7810e010000 movzx   r8d,word ptr [rcx+10Eh]      ;0x0400 => QueueEntry count?
fffff801`d2c4c95c 488db100030000  lea     rsi,[rcx+300h]
fffff801`d2c4c963 458bf8          mov     r15d,r8d
fffff801`d2c4c966 458bf0          mov     r14d,r8d
fffff801`d2c4c969 41c1e606        shl     r14d,6                        ;calculate SubQ length?
fffff801`d2c4c96d 41c1e704        shl     r15d,4                        ;calculate CplQ length?
fffff801`d2c4c971 44897550        mov     dword ptr [rbp+50h],r14d      ;0x10000 => SubQ length?
fffff801`d2c4c975 44386110        cmp     byte ptr [rcx+10h],r12b
fffff801`d2c4c979 0f8575010000    jne     stornvme!IoQueuesInitialize+0x1f0 (fffff801`d2c4caf4)  Branch

stornvme!IoQueuesInitialize+0x7b:
fffff801`d2c4c97f 0fb7c0          movzx   eax,ax
fffff801`d2c4c982 488bd1          mov     rdx,rcx
fffff801`d2c4c985 4469c058010000  imul    r8d,eax,158h                  ;似乎是 CplQueue Info array, 4個Queue??  0x560
fffff801`d2c4c98c 41bd4e766d65    mov     r13d,656D764Eh
fffff801`d2c4c992 458bcd          mov     r9d,r13d                      ; tag 'Nvme'
fffff801`d2c4c995 4889742420      mov     qword ptr [rsp+20h],rsi
fffff801`d2c4c99a 33c9            xor     ecx,ecx                       ;ExtFunctionAllocatePool
fffff801`d2c4c99c 48ff1585360100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4c9a3 0f1f440000      nop     dword ptr [rax+rax]
fffff801`d2c4c9a8 0fb78310010000  movzx   eax,word ptr [rbx+110h]
fffff801`d2c4c9af 488dbbf8020000  lea     rdi,[rbx+2F8h]                ;似乎是 SubQueue Info Array, 4個Queue?
fffff801`d2c4c9b6 4469c088000000  imul    r8d,eax,88h                   ;0x220
fffff801`d2c4c9bd 458bcd          mov     r9d,r13d                      ; tag 'Nvme'
fffff801`d2c4c9c0 488bd3          mov     rdx,rbx
fffff801`d2c4c9c3 48897c2420      mov     qword ptr [rsp+20h],rdi
fffff801`d2c4c9c8 33c9            xor     ecx,ecx               ;ExtFunctionAllocatePool
fffff801`d2c4c9ca 48ff1557360100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4c9d1 0f1f440000      nop     dword ptr [rax+rax]
fffff801`d2c4c9d6 4c3926          cmp     qword ptr [rsi],r12   ;if QueueInfo allocate is NULL, goto 0x3af
fffff801`d2c4c9d9 0f84d4020000    je      stornvme!IoQueuesInitialize+0x3af (fffff801`d2c4ccb3)  Branch

stornvme!IoQueuesInitialize+0xdb:
fffff801`d2c4c9df 4c3927          cmp     qword ptr [rdi],r12   ;if QueueInfo allocate is NULL, goto 0x3af
fffff801`d2c4c9e2 0f84cb020000    je      stornvme!IoQueuesInitialize+0x3af (fffff801`d2c4ccb3)  Branch

stornvme!IoQueuesInitialize+0xe4:
fffff801`d2c4c9e8 0fb7830e010000  movzx   eax,word ptr [rbx+10Eh]
fffff801`d2c4c9ef 458bcd          mov     r9d,r13d                  ; tag 'Nvme'
fffff801`d2c4c9f2 440fb78310010000 movzx   r8d,word ptr [rbx+110h]
fffff801`d2c4c9fa 488bd3          mov     rdx,rbx
fffff801`d2c4c9fd 440fafc0        imul    r8d,eax                   ;QueueEntry * QueueCount =>r8d=0x1000
fffff801`d2c4ca01 33c9            xor     ecx,ecx                       ;ExtFunctionAllocatePool
fffff801`d2c4ca03 488d45d8        lea     rax,[rbp-28h]
fffff801`d2c4ca07 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`d2c4ca0c 41c1e004        shl     r8d,4                     ;total length of CplQ => r8d*16 = 0x10000
fffff801`d2c4ca10 48ff1511360100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4ca17 0f1f440000      nop     dword ptr [rax+rax]               ;**=>將四個 CplQ Allocate一塊大塊記憶體去擺**
fffff801`d2c4ca1c 4c3965d8        cmp     qword ptr [rbp-28h],r12           ;if allocate is NULL, goto 0x3af
fffff801`d2c4ca20 0f848d020000    je      stornvme!IoQueuesInitialize+0x3af (fffff801`d2c4ccb3)  Branch

stornvme!IoQueuesInitialize+0x122:
fffff801`d2c4ca26 0fb7830e010000  movzx   eax,word ptr [rbx+10Eh]
fffff801`d2c4ca2d 458bcd          mov     r9d,r13d                      ; tag 'Nvme'
fffff801`d2c4ca30 440fb78310010000 movzx   r8d,word ptr [rbx+110h]
fffff801`d2c4ca38 488bd3          mov     rdx,rbx                       ;pAE
fffff801`d2c4ca3b 440fafc0        imul    r8d,eax                       ;0x04 * 0x0400 => 0x1000
fffff801`d2c4ca3f 33c9            xor     ecx,ecx                       ;ExtFunctionAllocatePool
fffff801`d2c4ca41 488d4560        lea     rax,[rbp+60h]
fffff801`d2c4ca45 4889442420      mov     qword ptr [rsp+20h],rax       ;arg5 => out ptr
fffff801`d2c4ca4a 41c1e004        shl     r8d,4                         ;0x1000*0x10 ==> 0x10000
fffff801`d2c4ca4e 48ff15d3350100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4ca55 0f1f440000      nop     dword ptr [rax+rax]
fffff801`d2c4ca5a 4c396560        cmp     qword ptr [rbp+60h],r12       ;if allocate is NULL, goto 0x3af
fffff801`d2c4ca5e 0f844f020000    je      stornvme!IoQueuesInitialize+0x3af (fffff801`d2c4ccb3)  Branch

stornvme!IoQueuesInitialize+0x160:
fffff801`d2c4ca64 0fb78310010000  movzx   eax,word ptr [rbx+110h]
fffff801`d2c4ca6b 418d4c2401      lea     ecx,[r12+1]                   ;r12 == 0, ecx == 1
fffff801`d2c4ca70 440fb78312010000 movzx   r8d,word ptr [rbx+112h]
fffff801`d2c4ca78 2bc1            sub     eax,ecx                       ;rax 剩下3....??
fffff801`d2c4ca7a 99              cdq                                   ;rdx 剩下0 ??
fffff801`d2c4ca7b 41b94e766d65    mov     r9d,656D764Eh                 ; tag 'Nvme'
fffff801`d2c4ca81 41f7f8          idiv    eax,r8d                       ;ax=3, r8d=4, idiv => rax==0  rdx==0
fffff801`d2c4ca84 488bd3          mov     rdx,rbx
fffff801`d2c4ca87 448d2c01        lea     r13d,[rcx+rax]                ;r13d == 1
fffff801`d2c4ca8b 33c9            xor     ecx,ecx                       ;ExtFunctionAllocatePool
fffff801`d2c4ca8d 450fafc5        imul    r8d,r13d                      ;r8d==4, r13d==1, imul==>r8d==4
fffff801`d2c4ca91 488d4558        lea     rax,[rbp+58h]
fffff801`d2c4ca95 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`d2c4ca9a 41c1e003        shl     r8d,3                         ;r8d = 0x04*0x08
fffff801`d2c4ca9e 48ff1583350100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4caa5 0f1f440000      nop     dword ptr [rax+rax]
fffff801`d2c4caaa 4c396558        cmp     qword ptr [rbp+58h],r12
fffff801`d2c4caae 0f84ff010000    je      stornvme!IoQueuesInitialize+0x3af (fffff801`d2c4ccb3)  Branch

stornvme!IoQueuesInitialize+0x1b0:
fffff801`d2c4cab4 0fb78312010000  movzx   eax,word ptr [rbx+112h]
fffff801`d2c4cabb 488b0e          mov     rcx,qword ptr [rsi]
fffff801`d2c4cabe 69d058010000    imul    edx,eax,158h
fffff801`d2c4cac4 e86785ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4cac9 0fb78310010000  movzx   eax,word ptr [rbx+110h]
fffff801`d2c4cad0 488b0f          mov     rcx,qword ptr [rdi]
fffff801`d2c4cad3 69d088000000    imul    edx,eax,88h
fffff801`d2c4cad9 e85285ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4cade 440fb78b10010000 movzx   r9d,word ptr [rbx+110h]
fffff801`d2c4cae6 440fb7830e010000 movzx   r8d,word ptr [rbx+10Eh]
fffff801`d2c4caee 488b4dd8        mov     rcx,qword ptr [rbp-28h]
fffff801`d2c4caf2 eb2e            jmp     stornvme!IoQueuesInitialize+0x21e (fffff801`d2c4cb22)  Branch

stornvme!IoQueuesInitialize+0x1f0:
fffff801`d2c4caf4 488b06          mov     rax,qword ptr [rsi]
fffff801`d2c4caf7 498bd0          mov     rdx,r8
fffff801`d2c4cafa 418bcf          mov     ecx,r15d
fffff801`d2c4cafd 488b00          mov     rax,qword ptr [rax]
fffff801`d2c4cb00 4803c8          add     rcx,rax
fffff801`d2c4cb03 410fb7c1        movzx   eax,r9w
fffff801`d2c4cb07 480fafd0        imul    rdx,rax
fffff801`d2c4cb0b 48894dd8        mov     qword ptr [rbp-28h],rcx
fffff801`d2c4cb0f 48c1e204        shl     rdx,4
fffff801`d2c4cb13 488d040a        lea     rax,[rdx+rcx]
fffff801`d2c4cb17 48894560        mov     qword ptr [rbp+60h],rax
fffff801`d2c4cb1b 4803c2          add     rax,rdx
fffff801`d2c4cb1e 48894558        mov     qword ptr [rbp+58h],rax

stornvme!IoQueuesInitialize+0x21e:
fffff801`d2c4cb22 410fb7d0        movzx   edx,r8w
fffff801`d2c4cb26 410fb7c1        movzx   eax,r9w
fffff801`d2c4cb2a 0fafd0          imul    edx,eax
fffff801`d2c4cb2d c1e204          shl     edx,4
fffff801`d2c4cb30 e8fb84ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4cb35 0fb79310010000  movzx   edx,word ptr [rbx+110h]
fffff801`d2c4cb3c 0fb7830e010000  movzx   eax,word ptr [rbx+10Eh]
fffff801`d2c4cb43 488b4d60        mov     rcx,qword ptr [rbp+60h]
fffff801`d2c4cb47 0fafd0          imul    edx,eax
fffff801`d2c4cb4a c1e204          shl     edx,4
fffff801`d2c4cb4d e8de84ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4cb52 0fb79312010000  movzx   edx,word ptr [rbx+112h]
fffff801`d2c4cb59 488b4d58        mov     rcx,qword ptr [rbp+58h]
fffff801`d2c4cb5d 410fafd5        imul    edx,r13d
fffff801`d2c4cb61 c1e203          shl     edx,3
fffff801`d2c4cb64 e8c784ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4cb69 33d2            xor     edx,edx
fffff801`d2c4cb6b 44896548        mov     dword ptr [rbp+48h],r12d
fffff801`d2c4cb6f 663b9310010000  cmp     dx,word ptr [rbx+110h]
fffff801`d2c4cb76 0f83c6000000    jae     stornvme!IoQueuesInitialize+0x33e (fffff801`d2c4cc42)  Branch

stornvme!IoQueuesInitialize+0x278:
fffff801`d2c4cb7c 488b8bf8020000  mov     rcx,qword ptr [rbx+2F8h]
fffff801`d2c4cb83 33c0            xor     eax,eax
fffff801`d2c4cb85 458be4          mov     r12d,r12d
fffff801`d2c4cb88 4969fc88000000  imul    rdi,r12,88h
fffff801`d2c4cb8f 488955e0        mov     qword ptr [rbp-20h],rdx
fffff801`d2c4cb93 4803f9          add     rdi,rcx
fffff801`d2c4cb96 488945e8        mov     qword ptr [rbp-18h],rax
fffff801`d2c4cb9a 385310          cmp     byte ptr [rbx+10h],dl
fffff801`d2c4cb9d 752a            jne     stornvme!IoQueuesInitialize+0x2c5 (fffff801`d2c4cbc9)  Branch

stornvme!IoQueuesInitialize+0x29b:
fffff801`d2c4cb9f 4c8d4de8        lea     r9,[rbp-18h]
fffff801`d2c4cba3 418bd6          mov     edx,r14d
fffff801`d2c4cba6 4c8d45e0        lea     r8,[rbp-20h]
fffff801`d2c4cbaa 488bcb          mov     rcx,rbx
fffff801`d2c4cbad e85a86ffff      call    stornvme!NVMeAllocateDmaBuffer (fffff801`d2c4520c)
fffff801`d2c4cbb2 85c0            test    eax,eax
fffff801`d2c4cbb4 0f85f6000000    jne     stornvme!IoQueuesInitialize+0x3ac (fffff801`d2c4ccb0)  Branch

stornvme!IoQueuesInitialize+0x2b6:
fffff801`d2c4cbba 488b4de0        mov     rcx,qword ptr [rbp-20h]
fffff801`d2c4cbbe 4885c9          test    rcx,rcx
fffff801`d2c4cbc1 0f84e9000000    je      stornvme!IoQueuesInitialize+0x3ac (fffff801`d2c4ccb0)  Branch

stornvme!IoQueuesInitialize+0x2c3:
fffff801`d2c4cbc7 eb07            jmp     stornvme!IoQueuesInitialize+0x2cc (fffff801`d2c4cbd0)  Branch

stornvme!IoQueuesInitialize+0x2c5:
fffff801`d2c4cbc9 488b09          mov     rcx,qword ptr [rcx]
fffff801`d2c4cbcc 48894de0        mov     qword ptr [rbp-20h],rcx

stornvme!IoQueuesInitialize+0x2cc:
fffff801`d2c4cbd0 418bd6          mov     edx,r14d
fffff801`d2c4cbd3 e85884ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4cbd8 0fb78b0e010000  movzx   ecx,word ptr [rbx+10Eh]
fffff801`d2c4cbdf 41b801000000    mov     r8d,1
fffff801`d2c4cbe5 4c8b4d60        mov     r9,qword ptr [rbp+60h]
fffff801`d2c4cbe9 488bd7          mov     rdx,rdi
fffff801`d2c4cbec 488b45e8        mov     rax,qword ptr [rbp-18h]
fffff801`d2c4cbf0 490fafcc        imul    rcx,r12
fffff801`d2c4cbf4 448b6548        mov     r12d,dword ptr [rbp+48h]
fffff801`d2c4cbf8 4503c4          add     r8d,r12d
fffff801`d2c4cbfb 48c1e104        shl     rcx,4
fffff801`d2c4cbff 4c03c9          add     r9,rcx
fffff801`d2c4cc02 48034dd8        add     rcx,qword ptr [rbp-28h]
fffff801`d2c4cc06 4c894c2430      mov     qword ptr [rsp+30h],r9
fffff801`d2c4cc0b 4c8b4de0        mov     r9,qword ptr [rbp-20h]
fffff801`d2c4cc0f 48894c2428      mov     qword ptr [rsp+28h],rcx
fffff801`d2c4cc14 488bcb          mov     rcx,rbx
fffff801`d2c4cc17 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`d2c4cc1c e8ef2d0000      call    stornvme!NVMeSubmissionQueueInit (fffff801`d2c4fa10)
fffff801`d2c4cc21 0fb78310010000  movzx   eax,word ptr [rbx+110h]
fffff801`d2c4cc28 b901000000      mov     ecx,1
fffff801`d2c4cc2d 4403e1          add     r12d,ecx
fffff801`d2c4cc30 44896548        mov     dword ptr [rbp+48h],r12d
fffff801`d2c4cc34 8d51ff          lea     edx,[rcx-1]
fffff801`d2c4cc37 443be0          cmp     r12d,eax
fffff801`d2c4cc3a 0f823cffffff    jb      stornvme!IoQueuesInitialize+0x278 (fffff801`d2c4cb7c)  Branch

stornvme!IoQueuesInitialize+0x33c:
fffff801`d2c4cc40 eb05            jmp     stornvme!IoQueuesInitialize+0x343 (fffff801`d2c4cc47)  Branch

stornvme!IoQueuesInitialize+0x33e:
fffff801`d2c4cc42 b901000000      mov     ecx,1

stornvme!IoQueuesInitialize+0x343:
fffff801`d2c4cc47 8bfa            mov     edi,edx
fffff801`d2c4cc49 663b9312010000  cmp     dx,word ptr [rbx+112h]
fffff801`d2c4cc50 0f83ff010000    jae     stornvme!IoQueuesInitialize+0x551 (fffff801`d2c4ce55)  Branch

stornvme!IoQueuesInitialize+0x352:
fffff801`d2c4cc56 0fb78310010000  movzx   eax,word ptr [rbx+110h]
fffff801`d2c4cc5d 3bf8            cmp     edi,eax
fffff801`d2c4cc5f 0f83f0010000    jae     stornvme!IoQueuesInitialize+0x551 (fffff801`d2c4ce55)  Branch

stornvme!IoQueuesInitialize+0x361:
fffff801`d2c4cc65 488b0e          mov     rcx,qword ptr [rsi]
fffff801`d2c4cc68 33c0            xor     eax,eax
fffff801`d2c4cc6a 448be7          mov     r12d,edi
fffff801`d2c4cc6d 4d69f458010000  imul    r14,r12,158h
fffff801`d2c4cc74 48895548        mov     qword ptr [rbp+48h],rdx
fffff801`d2c4cc78 4c03f1          add     r14,rcx
fffff801`d2c4cc7b 488945e8        mov     qword ptr [rbp-18h],rax
fffff801`d2c4cc7f 385310          cmp     byte ptr [rbx+10h],dl
fffff801`d2c4cc82 0f8570010000    jne     stornvme!IoQueuesInitialize+0x4f4 (fffff801`d2c4cdf8)  Branch

stornvme!IoQueuesInitialize+0x384:
fffff801`d2c4cc88 4c8d4de8        lea     r9,[rbp-18h]
fffff801`d2c4cc8c 418bd7          mov     edx,r15d
fffff801`d2c4cc8f 4c8d4548        lea     r8,[rbp+48h]
fffff801`d2c4cc93 488bcb          mov     rcx,rbx
fffff801`d2c4cc96 e87185ffff      call    stornvme!NVMeAllocateDmaBuffer (fffff801`d2c4520c)
fffff801`d2c4cc9b 85c0            test    eax,eax
fffff801`d2c4cc9d 750d            jne     stornvme!IoQueuesInitialize+0x3a8 (fffff801`d2c4ccac)  Branch

stornvme!IoQueuesInitialize+0x39b:
fffff801`d2c4cc9f 488b4d48        mov     rcx,qword ptr [rbp+48h]
fffff801`d2c4cca3 4885c9          test    rcx,rcx
fffff801`d2c4cca6 0f8553010000    jne     stornvme!IoQueuesInitialize+0x4fb (fffff801`d2c4cdff)  Branch

stornvme!IoQueuesInitialize+0x3a8:
fffff801`d2c4ccac 448b7550        mov     r14d,dword ptr [rbp+50h]

stornvme!IoQueuesInitialize+0x3ac:
fffff801`d2c4ccb0 4533e4          xor     r12d,r12d

stornvme!IoQueuesInitialize+0x3af:
fffff801`d2c4ccb3 44386310        cmp     byte ptr [rbx+10h],r12b
fffff801`d2c4ccb7 0f8521010000    jne     stornvme!IoQueuesInitialize+0x4da (fffff801`d2c4cdde)  Branch

stornvme!IoQueuesInitialize+0x3b9:
fffff801`d2c4ccbd 41bd01000000    mov     r13d,1
fffff801`d2c4ccc3 4c39a3f8020000  cmp     qword ptr [rbx+2F8h],r12
fffff801`d2c4ccca 7444            je      stornvme!IoQueuesInitialize+0x40c (fffff801`d2c4cd10)  Branch

stornvme!IoQueuesInitialize+0x3c8:
fffff801`d2c4cccc 418bfc          mov     edi,r12d
fffff801`d2c4cccf 66443ba310010000 cmp     r12w,word ptr [rbx+110h]
fffff801`d2c4ccd7 7337            jae     stornvme!IoQueuesInitialize+0x40c (fffff801`d2c4cd10)  Branch

stornvme!IoQueuesInitialize+0x3d5:
fffff801`d2c4ccd9 8bc7            mov     eax,edi
fffff801`d2c4ccdb 4c69c888000000  imul    r9,rax,88h
fffff801`d2c4cce2 488b83f8020000  mov     rax,qword ptr [rbx+2F8h]
fffff801`d2c4cce9 4d8b0401        mov     r8,qword ptr [r9+rax]
fffff801`d2c4cced 4d85c0          test    r8,r8
fffff801`d2c4ccf0 7410            je      stornvme!IoQueuesInitialize+0x3fe (fffff801`d2c4cd02)  Branch

stornvme!IoQueuesInitialize+0x3ee:
fffff801`d2c4ccf2 4d8b4c0108      mov     r9,qword ptr [r9+rax+8]
fffff801`d2c4ccf7 488bcb          mov     rcx,rbx
fffff801`d2c4ccfa 418bd6          mov     edx,r14d
fffff801`d2c4ccfd e89283ffff      call    stornvme!NVMeFreeDmaBuffer (fffff801`d2c45094)

stornvme!IoQueuesInitialize+0x3fe:
fffff801`d2c4cd02 0fb78310010000  movzx   eax,word ptr [rbx+110h]
fffff801`d2c4cd09 4103fd          add     edi,r13d
fffff801`d2c4cd0c 3bf8            cmp     edi,eax
fffff801`d2c4cd0e 72c9            jb      stornvme!IoQueuesInitialize+0x3d5 (fffff801`d2c4ccd9)  Branch

stornvme!IoQueuesInitialize+0x40c:
fffff801`d2c4cd10 4c3926          cmp     qword ptr [rsi],r12
fffff801`d2c4cd13 7440            je      stornvme!IoQueuesInitialize+0x451 (fffff801`d2c4cd55)  Branch

stornvme!IoQueuesInitialize+0x411:
fffff801`d2c4cd15 418bfc          mov     edi,r12d
fffff801`d2c4cd18 66443ba312010000 cmp     r12w,word ptr [rbx+112h]
fffff801`d2c4cd20 7333            jae     stornvme!IoQueuesInitialize+0x451 (fffff801`d2c4cd55)  Branch

stornvme!IoQueuesInitialize+0x41e:
fffff801`d2c4cd22 8bc7            mov     eax,edi
fffff801`d2c4cd24 4c69c858010000  imul    r9,rax,158h
fffff801`d2c4cd2b 488b06          mov     rax,qword ptr [rsi]
fffff801`d2c4cd2e 4d8b0401        mov     r8,qword ptr [r9+rax]
fffff801`d2c4cd32 4d85c0          test    r8,r8
fffff801`d2c4cd35 7410            je      stornvme!IoQueuesInitialize+0x443 (fffff801`d2c4cd47)  Branch

stornvme!IoQueuesInitialize+0x433:
fffff801`d2c4cd37 4d8b4c0108      mov     r9,qword ptr [r9+rax+8]
fffff801`d2c4cd3c 488bcb          mov     rcx,rbx
fffff801`d2c4cd3f 418bd7          mov     edx,r15d
fffff801`d2c4cd42 e84d83ffff      call    stornvme!NVMeFreeDmaBuffer (fffff801`d2c45094)

stornvme!IoQueuesInitialize+0x443:
fffff801`d2c4cd47 0fb78312010000  movzx   eax,word ptr [rbx+112h]
fffff801`d2c4cd4e 4103fd          add     edi,r13d
fffff801`d2c4cd51 3bf8            cmp     edi,eax
fffff801`d2c4cd53 72cd            jb      stornvme!IoQueuesInitialize+0x41e (fffff801`d2c4cd22)  Branch

stornvme!IoQueuesInitialize+0x451:
fffff801`d2c4cd55 4c8b4558        mov     r8,qword ptr [rbp+58h]
fffff801`d2c4cd59 4d85c0          test    r8,r8
fffff801`d2c4cd5c 7412            je      stornvme!IoQueuesInitialize+0x46c (fffff801`d2c4cd70)  Branch

stornvme!IoQueuesInitialize+0x45a:
fffff801`d2c4cd5e 488bd3          mov     rdx,rbx
fffff801`d2c4cd61 418bcd          mov     ecx,r13d
fffff801`d2c4cd64 48ff15bd320100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4cd6b 0f1f440000      nop     dword ptr [rax+rax]

stornvme!IoQueuesInitialize+0x46c:
fffff801`d2c4cd70 4c8b4560        mov     r8,qword ptr [rbp+60h]
fffff801`d2c4cd74 4d85c0          test    r8,r8
fffff801`d2c4cd77 7412            je      stornvme!IoQueuesInitialize+0x487 (fffff801`d2c4cd8b)  Branch

stornvme!IoQueuesInitialize+0x475:
fffff801`d2c4cd79 488bd3          mov     rdx,rbx
fffff801`d2c4cd7c 418bcd          mov     ecx,r13d
fffff801`d2c4cd7f 48ff15a2320100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4cd86 0f1f440000      nop     dword ptr [rax+rax]

stornvme!IoQueuesInitialize+0x487:
fffff801`d2c4cd8b 4c8b45d8        mov     r8,qword ptr [rbp-28h]
fffff801`d2c4cd8f 4d85c0          test    r8,r8
fffff801`d2c4cd92 7412            je      stornvme!IoQueuesInitialize+0x4a2 (fffff801`d2c4cda6)  Branch

stornvme!IoQueuesInitialize+0x490:
fffff801`d2c4cd94 488bd3          mov     rdx,rbx
fffff801`d2c4cd97 418bcd          mov     ecx,r13d
fffff801`d2c4cd9a 48ff1587320100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4cda1 0f1f440000      nop     dword ptr [rax+rax]

stornvme!IoQueuesInitialize+0x4a2:
fffff801`d2c4cda6 4c8b06          mov     r8,qword ptr [rsi]
fffff801`d2c4cda9 4d85c0          test    r8,r8
fffff801`d2c4cdac 7412            je      stornvme!IoQueuesInitialize+0x4bc (fffff801`d2c4cdc0)  Branch

stornvme!IoQueuesInitialize+0x4aa:
fffff801`d2c4cdae 488bd3          mov     rdx,rbx
fffff801`d2c4cdb1 418bcd          mov     ecx,r13d
fffff801`d2c4cdb4 48ff156d320100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4cdbb 0f1f440000      nop     dword ptr [rax+rax]

stornvme!IoQueuesInitialize+0x4bc:
fffff801`d2c4cdc0 4c8b83f8020000  mov     r8,qword ptr [rbx+2F8h]
fffff801`d2c4cdc7 4d85c0          test    r8,r8
fffff801`d2c4cdca 7412            je      stornvme!IoQueuesInitialize+0x4da (fffff801`d2c4cdde)  Branch

stornvme!IoQueuesInitialize+0x4c8:
fffff801`d2c4cdcc 488bd3          mov     rdx,rbx
fffff801`d2c4cdcf 418bcd          mov     ecx,r13d
fffff801`d2c4cdd2 48ff154f320100  call    qword ptr [stornvme!_imp_StorPortExtendedFunction (fffff801`d2c60028)]
fffff801`d2c4cdd9 0f1f440000      nop     dword ptr [rax+rax]

stornvme!IoQueuesInitialize+0x4da:
fffff801`d2c4cdde 83a31001000000  and     dword ptr [rbx+110h],0

stornvme!IoQueuesInitialize+0x4e1:
fffff801`d2c4cde5 32c0            xor     al,al

stornvme!IoQueuesInitialize+0x4e3:
fffff801`d2c4cde7 4883c468        add     rsp,68h
fffff801`d2c4cdeb 415f            pop     r15
fffff801`d2c4cded 415e            pop     r14
fffff801`d2c4cdef 415d            pop     r13
fffff801`d2c4cdf1 415c            pop     r12
fffff801`d2c4cdf3 5f              pop     rdi
fffff801`d2c4cdf4 5e              pop     rsi
fffff801`d2c4cdf5 5b              pop     rbx
fffff801`d2c4cdf6 5d              pop     rbp
fffff801`d2c4cdf7 c3              ret

stornvme!IoQueuesInitialize+0x4f4:
fffff801`d2c4cdf8 488b09          mov     rcx,qword ptr [rcx]
fffff801`d2c4cdfb 48894d48        mov     qword ptr [rbp+48h],rcx

stornvme!IoQueuesInitialize+0x4fb:
fffff801`d2c4cdff 418bd7          mov     edx,r15d
fffff801`d2c4ce02 e82982ffff      call    stornvme!NVMeZeroMemory (fffff801`d2c45030)
fffff801`d2c4ce07 488b4558        mov     rax,qword ptr [rbp+58h]
fffff801`d2c4ce0b 41b801000000    mov     r8d,1
fffff801`d2c4ce11 418bcd          mov     ecx,r13d
fffff801`d2c4ce14 4403c7          add     r8d,edi
fffff801`d2c4ce17 490fafcc        imul    rcx,r12
fffff801`d2c4ce1b 498bd6          mov     rdx,r14
fffff801`d2c4ce1e 4c8d0cc8        lea     r9,[rax+rcx*8]
fffff801`d2c4ce22 488b45e8        mov     rax,qword ptr [rbp-18h]
fffff801`d2c4ce26 4c894c2428      mov     qword ptr [rsp+28h],r9
fffff801`d2c4ce2b 488bcb          mov     rcx,rbx
fffff801`d2c4ce2e 4c8b4d48        mov     r9,qword ptr [rbp+48h]
fffff801`d2c4ce32 4889442420      mov     qword ptr [rsp+20h],rax
fffff801`d2c4ce37 e8c8040000      call    stornvme!NVMeCompletionQueueInit (fffff801`d2c4d304)
fffff801`d2c4ce3c 0fb78312010000  movzx   eax,word ptr [rbx+112h]
fffff801`d2c4ce43 b901000000      mov     ecx,1
fffff801`d2c4ce48 03f9            add     edi,ecx
fffff801`d2c4ce4a 3bf8            cmp     edi,eax
fffff801`d2c4ce4c 7307            jae     stornvme!IoQueuesInitialize+0x551 (fffff801`d2c4ce55)  Branch

stornvme!IoQueuesInitialize+0x54a:
fffff801`d2c4ce4e 33d2            xor     edx,edx
fffff801`d2c4ce50 e901feffff      jmp     stornvme!IoQueuesInitialize+0x352 (fffff801`d2c4cc56)  Branch

stornvme!IoQueuesInitialize+0x551:
fffff801`d2c4ce55 8ac1            mov     al,cl
fffff801`d2c4ce57 eb8e            jmp     stornvme!IoQueuesInitialize+0x4e3 (fffff801`d2c4cde7)  Branch
