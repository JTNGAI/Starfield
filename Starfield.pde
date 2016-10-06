//your code here
Particle [] particles ;
int nI=0;
void setup()
{
  size(500, 500);
  background(0);
  particles = new Particle[100]; 
  for (int nI =0; nI< particles.length; nI++)
  {
    particles[ nI]=  new NormalParticle();
  }
  particles[0]= new OddballParticle();
  particles[1]= new JumboParticle();
}
void draw()
{
  background(0);
  for (int nI =0; nI< particles.length; nI++)
  {
    particles[nI].move();
    particles[nI].show();
  }
}

interface Particle
{
  //your code here
  public void show();
  public void move();
}  
class NormalParticle implements Particle 
{
  double dX, dY, dSpeed, dTheta, myColor;
  NormalParticle()
  {
    dX= 250;
    dY=250;
    dSpeed= Math.random()*15; 
    dTheta= Math.random()*2*Math.PI ;
    myColor=color(255);
  }
  public void move()
  {
    dX= dX+ Math.cos(dTheta)*dSpeed;
    dY= dY+ Math.sin(dTheta)*dSpeed;
    dTheta= dTheta+.1;
  }
  public void show()
  {
    fill((int)myColor);
    ellipse((int)dX, (int)dY, 10, 10);
  }
}  
class OddballParticle implements Particle  //uses an interface
{
  double dX,dY,dSpeed,dTheta;
  OddballParticle()
  {
    dX= 250;
    dY=250;
    dSpeed= Math.random()*9; 
    dTheta= Math.random()*2*Math.PI ;
  }
  public void show()
  {
    fill(0, 255, 0);
    ellipse((int)dX,(int)dY, 20, 20);
  }
  public void move()
  {
    dX= dX+ Math.cos(dSpeed)*dTheta;
    dY= dY+ Math.sin(dSpeed)*dTheta;
  }
}
class JumboParticle extends NormalParticle //uses inheritance
{
  //your code here
  public void show()
  {
    fill(255, 0, 0, 127);
    ellipse((int)dX, (int)dY, 30, 30);
  }
}