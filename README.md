# README

* Ruby version
    2.6.1

* Rails version
    6.1.1

* System dependencies
    run "bundle install"

* Database creation
    already created

* Database initialization
    run "rails db:migrate"

* Services (job queues, cache servers, search engines, etc.)
    to set up Omniauth go to https://console.developers.google.com/ and follow instructuions to gettting a client id and a client secret, then make a .env file to add it to and make sure to hide that with you gitignore

* Deployment instructions
    after a computer restart, run "sudo service postgresql start"
    enter your sudo password
    then run "rails s"
    visit http://localhost:3000/ to interact with the application 

# witches-spells

This application is made to contain a library of spells. Users may create books and spells. They may also view each others books/spells however the owner/creater of the book holds the power to edit or destroy the book and associated spells. 




