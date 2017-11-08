## Deliverables

### `Recipe`
Build the following methods on the Recipe class

- `Recipe.all`
should return all of the recipe instances
- `Recipe#users`
should return the user instances who have cookbook entries with this recipe



### `User`
Build the following methods on the User class

- `User.all`
should return all of the user instances
- `User#recipes`
should return all of the recipes this user has cookbook entries for
- `User#add_cookbook_entry`
should accept a recipe instance as an argument, and create a new cookbook entry for this user and the given recipe


### `CookbookEntry`
Build the following methods on the CookbookEntry class:  

- `CookbookEntry.all`
should return all of the CookbookEntry instances
- `CookbookEntry#date`
should return the date of the entry
- `CookbookEntry#rating`
should return the rating (an integer) a user has given their entry
