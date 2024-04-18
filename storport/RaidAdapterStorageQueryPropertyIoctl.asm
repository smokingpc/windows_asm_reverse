0: kd> uf storport!raidadapterstoragequerypropertyioctl
storport!RaidAdapterStorageQueryPropertyIoctl:
fffff800`997877d0 48895c2408      mov     qword ptr [rsp+8],rbx
fffff800`997877d5 55              push    rbp
fffff800`997877d6 488bec          mov     rbp,rsp
fffff800`997877d9 4883ec20        sub     rsp,20h
fffff800`997877dd 488bda          mov     rbx,rdx
fffff800`997877e0 ba0d0000c0      mov     edx,0C000000Dh
fffff800`997877e5 488b83b8000000  mov     rax,qword ptr [rbx+0B8h]  ;RAX = IRP->Tail.Overlay.CurrentStackLocation
fffff800`997877ec 4c8b5318        mov     r10,qword ptr [rbx+18h]   ;R10 = IRP->AssociatedIrp.SystemBuffer
fffff800`997877f0 448b4008        mov     r8d,dword ptr [rax+8]     ;R8D == CurrentStackLocation->Parameters.DeviceIoControl.InputBufferLength
fffff800`997877f4 4c894518        mov     qword ptr [rbp+18h],r8
fffff800`997877f8 4983f808        cmp     r8,8 ;if outbuf_size == 8, it is STORAGE_DESCRIPTOR_HEADER, return 8 bytes header only
fffff800`997877fc 0f829c000000    jb      storport!RaidAdapterStorageQueryPropertyIoctl+0xce (fffff800`9978789e)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x32:
fffff800`99787802 4d6302          movsxd  r8,dword ptr [r10]    ;R8 = IRP->AssociatedIrp.SystemBuffer = PSTORAGE_PROPERTY_QUERY->PropertyId, 
fffff800`99787805 4183f839        cmp     r8d,39h               ;if PropertyId > StorageAdapterSerialNumberProperty goto 0xce (return)
fffff800`99787809 0f878f000000    ja      storport!RaidAdapterStorageQueryPropertyIoctl+0xce (fffff800`9978789e)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x3f:
fffff800`9978780f 49b92200030000002a02 mov r9,22A000000030022h  ;??
fffff800`99787819 4d0fa3c1        bt      r9,r8
fffff800`9978781d 737f            jae     storport!RaidAdapterStorageQueryPropertyIoctl+0xce (fffff800`9978789e)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x4f:
fffff800`9978781f 458b4a04        mov     r9d,dword ptr [r10+4] ;if QueryType != PropertyStandardQuery, goto 0x70c4
fffff800`99787823 4585c9          test    r9d,r9d
fffff800`99787826 0f8568700000    jne     storport!RaidAdapterStorageQueryPropertyIoctl+0x70c4 (fffff800`9978e894)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x5c:
fffff800`9978782c 4183e801        sub     r8d,1     ;if PropertyId == StorageAdapterProperty, goto 0xdb
fffff800`99787830 7479            je      storport!RaidAdapterStorageQueryPropertyIoctl+0xdb (fffff800`997878ab)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x62:
fffff800`99787832 4183e804        sub     r8d,4     ;if PropertyId == StorageMiniportProperty, goto 0xf3
fffff800`99787836 0f8487000000    je      storport!RaidAdapterStorageQueryPropertyIoctl+0xf3 (fffff800`997878c3)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x6c:
fffff800`9978783c 4183e80b        sub     r8d,0Bh     ;if PropertyId == StorageAdapterRpmbProperty, goto 0x7116
fffff800`99787840 0f84a0700000    je      storport!RaidAdapterStorageQueryPropertyIoctl+0x7116 (fffff800`9978e8e6)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x76:
fffff800`99787846 4183e801        sub     r8d,1     ;if PropertyId == StorageAdapterCryptoProperty, goto 0x7104
fffff800`9978784a 0f8484700000    je      storport!RaidAdapterStorageQueryPropertyIoctl+0x7104 (fffff800`9978e8d4)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x80:
fffff800`99787850 4183e820        sub     r8d,20h     ;if PropertyId == StorageAdapterProtocolSpecificProperty, goto 0x70f2
fffff800`99787854 0f8468700000    je      storport!RaidAdapterStorageQueryPropertyIoctl+0x70f2 (fffff800`9978e8c2)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x8a:
fffff800`9978785a 4183e802        sub     r8d,2     ;if PropertyId == StorageAdapterTemperatureProperty, goto 0x70e0
fffff800`9978785e 0f844c700000    je      storport!RaidAdapterStorageQueryPropertyIoctl+0x70e0 (fffff800`9978e8b0)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x94:
fffff800`99787864 4183e802        sub     r8d,2     ;if PropertyId == StorageAdapterPhysicalTopologyProperty, goto 0x101
fffff800`99787868 7467            je      storport!RaidAdapterStorageQueryPropertyIoctl+0x101 (fffff800`997878d1)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x9a:
fffff800`9978786a 4183f804        cmp     r8d,4     ;if PropertyId == StorageAdapterSerialNumberProperty, goto 0xb6
fffff800`9978786e 7516            jne     storport!RaidAdapterStorageQueryPropertyIoctl+0xb6 (fffff800`99787886)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0xa0:
fffff800`99787870 4c8d4518        lea     r8,[rbp+18h]
fffff800`99787874 498bd2          mov     rdx,r10
fffff800`99787877 e87c570000      call    storport!RaidGetStorageAdapterSerialNumberProperty (fffff800`9978cff8)
fffff800`9978787c 488b4d18        mov     rcx,qword ptr [rbp+18h]
fffff800`99787880 8bd0            mov     edx,eax
fffff800`99787882 48894b38        mov     qword ptr [rbx+38h],rcx

storport!RaidAdapterStorageQueryPropertyIoctl+0xb6:
fffff800`99787886 448bc2          mov     r8d,edx

storport!RaidAdapterStorageQueryPropertyIoctl+0xb9:
fffff800`99787889 33d2            xor     edx,edx
fffff800`9978788b 488bcb          mov     rcx,rbx
fffff800`9978788e e81d1dfaff      call    storport!RaidCompleteRequestEx (fffff800`997295b0)
fffff800`99787893 488b5c2430      mov     rbx,qword ptr [rsp+30h]
fffff800`99787898 4883c420        add     rsp,20h
fffff800`9978789c 5d              pop     rbp
fffff800`9978789d c3              ret

storport!RaidAdapterStorageQueryPropertyIoctl+0xce:
fffff800`9978789e 4883633800      and     qword ptr [rbx+38h],0
fffff800`997878a3 41b8100000c0    mov     r8d,0C0000010h
fffff800`997878a9 ebde            jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xb9 (fffff800`99787889)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0xdb:
fffff800`997878ab 4c8d4518        lea     r8,[rbp+18h]
fffff800`997878af 498bd2          mov     rdx,r10
fffff800`997878b2 e831000000      call    storport!RaidGetStorageAdapterProperty (fffff800`997878e8)

storport!RaidAdapterStorageQueryPropertyIoctl+0xe7:
fffff800`997878b7 8bd0            mov     edx,eax
fffff800`997878b9 488b4518        mov     rax,qword ptr [rbp+18h]
fffff800`997878bd 48894338        mov     qword ptr [rbx+38h],rax
fffff800`997878c1 ebc3            jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xb6 (fffff800`99787886)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0xf3:
fffff800`997878c3 4c8d4518        lea     r8,[rbp+18h]
fffff800`997878c7 498bd2          mov     rdx,r10
fffff800`997878ca e831590000      call    storport!RaidGetStorageMiniportProperty (fffff800`9978d200)
fffff800`997878cf ebe6            jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xe7 (fffff800`997878b7)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x101:
fffff800`997878d1 4c8d4518        lea     r8,[rbp+18h]
fffff800`997878d5 488bd3          mov     rdx,rbx
fffff800`997878d8 e8877efaff      call    storport!RaidGetStorageAdapterPhysicalTopologyProperty (fffff800`9972f764)
fffff800`997878dd ebd8            jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xe7 (fffff800`997878b7)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x70c4:
fffff800`9978e894 4183f901        cmp     r9d,1
fffff800`9978e898 740f            je      storport!RaidAdapterStorageQueryPropertyIoctl+0x70d9 (fffff800`9978e8a9)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x70ca:
fffff800`9978e89a 4883633800      and     qword ptr [rbx+38h],0
fffff800`9978e89f ba100000c0      mov     edx,0C0000010h
fffff800`9978e8a4 e9dd8fffff      jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xb6 (fffff800`99787886)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x70d9:
fffff800`9978e8a9 33d2            xor     edx,edx
fffff800`9978e8ab e9d68fffff      jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xb6 (fffff800`99787886)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x70e0:
fffff800`9978e8b0 4c8d4518        lea     r8,[rbp+18h]
fffff800`9978e8b4 488bd3          mov     rdx,rbx
fffff800`9978e8b7 e85488fcff      call    storport!RaidGetStorageAdapterTemperatureProperty (fffff800`99757110)
fffff800`9978e8bc 90              nop
fffff800`9978e8bd e9f58fffff      jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xe7 (fffff800`997878b7)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x70f2:
fffff800`9978e8c2 4c8d4518        lea     r8,[rbp+18h]
fffff800`9978e8c6 488bd3          mov     rdx,rbx
fffff800`9978e8c9 e83686fcff      call    storport!RaidGetStorageAdapterProtocolSpecificProperty (fffff800`99756f04)
fffff800`9978e8ce 90              nop
fffff800`9978e8cf e9e38fffff      jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xe7 (fffff800`997878b7)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x7104:
fffff800`9978e8d4 4c8d4518        lea     r8,[rbp+18h]
fffff800`9978e8d8 488bd3          mov     rdx,rbx
fffff800`9978e8db e83085fcff      call    storport!RaidGetStorageAdapterCryptoProperty (fffff800`99756e10)
fffff800`9978e8e0 90              nop
fffff800`9978e8e1 e9d18fffff      jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xe7 (fffff800`997878b7)  Branch

storport!RaidAdapterStorageQueryPropertyIoctl+0x7116:
fffff800`9978e8e6 4c8d4518        lea     r8,[rbp+18h]
fffff800`9978e8ea 488bd3          mov     rdx,rbx
fffff800`9978e8ed e8c287fcff      call    storport!RaidGetStorageAdapterRpmbProperty (fffff800`997570b4)
fffff800`9978e8f2 90              nop
fffff800`9978e8f3 e9bf8fffff      jmp     storport!RaidAdapterStorageQueryPropertyIoctl+0xe7 (fffff800`997878b7)  Branch
