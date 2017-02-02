Entity enemy1;
float boxWidth,boxHeight;
float border;
int rows,cols;
boolean tiles[][];

void setup()
{
  size(500,500);
  rows=10;//Set Rows
  cols=10;//Set Columns
  tiles = new boolean[rows][cols];//Initialised to false
  
  enemy1= new Entity("Enemy1.png");
  
  boxWidth=width/10;
  boxHeight=height/10;
  background(0);
}

void draw()
{
  stroke(255);
  //Creates the grid for the dungeon room
  for(float i=0;i<width;i+=boxWidth)
  {
    line(i,0,i,height);
  }
  for(float j=0;j<height;j+=boxHeight)
  {
    line(0,j,width,j);
  }
  enemy1.display();
}