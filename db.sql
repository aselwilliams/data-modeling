CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(50),
  password VARCHAR(50)
  );

CREATE TABLE ingredients(
  ingredient_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  price INT,
  origin VARCHAR(50)
  );

CREATE TABLE recipes(
  recipe_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  content TEXT
  );

  CREATE TABLE recipe_ingredients(
  recipe_ingredients_id SERIAL PRIMARY KEY,
  recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id),
  ingredient_id INTEGER NOT NULL REFERENCES ingredients(ingredient_id)
  );

CREATE TABLE occasions(
  occasion_id SERIAL PRIMARY KEY,
  name VARCHAR(50)
  );

  CREATE TABLE recipe_occasions(
  recipe_occasions_id SERIAL PRIMARY KEY,
  recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id),
  occasion_id INTEGER NOT NULL REFERENCES occasions(occasion_id)
  );

  INSERT INTO users (email, password)
VALUES ('jenny@aol.com','stars123'),
('john@gmail.com','devops333');


INSERT INTO ingredients (name, price, origin)
VALUES ('bananas',2,'brazil'),
('salt',3, 'curacao'),
('corn',5.66, 'kokomo');

INSERT INTO recipes (name, user_id, content)
VALUES ('beef stroganoff', 1, 'get the ribeye steak, slice and fry it with seasonings.'),
('mohito', 2, 'take and mix together mint, lime, ice,sprite, vodka');

INSERT INTO recipe_ingredients (recipe_id, ingredient_id)
VALUES (1, 2),
(1, 3),
(2, 1);

INSERT INTO occasions(name)
VALUES ('Christmas'),
('Thanksgiving'),
('Valentines day');

INSERT INTO recipe_occasions(recipe_id, occasion_id)
VALUES (2,3),
(1,3),
(1,2),
(1,1),
(2,2);