# Yoda Know

[Live Site][live]
[live]: http://yodaknow.herokuapp.com/

Yoda Know is a Star Wars themed forum built to follow the same functionality as Stack Overflow, using the Sinatra framework. 

##Technologies
Sinatra, PostgreSQL

##Features

### Post questions or answers
Users can post questions or submit an answer to a previously submitted question. They can associate multiple pre-created tags with the question they submit.

### Comment or vote on questions or answers
Comments and votes are polymorphic and can happen to both questions and answers.

### Favorites
Users can "favorite" questions they like and see a list of their favorites on their profile page.

### Filter questions by tags
Users can view questions associated with specific tags.

## Work in Progress / To Do

- [ ] Convert from Sinatra to full Rails application
- [ ] Update UI for Question index page
- [ ] Fix routing so that when user submits question, re-routes to Question index page
- [ ] Update footer information
- [ ] Beautify registration form
- [ ] Allow user to choose their Star Wars themed avatar
- [ ] Remove faker data and allow actual user input
