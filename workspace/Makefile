CROSS ?= /opt/gcc-arm-none-eabi-4_8-2014q1/bin/arm-none-eabi-
AR = $(CROSS)ar
LD = $(CROSS)ld
CC = $(CROSS)gcc
OBJCOPY = $(CROSS)objcopy

WORKSPACE_DIR = $(abspath ./)
STM32_LIB_DIR = $(abspath ../STM32F10x_StdPeriph_Lib_V3.5.0/)

STM32_LIB_SRCS += $(wildcard $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/CoreSupport/*.c)
STM32_LIB_SRCS += $(wildcard $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/*.c)
STM32_LIB_SRCS += $(wildcard $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/src/*.c)
STM32_LIB_OBJS = $(patsubst %.c,%.o,$(STM32_LIB_SRCS))

STM32_LIB_INCS += $(STM32_LIB_DIR)/Libraries/STM32F10x_StdPeriph_Driver/inc
STM32_LIB_INCS += $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/CoreSupport
STM32_LIB_INCS += $(STM32_LIB_DIR)/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x

STM32_STARTUP = $(patsubst %.s,%.o,$(wildcard $(WORKSPACE_DIR)/startup/*.s))

EXEC = template
PROJECT_SRCS = $(wildcard $(WORKSPACE_DIR)/src/*.c)
PROJECT_OBJS = $(patsubst %.c,%.o,$(PROJECT_SRCS))

CFLAGS += -mthumb -mcpu=cortex-m3 -mfix-cortex-m3-ldrd
CFLAGS += -DSTM32F10X_HD -DHSE_VALUE=8000000 -DUSE_STDPERIPH_DRIVER
CFLAGS += $(addprefix -I,$(STM32_LIB_INCS)) -I./inc

LDFLAGS += -T"$(WORKSPACE_DIR)/stm32_flash.ld" -mthumb -mcpu=cortex-m3 -mfix-cortex-m3-ldrd -Wl,-Map=$(EXEC).map -Wl,-cref -Wl,--gc-sections

ifeq ($(DEBUG), 1)
	Q = 
else
	Q = @
endif

all: check project

check:
ifndef PROJECT
	$(error "Usage: make PROJECT=<name>")
endif

project: lib

lib:

standlone: $(EXEC).elf
	
$(EXEC).elf: $(STM32_LIB_OBJS) $(PROJECT_OBJS) $(STM32_STARTUP)
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	$(Q) $(RM) -v $(STM32_LIB_OBJS)
	$(Q) $(RM) -v $(PROJECT_OBJS)
	$(Q) $(RM) -v $(STM32_STARTUP)
	$(Q) $(RM) -v $(EXEC).elf $(EXEC).bin $(EXEC).hex $(EXEC).map


%.bin: %.elf
	$(Q) printf "[OBJC] $< --> $@"
	$(Q) $(OBJCOPY) -S -O binary $@ $<
	$(Q) printf "\t\t... [ok]\n"

%.hex: %.elf
	$(Q) printf "[OBJC] $< --> $@"
	$(Q) $(OBJCOPY) -S -O ihex $@ $<
	$(Q) printf "\t\t... [ok]\n"

%.o: %.c
	$(Q) printf "[GCC ] $@"
	$(Q) $(CC) $(CFLAGS) -o $@ -c $<
	$(Q) printf "\t\t... [ok]\n"

%.o: %.s
	$(Q) printf "[GCC ] $@"
	$(Q) $(CC) $(CFLAGS) -o $@ -c $<
	$(Q) printf "\t\t... [ok]\n"
