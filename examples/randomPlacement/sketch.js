var circs = [];
var numCircs = 60;
var cir;
function setup() {
	createCanvas(1000,300);

	for(i=0;i<numCircs;i++){
		c = new circObj(random(30,60), i ) // generate a random sized circObj and store it's ID for later
		circs.push(c); //add it to the array.
	}
}

function draw(){
	background(255);

	for(j=0;j<numCircs;j++){
		circs[j].place(circs); //try to place a circObj on the screen
	}

	for(k=0;k<numCircs;k++){ // display the objects
		circs[k].disp();
	}
}

function circObj(d, id){
	this.x = random(width)
	this.y = random(height)
	this.d = d
	this.id = id;
	this.color = color(random(255),random(255),random(255))
	this.hit = true;

	this.place = function(objArray){

			for(i=0;i<objArray.length;i++){
				if(this.id != i){ //dont do the check if it is looking at itself

					this.hit = collideCircleCircle(this.x, this.y, this.d, objArray[i].x, objArray[i].y, objArray[i].d); //colliding with anything?

					if(this.hit == true){ // if we ever get a true we have to try again, this works since we iterate down through the objects one by one.
						//try again:
						this.x = random(width)
						this.y = random(height)
					}
				}
			}
	}

	this.disp = function(){
		noStroke();
		fill(this.color);
		ellipse(this.x,this.y,this.d,this.d);

	}

}
