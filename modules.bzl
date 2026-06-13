# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022 The Android Open Source Project

"""
This module contains a full list of kernel modules
 compiled by GKI.
"""

_COMMON_GKI_MODULES_LIST = [
    # keep sorted
    "drivers/block/virtio_blk.ko",
    "drivers/block/zram/zram.ko",
    "drivers/bluetooth/btbcm.ko",
    "drivers/bluetooth/btqca.ko",
    "drivers/bluetooth/btsdio.ko",
    "drivers/bluetooth/hci_uart.ko",
    "drivers/char/virtio_console.ko",
    "drivers/gnss/gnss.ko",
    "drivers/misc/vcpu_stall_detector.ko",
    "drivers/net/can/dev/can-dev.ko",
    "drivers/net/can/slcan/slcan.ko",
    "drivers/net/can/vcan.ko",
    "drivers/net/macsec.ko",
    "drivers/net/mii.ko",
    "drivers/net/ppp/bsd_comp.ko",
    "drivers/net/ppp/ppp_deflate.ko",
    "drivers/net/ppp/ppp_generic.ko",
    "drivers/net/ppp/ppp_mppe.ko",
    "drivers/net/ppp/pppox.ko",
    "drivers/net/ppp/pptp.ko",
    "drivers/net/slip/slhc.ko",
    "drivers/net/usb/aqc111.ko",
    "drivers/net/usb/asix.ko",
    "drivers/net/usb/ax88179_178a.ko",
    "drivers/net/usb/cdc_eem.ko",
    "drivers/net/usb/cdc_ether.ko",
    "drivers/net/usb/cdc_ncm.ko",
    "drivers/net/usb/r8152.ko",
    "drivers/net/usb/r8153_ecm.ko",
    "drivers/net/usb/rtl8150.ko",
    "drivers/net/usb/usbnet.ko",
    "drivers/net/wwan/wwan.ko",
    "drivers/power/sequencing/pwrseq-core.ko",
    "drivers/pps/pps_core.ko",
    "drivers/ptp/ptp.ko",
    "drivers/usb/class/cdc-acm.ko",
    "drivers/usb/mon/usbmon.ko",
    "drivers/usb/serial/ftdi_sio.ko",
    "drivers/usb/serial/usbserial.ko",
    "drivers/virtio/virtio_balloon.ko",
    "drivers/virtio/virtio_pci.ko",
    "drivers/virtio/virtio_pci_legacy_dev.ko",
    "drivers/virtio/virtio_pci_modern_dev.ko",
    "fs/netfs/netfs.ko",
    "kernel/kheaders.ko",
    "lib/crypto/libarc4.ko",
    "mm/zsmalloc.ko",
    "net/6lowpan/6lowpan.ko",
    "net/6lowpan/nhc_dest.ko",
    "net/6lowpan/nhc_fragment.ko",
    "net/6lowpan/nhc_hop.ko",
    "net/6lowpan/nhc_ipv6.ko",
    "net/6lowpan/nhc_mobility.ko",
    "net/6lowpan/nhc_routing.ko",
    "net/6lowpan/nhc_udp.ko",
    "net/8021q/8021q.ko",
    "net/9p/9pnet.ko",
    "net/9p/9pnet_fd.ko",
    "net/bluetooth/bluetooth.ko",
    "net/bluetooth/hidp/hidp.ko",
    "net/bluetooth/rfcomm/rfcomm.ko",
    "net/can/can.ko",
    "net/can/can-bcm.ko",
    "net/can/can-gw.ko",
    "net/can/can-raw.ko",
    "net/ieee802154/6lowpan/ieee802154_6lowpan.ko",
    "net/ieee802154/ieee802154.ko",
    "net/ieee802154/ieee802154_socket.ko",
    "net/l2tp/l2tp_core.ko",
    "net/l2tp/l2tp_ppp.ko",
    "net/mac802154/mac802154.ko",
    "net/nfc/nfc.ko",
    "net/rfkill/rfkill.ko",
    "net/tipc/tipc.ko",
    "net/tipc/tipc_diag.ko",
    "net/tls/tls.ko",
    "net/vmw_vsock/vmw_vsock_virtio_transport.ko",
]

