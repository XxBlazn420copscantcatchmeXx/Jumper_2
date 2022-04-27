Player player;
ArrayList<Platform> platforms;
float cameraOffset = 100;
int score = 0;
int minPlatformDist = 80;
int maxPlatformDist = 140;
int minPlatformWidth = 20;
int maxPlatformWidth = 70;
int platformTop = 800;

boolean gameOver = false;

void setup(){
  size(450, 800);
  //frameRate(10);
  player = new Player(width/2, height-60, 16);
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(-5, height - 35, width + 10, 30, color(255, 0, 0)));  
  //platforms.add(new Platform(235, height - 200, 150, 20));
  //platforms.add(new Platform(135, height - 315, 35, 20));
  //platforms.add(new Platform(50, height - 400, 150, 20));
}

void draw(){
  background(51);
  player.move();
  for(Platform platform : platforms){
    platform.draw(cameraOffset);
    if(player.isColliding(platform)){
      player.resolveCollision(platform);
    }
  }
  player.draw(cameraOffset);
  
  score = max(score, (int)abs(player.y - height));
  
  textSize(30);
  fill(255, 0, 0);
  text("Score: " + score, 10, 50);
  
  //Camera follow player
  //cameraOffset = cameraOffset + 0.05f * ((player.y - 3*height/4) - cameraOffset);
  
  //Camera move self
  cameraOffset -= max(0.2, sqrt(score/1000f));
  
  while(platformTop > player.y - height){
    Platform platform = spawnRandomPlatform();
    println("Spawning platform at " + platform.y);
  }
  
  if(player.y > cameraOffset + height){
    println("Game over");
  }
}

Platform spawnRandomPlatform(){
  int x = (int) random(width);
  int y = platformTop - max(minPlatformDist, (int) random(maxPlatformDist));
  platformTop = y;
  int w = max(minPlatformWidth, (int) random(maxPlatformWidth));
  int h = 20;
  Platform platform;
  float r = random(1);
  if(r < 0.6){
    platform = new Platform(x, y, w, h, color(255, 0, 0));
  }
  else if(r < 0.9){
    platform = new SinkingPlatform(x, y, w, h, color(255, 0, 0));
  }
  else {
    platform = new MovingPlatform(x, y, w, h, color(255, 0, 0));
  }
  platforms.add(platform);
  return platform;
}

void keyPressed(){
  player.keyPressed();
}

void keyReleased(){
  player.keyReleased();
}
