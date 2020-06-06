PImage img;
PGraphics pg; 
void setup() {
  background(0,0,0);
  size(1200, 600); 
  pg = createGraphics(600,600);
}

void draw() { 
  pg.beginDraw();
  pg.background(100);
  pg.stroke(255);
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg"); 
  img.resize(600, 600);  
  pg.image(img, 0, 0, img.width, img.height);  
  pg.endDraw(); 
  
  for (int i = 0; i < img.width*img.height; i++) {
      color c = img.pixels[i];
      int weightedAverage = int((0.2126*red(c)+0.7152*green(c)+0.0722*blue(c)));      
      c = color(weightedAverage,weightedAverage,weightedAverage);
      img.pixels[i] = c;
    }
  
  
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

  int resolution = 9;
  int value;
  for (int i = 0; i < img.width; i+=resolution) {
    for (int j = 0; j < img.height; j+=resolution) {
      value = int(brightness(img.pixels[j * img.width + i]));      
      text(letters[value], 600+i, j);      
    }    
  }  

}
