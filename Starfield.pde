Particle[] particles = new Particle[1001];
void setup() {
  noStroke();
  background(0);
  size(1000, 1000);
  for (int i = 1; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  particles[0] = new Oddball();
}

void draw() {
  fill(0, 25);
  rect(0, 0, 1000, 1000);
  particles[0].move();
  particles[0].show();
  for (int i = 1; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}

void mousePressed() {
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle((float)mouseX, (float)mouseY);
  }
  particles[0] = new Oddball((float)mouseX, (float)mouseY);
}

class Particle {
  double myX, myY, mySpeed, myAngle;
  color myCol;
  Particle() {
    myAngle = Math.random()*2*Math.PI;
    myCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySpeed = Math.random()*20 + 5;
    myX = 500;
    myY = 500;
  }
  Particle(float x, float y) {
    myAngle = Math.random()*2*Math.PI;
    myCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySpeed = Math.random()*20 + 5;
    myX = x;
    myY = y;
  }
  void move() {
    myX += Math.cos(myAngle) * mySpeed/5;
    myY += Math.sin(myAngle) * mySpeed/5;
  }
  void show() {
    fill(myCol);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}

class Oddball extends Particle {
  int size;
  Oddball() {
    myAngle = Math.random()*2*Math.PI;   
    myCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySpeed = Math.random()*20 + 5;
    myX = Math.random()*200 + 400;
    myY = Math.random()*200 + 400;
    size = 10;
  }
  Oddball(float x, float y) {
    myAngle = Math.random()*2*Math.PI;   
    myCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySpeed = Math.random()*20 + 5;
    myX = x;
    myY = y;
    size = 10;
  }
  void move() {
    myX += Math.cos(myAngle) * mySpeed/7;
    myY += Math.sin(myAngle) * mySpeed/7;
    size += 1;
  }
  void show() {
    fill(myCol);
    ellipse((float)myX, (float)myY, size, size);
  }
}
