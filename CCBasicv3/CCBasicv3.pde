import processing.net.*; 
 
Client c; 
byte command[] = new byte[5];


int rectX_01, rectY_01;      // Position of square button 1
int rectX_02, rectY_02;      // Position of square button 2
int rectX_03, rectY_03;      // Position of square button 3
int rectX_04, rectY_04;      // Position of square button 4

int circleX_01, circleY_01;  // Position of circle button 1
int circleX_02, circleY_02;  // Position of circle button 2
int circleX_03, circleY_03;  // Position of circle button 3
int circleX_04, circleY_04;  // Position of circle button 4

int rectSize = 60;     // Diameter of rect
int circleSize = 62;   // Diameter of circle
color rectColor, circleColor_01, circleColor_02;
color yellowButton, yellowButtonLighted;
color greenButton, greenButtonLighted;
color redButton, redButtonLighted;
color blueButton, blueButtonLighted;


color rectHighlight, circleHighlight_01, circleHighlight_02;
color currentColor, baseColor;
boolean rectOver_01 = false;
boolean rectOver_02 = false;
boolean rectOver_03 = false;
boolean rectOver_04 = false;

boolean circleOver_01 = false;
boolean circleOver_02 = false;
boolean circleOver_03 = false;
boolean circleOver_04 = false;


int line_14, line_12, line_34, line_18, line_13, line_23, line_58, line_78, col_14, col_12, col_34, col_13, col_23, col_58;



