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
      <span class="navbar-brand">Rate My Recipe</span>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          
          <li class="nav-item">
          	<a href="index.html"><input type=submit value ="Logout"></a>
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
          <h1>Dashboard</h1>
            
          <section class="row text-center placeholders">
            <div class="col-lg-6">
            <h2>Welcome to the world's first recipe website where recipes appear in a ranked system.</h2>
            </div>
          </section>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script "text/javascript" src="js/jquery-3.2.1.min.js"><\/script>')</script>
    <script "text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script "text/javascript" src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script "text/javascript" src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>