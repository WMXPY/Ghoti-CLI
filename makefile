ls := lsc -co
ts := tsc --p
depdence := log.ls static.ls func.ls structure.ls ame.ls eng.ls eng.ts
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

eng.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\eng\ .\$(sourcePath)\eng\*.ls
else
	$(ls) ./$(distPath)/eng/ ./$(sourcePath)/eng/*.ls
endif

eng.ts:
ifeq ($(UNAME), win32)
	$(ts) .\$(sourcePath)\eng\tsconfig.json
else
	$(ts) ./$(sourcePath)/eng/tsconfig.json
endif

run: static.ls
	ghoti init github://Whatever-If-It-Is-Cool/test/master/b.zip -f a

clean:
ifeq ($(UNAME), win32)
	del .\$(distPath)
	del *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
else
	rm -rf ./$(distPath)
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
endif
