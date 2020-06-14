import processing.video.*;
//press 'c' to change the kernel

Movie movie;
PGraphics pg;
boolean flag=true;

float[][] edgeDetection = {{ -1, -1,  -1 }, 
                          {  -1,  9,  -1 }, 
                          {  -1, -1,  -1 }};
float[][] sharpen = {{  1,  -2,   1 },
                     { -2,   5,  -2 },
                     {  1,  -2,   1 }};
float[][] kernel;
                    
float frameRateSum,frameRateAverage;

void setup() {
  background(0,0,0);
  size(1120, 320); 
  pg = createGraphics(560, 320);
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
  pg.beginDraw();
  pg.image(movie, 0, 0, 560, 320); 
  pg.endDraw();
  image(pg,0,0);  
  applyFilter(movie);  
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
  image(newImage, 560, 0);
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;    
  }
}

void movieEvent(Movie movie) {  
  movie.read(); 
}
