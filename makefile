TARGET= main

SRC= src
INC= inc
BIN= bin
OBJS= objs
LIB=lib
LIBFILE=libfile2.a

SOURCE = $(wildcard $(SRC)/*.c)

_OBJ_FILES= file_1.o file_2.o main.o
OBJECT = $(patsubst %,$(OBJS)/%,$(_OBJ_FILES))

CC= gcc
CFLAGS= -Wall -Iinc -std=gnu99

$(BIN)/$(TARGET) : $(OBJECT) $(LIB)/$(LIBFILE)
	$(CC) -o $@ $^

$(OBJS)/%.o : $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@


$(LIB)/$(LIBFILE): 
	ar rcs $@ $(OBJS)/file_2.o

clean :
	rm objs/* bin/*
