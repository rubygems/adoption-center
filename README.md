**We are archiving this repository. [Gem adoption](https://blog.rubygems.org/2022/01/19/rubygems-adoptions.html) was implemented in rubygems.org.**

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

## Oauth

... In progress! :)

For background and further discussion, see [A RubyGems Adoption Center](http://www.benjaminfleischer.com/2014/08/17/rubygems-adoption-center/).

## License
Adoption Center uses the MIT license. Please check the [LICENSE]
(https://github.com/rails-girls-summer-of-code/Team-Binary-2015/blob/master/LICENSE)
file for more details.
