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
        target: "es5",
        lib: [
            "es2016"
        ]
    },
});