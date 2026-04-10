public class Walker{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float scale = 15;
  public float mass = 1;
  
  public color c = color(255, 255, 255);
  
  public float g = 1;
  
  // Second Law of Motion
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void applyFriction(){
    float mew = 0.1f;
    PVector friction = this.velocity.copy();
    friction.mult(-1).normalize().mult(mew);
    applyForce(friction);
  }
  
  public void update() {
    this.velocity.add(this.acceleration); // velocity accumulation
    this.position.add(this.velocity);
    this.acceleration.mult(0);
    
    if (velocity.mag() < 0.01f) {
      velocity.mult(0);
    }
  }
  
  public void render() {
    fill(c);
    circle(position.x, position.y, scale);
  }
  
  public PVector calculateAttraction(Walker walker){
    PVector force = PVector.sub(this.position, walker.position); //direction
    float distance = force.mag();
    force.normalize(); // accurate direction
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.g * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  //public void checkEdges(){
  //  float r = scale / 2.0;

  //  if (position.x + r >= Window.right){
  //    position.x = Window.right - r;
  //    velocity.x *= -1;
  //  } else if (position.x - r <= Window.left){
  //    position.x = Window.left + r;
  //    velocity.x *= -1;
  //  }

  //  if (position.y + r >= Window.top){
  //    position.y = Window.top - r;
  //    velocity.y *= -1;
  //  } else if (position.y - r <= Window.bottom){
  //    position.y = Window.bottom + r;
  //    velocity.y *= -1;
  //  }
  //}
}
