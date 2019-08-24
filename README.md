# makefile
----------
*make is a tool which is used to intrepret makefile*
*makefile bringing the benifit can auto-compile objects*
----------

### target:prerequisites
### command
----------
##### simple example
-cmd will make script continue executing when it match a errors

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

#####  derivation2  Target to obj : N to 1     easy to write but hard to know the dependency

objs = f1.o f2.o
target = a.out
CC = gcc

$(target):$(objs)

	cc $(objs) -o a.out

f1.o f3.o:f1.h


f3.o f2.o:f2.h 

.PHINY:clean   '''it mean chean is a presudo target''' 

clean:

	-rm a.out $(objs)

### makefile contains:
1.     显式规则。显式规则说明了，如何生成一个或多的的目标文件。这是由Makefile的书写者明显指出，要生成的文件，文件的依赖文件，生成的命令。
   
2.    隐晦规则。由于我们的make有自动推导的功能，所以隐晦的规则可以让我们比较粗糙地简略地书写Makefile，这是由make所支持的。

3.   变量的定义。在Makefile中我们要定义一系列的变量，变量一般都是字符串，这个有点你C语言中的宏，当Makefile被执行时，其中的变量都会被扩展到相应的引用位置上。

4.  文件指示。其包括了三个部分，一个是在一个Makefile中引用另一个Makefile，就像C语言中的include一样；另一个是指根据某些情况指定Makefile中的有效部分，就像C语言中的预编译#if一样；还有就是定义一个多行的命令。有关这一部分的内容，我会在后续的部分中讲述。

5.  注释。Makefile中只有行注释，和UNIX的Shell脚本一样，其注释是用“#”字符，这个就像C/C++中的“//”一样。如果你要在你的Makefile中使用“#”字符，可以用反斜框进行转义，如：“\#”。


##### makefile will search current dir to oderly find "GNUmakefile", "makefile". "MakeFile" to build
project. you can also usr <code>make -f --filename</code>to use spcify file 
------------
##### include <filename>  such as: include foo.mk bar.mk *.mk $(mk) '''$(mk) = somefile.mk'''
-------------
##### gnumake work 

1. load makefiles

2. load other makefiles include by <code>include</code>

3. init var in the file

4. deriving all conceal rules

5. crate dependence links for all target

6. decide to generate targets according to dependency relationship

7.exec

### VPATH = ...     make will search file in VPATH

### presudo target should be executed as commend



### %.o pattern file named xx.o    '''*.o ...'''
#...


