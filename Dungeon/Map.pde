/*
Stores the map in an arraylist
and displays it to the user
*/
void Map(char direction)
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
    }//end switch()
    
}

void displayMap()
{
  PVector pos = new PVector(width/2,height/2);
  int size=width/100;
  fill(100);
  
  for(int i=0;i<directions.size();i++)//Go through the details arraylist
  {
    int temp = directions.get(i);
    println(temp);
    
    if(temp==0)
    {
      rect(pos.x,pos.y,5,5);
    }
    else if(temp==1)
    {
      pos.y+=(size*-1);
      rect(pos.x,pos.y,5,5);
    }
    else if(temp==2)
    {
      pos.y-=size;
      rect(pos.x,pos.y ,5,5);
    }
    else if(temp==3)
    {
      pos.x+=(size*-1);
      rect(pos.x,pos.y,5,5);
    }
    else if(temp==4)
    {
      pos.x+=size;
      rect(pos.x,pos.y ,5,5);
    }
  
  }
  println("*****");
}