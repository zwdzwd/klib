CC     = gcc
AR     = ar
CFLAGS = -g -Wall -O2

# leave out for conflict with htslib when compiled by OSX clang
BGZF_OBJ = \
	bgzf.o

KLIB_OBJS = \
	kexpr.o \
	khmm.o \
	kmath.o \
	knetfile.o \
	knhx.o \
	kopen.o \
	ksa.o \
	kson.o \
	kstring.o \
	ksw.o \
	kthread.o \
	kurl.o

build: klib.a

.c.o :
	$(CC) -c $(CFLAGS) $< -o $@

klib.a: $(KLIB_OBJS) $(BGZF_OBJ)
	@-rm -f $@
	$(AR) -csr $@ $^

klib2.a: $(KLIB_OBJS)
	@-rm -f $@
	$(AR) -csr $@ $^

clean:
	rm -f *.o **/*.o

purge: clean
	rm -f *.a **/*.a

cleanhist:
	rm -rf .git .gitignore
