# Shop Support API Challenge

### Objectives:

- [ ] Create db and tables
- [ ] Seed db with dummy data
- [ ] Write tests
- [ ] Create server
- [ ] Create routes
- [ ] Verify server connection and routes
- [ ] Create queries
- [ ] Create ORMs (bonus)
- [ ] Define methods:
  - [ ] Receive HTTP req (POST /license-key request)
  - [ ] Validate order_id exists between customer (customer_id) and shop (shop_id)
  - [ ] Store license key
  - [ ] Increment count of license keys issued
  - [ ] HTML response: Email license key

### Timeline:
#### Day 1 
- Create server and database with seeded data.
#### Day 2 
- verify server and database connections. 
- write tests for queries.
- write sql queries.
- create router and controller to verify HTTP request method and path
#### Day 3
- write tests for API behavior
- validate order with customer and shop IDs
  - if matched
    - add id and license key to table
    - increment shop id license count
    - send HTML email response
  - else send status 404 with error message

To install gems and setup database, run following in terminal:
NB: database used: PostgreSQL

``` ruby
  bundle install
  ./import_db.sh
```

Start server:
Run following command from root of project folder:
``` ruby
ruby server.rb
```

### Gems Used

I used the Rack gem as a server. It is a modular webserver interface that nicely wraps HTTP requests and responses so that I was able to modify them in Ruby as needed.

I wrote unit tests using Rspec. 

I used Postman to test the API behavior. The tests can be found [here](https://documenter.getpostman.com/view/1901975/collection/71B2sNa).




