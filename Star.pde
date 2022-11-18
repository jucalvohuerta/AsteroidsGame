class Star //note that this class does NOT extend Floater
{
  private int mX, mY, couleur;
  public Star() {
    mX = (int)(Math.random()*400);
    mY = (int)(Math.random()*400);
    couleur = (int)(Math.random()*255);
  }
 
  public void show() {
    fill(couleur);
    noStroke();
    ellipse(mX, mY, 2.5, 2.5);
  }
}
