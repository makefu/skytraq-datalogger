CC      = /usr/bin/gcc
CFLAGS  = -Wall -g 
LDFLAGS = -lm -lcurl
PREFIX  = usr/bin/
DESTDIR = 

OBJ = datalogger.o lowlevel.o datalog-decode.o main.o agps-download.o

PROG = skytraq-datalogger

$(PROG): $(OBJ)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJ) $(LDFLAGS)

test: $(OBJ) test.o
	$(CC) $(CFLAGS) -o test test.o $(LDFLAGS) datalogger.o lowlevel.o datalog-decode.o  agps-download.o

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(PROG) test

install:
	cp  $(PROG)  $(DESTDIR)/$(PREFIX)
