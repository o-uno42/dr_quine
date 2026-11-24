NAME = Colleen.c
CC = gcc
CFLAGS = -Wall -Wextra -Werror
all:
	$(CC) $(CFLAGS) $(NAME) -o a.out
	./a.out > tmp_Colleen
	diff $(NAME) tmp_Colleen
clean:
	rm -f tmp_Colleen a.out
re: clean all
.PHONY: all clean re