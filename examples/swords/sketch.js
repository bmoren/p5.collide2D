var p1, p2;
var p1controls = [87,68,83,65,69] //up,right,down,left,HIT (WDSAE)
var p2controls = [73,76,75,74,85] //up,right,down,left,HIT (ILKJU)

function setup() {
	createCanvas(1000,300);

	p1 = new playerObj('green', 50, 3, p1controls)
	p2 = new playerObj('blue', 50, 3, p2controls)
}

function draw(){
	background(255);

	//draw and collide the players
	p1.disp();
	p1.collide(p2);
	p2.disp();
	p2.collide(p1);
}

function playerObj(color, sz, speed, controls){
	this.x = random(width)
	this.y = random(height)
	this.linex;
	this.liney;
	this.speed = speed;
	this.swordSpeed = 0.05
	this.color = color;
	this.saveColor = color;
	this.d = sz;
	this.angle = 0;
	this.scalar = sz + 20;
	this.hit = false
	this.score = 0;
	this.gate = false;
	this.overlap = false;


	this.disp = function(){
			//move the player
			if( keyIsDown( controls[0] )){
				//up
				this.y -= this.speed
			}
			if( keyIsDown( controls[1] )){
				// right
				this.x += this.speed
			}
			if( keyIsDown( controls[2] )){
				//down
				this.y += this.speed
			}
			if( keyIsDown( controls[3] )){
			//left
			this.x -= this.speed
			}
			if( keyIsDown( controls[4] )){
				this.angle += this.swordSpeed ;
			}

		//loop around the edges
		if(this.x < 0){
			this.x = width;
		}
		if(this.x > width){
			this.x = 0;
		}
		if(this.y < 0){
			this.y = height;
		}
		if (this.y > height){
			this.y = 0;
		}
		//draw the sword
		this.linex = this.x + cos(this.angle) * this.scalar;
		this.liney = this.y + sin(this.angle) * this.scalar;
		strokeWeight(1);
		stroke(this.color);
		line(this.x,this.y,this.linex,this.liney)

		//draw the player
		noStroke();
		fill(this.color);
		ellipse(this.x,this.y,this.d,this.d);

		//draw the score
		text(this.score,this.x-3,this.y-30)
	}

	this.collide = function(enemy){

		this.overlap = collideCircleCircle(this.x,this.y,this.d,enemy.x,enemy.y,enemy.d) // are we overlapping with the enemy?
		this.hit = collideLineCircle(this.x, this.y, this.linex, this.liney, enemy.x, enemy.y, enemy.d); //sword hitting the other player?

		if(this.overlap == false){ // prevent from scoreing id overlapped
			if(this.gate == false){ //debounce madness so only one point/hit gets added
				if(this.hit == true){
					this.score++
					this.gate = true;

					//quickly change the enemy's color to red for 100ms
					enemy.color = 'red'
					setTimeout(function(){
						enemy.color = enemy.saveColor;
					},100)
				}
			}
		}

		if(this.hit == false){
			this.gate = false;
		}
	}
	
} // close playerObj