# Deprecated - Use `get_gki_modules_list` function instead.
COMMON_GKI_MODULES_LIST = _COMMON_GKI_MODULES_LIST

_ARM_GKI_MODULES_LIST = [
    # keep sorted
    "drivers/ptp/ptp_kvm.ko",
]

_ARM64_GKI_MODULES_LIST = [
    # keep sorted
    "arch/arm64/geniezone/gzvm.ko",
    "drivers/android/rust_binder.ko",
    "drivers/char/hw_random/cctrng.ko",
    "drivers/misc/open-dice.ko",
    "drivers/ptp/ptp_kvm.ko",
]

_X86_GKI_MODULES_LIST = [
    # keep sorted
    "drivers/ptp/ptp_kvm.ko",
]

_X86_64_GKI_MODULES_LIST = [
    # keep sorted
    "drivers/android/rust_binder.ko",
    "drivers/ptp/ptp_kvm.ko",
]

# buildifier: disable=unnamed-macro
def get_gki_modules_list(arch = None):
    """ Provides the list of GKI modules.

    Args:
      arch: One of [arm, arm64, i386, x86_64].

    Returns:
      The list of GKI modules for the given |arch|.
    """
    gki_modules_list = [] + _COMMON_GKI_MODULES_LIST
    if arch == "arm":
        gki_modules_list += _ARM_GKI_MODULES_LIST
    elif arch == "arm64":
        gki_modules_list += _ARM64_GKI_MODULES_LIST
    elif arch == "i386":
        gki_modules_list += _X86_GKI_MODULES_LIST
    elif arch == "x86_64":
        gki_modules_list += _X86_64_GKI_MODULES_LIST
    else:
        fail("{}: arch {} not supported. Use one of [arm, arm64, i386, x86_64]".format(
            str(native.package_relative_label(":x")).removesuffix(":x"),
            arch,
        ))

    return gki_modules_list

_KUNIT_FRAMEWORK_MODULES = [
    "lib/kunit/kunit.ko",
]

# Modules defined by tools/testing/kunit/configs/android/kunit_defconfig
_KUNIT_COMMON_MODULES_LIST = [
    # keep sorted
    "drivers/base/regmap/regmap-kunit.ko",
    "drivers/base/regmap/regmap-ram.ko",
    "drivers/base/regmap/regmap-raw-ram.ko",
    "drivers/hid/hid-uclogic-test.ko",
    "drivers/iio/test/iio-test-format.ko",
    "drivers/input/tests/input_test.ko",
    "drivers/of/of_kunit_helpers.ko",
    "drivers/rtc/lib_test.ko",
    "fs/ext4/ext4-inode-test.ko",
    "fs/fat/fat_test.ko",
    "kernel/time/time_test.ko",
    "lib/kunit/kunit-example-test.ko",
    "lib/kunit/kunit-test.ko",
    "lib/kunit/platform-test.ko",
    # "mm/kfence/kfence_test.ko",
    "net/core/dev_addr_lists_test.ko",
    "sound/soc/soc-topology-test.ko",
    "sound/soc/soc-utils-test.ko",
]

# Modules defined by tools/testing/kunit/configs/android/kunit_clk_defconfig
_KUNIT_CLK_MODULES_LIST = [
    "drivers/clk/clk-gate_test.ko",
    "drivers/clk/clk-test.ko",
    "drivers/clk/clk_kunit_helpers.ko",
]

