% Define the food, ingredient, and allergen predicates
food(pizza).
food(soup).
food(salad).

ingredient(pizza, dough).
ingredient(pizza, tomato_sauce).
ingredient(pizza, cheese).
ingredient(soup, broth).
ingredient(soup, vegetables).
ingredient(salad, lettuce).
ingredient(salad, tomatoes).

allergen(milk).
allergen(wheat).
allergen(gluten).
allergen(shellfish).

% Define the predicate to check if a given meal is safe for a user with specific food allergies

is_safe_to_eat(Meal, Allergies) :-
    findall(Ingredient, (ingredient(Meal, Ingredient), allergen(Allergy), allergic_to(Allergy, Allergies), \+ safe_for_allergic(Ingredient, Allergy)), UnsafeIngredients),
    length(UnsafeIngredients, 0).

% Define the helper predicates for checking allergies

allergic_to(Allergy, [Allergy|_]).
allergic_to(Allergy, [_|RestAllergies]) :- allergic_to(Allergy, RestAllergies).

safe_for_allergic(Ingredient, Allergy) :-
    \+ allergen(Allergy) ; \+ ingredient_has_allergen(Ingredient, Allergy).

ingredient_has_allergen(Ingredient, Allergy) :-
    ingredient(Ingredient, Ingredients),
    allergen(Allergy),
    member(Allergy, Ingredients).

