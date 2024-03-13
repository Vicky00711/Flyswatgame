PImage witchImg;
class Witch extends Enemies {
 
  float speedX;
  float speedY;

  Witch(float x, float y) {
    super(x, y);
    //this.x= x;
    //this.y=y;
    witchImg=loadImage("witch.png");
    witchImg.resize(40, 40);
  }
  void display() {
    image(witchImg, x, y);
  }
  //void move(float speedX, float speedY) {
    

  //  float targetX= 230;
  //  float targetY= 390;

  //  float distanceX=targetX-x;
  //  float distanceY=targetY-y;

  //  float powerX= (float)Math.pow(distanceX, 2);
  //  float powerY= (float)Math.pow(distanceY, 2);
  //  float distance= sqrt(powerX+ powerY);

  //  float changeSpeedX= (speedX/distance)*distanceX;
  //  float changeSpeedY= (speedY/distance)*distanceY;

  //  y=y+round(changeSpeedY);
  //  x=x+round(changeSpeedX);
  //}
  void collision(){
  
      
      if (abs(x-cake.x)<40 && abs(y-cake.y)<40) {
        x=0;
       y=random(0,250);
      }
    }
  
  
  
  void killingTarget() {


      if (abs(p.x-x)<20 && abs(p.y-y)<20) {
        gameMode=GAMEOVER;
        doGameover();
      
    }
  }
}
