# Ghoti-cli Introduction

## Dependence

You might need `typescript` installed globally to reduce install time.

```bash
# To install typescript
npm install -g typescript
# or
sudo npm install -g typescript
```

After install, you have to link `typescript` to every justcreated project by using:

```bash
# To link typescript to your project
npm link typescript
# or
sudo npm link typescript
```

If `typescript` is not installed globally in your global npm node_modules path, `npm install` will automatically install it for you.

## Usage

Use `ghoti ?` or `ghoti help` for all available commands.

### Init project

```bash
ghoti init [template] [project path]
```

Find available template with `ghoti list`, for each template, you can use `ghoti whatis [template]` to know more about it.

### Extend project

```bash
ghoti component [component name]
ghoti page [page name]
ghoti lambda [lambda name]
ghoti func [func name]
ghoti feature [feature name]
```

## Q & A

### What is a component/page/lambda/func?

A component should be used as a reusable react class; a page is an unreusable react class, lambda and function are function sets.

### What is the difference between lambda and function?

Lambda shall be developed with functional programming without side effect, like mapping a JSON to a simple array, and function is better to be used as logic codes.

### What is a feature?

A feature is used to make use case scenario; when you are generating a feature, `ghoti` will automatically create a test file for you to test.

### Am I have to use these structures?

No, you can use any function set you want, just init with type "react-unstructured".

## Troubleshooting

You can always try `ghoti help` anywhere; `npm run hint` or `ghoti fix` in your created project to see if there is a trouble solution.

`ghoti fix [error name]` like `ghoti fix typescript is not a package` can help you find out if the error is already known when you know the error name.