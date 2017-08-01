# FSTAR_HOME=C:/cygwin64/home/fournet/everest/FStar

include $(FSTAR_HOME)/ulib/ml/Makefile.include

all: init-freeze
	fstar.exe --verify_all Incr.fst Ex04c.fst RefinedStackLengthClient.fst RefinedStackLength.fst FactorialST.fst

init-freeze:
	fstar.exe --include ../code/03 --verify_all InitFreeze.fst
