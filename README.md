# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

       2.4.2

* System dependencies

       * APP_ID => `http://openweathermap.org/`

* How to run the test suite

       rspec

* Services

       API requests are made to http://api.openweathermap.org/data/2.5/weather so in order to work please generate the key

* Deployment instructions

     * Generate secrets using `rake secret` and set that in environment for production server against `SECRET_KEY_BASE` key
     * run `bundle install` command
     * run `rake assets:precompile` for precompiling assets
     * generate config/application.yml and set values based on environment. Sample file is config/application.yml.example.
