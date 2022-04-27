class MovingPlatform extends Platform {
  boolean movingRight;
  
  public MovingPlatform(float x, float y, float w, float h, color platformColor){
    super(x, y, w, h, platformColor);
    movingRight = random(1) <= .5;
  }
  
  void draw(float cameraOffset){
    super.draw(cameraOffset);
    
    if(x + w >= width){
      movingRight = false;
    }
    else if (x <= 0){
      movingRight = true;
    }
    
    if(movingRight){
      x++;
    }
    else {
      x--;
    }
  }
}
