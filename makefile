ghoti:
ifeq ($(UNAME), win32)
	lsc -co .\dist\ .\src\*.ls
else
	lsc -co ./dist/ ./src/*.ls
endif

run:
ifeq ($(UNAME), win32)
	lsc .\src\index.ls whatis react
else
	lsc ./src/index.ls whatis react
endif

clean:
	del dist

cleanTEX:
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf