
// UP DOWN LEFT RIGHT
int buttonUp = 2;
int buttonDown = 3;
int buttonLeft = 4;
int buttonRight = 5;
int mappedPot;
int reader;

void setup() {
  mappedPot = 0;
  reader = 0;
  Serial.begin(9600); 
  pinMode(buttonUp,INPUT);
  pinMode(buttonDown,INPUT);
  pinMode(buttonLeft,INPUT);
  pinMode(buttonRight,INPUT);
}

void loop() { 
  if (digitalRead(buttonUp) == HIGH){
    Serial.write(1);
    delay(5);
  }
  else if (digitalRead(buttonDown) == HIGH){
    Serial.write(2);
    delay(5);
  }
  else if (digitalRead(buttonLeft) == HIGH){
    Serial.write(3);
    delay(5);
  }
  else if (digitalRead(buttonRight) == HIGH){
    Serial.write(4);
    delay(5);
  }
  else{
    Serial.write(potReader());
    delay(5);
  }
  delay(55);
}

int potReader(){
  //add 4 _ not interfering with moving values
  mappedPot = map(analogRead(A0),0,1023,0,250)+5;
  //delay(5);
  return mappedPot; //reader  
}


