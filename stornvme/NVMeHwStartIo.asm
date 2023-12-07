20: kd> r
rax=0000000000000025 rbx=ffffcf0a4d71a660 rcx=fffff80158b22aef
rdx=0000000000000028 rsi=ffffcf0a435671a0 rdi=ffffcf0a4d613060
rip=fffff80158b22ae9 rsp=ffffe301b72432a0 rbp=0000000000000001
 r8=fffff80158b20000  r9=0000000000000000 r10=ffffcf0a4d71a660
r11=0000000000001001 r12=0000000000000000 r13=0000000000000000
r14=0000000000000000 r15=0000000000000000
iopl=0         nv up ei ng nz na pe nc
cs=0010  ss=0018  ds=002b  es=002b  fs=0053  gs=002b             efl=00000282
stornvme!NVMeHwStartIo+0x39:
fffff801`58b22ae9 ffe1            jmp     rcx {stornvme!NVMeHwStartIo+0x3f (fffff801`58b22aef)}
20: kd> lmvm stornvme
Browse full module list
start             end                 module name
fffff801`58b20000 fffff801`58b44000   stornvme   (pdb symbols)          z:\stornvme.pdb\D10C650C22AECFE8DB7999546A610C1F1\stornvme.pdb
    Loaded symbol image file: stornvme.sys
    Image path: stornvme.sys
    Image name: stornvme.sys
    Browse all global symbols  functions  data
    Image was built with /Brepro flag.
    Timestamp:        2B21E083 (This is a reproducible build file hash, not a timestamp)
    CheckSum:         00024481
    ImageSize:        00024000
    Translations:     0000.04b0 0000.04e4 0409.04b0 0409.04e4



21: kd> uf stornvme!NVMeHwStartIo
Flow analysis was incomplete, some code may be missing
stornvme!NVMeHwStartIo:
fffff801`58b22ab0 4053            push    rbx
fffff801`58b22ab2 57              push    rdi
fffff801`58b22ab3 4883ec28        sub     rsp,28h
fffff801`58b22ab7 488bda          mov     rbx,rdx           ;RDX = STORAGE_REQUEST_BLOCK
fffff801`58b22aba 488bf9          mov     rdi,rcx           ;RCX = AdapterExtension
fffff801`58b22abd 0fb65202        movzx   edx,byte ptr [rdx+2]
fffff801`58b22ac1 80fa28          cmp     dl,28h
fffff801`58b22ac4 7505            jne     stornvme!NVMeHwStartIo+0x1b (fffff801`58b22acb)  Branch

stornvme!NVMeHwStartIo+0x16:
fffff801`58b22ac6 8b4314          mov     eax,dword ptr [rbx+14h]   ;read SrbFunction
fffff801`58b22ac9 eb03            jmp     stornvme!NVMeHwStartIo+0x1e (fffff801`58b22ace)  Branch

stornvme!NVMeHwStartIo+0x1b:
fffff801`58b22acb 0fb6c2          movzx   eax,dl

stornvme!NVMeHwStartIo+0x1e:
fffff801`58b22ace 83f825          cmp     eax,25h       ;if SrbFunction > 0x25  goto 0xdb
fffff801`58b22ad1 0f87b4000000    ja      stornvme!NVMeHwStartIo+0xdb (fffff801`58b22b8b)  Branch

