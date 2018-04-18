ls := lsc -co
ts := tsc --p
depdence := log.ls static.ls func.ls structure.ls ame.ls eng.ls eng.ts
sourcePath := src
distPath := dist

ghoti: $(depdence)
ifeq ($(OS), Windows_NT)
	$(ls) .\dist\ .\src\*.ls
else
	$(ls) ./dist/ ./src/*.ls
endif

log.ls:
ifeq ($(OS), Windows_NT)
	$(ls) .\$(distPath)\log\ .\$(sourcePath)\log\*.ls
else
	$(ls) ./$(distPath)/log/ ./$(sourcePath)/log/*.ls
endif

static.ls:
ifeq ($(OS), Windows_NT)
	$(ls) .\$(distPath)\static\ .\$(sourcePath)\static\*.ls
	$(ls) .\$(distPath)\static\outer\ .\$(sourcePath)\static\outer\*.ls
else
	$(ls) ./$(distPath)/static/ ./$(sourcePath)/static/*.ls
	$(ls) ./$(distPath)/static/outer/ ./$(sourcePath)/static/outer/*.ls
endif

structure.ls:
ifeq ($(OS), Windows_NT)
	$(ls) .\$(distPath)\structure\ .\$(sourcePath)\structure\*.ls
	$(ls) .\$(distPath)\structure\lib\ .\$(sourcePath)\structure\lib\*.ls
else
	$(ls) ./$(distPath)/structure/ ./$(sourcePath)/structure/*.ls
	$(ls) ./$(distPath)/structure/lib/ ./$(sourcePath)/structure/lib/*.ls
endif

func.ls:
ifeq ($(OS), Windows_NT)
	$(ls) .\$(distPath)\func\ .\$(sourcePath)\func\*.ls
	$(ls) .\$(distPath)\func\parser\ .\$(sourcePath)\func\parser\*.ls
	$(ls) .\$(distPath)\func\fs\ .\$(sourcePath)\func\fs\*.ls
else
	$(ls) ./$(distPath)/func/ ./$(sourcePath)/func/*.ls
	$(ls) ./$(distPath)/func/parser/ ./$(sourcePath)/func/parser/*.ls
	$(ls) ./$(distPath)/func/fs/ ./$(sourcePath)/func/fs/*.ls
endif

ame.ls:
ifeq ($(OS), Windows_NT)
	$(ls) .\$(distPath)\ame\ .\$(sourcePath)\ame\*.ls
else
	$(ls) ./$(distPath)/ame/ ./$(sourcePath)/ame/*.ls
endif

eng.ls:
ifeq ($(OS), Windows_NT)
	$(ls) .\$(distPath)\eng\ .\$(sourcePath)\eng\*.ls
else
	$(ls) ./$(distPath)/eng/ ./$(sourcePath)/eng/*.ls
endif

eng.ts:
ifeq ($(OS), Windows_NT)
	$(ts) .\$(sourcePath)\eng\tsconfig.json
else
	$(ts) ./$(sourcePath)/eng/tsconfig.json
endif

clean:
ifeq ($(OS), Windows_NT)
	cmd //C del .\$(distPath)
	cmd //C del *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
	cmd //C del .\src\eng\*.js
	cmd //C del .\src\eng\*.js.map
	cmd //C del .\test\eng\*.js
	cmd //C del .\test\eng\*.js.map
else
	rm -rf ./$(distPath)
	rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
	rm -rf ./src/eng/*.js
	rm -rf ./src/eng/*.js.map
	rm -rf ./test/eng/*.js
	rm -rf ./test/eng/*.js.map
endif
