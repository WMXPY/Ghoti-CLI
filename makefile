ls := lsc -co

ghoti: logs.ls static.ls structure.ls
ifeq ($(UNAME), win32)
	$(ls) .\dist\ .\src\*.ls
else
	$(ls) ./dist/ ./src/*.ls
endif

logs.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\logs\ .\src\logs\*.ls
else
	$(ls) ./dist/logs/ ./src/logs/*.ls
endif

static.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\static\ .\src\static\*.ls
else
	$(ls) ./dist/static/ ./src/static/*.ls
endif

structure.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\structure\ .\src\structure\*.ls
else
	$(ls) ./dist/structure/ ./src/structure/*.ls
endif

run:
ifeq ($(UNAME), win32)
	lsc .\src\index.ls
else
	lsc ./src/index.ls
endif

clean:
ifeq ($(UNAME), win32)
	del .\dist
	del *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
else
	rm -rf ./dist
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
endif