stornvme!NVMeHwStartIo+0x27:                    ;r8 == image base
fffff801`58b22ad7 4c8d0522d5ffff  lea     r8,[stornvme!IoctlQueryProtocolInfoProcess <PERF> (stornvme+0x0) (fffff801`58b20000)]
fffff801`58b22ade 418b8c80c49d0100 mov     ecx,dword ptr [r8+rax*4+19DC4h]          ;code = rax(function code)*4+0x19dc4 + base , PNP FUNCTION = 00002aef
fffff801`58b22ae6 4903c8          add     rcx,r8
fffff801`58b22ae9 ffe1            jmp     rcx
0x25*4+19dc4+fffff802bc920000

stornvme!NVMeHwStartIo+0x3f:                ;BEGIN OF PNP_FUNCTION handler
fffff802`bc922aef 80fa28          cmp     dl,28h        ;if (Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x53
fffff802`bc922af2 750f            jne     stornvme!NVMeHwStartIo+0x53 (fffff802`bc922b03)
fffff802`bc922af4 8b4378          mov     eax,dword ptr [rbx+78h]           ;rbx == pSrb, [rbx+0x78] == [pSrb->SrbExDataOffset] == 0x90
fffff802`bc922af7 4803c3          add     rax,rbx                           ;rax == PSRBEX_DATA
fffff802`bc922afa 8b480c          mov     ecx,dword ptr [rax+0Ch]       ;ecx == PnPAction
fffff802`bc922afd 83781001        cmp     dword ptr [rax+10h],1     ;if SrbPnPFlags != SRB_PNP_FLAGS_ADAPTER_REQUEST, clear AL.
fffff802`bc922b01 eb07            jmp     stornvme!NVMeHwStartIo+0x5a (fffff802`bc922b0a)
fffff802`bc922b03 8b4b08          mov     ecx,dword ptr [rbx+8]

stornvme!NVMeHwStartIo+0x56:
fffff802`bc922b06 837b4001        cmp     dword ptr [rbx+40h],1
fffff802`bc922b0a 0f94c0          sete    al                    ;set AL == 0 if ZF == 1, for PNP_FUNCTION it cleared AL. => from fffff802`bc922afd
fffff802`bc922b0d 84c0            test    al,al
fffff802`bc922b0f 747e            je      stornvme!NVMeHwStartIo+0xdf (fffff802`bc922b8f)
fffff802`bc922b11 83f902          cmp     ecx,2  ;if(pSrbExPnp->PnPAction == StorRemoveDevice) goto stornvme!NVMeHwStartIo+0x82
fffff802`bc922b14 741c            je      stornvme!NVMeHwStartIo+0x82 (fffff802`bc922b32)
fffff802`bc922b16 83f917          cmp     ecx,17h  ;if(pSrbExPnp->PnPAction == StorSurpriseRemoval) goto stornvme!NVMeHwStartIo+0x82
fffff802`bc922b19 7417            je      stornvme!NVMeHwStartIo+0x82 (fffff802`bc922b32)

stornvme!NVMeHwStartIo+0x6b:
fffff802`bc922b1b 83f904          cmp     ecx,4    ;if(pSrbExPnp->PnPAction != StorStopDevice) goto stornvme!NVMeHwStartIo+0xdb
fffff802`bc922b1e 756b            jne     stornvme!NVMeHwStartIo+0xdb (fffff802`bc922b8b)
fffff802`bc922b20 8b4714          mov     eax,dword ptr [rdi+14h]
fffff802`bc922b23 83e0fe          and     eax,0FFFFFFFEh
fffff802`bc922b26 83c802          or      eax,2
fffff802`bc922b29 894714          mov     dword ptr [rdi+14h],eax
fffff802`bc922b2c c6430301        mov     byte ptr [rbx+3],1
fffff802`bc922b30 eb5d            jmp     stornvme!NVMeHwStartIo+0xdf (fffff802`bc922b8f)

stornvme!NVMeHwStartIo+0x82:
fffff802`bc922b32 8b4714          mov     eax,dword ptr [rdi+14h]
fffff802`bc922b35 83e0fe          and     eax,0FFFFFFFEh
fffff802`bc922b38 83c808          or      eax,8
fffff802`bc922b3b 894714          mov     dword ptr [rdi+14h],eax
fffff802`bc922b3e c6430301        mov     byte ptr [rbx+3],1
fffff802`bc922b42 eb4b            jmp     stornvme!NVMeHwStartIo+0xdf (fffff802`bc922b8f)
fffff802`bc922b44 807f1000        cmp     byte ptr [rdi+10h],0
fffff802`bc922b48 740c            je      stornvme!NVMeHwStartIo+0xa6 (fffff802`bc922b56)

stornvme!NVMeHwStartIo+0x9a:
fffff802`bc922b4a 488bcf          mov     rcx,rdi
fffff802`bc922b4d e85a9e0000      call    stornvme!NVMeControllerPowerDown (fffff802`bc92c9ac)
fffff802`bc922b52 0fb65302        movzx   edx,byte ptr [rbx+2]
fffff802`bc922b56 80fa28          cmp     dl,28h
fffff802`bc922b59 750a            jne     stornvme!NVMeHwStartIo+0xb5 (fffff802`bc922b65)
fffff802`bc922b5b 8b4334          mov     eax,dword ptr [rbx+34h]
fffff802`bc922b5e 0fb64c180a      movzx   ecx,byte ptr [rax+rbx+0Ah]
fffff802`bc922b63 eb04            jmp     stornvme!NVMeHwStartIo+0xb9 (fffff802`bc922b69)
0: kd> u
stornvme!NVMeHwStartIo+0xb5:
fffff802`bc922b65 0fb64b07        movzx   ecx,byte ptr [rbx+7]
fffff802`bc922b69 0fb6c1          movzx   eax,cl
fffff802`bc922b6c 3b87b8000000    cmp     eax,dword ptr [rdi+0B8h]
fffff802`bc922b72 7311            jae     stornvme!NVMeHwStartIo+0xd5 (fffff802`bc922b85)
fffff802`bc922b74 488b8cc768060000 mov     rcx,qword ptr [rdi+rax*8+668h]
fffff802`bc922b7c 4885c9          test    rcx,rcx
fffff802`bc922b7f 7404            je      stornvme!NVMeHwStartIo+0xd5 (fffff802`bc922b85)
fffff802`bc922b81 83491402        or      dword ptr [rcx+14h],2
0: kd> u
stornvme!NVMeHwStartIo+0xd5:
fffff802`bc922b85 c6430301        mov     byte ptr [rbx+3],1
fffff802`bc922b89 eb04            jmp     stornvme!NVMeHwStartIo+0xdf (fffff802`bc922b8f)

stornvme!NVMeHwStartIo+0xdb:
fffff801`58b22b8b c6430306        mov     byte ptr [rbx+3],6            ;Srb->SrbStatus = SRB_STATUS_INVALID_REQUEST;
fffff801`58b22b8f 807b0300        cmp     byte ptr [rbx+3],0
fffff801`58b22b93 741d            je      stornvme!NVMeHwStartIo+0x102 (fffff801`58b22bb2)  Branch

stornvme!NVMeHwStartIo+0xe5:
fffff801`58b22b95 4c8bc3          mov     r8,rbx
fffff801`58b22b98 488bd7          mov     rdx,rdi
fffff801`58b22b9b 33c9            xor     ecx,ecx
fffff801`58b22b9d 48ff156cc40100  call    qword ptr [stornvme!_imp_StorPortNotification (fffff801`58b3f010)]
fffff801`58b22ba4 0f1f440000      nop     dword ptr [rax+rax]
fffff801`58b22ba9 b001            mov     al,1
fffff801`58b22bab 4883c428        add     rsp,28h
fffff801`58b22baf 5f              pop     rdi
fffff801`58b22bb0 5b              pop     rbx
fffff801`58b22bb1 c3              ret

stornvme!NVMeHwStartIo+0x102:
fffff801`58b22bb2 807b0228        cmp     byte ptr [rbx+2],28h      ;if (Function != SRB_FUNCTION_STORAGE_REQUEST_BLOCK) goto 0x11d
fffff801`58b22bb6 4889742448      mov     qword ptr [rsp+48h],rsi
fffff801`58b22bbb 4c89642450      mov     qword ptr [rsp+50h],r12
fffff801`58b22bc0 4c89742458      mov     qword ptr [rsp+58h],r14
fffff801`58b22bc5 7506            jne     stornvme!NVMeHwStartIo+0x11d (fffff801`58b22bcd)  Branch

stornvme!NVMeHwStartIo+0x117:
fffff801`58b22bc7 488b7368        mov     rsi,qword ptr [rbx+68h]               ;rsi == MiniportContext => HwAdapterExtension
fffff801`58b22bcb eb04            jmp     stornvme!NVMeHwStartIo+0x121 (fffff801`58b22bd1)  Branch

stornvme!NVMeHwStartIo+0x11d:
fffff801`58b22bcd 488b7338        mov     rsi,qword ptr [rbx+38h]

stornvme!NVMeHwStartIo+0x121:
fffff801`58b22bd1 488bc6          mov     rax,rsi
fffff801`58b22bd4 25ff0f0000      and     eax,0FFFh         ;取最後三位 OR mod 0x1000
fffff801`58b22bd9 740a            je      stornvme!NVMeHwStartIo+0x135 (fffff801`58b22be5)  Branch

stornvme!NVMeHwStartIo+0x12b:
fffff801`58b22bdb 482bf0          sub     rsi,rax
fffff801`58b22bde 4881c600100000  add     rsi,1000h

stornvme!NVMeHwStartIo+0x135:
fffff801`58b22be5 0fb78694100000  movzx   eax,word ptr [rsi+1094h]              ;這rsi是啥？
fffff801`58b22bec 6685c0          test    ax,ax
fffff801`58b22bef 7511            jne     stornvme!NVMeHwStartIo+0x152 (fffff801`58b22c02)  Branch

