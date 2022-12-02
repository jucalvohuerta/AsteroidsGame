Spaceship ship;
Asteroid asteroid;
int numAsteroid;
ArrayList<Asteroid> debris;
Star[] nightSky;
boolean dPressed, aPressed, wPressed, sPressed, qPressed, rPressed;
boolean gameOver;

public void setup() {
  size(400, 400);
  background(0);
  numAsteroid = 5;
  gameOver = false;
  nightSky = new Star[250];
  debris = new ArrayList<Asteroid>();
  ship = new Spaceship();

  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i] = new Star();
  }
  for (int i = 0; i < numAsteroid; i++) {
    debris.add(i, new Asteroid());
  }
}
public void draw() {
  background(0);
  if (gameOver == false) {
    for (int i = 0; i < nightSky.length; i++)
      nightSky[i].show();
    if (wPressed) {
      ship.accelerate(0.1);
      if (ship.getXspeed() > 2)
        ship.setXspeed(2);
      if (ship.getXspeed() < -2)
        ship.setXspeed(-2);

      if (ship.getYspeed() > 2)
        ship.setYspeed(2);
      if (ship.getYspeed() < -2)
        ship.setYspeed(-2);
    }
    if (sPressed) {
      ship.accelerate(-0.2);
      if (ship.getXspeed() > 2)
        ship.setXspeed(2);
      if (ship.getXspeed() < -2)
        ship.setXspeed(-2);

      if (ship.getYspeed() > 2)
        ship.setYspeed(2);
      if (ship.getYspeed() < -2)
        ship.setYspeed(-2);
    }
  }
  if (gameOver == true) {
    for (int i = 0; i < nightSky.length; i++)
      nightSky[i].party();
    if (wPressed) {
      ship.accelerate(0.1);
      if (ship.getXspeed() > 5)
        ship.setXspeed(5);
      if (ship.getXspeed() < -5)
        ship.setXspeed(-5);

      if (ship.getYspeed() > 5)
        ship.setYspeed(5);
      if (ship.getYspeed() < -5)
        ship.setYspeed(-5);
    }
    if (sPressed) {
      ship.accelerate(-0.5);
      if (ship.getXspeed() > 5)
        ship.setXspeed(5);
      if (ship.getXspeed() < -5)
        ship.setXspeed(-5);

      if (ship.getYspeed() > 5)
        ship.setYspeed(5);
      if (ship.getYspeed() < -5)
        ship.setYspeed(-5);
    }
  }
  if (dPressed) {
    ship.turn(5);
  }
  if (aPressed) {
    ship.turn(-5);
  }

  for (int i = 0; i < debris.size(); i++) {
    debris.get(i).move();
    debris.get(i).show();
    float d = dist((float)ship.getCenterX(), (float)ship.getCenterY(), (float)debris.get(i).getX(), (float)debris.get(i).getY());
    if (d < 20)
      debris.remove(i);
  }
  ship.show();
  ship.move();
  println(ship.getXspeed(), ship.getYspeed());
  if (debris.size() == 0)
    gameOver = true;
  if (gameOver) {
    textSize(60);
    text("You win!!", 65, 150);
    textSize(25);
    text("Press r to play again.", 75, 180);
    if (rPressed) {
      for (int i = 0; i < numAsteroid; i++) {
        debris.add(i, new Asteroid());
      }
      gameOver = false;
      background(0);
    }
  }
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
  if (key == 'r') {
    rPressed = true;
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
  if (key == 'r') {
    rPressed = false;
  }
}
