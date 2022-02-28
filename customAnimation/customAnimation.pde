//custom Animation

// TO-DO
// fix white line moon problem

//Variables ================================================================================
int gX, sY, sD, oX, closing, bX;
float chAngle, bColorChange, sunX, moonX;
PFont custoFont;

//set up ================================================================================
void setup() {
  size(800, 600, P2D);
  gX = 0;
  bX = 0;
  sY = 320;
  sD = 8;
  oX = 800;
  closing = 0;
  chAngle = 0;
  bColorChange = 0;
  custoFont = createFont("Meiland Gorgeous.ttf", 200);
  sunX = 800;
  moonX = -800;
}
//draw ================================================================================
void draw() {
  background(200);
  if (frameCount < 1000) { //opening animation
    ground(gX); //ground ===========================================================
    gX = gX - 5;
    if (gX < -100) gX = 0;
    backdrop(bX, bColorChange); //back drop ===========================================================
    bColorChange = bColorChange + 0.18;
    bX = bX - 2;
    if (bX < -160) bX = 0;
    square(sY); //square jump ============================================================
    if (oX < 300 && oX > 30) sY = sY - sD;
    if (oX >= 185 && oX < 300) sD = 10;
    if (oX > 30 && oX < 185) sD = -10;
    if (sY > 320) sY = 320;
    obs(oX); //obstacle ================================================================
    oX = oX - 5;
    if (oX <= -100) oX = 900;
    dayCycle(sunX, moonX, bColorChange);
    if (sunX > -100) sunX = sunX - 1.6; //sun ============================================================
    if (moonX < 900) moonX = moonX + 1.6; //moon ========================================================
    clock(598, 150, chAngle); //clock =============================================================
    chAngle = chAngle + 0.72;
  }
  if (frameCount >= 1000 && frameCount <= 1050) { //closing animation========================
    fill(0);
    rect(0, 0, 16+closing, 600);
    closing = closing + 16;
  }
  if (frameCount > 1050) { //ending animation================================================
    background(0);
    bColorChange = 0; //reset backdrop color
    sunX = 800; //reset sun
    moonX = -800; //reset moon
    textFont(custoFont);
    fill(255);
    ending();
  }
  if (frameCount > 1500) frameCount = 0; //replay ====================================
}
//custom functions ======================================================
void ground(int x) {
  fill(23, 35, 93);
  rect(x, 400, 900, 200);
  stroke(255);
  line(x+100, 400, x+100, 600);
  line(x+200, 400, x+200, 600);
  line(x+300, 400, x+300, 600);
  line(x+400, 400, x+400, 600);
  line(x+500, 400, x+500, 600);
  line(x+600, 400, x+600, 600);
  line(x+700, 400, x+700, 600);
  line(x+800, 400, x+800, 600);
} //===============================================================================
void backdrop(int x, float colorD) {
  fill(198-colorD, 245-colorD, 255-colorD);
  rect(0, 0, 800, 400);
  stroke(255);
  line(x+160, 400, x+160, 0);
  line(x+320, 400, x+320, 0);
  line(x+480, 400, x+480, 0);
  line(x+640, 400, x+640, 0);
  line(x+800, 400, x+800, 0);
} //===============================================================================
void square(int y) {
  fill(255, 0, 0);
  rect(200, y, 80, 80);
} //===============================================================================
void obs(int x) {
  stroke(255);
  fill(23, 35, 93);
  triangle(x, 400, x+50, 300, x+100, 400);
  stroke(12, 201, 165);
  fill(203, 165, 39);
  textAlign(CENTER, CENTER);
  if (frameCount < 200) {
    textSize(30);
    text("Waking-up", x+50, 280);
  }
  if (frameCount > 200 && frameCount < 400) {
    textSize(40);
    text("School", x+50, 280);
  }
  if (frameCount > 400 && frameCount < 600) {
    textSize(40);
    text("Tests", x+50, 280);
  }
  if (frameCount > 600 && frameCount < 800) {
    textSize(38);
    text("Classes", x+50, 280);
  }
  if (frameCount > 800) {
    textSize(38);
    text("Homework", x+50, 280);
  }
  if (frameCount > 950) text("SLEEP !!!", 240, 400);
} //===============================================================================
void clock(int x, int y, float angle) {
  stroke(0); //clock face ==================================================================================
  strokeWeight(4);
  fill(255);
  ellipse(600, 150, 100, 100);
  strokeWeight(2);
  line(550, 150, 560, 150);
  line(650, 150, 640, 150);
  line(600, 100, 600, 110);
  line(600, 200, 600, 190);
  pushMatrix(); // hour hand =======================================================================================
  translate(x, y);
  rotate(radians(angle));
  strokeWeight(4);
  line(0, 0, 0, -20);
  popMatrix();
  pushMatrix(); //minute hand =====================================================================================
  strokeWeight(2);
  stroke(255, 0, 0);
  translate(x, y);
  rotate(radians(2*angle));
  line(0, 0, 0, -30);
  popMatrix();
} //===============================================================================
void ending() {
  textAlign(CORNER, CENTER);
  textSize(96);
  text("End of A Day", 100, 100);
  if (frameCount > 1080) {
    textSize(64);
    text("by:", 400, 300);
  }
  if (frameCount > 1100) {
    textSize(64);
    text("Victor", 550, 300);
  }
} //===========================================================================================================
void dayCycle(float x, float mX, float mColor) {
  if ((frameCount / 500) <= 1 ) { // sun
    stroke(241, 255, 49);
    fill(241, 255, 49);
    ellipse(x, 0.00125*x*(x-800)+200, 100, 100);
  }
  if (frameCount >= 500 ) { // moon
    stroke(255);
    fill(255);
    ellipse(mX, 0.00125*mX*(mX-800)+200, 100, 100);
    fill(198-mColor, 245-mColor, 255-mColor);
    noStroke();
    ellipse(mX+15, 0.00125*mX*(mX-800)+200, 95, 95);
  }
}
