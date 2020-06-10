//press 'c' to change between rgb average and luma
PImage img;
PGraphics pg; 
boolean flag=true;

void setup() {
  background(0,0,0);
  size(1200, 600); 
  pg = createGraphics(600,600);
}

void draw() { 
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg"); 
  img.resize(600,600); 
  pg.beginDraw();
  pg.image(img, 0, 0, img.width, img.height);
  pg.endDraw();
  image(pg, 0, 0);
  if(flag){
    //rgb average
    for (int i = 0; i < img.width*img.height; i++) {
        color c = img.pixels[i];
        int rgbAverage = int((red(c)+green(c)+blue(c))/3);      
        c = color(rgbAverage,rgbAverage,rgbAverage);
        img.pixels[i] = c;
      }
  }else{
     //rgb luma  
    for (int i = 0; i < img.width*img.height; i++) {
        color c = img.pixels[i];
        int weightedAverage = int((0.2126*red(c)+0.7152*green(c)+0.0722*blue(c)));      
        c = color(weightedAverage,weightedAverage,weightedAverage);
        img.pixels[i] = c;
      }
  }
  image(img, 600, 0, img.width, img.height);  
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;    
  }
}
