# based on
# http://stackoverflow.com/questions/1484817/how-do-i-make-a-simple-makefile-gcc-unix

TARGET = main
CC = gcc
CFLAGS += -Wall -ansi -std=c99 -pedantic -lm

.PHONY: default all clean

# first target is selected as default by gnu make
default: $(TARGET)
all: default

# create a list of files (ending with .o) based on all .c files
OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
# select all header files
HEADERS = $(wildcard *.h)

# object files for all .c files (header files included)
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

# create executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall -o $@

# clean all object files
clean:
	rm -f *.o