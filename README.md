## Deliverables

### `Recipe`
Build the following methods on the Recipe class

- `Recipe.all`
should return all of the recipe instances
- `Recipe#users`
should return the user instances who have cookbook entries with this recipe
- `Recipe#ingredients`
should return all of the ingredients in this recipe


### `User`
Build the following methods on the User class

- `User.all`
should return all of the user instances
- `User#recipes`
should return all of the recipes this user has cookbook entries for
- `User#add_cookbook_entry`
should accept a recipe instance as an argument, and create a new cookbook entry for this user and the given recipe
- `User#allergens`
should return all of the things this user is allergic to
- `User#top_three_recipes`
should return the top three highest rated recipes for this user.
- `User#most_recent_recipe`
should return the recipe most recently added to the user's cookbook.



### `CookbookEntry`
A CookbookEntry is the join between a user instance and a recipe instance.  This is a has-many-through relationship.
Build the following methods on the CookbookEntry class:  

- `CookbookEntry.all`
should return all of the CookbookEntry instances
- `CookbookEntry#date`
should return the date of the entry
- `CookbookEntry#rating`
should return the rating (an integer) a user has given their entry
- `CookbookEntry#user`
should return the user to which the entry belongs
- `CookbookEntry#recipe`
should return the recipe to which the entry belongs

### `Ingredient`
Build the following methods on the Ingredient class

- `Ingredient.all`
should return all of the ingredient instances


### `IngredientRecipes`
IngredientRecipes is the join between an ingredient and a recipe.  This is a has-many-through relationship
Build the following methods on the IngredientRecipes class

- `IngredientRecipes.all`
should return all of the IngredientRecipes instances
- `IngredientRecipes#ingredient`
should return the ingredient instance
- `IngredientRecipes#recipe`
should return the recipe instance

### `UserAllergens`
UserAllergens is the join between a user and an allergen.  This is a has-many-through relationship.  What methods should an instance of this model respond to?

### `Allergen`
Build the following methods on the Allergen class

- `Allergen.all`
should return all of the allergen instances

### `**Bonus**`

- `User#safe_recipes`
should return all recipes that do not contain ingredients a user is allergic to.