stornvme!NVMeHwStartIo+0x141:
fffff801`58b22bf1 440fb7a704010000 movzx   r12d,word ptr [rdi+104h]     ;rdi == AdapterExtension
fffff801`58b22bf9 4c8db710010000  lea     r14,[rdi+110h]
fffff801`58b22c00 eb23            jmp     stornvme!NVMeHwStartIo+0x175 (fffff801`58b22c25)  Branch

stornvme!NVMeHwStartIo+0x152:
fffff801`58b22c02 4c8bb7f0020000  mov     r14,qword ptr [rdi+2F0h]
fffff801`58b22c09 440fb7a706010000 movzx   r12d,word ptr [rdi+106h]
fffff801`58b22c11 4981c678ffffff  add     r14,0FFFFFFFFFFFFFF78h
fffff801`58b22c18 0fb7c0          movzx   eax,ax
fffff801`58b22c1b 4869c888000000  imul    rcx,rax,88h
fffff801`58b22c22 4c03f1          add     r14,rcx

stornvme!NVMeHwStartIo+0x175:
fffff801`58b22c25 450fb7cc        movzx   r9d,r12w
fffff801`58b22c29 4d8bc6          mov     r8,r14
fffff801`58b22c2c 488bd3          mov     rdx,rbx
fffff801`58b22c2f 488bcf          mov     rcx,rdi
fffff801`58b22c32 e8e9000000      call    stornvme!ProcessCommandInSpecificQueue (fffff801`58b22d20)
fffff801`58b22c37 84c0            test    al,al
fffff801`58b22c39 0f85d4000000    jne     stornvme!NVMeHwStartIo+0x263 (fffff801`58b22d13)  Branch

stornvme!NVMeHwStartIo+0x18f:
fffff801`58b22c3f 807b0305        cmp     byte ptr [rbx+3],5
fffff801`58b22c43 48896c2440      mov     qword ptr [rsp+40h],rbp
fffff801`58b22c48 4c897c2420      mov     qword ptr [rsp+20h],r15
fffff801`58b22c4d 0f8590000000    jne     stornvme!NVMeHwStartIo+0x233 (fffff801`58b22ce3)  Branch

