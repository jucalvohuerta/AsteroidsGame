class Bullet extends Floater {
  public double dRadians;
  public Bullet() {
    myCenterX = 200;
    myCenterY = 200;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    dRadians = 0;
  }

  public Bullet(Spaceship theShip) {
    dRadians = theShip.getPointDirection() * (Math.PI/180);
    myCenterX = theShip.getCenterX();
    myCenterY = theShip.getCenterY();
    myXspeed = 5 * Math.cos(dRadians) * theShip.getXspeed();
    myYspeed = 5 * Math.sin(dRadians) * theShip.getYspeed();
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection * (Math.PI/180);
  }

  public void show() {
    fill(#E54B4B);
    stroke(#B31919);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  public void move() {
    myCenterX += myXspeed;    
    myCenterY += myYspeed;
  }
  
  public double getX() {
     return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
