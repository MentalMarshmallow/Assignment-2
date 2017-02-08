class Backpack 
{
  int slots[];
  int count;
  
  Backpack(int slot)
  {
    slots = new int[slot];
    count=0;
  }
  
  void update(int index)
  {
    slots[count]=index;
    count++;
  }
  
  void render()
  {
    boolean inside=true;
    
    while(inside)
    {
      float size=width/4;
      
      rect(size,size,size*2,size*2);
      
      for(float i=size;i<2*size;i+=size*2/slots.length)
      {
        
      }
    }
  }
  
}