NAME = Grace.c
CC = gcc
CFLAGS = -Wall -Wextra -Werror
all:
	$(CC) $(CFLAGS) $(NAME) -o a.out
	./a.out
	diff $(NAME) Grace_kid.c
clean:
	rm -f Grace_kid.c a.out
re: clean all
.PHONY: all clean re