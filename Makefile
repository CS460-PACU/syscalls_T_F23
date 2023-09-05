#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: 
# Purpose:    
#############################################################################

ENSCRIPT_FLAGS_C=-C -T 2 -p - -M Letter -Ec --color -fCourier8
VALGRIND_FLAGS=-v --leak-check=yes --track-origins=yes --leak-check=full --show-leak-kinds=all 


all: bin bin/main

bin:
	mkdir -p bin

bin/main: bin/main.o
	gcc -o bin/main -g -Wall bin/main.o

bin/main.o: bin src/main.c
	gcc -c -o bin/main.o -g -Wall src/main.c

valgrind: bin/main
	valgrind ${VALGRIND_FLAGS} bin/main

printMain: bin
	enscript ${ENSCRIPT_FLAGS} src/main.c  | ps2pdf - bin/main.pdf

runTest: bin/main
	bin/main /etc/passwd

clean:
	rm -f bin/*
