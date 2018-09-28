ls := lsc -co
ts := tsc --p
dependence := log.ls log.ts static.ls func.ls structure.ls ame.ls eng.ls eng.ts
sourcePath := src
testPath := test
distPath := dist

ghoti: $(dependence)
	@$(ls) ./dist/ ./src/*.ls

install:
	@echo "[INFO] Installing Dependences"
	@npm install
	@npm install --only=dev

log.ls:
	@echo "[INFO] LiveScript Building logs"
	@$(ls) ./$(distPath)/log/ ./$(sourcePath)/log/*.ls
	
log.ts:
	@echo "[INFO] TypeScript Building logs"
	@$(ts) ./$(sourcePath)/log/tsconfig.json

static.ls:
	@echo "[INFO] LiveScript Building statics"
	@$(ls) ./$(distPath)/static/ ./$(sourcePath)/static/*.ls
	@$(ls) ./$(distPath)/static/outer/ ./$(sourcePath)/static/outer/*.ls

structure.ls:
	@echo "[INFO] LiveScript Building structures"
	@$(ls) ./$(distPath)/structure/ ./$(sourcePath)/structure/*.ls
	@$(ls) ./$(distPath)/structure/lib/ ./$(sourcePath)/structure/lib/*.ls

func.ls:
	@echo "[INFO] LiveScript Building functions"
	@$(ls) ./$(distPath)/func/ ./$(sourcePath)/func/*.ls
	@$(ls) ./$(distPath)/func/parser/ ./$(sourcePath)/func/parser/*.ls
	@$(ls) ./$(distPath)/func/fs/ ./$(sourcePath)/func/fs/*.ls

ame.ls:
	@echo "[INFO] LiveScript Building ames"
	@$(ls) ./$(distPath)/ame/ ./$(sourcePath)/ame/*.ls
	@$(ls) ./$(distPath)/ame/tilde/ ./$(sourcePath)/ame/tilde/*.ls

eng.ls:
	@echo "[INFO] LiveScript Building engs"
	@$(ls) ./$(distPath)/eng/ ./$(sourcePath)/eng/*.ls

eng.ts:
	@echo "[INFO] TypeScript Building engs"
	@$(ts) ./$(sourcePath)/eng/tsconfig.json

util.ts:
	@echo "[INFO] TypeScript Building util"
	@$(ts) ./$(sourcePath)/util/tsconfig.json

dist.test:
	@$(ts) ./$(testPath)/tsconfig.json

help:
	@echo ""
	@echo " ┌─────────────── Ghoti-cli Makefile Helps ────────────────────────────────────────────┐ "
	@echo " ┝━━━━━━━━━━━━━━━┯━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┥ "
	@echo " │ Command       │                                                                     │ "
	@echo " ┝━━━━━━━━━━━━━━━┿━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┥ "
	@echo " │ make          │ Run application                                                     │ "
	@echo " │ make service  │ Run application without build                                       │ "
	@echo " │ make run      │ Run application without build                                       │ "
	@echo " │ make dev      │ Build application with development typescript settings              │ "
	@echo " │ make test     │ Test application with mocha and ts-node                             │ "
	@echo " │ make build    │ Clean up and build application with production typescript settings  │ "
	@echo " │ make clean    │ Clean up                                                            │ "
	@echo " │ make install  │ Install dependences                                                 │ "
	@echo " └───────────────┴─────────────────────────────────────────────────────────────────────┘ "
	@echo ""

clean:
ifeq ($(OS), Windows_NT)
	@echo "[INFO] Skipping"
else
	@echo "[INFO] Cleaning dist files"
	@rm -rf ./$(distPath)
	@rm -rf *.aux *.dvi *.fdb* *.fls *.log *.gz *.pdf
	@rm -rf ./src/eng/*.js
	@rm -rf ./src/eng/*.js.map
	@rm -rf ./test/eng/*.js
	@rm -rf ./test/eng/*.js.map
endif
