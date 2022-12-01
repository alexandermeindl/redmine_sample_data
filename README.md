# Redmine plugin to generate sample data

This is a `Redmine` plugin for generate sample data for performance tests.

DO NOT USE IT ON PRODUCTION ENVIRONMENTS!

ALL DATA OF YOUR REDMINE INSTALLATION WILL BE DELETED!

## Installation

Install `redmine_sample_data` plugin for `Redmine`.

```shell
  cd $REDMINE_ROOT
  git clone https://github.com/alexandermeindl/redmine_sample_data.git plugins
```

## Usage

### Generate data with your setup

#### Advantages

- you can use exactly your Redmine version
- you can modify parameters for generating data
- you can use it with your plugins

#### Disadvantages

- Generating data need couple of hours

Generating data need couple of hours

#### Generate data

```shell
# path to your redmine
export REDMINE_ROOT=/tmp/redmine
# your rails environment (do not use production on your production system!)
export RAILS_ENV=test
cd $REDMINE_ROOT
bundle exec rake db:drop db:create db:migrate
bundle exec rake redmine:load_default_data REDMINE_LANG=en
bundle exec rake redmine:plugins:migrate
time bundle exec rake redmine:sample_data
```

Make your performance tests now with generated data.

### Use generated data from plugin

#### Advantages with generated data

- very fast usage

#### Disadvantages with generated data

- you need linux or macos
- only available for MySQL 8 or PostgreSQL 14
- fixed version of Redmine without plugin

#### Use data with MySQL 8

```shell
# path to your redmine
export REDMINE_ROOT=/tmp/redmine
# name of your redmine database
export REDMINE_DB=redmine_per
mysqladmin -f drop $REDMINE_DB
mysqladmin create $REDMINE_DB
gunzip < $REDMINE_ROOT/plugins/redmine_sample_data/sql/mysql-c0f60e5fe.sql.gz | mysql $REDMINE_DB
```

#### Use data with PostgreSQL 14

```shell
# path to your redmine
export REDMINE_ROOT=/tmp/redmine
# name of your redmine database
export REDMINE_DB=redmine_per
dropdb -f $REDMINE_DB
createdb create $REDMINE_DB
gunzip < $REDMINE_ROOT/plugins/redmine_sample_data/sql/psql-c0f60e5fe.sql.gz | psql $REDMINE_DB
```

If your database requires username and password, you need to adjust the commands above.

Make your performance tests now with generated data.
