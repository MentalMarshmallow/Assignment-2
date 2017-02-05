//ArrayList<Entity> entities;
Player player;//Player entity
float boxWidth,boxHeight;
float border;
int rows,cols;
Level level;
int totalRooms;
int currentRoom;

void setup()
{
  size(600,600);
  rows=10;//Set Rows
  cols=10;//Set Columns
  boxWidth=width/10;
  boxHeight=height/10;
  
  /*ArrayList for all entities in the game
  entities= new ArrayList<Entity>();
  entities.add(new Entity("Enemy1","Enemy1.png",5,7) );
  entities.add(new Entity("Player","Player.png",2,7) );
  */
  
  player = new Player("Player","Player.png",2,7);
  
  totalRooms=5;
  level =new Level(totalRooms);
  level.printRooms();
  currentRoom=0;
}

void draw()
{
  stroke(255);
  //Creates the grid for the dungeon room
  drawRoom();
  /*Draws all of the entities
  for(int i=0;i<entities.size();i++)//Go through the details arraylist
  {
    Entity creature = entities.get(i);//retrieve data from the arraylist
    creature.display();
  }
  */
}