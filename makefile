ls := lsc -co
ts := tsc
depdence := log.ls static.ls func.ls structure.ls ame.ls eng.ts
sourcePath := src
distPath := dist

ghoti: $(depdence)
ifeq ($(UNAME), win32)
	$(ls) .\dist\ .\src\*.ls
else
	$(ls) ./dist/ ./src/*.ls
endif

log.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\log\ .\$(sourcePath)\log\*.ls
else
	$(ls) ./$(distPath)/log/ ./$(sourcePath)/log/*.ls
endif

static.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\static\ .\$(sourcePath)\static\*.ls
	$(ls) .\$(distPath)\static\outer .\$(sourcePath)\static\outer\*.ls
else
	$(ls) ./$(distPath)/static/ ./$(sourcePath)/static/*.ls
	$(ls) ./$(distPath)/static/outer ./$(sourcePath)/static/outer/*.ls
endif

structure.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\structure\ .\$(sourcePath)\structure\*.ls
else
	$(ls) ./$(distPath)/structure/ ./$(sourcePath)/structure/*.ls
endif

func.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\func\ .\$(sourcePath)\func\*.ls
else
	$(ls) ./$(distPath)/func/ ./$(sourcePath)/func/*.ls
endif

ame.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\ame\ .\$(sourcePath)\ame\*.ls
else
	$(ls) ./$(distPath)/ame/ ./$(sourcePath)/ame/*.ls
endif

eng.ts:
	$(ts)

run:
ifeq ($(UNAME), win32)
	lsc test.ls
else
	lsc test.ls
endif

clean:
ifeq ($(UNAME), win32)
	del .\$(distPath)
	del *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
else
	rm -rf ./$(distPath)
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
endif
