include $(MAKEFILE_COMMON)

EXEC = template
SRCS = $(wildcard ./*.c)
OBJS = $(patsubst %.c,%.o,$(SRCS)) $(STM32_STARTUP_OBJ)

LDFLAGS += -Wl,-Map=$(EXEC).map

all: check $(EXEC)

$(EXEC): $(EXEC).bin $(EXEC).hex
$(EXEC).bin $(EXEC).hex: $(EXEC).elf
$(EXEC).elf: $(OBJS)

check:
ifeq ($(MAKELEVEL),0)
	$(error "You must make from top directory of workspace")
endif

download:

clean:
	$(Q) $(RM) -v $(EXEC).elf $(EXEC).bin $(EXEC).hex $(EXEC).map
	$(Q) $(RM) -v $(OBJS)
	$(Q) $(RM) -v $(STM32_STARTUP_OBJ)

.PHONY: clean distclean download lib all check project
