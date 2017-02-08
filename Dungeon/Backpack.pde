class Backpack 
{
  int slots[];
  int count;
  PImage img;
  float size;
  int border;

  Backpack(int slot,String location)
  {
    border=5;
    size=width/4;
    slots = new int[slot];
    count=0;
    img = loadImage(location);
  }

  void update(int index)
  {
    slots[count]=index;
    count++;
  }

  void render()
  {
    fill(0);

    rect(size, size, size*2, size*2);//Black background for the backpack
    
    //Create the slots for the inventory
    fill(100);
    rect(size,size,size,size);//Magnified slot
    
    for (int i=0; i<slots.length; i++)
    {
      rect(size+border/2 + i*(size*2/slots.length), size*2, (size*2)/slots.length-border, (size*2)/slots.length);
    }
    
    //Back Button
    fill(0,55,125);
    rect(size*2.5, size*2.5, size/2, size/2);
    
    //Equip Button
    fill(200,0,0);
    rect(size*2+border,size+border,size-border*2,2.5*size/8);
    
    //Equip button
    rect(size*2+border,(2.5*size/8)+size+border,size-border*2,2.5*size/8);
    
    //Unequip
    rect(size*2+border,(5*size/8)+size+border,size-border*2,2.5*size/8);
    
    fill(0);
    text("Equip",size*2.4,size*1.2);
    text("Un-Equip",size*2.35,size*1.55);
    text("Destroy",size*2.375,size*1.85);
    text("GO BACK",size*2.5+border,size*2.75+border);
    
    
    //Used to access the backpack
    if (mousePressed)
    {
      
    }//end if mousePressed
    
  }//end render
  
}//end backpack class