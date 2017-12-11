int myIntegerArray[] = {1, 2, 3, 4, 5}; 
String myStringArray[] = {"whatever", "we", "want","could be a sentence"};
int[] number = new int[5]; 
void setup(){
  //print(myIntegerArray[2]); 
  
  //assign value 4 to the first index of number array; 
  //number[1] = 4; 
  //println(number [1]); 
  for(int i = 0; i<myStringArray.length; i++){
    print(myStringArray[i] + " "); 
  }
  
  for(int i = 0; i<myIntegerArray.length; i++){
    println(myIntegerArray[i]); 
  }
  
  for(int i = 0; i<number.length; i++){
    number[i] = i+1; 
    println(number[i]);
  }
}