NAME = Colleen.py
all:
	python3 $(NAME) > output.py ; diff $(NAME) output.py
clean:
	rm -f output.py
re: clean all
.PHONY: all clean re