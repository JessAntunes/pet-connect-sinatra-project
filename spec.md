# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        -All of the controllers that handle GET, POST, PATCH, DELETE methods are inherited by the ApplicationController, which inherits from Sinatra::Base
- [x] Use ActiveRecord for storing information in a database
        - Classes inherit from ActiveRecord 
- [x] Include more than one model class (e.g. User, Post, Category)
        -Project utilizes animal class and shelter class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        -Shelter has many animals.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        -Animal belongs to Shelter.
- [x] Include user accounts with unique login attribute (username or email)
        -Shelter each must have an email and password to login.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        -Animal can be added, created, edited, and deleted by the shelter that created it.
- [x] Ensure that users can't modify content created by other users
        -The buttons for add and edit can only be viewed by the shelter that is logged in and the page can only be displayed if the person is logged in.
- [x] Include user input validations
        -Password authentication is done with Bcrypt. 
        -Signup can not continue unless certain fields are filled in.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
        -Sinatra-Flash gem is used to provide messages when a shelters(user) email or password is invalid.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits 
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
