$(document).ready(function () {
	var scrollSpeed = 1;
	var imgWidth = 5;
	var posX = 0;
	setInterval(function(){
		if (posX >= imgWidth) posX= 0;
		posX += scrollSpeed;
		$('body').css("background-position",posX+"px 0px");
	}, 1);
});