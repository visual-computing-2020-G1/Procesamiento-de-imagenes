//press 'c' to change between luma and rgb average
import processing.video.*;
PShader grayScaleConversion;
PVector v1;  
PShape square,square2;
boolean flag = true;

Movie movie; 
PGraphics pg;
float frameRateSum,frameRateAverage;

void setup() {
  size(1120, 320, P2D);
  movie = new Movie(this, "toma2.mp4"); 
  movie.loop();
  v1 = new PVector(560, 320);
  grayScaleConversion = loadShader("fragShader.glsl");
  grayScaleConversion.set("u_resolution", v1);
  grayScaleConversion.set("flag", flag);    
}

void draw(){
  frameRateSum += frameRate;
  if (frameCount == 1000){
    frameRateAverage = frameRateSum / frameCount;
    println(frameRateAverage);
    movie.stop();
    noLoop();
  }
  shader(grayScaleConversion); 
  square = createCanvas(movie, movie.width, movie.height);
  shape(square);
  resetShader();
  image(movie, 560, 0, 560, 320);
}

PShape createCanvas(PImage img, float ancho, float alto) {
  PShape s = createShape();
  s.beginShape();
  s.texture(img);
  s.vertex(0, 0, 0, 0);
  s.vertex(0,alto, 0,alto);
  s.vertex(ancho, alto, ancho, alto);
  s.vertex(ancho, 0, ancho, 0);
  s.endShape(CLOSE);
  return s;
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;
    grayScaleConversion.set("flag", flag);
  }
}

void movieEvent(Movie movie) {  
  movie.read();
  grayScaleConversion.set("img", movie);  
}
