var numSteps = 1;

$(document).ready(function(){
    $("#addStep").click(function() {
		numSteps++;
        var textArea = '<textarea cols="40" rows="6" name="step" placeholder="Type instruction here" required></textarea>';
        $("#steps").append("<div><h2>Step " + numSteps + ":</h2>" + textArea + "</div>");
    });
	
	$("#removeStep").click(function() {
		if(numSteps == 1) return;
        $("#steps").children().last().remove();
        numSteps--;
	});
	
	$("#upload").click(function() {
		$("#numSteps").val(numSteps);
	});
	
});