# Ghoti-CLI

:fish: A CLI tool that helps you start developing your new project within 60 seconds

## Dependence

You might need `typescript` to reduce install time.

To install typescript

```bash
npm install -g typescript
# or
sudo npm install -g typescript
```

After install, you have to link `typescript` to every justcreated project by using:

```bash
npm link typescript
# or
sudo npm link typescript
```

If `typescript` is not installed, `npm install` will automatically install it for you.

## Install

```bash
npm install -g ghoti-cli
# or
sudo npm install -g ghoti-cli
```

## Usage

### Init project

```bash
ghoti init [type] [path]
```

find available types with 

```bash
ghoti info init
```

### Extend project

```bash
ghoti component [component name]
ghoti page [page name]
ghoti lambda [lambda name]
ghoti func [function name]
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

`ghoti fix [error name]` can help you find out if the error is already known when you know the error name.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
