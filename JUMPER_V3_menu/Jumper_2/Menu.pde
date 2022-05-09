class menu {
  int fpb1x = width/2-150;//Frontpagebutton1
  int fpb1y = 200;
  int fpb1width = 300;
  int fpb1height = 50; 

  int fpb2x = width/2-150;
  int fpb2y = 300;
  int fpb2width = 300;
  int fpb2height = 50;

  int sb1x = width/2-150;
  int sb2y = 600;
  int sb2width = 300;
  int sb2height = 50;

  int pb1x = width/2-150;
  int pb1y = 300;
  int pb1width = 300;
  int pb1height = 50;

  int pb2x = width/2-150;
  int pb2y = 400;
  int pb2width = 300;
  int pb2height = 50;

  int page = 1;

  void display() {
    switch(page) {
    case 1:
      frontpage();
      break;
    case 2:
      scorepage();
      break;
    case 3:
      pausepage();
      break;
    }
  }



  void frontpage() {
    fill(0);
    rect(0, 0, width, height);
    textSize(50);
    fill(255,0,0);
    text("JUMPER",width/2-80,100);
    textSize(20);
    text("Controls: Arrows to move, space to jump",width/2-200, 600);
    textSize(40);
    if (mouseX >= fpb1x && mouseX <= fpb1x + fpb1width && mouseY >= fpb1y && mouseY <=fpb1y + fpb1height && mousePressed == true) {
      page = 0;
    }
    if (mouseX >= fpb1x && mouseX <= fpb1x + fpb1width && mouseY >= fpb1y && mouseY <=fpb1y + fpb1height) {
      fill(214);
      println("fill");
    } else fill(255);

    rect(fpb1x, fpb1y, fpb1width, fpb1height);
    fill(255, 0, 0);
    text("START", fpb1x + 90, fpb1y+40);
    noFill();

    if (mouseX >= fpb2x && mouseX <= fpb2x + fpb2width && mouseY >= fpb2y && mouseY <=fpb2y + fpb2height && mousePressed == true) {
      page = 2;
    }

    if (mouseX >= fpb2x && mouseX <= fpb2x + fpb2width && mouseY >= fpb2y && mouseY <=fpb2y + fpb2height) {
      fill(214);
      println("fill");
    } else fill(255);

    rect(fpb2x, fpb2y, fpb2width, fpb2height);
    fill(255, 0, 0);
    text("SCOREBOARD", fpb2x + 20, fpb2y+40);
  }
  void scorepage() {
    fill(0);
    rect(0, 0, width, height);

    if (mouseX >= sb1x && mouseX <= sb1x + sb2width && mouseY >= sb2y && mouseY <=sb2y + sb2height) {
      fill(214);
      println("fill");
    } else fill(255);
    rect(sb1x, sb2y, sb2width, sb2height);
    fill(255, 0, 0);
    text("Main Menu", sb1x + 40, sb2y+40);
    if (mouseX >= sb1x && mouseX <= sb1x + sb2width && mouseY >= sb2y && mouseY <=sb2y + sb2height && mousePressed == true) {
      page = 1;
    }
    textSize(50);
    text("Highscores:", width/2-150, 100);
    ArrayList<Highscore> scores = highscoreController.loadScores();
    int y = 200;
    textSize(40);
    for (int i = 0; i < 8 && i < scores.size(); i++) {
      Highscore score = scores.get(i);
      text(score.name, 50, y);
      text(score.score, width - textWidth(score.score + "") - 50, y);
      y += 50;
    }
  }

  void pausepage() {
    fill(0);
    rect(25, 100, 400, 600);
    noFill();
    if (mouseX >= pb1x && mouseX <= pb1x + pb1width && mouseY >= pb1y && mouseY <=pb1y + pb1height) {
      fill(214);
      println("fill");
    } else fill(255);
    if (mouseX >= pb1x && mouseX <= pb1x + pb1width && mouseY >= pb1y && mouseY <=pb1y + pb1height && mousePressed == true) {
      page = 0;
    }
    rect(pb1x, pb1y, pb1width, pb1height);

    fill(255, 0, 0);
    textSize(50);
    text("Resume", pb1x+60, pb1y+ 40);

    if (mouseX >= pb2x && mouseX <= pb2x + pb2width && mouseY >= pb2y && mouseY <=pb2y + pb2height) {
      fill(214);
      println("fill");
    } else fill(255);
    rect(pb2x, pb2y, pb2width, pb2height);
    fill(255, 0, 0);
    text("Main Menu", pb2x+20, pb2y+ 40);
    if (mouseX >= pb2x && mouseX <= pb2x + pb2width && mouseY >= pb2y && mouseY <=pb2y + pb2height && mousePressed == true) {
      page = 1;
    }
  }
}
