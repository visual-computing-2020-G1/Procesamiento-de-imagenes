//press 'c' to change between luma and rgb
PShader grayScaleConversion;
PImage img;
PVector v1, v2;  
PShape square,square2;
boolean flag = true;

void setup() {
  size(1200, 600, P2D);
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg");
  img.resize(600, 600);
  v1 = new PVector(600, 600);
  v2 = new PVector(600, 600);
  grayScaleConversion = loadShader("fragShader.glsl");
  grayScaleConversion.set("img", img);
  grayScaleConversion.set("imgResolution", v1);
  grayScaleConversion.set("u_resolution", v2);
  grayScaleConversion.set("flag", flag);
  square = createCanvas(img, 600);  
}
void draw(){
  shader(grayScaleConversion);
  shape(square);
  resetShader();
  image(img, 600, 0, img.width, img.height);
}


PShape createCanvas(PImage img, float size) {
  PShape s = createShape();
  s.beginShape();
  s.texture(img);
  s.vertex(0, 0, 0, 0);
  s.vertex(0,size, 0,size);
  s.vertex(size, size, size, size);
  s.vertex(size, 0, size, 0);
  s.endShape(CLOSE);
  return s;
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;
    grayScaleConversion.set("flag", flag);
  }
}
