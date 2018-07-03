import processing.serial.*;

int moveX;
int moveY;
int rectSize;
int[] moveValues;
int indAddMove;
int indAddSize;
Serial port;
String portTest = " ";

//used in move() to go through array
int move = 0;

void setup(){
  println(port.list());
  port =  new Serial(this,port.list()[2],9600);
  moveX = 0;
  moveY = 0;
  rectSize = 0;
  moveValues = new int[50];
  indAddSize = 0;
  
  //populate moveValues array
  for (int i=1; i<moveValues.length; i++){
    indAddMove += 10;
    if (indAddMove > 700){          //HARDCODE!
      indAddMove = 700;
    }
    moveValues[i] = indAddMove;
  }
  
  println(portTest);
  size(700,700);
  noStroke();
}

void draw(){
  background(255);
  fill(0,255,233);
  int fixed = 100;
  rect(moveX,moveY,rectSize,rectSize);
  control(port.read());
  delay(80);
}

void control(int reader){
  // feed port readings to reader variable
  // serial com is UP DOWN LEFT RIGHT
  if (reader < 5){
    println(reader);
  switch (reader){
    case 1:  moveUp();delay(5);
    break;
    
    case 2:  moveDown();delay(5);
    break;
    
    case 3:  moveLeft();delay(5);
    break;
    
    case 4:  moveRight();delay(5);
    break;
  }
  }
  else{
    println(reader);
    //These are size controls
    rectSizeChange();
    delay(5);
}
}

//rect size change
void rectSizeChange(){
  rectSize = port.read();
  delay(5);
} //<>//

void moveDown(){
  if (move == moveValues.length-1){
    move = 0;
  }
  moveY = moveValues[move++];
  delay(5);
}

void moveUp(){
  //check if array index is already 0
  if (move == 0){
    move = moveValues.length-1;
  }
  moveY = moveValues[move--]; 
  delay(5);
}

void moveRight(){
  if (move == moveValues.length-1){
    move = 0;
  }
  moveX = moveValues[move++]; 
  delay(5);
}

void moveLeft(){
  //check if array index is already 0
  if (move == 0){
    move = moveValues.length-1;
  }
  moveX = moveValues[move--]; 
  delay(5);
}