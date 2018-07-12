require("ts-node").register({
    compilerOptions: {
        sourceMap: true,
        strict: true,
        noImplicitReturns: true,
        noImplicitAny: true,
        module: "commonjs",
        experimentalDecorators: true,
        emitDecoratorMetadata: true,
        moduleResolution: "node",
        target: "es6",
        lib: [
            "es2017"
        ]
    },
});