//ArrayList<Entity> entities;
Player player;//Player entity
float boxWidth,boxHeight;
float border;
int rows,cols;
boolean tiles[][];//So no tiles can have more than one object on it
Level level;

void setup()
{
  size(600,600);
  rows=10;//Set Rows
  cols=10;//Set Columns
  boxWidth=width/10;
  boxHeight=height/10;
  tiles = new boolean[rows][cols];//Initialised to false
  
  /*ArrayList for all entities in the game
  entities= new ArrayList<Entity>();
  entities.add(new Entity("Enemy1","Enemy1.png",5,7) );
  entities.add(new Entity("Player","Player.png",2,7) );
  */
  
  player = new Player("Player","Player.png",2,7);
  
  level =new Level(5);
  level.printRooms();
}

void draw()
{
  background(0,100,0);
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
  
  /*Draws all of the entities
  for(int i=0;i<entities.size();i++)//Go through the details arraylist
  {
    Entity creature = entities.get(i);//retrieve data from the arraylist
    creature.display();
  }
  */
  player.render();
  player.update();
}