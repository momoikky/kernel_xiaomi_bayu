/* Generated by firmware/Makefile */
    .section .rodata
    .p2align 4
_fw_j20s_novatek_ts_fw02_bin_bin:
    .incbin "firmware/j20s_novatek_ts_fw02.bin"
_fw_end:
   .section .rodata.str,"aMS",@progbits,1
    .p2align 3
_fw_j20s_novatek_ts_fw02_bin_name:
    .string "j20s_novatek_ts_fw02.bin"
    .section .builtin_fw,"a",@progbits
    .p2align 3
    .quad _fw_j20s_novatek_ts_fw02_bin_name
    .quad _fw_j20s_novatek_ts_fw02_bin_bin
    .quad _fw_end - _fw_j20s_novatek_ts_fw02_bin_bin
