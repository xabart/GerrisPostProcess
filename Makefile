CC = gcc
CFLAGS = -fPIC  -O2  
SOURCEGTS= /home/WRL/xavier/SOFT/Gerris/gts-stable/src/gerris-stable/src/
SOURCEGERRIS= /home/WRL/xavier/SOFT/Gerris/gerris-stable/src/

INCLUDEGTS =/opt/Gerris/Gts/include/
LIBGTS =/opt/Gerris/Gts/lib/

INCLUDEGERRIS1 =/opt/Gerris/Gerris/include/
INCLUDEGERRIS2 =/opt/Gerris/Gerris/include/gerris
LIBGERRIS=/opt/Gerris/Gerris/lib/

INCLUDEGLIB1=/usr/include/glib-2.0/
INCLUDEGLIB2=/usr/include/glib-2.0/glib/
INCLUDEGLIB3=/usr/lib/x86_64-linux-gnu/glib-2.0/include
INCLUDEGLIB4=/usr/include/glib-2.0/gio/
INCLUDEGLIB5=/usr/include/glib-2.0/gobject/
INCLUDEGLIB= -I$(INCLUDEGLIB1) -I$(INCLUDEGLIB2) -I$(INCLUDEGLIB3) -I$(INCLUDEGLIB4) -I$(INCLUDEGLIB5)

INCLUDEGLIB=$(shell pkg-config --cflags glib-2.0)

LIBGLIB=/usr/lib/x86_64-linux-gnu/


TOTALINCLUDE=-I$(INCLUDEGTS) -I$(INCLUDEGERRIS1) -I$(INCLUDEGERRIS2) $(INCLUDEGLIB) 



PROG = GerrisPostProcess
OBJS = ReadGFSFiles.o
SRCS = ReadGFSFiles.c
all: $(OBJS)
	$(CC) $(CFLAGS)  -o  $(PROG) $(OBJS) $(TOTALINCLUDE)  \
	  -L$(LIBGTS) -lgts -L$(LIBGERRIS) -lgfs2D -L$(LIBGLIB) -lglib-2.0 -lm

force:
	touch $(SRCS) 
	@$(MAKE)

.c.o:
	$(CC) $(CFLAGS) -c $*.c $(TOTALINCLUDE) \
	   -L$(LIBGTS) -lgts -L$(LIBGERRIS) -lgfs2D -L$(LIBGLIB) -lglib-2.0 -lm
