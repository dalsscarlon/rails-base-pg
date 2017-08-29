# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.4.0

* Rails version 5.1.1

* System dependencies:

...Install graphviz, to install go to page of Graphviz http://www.graphviz.org/ or use the code bellow if you are a Ubuntu user:
```
$ sudo apt-get install graphviz
```

...Install overcommit
```
$ overcommit --install
```

* Install Gems from Gemfile
```
$ bundle install
```

* For run the project
1. Create enviroment file
```
echo "JRUBY_OPTS=--2.4" >> .ruby-env
```
2. Get secret key for each enviroment (development, test and production) by running the following code, copy the result and add it to .ruby-env file. Each secret key must be different.
```
rake secret
```
Add to file:
SECRET_KEY_DEV=*YOURSECRETKEY*
SECRET_KEY_TEST=*YOURSECRETKEY*
SECRET_KEY_BASE=*YOURSECRETKEY*


* Database creation
```
$ rails db:setup
```

