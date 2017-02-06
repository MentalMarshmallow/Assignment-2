/*
Stores the map in an arraylist
and displays it to the user
*/
class Map//(char direction)
{
  ArrayList<Integer> directions = new ArrayList<Integer>();//ArrayList to get get directions of the map
  PVector pos;
  int size;
  
  Map()
  {
    pos = new PVector(width-boxWidth*0.75,boxHeight*0.75);
    size=width/100;
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
    fill(0);
    rect(width-boxWidth*1.5,0,boxWidth*1.5,boxHeight*1.5);
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
        pos.y-=size;
        rect(pos.x,pos.y,5,5);
      }
      else if(temp==2)
      {
        pos.y+=size;
        rect(pos.x,pos.y ,5,5);
      }
      else if(temp==3)
      {
        pos.x-=size;
        rect(pos.x,pos.y,5,5);
      }
      else if(temp==4)
      {
        pos.x+=size;
        rect(pos.x,pos.y ,5,5);
      }
    
    }//end for()
    pos.x=width-boxWidth*0.75;
    pos.y=boxHeight*0.75;
  }
    
}