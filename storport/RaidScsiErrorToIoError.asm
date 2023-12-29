0: kd> uf storport!RaidScsiErrorToIoError
storport!RaidScsiErrorToIoError:
fffff803`10e25dbc 83e901          sub     ecx,1     ;0x01??
fffff803`10e25dbf 7432            je      storport!RaidScsiErrorToIoError+0x37 (fffff803`10e25df3)  Branch

storport!RaidScsiErrorToIoError+0x5:
fffff803`10e25dc1 83e903          sub     ecx,3     ;SCSISTAT_CONDITION_MET??
fffff803`10e25dc4 7427            je      storport!RaidScsiErrorToIoError+0x31 (fffff803`10e25ded)  Branch

storport!RaidScsiErrorToIoError+0xa:
fffff803`10e25dc6 83e904          sub     ecx,4     ;SCSISTAT_BUSY??
fffff803`10e25dc9 741c            je      storport!RaidScsiErrorToIoError+0x2b (fffff803`10e25de7)  Branch

storport!RaidScsiErrorToIoError+0xf:
fffff803`10e25dcb 83e901          sub     ecx,1     ;0x09??
fffff803`10e25dce 7411            je      storport!RaidScsiErrorToIoError+0x25 (fffff803`10e25de1)  Branch

storport!RaidScsiErrorToIoError+0x14:
fffff803`10e25dd0 83f901          cmp     ecx,1     ;SCSISTAT_INTERMEDIATE??
fffff803`10e25dd3 7406            je      storport!RaidScsiErrorToIoError+0x1f (fffff803`10e25ddb)  Branch

storport!RaidScsiErrorToIoError+0x19:
fffff803`10e25dd5 b80b0004c0      mov     eax,0C004000Bh
fffff803`10e25dda c3              ret

storport!RaidScsiErrorToIoError+0x1f:
fffff803`10e25ddb b8190004c0      mov     eax,0C0040019h
fffff803`10e25de0 c3              ret

storport!RaidScsiErrorToIoError+0x25:
fffff803`10e25de1 b81a000480      mov     eax,8004001Ah
fffff803`10e25de6 c3              ret

storport!RaidScsiErrorToIoError+0x2b:
fffff803`10e25de7 b80d0004c0      mov     eax,0C004000Dh
fffff803`10e25dec c3              ret

storport!RaidScsiErrorToIoError+0x31:
fffff803`10e25ded b8090004c0      mov     eax,0C0040009h
fffff803`10e25df2 c3              ret

storport!RaidScsiErrorToIoError+0x37:
fffff803`10e25df3 b8050004c0      mov     eax,0C0040005h
fffff803`10e25df8 c3              ret
