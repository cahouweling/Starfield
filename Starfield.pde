Particle [] box;
void setup()   
 {     
  size(600,600);
  box = new Particle [300];
  for(int i = 0; i < box.length; i++)
  {
    box[i] = new NormalParticle();
  }
  box[0] = new OddballParticle();
  box[1] = new JumboParticle();
 }   
 void draw()   
 {    
  background(0);
  for(int i = 0; i < box.length; i++)
  {
    box[i].move();
    box[i].show();
  }
}
void mousePressed() 
{
  for(int i = 2; i < box.length; i++)
  {
    ((NormalParticle)box[i]).x = 300;
    ((NormalParticle)box[i]).y = 300;
    ((NormalParticle)box[i]).speed = Math.random();
    ((NormalParticle)box[i]).colour = (int)(Math.random()*205 + 50);
    ((NormalParticle)box[i]).angle = Math.random()*2*PI;
    ((OddballParticle)box[0]).x = 300;
    ((OddballParticle)box[0]).y = 300;
    ((OddballParticle)box[0]).speed = Math.random();
    ((OddballParticle)box[0]).angle = Math.random()*2*PI;
    ((JumboParticle)box[1]).x = 300;
    ((JumboParticle)box[1]).y = 300;
    ((JumboParticle)box[1]).speed = Math.random();
    ((JumboParticle)box[1]).angle = Math.random()*2*PI;
  }	
}  

class NormalParticle implements Particle
{
  double x,y,speed,angle;
  int colour, size;
  NormalParticle()
  {
    x = 300;
    y = 300;
    size = ((int)Math.random()*2)+2;
    speed = Math.random();
    colour = (int)(Math.random()*205 + 50);
    angle = Math.random()*2*PI;
  }
  public void show()
  {
    noStroke();
    fill(colour);
    ellipse((float)x,(float)y,size,size);
  }
  public void move()
  {
  	x = x + Math.cos(angle)*speed;
  	y = y + Math.sin(angle)*speed;
  }
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
  double x,y,speed,angle;
  int size,r,g,b;
  OddballParticle()
  {
    x = 300;
    y = 300;
    r = 255;
    g = 120;
    b = 0;
    speed = Math.random();
    angle = Math.random()*2*PI;
    size = 6;
  }
  public void show()
  {
    noStroke();
    fill(r,g,b);
    ellipse((float)x,(float)y,size,size);
  }
  public void move()
  {
  	x = x + Math.cos(angle)*speed;
  	y = y + Math.sin(angle)*speed;
  }
}
class JumboParticle extends OddballParticle
{
  JumboParticle()
  {
    size = 10;
    r = 0;
    g = 119;
    b = 190;
  }
}

