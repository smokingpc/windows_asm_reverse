0: kd> uf storport!RaBuildQueryPhysicalTopologyBufferForMiniport
storport!RaBuildQueryPhysicalTopologyBufferForMiniport:
fffff800`99725204 488bc4          mov     rax,rsp
fffff800`99725207 48895808        mov     qword ptr [rax+8],rbx
fffff800`9972520b 48896810        mov     qword ptr [rax+10h],rbp
fffff800`9972520f 48897018        mov     qword ptr [rax+18h],rsi
fffff800`99725213 48897820        mov     qword ptr [rax+20h],rdi
fffff800`99725217 4154            push    r12
fffff800`99725219 4156            push    r14
fffff800`9972521b 4157            push    r15
fffff800`9972521d 4883ec20        sub     rsp,20h
fffff800`99725221 488b82b8000000  mov     rax,qword ptr [rdx+0B8h]
fffff800`99725228 33ff            xor     edi,edi
fffff800`9972522a 4d8bf9          mov     r15,r9
fffff800`9972522d 4d8be0          mov     r12,r8
fffff800`99725230 8bdf            mov     ebx,edi
fffff800`99725232 8b6808          mov     ebp,dword ptr [rax+8]
fffff800`99725235 b8ffffffff      mov     eax,0FFFFFFFFh
fffff800`9972523a 488d751c        lea     rsi,[rbp+1Ch]
fffff800`9972523e 483bf0          cmp     rsi,rax
fffff800`99725241 0f87e95a0200    ja      storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x25b2c (fffff800`9974ad30)  Branch

storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x43:
fffff800`99725247 4c8bc9          mov     r9,rcx        ;devobj or AdapterExt?
fffff800`9972524a 8bd6            mov     edx,esi       ;size
fffff800`9972524c b900020000      mov     ecx,200h      ;NonPagedPoolNx
fffff800`99725251 448bf6          mov     r14d,esi
fffff800`99725254 41b852615372    mov     r8d,72536152h ;'RaSr' tag
fffff800`9972525a e88d1e0000      call    storport!RaidAllocatePool (fffff800`997270ec)
fffff800`9972525f 488bd8          mov     rbx,rax   ;rax = rbx = SRB_IO_CONTROL + pending buffer
fffff800`99725262 4885c0          test    rax,rax
fffff800`99725265 7464            je      storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0xc7 (fffff800`997252cb)  Branch

storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x63:
fffff800`99725267 458bc6          mov     r8d,r14d
fffff800`9972526a 33d2            xor     edx,edx
fffff800`9972526c 488bc8          mov     rcx,rax
fffff800`9972526f e8cced0100      call    storport!memset (fffff800`99744040)
fffff800`99725274 c7031c000000    mov     dword ptr [rbx],1Ch       ;srb_ioctl->HeaderLength = 0x1C
fffff800`9972527a 48b8544f504f4c4f4759 mov rax,59474F4C4F504F54h    ;'TOPOLOGY'
fffff800`99725284 48894304        mov     qword ptr [rbx+4],rax     ;srb_ioctl->signature = 'TOPOLOGY'
fffff800`99725288 c7431000142d00  mov     dword ptr [rbx+10h],2D1400h   ;srb_ioctl->ControlCode = IOCTL_STORAGE_QUERY_PROPERTY
fffff800`9972528f c7430c3c000000  mov     dword ptr [rbx+0Ch],3Ch       ;srb_ioctl->Timeout = 0x3C
fffff800`99725296 896b18          mov     dword ptr [rbx+18h],ebp       ;srb_ioctl->Length = ebp = tail pending buffer length
fffff800`99725299 c7431c38000000  mov     dword ptr [rbx+1Ch],38h       ;pending buffer?
fffff800`997252a0 896b20          mov     dword ptr [rbx+20h],ebp       ;pending buffer->Length?

storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x9f:
fffff800`997252a3 488b6c2448      mov     rbp,qword ptr [rsp+48h]
fffff800`997252a8 8bc7            mov     eax,edi
fffff800`997252aa 488b7c2458      mov     rdi,qword ptr [rsp+58h]
fffff800`997252af 49891c24        mov     qword ptr [r12],rbx
fffff800`997252b3 488b5c2440      mov     rbx,qword ptr [rsp+40h]
fffff800`997252b8 418937          mov     dword ptr [r15],esi
fffff800`997252bb 488b742450      mov     rsi,qword ptr [rsp+50h]
fffff800`997252c0 4883c420        add     rsp,20h
fffff800`997252c4 415f            pop     r15
fffff800`997252c6 415e            pop     r14
fffff800`997252c8 415c            pop     r12
fffff800`997252ca c3              ret

storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0xc7:
fffff800`997252cb bf9a0000c0      mov     edi,0C000009Ah
fffff800`997252d0 ebd1            jmp     storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x9f (fffff800`997252a3)  Branch

storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x25b2c:
fffff800`9974ad30 bf0d0000c0      mov     edi,0C000000Dh
fffff800`9974ad35 e969a5fdff      jmp     storport!RaBuildQueryPhysicalTopologyBufferForMiniport+0x9f (fffff800`997252a3)  Branch