stornvme!NVMeHwStartIo+0x1a3:
fffff801`58b22c53 6641837e2800    cmp     word ptr [r14+28h],0
fffff801`58b22c59 0f8484000000    je      stornvme!NVMeHwStartIo+0x233 (fffff801`58b22ce3)  Branch

stornvme!NVMeHwStartIo+0x1af:
fffff801`58b22c5f 0fb78708010000  movzx   eax,word ptr [rdi+108h]
fffff801`58b22c66 33ed            xor     ebp,ebp
fffff801`58b22c68 808e9d10000010  or      byte ptr [rsi+109Dh],10h
fffff801`58b22c6f 448bf8          mov     r15d,eax
fffff801`58b22c72 85c0            test    eax,eax
fffff801`58b22c74 746d            je      stornvme!NVMeHwStartIo+0x233 (fffff801`58b22ce3)  Branch

stornvme!NVMeHwStartIo+0x1c6:
fffff801`58b22c76 66660f1f840000000000 nop word ptr [rax+rax]

stornvme!NVMeHwStartIo+0x1d0:
fffff801`58b22c80 410fb74628      movzx   eax,word ptr [r14+28h]
fffff801`58b22c85 33d2            xor     edx,edx
fffff801`58b22c87 0fb78f08010000  movzx   ecx,word ptr [rdi+108h]
fffff801`58b22c8e ffc0            inc     eax
fffff801`58b22c90 f7f1            div     eax,ecx
fffff801`58b22c92 b801000000      mov     eax,1
fffff801`58b22c97 450fb7cc        movzx   r9d,r12w
fffff801`58b22c9b 6685d2          test    dx,dx
fffff801`58b22c9e 660f45c2        cmovne  ax,dx
fffff801`58b22ca2 488bd3          mov     rdx,rbx
fffff801`58b22ca5 0fb7c0          movzx   eax,ax
fffff801`58b22ca8 4869c888000000  imul    rcx,rax,88h
fffff801`58b22caf 66898694100000  mov     word ptr [rsi+1094h],ax
fffff801`58b22cb6 4c8bb7f0020000  mov     r14,qword ptr [rdi+2F0h]
fffff801`58b22cbd 4981c678ffffff  add     r14,0FFFFFFFFFFFFFF78h
fffff801`58b22cc4 4c03f1          add     r14,rcx
fffff801`58b22cc7 488bcf          mov     rcx,rdi
fffff801`58b22cca 4d8bc6          mov     r8,r14
fffff801`58b22ccd e84e000000      call    stornvme!ProcessCommandInSpecificQueue (fffff801`58b22d20)
fffff801`58b22cd2 84c0            test    al,al
fffff801`58b22cd4 751b            jne     stornvme!NVMeHwStartIo+0x241 (fffff801`58b22cf1)  Branch

