# NPX functions
lsc := node_modules/.bin/lsc
tsc := node_modules/.bin/tsc
ls := $(lsc) -co
ts := $(tsc) --p
dependence := log.ls log.ts static.ls func.ls structure.ls ame.ls eng.ls eng.ts
sourcePath := src
testPath := test
distPath := dist

ghoti: $(dependence)
	@$(ls) ./dist/ ./src/*.ls

install:
	@echo "[INFO] Installing dev Dependencies"
	@yarn install --production=false

install-prod:
	@echo "[INFO] Installing Dependencies"
	@yarn install --production=true

log.ls:
	@echo "[INFO] LiveScript Building logs"
	@NODE_ENV=production $(ls) ./$(distPath)/log/ ./$(sourcePath)/log/*.ls
	
log.ts:
	@echo "[INFO] TypeScript Building logs"
	@NODE_ENV=development $(ts) ./$(sourcePath)/log/tsconfig.json

static.ls:
	@echo "[INFO] LiveScript Building statics"
	@NODE_ENV=development $(ls) ./$(distPath)/static/ ./$(sourcePath)/static/*.ls
	@NODE_ENV=development $(ls) ./$(distPath)/static/outer/ ./$(sourcePath)/static/outer/*.ls

structure.ls:
	@echo "[INFO] LiveScript Building structures"
	@NODE_ENV=development $(ls) ./$(distPath)/structure/ ./$(sourcePath)/structure/*.ls
	@NODE_ENV=development $(ls) ./$(distPath)/structure/lib/ ./$(sourcePath)/structure/lib/*.ls

func.ls:
	@echo "[INFO] LiveScript Building functions"
	@NODE_ENV=development $(ls) ./$(distPath)/func/ ./$(sourcePath)/func/*.ls
	@NODE_ENV=development $(ls) ./$(distPath)/func/parser/ ./$(sourcePath)/func/parser/*.ls
	@NODE_ENV=development $(ls) ./$(distPath)/func/fs/ ./$(sourcePath)/func/fs/*.ls

ame.ls:
	@echo "[INFO] LiveScript Building ames"
	@NODE_ENV=development $(ls) ./$(distPath)/ame/ ./$(sourcePath)/ame/*.ls
	@NODE_ENV=development $(ls) ./$(distPath)/ame/tilde/ ./$(sourcePath)/ame/tilde/*.ls

eng.ls:
	@echo "[INFO] LiveScript Building engs"
	@NODE_ENV=development $(ls) ./$(distPath)/eng/ ./$(sourcePath)/eng/*.ls

eng.ts:
	@echo "[INFO] TypeScript Building engs"
	@NODE_ENV=development $(ts) ./$(sourcePath)/eng/tsconfig.json

util.ts:
	@echo "[INFO] TypeScript Building util"
	@NODE_ENV=development $(ts) ./$(sourcePath)/util/tsconfig.json

dist.test:
	@NODE_ENV=development $(ts) ./$(testPath)/tsconfig.json

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
