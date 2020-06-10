import processing.video.*;

Movie movie; 
PGraphics pg;
boolean flag=true;

void setup() {  
  size(1200, 600);
  pg = createGraphics(600,600);
  frameRate(1);
  movie = new Movie(this, "toma2.mp4");  
  movie.loop();
}
void draw() {
  image(movie, 0, 0, 600, 600);
  if(flag){
    //rgb average
    for (int i = 0; i < movie.width*movie.height; i++) {
      color c = movie.pixels[i];
      int rgbAverage = int((red(c)+green(c)+blue(c))/3);      
      c = color(rgbAverage,rgbAverage,rgbAverage);
      movie.pixels[i] = c;
    }
  }else{
     //rgb luma  
    for (int i = 0; i < movie.width*movie.height; i++) {
        color c = movie.pixels[i];
        int weightedAverage = int((0.2126*red(c)+0.7152*green(c)+0.0722*blue(c)));      
        c = color(weightedAverage,weightedAverage,weightedAverage);
        movie.pixels[i] = c;
      }
  }  
  pg.beginDraw();
  pg.image(movie, 0, 0, 600, 600);
  pg.endDraw();
  image(pg, 600, 0);
}

void movieEvent(Movie movie) {  
  movie.read();  
}

void keyPressed(){
  if (key == 'c') {
    flag = !flag;    
  }
}
