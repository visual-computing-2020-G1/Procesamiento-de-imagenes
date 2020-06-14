//press 'c' to change between edge detection and sharpen filter
PShader convolution;
PImage img;
PShape square,square2;
boolean flag = true;

void setup() {
  size(1200, 600, P2D);
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg");
  img.resize(600, 600);
  convolution = loadShader("FragShader.glsl");
  convolution.set("img", img);
  convolution.set("flag", flag);
  square = createCanvas(img, 600);  
}
void draw(){
  shader(convolution);
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
    convolution.set("flag", flag);
  }
}
