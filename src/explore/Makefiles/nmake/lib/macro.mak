# -*- makefile -*- Time-stamp: <04/03/22 22:17:22 ptr>
# $Id$

DBG_SUFFIX = debug

# Shared libraries:

SO_NAME        = $(LIBNAME)_$(COMPILER_NAME).$(SO)
LIB_NAME        = $(LIBNAME)_$(COMPILER_NAME).$(LIBEXT)
EXP_NAME        = $(LIBNAME)_$(COMPILER_NAME).$(EXP)
PDB_NAME        = $(LIBNAME).pdb
RES_NAME        = $(LIBNAME).res

SO_NAME_OUT    = $(OUTPUT_DIR)\$(SO_NAME)
LIB_NAME_OUT    = $(OUTPUT_DIR)\$(LIB_NAME)
EXP_NAME_OUT    = $(OUTPUT_DIR)\$(EXP_NAME)
PDB_NAME_OUT    = $(OUTPUT_DIR)\$(PDB_NAME)
RES_NAME_OUT    = $(OUTPUT_DIR)\$(RES_NAME)

SO_NAME_DBG    = $(LIBNAME)_$(COMPILER_NAME)_$(DBG_SUFFIX).$(SO)
LIB_NAME_DBG    = $(LIBNAME)_$(COMPILER_NAME)_$(DBG_SUFFIX).$(LIBEXT)
EXP_NAME_DBG    = $(LIBNAME)_$(COMPILER_NAME)_$(DBG_SUFFIX).$(EXP)

SO_NAME_OUT_DBG    = $(OUTPUT_DIR_DBG)\$(SO_NAME_DBG)
LIB_NAME_OUT_DBG    = $(OUTPUT_DIR_DBG)\$(LIB_NAME_DBG)
EXP_NAME_OUT_DBG    = $(OUTPUT_DIR_DBG)\$(EXP_NAME_DBG)
PDB_NAME_OUT_DBG    = $(OUTPUT_DIR_DBG)\$(PDB_NAME)
RES_NAME_OUT_DBG    = $(OUTPUT_DIR_DBG)\$(RES_NAME)

SO_NAME_STLDBG    = $(LIBNAME)_$(COMPILER_NAME)_stl$(DBG_SUFFIX).$(SO)
LIB_NAME_STLDBG    = $(LIBNAME)_$(COMPILER_NAME)_stl$(DBG_SUFFIX).$(LIBEXT)
EXP_NAME_STLDBG    = $(LIBNAME)_$(COMPILER_NAME)_stl$(DBG_SUFFIX).$(EXP)

SO_NAME_OUT_STLDBG   = $(OUTPUT_DIR_STLDBG)\$(SO_NAME_STLDBG)
LIB_NAME_OUT_STLDBG    = $(OUTPUT_DIR_STLDBG)\$(LIB_NAME_STLDBG)
EXP_NAME_OUT_STLDBG    = $(OUTPUT_DIR_STLDBG)\$(EXP_NAME_STLDBG)
PDB_NAME_OUT_STLDBG    = $(OUTPUT_DIR_STLDBG)\$(PDB_NAME)
RES_NAME_OUT_STLDBG    = $(OUTPUT_DIR_STLDBG)\$(RES_NAME)

# Static libraries:
A_NAME = $(LIBNAME)_$(COMPILER_NAME)_static.$(ARCH)
A_NAME_OUT = $(OUTPUT_DIR_A)\$(A_NAME)
A_PDB_NAME_OUT = $(OUTPUT_DIR_A)\$(PDB_NAME)

A_NAME_DBG = $(LIBNAME)_$(COMPILER_NAME)_$(DBG_SUFFIX)_static.$(ARCH)
A_NAME_OUT_DBG = $(OUTPUT_DIR_A_DBG)\$(A_NAME_DBG)
A_PDB_NAME_OUT_DBG = $(OUTPUT_DIR_A_DBG)\$(PDB_NAME)

A_NAME_STLDBG = $(LIBNAME)_$(COMPILER_NAME)_stl$(DBG_SUFFIX)_static.$(ARCH)
A_NAME_OUT_STLDBG = $(OUTPUT_DIR_A_STLDBG)\$(A_NAME_STLDBG)
A_PDB_NAME_OUT_STLDBG = $(OUTPUT_DIR_A_STLDBG)\$(PDB_NAME)

