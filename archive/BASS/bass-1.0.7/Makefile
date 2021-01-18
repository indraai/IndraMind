# Bass v2 Makefile

CC = gcc

LIBPCLOAK = libpcloak
LIBPCLOAK_DIR = $(LIBPCLOAK)
LIBPCLOAK_OBJ = $(LIBPCLOAK_DIR)/$(LIBPCLOAK).a

#BASS_LIBS = $(LIBPCLOAK_OBJ)
#BASS_INCLUDES = -I$(LIBPCLOAK_DIR)

BASS_DISTDIR = /usr/local/bass/

BASS_DEFS = -DBASS_DEFAULT_DISTDIR=\"$(BASS_DISTDIR)\"

# On Solaris you'll need to add *at least* these linker flags:
# -lnsl -lsocket -lresolv -lrpc (is that how the rpc library is called?)
#
# On Irix you'll need to... Hmmm...
#
# Forget it! I'm not going to fight Unix. Here's a nickel kid, go buy yourself
# a Linux distribution.

BASS_LIBS = 
BASS_INCLUDES = 

BASS_OBJS = BASS.o job.o log.o list.o xmalloc.o network.o icmp.o \
	readconf.o timeaux.o coward.o \
	cgi.o uname.o \
	bind.o imapd.o qpopper.o innd.o wingate.o \
	nfsmount_xdr.o rpc.o \
	$(BASS_LIBS)

all: BASS	

BASS: $(BASS_OBJS)
	$(CC) -o BASS $(BASS_OBJS) 

$(LIBPCLOAK_OBJ):
	cd $(LIBPCLOAK_DIR); $(MAKE) $(LIBPCLOAK).a

install:
	install -d $(BASS_DISTDIR)
	install -s -m 0755 BASS $(BASS_DISTDIR)
	install -m 0644 README $(BASS_DISTDIR)

clean:
	-rm -f *.o BASS
#	cd $(LIBPCLOAK_DIR); $(MAKE) clean

.c.o:
	$(CC) -pipe -c $(BASS_DEFS) $(BASS_INCLUDES) -O2 $<
  
BASS.o: cgihooks.h hooks.h BASS.h
bind.o: bind.h
cgi.o: cgi.h
icmp.o: icmp.h
imapd.o: imapd.h
innd.o: innd.h
job.o: job.h
list.o: list.h
log.o: log.h
network.o: network.h
coward.o: coward.h
qpopper.o: qpopper.h
readconf.o: readconf.h
rpc.o: rpc.h
timeaux.o: timeaux.h
uname.o: uname.h
wingate.o: wingate.h
xmalloc.o: xmalloc.h
