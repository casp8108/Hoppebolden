Balls[] ball = new Balls[100];
PVector wind = new PVector();

void setup() {
  size(1200, 800);
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Balls(random(0.5, 5), 26, 26);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < ball.length; i++) {
    float m = ball[i].mass;
    PVector gravity = new PVector(0,0.1*m);
    ball[i].applyForce(gravity);
    ball[i].update();
    ball[i].display();
  }
}
void keyPressed() {
  if (key == 'w') {
    wind.set(0, -1);
  }
  if (key == 'a') {
    wind.set(-1, 0);
  }
  if (key == 's') {
    wind.set(0, 1);
  }
  if (key == 'd') {
    wind.set(1, 0);
  }
  for (int i = 0; i < ball.length; i++) {
    ball[i].applyForce(wind);
  }
}