# buildifier: disable=unnamed-macro
def get_kunit_modules_list(arch = None):
    """ Provides the list of GKI modules.

    Args:
      arch: One of [arm, arm64, i386, x86_64].

    Returns:
      The list of KUnit modules for the given |arch|.
    """
    kunit_modules_list = _KUNIT_FRAMEWORK_MODULES + _KUNIT_COMMON_MODULES_LIST
    if arch == "arm":
        kunit_modules_list += _KUNIT_CLK_MODULES_LIST
    elif arch == "arm64":
        kunit_modules_list += _KUNIT_CLK_MODULES_LIST
    elif arch == "i386":
        kunit_modules_list += []
    elif arch == "x86_64":
        kunit_modules_list += []
    else:
        fail("{}: arch {} not supported. Use one of [arm, arm64, i386, x86_64]".format(
            str(native.package_relative_label(":x")).removesuffix(":x"),
            arch,
        ))

    return kunit_modules_list

_COMMON_UNPROTECTED_MODULES_LIST = [
    "drivers/block/zram/zram.ko",
    "mm/zsmalloc.ko",
]

# buildifier: disable=unnamed-macro
def get_gki_protected_modules_list(arch = None):
    all_gki_modules = get_gki_modules_list(arch) + get_kunit_modules_list(arch)
    unprotected_modules = _COMMON_UNPROTECTED_MODULES_LIST
    protected_modules = [mod for mod in all_gki_modules if mod not in unprotected_modules]
    return sorted(protected_modules)

