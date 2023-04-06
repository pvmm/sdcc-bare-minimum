SDCC := /usr/local/bin/sdcc
SDASZ80 := /usr/local/bin/sdasz80
HEX2BIN := hex2bin

APP_IHX := testing.ihx
APP_COM := $(patsubst %.ihx,%.com,$(APP_IHX))
CFLAGS := --no-std-crt0
C_SOURCES := $(wildcard *.c)
$(info C SOURCES: $(C_SOURCES))
ASM_SOURCES := $(wildcard *.s)
$(info ASM SOURCES: $(ASM_SOURCES))
C_OBJECTS := $(patsubst %.c,%.rel, $(C_SOURCES))
$(info C OBJECTS: $(C_OBJECTS))
ASM_OBJECTS := $(patsubst %.s,%.rel, $(ASM_SOURCES))
$(info ASM OBJECTS: $(ASM_OBJECTS))

all: $(APP_COM)

$(APP_COM) : $(APP_IHX)
	$(HEX2BIN) -e com $<

$(APP_IHX) : $(C_OBJECTS) $(ASM_OBJECTS)
	$(SDCC) -mz80 $(CFLAGS) -o $@ $^

%.rel: %.c
	$(SDCC) -mz80 $(CFLAGS) -o $@ -c $<

%.rel: %.s
	$(SDASZ80) -o $@ $<

clean:
	rm -f *.rel testing.ihx *.lk *.map *.lst *.rst *.mem *.asm *.sym
