INSERT INTO Category (category)
VALUES  ("Appetizer"),
        ("Entree"),
        ("Dessert");
 
INSERT INTO User (first_name, last_name, username, password, num_recipes)
VALUES  ("Blake", "Cleary", "bcleary", "251470d8cc267f672265230767ee177f04dca9ca4db273fb7561214fff32d617", 3),
        ("Patric", "Chang", "pchang", "36f7a1bbce5886e706937136f3ecbbf47b2a080ea69efb2bfafed02d9edf0854", 3),
        ("Akshay", "Jagtap", "ajagtap", "d683cc637a5292395fd40afb36cf3a5c7b9c455832aae0077aa4e1999c956d4f", 3),
        ("Kyle", "Martin", "kmartin", "4ac986cf6f2071f6795e7606f4fc49feaca4a3f6c39a9bf57346d4ef557548af", 3); 
 
INSERT INTO Recipe (recipe_name, recipe_description, vote_sum, num_votes, user_id, category_id)
VALUES  ("PEPPER POPPERS RECIPE","These creamy stuffed jalapenos have some bite. They may be the most popular treats I make! My               husband is always hinting that I should make a batch.", 4, 4, 1, 1),
        ("BUFFALO CHICKEN DIP RECIPE","Buffalo wing sauce, cream cheese and ranch or blue cheese dressing make a great party dip. Everywhere I take it, people want this chicken wing dip recipe. ", 3, 4, 2, 1),
        ("HOMEMADE GUACAMOLE RECIPE","Get the most delicious guacamole, easy! Just whip together this recipe for guacamole with your favorite ingredients, and in a matter of minutes it'll quickly tame anything that's too spicy.", 2, 4, 3, 1),
        ("Mediterranean Spread","This is the number one requested thing for me to make, which is great because it is sooo easy! This is the best if you spread it on thick bread such as French or farmers bread. Also good with crackers.", 1, 4, 4, 1),
        ("Chicken Cordon Bleu","This lightened version of Chicken Cordon Bleu remains tres délicieuse despite a modest amount of butter. Fix mashed potatoes and a side of green beans while the chicken bakes.", 4, 4, 1, 2),
        ("Spaghetti with Sausage and Simple Tomato Sauce","This versatile Italian dish goes from stovetop to table in less than 30 minutes. Serve with a simple salad for a filling weeknight meal.", 3, 4, 2, 2),
        ("Shrimp and Broccoli Stir-Fry","Stir-fry a zesty shrimp dish for a quick weeknight dinner. Spoon over basmati or jasmine rice. Try the recipe with chicken or steak, too.", 2, 4, 3, 2),
        ("Spicy Honey-Brushed Chicken Thighs","These sweet, Honey Chicken Thighs rank supreme, as one of the most popular Cooking Light chicken recipes of all time – and for good reason. Made in 30 minutes or less, this is the perfect busy weeknight dinner. By mixing a touch of sweet with a hint of spicy, a magical thing happens. Generously seasoned with chili powder, cumin, garlic and cider vinegar, there’s no room for lack of flavor here. Wonder what secret to mouthwatering thighs is? It’s in the broiler; this cooking method adds a distinctive crunchy outer crust and a tender, juicy inside. ", 3, 4, 4, 2),
        ("Cranberry Molasses Cake with Sweet Butter Sauce","This classic cranberry molasses cake, served warm with sweet butter sauce and a scoop of vanilla ice cream, is an extra-special treat for a holiday or really any night of the week.", 2, 4, 1, 3),
        ("Chocolate-Peanut Butter Cookie Treats","Prize-Winning Recipe 2009! Here's a must-try cookie treat that's reminiscent of a favorite sweet cereal snack with chocolate, peanut butter and powdered sugar.", 3, 4, 2, 3),
        ("White Chocolate Cheesecake Cookie Lasagna","This creamy cheesecake dessert lasagna is a potlucker's fantasy! Easy to prep ahead of time, and it travels like a dream!", 4, 4, 3, 3),
        ("Peppermint Sugar Cookie Bark","This deliciously simple almond bark is a two-for-one treat made with white chocolate and peppermint on a sugar cookie base.", 1, 4, 4, 3);

