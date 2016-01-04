//button callback example
var hit = false;
function setup() {
	createCanvas(1000,300);
}

function draw(){
	noStroke();
	rect(400,100,200,100);

	hit = collidePointRect(mouseX,mouseY,400,100,200,100); //see if the mouse is in the rect

	if(hit){ //change color!
		fill('purple')
	}else{
		fill('green')
	}
}

