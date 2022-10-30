LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libluajit

LOCAL_SDK_VERSION := 19

LOCAL_CFLAGS := -ffast-math -fsigned-char -O2 -fPIC -DPIC \
    -DBYTE_ORDER=LITTLE_ENDIAN

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/luajit \
    $(LOCAL_PATH)/luajit/host

LOCAL_CPP_INCLUDES := \
    $(LOCAL_PATH)/luajit \
    $(LOCAL_PATH)/luajit/host

LJP := $(LOCAL_PATH)/luajit/src

LOCAL_SRC_FILES := \
    $(LJP)/host/minilua.c \
    $(LJP)/host/buildvm_peobj.c \
    $(LJP)/host/buildvm_lib.c \
    $(LJP)/host/buildvm_fold.c \
    $(LJP)/host/buildvm_asm.c \
    $(LJP)/host/buildvm.c \
    $(LJP)/lib_aux.c \
    $(LJP)/lib_base.c \
    $(LJP)/lib_bit.c \
    $(LJP)/lib_buffer.c \
    $(LJP)/lib_debug.c \
    $(LJP)/lib_ffi.c \
    $(LJP)/lib_init.c \
    $(LJP)/lib_io.c \
    $(LJP)/lib_jit.c \
    $(LJP)/lib_math.c \
    $(LJP)/lib_os.c \
    $(LJP)/lib_package.c \
    $(LJP)/lib_string.c \
    $(LJP)/lib_table.c \
    $(LJP)/lj_alloc.c \
    $(LJP)/lj_api.c \
    $(LJP)/lj_asm.c \
    $(LJP)/lj_assert.c \
    $(LJP)/lj_bc.c \
    $(LJP)/lj_bcread.c \
    $(LJP)/lj_bcwrite.c \
    $(LJP)/lj_buf.c \
    $(LJP)/lj_carith.c \
    $(LJP)/lj_ccall.c \
    $(LJP)/lj_ccallback.c \
    $(LJP)/lj_cconv.c \
    $(LJP)/lj_cdata.c \
    $(LJP)/lj_char.c \
    $(LJP)/lj_clib.c \
    $(LJP)/lj_cparse.c \
    $(LJP)/lj_crecord.c \
    $(LJP)/lj_ctype.c \
    $(LJP)/lj_debug.c \
    $(LJP)/lj_dispatch.c \
    $(LJP)/lj_err.c \
    $(LJP)/lj_ffrecord.c \
    $(LJP)/lj_func.c \
    $(LJP)/lj_gc.c \
    $(LJP)/lj_gdbjit.c \
    $(LJP)/lj_ir.c \
    $(LJP)/lj_lex.c \
    $(LJP)/lj_lib.c \
    $(LJP)/lj_load.c \
    $(LJP)/lj_mcode.c \
    $(LJP)/lj_meta.c \
    $(LJP)/lj_obj.c \
    $(LJP)/lj_opt_dce.c \
    $(LJP)/lj_opt_fold.c \
    $(LJP)/lj_opt_loop.c \
    $(LJP)/lj_opt_mem.c \
    $(LJP)/lj_opt_narrow.c \
    $(LJP)/lj_opt_sink.c \
    $(LJP)/lj_opt_split.c \
    $(LJP)/lj_parse.c \
    $(LJP)/lj_prng.c \
    $(LJP)/lj_profile.c \
    $(LJP)/lj_record.c \
    $(LJP)/lj_serialize.c \
    $(LJP)/lj_snap.c \
    $(LJP)/lj_state.c \
    $(LJP)/lj_str.c \
    $(LJP)/lj_strfmt.c \
    $(LJP)/lj_strfmt_num.c \
    $(LJP)/lj_strscan.c \
    $(LJP)/lj_tab.c \
    $(LJP)/lj_trace.c \
    $(LJP)/lj_udata.c \
    $(LJP)/lj_vmevent.c \
    $(LJP)/lj_vmmath.c \
    $(LJP)/luajit.c

ifeq ($(strip $(TARGET_ARCH)),arm)
    LOCAL_CFLAGS += -DCPU_ARM -D_ARM_ASSEM_
endif

ifeq ($(strip $(TARGET_ARCH)),x86)
    LOCAL_CFLAGS += -DCPU_X86
endif

ifeq ($(strip $(TARGET_ARCH)),arm64)
    LOCAL_CFLAGS += -DCPU_ARM -D_ARM_ASSEM_
endif

ifeq ($(strip $(TARGET_ARCH)),x86_64)
    LOCAL_CFLAGS += -DCPU_X86
endif

include $(BUILD_STATIC_LIBRARY)