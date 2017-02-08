class Backpack 
{
  int slots[];
  int count;
  PImage img;
  float size;
  int border;
  PImage weaponImg;
  int weaponImgIndex;

  Backpack(int slot,String location)
  {
    border=5;
    size=width/4;
    slots = new int[slot];
    for(int i=0;i<slot;i++)
    {
      slots[i]=-1;
    }
    
    count=0;
    img = loadImage(location);
    weaponImgIndex=-1;//No weapon is selected
  }

  void update(int index)
  {
    if(count<slots.length)
    {
      slots[count]=index;
      
      count++;
    }
  }

  void render()
  {
    fill(0);

    rect(size, size, size*2, size*2);//Black background for the backpack
    
    //Create the slots for the inventory
    fill(100);
    rect(size,size,size,size);//Magnified slot
    
    if(weaponImg!=null)
    {
      image(weaponImg,size,size,size,size);
    }//Load the image on the magnified slot
    
    for (int i=0; i<slots.length; i++)
    {
      rect(size+border/2 + i*(size*2/slots.length), size*2, (size*2)/slots.length-border, (size*2)/slots.length);
    }
    
    for(int i=0;i<slots.length;i++)
    {
      if(slots[i]!=-1)
      {
        image(weapons.get(slots[i]).img,size+border/2 + i*(size*2/slots.length), size*2, (size*2)/slots.length-border, (size*2)/slots.length);
      }
    }
    
    //Back Button
    fill(0,55,125);
    rect(size*2.5, size*2.5, size/2, size/2);
    
    //Equip Button
    fill(200,0,0);
    rect(size*2+border,size+border,size-border*2,2.5*size/8);
    
    //Unequip button
    rect(size*2+border,(2.5*size/8)+size+border,size-border*2,2.5*size/8);
    
    //Destroy Button
    rect(size*2+border,(5*size/8)+size+border,size-border*2,2.5*size/8);
    
    //Text for the buttons
    fill(0);
    text("Equip",size*2.4,size*1.2);
    text("Un-Equip",size*2.35,size*1.55);
    text("Destroy",size*2.375,size*1.85);
    text("GO BACK",size*2.5+border,size*2.75+border);
    
    
    //Used to access the backpack
    if (mousePressed)
    {
      if(mouseX>size*2.5 && mouseX<size*3 && mouseY>size*2.5 && mouseY<size*3)//If the mouse is in the exit button
      {
        inside=false;
        levels.get(currentLevel).showRoom();
        player.render();
        map.render();
        playerInfo();
        backpackShow();
        
        for(Entity enemy : enemies)//Go through the details arraylist
        {
          enemy.render();
        }
        
        for(Weapon weapon : weapons)//Go through the details arraylist
        {
          weapon.render();
        }//End for
        
      }
      else if(mouseY<size*2+(size*2)/slots.length && mouseY>size*2)//If its on the backpack slots
      {
        for (int i=0; i<slots.length; i++)//Goes through backpack slots
        {
          if(mouseX>size+border/2 + i*(size*2/slots.length) && mouseX<size+border/2 + i*(size*2/slots.length) +(size*2)/slots.length-border)//Checks which backpack slot it is on
          {
            if(slots[i]!=-1)//If a weapon is in the slot
            {
              //Display the slot on the magnified slot
              weaponImg= weapons.get(slots[i]).img;
              weaponImgIndex=i;
            }
           
          }
        }//end for
        
      }//End slot check
      else if(mouseX>size*2+border && mouseX<size*3-border)//If its the equip/unequip/destroy button
      {
        if(mouseY>size+border && mouseY<size+border + 2.5*size/8)//Equip
        {
          if(weaponImgIndex!=-1)
          player.equip(slots[weaponImgIndex]);
          
          text("Equiped",size,size*2.75);
        }
        else if(mouseY>(2.5*size/8)+size+border && mouseY<(2.5*size/8)+size+border + 2.5*size/8 )//Unequip
        {
          player.unequip();
        }
        else if(mouseY>size+border && mouseY<(5*size/8)+size+border + 2.5*size/8)
        {
          if( weaponImgIndex!=-1)//If there is a weapon in the slot
          {
            player.unequip();
            removeWeapon(slots[weaponImgIndex]);
            slots[weaponImgIndex]=-1;
            weaponImgIndex=-1;
            weaponImg=null;
          }
        }
      }
      
    }//end if mousePressed
    
  }//end render
  
}//end backpack class