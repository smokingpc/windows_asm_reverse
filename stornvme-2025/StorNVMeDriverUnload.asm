;StorNVMeDriverUnload

3: kd> !irql
Debugger saved IRQL for processor 0x3 -- 2 (DISPATCH_LEVEL)
3: kd> uf StorNVMeDriverUnload
stornvme!StorNVMeDriverUnload:
fffff804`3c4ad0a0 4883ec28        sub     rsp,28h
fffff804`3c4ad0a4 488b05fd200100  mov     rax,qword ptr [stornvme!StorPortDriverUnload (fffff804`3c4bf1a8)]
fffff804`3c4ad0ab e8d0e68c6d      call    nt!KscpCfgDispatchUserCallTargetEsSmep (fffff804`a9d7b780)
fffff804`3c4ad0b0 488b0df1210100  mov     rcx,qword ptr [stornvme!wil_details_featureChangeNotification (fffff804`3c4bf2a8)]
fffff804`3c4ad0b7 4885c9          test    rcx,rcx
fffff804`3c4ad0ba 7414            je      stornvme!StorNVMeDriverUnload+0x30 (fffff804`3c4ad0d0)  Branch

stornvme!StorNVMeDriverUnload+0x1c: ;call to nt!CmFcManagerUnregisterFeatureConfigurationChangeNotification()
fffff804`3c4ad0bc 4c8b15455f0100  mov     r10,qword ptr [stornvme!_imp_RtlUnregisterFeatureConfigurationChangeNotification (fffff804`3c4c3008)]
fffff804`3c4ad0c3 e868bf4a6d      call    nt!RtlUnregisterFeatureConfigurationChangeNotification (fffff804`a9959030)
fffff804`3c4ad0c8 488325d821010000 and     qword ptr [stornvme!wil_details_featureChangeNotification (fffff804`3c4bf2a8)],0

stornvme!StorNVMeDriverUnload+0x30:
fffff804`3c4ad0d0 488b0d31200100  mov     rcx,qword ptr [stornvme!g_wil_details_featureUsageProvider (fffff804`3c4bf108)]
fffff804`3c4ad0d7 4885c9          test    rcx,rcx
fffff804`3c4ad0da 7414            je      stornvme!StorNVMeDriverUnload+0x50 (fffff804`3c4ad0f0)  Branch

stornvme!StorNVMeDriverUnload+0x3c:
fffff804`3c4ad0dc 4c8b152d5f0100  mov     r10,qword ptr [stornvme!_imp_RtlUnregisterFeatureUsageProvider (fffff804`3c4c3010)]
fffff804`3c4ad0e3 e868bf4a6d      call    nt!RtlUnregisterFeatureUsageProvider (fffff804`a9959050)
fffff804`3c4ad0e8 4883251820010000 and     qword ptr [stornvme!g_wil_details_featureUsageProvider (fffff804`3c4bf108)],0

stornvme!StorNVMeDriverUnload+0x50:
fffff804`3c4ad0f0 4883c428        add     rsp,28h
fffff804`3c4ad0f4 c3              ret
