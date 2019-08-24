objs = f1.o f2.o
target = a.out
CC = gcc

$(target):$(objs)

	cc $(objs) -o a.out

f1.o:f1.h

	cc -c f1.c -o f1.o

f2.o:f2.h 

	cc -c f2.c -o f2.o

.PHINY:clean

clean:

	rm a.out f1.o f2.o
