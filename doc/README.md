# Ghoti-CLI

[![npm version](https://badge.fury.io/js/ghoti-cli.svg)](https://badge.fury.io/js/ghoti-cli)
[![Build Status](https://travis-ci.org/WMXPY/Ghoti-CLI.svg?branch=master)](https://travis-ci.org/WMXPY/Ghoti-CLI)
[![codecov](https://codecov.io/gh/WMXPY/Ghoti-CLI/branch/master/graph/badge.svg)](https://codecov.io/gh/WMXPY/Ghoti-CLI)
[![Gitter](https://badges.gitter.im/WMXPY/ghoti-cli.svg)](https://gitter.im/ghoti-cli?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![downloads](https://img.shields.io/npm/dm/ghoti-cli.svg)](https://www.npmjs.com/package/ghoti-cli)

:fish: A CLI tool that helps you start developing your new project within 60 seconds

## Install

### Install script

```bash
curl -sSL https://raw.githubusercontent.com/WMXPY/Ghoti-CLI/master/bin/install.sh | sudo sh -
# or
wget -qO- https://raw.githubusercontent.com/WMXPY/Ghoti-CLI/master/bin/install.sh | sudo sh -
```

### Install with NPM

```bash
npm install -g ghoti-cli
# or
sudo npm install -g ghoti-cli
```

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

### External projects

```bash
ghoti init -f [template link] [project path]
```

Use above command to install and init external template, you can also install it without init it

```bash
ghoti install [template link]
```

Check out some external templates ->[HERE](https://github.com/WMXPY/Ghoti-CLI-templates)<-

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
