
// 1. Follow the recipe instructions inside the Segment class.

// This class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
  int x;
  int y;
  // 3. Add a constructor with parameters to initialize each variable.
  public Segment(int x, int y) {
    this.x = x;
    this.y = y;
  }

  // 4. Add getter and setter methods for both the x and y member variables.
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public void setX(int x) {
    this.x = x;
  }
  public void setY(int y) {
    this.y = y;
  }
}
Segment head;
String direction = "up";
int foodeaten;
int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);



// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake



// 6. Create and initialize String to hold the direction of your snake e.g. "up"



// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.



// 8. Create and initialize foodX and foodY variables to hold the location of the food.

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

//int foodX = ((int)random(50)*10);



void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
  head = new Segment(250, 250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {

  background(0);


  //12. Call the drawFood, drawSnake, move, and collision methods.
  drawFood();
  drawSnake();
  move();
  collision();
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  rect(foodX, foodY, 10, 10);
}


//14. Draw the snake head

void drawSnake() {
  rect(head.getX(), head.getY(), 10, 10);
  manageTail();
  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Create a switch statement using your direction variable. Depending on the direction, add a new segment to your snake.
  //This is an incomplete switch statement:

  switch(direction) {
  case "up":
    // move head up here 
    head.setY(head.getY()-10);
    break;
  case "down":
    // move head down here
    head.setY(head.getY()+10);
    break;
  case "left":
    // figure it out
    head.setX(head.getX()-10);
    break;
  case "right":
    // mystery code goes here
    head.setX(head.getX()+10);
    break;
  }

  // 17. Call the checkBoundaries method to make sure the snake doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if (keyCode == UP && !direction.equals("down")) {
    direction = "up";
  } else if (keyCode == DOWN && !direction.equals("up")) {
    direction = "down";
  } else if (keyCode == LEFT && !direction.equals("right")) {
    direction = "left";
  } else if (keyCode == RIGHT && !direction.equals("left")) {
    direction = "right";
  }
}



// 19. check if your head is out of bounds (teleport your snake to the other side).

void checkBoundaries() {
  if (head.getY() > height) {
    head.setY(0);
  } else if (head.getY() < 0) {
    head.setY(height);
  }
  if (head.getX() > width) {
    head.setX(0);
  } else if (head.getX() < 0) {
    head.setX(height);
  }
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

void collision() {
  if (head.getX() == foodX && head.getY() == foodY) {
    foodeaten+=1;
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
  }
  // If the segment is colliding with a piece of food...
  // Increase the amount of food eaten and set foodX and foodY to new random locations.
}



/**
 
 ** Part 2: making the tail
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
  ArrayList<Segment> tailSegments = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  tailSegments.add(new Segment(head.getX(), head.getY()));
  // While the snake size is greater than your food, remove the first Segment in your snake.
while(tailSegments.size() > foodeaten && tailSegments.size() > 0) {
 tailSegments.remove(0); 
}
}

void drawTail() {
  // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
  for(Segment s: tailSegments) {
    rect(s.getX(), s.getY(), 10, 10);
  }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for(Segment s: tailSegments) {
   if(s.getX() == head.getX() && s.getY() == head.getY()){
     foodeaten = 1; 
   }
  }
  // Set food back to 1.

  //Call this method at the begining of your manageTail method.
}