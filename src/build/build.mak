###########################################################################
#
#   build.mak
#
#   MAME build tools makefile
#
#   Copyright Nicola Salmoria and the MAME Team.
#   Visit http://mamedev.org for licensing and usage restrictions.
#
###########################################################################

OBJDIRS += \
	$(BUILDOBJ) \



#-------------------------------------------------
# set of build targets
#-------------------------------------------------

MAKEDEP_TARGET = $(BUILDOUT)/makedep$(BUILD_EXE)
MAKEMAK_TARGET = $(BUILDOUT)/makemak$(BUILD_EXE)
MAKELIST_TARGET = $(BUILDOUT)/makelist$(BUILD_EXE)
PNG2BDC_TARGET = $(BUILDOUT)/png2bdc$(BUILD_EXE)
VERINFO_TARGET = $(BUILDOUT)/verinfo$(BUILD_EXE)

MAKEDEP = $(MAKEDEP_TARGET)
MAKEMAK = $(MAKEMAK_TARGET)
MAKELIST = $(MAKELIST_TARGET)
PNG2BDC = $(PNG2BDC_TARGET)
VERINFO = $(VERINFO_TARGET)

ifneq ($(CROSS_BUILD),1)
BUILD += \
	$(MAKEDEP_TARGET) \
	$(MAKEMAK_TARGET) \
	$(MAKELIST_TARGET) \
	$(PNG2BDC_TARGET) \
	$(VERINFO_TARGET) \

# makedep
#-------------------------------------------------

MAKEDEPOBJS = \
	$(BUILDOBJ)/makedep.o \
	$(OBJ)/lib/util/astring.o \
	$(OBJ)/lib/util/corealloc.o \
	$(OBJ)/lib/util/corefile.o \
	$(OBJ)/lib/util/unicode.o \
	$(OBJ)/lib/util/tagmap.o \

$(MAKEDEP_TARGET): $(MAKEDEPOBJS) $(LIBUTIL) $(LIBOCORE) $(ZLIB) $(FLAC_LIB)
	@echo Linking $@...
	$(NATIVELD) $(NATIVELDFLAGS) $^ $(LIBS) -o $@



#-------------------------------------------------
# makemak
#-------------------------------------------------

MAKEMAKOBJS = \
	$(BUILDOBJ)/makemak.o \
	$(OBJ)/lib/util/astring.o \
	$(OBJ)/lib/util/corealloc.o \
	$(OBJ)/lib/util/corefile.o \
	$(OBJ)/lib/util/corestr.o \
	$(OBJ)/lib/util/unicode.o \
	$(OBJ)/lib/util/tagmap.o \

$(MAKEMAK_TARGET): $(MAKEMAKOBJS) $(LIBOCORE) $(ZLIB)
	@echo Linking $@...
	$(NATIVELD) $(NATIVELDFLAGS) $^ $(LIBS) -o $@



#-------------------------------------------------
# makelist
#-------------------------------------------------

MAKELISTOBJS = \
	$(BUILDOBJ)/makelist.o \
	$(OBJ)/lib/util/astring.o \
	$(OBJ)/lib/util/corealloc.o \
	$(OBJ)/lib/util/cstrpool.o \
	$(OBJ)/lib/util/corefile.o \
	$(OBJ)/lib/util/unicode.o \
	$(OBJ)/lib/util/tagmap.o \

$(MAKELIST_TARGET): $(MAKELISTOBJS) $(LIBOCORE) $(ZLIB)
	@echo Linking $@...
	$(NATIVELD) $(NATIVELDFLAGS) $^ $(LIBS) -o $@



#-------------------------------------------------
# png2bdc
#-------------------------------------------------

PNG2BDCOBJS = \
	$(BUILDOBJ)/png2bdc.o \
	$(OBJ)/lib/util/astring.o \
	$(OBJ)/lib/util/corefile.o \
	$(OBJ)/lib/util/corealloc.o \
	$(OBJ)/lib/util/bitmap.o \
	$(OBJ)/lib/util/png.o \
	$(OBJ)/lib/util/palette.o \
	$(OBJ)/lib/util/unicode.o \

$(PNG2BDC_TARGET): $(PNG2BDCOBJS) $(LIBUTIL) $(LIBOCORE) $(ZLIB) $(FLAC_LIB) $(7Z_LIB)
	@echo Linking $@...
	$(NATIVELD) $(NATIVELDFLAGS) $^ $(LIBS) -o $@



#-------------------------------------------------
# verinfo
#-------------------------------------------------

VERINFOOBJS = \
	$(BUILDOBJ)/verinfo.o

$(VERINFO_TARGET): $(VERINFOOBJS) $(LIBOCORE) $(FLAC_LIB) $(7Z_LIB)
	@echo Linking $@...
	$(NATIVELD) $(NATIVELDFLAGS) $^ $(LIBS) -o $@

endif # CROSS_BUILD
