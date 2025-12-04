class Bullet
{
  // images for the bullet //
  PImage bulletImage = loadImage("placeHolder.jpg"); // image for the bullet
  // bullet movement variables //
   PVector position = new PVector(); // initalizes the position vectors for the bullet
    PVector velocity = new PVector(); // initalizes the velocity vectors for the bullet
    PVector acceleration = new PVector(); // initalizes the accleration vectors for the bullet
    float moveSpeed = 10;// initalizes speed of the bullet
    
    // bullet other variables //
    boolean bulletDead = false; // used to check if bullet is alive
  
  Bullet(float posX,float posY){
    position.x = posX; // sets the inital x pos for the bullet
    position.y = posY; // sets the inital y pos for the bullet
    // resize images//
    bulletImage.resize(20,20);
  }
  
  // displays the bullet visuals
  void displayBullet()
  {
    image(bulletImage,position.x,position.y,20,20); // bullet image for the screen
  }
  // alters the movement of the bullet
  void bulletMovement(){
    position.x += moveSpeed; // moves the bullet temporary
  }
  
}
