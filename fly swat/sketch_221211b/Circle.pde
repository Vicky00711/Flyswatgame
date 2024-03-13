
class Bats extends Enemies {
  
  
  int imgCounter;
  PImage[] batsImages= new PImage[3];
  Bats(float x, float y) {
    super(x, y);
    for (int i=0; i<3; i++) {
      batsImages[i]=loadImage("bat" + i+ ".png" );
    }
  }
  void display() {
    if (imgCounter<20) {
      image(batsImages[0], x, y);
    } else if (imgCounter<40) {
      image(batsImages[1], x, y);
    } else if (imgCounter<60) {
      image(batsImages[2], x, y);
    } else {
      image(batsImages[0], x, y);
      imgCounter=0;
    }
    imgCounter++;
  }
  //void move(float speedX, float speedY) {
    

  //  float targetX= 230;
  //  float targetY= 390;

  //    float distanceX=targetX-x;
  //    float distanceY=targetY-y;

  //    float powerX= (float)Math.pow(distanceX, 2);
  //    float powerY= (float)Math.pow(distanceY, 2);
  //    float distance= sqrt(powerX+ powerY);

  //    float changeSpeedX= (speedX/distance)*distanceX;
  //    float changeSpeedY= (speedY/distance)*distanceY;

  //    y=y+round(changeSpeedY);
  //    x=x+round(changeSpeedX);
  //}
  void collision() {
    
      if (abs(x-cake.x)<30 && abs(y-cake.y)<30) {
        gameMode=GAMEOVER;
        doGameover();
        
      }
    }
  

    void killingTarget() {
      
      if (abs(p.x-x)<40 && abs(p.y-y)<40) {

        x= random(0, 400);
        y= 0;
        score= score+1;

        xplosion.add(new Explosion(mouseX-10, mouseY-10));
      
    }
  }
}
