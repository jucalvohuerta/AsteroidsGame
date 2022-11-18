Spaceship ship;
Star[] nightSky;
boolean dPressed, aPressed, wPressed, sPressed, qPressed;

public void setup() {
  size(400, 400);
  background(0);
  nightSky = new Star[250];
  ship = new Spaceship();
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i] = new Star();
  }
}
public void draw() {
  background(0);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i].show();
  }

  if (dPressed) {
    ship.turn(5);
  }
  if (aPressed) {
    ship.turn(-5);
  }
  if (wPressed) {
    ship.accelerate(0.1);
  }
  if (sPressed) {
    ship.accelerate(-0.1);
  }
  ship.show();
  ship.move();
}

public void keyPressed() {
  if (key == 'a') {
    aPressed = true;
  }
  if (key == 'd') {
    dPressed = true;
  }
  if (key == 'w') {
    wPressed = true;
  }
  if (key == 's') {
    sPressed = true;
  }
  if (key == 'q') {
    int randPointDirection = (int)(Math.random()*400);
    int randSetX = (int)(Math.random()*width);
    int randSetY = (int)(Math.random()*height);
    ship.setXspeed(0);
    ship.setYspeed(0);
    ship.setPointDirection(randPointDirection);
    ship.setCenterX(randSetX);
    ship.setCenterY(randSetY);
  }
}

public void keyReleased() {
  if (key == 'd') {
    dPressed = false;
  }
  if (key == 'a') {
    aPressed = false;
  }
  if (key == 'w') {
    wPressed = false;
  }
  if (key == 's') {
    sPressed = false;
  }
}
