NAME = Colleen.s
NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
all:
	$(NASM) $(NASMFLAGS) $(NAME) -o Colleen.o
	$(CC) Colleen.o -o a.out
	./a.out > tmp_Colleen
	diff $(NAME) tmp_Colleen
clean:
	rm -f Colleen.o tmp_Colleen a.out 
re: clean all
.PHONY: all clean re