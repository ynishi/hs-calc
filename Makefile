.PHONY: test

re:
	cabal repl

run:
	cabal run

test:
	cabal test

fmt:
	fourmolu -i app src
