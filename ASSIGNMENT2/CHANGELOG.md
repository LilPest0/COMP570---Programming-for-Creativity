# CHANGELOG - ASSIGNMENT 2
Student: Benji Gifford - ID#42069

## 28/03/2023
 - Reviewed assignment in class

## 5/04/2023
Began to build on the specific parameters of the assignment
 - Assigned properties to the balls 
 - gave them random starting positions
 - gave them random fill colors, with the outlines being 50% darker and 3 pixels wide
 - the balls have random radii between 30 & 40
 - wrote a function to make them bounce
Wrote a function for what happens when the balls touch. Upon ball collision:
 - balls turn dark red
 - outlines turn black and 1 pixel wide
 - they stick together and move as one

## 25/04/2023
Returned from semester break
Modified a few things for the sake of simplicity
 - declared the colors of each ball and the outlines first
 - cleaned up clutter code
Still trying to find the mysterious missing brackets 

## 29/04/2023
Updated variable names to make program more comfortable to read
Cleared up clutter code

## 1/05/2023
Successfully got balls to generate, now I just need to make the ballsTouch() function work properly.

## 2/05/2023
Got the balls to turn red when they hit each other, and they stick together.
 - did this by calling ballsTouch() within the draw() function
The balls tend to drift apart slightly after they stick together and bounce off a wall, so i need to find a way around that

## 3/05/2023
Essentially completed the assignment.
 - added a float variable to calculate the average speeds of each object to make them move as one
 - did some wacky trigonometry to prevent the ball edges from overlapping
