# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - Created and retrieved my objects with active record. Attempted to use ActiveRecord methods instead of vanilla ruby.
- [x] Include more than one model class (e.g. User, Post, Category) - User, Recipe, BrewLog, and more were used.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has many recipes and a recipe belongs to a user. There are a bunch of other associations thrown in as well.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -U ser has many recipes and a recipe belongs to a user. There are a bunch of other associations thrown in as well.
- [x] Include user accounts with unique login attribute (username or email) - User's login in name is unique.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Recipes and BrewLogs have full CRUD routes
- [x] Ensure that users can't modify content created by other users - users should be completely restricted from modifying content they didn't create.
- [x] Include user input validations - validated the name of recipes. 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - An error will show when the name is the same as another recipe. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related