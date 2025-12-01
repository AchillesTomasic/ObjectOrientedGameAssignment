class PointPickup{
  // movement variables for the points //
  PVector position = new PVector(); // initalizes the position vectors for point
  // checks if the points are from an enemy //
  boolean collected = false; // checks if the point has been picked up
  int moveSpeed = 1; //movespeed of the points
  // size variables for the points //
  float pointWidth = 30; // width of the points
  float pointHeight = 15; // height of the points
  // variables for the points //
  int pointValue; // value for the points
  boolean pointLife = true; //deactivates point
  boolean popupLife = true; // detects if the popup is alive
  int popupTimer = 120; // timer
  //constructir for the pointPickups
  PointPickup(float posX,float posY, int value){
    position.x = posX; // sets the x position of the points
    position.y = posY; // sets the y position of the points
    pointValue = value; // sets the value of this point instance
  }
  //creates the display for the points
  void display(){
    // checks if point has been collected yet
    if(pointLife == true){
    rect(position.x,position.y,pointWidth,pointHeight); //point visual collectable
    }
    else{
      rect(position.x,position.y,30,20); // swaps to point collected
    }
  }
  // prefors the physics calculations for the points
  void physics(){
    // checks if points alive
    if(pointLife == true){
    // preforms basic physics calculations in the background
    position.x -= moveSpeed; // moves position of the points
    }
    else{
      position.y -= 0.2; // moves the positon of the popup.
    }
  }
  
}
