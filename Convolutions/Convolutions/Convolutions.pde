//press 'c' to change the kernel

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
  img.resize(600, 600); 
  pg.beginDraw();
  pg.background(0);
  pg.stroke(255);
  pg.image(img, 0, 0, img.width, img.height); 
  pg.endDraw();
  image(pg,0,0);
  applyFilter(img);
  image(img, 600, 0);
}

void applyFilter(PImage img){
 int xAux,yAux; 
 for (int i = 0; i < img.width*img.height; i++) {
     int loc;
     int x = i%img.width;
     int y = floor(i/img.width);  
     loc = x+(y*img.width);
     color c5 = img.pixels[loc];     
     xAux = x-1;
     yAux = y-1;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c1 = img.pixels[loc];
     xAux = x;
     yAux = y-1;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c2 = img.pixels[loc];
     xAux = x+1;
     yAux = y-1;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c3 = img.pixels[loc];
     xAux = x-1;
     yAux = y;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c4 = img.pixels[loc];
     xAux = x+1;
     yAux = y;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c6 = img.pixels[loc];
     xAux = x-1;
     yAux = y+1;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c7 = img.pixels[loc];
     xAux = x;
     yAux = y+1;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c8 = img.pixels[loc];
     xAux = x+1;
     yAux = y+1;
     loc = xAux+(yAux*img.width);
     loc = constrain(loc,0,img.pixels.length-1);     
     color c9 = img.pixels[loc];
     float red,green,blue;
     
     if (flag){
       //BoxBlur
       red = (red(c1)+red(c2)+red(c3)+red(c4)+red(c5)+red(c6)+red(c7)+red(c8)+red(c9))/9;
       green = (green(c1)+green(c2)+green(c3)+green(c4)+green(c5)+green(c6)+green(c7)+green(c8)+green(c9))/9;
       blue = (blue(c1)+blue(c2)+blue(c3)+blue(c4)+blue(c5)+blue(c6)+blue(c7)+blue(c8)+blue(c9))/9;
     }else{
       //EdgeDetection
       red = (red(c1)*-1+red(c2)*-1+red(c3)*-1+red(c4)*-1+red(c5)*9+red(c6)*-1+red(c7)*-1+red(c8)*-1+red(c9)*-1);
       green = (green(c1)*-1+green(c2)*-1+green(c3)*-1+green(c4)*-1+green(c5)*9+green(c6)*-1+green(c7)*-1+green(c8)*-1+green(c9)*-1);
       blue = (blue(c1)*-1+blue(c2)*-1+blue(c3)*-1+blue(c4)*-1+blue(c5)*9+blue(c6)*-1+blue(c7)*-1+blue(c8)*-1+blue(c9)*-1);
       red = constrain(red, 0, 255);
       green = constrain(green, 0, 255);
       blue = constrain(blue, 0, 255);
     }  
     
     color c = color(red,green,blue);
     img.pixels[i] = c;
    }
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;    
  }
}
