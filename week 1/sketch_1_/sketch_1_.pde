int w;
int h;
float myFloat;
String myString; 

void setup(){ 
myString = "hey you";
w = 100;
h = 200;
size(500, 500);
 background(344, 67,30);
 noStroke();
 //frameRate(5);
 textSize(24);
 }


void draw (){
//  println("Hello Console");
//  println("Hi Back");

rectMode(CENTER);
fill(random(0,255), random(0,255), random(0,255));
 rect(width*.25, height*.25, 100, 100);
 
 fill(0, 200, 444);
 ellipse(width*.25, height*.25, 50, 50);
 
 noStroke();
 triangle(47, 60, 78, 34, 99, 300);
text(myString, width/2, height/2);
}