INSERT INTO Vote (user_id, recipe_id, vote)
VALUES  (1,1,1),
        (2,1,1),
        (3,1,1),
        (4,1,1),
        (1,2,1),
        (2,2,1),
        (3,2,1),
        (4,2,-1),
        (1,3,1),
        (2,3,1),
        (3,3,-1),
        (4,3,-1),
        (1,4,-1),
        (2,4,1),
        (3,4,-1),
        (4,4,-1),
        (1,5,1),
        (2,5,1),
        (3,5,1),
        (4,5,1),
        (1,6,1),
        (2,6,1),
        (3,6,-1),
        (4,6,1),
        (1,7,1),
        (2,7,-1),
        (3,7,-1),
        (4,7,1),
        (1,8,1),
        (2,8,-1),
        (3,8,1),
        (4,8,1),
        (1,9,1),
        (2,9,-1),
        (3,9,-1),
        (4,9,1),
        (1,10,1),
        (2,10,-1),
        (3,10,1),
        (4,10,1),
        (1,11,1),
        (2,11,1),
        (3,11,1),
        (4,11,1),
        (1,12,1),
        (2,12,-1),
        (3,12,-1),
        (4,12,-1);


INSERT INTO Steps (recipe_id, step_num, step_instruction)
VALUES  (1,1,"In a large bowl, combine the cheeses, bacon and seasonings; mix well. Spoon about 2 tablespoonfuls into each pepper half. Roll in bread crumbs."),
        (1,2,"Place in a greased 15x10x1-in. baking pan. Bake, uncovered, at 325° for 15 minutes for spicy flavor, 25 minutes for medium and 35 minutes for mild. Serve with sour cream, dip or dressing. Yield: about 2 dozen."),
        (2,1,"Preheat oven to 350°. Spread cream cheese into an ungreased shallow 1-qt. baking dish. Layer with chicken, wing sauce and salad dressing. Sprinkle with cheese."),
        (2,2,"Bake, uncovered, 20-25 minutes or until cheese is melted. Serve with baguette slices. Yield: about 2 cups."),
        (3,1,"Mash avocados with garlic and salt. Stir in remaining ingredients. Yield: 2 cups."),
        (4,1,"Mix cream cheese, sour cream, feta cheese, garlic powder, and dill weed in a bowl until well blended."),
        (4,2,"Cover and refrigerate for 30 minutes before serving."),
        (5,1,"Preheat oven to 350°."),
        (5,2,"Place broth in a small microwave-safe bowl; microwave at high 15 seconds or until warm. Stir in butter and garlic. Combine breadcrumbs, Parmigiano-Reggiano, and paprika in a medium shallow bowl; set aside."),
        (5,3,"Place each chicken breast half between 2 sheets of heavy-duty plastic wrap, and pound each to 1/4-inch thickness using a meat mallet or rolling pin. Sprinkle both sides of chicken with salt, oregano, and pepper. Top each breast half with 1 slice of prosciutto and 1 tablespoon mozzarella. Roll up each breast half jelly-roll fashion. Dip each roll in chicken broth mixture; dredge in breadcrumb mixture. Place rolls, seam side down, in an 8-inch square baking dish coated with cooking spray. Pour remaining broth mixture over chicken. Bake at 350° for 28 minutes or until juices run clear and tops are golden."),
        (6,1,"Preheat broiler."),
        (6,2,"Arrange sausage on a small baking sheet. Broil sausage 5 minutes on each side or until done. Remove pan from oven (do not turn broiler off). Cut sausage into 1/4-inch-thick slices. Arrange slices in a single layer on baking sheet. Broil sausage slices 2 minutes or until browned"),
        (6,3,"Cook pasta according to package directions, omitting salt and fat; drain."),
        (6,4,"Place tomatoes in a food processor; process until almost smooth. Heat olive oil in a large nonstick skillet over medium-high heat. Add crushed red pepper and minced garlic; sauté 1 minute. Stir in tomatoes, sugar, and salt; cook 4 minutes or until slightly thick. Add sausage and cooked pasta to pan; toss well. Top with fresh basil and Parmigiano-Reggiano."),
        (7,1,"Combine first 6 ingredients in a small bowl, stirring with a whisk."),
        (7,2,"Heat 2 teaspoons canola oil in a large nonstick skillet over medium-high heat. Add ginger and garlic to pan; stir-fry 30 seconds. Sprinkle shrimp with salt. Add shrimp to pan, and stir-fry 3 minutes or until done. Remove shrimp mixture from the pan."),
        (7,3,"Add remaining 1 teaspoon canola oil to pan. Add broccoli and onion to pan; stir-fry 4 minutes or until broccoli is crisp-tender. Add shrimp mixture and broth mixture to pan; cook 1 minute or until thickened, stirring constantly."),
        (8,1,"Preheat broiler."),
        (8,2,"Combine first 6 ingredients in a large bowl. Add chicken to bowl; toss to coat. Place chicken on a broiler pan coated with cooking spray. Broil chicken 5 minutes on each side."),
        (8,3,"Combine honey and vinegar in a small bowl, stirring well. Remove chicken from oven; brush 1/4 cup honey mixture on chicken. Broil 1 minute. Remove chicken from oven and turn over. Brush chicken with remaining honey mixture. Broil 1 additional minute or until chicken is done."),
        (9,1,"Heat oven to 350°F. Spray bottom and sides of 13x9-inch pan with cooking spray."),
        (9,2,"In large bowl, beat eggs, 3/4 cup sugar, the molasses and water with whisk. In medium bowl, mix flour, salt and baking soda. Stir flour mixture into liquid mixture just until moistened; fold in cranberries. Pour mixture in pan."),
        (9,3,"Bake 37 to 42 minutes or until toothpick inserted in center comes out clean. Cool 20 minutes."),
        (9,4,"In 2-quart saucepan, heat Sweet Butter Sauce ingredients to simmering over medium heat, stirring constantly, until slightly thickened and sugar is dissolved."),
        (9,5,"Spray edge of sharp knife with cooking spray; cut warm cake into 5 rows by 4 rows. Serve cake with warm butter sauce."),
        (10,1,"Heat oven to 375°F. In large bowl, stir cookie mix, oil, water and egg until soft dough forms."),
        (10,2,"Shape dough into 1-inch balls. On ungreased cookie sheets, place balls 2 inches apart. Do not flatten."),
        (10,3,"Bake 8 to 9 minutes or until edges are light golden brown. Cool 2 minutes; remove from cookie sheets to cooling racks. Cool completely, about 15 minutes."),
        (10,4,"In small microwaveable bowl, microwave chocolate chips, butter and peanut butter uncovered on High 1 minute to 1 minute 30 seconds; stir until smooth. Stir in vanilla."),
        (10,5,"Place 1 1/2 cups powdered sugar in 1-gallon resealable food-storage plastic bag; set aside. Place 12 cooled cookies in large bowl. Pour one-third of chocolate mixture over cookies in bowl. Using rubber spatula, toss cookies gently to coat. Place 3 cookies at a time in bag with powdered sugar; seal bag. Gently turn bag to coat cookies. Remove cookies from bag to cooling rack to set. Repeat with 12 more cookies and half of remaining chocolate mixture, rewarming if needed; repeat again until all cookies are coated, adding additional powdered sugar to bag as needed."),
        (11,1,"Heat oven to 375°F. Make and bake drop cookies as directed on pouch. Cool completely, at least 30 minutes. In food processor, process half of the cookies to coarse crumbs. Remove to medium bowl. Process remaining cookies to coarse crumbs; add to bowl. Set aside."),
        (11,2,"In large bowl, beat cream cheese with electric mixer on medium speed until very smooth. Decrease to low speed; slowly add 1 cup milk. Beat in 2 boxes dry pudding mix, scraping bowl as needed. Slowly add remaining 3 cups milk; beat until well blended."),
        (11,3,"In ungreased 13x9-inch pan or baking dish, press half of the cookie crumbs firmly in bottom. Spread half of cream cheese pudding mixture, about 2 1/2 cups, over crumb bottom. Sprinkle remaining cookie crumbs on top of cream cheese pudding layer. Spread remaining cream cheese pudding mixture on top. Cover and refrigerate 4 hours. When ready to serve, spread whipped topping on top. Sprinkle with candy sprinkles. Cover and refrigerate leftovers."),
        (12,1,"Heat oven to 375°F. Line large cookie sheet with foil. In medium bowl, stir cookie mix, butter and egg until soft dough forms. Press dough into 12-inch square on cookie sheet."),
        (12,2,"Bake 10 to 14 minutes or until light golden brown; cool."),
        (12,3,"In microwavable bowl, microwave white vanilla baking chips uncovered on High 30 to 60 seconds, stirring every 30 seconds, until chips can be stirred smooth. Pour and spread over cooled cookie base. Immediately sprinkle with candy. Let stand until set, about 30 minutes."),
        (12,4,"Gently break up cookie bark. Store tightly covered.");