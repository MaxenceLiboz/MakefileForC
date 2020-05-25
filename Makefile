CC = gcc
SRCSDIR = srcs/
OBJSDIR = includes/

NAME = main

SOURCES = $(wildcard $(SRCSDIR)*.c)
OBJS =  $(addprefix ./, $(SOURCES:%.c=%.o))

all: main

main: libft.a main.c
	$(CC) main.c $< -o $@
	./main 

libft.a : $(OBJS) 
	ar rc $@ $^

$(SRCSDIR)%.o: $(SRCSDIR)%.c $(OBJSDIR)%.h
	$(CC) -c $< -o $@

clean:
	/bin/rm -f srcs/*.o

fclean: clean
	/bin/rm -f main	

re: fclean all
