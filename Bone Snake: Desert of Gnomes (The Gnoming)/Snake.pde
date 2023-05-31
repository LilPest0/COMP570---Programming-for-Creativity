// Snake
class Snake {
  int length;
  int[] x, y;
  int directionX, directionY;

  Snake(int startX, int startY) {
    length = 1;
    x = new int[cols * rows];
    y = new int[cols * rows];
    x[0] = startX;
    y[0] = startY;
    directionX = 1;
    directionY = 0;
  }

  void update() {
    // Update the positions of the body segments
    for (int i = length - 1; i > 0; i--) {
      x[i] = x[i - 1];
      y[i] = y[i - 1];
    }
    
    // Update the position of the head based on the direction
    x[0] += directionX;
    y[0] += directionY;
    // Keep the snake within bounds
    x[0] = constrain(x[0], 0, cols - 1);
    y[0] = constrain(y[0], 0, rows - 1);
  }

  void checkCollision(Enemy enemy) {
    if (x[0] == enemy.x && y[0] == enemy.y) {
      length++; // Increase the length
      score++; // Increase the score
      enemy.place(); // Place new gnome
      eatSound.rewind();
      eatSound.play();
      addCactus();
    }
    for (Cactus cactus : cacti) {
      if (x[0] == cactus.x && y[0] == cactus.y) {
        gameover = true;
        gameState = 2;
        deathSound.play();
        return; // Exit the method if the snake collides with a cactus
      }
    }
  }

  // Draw the snake
  void draw() {
    // Draw the head and make it face the foward direction of travel
    imageMode(CORNER);
    PImage headImage;
    if (directionX == 0 && directionY == -1) { // Look Up
      headImage = headUpImage;
    } else if (directionX == 0 && directionY == 1) { // Look Down
      headImage = headDownImage;
    } else if (directionX == -1 && directionY == 0) { // Look Left
      headImage = headLeftImage;
    } else { // Look Right
      headImage = headRightImage;
    }
    image(headImage, x[0] * resolution, y[0] * resolution);

    // Draw the body segments and make them face the foward direction of travel
    for (int i = 1; i < length; i++) {
      PImage segmentImage;
      if (x[i] < x[i-1]) { // Segment faces left
        segmentImage = bodyLeftImage;
      } else if (x[i] > x[i-1]) { // Segment faces right
        segmentImage = bodyRightImage;
      } else if (y[i] < y[i-1]) { // Segment faces up
        segmentImage = bodyUpImage;
      } else { // Segment faces down
        segmentImage = bodyDownImage;
      }
      image(segmentImage, x[i] * resolution, y[i] * resolution);
    }
  }
  
  // Snake Controls
  void changeDirection(int keyCode) { // Snake Controls
    if (keyCode == UP && directionY != 1) {
      directionX = 0;
      directionY = -1;
    } else if (keyCode == DOWN && directionY != -1) {
      directionX = 0;
      directionY = 1;
    } else if (keyCode == LEFT && directionX != 1) {
      directionX = -1;
      directionY = 0;
    } else if (keyCode == RIGHT && directionX != -1) {
      directionX = 1;
      directionY = 0;
    }
  }
}
