Player player;
ArrayList<Platform> platforms;
float cameraOffset;
int score;
int minPlatformDist = 60;
int maxPlatformDist = 100;
int minPlatformWidth = 20;
int maxPlatformWidth = 70;
int platformTop;

boolean gameOver;

HighscoreController highscoreController;
char[] name;
int nameCharsWritten;

void setup(){
  size(450, 800);
  //frameRate(10);
  player = new Player(width/2, height-60, 16);
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(-5, height - 35, width + 10, 30, color(255, 0, 0)));  
  
  highscoreController = new HighscoreController();
  name = new char[3];
  nameCharsWritten = 0;
  gameOver = false;
  score = 0;
  cameraOffset = 100;
  platformTop = 800;
}

void draw(){
  if(gameOver){
    fill(0, 0, 0, 20);
    rect(-5, -5, width + 10, height + 10);
    
    textSize(60);
    fill(255, 0, 0);
    text("Game over", (width - textWidth("Game over"))/2, 80);
    textSize(48);
    
    text("Highscores", (width - textWidth("Highscores"))/2, 130);
   
    ArrayList<Highscore> scores = highscoreController.loadScores();
    int y = 200;
    textSize(40);
    for(int i = 0; i < 8 && i < scores.size(); i++){
      Highscore score = scores.get(i);
      text(score.name, 50, y);
      text(score.score, width - textWidth(score.score + "") - 50, y);
      y += 50;
    }
    
    y += 10;
    
    textSize(48);
    text("Your score", (width - textWidth("Your score"))/2, y);

    y += 50;

    textSize(40);
    
    String scoreName = "";
    
    for(char c : name){
      if(c != 0){
        scoreName += c;
      }
      else {
        scoreName += '_';
      }
    }
    
    text(scoreName, 50, y);
    text(score, width - textWidth(score + "") - 50, y);
    
    if(nameCharsWritten == 3){
      text("Press SPACE to retry",(width - textWidth("Press SPACE to retry"))/2, height - 50);
    }
    else {
      text("Type your name",(width - textWidth("Type your name"))/2, height - 50);
    }
    
    return;
  }
  
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
  if(score > 4500){
    cameraOffset -= 1.5f;
  }
  else{
    cameraOffset -= max(0.2f, sqrt(score/2000f));
  }
  
  while(platformTop > player.y - height){
    Platform platform = spawnRandomPlatform();
    println("Spawning platform at " + platform.y);
  }
  
  if(player.y > cameraOffset + height){
    gameOver = true;
  }
}

Platform spawnRandomPlatform(){
  int w = max(minPlatformWidth, (int) random(maxPlatformWidth));
  int h = 20;
  
  int x = (int) random(width - w);
  int y = platformTop - max(minPlatformDist, (int) random(maxPlatformDist));
  platformTop = y;

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
  if(!gameOver){
    player.keyPressed();
  }
  else {
    if(nameCharsWritten < 3 && (key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z')){
      name[nameCharsWritten] = Character.toUpperCase(key);
      nameCharsWritten++;
    }
    else if(nameCharsWritten == 3 && key == ' '){
      highscoreController.saveScore(new Highscore(String.valueOf(name), score));
      setup();
    }
  }
}

void keyReleased(){
  if(!gameOver){
    player.keyReleased();
  }
}
