# JustCars API

## About API

* Grape API: `/api`
* Swagger documentation: `/api/docs`

## Set up locally

1. Make sure you have proper **ruby** version installed, defined in [.ruby-version](.ruby-version)

2. And **PostgreSQL** running

3. Then:
  ```
  bundle install

  rake db:create
  rake db:migrate

  rails s
  ```

4. Your app should be available in `localhost:3000`

## Before commit

1. Set up **overcommit** to make sure yuur code is clean :) :

  ```
  gem install
  bundle install --gemfile=.overgems.rb
  overcommit --install
  ```

2. Make sure elint is installed, just run:
  ```
  npm install
  ```

3. Then you can commit your changes!
