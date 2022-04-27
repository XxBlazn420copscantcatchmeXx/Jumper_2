import java.awt.event.KeyEvent;

class Player extends Collider{
  PVector vel = new PVector(0, 0);
  Platform platform = null;
  
  KeyInput space = new KeyInput(' ', 0);
  KeyInput left = new KeyInput(CODED, LEFT);
  KeyInput right = new KeyInput(CODED, RIGHT);
  
  public Player(float x, float y, float size){
    super(x, y, size, size);
  }
  
  void jump(){
    if(wallJump() || platform == null){
      return;
    }
    
    vel.add(0, -5, 0);
    platform = null;
  }
  
  boolean wallJump(){
    //if(x == 0){
      
    //  vel.add(20, -20, 0);
    //  return true;
    //}
    
    return false;
  }
  
  void resolveCollision(Platform other){
    other.resolveCollision(this);
  }
  
  void move(){
    if(platform != null && (x + w < platform.x || x > platform.x + platform.w)){
      platform = null;
    }
    
    if(platform == null){
      float gravity = space.isPressed ? 0.07 : 0.15;
      vel.add(0, gravity, 0);
    }
    else if(platform instanceof MovingPlatform){
      MovingPlatform moving = (MovingPlatform) platform;
      if(moving.movingRight){
        x++;
      }
      else{
        x--;
      }
    }
    
    float speed = true ? 2.0f : 0.25f;
    float deacceleration = true ? 0.65 : 0.95;  
    
    float xInput = 0;
    if(left.isPressed){
      xInput -= speed;
    }
    if(right.isPressed){
      xInput += speed;
    }
      
    vel.x = (vel.x + xInput) * deacceleration;
    
    x += vel.x;
    y += vel.y;
    
    if(y + h >= height){
      vel.y = 0;
      platform = new Platform(0,0,0,0, color(0));
    }
    
    if(x < 0){
      x = 0;
      vel.x = 0;
    }
    else if(x + w > width){
      x = width - w;
      vel.x = 0;
    }
  }
  
  void draw(float cameraOffset){
    fill(0, 0, 255);
    rect(x, y - cameraOffset, w, h, 3f);
  }
  
  void keyPressed(){
    space.keyPressed();
    left.keyPressed();
    right.keyPressed();
    
    if(space.isPressed){
      jump();
    }
  }
  
  void keyReleased(){
    space.keyReleased();
    left.keyReleased();
    right.keyReleased();
  }
}