stornvme!NVMeHwStartIo+0x226:
fffff801`58b22cd6 807b0305        cmp     byte ptr [rbx+3],5
fffff801`58b22cda 7507            jne     stornvme!NVMeHwStartIo+0x233 (fffff801`58b22ce3)  Branch

stornvme!NVMeHwStartIo+0x22c:
fffff801`58b22cdc ffc5            inc     ebp
fffff801`58b22cde 413bef          cmp     ebp,r15d
fffff801`58b22ce1 729d            jb      stornvme!NVMeHwStartIo+0x1d0 (fffff801`58b22c80)  Branch

stornvme!NVMeHwStartIo+0x233:
fffff801`58b22ce3 4533c0          xor     r8d,r8d
fffff801`58b22ce6 488bd3          mov     rdx,rbx
fffff801`58b22ce9 488bcf          mov     rcx,rdi
fffff801`58b22cec e8e3b60000      call    stornvme!NVMeRequestComplete (fffff801`58b2e3d4)

stornvme!NVMeHwStartIo+0x241:
fffff801`58b22cf1 488b6c2440      mov     rbp,qword ptr [rsp+40h]
fffff801`58b22cf6 b001            mov     al,1
fffff801`58b22cf8 4c8b7c2420      mov     r15,qword ptr [rsp+20h]

stornvme!NVMeHwStartIo+0x24d:
fffff801`58b22cfd 488b742448      mov     rsi,qword ptr [rsp+48h]
fffff801`58b22d02 4c8b642450      mov     r12,qword ptr [rsp+50h]
fffff801`58b22d07 4c8b742458      mov     r14,qword ptr [rsp+58h]
fffff801`58b22d0c 4883c428        add     rsp,28h
fffff801`58b22d10 5f              pop     rdi
fffff801`58b22d11 5b              pop     rbx
fffff801`58b22d12 c3              ret

stornvme!NVMeHwStartIo+0x263:
fffff801`58b22d13 b001            mov     al,1
fffff801`58b22d15 ebe6            jmp     stornvme!NVMeHwStartIo+0x24d (fffff801`58b22cfd)  Branch
