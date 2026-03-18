EMACS ?= emacs

test:
	$(EMACS) -Q --batch -L . -l test/nnlisput.el -f ert-run-tests-batch-and-exit

.PHONY: test
