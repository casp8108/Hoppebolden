class Balls {
  PVector location = new PVector();
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  float mass;
  color collar = color(0);

  Balls(float m, float x_, float y_) {
    location.set(x_, y_);
    mass = m;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void detec(int count) {
    for (int i = 0; i < ball.length; i++) {
      if (i != count) {
        if (dist(location.x, location.y, ball[i].location.x, ball[i].location.y) < mass*5+ball[i].mass*5) {
          velocity.x *= -1;
          ball[i].velocity.x *= -1;
        }
      }
    }
  }
  void display() {
    fill(collar);
    noStroke();
    ellipse(location.x, location.y, mass*10, mass*10);

    if (location.y > height-130*location.x/width-mass*10) {
      velocity.y *= -1;
      velocity.x -= 1;
    }
    if (location.x > width-mass*10 || location.x < mass*10) {
      velocity.x *= -1;
    }
  }
}
