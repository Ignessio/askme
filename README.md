## Description

  The askme application is the clear and simple way to ask any question and get the answers.
  Registered users can apply and modify questions, put answers, change avatars and the color scheme of own profile page.
  Basic search using hashtags is available as well.

## Demo

  - [miniask](https://miniask.herokuapp.com/)

## Language and framework
  * Ruby 3.0.2
  * Rails 6.1.5

## How to use

  * Download folder from repository or use clonning
  ```
  git clone git@github.com:Ignessio/askme
  ```
  * Install required libraries
  ```
  bundle install
  ```
  * Manage Nodejs dependencies
  ```
  yarn
  ```
  * Create database and apply migrations
  ```
  rails db:create db:migrate
  ```
  * Add your own secrets to credentials.yml.enc file
  * Start rails server using
  ```
  bundle exec rails start
  ```
  * Open new window in preffered browser and enter page address
  ```
  http://localhost:3000/
  ```
