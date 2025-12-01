class PointPickup{
  // movement variables for the points //
  PVector position = new PVector(); // initalizes the position vectors for point
  PVector velocity = new PVector(); // initalizes the velocity vectors for point
  PVector acceleration = new PVector(); // initalizes the acceleration vectors for point
  // checks if the points are from an enemy //
  boolean popOut; // checks if they spawned from the enemy
  boolean collected = false; // checks if the point has been picked up
  int moveSpeed = 1; //movespeed of the points
  // size variables for the points //
  float pointWidth = 30; // width of the points
  float pointHeight = 15; // height of the points
  // variables for the points //
  int pointValue;
  boolean pointLife = true;
  
  //constructir for the pointPickups
  PointPickup(float posX,float posY,boolean pop, int value){
    position.x = posX; // sets the x position of the points
    position.y = posY; // sets the y position of the points
    popOut = pop;// checks if it comes from enemy
    pointValue = value; // sets the value of this point instance
  }
  //creates the display for the points
  void display(){
    rect(position.x,position.y,pointWidth,pointHeight);
  }
  // prefors the physics calculations for the points
  void physics(){
    if(popOut){
    explodePhysics(1,1); //calculations for the loading physics
    position.x -= moveSpeed;
    }
  }
  // physics that shoot out of the enemies when they die //
  void explodePhysics(float acc, float vel){
       // points physics calculations x //
     position.x += velocity.x; // changes positon based on velocity
     velocity.x += acceleration.x; // changes velocity based on acceleration
    // points physics calculations y //
     position.y += velocity.y; // changes possiton based on velocity
     velocity.y += acceleration.y; // changes velocity based on acceleration
     // for the x values
     // shifts acceleration back to when it changes //
     if(acceleration.x > 0){
      acceleration.x -= acc; // reduces acceleration if pushed left
    }
    if(acceleration.x < 0){
      acceleration.x += acc; // reduces acceleration if pushed right
    }
     // shifts velocity back to when it changes //
     if(velocity.x > 0){
      velocity.x -= vel; // reduces velocity if pushed left
    }
    if(velocity.x < 0){
      velocity.x += vel; // reduces velocity if pushed right
    }
     // for the y values //
    // shifts acceleration back to when it changes //
     if(acceleration.x > 0){
      acceleration.x -= acc; // reduces acceleration if pushed left
    }
    if(acceleration.x < 0){
      acceleration.x += acc; // reduces acceleration if pushed right
    }
     // shifts velocity back to when it changes //
     if(velocity.x > 0){
      velocity.x -= vel; // reduces velocity if pushed left
    }
    if(velocity.x < 0){
      velocity.x += vel; // reduces velocity if pushed right
    }    
  }
}
