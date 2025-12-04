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
// sets the enemies along the track for the level
void level1(){
  float y = random(100,600);
  float spawnChance = random(0,1);
  if(spawnChance < 0.30){
    enemy.add(new Enemy(1800,y,3,10,1));
  }
  else if(spawnChance > 0.30 && spawnChance < 0.40){
    enemy.add(new Enemy(1800,y,3,10,2));
  }
  else{
    enemy.add(new Enemy(1800,y,3,10,0));
  }
  
   
}
