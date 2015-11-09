# RubyGems Adoption Center
[![Build Status](https://travis-ci.org/rubygems/adoption-center.svg?branch=master)](https://travis-ci.org/rubygems/adoption-center)
[![Code Climate](https://codeclimate.com/github/rubygems/adoption-center/badges/gpa.svg)](https://codeclimate.com/github/rubygems/adoption-center)

## Development

Clone the repository

    git clone git@github.com:rubygems/adoption-center.git

Install bundled gems

    bundle install

Copy over the database file

    cp config/database.example.yml config/database.yml

Setup the database

    bundle exec rake db:setup

Start up rails!
    
    rails server
    
Run the tests!

    rake test

#### Using guard to make development easier

If you are lazy to do things like:

 - having to restart the server everytime you modify an initializer file.
 - having to run the tests everytime you modify a test file.
 - or having to run `bundle install` everytime you add/remove gems from the `Gemfile`

Then you should use **guard** to automate those tasks.

##### Setup guard

You can either use the `Guardfile.example` file.

    cp Guardfile.example Guardfile

Or set it up manually

  - Automate instalation of gems

        bundle exec guard init bundler

  - Automate run of tests

        bundle exec guard init minitest

  - Automate start/restart of the rails server

        bundle exec guard init rails

##### Run guard

will install missing gems, run tests and start the server!

    bundle exec guard

**note:** If you are running Debian, RedHat, or another similar Linux distribution and you get a `FATAL: Listen error: unable to monitor directories for changes`, follow this [Instructions](https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers) to solve the problem.

## Oauth

... In progress! :)

For background and further discussion, see [A RubyGems Adoption Center](http://www.benjaminfleischer.com/2014/08/17/rubygems-adoption-center/).

## License

Adoption Center uses the MIT license. Please check the [LICENSE]
(https://github.com/rails-girls-summer-of-code/Team-Binary-2015/blob/master/LICENSE)
file for more details.
