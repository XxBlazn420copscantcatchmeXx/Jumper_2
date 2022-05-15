class Platform extends Collider {
  color platformColor;
  
  public Platform(float x, float y, float w, float h, color platformColor){
    super(x, y, w, h);
    this.platformColor = platformColor;
  }

  void resolveCollision(Player player){
    PVector collision = player.calculateOverlay(this);
    if(abs(collision.x) < abs(collision.y)){
      player.x += collision.x;
      player.vel.x = 0;
    }
    else {
      player.y += collision.y;
      player.vel.y = 0;
      if(player.y < y){
        player.platform = this;
      }
      else{
        player.platform = null;
      }
    }
  }
    
  void draw(float cameraOffset){
    fill(platformColor);
    rect(x, y - cameraOffset, w, h);
  }
}
