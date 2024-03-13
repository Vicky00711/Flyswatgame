String[] highScore;
PImage backgroundImage;
//ArrayList<Circle>circle= new ArrayList<>();
//ArrayList<Witch>witch=new ArrayList<>();
ArrayList<Enemies>enemy=new ArrayList<>();
ArrayList<Explosion>xplosion=new ArrayList<>();

final int START=0;
final int RUNNING=1;
final int GAMEOVER=2;
final int RESTART=3;
int gameMode;
Cake cake;
Player p;

int score=0;
void setup() {
  size(500, 500);
  highScore=loadStrings("data/highscores.txt");
  backgroundImage= loadImage("farm.jpeg");
  backgroundImage.resize(width, height);
  imageMode(CENTER);
  //for (int i=0; i<10; i++) {
  //  circle.add(new Circle(random(0, 400), random(0, 200)));
  //}
  startMethod();
  //for (int i=0; i<5; i++) {
  //  enemy.add(new Bats ((float)random(0,400),0));
  //}
  cake = new Cake(200, 360);
  p= new Player(mouseX, mouseY);
}
void draw() {
  switch(gameMode) {
  case START:
    background(0);
    text("CLICK SPACEBAR TO START THE GAME!!", 100, 250);
    textSize(20);
    keyPressed();
    break;


  case RUNNING:
    image(backgroundImage, 250, 250);

    //for (int i=0; i<enemy.size(); i++) {
    //  Enemies enemy1= enemy.get(i);
    //  enemy1.display();
    //  circle1.move(random(0, 2), random(0, 1));
    //  if (abs(circle1.x-cake.x)<20 && abs(circle1.y-cake.y)<20) {
    //    gameMode=GAMEOVER;
    //    doGameover();
    //  }
    //}
    for (int i=0; i<enemy.size(); i++) {
      Enemies enemy1= enemy.get(i);
      enemy1.display();
      enemy1.move(random(0, 2), random(0, 1));
      enemy1.collision();
    }


    //for (int i=witch.size()-1; i>=0; i--) {
    //  Witch witch1= witch.get(i);
    //  witch1.display();
    //  witch1.move(random(0, 2), random(0, 1));
    //  if (abs(witch1.x-cake.x)<40 && abs(witch1.y-cake.y)<40) {
    //    witch1.x=random(0);
    //    witch1.y=random(0,250);
    //  }
    //}


    cake.display();
    p.display();
    p.move();

    for (Explosion xplosion1 : xplosion) {
      xplosion1.display();
    }

    text("Score: "+ score, 400, 30);
    textSize(20);

    break;

  case RESTART:
    if (keyPressed==true && key=='r') {

      gameMode=START;
      startMethod();

      break;
    }
  }
}
void mouseClicked() {
  for (int i=0; i<enemy.size(); i++) {
    Enemies enemy1= enemy.get(i);
    enemy1.display();
    enemy1.move(random(0, 0.2), random(0, 0.3));
    enemy1.killingTarget();
  }
  //for (int i=circle.size()-1; i>0; i--) {
  //  Circle circle1= circle.get(i);
  //  circle1.display();
  //  circle1.move(random(0, 0.2), random(0, 0.3));
  //  if (abs(p.x-circle1.x)<40 && abs(p.y-circle1.y)<40) {

  //    circle1.x= random(0, 400);
  //    circle1.y= 0;
  //    score= score+1;

  //    xplosion.add(new Explosion(mouseX-10, mouseY-10));
  //  }
  //}
  //for (int i=witch.size()-1; i>0; i--) {
  //  Witch witch1= witch.get(i);
  //  witch1.display();
  //  witch1.move(random(0, 0.2), random(0, 0.3));
  //  if (abs(p.x-witch1.x)<20 && abs(p.y-witch1.y)<20) {
  //    gameMode=GAMEOVER;
  //    doGameover();
  //  }
}

void keyPressed() {
  if (keyPressed==true && key==' ') {
    gameMode=RUNNING;
  }
}





void doGameover() {
  background(0);
  gameMode=RESTART;
  enemy.clear();
  scoring();
  
}
void startMethod() {


  for (int i=0; i<5; i++) {
    enemy.add(new Bats((int)random(0, 400), (int)random(0,200)));
    enemy.add(new Witch(random(0,400), random(0, 200)));
  }
  score=0;
  
  scoring();
}
void scoring() {
  if (parseInt(highScore[highScore.length-1])<score) {
    highScore[highScore.length-1]=str(score);
    text("Gameover", 220, 100);
    text("New High Score:", 190, 150);
    text(score, 330, 150);
    saveStrings("data/highscores.txt", highScore);
    text("To Restart Press R", 190,200);
    
  }
  
  else {
    text("Gameover", 220, 100);
    text("Score:", 220, 150);
    text(score, 300, 150);
    text("High Score:", 200, 200);
    text(highScore[highScore.length-1], 300, 200);
    text("To Restart Press R", 190,250);
  }
}
