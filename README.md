# Friction [![Build Status](https://travis-ci.org/rafalchmiel/friction.svg?branch=master)](https://travis-ci.org/rafalchmiel/friction) [![Coverage Status](https://coveralls.io/repos/rafalchmiel/friction/badge.svg?branch=master)](https://coveralls.io/r/rafalchmiel/friction?branch=master) [![Code Climate](https://codeclimate.com/github/rafalchmiel/friction.svg)](https://codeclimate.com/github/rafalchmiel/friction) [![Gem Version](https://badge.fury.io/rb/friction.svg)](https://rubygems.org/gems/friction)
Friction is a tool to check your project for common sources of contributor friction.

## Philosophy
If you want people to use and contribute to your project, you need to start by answering their most basic questions. Friction is a command line script that will check your project for common answers to these questions. *Read more at [friction/wiki](https://github.com/rafalchmiel/friction/wiki).*

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
/repo
 [ERROR] README not found                see http://git.io/yHosNA
 [ERROR] CONTRIBUTING guide not found    see http://git.io/g_0mVQ
 [ERROR] ISSUE_TEMPLATE not found        see http://git.io/vgpaA
 [ERROR] PULL_REQUEST_TEMPLATE not found see http://git.io/vgpVk
 [ERROR] CODE_OF_CONDUCT guide not found see http://git.io/vJvR3
 [ERROR] LICENSE not found               see http://git.io/pFMQMQ
 [ERROR] Bootstrap script not found      see http://git.io/jZoRYA
 [ERROR] Test script not found           see http://git.io/oo21Jw
```

### Skipping checks
If some checks do not apply to your project, skip certain files using the `--skip` (or `-s`) flag, like this:

```bash
$ friction --skip bootstrap:test:issue_template
/repo
 [ERROR] README not found                see http://git.io/yHosNA
 [ERROR] CONTRIBUTING guide not found    see http://git.io/g_0mVQ
 [ERROR] PULL_REQUEST_TEMPLATE not found see http://git.io/vgpVk
 [ERROR] CODE_OF_CONDUCT guide not found see http://git.io/vJvR3
 [ERROR] LICENSE not found               see http://git.io/pFMQMQ
```

The arguments passed to `--skip` are separated by `:`. The possible arguments include `readme`, `contributing`, `issue_template`, `pull_request_template`, `code_of_conduct`, `license`, `bootstrap`, `test`, and `gitignore`.

### Running checks recursively
If you have a large number of projects you'd like to check with Friction, you can use the `--recursive` (or just `-r`) flag to recursively check every directory in the current working directory. Here's example output:

```bash
$ friction -r -s bootstrap:test:issue_template
/repo
 [ERROR] README not found                see http://git.io/yHosNA
 [ERROR] CONTRIBUTING guide not found    see http://git.io/g_0mVQ
 [ERROR] PULL_REQUEST_TEMPLATE not found see http://git.io/vgpVk
 [ERROR] CODE_OF_CONDUCT guide not found see http://git.io/vJvR3
 [ERROR] LICENSE not found               see http://git.io/pFMQMQ
/repo2
 [ERROR] README not found                see http://git.io/yHosNA
 [ERROR] CONTRIBUTING guide not found    see http://git.io/g_0mVQ
 [ERROR] PULL_REQUEST_TEMPLATE not found see http://git.io/vgpVk
 [ERROR] CODE_OF_CONDUCT guide not found see http://git.io/vJvR3
 [ERROR] LICENSE not found               see http://git.io/pFMQMQ
/repo3
 [ERROR] PULL_REQUEST_TEMPLATE not found see http://git.io/vgpVk
 [ERROR] CODE_OF_CONDUCT guide not found see http://git.io/vJvR3
```

## Supported Ruby Versions
Friction aims to support and is [tested against](https://travis-ci.org/rafalchmiel/friction) the following Ruby implementations:

 - MRI 2.2.x
 - MRI 2.1.x
 - MRI 2.0.0

If something doesn't work on one of these Ruby versions, it's a bug. Friction may inadvertently work (or seem to work) on other Ruby implementations, however support will only be provided for the versions listed above.

If you would like Friction to support another Ruby version, you may volunteer to be a maintainer. Being a maintainer entails making sure all tests run and pass on that implementation. When something breaks on your implementation, you will be responsible for providing patches in a timely fashion. If critical issues for a particular implementation exist at the time of a major release, support for that Ruby version may be dropped.

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
