/* sql script to create database and tables for Recipe.com. */
/*Creates database*/
DROP DATABASE IF EXISTS recipe;
CREATE SCHEMA recipe;

/*Uses database recipe*/
USE recipe;

/* Create the 'Category' table. */

CREATE TABLE Category(
id int NOT NULL AUTO_INCREMENT,
category varchar(30) NOT NULL,
PRIMARY KEY(id)
);

/* Create the 'User' table. */

CREATE TABLE User(
id int NOT NULL AUTO_INCREMENT,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
username varchar(30) NOT NULL,
password varchar(64) NOT NULL,
num_recipes int NOT NULL,
PRIMARY KEY(id)
);

/* Create the 'Recipe' table. */

CREATE TABLE Recipe(
id int NOT NULL AUTO_INCREMENT,
recipe_name varchar(512) NOT NULL,
recipe_description varchar(10000) NOT NULL,
vote_sum int NOT NULL,
num_votes int NOT NULL,
user_id int NOT NULL,
category_id int NOT NULL,
FOREIGN KEY userId(user_id)
REFERENCES User(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY categoryId(category_id)
REFERENCES Category(id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY(id)
);

/* Create the 'Vote' table. */

CREATE TABLE Vote(
user_id int NOT NULL,
recipe_id int NOT NULL,
vote int NOT NULL,
PRIMARY KEY (recipe_id, user_id),
FOREIGN KEY userId(user_id)
REFERENCES User(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY recipeId(recipe_id)
REFERENCES Recipe(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Creates 'Steps' table. */

CREATE TABLE Steps(
recipe_id int NOT NULL,
step_num int NOT NULL,
step_instruction varchar(10000) NOT NULL,
PRIMARY KEY (recipe_id, step_num),
FOREIGN KEY recipeId(recipe_id) REFERENCES Recipe(id) ON UPDATE CASCADE ON DELETE CASCADE
);