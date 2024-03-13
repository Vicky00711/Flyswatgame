PImage pumpkinImg;
class Cake{
float x;
float y;

Cake(float x, float y){
this.x= x;
this.y= y;
pumpkinImg=loadImage("pumpkin.png");
pumpkinImg.resize(80,80);
}
void display(){
image(pumpkinImg,x+30,y);
}


}
