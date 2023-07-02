import processing.sound.*;
coin[] bouncingCoins = new coin[20];
int posisi_tongkat = 420;
float angle = 0;
float speed1 = 0.05;
float dirrection = 1;
PImage cherry, tulisan_jackpot, tulisan_tryagain, insert_coin,
stiker_kelapa, back_wall;
int angka_1 = int(random(10));
int angka_2 = int(random(10));
int angka_3 = int(random(10));
int hadiah = 0;
float aa = 0;
float ab = 1;
int bb = 500;
int bc = 185;
PFont font;
//String jp = "JACKPOT";

SoundFile suara_back;
SoundFile suara_jackpot;

void setup() {
  for (int i = 0; i < bouncingCoins.length; i++){
  bouncingCoins[i] = new coin();

  }

  size (1500, 1000);
  font = loadFont("Algerian-48.vlw");
  textFont(font);
  angka_1 = 0;
  angka_2 = 0;
  angka_3 = 0;

  suara_back = new SoundFile(this, "back.wav");
  cherry = loadImage("stiker_badan2.png");
  tulisan_jackpot = loadImage("tulisan_jackpot.png");
  tulisan_tryagain = loadImage("tulisan_tryagain.png");
  insert_coin = loadImage("insert_coin.png");
  stiker_kelapa = loadImage("stiker_kelapa.png");
  back_wall = loadImage("background2.png");
  suara_back.play();
  suara_back.loop();
}

void draw() {
  background(back_wall);
  tongkat();
  kepala();
  mata();



  badan();
  bintang_putar();
  bintang_putar2();
  perintah();
  
  
  
}

void badan() {
  fill(112, 0, 9);
  square (200, 280, 600);
  fill(255);
  square (250, 330, 500);

  
  image(cherry, 255, 335, width/3.05, height/2.03);
  image(insert_coin, 460, 580, width/20, height/17);
  
  fill(148, 99, 1);
  rect (335, 245, 350, 160);
  fill(224, 187, 0);

  //layar hadiah
  rect (335, 660, 330, 130);


  //3 kotak angka
  pushMatrix();

  translate(70, 100);
  square (250, 350, 100);
  translate(130, 0);
  square (250, 350, 100);
  translate(130, 0);
  square (250, 350, 100);
  fill(255);
  popMatrix();
}

void tongkat() {
  pushMatrix();
  fill(255, 138, 5);
  stroke(97, 95, 95);
  strokeWeight(50);
  line (650, 550, 900, 550);
  line (950, posisi_tongkat, 900, 550);
  strokeWeight (5);
  stroke(0);
  square (750, 500, 100);
  ellipse(950, posisi_tongkat, 80, 80);
  popMatrix();
}



void perintah() {
  //perintah acak angka
  if (mousePressed== true) {
    fill(252, 3, 3);
    angka_1 = int(random(10));
    angka_2 = int(random(10));
    angka_3 = int(random(10));

    posisi_tongkat = 700;
    fill(255, 230, 0);
    ellipse(230, 310, 40, 40);
    ellipse(230, 360, 40, 40);
     ellipse(230, 410, 40, 40);
    ellipse(280, 310, 40, 40);
    ellipse(720, 310, 40, 40);
    ellipse(770, 310, 40, 40);
    ellipse(770, 360, 40, 40);
    ellipse(770, 410, 40, 40);
    //suara_jackpot.play();
  } else {
    fill(252, 3, 3);
    posisi_tongkat = 400;
    textSize(104);
    text (angka_1, 340, 540 );
    text (angka_2, 470, 540 );
    text (angka_3, 600, 540 );

    text ("$"+ hadiah, 345, 770);
    fill(133, 133, 133);
    ellipse(230, 310, 40, 40);
    ellipse(230, 360, 40, 40);
     ellipse(230, 410, 40, 40);
    ellipse(720, 310, 40, 40);
    ellipse(280, 310, 40, 40);

    ellipse(770, 310, 40, 40);
    ellipse(770, 360, 40, 40);
    ellipse(770, 410, 40, 40);
  }

  if (keyPressed) {
    if ((key == 'j') || (key == 'J')) {
      angka_1 = 7;
      angka_2 = 7;
      angka_3 = 7;
    }
  }

  if ((angka_1 == 7) && (angka_2 == 7) && (angka_3 == 7)  ) {
    textSize(50);
    fill(252, 148, 3);
    //text (jp,400, 320);
    fill(255);
    hadiah = 1000;
    fill(255, 138, 5);
    rect (355, 260, 310, 130);
    image (tulisan_jackpot, 360, 220, width/5, height/5);
    for (coin b : bouncingCoins){
    b.move();
    b.display();
    }
  } else {
    fill(0, 9, 69);
    rect (355, 260, 310, 130);
    hadiah = (angka_1 + angka_2 + angka_3)*10;
    image (tulisan_tryagain, 360, 220, width/5, height/5);
  }
}
void kepala() {
  noStroke();
  pushMatrix();
  translate(0, aa);
  fill(173, 0, 0);
  arc(500, 300, 500, 540, PI, TWO_PI);
  fill(219, 0, 0);
  arc(500, 300, 470, 510, PI, TWO_PI);
  fill(255, 0, 0);
  arc(500, 300, 440, 480, PI, TWO_PI);

  popMatrix();
  stroke(2);
  aa += ab;
  if ((aa>50)||(aa<0)) {
    ab=-ab;
  }
}


