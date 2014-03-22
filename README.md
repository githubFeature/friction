# Friction [![Build Status](https://travis-ci.org/rafalchmiel/friction.png?branch=master)](https://travis-ci.org/rafalchmiel/friction) [![Coverage Status](https://coveralls.io/repos/rafalchmiel/friction/badge.png?branch=master)](https://coveralls.io/r/rafalchmiel/friction?branch=master) [![Code Climate](https://codeclimate.com/github/rafalchmiel/friction.png)](https://codeclimate.com/github/rafalchmiel/friction)
Friction is a tool to check your project for common sources of contributor friction.

[![Friction](https://raw.github.com/rafalchmiel/friction/gh-pages/example.gif)](https://github.com/rafalchmiel/friction)

## Philosophy
If you want people to use and contribute to your project, you need to start by answering their most basic questions. Friction is a command line script that will check your project for common answers to these questions. *Read more at [pengwynn/flint](https://github.com/pengwynn/flint#philosophy).*

### Inspiration
Friction takes its inspiration from [Flint](https://github.com/pengwynn/flint). Friction is written in Ruby instead of Go, has a nicer interface, and some extra features that Flint doesn't have.

## Quick Start
Install the latest stable version of Friction via RubyGems:

```bash
$ gem install friction
```

Run `friction` from your project root to check for some common ways to improve the experience for potential contributors. Here's some example output:

```bash
$ friction
[ERROR] README not found.
[ERROR] CONTRIBUTING guide not found.
[ERROR] LICENSE not found.
[ERROR] Bootstrap script not found.
[ERROR] Test script not found.
[ERROR] .gitignore not found.
```

To skip certain files use the `--skip` flag, like this:

```bash
$ friction --skip bootstrap:test
[ERROR] README not found.
[ERROR] CONTRIBUTING guide not found.
[ERROR] LICENSE not found.
[ERROR] .gitignore not found.
```

The arguments passed to `--skip` are separated by `:`. The possible arguments include `readme`, `contributing`, `license`, `bootstrap`, `test`, and `gitignore`.

## Development
If you want to hack on Friction locally, we try to make [bootstrapping the project](http://wynnnetherland.com/linked/2013012801/bootstrapping-consistency) as painless as possible. Just clone and run:

```bash
$ script/bootstrap
```

This will install project dependencies and get you up and running. If you want to run a Ruby console to poke on Friction, you can crank one up with:

```bash
$ script/console
```

Using the scripts in `./script` instead of `bundle exec rspec`, `bundle console`, etc. ensures your dependencies are up-to-date.
