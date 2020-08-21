class Balls {
  PVector location = new PVector();
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float mass;

  Balls(float m,float x_, float y_) {
    location.set(x_,y_);
    mass = m;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    ellipse(location.x, location.y, mass*10, mass*10);
    
    if (location.y > height-mass*5+5){
      velocity.y *= -1;
    }
    if(location.x > width-mass*5+5 || location.x < mass*5+5){
      velocity.x *= -1;
    }
  }
}
