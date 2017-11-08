## Deliverables

### `Recipe`
Build the following methods on the Recipe class

- `Recipe.all`
should return all of the recipe instances
- `Recipe#users`
should return the user instances who have recipe cards with this recipe
- `Recipe#ingredients`
should return all of the ingredients in this recipe


### `User`
Build the following methods on the User class

- `User.all`
should return all of the user instances
- `User#recipes`
should return all of the recipes this user has recipe cards for
- `User#add_recipe_card`
should accept a recipe instance as an argument, and create a new recipe card for this user and the given recipe
- `User#allergens`
should return all of the ingredients this user is allergic to
- `User#top_three_recipes`
should return the top three highest rated recipes for this user.
- `User#most_recent_recipe`
should return the recipe most recently added to the user's cookbook.



### `RecipeCard`
A RecipeCard is the join between a user instance and a recipe instance.  This is a has-many-through relationship.
Build the following methods on the RecipeCard class:  

- `RecipeCard.all`
should return all of the RecipeCard instances
- `RecipeCard#date`
should return the date of the entry
- `RecipeCard#rating`
should return the rating (an integer) a user has given their entry
- `RecipeCard#user`
should return the user to which the entry belongs
- `RecipeCard#recipe`
should return the recipe to which the entry belongs

### `Ingredient`
Build the following methods on the Ingredient class

- `Ingredient.all`
should return all of the ingredient instances


### `IngredientRecipe`
IngredientRecipe is the join between an ingredient and a recipe.  This is a has-many-through relationship
Build the following methods on the IngredientRecipe class

- `IngredientRecipe.all`
should return all of the IngredientRecipe instances
- `IngredientRecipe#ingredient`
should return the ingredient instance
- `IngredientRecipe#recipe`
should return the recipe instance

### `Allergen`
An Allergen is a join between a user and an ingredient.  This is a has-many-through relationship.  What methods should an instance of this model respond to?
