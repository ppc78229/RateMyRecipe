$(document).ready(function(){
    $("#selectRecipe").submit(function() {
        var recipeID = $(this).find("input[type=submit]:focus").parent().parent().children().first().text();
        $("#recipeID").val(recipeID);
        $("#selectRecipe")[0].submit();
    });
	
});