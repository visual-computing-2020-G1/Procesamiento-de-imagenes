//press 'c' to change the kernel

PImage img;
PGraphics pg;
boolean flag=false;

float[][] edgeDetection = {{ -1, -1,  -1 }, 
                          {  -1,  9,  -1 }, 
                          {  -1, -1,  -1 }};
float[][] sharpen = {{  1,  -2,   1 },
                     { -2,   5,  -2 },
                     {  1,  -2,   1 }};
float[][] kernel;


void setup() {
  background(0,0,0);
  size(1200, 600); 
  pg = createGraphics(600,600);
}

void draw() { 
  img = loadImage("980px-Fire_breathing_2_Luc_Viatour.jpg"); 
  img.resize(600, 600); 
  pg.beginDraw();
  pg.image(img, 0, 0, img.width, img.height); 
  pg.endDraw();
  image(pg,0,0);
  applyFilter(img);
}

void applyFilter(PImage img){
   if(flag){
      kernel = edgeDetection;
   }else{
     kernel = sharpen;
   }
  img.loadPixels();
  PImage newImage = createImage(img.width, img.height, RGB);
  for (int y = 1; y < img.height-1; y++) { 
    for (int x = 1; x < img.width-1; x++) { 
      float totalBlue = 0; 
      float totalRed = 0;
      float totalGreen = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*img.width + (x + kx); 
          float red = red(img.pixels[pos]);
          totalRed += kernel[ky+1][kx+1] * red;
          float green = green(img.pixels[pos]);
          totalGreen += kernel[ky+1][kx+1] * green;
          float blue = blue(img.pixels[pos]);
          totalBlue += kernel[ky+1][kx+1] * blue;
        }
      }
     color c = color(totalRed,totalGreen,totalBlue);
     int loc = y*img.width + x;
     newImage.pixels[loc] = c;
    }
  }
  newImage.updatePixels();  
  image(newImage, 600, 0);
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;    
  }
}