void setup() {
  size(1024, 768);

  
  rectColor = color(#004000);
  rectHighlight = color(#006000);

  circleColor_01 = color(#600000);
  circleHighlight_01 = color(#800000);
  
  circleColor_02 = color(#404040);
  circleHighlight_02 = color(#808080);

  yellowButton = color(#FFD500);
  yellowButtonLighted = color(#FEFF00);
  greenButton = color(#28CE28);
  greenButtonLighted = color(#00FF00);
  redButton = color(#CE4328);
  redButtonLighted = color(#FF2B00);
  blueButton = color(#2F7BC1);
  blueButtonLighted = color(#0086FF);

  baseColor = color(#D8EBFF);
  currentColor = baseColor;

  
  line_18 = height/8;
  line_14 = height/4;
  line_12 = height/2;
  line_34 = height*3/4;
  line_58 = height*5/8;
  line_78 = height*7/8;
  line_13 = height/3;
  line_23 = height*2/3;
  
  col_14 = width/4;
  col_12 = width/2;
  col_34 = width*3/4;
  col_13 = width/3;
  col_23 = width*2/3;
  col_58 = width*5/8;
  
  circleY_01 = line_18;
  circleX_01 = col_58;
 
  circleY_02 = line_14;
  circleX_02 = col_14;
  
  circleY_03 = line_12;
  circleX_03 = col_14;

  circleY_04 = line_34;
  circleX_04 = col_14;
  
  rectY_01 = line_13;
  rectX_01 = col_12;
  
  rectY_02 = line_13;
  rectX_02 = col_34;
  
  rectY_03 = line_58;
  rectX_03 = col_58;
  
  rectY_04 = line_78;
  rectX_04 = col_58;

  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
    // Connect to the server’s IP address and port­
  c = new Client(this, "192.168.0.18", 2001); // Replace with your server’s IP and port

}

void draw() {
  update(mouseX, mouseY);
  background(baseColor);
 
//rect button #1
  if (rectOver_01) {
    fill(blueButtonLighted);
  } else {
    fill(blueButton);
  }
  stroke(0);
  rect(rectX_01, rectY_01, rectSize, rectSize);

//rect button #2
  if (rectOver_02) {
    fill(blueButtonLighted);
  } else {
    fill(blueButton);
  }
  stroke(255);
  rect(rectX_02, rectY_02, rectSize, rectSize);

  //rect button #3
  if (rectOver_03) {
    fill(blueButtonLighted);
  } else {
    fill(blueButton);
  }
  stroke(255);
  rect(rectX_03, rectY_03, rectSize, rectSize);

//rect button #4
  if (rectOver_04) {
    fill(blueButtonLighted);
  } else {
    fill(blueButton);
  }
  stroke(255);
  rect(rectX_04, rectY_04, rectSize, rectSize);

  
// circle button #1
  if (circleOver_01) {
    fill(circleHighlight_01);
  } else {
    fill(circleColor_01);
  }
  stroke(0);
  ellipse(circleX_01, circleY_01, circleSize, circleSize);

// circle button #2
  if (circleOver_02) {
    fill(greenButtonLighted);
  } else {
    fill(greenButton);
  }
  stroke(255);
  ellipse(circleX_02, circleY_02, circleSize, circleSize);
  
  // circle button #3
  if (circleOver_03) {
    fill(yellowButtonLighted);
  } else {
    fill(yellowButton);
  }
  stroke(255);
  ellipse(circleX_03, circleY_03, circleSize, circleSize);

  // circle button #4
  if (circleOver_04) {
    fill(redButtonLighted);
  } else {
    fill(redButton);
  }
  stroke(255);
  ellipse(circleX_04, circleY_04, circleSize, circleSize);

}

void update(int x, int y) {

 
  if ( overCircle(circleX_01, circleY_01, circleSize) ) {
    circleOver_01 = true;
    circleOver_02 = false;
    circleOver_03 = false;
    circleOver_04 = false;
    rectOver_01 = false;
    rectOver_02 = false;
    rectOver_03 = false;
    rectOver_04 = false;
    
  } else if ( overCircle(circleX_02, circleY_02, circleSize) ) {
    circleOver_01 = false;
    circleOver_02 = true;
    circleOver_03 = false;
    circleOver_04 = false;
    rectOver_01 = false;
    rectOver_02 = false;
    rectOver_03 = false;
    rectOver_04 = false;
  
  } else if ( overCircle(circleX_03, circleY_03, circleSize) ) {
    circleOver_01 = false;
    circleOver_02 = false;
    circleOver_03 = true;
    circleOver_04 = false;
    rectOver_01 = false;
    rectOver_02 = false;
    rectOver_03 = false;
    rectOver_04 = false;

  } else if ( overCircle(circleX_04, circleY_04, circleSize) ) {
    circleOver_01 = false;
    circleOver_02 = false;
    circleOver_03 = false;
    circleOver_04 = true;
    rectOver_01 = false;
    rectOver_02 = false;
    rectOver_03 = false;
    rectOver_04 = false;

} else if ( overRect(rectX_01, rectY_01, rectSize, rectSize) ) {
    circleOver_01 = false;
    circleOver_02 = false;
    circleOver_03 = false;
    circleOver_04 = false;
    rectOver_01 = true;
    rectOver_02 = false;
     rectOver_03 = false;
    rectOver_04 = false;
   
  } else if ( overRect(rectX_02, rectY_02, rectSize, rectSize) ) {
    circleOver_01 = false;
    circleOver_02 = false;
    circleOver_01 = false;
    circleOver_02 = false;
    rectOver_01 = false;
    rectOver_02 = true;
    rectOver_03 = false;
    rectOver_04 = false;

  } else if ( overRect(rectX_03, rectY_03, rectSize, rectSize) ) {
    circleOver_01 = false;
    circleOver_02 = false;
    circleOver_01 = false;
    circleOver_02 = false;
    rectOver_01 = false;
    rectOver_02 = false;
    rectOver_03 = true;
    rectOver_04 = false;

  } else if ( overRect(rectX_04, rectY_04, rectSize, rectSize) ) {
    circleOver_01 = false;
    circleOver_02 = false;
    circleOver_01 = false;
    circleOver_02 = false;
    rectOver_01 = false;
    rectOver_02 = false;
    rectOver_03 = false;
    rectOver_04 = true;

} else {
    circleOver_01 = circleOver_02 = circleOver_03 = circleOver_04 = false;
    rectOver_01 = rectOver_02 = rectOver_03 = rectOver_04 = false;
  }
}

void mousePressed() {

  if (circleOver_01) {
    currentColor = circleColor_01;
    motorStop();
  }
  
    if (circleOver_02) {
    currentColor = greenButtonLighted;
    motorForward();
  }

    if (circleOver_03) {
    currentColor = yellowButtonLighted;
    motorBackward();
  }
    if (circleOver_04) {
    currentColor = redButtonLighted;
    motorStop();
  }

  if (rectOver_01) {
    currentColor = rectColor;
    motorTurnLeft();
  }

  if (rectOver_02) {
    currentColor = rectColor;
    motorTurnRight();
  }

  if (rectOver_03) {
    currentColor = rectColor;
    speedIncrease();
  }

  if (rectOver_04) {
    currentColor = rectColor;
    speedDecrease();
  }


}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x-width/2 && mouseX <= x+width/2 && 
      mouseY >= y-width/2 && mouseY <= y+height/2) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


void motorStop() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 0;
    command[2] = 0;
    command[3] = 0;
    c.write(command);
} 

void motorForward() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 0;
    command[2] = 1;
    command[3] = 0;
    c.write(command);
} 
void motorBackward() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 0;
    command[2] = 2;
    command[3] = 0;
    c.write(command);
} 

void motorTurnLeft() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 0;
    command[2] = 3;
    command[3] = 0;
    c.write(command);
} 

void motorTurnRight() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 0;
    command[2] = 4;
    command[3] = 0;
    c.write(command);
} 

void speedIncrease() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 2;
    command[2] = 1;
    command[3] = 10;
    c.write(command);
    
} void speedDecrease() {
    command[0] = -1;
    command[4] = -1;
    command[1] = 2;
    command[2] = 2;
    command[3] = 10;
    c.write(command);
} 
