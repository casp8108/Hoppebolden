//https://processing.org/examples/circlecollision.html

Balls[] ball = new Balls[10];
PVector wind = new PVector();

void setup() {
  size(1300, 800);
  for (int i = 1; i < ball.length+1; i++) {
    ball[i-1] = new Balls(map(i,1,10,2,5), i*100, 100+i*10);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < ball.length; i++) {
    float m = ball[i].mass;
    PVector gravity = new PVector(0, 0.1*m);
    ball[i].detec(i);
    ball[i].applyForce(gravity);
    ball[i].update();
    ball[i].display();
  }
  Ground();
}

void Ground() {
  fill(10, 250, 10);
  noStroke();
  triangle(width, height-width/10, 0, height, width, height);
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
