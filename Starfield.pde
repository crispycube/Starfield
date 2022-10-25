Particle[] particles = new Particle[1001];
void setup(){
  noStroke();
  background(0, 0, 0, 20.0);
  size(1000, 1000);
  for(int i = 1; i < particles.length; i++){
    particles[i] = new Particle();
  }
  particles[0] = new Oddball();
}

void draw(){
  background(0, 0, 0, 20.0);
  particles[0].move();
  particles[0].show();
  for(int i = 1; i < particles.length; i++){
    particles[i].move();
    particles[i].show();
  }
}

class Particle{
  double myX, myY, mySpeed, myAngle;
  color myCol;
  Particle(){
    myAngle = Math.random()*2*Math.PI;
    myCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySpeed = Math.random()*20 + 5;
    myX = Math.random()*200 + 400;
    myY = Math.random()*200 + 400;
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  void show(){
    fill(myCol);
    ellipse((float)myX, (float)myY, 10, 10);
  }
}

class Oddball extends Particle {
  Oddball(){
    myAngle = Math.random()*2*Math.PI;   
    myCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySpeed = Math.random()*20 + 5;
    myX = Math.random()*200 + 400;
    myY = Math.random()*200 + 400;
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed/3;
    myY += Math.sin(myAngle) * mySpeed/3;
  }
  void show(){
    fill(myCol);
    ellipse((float)myX, (float)myY, 100, 100);
  }
}
