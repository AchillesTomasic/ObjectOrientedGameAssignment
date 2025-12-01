// add level details here //
class Level{
  int timer; // set timer that determines when enemies spawn in the game
  // contructor for the level class
  Level(){
    
  }
  // determines when enemies spawn
  boolean spawner(Enemy enemy){
    if(enemy.spawnTime <= timer){
      return true;
    }
    else{
     return false; 
    }
  }
  
}
void level1(){
   enemy.add(new Enemy(1800,400,5,10));
   enemy.add(new Enemy(1800,200,5,10));
}
