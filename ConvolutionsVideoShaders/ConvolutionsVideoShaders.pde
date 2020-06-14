//press 'c' to change between edge detection and sharpen filter
import processing.video.*;

Movie movie;
PShader convolution;
PImage img;
PShape square;
boolean flag = true;
float frameRateSum,frameRateAverage;

void setup() {
  size(1120, 320, P2D);
  movie = new Movie(this, "toma2.mp4"); 
  movie.loop();
  convolution = loadShader("FragShader.glsl");
  convolution.set("flag", flag);
}

void draw(){
  frameRateSum += frameRate;
  if (frameCount == 1000){
    frameRateAverage = frameRateSum / frameCount;
    println(frameRateAverage);
    movie.stop();
    noLoop();
  }
  shader(convolution);
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
    convolution.set("flag", flag);
  }
}

void movieEvent(Movie movie) {  
  movie.read();
  convolution.set("img", movie);  
}
