# SPDX-License-Identifier: GPL-2.0

# The compilers are complaining about unused variables inside an if(0) scope
# block. This is daft, shut them up.
ccflags-y += $(call cc-disable-warning, unused-but-set-variable)

# These files are disabled because they produce non-interesting flaky coverage
# that is not a function of syscall inputs. E.g. involuntary context switches.
KCOV_INSTRUMENT := n

# Disable KCSAN to avoid excessive noise and performance degradation. To avoid
# false positives ensure barriers implied by sched functions are instrumented.
KCSAN_SANITIZE := n
KCSAN_INSTRUMENT_BARRIERS := y

ifneq ($(CONFIG_SCHED_OMIT_FRAME_POINTER),y)
# According to Alan Modra <alan@linuxcare.com.au>, the -fno-omit-frame-pointer is
# needed for x86 only.  Why this used to be enabled for all architectures is beyond
# me.  I suspect most platforms don't need this, but until we know that for sure
# I turn this off for IA-64 only.  Andreas Schwab says it's also needed on m68k
# to get a correct value for the wait-channel (WCHAN in ps). --davidm
CFLAGS_core.o := $(PROFILING) -fno-omit-frame-pointer
endif

#
# Build efficiency:
#
# These compilation units have roughly the same size and complexity - so their
# build parallelizes well and finishes roughly at once:
#
obj-y += core.o
obj-y += fair.o
obj-y += build_policy.o
obj-y += build_utility.o
obj-$(CONFIG_ANDROID_VENDOR_HOOKS) += vendor_hooks.o
obj-$(CONFIG_SCHED_RT_INVARIANT_TEST) += test_ksched_football.o

def register_modules(registry):
    registry.register(
        name = "kernel/sched/walt/sched-walt-debug",
        out = "sched-walt-debug.ko",
        config = "CONFIG_SCHED_WALT_DEBUG",
        srcs = [
            # do not sort
            "kernel/sched/walt/walt_debug.c",
            "kernel/sched/walt/preemptirq_long.c",
            "kernel/sched/walt/preemptirq_long.h",
            "kernel/sched/walt/walt.h",
            "kernel/sched/walt/walt_debug.h",
            "kernel/sched/walt/voter.h",
        ],
    )

    registry.register(
        name = "kernel/sched/walt/sched-walt",
        out = "sched-walt.ko",
        config = "CONFIG_SCHED_WALT",
        srcs = [
            # do not sort
            "kernel/sched/walt/walt.c",
            "kernel/sched/walt/boost.c",
            "kernel/sched/walt/sched_avg.c",
            "kernel/sched/walt/walt_halt.c",
            "kernel/sched/walt/core_ctl.c",
            "kernel/sched/walt/trace.c",
            "kernel/sched/walt/input-boost.c",
            "kernel/sched/walt/sysctl.c",
            "kernel/sched/walt/cpufreq_walt.c",
            "kernel/sched/walt/fixup.c",
            "kernel/sched/walt/walt_lb.c",
            "kernel/sched/walt/walt_rt.c",
            "kernel/sched/walt/walt_cfs.c",
            "kernel/sched/walt/walt_tp.c",
            "kernel/sched/walt/walt_config.c",
            "kernel/sched/walt/voter.c",
            "kernel/sched/walt/walt_cpufreq_cycle_cntr_driver.c",
            "kernel/sched/walt/walt_gclk_cycle_counter_driver.c",
            "kernel/sched/walt/walt_cycles.c",
            "kernel/sched/walt/debugfs.c",
            "kernel/sched/walt/pipeline.c",
            "kernel/sched/walt/smart_freq.c",
            "kernel/sched/walt/walt_storage_lb.c",
            "kernel/sched/walt/mvp_locking.c",
            "kernel/sched/walt/midpoint.c",
            "kernel/sched/walt/perf_trace_counters.h",
            "kernel/sched/walt/trace.h",
            "kernel/sched/walt/walt.h",
            "kernel/sched/walt/voter.h",
            "kernel/sched/walt/sysctl_walt_stats.h",
            "drivers/misc/hwid/hwid.h",
        ],
        conditional_srcs = {
            "CONFIG_SCHED_WALT_STATS": {
                True: [
                    "kernel/sched/walt/sysctl_walt_stats.c",
                ],
            },
            "CONFIG_SCHED_WALT_MIDPOINT": {
               True: [
                    "kernel/sched/walt/midpoint.c",
	       ],
	    },
        },
        deps = [
            # do not sort
            "drivers/soc/qcom/socinfo",
            "drivers/soc/qcom/smem",
            "drivers/misc/hwid",
        ],
    )
