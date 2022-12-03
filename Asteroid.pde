class Asteroid extends Floater {
  private double rotSpeed;
  public Asteroid(){
    rotSpeed = 1 + (int)(2*Math.random());
    corners = 6;
    xCorners = new int[]{22, 9, -11, -22, -11, 9};
    yCorners = new int[]{0, 22, 22, 0, -22, -22};
    myColor = 120;
    myCenterX = 150 + (int)(400*Math.random());
    myCenterY = 150 + (int)(400*Math.random());
    
    myXspeed = 0.5 + (int)(1 * Math.random());
    myYspeed = 0.5 + (int)(1 * Math.random());
    myPointDirection = 0;
  }
  
  public double getX(){
    return myCenterX;
  }
  
  public double getY(){
    return myCenterY;
  }
  
  public void move(){
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    turn(rotSpeed);
    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  }
}
