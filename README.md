<div align="center">

<br>

  This is my solution to your API challenge. I decided to work in Rails and use PostgreSQL for the database. I enjoyed working through this problem, and I thank you for the opportunity to showcase my skills, to stretch my brain, and get some quality practice.

---

## Table of Contents
|Links
|--- |
[Tools Used](#tools-used)
[Setup](#setup)
[Goals](#goals)
[Database Schema](#database-schema)
[API Endpoints](#api-endpoints)


## Tools Used

[<img alt="Ruby On Rails" src="https://img.shields.io/badge/RubyOnRails-flat--square?logo=ruby-on-rails&style=for-the-badge&color=black"/>](https://rubyonrails.org/)

[<img alt="Git" src="https://img.shields.io/badge/Git-flat--square?logo=git&style=for-the-badge&color=black"/>](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

[<img alt="PostgreSQL" src ="https://img.shields.io/badge/Postgres-flat--square?logo=postgres&style=for-the-badge&color=black"/>](https://www.postgresql.org/)

[<img alt="RSpec" src ="https://img.shields.io/badge/RSpec-flat--square?logo=rspec&style=for-the-badge&color=black"/>](https://github.com/rspec/rspec-rails)

</div>

<div align="center">

## Setup

</div>


  This project requires PostgreSQL, Ruby 2.7.2, Rails 6.1.4, and bundler

  * Fork this repository
  * From the command line, install dependencies and set up your DB:
      * `bundle install`
      * `bundle update`
      * `rails db:{drop,create,migrate,seed}`
  * Run the test suite with `rspec`
  * Run your development server with `rails s` to see the app in action.
  * To test POST and PATCH endpoints, I suggest using POSTMAN while running your rails server. Use the URL: "/localhost:3000/api/v1/..." JSON Contract can be found in endpoints section


<div align="center">

## Goals

</div>

 Project Scope Time: 2 hours

 At a minimum, you must create:

- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)


- A strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- Test Driven Development
- Clear documentation

Beyond the base requirements, include any additional endpoints you’d like, but be mindful of your time. You don’t need to go overboard, consider what might be necessary to achieve MVP so that this API is easy to understand and consume by a Frontend Developer.

<div align="center">

## Database Schema

<img src="https://user-images.githubusercontent.com/78382113/149171119-b9007b28-704e-495a-be79-9075ef30a3b8.png">

</div>


## API Endpoints

<div align="left">

* POST to `/api/v1/customers/id/subscriptions`
  - accepts the following body:
  ```
    {
      "title": "title",
      "price": "price",
      "status": "status",
      "frequency": "frequency"
    }
  ```
  - returns the following body:
  ```
  {
    "id": "id",
    "title": "title",
    "price": "price",
    "status": "status",
    "frequency": "frequency",
    "created_at": "timestamp",
    "updated_at": "timestamp"
  }
  ```
* GET to `/api/v1/customers/id/subscriptions`
 - returns the following body:
 ```
   {[
      {
        "id": "id",
        "title": "title",
        "price": "price",
        "status": "status",
        "frequency": "frequency"
        "created_at": "timestamp",
        "updated_at": "timestamp"
      },
      {
        "id": "id",
        "title": "title",
        "price": "price",
        "status": "status",
        "frequency": "frequency"
        "created_at": "timestamp",
        "updated_at": "timestamp"
      },
      {
        "id": "id",
        "title": "title",
        "price": "price",
        "status": "status",
        "frequency": "frequency"
        "created_at": "timestamp",
        "updated_at": "timestamp"
      }...
    ]
  }
 ```

 * PATCH to `/api/v1/customers/id/subscriptions/id`
 - accepts the following body:
 ```
  {
    "status": "status"
  }
 ```

 - returns status 204 if successful:
 </div>
