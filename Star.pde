class Star //note that this class does NOT extend Floater
{
  private int mX, mY, couleur;
  public Star() {
    mX = (int)(Math.random()*500);
    mY = (int)(Math.random()*500);
    couleur = (int)(Math.random()*255);
  }
  public void show() {
    fill(couleur);
    noFill();
    ellipse(mX, mY, 5, 5);
  }
}
