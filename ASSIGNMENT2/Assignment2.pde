/*
 * COMP570 Programming for Creativity 2023 S1
 * Assignment 2 - Colliding Objects
 * 
 * This program creates two balls of random colors on a white canvas. 
 * The outlines of these balls are 3 pixels wide and 50% darker than the color of the balls.
 * Both of the balls are 30-40 pixels wide. If they hit the edge of the screen, they bounce off of it.
 * When the balls touch, they join together and move as one. additionally, they turn to a dark red color, 
 * and the outlines change to black and become 1 pixel wide.
 *
 * @author Benji Gifford, ID#42069 
 * @version 1.3 - 3/05/2023: Complete
 */

//convenience colors
color ball1Color = color(random(255), random(255), random(255));
color ball2Color = color(random(255), random(255), random(255));
color outline1Color = color((ball1Color)*0.5); 
color outline2Color = color((ball2Color)*0.5); 

//ball 1 properties
float ball1X, ball1Y, ball1Radius;
float ball1SpeedX, ball1SpeedY;
int ball1OutlineWidth;

//ball 2 properties
float ball2X, ball2Y, ball2Radius;
float ball2SpeedX, ball2SpeedY;
int ball2OutlineWidth;

//canvas properties
int canvasWidth = 500;
int canvasHeight = 500;
color Background = color(255);

// collision and stickiness variables
boolean ballsCollided = false;
boolean isSticky = false;

//deploy canvas
void setup() {
   size(500, 500, P2D);
   smooth();
   
   // initialize ball 1 properties
   ball1X = random(50, canvasWidth-50);
   ball1Y = random(50, canvasHeight-50);
   ball1SpeedX = random(-5, 5);
   ball1SpeedY = random(-5, 5);
   ball1Radius = random(30, 40); 
   ball1OutlineWidth = 3;
   
   // initialize ball 2 properties
   ball2X = random(50, canvasWidth-50);
   ball2Y = random(50, canvasHeight-50);
   ball2SpeedX = random(-5, 5);
   ball2SpeedY = random(-5, 5);
   ball2Radius = random(30, 40); 
   ball2OutlineWidth = 3;
}

void draw() {
  // clear the screen with white color
   background(Background);
  
  // draw ball 1
   fill(ball1Color);
   stroke(outline1Color);
   strokeWeight(ball1OutlineWidth);
   ellipse(ball1X, ball1Y, ball1Radius*2, ball1Radius*2);

// draw ball 2
   fill(ball2Color);
   stroke(outline2Color);
   strokeWeight(ball2OutlineWidth);
   ellipse(ball2X, ball2Y, ball2Radius*2, ball2Radius*2);

  
  // update ball 1 position
  ballSpeed();
  
  // check if ball 1 hit the wall
  wallCollision();
  
  // when balls collide, iniate the ball touching procedure
  ballsTouch();
} 

void ballSpeed() {
  ball1X += ball1SpeedX;
  ball1Y += ball1SpeedY;
  
  // update ball 2 position
  ball2X += ball2SpeedX;
  ball2Y += ball2SpeedY;
}

void wallCollision() {
  if (ball1X - ball1Radius < 0 || ball1X + ball1Radius > canvasWidth) {
    ball1SpeedX *= -1;
    if (ballsCollided) {
      ball2SpeedX = -ball2SpeedX;
    }
  }
  
  if (ball1Y - ball1Radius < 0 || ball1Y + ball1Radius > canvasHeight) {
    ball1SpeedY *= -1;
    if (ballsCollided) {
      ball2SpeedY = -ball2SpeedY;
    }
  }
  
  // check if ball 2 hit the wall
  if (ball2X - ball2Radius < 0 || ball2X + ball2Radius > canvasWidth) {
    ball2SpeedX *= -1;
    if (ballsCollided) {
      ball1SpeedX = -ball1SpeedX;
    }
  }
  
  if (ball2Y - ball2Radius < 0 || ball2Y + ball2Radius > canvasHeight) {
    ball2SpeedY *= -1;
    if (ballsCollided) {
      ball1SpeedY = -ball1SpeedY;
    }
  }
}
  
  // check if the balls collided. if they do,
  // - the balls turn dark red
  // - their outlines turn black and 1 pixel wide
  // - they stick together and move as one

void ballsTouch() {
  float distance = dist(ball1X, ball1Y, ball2X, ball2Y);

  if (!ballsCollided && distance < ball1Radius + ball2Radius) {
    // update ball colors and outline widths
    ball1Color = color(127.5, 0, 0);
    ball2Color = color(127.5, 0, 0);

    outline1Color = color(0);
    outline2Color = color(0);

    ball1OutlineWidth = 1;
    ball2OutlineWidth = 1;

    // average and update ball speeds to make them move together
    float avgSpeedX = (ball1SpeedX + ball2SpeedX)/2;
    ball1SpeedX = avgSpeedX;
    ball1SpeedY = ball2SpeedY;
    ball2SpeedX = avgSpeedX;
    ball2SpeedY = ball1SpeedY;
    
    // make the balls stick together by their edges
    float overlap = (ball1Radius + ball2Radius - distance) / 2.0;
    float dx = ball2X - ball1X;
    float dy = ball2Y - ball1Y;
    float angle = atan2(dy, dx);
    ball1X -= overlap * cos(angle);
    ball1Y -= overlap * sin(angle);
    ball2X += overlap * cos(angle);
    ball2Y += overlap * sin(angle);

    ballsCollided = true;
    isSticky = true;
  }
} 
