NAME = Colleen.s
NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
all:
	$(NASM) $(NASMFLAGS) $(NAME) -o Colleen.o
	$(CC) Colleen.o -o a.out
	./a.out > output.s
	diff $(NAME) output.s
clean:
	rm -f Colleen.o output.s a.out 
re: clean all
.PHONY: all clean re