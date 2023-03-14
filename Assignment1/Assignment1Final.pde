/**
 * COMP570 Programming for Creativity 2023 S1
 * Assignment 1 - Animated Shapes
 * 
 * This program draws a black elipse and a rectangle on the screen
 * that change shape according to mouse movement
 * and can change color with a click
 *
 * @author Benji Gifford, ID#42069
 * @version 1.0 - 8/03/2023: Created
 */
 
 //color shapeColor = color(0); // global variable for the shape color; start "black"
 color shapesLeft = color(256, 0, 0);
 color shapesRight = color(0, 256, 0);
 color shapesOutline = color(0);
 color Background = color(256);
 float lineWeight = (5);
 
 /**
  * Sets up the program
  */
 void setup()
 {
   size(800, 800, P2D); // deploy canvas size
   smooth();
   rectMode(CORNERS);
   ellipseMode(CORNERS);
   surface.setResizable(true);
 }
 
 /**
  * Draws a single frame
  */
/*
 void draw()
 {
   // clear canvas
   background (Background);
   // draw left shapes;
   fill(shapesLeft);
   stroke(shapesOutline);
   strokeWeight(lineWeight);
   ellipse(lineWeight/2, lineWeight/2, mouseX-lineWeight/2, mouseY-lineWeight/2);
   rect((lineWeight/2), height-(lineWeight/2), mouseX-lineWeight/2, mouseY-lineWeight/2);
   // draw right shapes;
   fill(shapesRight);
   stroke(shapesOutline);//
   strokeWeight(lineWeight); //
   rect(width-(lineWeight/2), (lineWeight/2), mouseX-lineWeight/2, mouseY-lineWeight/2);
   ellipse(lineWeight/2, lineWeight/2, mouseX, mouseY);
//   ellipse(200, 100, mouseX, 200);
//   rect(50, 200, 300, mouseY);
 }
*/
 
void draw()
{
  background(Background);
  
  fill(shapesLeft);
  stroke(shapesOutline);
  strokeWeight(lineWeight);
  ellipseMode(CORNERS);
  ellipse(2.5, 2.5, mouseX+2.5, mouseY-2.5);
  
  fill(shapesRight);
  stroke(shapesOutline);
  strokeWeight(lineWeight);
  ellipseMode(CORNERS);
  ellipse(width-2.5, height-2.5, mouseX+2.5, mouseY-2.5);
  
  fill(shapesRight);
  stroke(shapesOutline);
  strokeWeight(lineWeight);
  rectMode(CORNERS);
  rect(width-2.5, 2.5, mouseX+2.5, mouseY-2.5);
  
  fill(shapesLeft);
  stroke(shapesOutline);
  strokeWeight(lineWeight);
  rectMode(CORNERS);
  rect(2.5, height-2.5, mouseX-2.5, mouseY+2.5);
}
 /**
  * Called when the user presses the mouse button
  */
void mousePressed()
{
  Background = color(random(0, 256)); // change background color to random grayscale
  shapesLeft = color(random(256), random(256), color(256)); //change shapes to random color
  shapesRight = color(random(256), random(256), color(256)); //change shapes to random color
  shapesOutline = color(random(256), random(256), random(256)); //change outlines to random color
  lineWeight = random(3, 10); //set the stroke length to random value between 3 and 9
}
