ArrayList<Particle> particles; 
PVector origin;

void setup(){
size(654,654);
particles = new ArrayList<Particle>();

}

void draw (){
  background (650);
  particles.add (new Particle());
 for (int i=0; i< particles.size();i++){
   Particle p = particles.get(i);
   p.update();
   p.display();
   if(p.accelaration.y > 1.8){
     particles. remove(i);
   
}
}
}