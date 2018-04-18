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
	$(ls) .\$(distPath)\static\outer\ .\$(sourcePath)\static\outer\*.ls
else
	$(ls) ./$(distPath)/static/ ./$(sourcePath)/static/*.ls
	$(ls) ./$(distPath)/static/outer/ ./$(sourcePath)/static/outer/*.ls
endif

structure.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\structure\ .\$(sourcePath)\structure\*.ls
	$(ls) .\$(distPath)\structure\lib\ .\$(sourcePath)\structure\lib\*.ls
else
	$(ls) ./$(distPath)/structure/ ./$(sourcePath)/structure/*.ls
	$(ls) ./$(distPath)/structure/lib/ ./$(sourcePath)/structure/lib/*.ls
endif

func.ls:
ifeq ($(UNAME), win32)
	$(ls) .\$(distPath)\func\ .\$(sourcePath)\func\*.ls
	$(ls) .\$(distPath)\func\parser\ .\$(sourcePath)\func\parser\*.ls
	$(ls) .\$(distPath)\func\fs\ .\$(sourcePath)\func\fs\*.ls
else
	$(ls) ./$(distPath)/func/ ./$(sourcePath)/func/*.ls
	$(ls) ./$(distPath)/func/parser/ ./$(sourcePath)/func/parser/*.ls
	$(ls) ./$(distPath)/func/fs/ ./$(sourcePath)/func/fs/*.ls
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

clean:
ifeq ($(UNAME), win32)
	del .\$(distPath)
	del *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
else
	rm -rf ./$(distPath)
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
endif
