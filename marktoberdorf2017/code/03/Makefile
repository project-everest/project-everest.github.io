# FSTAR_HOME=C:/cygwin64/home/fournet/everest/FStar

include $(FSTAR_HOME)/ulib/ml/Makefile.include

all:
	fstar.exe --verify_all IncrST.fst SwapRunST.fst SwapVerifyST.fst CountST.fst FibonacciST.fst SumST.fst InvariantsST.fst CounterMST.fst SimpleLogMST.fst InitFreezeMST.fst

swap:
	$(MAKE) -C $(ULIB_ML)
	mkdir -p out
	fstar.exe $(FSTAR_DEFAULT_ARGS) --odir out --codegen OCaml SwapRun.fst
	$(OCAMLOPT) out/SwapRun.ml -o SwapRun.exe
	./SwapRun.exe

clean:
	rm -dfr *~ *.exe out
