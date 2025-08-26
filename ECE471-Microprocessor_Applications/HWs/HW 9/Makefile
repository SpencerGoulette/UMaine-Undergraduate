CC = gcc
CFLAGS = -g -O2 -Wall
LFLAGS =


all:	display_temp

###

temp_cool.o:	temp_cool.c
	$(CC) $(CFLAGS) -c temp_cool.c

###

display_temp:	display_temp.o temp_cool.o
	$(CC) $(LFLAGS) -o display_temp display_temp.o temp_cool.o

display_temp.o:	display_temp.c
	$(CC) $(CFLAGS) -c display_temp.c


submit:	display_temp.c fakedate temp_cool.c temp_cool.h sensor_name.h README Makefile
	tar -czvf hw9_submit.tar.gz display_temp.c fakedate temp_cool.c temp_cool.h sensor_name.h README Makefile

clean:	
	rm -f *~ *.o display_temp display_final display_cool temp_cool

