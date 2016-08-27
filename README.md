# The internet of Wind Manifesto Website
---
---
## Please read and sign our manifesto on the website [internetofwind.org](http://internetofwind.org)

---
---

### WEBSITE DEVELOPMENT NOTES

Development is done within a virtual vagrant machine

```bash
vagrant up
```
Once the machine is initialized access to it with:

```bash
vagrant ssh
```
to shut down the machine use:

```bash
vagrant halt
```

#### GIT-FLOW WORKFLOW

Repo convention used is "git-flow".

The simplest tutorial about this workflow is available [here](http://danielkummer.github.io/git-flow-cheatsheet/)


#### PROJECT FOLDERS

**src** All the source code is here

**build** here the development stage compiled files (not optimized for production)

**optimized** here the files optimized for production (minified, etc)


#### DEVELOPMENT SHELL

Into the vagrant machine follow these steps:

STEP 1. start the compiler

```bash
vagrant ssh
cd /vagrant
make develop
```

STEP 2. Start the local server

On another terminal
```bash
vagrant ssh
cd /vagrant/build
http-server -p 3000
```

* Livereload is used. check the browser extension [here](http://livereload.com/extensions/).

#### PRODUCTION

Once development is completed you can compile for production using the command:

```bash
make optimize
```
results are written in the folder /optimized

#### DEPLOY

The webpage is deployed using github pages reading on gh-pages branch. Once completed and commited everything we want in the master, use

```bash
make deploy
```

to deploy on the web.


Fair wind
