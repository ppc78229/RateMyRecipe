<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/favicon.ico">

    <title>Rate My Recipe</title>

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link type="text/css" href="css/dashboard.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
      <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-brand" href="dashboard.html">Rate My Recipe</a>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          
          <li class="nav-item">
                	 <a href="index.html"><input type=submit value = "Logout"></a>
             </li>
          <li class="nav-item">
          	<span class="navbar-brand">&nbsp&nbspUser: ${username}</span>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
          <ul class="nav nav-pills flex-column">
            <form action='RecipeServlet' method='post'>
          	<input type="hidden" name="userID" value="${userID}"/>
          	<input type="hidden" name="username" value="${username}"/>
            <li class="nav-item">
              	<input class="nav-link" type="submit" name="dashboard" value="Dashboard"/>
            </li>
            <li class="nav-item">
              <input class="nav-link" type="submit" name="dashboard" value="Profile"/>
            </li>
            <li class="nav-item">
              <input id="bootstrap-override" class="nav-link" type="submit" name="dashboard" value="Upload"/>
            </li>
            <li class="nav-item">
              <input class="nav-link" type="submit" name="dashboard" value="Appetizer Recipes"/>
            </li>
            <li class="nav-item">
              <input class="nav-link" type="submit" name="dashboard" value="Entree Recipes"/>
            </li>
            <li class="nav-item">
              <input class="nav-link" type="submit" name="dashboard" value="Dessert Recipes"/>
            </li>
          </form>
          </ul>
        </nav>

        <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
          <h1>Upload</h1>
          <form id="upload" method="post" action="RecipeServlet">  
          	<input type="hidden" name="userID" value="${userID}"/>
          	<input type="hidden" name="username" value="${username}"/>
          <section class="row text-center placeholders">
            <div class="col-lg-6">
            <h2>Recipe Name:</h2><textarea cols="50" rows="1" name="recipeName" required="required"></textarea>
            <br>
            <h2>Recipe Description:</h2><textarea cols="40" rows="6" name="recipeDescription" required></textarea>  
            <br>
            <h2>Category:</h2>
            <select name="category">
                <option value="Appetizer">Appetizer</option>
                <option value="Entree" selected="selected">Entree</option>
                <option value="Dessert">Dessert</option>
            </select>
            <br>
            <br>
            <div id="steps">
	            <h2>Step 1:</h2><textarea cols="40" rows="6" name="step" placeholder="Type instruction here" required></textarea>
            </div>
            <br>
            <button type="button" id="addStep">Add Step</button>
			<button type="button" id="removeStep">Remove Step</button>	
			<br>
            <input class="options" name="upload" type="submit" value="Confirm">
            </div>
          </section>
          </form>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script type="text/javascript" src="js/jquery-3.2.1.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/upload.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