void mata() {
  if (mousePressed) {
    noStroke();
    int x = 500;
    int y = 200;
    fill(255, 215, 0);
    ellipse(x, y, 150, 150);
    fill(0, 1, 59);
    ellipse(x, y, 130, 130);
    fill(0, 2, 128);
    ellipse(x, y, 40, 80);
    fill(0, 4, 255);
    ellipse(x, y, 80, 40);
    fill(255, 215, 0);
    ellipse(x, y, 20, 20);
    fill(0, 0, 0);
    ellipse(x, y, 10, 10);
    fill(255, 215, 0);
    arc(x, y, 150, 150, radians(0), radians(180));
    stroke(2);
    
  } else {
    noStroke();
    int x = 500;
    int y = 200;
    fill(255, 215, 0);
    ellipse(x, y, 150, 150);
    fill(0, 1, 59);
    ellipse(x, y, 130, 130);
    //gerakanpupil
    int p = 500;
    int q = 200;
    if (mouseX > p) {
      p += 10;
    }
    if (mouseX < p) {
      p -= 10;
    }  
    if (mouseY > q) {
      q += 10;
    }
    if (mouseY < q) {
      q -= 10;
    }  
    fill(0, 2, 128);
    ellipse(p, q, 40, 80);
    fill(0, 4, 255);
    ellipse(p, q, 80, 40);
    fill(255, 215, 0);
    ellipse(p, q, 30, 30);
    fill(0, 0, 0);
    ellipse(p, q, 10, 10);
    stroke(2);
 
  }
}

void bintang_putar(){
  pushMatrix();
  translate(230, 850);
  rotate(angle);
  fill(201, 138, 0);
  star(0, 0, 15, 55, 8);
  fill(255, 215, 0);
  star(0, 0, 25, 65, 4);
  fill(74, 58, 0);
  star(0, 0, 5, 15, 4);
  popMatrix();
  angle += speed1 * dirrection;  
}

void bintang_putar2(){
  pushMatrix();
  translate(780, 850);
  rotate(angle);
  fill(201, 138, 0);
  star(0, 0, 15, 55, 8);
  fill(255, 215, 0);
  star(0, 0, 25, 65, 4);
  fill(74, 58, 0);
  star(0, 0, 5, 15, 4);
  popMatrix();
  angle += speed1 * dirrection;  
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
class coin{
  float x, y, velx, vely;
  
  coin() {
    this.x = random(0, width);
    this.y = random(0, height);
    
    this.velx = random(-7, 7);
    this.vely = random(-7,7);
  }
  
  void display(){
    fill(212, 175, 55); 
    stroke(255, 60, 0);
    ellipse(this.x, this.y, 60, 140);
    
    ellipse(this.x, this.y, 20,40);
    stroke(0);
    
  }
  
  void move(){
  
    this.x = this.x + this.velx;
    this.y = this.y + this.vely;
    
    if (this.x < 0 || this.x > width){
      this.velx = this.velx* - 1;
    }
    
    if (this.y < 0 || this.y > width){
      this.vely = this.vely* - 1;
    }
  }
}
