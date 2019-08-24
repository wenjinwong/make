# makefile
----------
*make is a tool which is used to intrepret makefile*
*makefile bringing the benifit can auto-compile objects*
----------

### target:prerequisites
### command
----------
##### simple example

a.out:f1.o f2.o

	cc f1.o f2.o -o a.out

f1.o:f1.h

	cc -c f1.c -o f1.o

f2.o:f2.h 

	cc -c f2.c -o f2.o

clean:

	rm a.out f1.o f2.o

##### use varible to replace target

objs = f1.o f2.o

target = a.out

CC = gcc

$(target):$(objs)
	
	cc $(objs) -o a.out

f1.o:f1.h

	cc -c f1.c -o f1.o

f2.o:f2.h 

	cc -c f2.c -o f2.o

clean:

	rm a.out f1.o f2.o
##### makefile's magic----atuo derivation 
##### so you can simplify it as this 

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
