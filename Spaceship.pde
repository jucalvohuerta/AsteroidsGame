class Spaceship extends Floater {
  Spaceship() {
    corners = 3;
    myCenterX = width/2;
    myCenterY = height/2;
    xCorners = new int[]{-15, 15, -15};
    yCorners = new int[]{10, 0, -10};
    myColor = 255;

    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }



  public void setCenterX(int x) {
    myCenterX = x;
  }
  public void setCenterY(int y) {
    myCenterY = y;
  }
  public void setPointDirection(int newPointDirection) {
    myPointDirection = newPointDirection;
  }
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void setXspeed(int x) {
    myXspeed = x;
  }
  public void setYspeed(int y) {
    myYspeed = y;
  }

  public double getXspeed() {
    return myXspeed;
  }
  public double getYspeed() {
    return myYspeed;
  }
}
