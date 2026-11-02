NAME = Grace.s
NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
all:
	$(NASM) $(NASMFLAGS) $(NAME) -o Grace.o
	$(CC) Grace.o -o a.out
	./a.out
	diff $(NAME) Grace_kid.s
clean:
	rm -f Grace.o Grace_kid.s a.out 
re: clean all
.PHONY: all clean re