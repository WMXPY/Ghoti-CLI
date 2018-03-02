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

### What is a component, page, lambda, and fun

A component should be used as a reusable react class; a page is an unreusable react class, lambda and function are function sets.

### What is the difference between lambda and function

Lambda shall be developed with functional programming without side effect, like mapping a JSON to a simple array, and function is better to be used as logic codes.

### What is a feature

A feature is used to make use case scenario; when you are generating a feature, ghoti will automatically create a test file for you to test.

### Am I have to use these?

No, you can use any function set you want, just init with type "react-unstructured".

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
