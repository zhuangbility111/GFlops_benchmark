all: test.S main.c
	as -o test.o test.S
	gcc -c main.c
	gcc -o main main.o test.o 

clean:
	rm -rf main *.o