;stornvme自己用 GetBusData 去映射 register address，不是用PORT_CONFIGURATION 的 ACCESS_RANGE


0: kd> uf stornvme!GetNVMeRegisterAddress
stornvme!GetNVMeRegisterAddress:
fffff802`0a59bccc 4053            push    rbx                           ;push pAE
fffff802`0a59bcce 4883ec30        sub     rsp,30h
fffff802`0a59bcd2 8b5a34          mov     ebx,dword ptr [rdx+34h]       ;rdx==PORT_CONFIGURATION_INFORMATION , mov NumberOfAccessRanges to ebx
fffff802`0a59bcd5 33c0            xor     eax,eax                       ;ret == NULL
fffff802`0a59bcd7 4c8bd2          mov     r10,rdx                       ;arg2
fffff802`0a59bcda 85db            test    ebx,ebx                       
fffff802`0a59bcdc 744a            je      stornvme!GetNVMeRegisterAddress+0x5c (fffff802`0a59bd28)  Branch  ;if (0==NumberOfAccessRanges) goto end

stornvme!GetNVMeRegisterAddress+0x12:
fffff802`0a59bcde 4c8b5a38        mov     r11,qword ptr [rdx+38h]       ;get Array of (AccessRanges*) to r11.
fffff802`0a59bce2 448bc8          mov     r9d,eax

stornvme!GetNVMeRegisterAddress+0x19:       ;for(int i=0; i<NumberOfAccessRanges; i++) { if( AccessRanges[i].RangeStart == PCI BUS Bar0) goto 0x2f; }
fffff802`0a59bce5 418bd1          mov     edx,r9d                       ;eax == r9d == edx == 0
fffff802`0a59bce8 4803d2          add     rdx,rdx
fffff802`0a59bceb 4d3904d3        cmp     qword ptr [r11+rdx*8],r8
fffff802`0a59bcef 740a            je      stornvme!GetNVMeRegisterAddress+0x2f (fffff802`0a59bcfb)  Branch

stornvme!GetNVMeRegisterAddress+0x25:
fffff802`0a59bcf1 41ffc1          inc     r9d
fffff802`0a59bcf4 443bcb          cmp     r9d,ebx
fffff802`0a59bcf7 72ec            jb      stornvme!GetNVMeRegisterAddress+0x19 (fffff802`0a59bce5)  Branch

stornvme!GetNVMeRegisterAddress+0x2d:
fffff802`0a59bcf9 eb2d            jmp     stornvme!GetNVMeRegisterAddress+0x5c (fffff802`0a59bd28)  Branch

stornvme!GetNVMeRegisterAddress+0x2f:
fffff802`0a59bcfb 413844d30c      cmp     byte ptr [r11+rdx*8+0Ch],al       ;(AccessRanges[i].RangeInMemory == TRUE)?
fffff802`0a59bd00 4d8b0cd3        mov     r9,qword ptr [r11+rdx*8]          ;mov AccessRanges[i].RangeStart to r9 (arg4)
fffff802`0a59bd04 458b4204        mov     r8d,dword ptr [r10+4]             ;mov SystemIoBusNumber to r8d (arg3)
fffff802`0a59bd08 0f94c0          sete    al                                ;if(AccessRanges[i].RangeInMemory == FALSE)  al=1;
fffff802`0a59bd0b 88442428        mov     byte ptr [rsp+28h],al             ;InIoSpace(arg6) =  !AccessRanges[i].RangeInMemory
fffff802`0a59bd0f 418b44d308      mov     eax,dword ptr [r11+rdx*8+8]       ;AccessRanges[i].RangeLength to eax
fffff802`0a59bd14 418b5208        mov     edx,dword ptr [r10+8]             ;mov AdapterInterfaceType to edx (arg2)
fffff802`0a59bd18 89442420        mov     dword ptr [rsp+20h],eax           ;NumberOfBytes == eax (arg5)
fffff802`0a59bd1c 4c8b1565a30000  mov     r10,qword ptr [stornvme!_imp_StorPortGetDeviceBase (fffff802`0a5a6088)]
fffff802`0a59bd23 e8e8b0f5ff      call    storport!StorPortGetDeviceBase (fffff802`0a4f6e10)

stornvme!GetNVMeRegisterAddress+0x5c:
fffff802`0a59bd28 4883c430        add     rsp,30h
fffff802`0a59bd2c 5b              pop     rbx
fffff802`0a59bd2d c3              ret
