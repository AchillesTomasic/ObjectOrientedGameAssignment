class Background{
  int sizeAdder; // increases the size each time a new positions added to the array
  ArrayList<PImage> backgroundImage = new ArrayList<PImage>(); // background images list
  ArrayList<PVector> position = new ArrayList<PVector>(); // positions for the images
  // constructor for the background
  Background(){
    // initalizes the different baclground images
    for(int i = 0; i < 2; i++){
    backgroundImage.add(loadImage("placeHolder.jpg")); // loads an image into the arraylist
    backgroundImage.get(i).resize(width,height); // resizes the image to reduce its ram usage(laggy without)
    position.add(new PVector(sizeAdder,0)); // adds a new PVector to the position arraylist
    sizeAdder += width; // adds to the width size
    }
  }
  // images scroll in the background
  void scroll(){
    // loops over every instace of the position to change each background
    for(int i = 0; i < position.size(); i++){
      image(backgroundImage.get(i),position.get(i).x,0,width, height);
      position.get(i).x -= 10; // moves the image each frame
      // checks if the image passes width of screen
      if(position.get(i).x <= -width){
        position.get(i).x = width; //resets position of image
      }
      }
  }
}
