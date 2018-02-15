ghoti:
	lsc -co .\dist\ .\src\index.ls

run:
	lsc ./src/index.ls

clean:
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf