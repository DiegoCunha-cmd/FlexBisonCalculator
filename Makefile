calculadora: FBCalculadora.y FBCalculadora.l
	bison -d FBCalculadora.y
	flex -o FBCalculadora.lex.c FBCalculadora.l
	gcc -o FBCalculadora FBCalculadora.lex.c FBCalculadora.tab.c -lfl

clean:
	rm -f FBCalculadora.lex.c FBCalculadora.tab.c FBCalculadora.tab.h