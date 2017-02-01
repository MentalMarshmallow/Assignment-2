PImage enemy1;
float boxWidth,boxHeight;

void setup()
{
  size(500,500);
  enemy1=loadImage("Enemy1.png");
  boxWidth=width/15;
  boxHeight=height/15;
  enemy1.resize(width/15,(int)boxHeight);
  background(0);
}

void draw()
{
  stroke(255);
  for(int i=0;i<width;i+=width/15)
  {
    line(i,0,i,height);
  }
  for(int j=0;j<height;j+=height/15)
  {
    line(0,j,width,j);
  }
  image(enemy1,250,250);
}