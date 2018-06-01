PFUNIT = /opt/pfunit/pfunit-serial
F90_VENDOR = GNU

include $(PFUNIT)/include/base.mk

FFLAGS += -ffree-form -std=f2008 -fimplicit-none -cpp -Wall -pedantic -fbounds-check -I$(PFUNIT)/mod
LIBS = $(PFUNIT)/lib/libpfunit$(LIB_EXT)

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

%.F90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

%.o: %.F90
	$(F90) $(FFLAGS) -c $<

test: testSuites.inc ../src/matrix_multiplication.o $(OBJS)
	$(F90) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include -I. \
		$(PFUNIT)/include/driver.F90 \
./*$(OBJ_EXT) $(LIBS) $(FFLAGS)