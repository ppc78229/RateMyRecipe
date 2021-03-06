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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
      <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-brand" href="index.html">Rate My Recipe</a>
    </nav>
    <div class="row">
    <div class="col-sm-4">
    <div class="login">
        <h2>Registration</h2>
            <div class="container">
            	<form action='RecipeServlet' method='post'>
	               	<label><b>First Name</b></label>
	                <input class="cred" type="text" placeholder="Enter First Name" name="first_name" required>
	                <label><b>Last Name</b></label>
	                <input class="cred" type="text" placeholder="Enter Last Name" name="last_name" required>
	                <label><b>Username</b></label>
	                <input class="cred" type="text" placeholder="Enter Username" name="username" required>
	                <label><b>Password</b></label>
	                <input class="cred" type="password" placeholder="Enter Password" name="password" required>
	                <input class="options" type="submit" name="register" value="Confirm">
                </form>
            </div>
            <#if message?has_content>
            	<p align="center"><font color="red">${message}</font></p>
            </#if>
      </div>
        
    </div>
    <div class="col-sm-8">
    <img class="carImage" src="img/recipeImage.jpg" alt="Log In Image" width="100%" height="100%">
    </div>
    </div>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script type="text/javascript" src="js/jquery-3.2.1.min.js"><\/script>')</script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script type="text/javascript" src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
