Spaceship ship;
Star[] nightSky;
boolean dPressed, aPressed, wPressed, sPressed, qPressed;

public void setup() {
  size(400, 400);
  background(0);
  nightSky = new Star[200];
  ship = new Spaceship();
  for(int i = 0; i < nightSky.length; i++){
    nightSky[i] = new Star();
  }
}
public void draw() {
  background(0);
  ship.show();
  
  for(int i = 0; i < nightSky.length; i++){
    nightSky[i].show();
  }
  if (qPressed == true)
    ship.hyperspace();
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
    qPressed = true;
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
