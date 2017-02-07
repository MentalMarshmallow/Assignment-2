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
    background(0);
  }
}