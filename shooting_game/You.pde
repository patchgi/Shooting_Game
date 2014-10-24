class You {
  int posX=width/2, posY=height-50, count;
  boolean shot, shooting;
  int []bullet=new int[10000];
  int []bX1=new int[10000];
  int []bY1=new int[10000];
  int []bX21=new int[10000];
  int []bY21=new int[10000];
  int []bX22=new int[10000];
  int []bY22=new int[10000];
  int []bX24=new int[10000];
  int []bY24=new int[10000];
  int []bX25=new int[10000];
  int []bY25=new int[10000];
  int []bX23=new int[10000];
  int []bY23=new int[10000];
  boolean []weapon=new boolean[3];
  boolean u, d, l, r;
  You() {
    weapon[0]=true;
  }

  void display() {
    fill(255);


    if (shot&&!shooting) {
      setBullet();
      shooting=true;
    }
    shooting=shot;

    for (int i=0;i<bullet.length;i++) {
      if (bullet[i]==1) {
        if (weapon[0]) {
          ellipse(bX1[i], bY1[i], 10, 10);
          bY1[i]-=7;
          bX21[i]=posX;          
          bY21[i]=posY;
          bX22[i]=posX;
          bY22[i]=posY;
          bX23[i]=posX;
          bY23[i]=posY;
          bX24[i]=posX;
          bY24[i]=posY;
          bX25[i]=posX;
          bY25[i]=posY;
        }
        else if (weapon[1]) {
          ellipse(bX21[i], bY21[i], 10, 10);
          ellipse(bX22[i], bY22[i], 10, 10);
          ellipse(bX23[i], bY23[i], 10, 10);
          ellipse(bX24[i], bY24[i], 10, 10);
          ellipse(bX25[i], bY25[i], 10, 10);
          bX1[i]=posX;
          bY1[i]=posY;
          
          bX21[i]-=5;
          bY21[i]-=3;
          bX22[i]-=3;
          bY22[i]-=5;
          bX24[i]+=5;
          bY24[i]-=3;
          bX25[i]+=3;
          bY25[i]-=5;
          bY23[i]-=7;
        }
      }




      if (bY21[i]<0) {
        bX21[i]=posX;          
        bY21[i]=posY;
      }
      else if (bY22[i]<0) {  
        bX22[i]=posX;
        bY22[i]=posY;
      }
      else if (bY23[i]<0) {
        bX23[i]=posX;
        bY23[i]=posY;
        bullet[i]=0;
      }
      else if (bY24[i]<0) {
        bX24[i]=posX;
        bY24[i]=posY;
         
      }
      else if (bY25[i]<0) {
        bX25[i]=posX;
        bY25[i]=posY;
     
      }
    }
    if (count>0) {
      count--;
    }

    if (u) {
      posY-=5;
    }
    if (d) {
      posY+=5;
    }

    if (l) {
      posX-=5;
    }

    if (r) {
      posX+=5;
    }
    triangle(posX, posY, posX-15, posY+15, posX+15, posY+15);
  }

  void setBullet() {
    if (count==0) {
      for (int i=0;i<bullet.length;i++) {
        if (bullet[i]==0) {
          bullet[i]=1;
          if (weapon[0]) {
            bX1[i]=posX;
            bY1[i]=posY+5;
          }
          else if (weapon[1]) {
            bX21[i]=posX;
            bY21[i]=posY+5;
            bX22[i]=posX;
            bY22[i]=posY+5;
            bX23[i]=posX;
            bY23[i]=posY+5;
            bX24[i]=posX;
            bY24[i]=posY+5;
            bX25[i]=posX;
            bY25[i]=posY+5;
          }
          count=10;
          break;
        }
      }
    }
  }

  void shot() {
    if (keyCode==32) {
      shot=!shot;
    }
  }
  void move() {
   

    switch (keyCode) {
    case UP:
      u=true;
      break;

    case DOWN:
      d=true;
      break;

    case LEFT:
      l=true;

      break;

    case RIGHT:
      r=true;
      break;
    }
     if (posX<15) {
      posX=15;
    }

    else if (posX>width-15) {
      posX=width-15;
    }

    else if (posY<15) {
      posY=15;
    }

    else if (posY>height-15) {
      posY=height-15;
    }

  }

  void selectWeapon() {
    switch(keyCode) {
    case 49:
      weapon[0]=true;
      weapon[1]=false;
      weapon[2]=false;
      break;

    case 50:
      weapon[1]=true;
      weapon[0]=false;
      weapon[2]=false;
      break;

    case 51:
      weapon[2]=true;
      weapon[1]=false;
      weapon[0]=false;
      break;
    }
  }

  void cansel() {
    switch (keyCode) {
    case UP:
      u=false;
      break;

    case DOWN:
      d=false;
      break;

    case LEFT:
      l=false;

      break;

    case RIGHT:
      r=false;
      break;
    }
  }
}

