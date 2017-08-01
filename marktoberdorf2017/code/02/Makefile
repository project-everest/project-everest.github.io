# FSTAR_HOME=C:/cygwin64/home/fournet/everest/FStar

include $(FSTAR_HOME)/ulib/ml/Makefile.include

all:
	fstar.exe --verify_all Fact.fst Fun.fst Types.fst Purity.fst Divergence.fst DivergenceEvalClosed.fst Rev.fst AppendLength.fst Stack.fst StackClient.fst RefinedStackClient.fst RefinedStack.fst  AbstractStack.fst AbstractStackClient.fst

divergence: Divergence.fst
#	$(MAKE) -C $(ULIB_ML)
	mkdir -p out
	fstar.exe $(FSTAR_DEFAULT_ARGS) --odir out --codegen OCaml Divergence.fst
	$(OCAMLOPT) out/Divergence.ml -w p -o Divergence.exe
	./Divergence.exe

clean:
	rm -dfr *~ *.exe out
