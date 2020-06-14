import processing.video.*;

PImage img;
PGraphics pg; 
PFont font;
int fontSize = 7;
Movie movie; 
float frameRateSum,frameRateAverage;

void setup() {
  size(1120, 320);
  font = loadFont("UniversLTStd-Light-48.vlw");
  pg = createGraphics(560,320);
  movie = new Movie(this, "toma2.mp4");  
  movie.loop();  
}

void draw() { 
  frameRateSum += frameRate;
  if (frameCount == 1000){
    frameRateAverage = frameRateSum / frameCount;
    println(frameRateAverage);
    movie.stop();
    noLoop();
  }
  background(0);
  stroke(255);
  pg.beginDraw();
  pg.image(movie, 0, 0, 560, 320);  
  pg.endDraw(); 
  image(pg, 0, 0);  
  movie.loadPixels();
  
  String letterOrder =
  " .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLu" +
  "nT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q";
  char[] letters;
  letters = new char[256];
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letterOrder.length()));
    letters[i] = letterOrder.charAt(index);
  }  

  textFont(font, fontSize);
  int resolution = fontSize;
  int value;
  for (int i = 0; i < movie.width; i+=resolution) {
    for (int j = 0; j < movie.height; j+=resolution) {
      value = int(brightness(movie.pixels[j * movie.width + i]));      
      text(letters[value], 560+i, j);      
    }    
  }
}

void movieEvent(Movie movie) {  
  movie.read();  
}
