//button callback example
function setup() {
	createCanvas(1000,300);
}

function draw(){
	rect(100,100,200,100); //draw button
}

function mousePressed(){
	rectButton(100,100,200,100, buttonHit) //run our check for the button below
}

function rectButton(x,y,w,h, callback){
	var hit = false;

	hit = collidePointRect(mouseX,mouseY,x,y,w,h); //see if the mouse is in the rect

	if(hit){ //if its inside fire the callback
		callback(hit);
	}
}

function buttonHit(callbackData){
	//do things when the button gets pressed.......
	for(i=0;i<50; i++){
		for(j=0;j<50; j++){
			ellipse(i*100,j*100,50,50)
		}
	}
}

