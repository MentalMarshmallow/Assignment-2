/*
Stores the map in an arraylist
and displays it to the user
*/
class Map//(char direction)
{
  ArrayList<Integer> directions = new ArrayList<Integer>();//ArrayList to get get directions of the map
  PVector pos;
  int roomSize;
  float centerX;
  float centerY;
  float mapWidth;
  float mapHeight;
  
  Map()
  {
    mapWidth=boxWidth*1.5;
    mapHeight=boxHeight*1.5;
    centerX=width-mapWidth/2;
    centerY=mapHeight/2;
    pos = new PVector(centerX,centerY);
    roomSize=width/100;
  }
  
  void update(char direction)
  {
    switch(direction)
    {
      case ' '://The starting room
       directions.add(new Integer(0));//Set 0 for the starting room
       break;
       
      case 'u'://The upper room
       directions.add(new Integer(1));//Set 1 for up
       break;
       
      case 'd':
       directions.add(new Integer(2));
       break;
      
      case 'l':
       directions.add(new Integer(3));
       break;
       
      case 'r':
       directions.add(new Integer(4));
       break;
    }//end switch(
  }
  
  void render()
  {    
    strokeWeight(5);
    
    fill(0);
    rect(centerX-mapWidth/2,0,mapWidth,mapHeight);
    
    strokeWeight(1);
    
    fill(0);
    stroke(255);
    for(int i=0;i<directions.size();i++)//Go through the details arraylist
    {
      int temp = directions.get(i);
      
      fill(100);
      
      if(i==currentRoom)
      {
        fill(255,0,0);
      }
      
      if(temp==0)
      {
        rect(pos.x,pos.y,5,5);
      }
      else if(temp==1)
      {
        pos.y-=roomSize;
        rect(pos.x,pos.y,5,5);
      }
      else if(temp==2)
      {
        pos.y+=roomSize;
        rect(pos.x,pos.y ,5,5);
      }
      else if(temp==3)
      {
        pos.x-=roomSize;
        rect(pos.x,pos.y,5,5);
      }
      else if(temp==4)
      {
        pos.x+=roomSize;
        rect(pos.x,pos.y ,5,5);
      }
    
    }//end for()
    pos.x=centerX;
    pos.y=centerY;
  }
    
}