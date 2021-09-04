.PHONY : all

# CC = fcc
# C_FLAGS = -Kopenmp
# LD_FLAGS = -Kopenmp
CC = gcc
C_FLAGS = -fopenmp
LD_FLAGS = -fopenmp

NEON = TRUE
SVE = FALSE

ifeq ($(NEON),TRUE)
	OBJS += kernel_neon.o
	C_FLAGS += -D__NEON__	
endif

ifeq ($(SVE),TRUE)
	OBJS += kernel_sve.o
	C_FLAGS += -D__SVE__
endif

all: $(OBJS) main.c
	$(CC) $(C_FLAGS) -c main.c -o main.o
	$(CC) $(LD_FLAGS) $(OBJS) main.o -o main 

kernel_neon.o: kernel_neon.s	
	@if [ $(NEON) == TRUE ]; then \
		echo "compile NEON kernel..."; \
		$(CC) -c kernel_neon.s -o kernel_neon.o; \
	fi

kernel_sve.o: kernel_sve.s
	@if [ $(SVE) == TRUE ]; then \
		echo "compile SVE kernel..."; \
		$(CC) -c kernel_sve.s -o kernel_sve.o; \
	fi

clean:
	rm -rf main *.o