# Variables
CC=clang
CFLAGS=-g -Wall
SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

BINDIR=bin
BIN=$(BINDIR)/main
ZIPNAME=ml-c.zip

# Rules
all:$(BIN)

release:CFLAGS=-Wall -O2 -DNDEBUG
release:clean
release:$(BIN)

$(BIN): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(OBJS) -o $@

# Compile the .o files, produces .o files from .c
$(OBJ)/%.o: $(SRC)/%.c
	@mkdir -p $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BINDIR) $(OBJ) $(ZIPNAME)

zip:
	$(RM) $(ZIPNAME)
	zip $(ZIPNAME) $(BIN)