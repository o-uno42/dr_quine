NAME = Sully.c
CC = gcc
CFLAGS = -Wall -Wextra -Werror
all:
	$(CC) $(CFLAGS) $(NAME) -o ./Sully
	./Sully
	diff $(NAME) Sully_0.c
clean:
	rm -f Sully_[0-4].c Sully
re: clean all
.PHONY: all clean re