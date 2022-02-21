# README

Viezbot is a quiz application aiming to resemble a chat. It's part of the Digital Viez Project by master students of Trier University in Germany.
It was developped as a web application using Ruby on Rails (https://rubyonrails.org/) to ensure its platform independency. The chat-bubble code (https://github.com/dmitrizzle/chat-bubble) was used as a basis and modified where nessecary. 

Things you may want to cover:

* This code runs on Ruby 3.03

* System dependencies

* Configuration

* Database creation:

Before starting to code, make sure to create the DB with psql. 
The values can be initialized with the seeds.rb file via rails commandline.
In our case we put in values for questions, answers, booleans for correct 
or wrong answers as well as a key to map the respective answers to their corresponding questions.


* Database initialization:
Initialize the seeds file using rails db:migrate.

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* We used https://github.com/dmitrizzle/chat-bubble for the layout of the bubbles.
