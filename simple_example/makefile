a:a.o
	gcc a.o -o a
a.o:a.s
	gcc -c a.s -o a.o
a.s:a.i
	gcc -S a.i -o a.s
a.i:c.c
	gcc -E c.c -o a.i
clean:
	rm a.o a.s a.i 
