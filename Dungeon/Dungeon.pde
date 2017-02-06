//ArrayList<Entity> entities;
ArrayList<Integer> directions = new ArrayList<Integer>();//ArrayList to get get directions of the map
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
  rows=11;//Set Rows
  cols=11;//Set Columns
  boxWidth=width/cols;
  boxHeight=height/rows;
  
  /*ArrayList for all entities in the game
  entities= new ArrayList<Entity>();
  entities.add(new Entity("Enemy1","Enemy1.png",5,7) );
  entities.add(new Entity("Player","Player.png",2,7) );
  */
  
  player = new Player("Player","Player.png",rows/2,cols/2);
  
  stroke(255);
  totalRooms=5;
  level =new Level(totalRooms);
  //level.printRooms();
  currentRoom=0;//Set the first room
  
  //Get the current room and set it true for the map
  Room current;
  current = level.rooms.get(currentRoom);
  current.entered=true;
  Map(' ');//Add the first room to the map
  
  nextRoom();
  player.render();
}

void draw()
{
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