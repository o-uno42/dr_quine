NAME = Colleen.c
CC = gcc
CFLAGS = -Wall -Wextra -Werror
all:
	$(CC) $(CFLAGS) $(NAME) -o a.out
	./a.out > output.c
	diff $(NAME) output.c
clean:
	rm -f output.c a.out
re: clean all
.PHONY: all clean re