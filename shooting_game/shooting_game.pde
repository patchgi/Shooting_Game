You you;

void setup() {
  size(400, 800);
  you=new You();
}
int i=0;
void draw() {
  background(0);
  you.display();
}


void keyPressed() {
  you.move();
  you.shot();
  you.selectWeapon();
}

void keyReleased() {
  you.cansel();
}

