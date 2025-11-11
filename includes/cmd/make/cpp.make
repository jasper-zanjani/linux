CC = g++

all: hw

hw: hw.o
	${CC} -o hw hw.o

hw.o: hw.cpp
	${CC} -c hw.cpp

clean:
	rm *.o
