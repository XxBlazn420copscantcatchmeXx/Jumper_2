class Collider{
  float x;
  float y;
  float w;
  float h;
  
  public Collider(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean isColliding(Collider other){
    return this.x < other.x + other.w &&
    this.x + this.w > other.x &&
    this.y < other.y + other.h &&
    this.y + this.h > other.y;
  }
  
  public PVector calculateOverlay(Collider other)
  {
    float dx = 0;
    float dy = 0;

    if (this.x > other.x && this.x < other.x + other.w)
    {
        dx = other.x + other.w - this.x;
    }
    else if(this.x < other.x && this.x + this.w > other.x){
        dx = -(this.x + this.w - other.x);
    }
    
    if (this.y > other.y && this.y < other.y + other.h)
    {
        dy = other.y + other.h - this.y;
    }
    else if(this.y < other.y && this.y + this.h > other.y){
        dy = -(this.y + this.h - other.y);
    }

    return new PVector(dx, dy);
  }
}
