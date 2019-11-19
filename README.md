# JustCars API

## About API

* Grape API: `/api`
* Swagger documentation: `/api/docs` **(new items can be added here via POST /items endpoint)**

## Set up locally

1. Make sure you have proper **ruby** version installed, defined in [.ruby-version](.ruby-version)

2. And **PostgreSQL** running

3. To process images **imagemagick** is required

4. Then:
  ```
  bundle install

  rake db:create
  rake db:migrate

  rails s -p 8080
  ```

5. Your app should be available `localhost:8080`

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

## ENV
`CORS_ALLOWED_ORIGINS` - if empty `localhost:3000` is used as default


## To do

* It'd be nice to implement **pagination in ItemsApi#index**
* If the application is expected to be developed further it's better to use API versioning
