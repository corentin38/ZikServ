BIN     = ./bin
INCLUDE = ./include
LIB		= ./lib
SRC     = ./src
OBJ		= ./obj

CC      = gcc
CFLAGS  = -W -Wall -Wextra -pedantic -I$(INCLUDE)
DEBUG   = -g -pg -DNDEBUG

OUTPUT  = ZikServ

.PHONY  = all

all : main clean

clean :
	rm -rf $(OBJ)/*.o $(INCLUDE)/*~ $(SRC)/*~
distclean : clean
	rm -f $(BIN)/$(OUTPUT)
archive : distclean
	cd .. ; tar cvfz marciau_tamisier_tp.tgz tp/

# Compilation

main : $(OBJ)/main.o
	$(CC) $^ -o $(BIN)/$(OUTPUT) -lulfius

$(OBJ)/%.o : $(SRC)/%.c
	$(CC) $(CFLAGS) $(DEBUG) -c $< -o $@
