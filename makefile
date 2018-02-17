ghoti:
ifeq ($(UNAME), win32)
	lsc -co .\dist\ .\src\*.ls
else
	lsc -co ./dist/ ./src/*.ls
endif

run:
ifeq ($(UNAME), win32)
	lsc .\src\index.ls -t react
else
	lsc ./src/index.ls -t react
endif

clean:
	del dist

cleanA:
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf