class Spaceship extends Floater {
  Spaceship() {
    corners = 3;
    xCorners = new int[]{200, 184, 184};
    yCorners = new int[]{200, 208, 192};
    myColor = 100;
    myCenterX = 200;
    myCenterY = 200;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void show() {
    triangle(xCorners[0], yCorners[0], xCorners[1], yCorners[1], xCorners[2], yCorners[2]);
  }
  public void turn() {
  }
  public void hyperspace() {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = 0;
    myCenterY = 0;
  }
}
