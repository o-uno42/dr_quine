NAME = Sully.s
NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
all:
	$(NASM) $(NASMFLAGS) $(NAME) -o Sully.o
	$(CC) Sully.o -o a.out
	./a.out
	diff $(NAME) Sully_0.s
clean:
	rm -f Sully_[0-4].s Sully.o Sully a.out 
re: clean all
.PHONY: all clean re