ls := lsc -co

ghoti: log.ls static.ls func.ls structure.ls ame.ls game.ls
ifeq ($(UNAME), win32)
	$(ls) .\dist\ .\src\*.ls
else
	$(ls) ./dist/ ./src/*.ls
endif

log.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\log\ .\src\log\*.ls
else
	$(ls) ./dist/log/ ./src/log/*.ls
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

func.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\func\ .\src\func\*.ls
else
	$(ls) ./dist/func/ ./src/func/*.ls
endif

ame.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\ame\ .\src\ame\*.ls
else
	$(ls) ./dist/ame/ ./src/ame/*.ls
endif

game.ls:
ifeq ($(UNAME), win32)
	$(ls) .\dist\game\ .\src\game\*.ls
else
	$(ls) ./dist/game/ ./src/game/*.ls
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
