ls := lsc -co
ts := tsc --p
dependence := log.ls log.ts static.ls func.ls structure.ls ame.ls eng.ls eng.ts
sourcePath := src
testPath := test
distPath := dist

ghoti: $(dependence)
	$(ls) ./dist/ ./src/*.ls

install:
	npm install
	npm install --only=dev

log.ls:
	$(ls) ./$(distPath)/log/ ./$(sourcePath)/log/*.ls
	
log.ts:
	$(ts) ./$(sourcePath)/log/tsconfig.json

static.ls:
	$(ls) ./$(distPath)/static/ ./$(sourcePath)/static/*.ls
	$(ls) ./$(distPath)/static/outer/ ./$(sourcePath)/static/outer/*.ls

structure.ls:
	$(ls) ./$(distPath)/structure/ ./$(sourcePath)/structure/*.ls
	$(ls) ./$(distPath)/structure/lib/ ./$(sourcePath)/structure/lib/*.ls

func.ls:
	$(ls) ./$(distPath)/func/ ./$(sourcePath)/func/*.ls
	$(ls) ./$(distPath)/func/parser/ ./$(sourcePath)/func/parser/*.ls
	$(ls) ./$(distPath)/func/fs/ ./$(sourcePath)/func/fs/*.ls

ame.ls:
	$(ls) ./$(distPath)/ame/ ./$(sourcePath)/ame/*.ls
	$(ls) ./$(distPath)/ame/tilde/ ./$(sourcePath)/ame/tilde/*.ls

eng.ls:
	$(ls) ./$(distPath)/eng/ ./$(sourcePath)/eng/*.ls

eng.ts:
	$(ts) ./$(sourcePath)/eng/tsconfig.json

dist.test:
	$(ts) ./$(testPath)/tsconfig.json

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
