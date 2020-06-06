PImage img;
PGraphics pg; 
void setup() {
  background(0,0,0);
  size(1200, 600); 
  pg = createGraphics(1200,600);
}

void draw() { 
  pg.beginDraw();
  pg.background(100);
  pg.stroke(255);
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg"); 
  img.resize(600, 600);  
 for (int i = 0; i < img.width*img.height; i++) {
      color c = img.pixels[i];
      int rgbAverage = int((red(c)+green(c)+blue(c))/3);      
      c = color(rgbAverage,rgbAverage,rgbAverage);
      img.pixels[i] = c;
    }
  pg.image(img, 0, 0, img.width, img.height);
  
  for (int i = 0; i < img.width*img.height; i++) {
      color c = img.pixels[i];
      int weightedAverage = int((0.2126*red(c)+0.7152*green(c)+0.0722*blue(c)));      
      c = color(weightedAverage,weightedAverage,weightedAverage);
      img.pixels[i] = c;
    }
  pg.image(img, 600, 0, img.width, img.height);  
  pg.endDraw();  
  
  image(pg, 0, 0);

}
