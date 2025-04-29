# Makefile - NEON/SVE Build Controller (POSIX-compliant)

.PHONY: all clean

# Compiler and flags
CC = gcc
C_FLAGS = -fopenmp
LD_FLAGS = -fopenmp

# Default values
NEON ?= TRUE
SVE ?= FALSE

# Object files
OBJS =

# Check user input to control NEON/SVE compilation
ifeq ($(NEON),TRUE)
    OBJS += kernel_neon.o
    C_FLAGS += -D__NEON__
endif

ifeq ($(SVE),TRUE)
    OBJS += kernel_sve.o
    C_FLAGS += -D__SVE__
endif

# Default build target
all: main

main: $(OBJS) main.o
	$(CC) $(LD_FLAGS) $(OBJS) main.o -o main

main.o: main.c
	$(CC) $(C_FLAGS) -c main.c -o main.o

kernel_neon.o: kernel_neon.s
	@if [ "$(NEON)" = "TRUE" ]; then \
		echo "Compiling NEON kernel..."; \
		$(CC) -c kernel_neon.s -o kernel_neon.o; \
	else \
		echo "Skipping NEON kernel..."; \
	fi

kernel_sve.o: kernel_sve.s
	@if [ "$(SVE)" = "TRUE" ]; then \
		echo "Compiling SVE kernel..."; \
		$(CC) -c kernel_sve.s -o kernel_sve.o; \
	else \
		echo "Skipping SVE kernel..."; \
	fi

# Clean build artifacts
clean:
	rm -f main *.o

