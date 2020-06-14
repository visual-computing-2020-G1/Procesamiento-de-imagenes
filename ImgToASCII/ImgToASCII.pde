PImage img;
PGraphics pg; 
PFont font;
int fontSize = 7;

void setup() {
  background(0,0,0);
  size(1200, 600); 
  pg = createGraphics(600,600);
  font = loadFont("UniversLTStd-Light-48.vlw");
}

void draw() {
  background(0);
  stroke(255);
  pg.beginDraw();
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg"); 
  img.resize(600, 600);  
  pg.image(img, 0, 0, img.width, img.height);  
  pg.endDraw(); 
  image(pg, 0, 0);  
  img.loadPixels();
  
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
  for (int i = 0; i < img.width; i+=resolution) {
    for (int j = 0; j < img.height; j+=resolution) {
      value = int(brightness(img.pixels[j * img.width + i]));      
      text(letters[value], 600+i, j);      
    }    
  }  

}
