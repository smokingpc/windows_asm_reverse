24: kd> uf nt!KeAddProcessorAffinityEx
nt!KeAddProcessorAffinityEx:
fffff805`34b21500 4c8bc1          mov     r8,rcx
fffff805`34b21503 8bc2            mov     eax,edx
fffff805`34b21505 488d0d34da4d00  lea     rcx,[nt!KiProcessorIndexToNumberMappingTable (fffff805`34ffef40)]
fffff805`34b2150c 448b0c81        mov     r9d,dword ptr [rcx+rax*4]
fffff805`34b21510 418bc9          mov     ecx,r9d
fffff805`34b21513 410fb700        movzx   eax,word ptr [r8]
fffff805`34b21517 4183e13f        and     r9d,3Fh
fffff805`34b2151b c1e906          shr     ecx,6
fffff805`34b2151e 3bc1            cmp     eax,ecx
fffff805`34b21520 7614            jbe     nt!KeAddProcessorAffinityEx+0x36 (fffff805`34b21536)  Branch

nt!KeAddProcessorAffinityEx+0x22:
fffff805`34b21522 8bd1            mov     edx,ecx
fffff805`34b21524 498b4cc808      mov     rcx,qword ptr [r8+rcx*8+8]
fffff805`34b21529 418bc1          mov     eax,r9d
fffff805`34b2152c 480fabc1        bts     rcx,rax
fffff805`34b21530 49894cd008      mov     qword ptr [r8+rdx*8+8],rcx
fffff805`34b21535 c3              ret

nt!KeAddProcessorAffinityEx+0x36:
fffff805`34b21536 8d4101          lea     eax,[rcx+1]
fffff805`34b21539 66418900        mov     word ptr [r8],ax
fffff805`34b2153d ebe3            jmp     nt!KeAddProcessorAffinityEx+0x22 (fffff805`34b21522)  Branch
