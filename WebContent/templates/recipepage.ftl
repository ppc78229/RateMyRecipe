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
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
          <ul class="nav nav-pills flex-column">
            <form action='RecipeServlet' method='post'>
          	<input type="hidden" name="userID" value="${userID}"/>
            <li class="nav-item">
              	<input id="bootstrap-override" class="nav-link" type="submit" name="dashboard" value="Dashboard"/>
            </li>
            <li class="nav-item">
              <input class="nav-link" type="submit" name="dashboard" value="Profile"/>
            </li>
            <li class="nav-item">
              <input class="nav-link" type="submit" name="dashboard" value="Upload"/>
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
          <h1>${recipe.recipeName}</h1>
          	<form action="RecipeServlet" method="post">
          		<input type="hidden" name="userID" value="${userID}"/>
	            <input type=submit name="vote" value = "^ Upvote">
	            <br>
	            <br>
	            <input type=submit name="vote" value = "v Downvote">
	        </form>
            <br>
            <p>Author: ${recipe.username}</p>
            <p>Recipe ID: ${recipe.ID?string}</p>
            <p>Vote Sum = ${recipe.voteSum?string}</p>
            <p>Number of votes = ${recipe.numVotes?string}</p>
            <p>Description: ${recipe.recipeDescr}</p>
            <h2><u>Recipe Steps:</u></h2>
            <table style="width:100%">
            	<tr>
            		<th>#</th>
            		<th>Instruction</th>
            	</tr>
            <#list steps as step>
            	<tr>
            		<td>${step.stepNum?string}</td>
            		<td>${step.step}</td>
            	</tr>
            </#list>
			</table>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script "text/javascript" src="js/jquery-3.2.1.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
