Spaceship ship;
int maxSpeed;
double acceleration;
int numAsteroid;
ArrayList<Asteroid> debris;
ArrayList<Bullet> bullets;
Star[] nightSky;
boolean dPressed, aPressed, wPressed, sPressed, qPressed, rPressed, pPressed, spacePressed;
boolean gameOver;

public void setup() {
  size(500, 500);
  background(0);

  maxSpeed = 3;
  acceleration = 0.1;
  numAsteroid = 5;
  gameOver = false;

  nightSky = new Star[250];
  debris = new ArrayList<Asteroid>();
  bullets = new ArrayList<Bullet>();
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
  frameRate(-1);
  if (gameOver == false) {
    for (int i = 0; i < nightSky.length; i++)
      nightSky[i].show();
  }

  if (gameOver == true) {
    for (int i = 0; i < nightSky.length; i++)
      nightSky[i].party();
  }

  if (wPressed) {
    ship.accelerate(acceleration);
    if (ship.getXspeed() > maxSpeed)
      ship.setXspeed(maxSpeed);
    if (ship.getXspeed() < -maxSpeed)
      ship.setXspeed(-maxSpeed);

    if (ship.getYspeed() > maxSpeed)
      ship.setYspeed(maxSpeed);
    if (ship.getYspeed() < -maxSpeed)
      ship.setYspeed(-maxSpeed);
  }
  
  if (sPressed) {
    ship.accelerate(-acceleration);
    if (ship.getXspeed() > maxSpeed)
      ship.setXspeed(maxSpeed);
    if (ship.getXspeed() < -maxSpeed)
      ship.setXspeed(-maxSpeed);

    if (ship.getYspeed() > maxSpeed)
      ship.setYspeed(maxSpeed);
    if (ship.getYspeed() < -maxSpeed)
      ship.setYspeed(-maxSpeed);
  }

  if (dPressed)
    ship.turn(5);
  if (aPressed)
    ship.turn(-5);
  
  if (pPressed) {
    for (int i = 0; i < debris.size(); i++) {
      debris.remove(i);
    }
  }
  
  for (int i = 0; i < debris.size(); i++) {
    debris.get(i).move();
    debris.get(i).turn();
    debris.get(i).show();
    float d = dist((float)ship.getCenterX(), (float)ship.getCenterY(), (float)debris.get(i).getX(), (float)debris.get(i).getY());
    if (d < 20)
      debris.remove(i);
  }
  
  for (int j = 0; j < debris.size(); j++) {
    for (int i = bullets.size()-1; i > 0; i--) {
      if (dist((float)bullets.get(i).getX(), (float)bullets.get(i).getY(), (float)debris.get(j).getX(), (float)debris.get(j).getY()) < 20) {
        bullets.remove(i);
        debris.remove(j);
        break;
      }
    }
  }

  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).show();
    bullets.get(i).accelerate(5);
    bullets.get(i).move();
  }

  for (int i = bullets.size()-1; i > 0; i--) {
    if (Math.abs(bullets.get(i).getX()) > 500 || Math.abs(bullets.get(i).getY()) > 500)
      bullets.remove(i);
  }

  ship.show();
  ship.move();

  if (debris.size() == 0) // triggers gameOver
    gameOver = true;

  if (gameOver) {
    textSize(60);
    fill(255);
    text("You win!", 144, height/3);
    textSize(25);
    text("Press r to play again.", 140, 70 + height/3);
    if (rPressed) {
      for (int i = 0; i < numAsteroid; i++) {
        debris.add(i, new Asteroid());
      }
      acceleration += 0.1;
      maxSpeed += 3;
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
  if (key == 'p') {
    pPressed = true;
  }
  if (key == ' ') {
    bullets.add(new Bullet(ship));
    spacePressed = true;
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
  if (key == 'p') {
    pPressed = false;
  }
  if (key == ' ') {
    spacePressed = false;
  }
}
