class Raindrop {

  PVector acceleration;
  PVector location;
  PVector velocity;
  float mass;

  Raindrop(float x, float y) {
    mass = random(1,4);
    location = new PVector(x,y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    int i = 0;
    mass = mass+mass*sin(i);
    i++;
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    velocity.limit(8);
  }
  
  void checkEdges(){
    if(location.x > width) location.x = 0;
    else if(location.x < 0) location.x = width;
    
    if(location.y > height) location.y = 0;
  }
  
  void display(float _volume){
    float bright = map(_volume,0,200,0,1);
    noStroke();
    fill(25+125*bright);
    ellipse(location.x,location.y,2,5);
  }
}