def register_modules(registry):
    registry.register(
        name = "drivers/devfreq/governor_gpubw_mon",
        out = "governor_gpubw_mon.ko",
        config = "CONFIG_DEVFREQ_GOV_QCOM_GPUBW_MON",
        srcs = [
            # do not sort
            "drivers/devfreq/governor_gpubw_mon.c",
        ],
    )

    registry.register(
        name = "drivers/devfreq/governor_msm_adreno_tz",
        out = "governor_msm_adreno_tz.ko",
        config = "CONFIG_DEVFREQ_GOV_QCOM_ADRENO_TZ",
        srcs = [
            # do not sort
            "drivers/devfreq/governor_msm_adreno_tz.c",
        ],
        deps = [
            # do not sort
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )

    registry.register(
        name = "drivers/devfreq/governor_msm_adreno_ro",
        out = "governor_msm_adreno_ro.ko",
        config = "CONFIG_DEVFREQ_GOV_QCOM_ADRENO_RO",
        srcs = [
            # do not sort
            "drivers/devfreq/governor_msm_adreno_ro.c",
        ],
    )

    registry.register(
        name = "drivers/cpufreq/qcom-cpufreq-thermal",
        out = "qcom-cpufreq-thermal.ko",
        config = "CONFIG_ARM_QCOM_CPUFREQ_THERMAL",
        srcs = [
            # do not sort
            "drivers/cpufreq/qcom-cpufreq-thermal.c",
        ],
    )

    registry.register(
        name = "drivers/cpufreq/qcom-cpufreq-hw",
        out = "qcom-cpufreq-hw.ko",
        config = "CONFIG_ARM_QCOM_CPUFREQ_HW",
        srcs = [
            # do not sort
            "drivers/cpufreq/qcom-cpufreq-hw.c",
        ],
    )

    registry.register(
        name = "drivers/cpufreq/qcom-cpufreq-hw-debug",
        out = "qcom-cpufreq-hw-debug.ko",
        config = "CONFIG_ARM_QCOM_CPUFREQ_HW_DEBUG",
        srcs = [
            # do not sort
            "drivers/cpufreq/qcom-cpufreq-hw-debug.c",
        ],
        deps = [
            # do not sort
            "drivers/cpufreq/qcom-cpufreq-hw",
        ],
    )

load(":drivers/xiaomi/memcheck/modules.bzl", register_memcheck = "register_modules")
load(":drivers/xiaomi/hypsys_netlink/modules.bzl", register_hypsys_netlink = "register_modules")
load(":drivers/xiaomi/swinfo/modules.bzl", register_swinfo = "register_modules")
load(":drivers/xiaomi/dump_display/modules.bzl", register_dumpdisplay = "register_modules")
load(":drivers/xiaomi/boottime/modules.bzl", register_boottime = "register_modules")
load(":drivers/xiaomi/mi_kernel_monitor/modules.bzl", register_mi_kernel_monitor = "register_modules")
load(":drivers/xiaomi/mtdoops/modules.bzl", register_mtdoops = "register_modules")
load(":drivers/xiaomi/mi_trace/modules.bzl", register_mi_trace = "register_modules")
load(":drivers/xiaomi/printk_enhance/modules.bzl", register_printk_enhance = "register_modules")
load(":drivers/xiaomi/mi_stack/modules.bzl", register_mi_stack = "register_modules")
load(":drivers/xiaomi/mi_ubt/modules.bzl", register_mi_ubt = "register_modules")
load(":drivers/xiaomi/mi_ubt/test/modules.bzl", register_mi_ubt_test = "register_modules")
load(":drivers/xiaomi/bootmonitor/modules.bzl", register_bootmonitor = "register_modules")
def register_modules(registry):
    register_memcheck(registry)
    register_swinfo(registry)
    register_hypsys_netlink(registry)
    register_dumpdisplay(registry)
    register_boottime(registry)
    register_mi_kernel_monitor(registry)
    register_mtdoops(registry)
    register_mi_trace(registry)
    register_printk_enhance(registry)
    register_mi_stack(registry)
    register_mi_ubt(registry)
    register_mi_ubt_test(registry)
    register_bootmonitor(registry)
 def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/bootmonitor",
        out = "bootmonitor.ko",
        config = "CONFIG_MI_BOOT_MONITOR",
        srcs = [
            # do not sort
            "drivers/xiaomi/bootmonitor/bm_device.c",
            "drivers/xiaomi/bootmonitor/bm_netlink.c",
            "drivers/xiaomi/bootmonitor/boot_fail.h",
            "drivers/xiaomi/bootmonitor/boot_monitor.c",
            "drivers/xiaomi/bootmonitor/boot_monitor.h",
            "drivers/xiaomi/boottime/boottime.h",
        ],
        deps = [
            "drivers/xiaomi/swinfo",
            "drivers/xiaomi/boottime",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/boottime",
        out = "boottime.ko",
        config = "CONFIG_MI_BOOT_TIME",
        srcs = [
            # do not sort
            "drivers/xiaomi/boottime/boottime.c",
            "drivers/xiaomi/boottime/boottime.h",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/dump_display",
        out = "dump_display.ko",
        config = "CONFIG_MI_DUMP_DISPLAY",
        srcs = [
            # do not sort
            "drivers/xiaomi/dump_display/dump_display.c",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/hypsys_netlink/hypsys_netlink",
        out = "hypsys_netlink.ko",
        config = "CONFIG_MI_HYPSYS_NETLINK",
        srcs = [
            # do not sort
            "drivers/xiaomi/hypsys_netlink/hypsys_netlink.c",
            "drivers/xiaomi/hypsys_netlink/hypsys_netlink.h",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/memcheck/mi_memcheck",
        out = "mi_memcheck.ko",
        config = "CONFIG_MI_MEMCHECK",
        srcs = [
            # do not sort
            "drivers/xiaomi/memcheck/memcheck_mod.c",
            "drivers/xiaomi/memcheck/memcheck_account.c",
            "drivers/xiaomi/memcheck/memcheck_account.h",
            "drivers/soc/qcom/debug_symbol.h",
            "drivers/xiaomi/hypsys_netlink/hypsys_netlink.h",
            "drivers/xiaomi/memcheck/memcheck_ioctl.c",
            "drivers/xiaomi/memcheck/memcheck_ioctl.h",
        ],
        conditional_srcs = {
            "CONFIG_MI_MEMCHECK_PROCESS_MEM": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_process_mem.c",
                    "drivers/xiaomi/memcheck/memcheck_process_mem.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_ASHMEM": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_ashmem.c",
                    "drivers/xiaomi/memcheck/memcheck_ashmem.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_CMA": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_cma.c",
                    "drivers/xiaomi/memcheck/memcheck_cma.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_FD_FENCE": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_fd_fence.c",
                    "drivers/xiaomi/memcheck/memcheck_fd_fence.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_FD_PIPE": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_fd_pipe.c",
                    "drivers/xiaomi/memcheck/memcheck_fd_pipe.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_FD_SOCKET": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_fd_socket.c",
                    "drivers/xiaomi/memcheck/memcheck_fd_socket.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_DMABUF": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_dma-buf.c",
                    "drivers/xiaomi/memcheck/memcheck_dma-buf.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_GPUMEM": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_gpumem.c",
                    "drivers/xiaomi/memcheck/memcheck_gpumem.h",
                    "include/linux/msm_sysstats.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_SLAB": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_slab.c",
                    "drivers/xiaomi/memcheck/memcheck_slab.h",
                ],
            },
            "CONFIG_MI_MEMCHECK_VMALLOC": {
                 True: [
                    "drivers/xiaomi/memcheck/memcheck_vmalloc.c",
                    "drivers/xiaomi/memcheck/memcheck_vmalloc.h",
                ],
            },
        },
        deps = [
            "drivers/soc/qcom/debug_symbol",
            "kernel/msm_sysstats",
            "drivers/xiaomi/hypsys_netlink/hypsys_netlink",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/mi_kernel_monitor",
        includes = [
            "drivers/xiaomi",
            "drivers/xiaomi/mi_kernel_monitor",
            "drivers/xiaomi/mi_kernel_monitor/kernel",
            "drivers/xiaomi/mi_kernel_monitor/mm",
            "drivers/xiaomi/mi_kernel_monitor/sched",
            "drivers/xiaomi/mi_kernel_monitor/irq",
            "drivers/xiaomi/mi_kernel_monitor/pub",
            "drivers/xiaomi/mi_kernel_monitor/locking",
            "drivers/xiaomi/mi_kernel_monitor/binder",
            "drivers/xiaomi/mi_kernel_monitor/test",
        ],
        out = "mi_kernel_monitor.ko",
        config = "CONFIG_MI_KERNEL_MONITOR",
        srcs = [
            "drivers/xiaomi/mi_kernel_monitor/entry.c",
            "drivers/xiaomi/mi_kernel_monitor/mm_tree.c",
            "drivers/xiaomi/mi_kernel_monitor/stack.c",
            "drivers/xiaomi/mi_kernel_monitor/symbol.c",
            "drivers/xiaomi/mi_kernel_monitor/misc.c",

            "drivers/xiaomi/mi_kernel_monitor/kernel/kern_entry.c",
            "drivers/xiaomi/mi_kernel_monitor/kernel/sys_cost.c",
            "drivers/xiaomi/mi_kernel_monitor/kernel/sys_delay.c",

            "drivers/xiaomi/mi_kernel_monitor/locking/locking_main.c",
            "drivers/xiaomi/mi_kernel_monitor/locking/holdlock.c",
            "drivers/xiaomi/mi_kernel_monitor/locking/holdlock_proc.c",
            "drivers/xiaomi/mi_kernel_monitor/locking/waitlock.c",
            "drivers/xiaomi/mi_kernel_monitor/locking/waitlock_sort.c",

            "drivers/xiaomi/mi_kernel_monitor/sched/sched.c",
            "drivers/xiaomi/mi_kernel_monitor/sched/preemptoff.c",
            "drivers/xiaomi/mi_kernel_monitor/sched/rt_delay.c",
            "drivers/xiaomi/mi_kernel_monitor/sched/cpu_util.c",
            "drivers/xiaomi/mi_kernel_monitor/sched/wait.c",

            ##"drivers/xiaomi/mi_kernel_monitor/irq/irq_stats.c",
            "drivers/xiaomi/mi_kernel_monitor/irq/irq_trace.c",
            "drivers/xiaomi/mi_kernel_monitor/irq/irqoff.c",

            "drivers/xiaomi/mi_kernel_monitor/pub/trace_point.c",
            "drivers/xiaomi/mi_kernel_monitor/pub/kprobe.c",
            "drivers/xiaomi/mi_kernel_monitor/pub/stack.c",
            "drivers/xiaomi/mi_kernel_monitor/pub/symbol.c",

            "drivers/xiaomi/mi_kernel_monitor/mm/mem.c",
            "drivers/xiaomi/mi_kernel_monitor/binder/binder.c", 
            "drivers/xiaomi/mi_kernel_monitor/test/test.c",

            "drivers/xiaomi/mi_kernel_monitor/internal.h",
            "drivers/xiaomi/mi_kernel_monitor/symbol.h",
            "drivers/xiaomi/mi_kernel_monitor/pub/symbol.h",
            "drivers/xiaomi/mi_kernel_monitor/pub/trace_file.h",
            "drivers/xiaomi/mi_kernel_monitor/pub/trace_point.h",
            "drivers/xiaomi/mi_kernel_monitor/pub/stack.h",
            "drivers/xiaomi/mi_kernel_monitor/pub/proc_internal.h",
            "drivers/xiaomi/mi_kernel_monitor/pub/kprobe.h",
            "drivers/xiaomi/mi_kernel_monitor/sched/cpu_util.h",
            "drivers/xiaomi/mi_kernel_monitor/sched/wait_base.h",
            "drivers/xiaomi/mi_kernel_monitor/locking/waitlock.h",
            "drivers/xiaomi/mi_kernel_monitor/locking/holdlock.h",
            "drivers/xiaomi/mi_kernel_monitor/locking/locking_main.h",
            "drivers/xiaomi/mi_kernel_monitor/mm_tree.h",
            "drivers/xiaomi/mi_kernel_monitor/kernel/kern_internal.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/irq_stats.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/irq_trace.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/kernelmonitor.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/mutex_monitor.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/pmu.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/rw_sem.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/sys_cost.h",
            "drivers/xiaomi/mi_kernel_monitor/uapi/sys_delay.h",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/mi_stack",
        out = "mi_stack.ko",
        config = "CONFIG_MI_STACK",
        srcs = [
            # do not sort
            "drivers/xiaomi/mi_stack/mi_stack.c",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/mi_trace",
        out = "mi_trace.ko",
        config = "CONFIG_MI_TRACE",
        srcs = [
            # do not sort
            "drivers/xiaomi/mi_trace/mi_trace.c",
            "drivers/xiaomi/mi_trace/mi_trace.h",
        ],
        deps = [
            "drivers/soc/qcom/minidump",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/mi_ubt",
        out = "mi_ubt.ko",
        config = "CONFIG_MI_UBT",
        srcs = [
            # do not sort
            "drivers/xiaomi/mi_ubt/mi_ubt.c",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/mtdoops",
        out = "mtdoops.ko",
        config = "CONFIG_MI_MTDOOPS",
        srcs = [
            # do not sort
            "drivers/xiaomi/mtdoops/mtdoops.c",
            "drivers/xiaomi/mtdoops/mtdoops.h",
        ],
        deps = [
            "drivers/xiaomi/swinfo",
            "drivers/input/misc/pm8941-pwrkey",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/printk_enhance",
        out = "printk_enhance.ko",
        config = "CONFIG_PRINTK_ENHANCE",
        srcs = [
            # do not sort
            "drivers/xiaomi/printk_enhance/printk_enhance.c",
        ],
    )

def register_modules(registry):
    registry.register(
        name = "drivers/xiaomi/swinfo",
        out = "swinfo.ko",
        config = "CONFIG_MI_SOFTWARE_INFO",
        srcs = [
            # do not sort
            "drivers/xiaomi/swinfo/swinfo_func.c",
        ],

        deps = [
            "drivers/soc/qcom/minidump",
        ],

    )
 
