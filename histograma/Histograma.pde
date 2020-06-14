import java.util.Hashtable;
import java.util.HashMap;
import java.util.Set;
import java.util.Arrays;
import java.util.Scanner;

PImage webImg;
PGraphics pg; 

int currentImage = 0;

int maxR;
int maxG;
int maxB;
int max;

int xSize = 500;
int ySize = 50;


float plotX1, plotY1;
float plotX2, plotY2;

float plotX10, plotY10;
float plotX20, plotY20;

float plotX11, plotY11;
float plotX21, plotY21;


float plotX12, plotY12;
float plotX22, plotY22;

float plotX13, plotY13;
float plotX23, plotY23;

float plotX14, plotY14;
float plotX24, plotY24;

float paddingLeft  = 20.0;
float paddingTop =   30.0;
float paddingRight = 20.0 ;
float paddingBottom =20.0 ;

int[] countR ; 
int[] countG ; 
int[] countB ; 

int bins = 20;
float epsilon = 1;

String[] images = {"laDefense.jpg",  "sunflower.jpg" , "blue.jpg", "mario.png" , "soacha.jpg", "socios.jpg", "980px-Fire_breathing_2_Luc_Viatour.jpg"};

Chart chart0;
Chart chart1;
Chart chart2;
Chart chart3;
Chart chart4;
Chart chart5;

int[] histogram;
int[] histogram1;
int[] histogram2;
int[] histogram3;
int[] histogram4;
int[] histogram5;

float r = 0.21;
float g = 0.72;
float b = 0.07;


void setup() {

  size(700, 700);
  //init chart points
  plotX1 = 120;
  plotX2 = xSize + plotX1;
  plotY1 = paddingTop;
  plotY2 = ySize + plotY1;

  plotX10 = 120;
  plotX20 = xSize + plotX1;
  plotY10 = plotY2  + 2 *paddingBottom;
  plotY20 = ySize + plotY10;

  plotX11 = 120;
  plotX21 = xSize + plotX11;
  plotY11 = plotY20  + 2 *paddingBottom;
  plotY21 = ySize + plotY11;

  plotX12 = 120;
  plotX22 = xSize + plotX12;
  plotY12 = plotY21  + 2 *paddingBottom;
  plotY22 = ySize + plotY12;

  plotX13 = 120;
  plotX23 = xSize + plotX13;
  plotY13 = plotY22  + 2 *paddingBottom;
  plotY23 = ySize + plotY13;

  plotX14 = 120;
  plotX24 = xSize + plotX14;
  plotY14 = plotY23  + 2 *paddingBottom;
  plotY24 = ySize + plotY14;

  initAllPlots();

}
void initAllPlots(){
    //Chosing an image
  String image_name = images[currentImage % 7 ];
  webImg = loadImage(image_name, "png");
  image(webImg, 0, 0, plotX1 - paddingLeft, plotY2 + paddingBottom);

  //Drawing plot 0
  histogram = getHistogram(webImg);
  chart0 = new Chart(plotX1, plotY1, xSize, ySize, histogram, "rgb brightness" , #445E25);
  chart0.buildChart();

  //Drawing plot 1
  histogram1 = getHistogramAverageRGB(webImg);
  chart1 = new Chart(plotX10, plotY10, xSize, ySize, histogram1, "rgb average" , #6576AB);
  chart1.buildChart();

  //Drawing plot 2 
  histogram2 = getHistogramWeights(webImg , r, g, b);

  chart2 = new Chart(plotX11, plotY11, xSize, ySize, histogram2, "weights: "+  r + "-" + g + "-" + b  , #25DAF5);
  chart2.buildChart();

  //Drawing plot 3 
  histogram3 = getHistogramRGB(webImg , 0);
  chart3 = new Chart(plotX12, plotY12, xSize, ySize, histogram3, "redPixels" , #ED1A44);
  chart3.buildChart();

  //Drawing plot 3 
  histogram4 = getHistogramRGB(webImg , 1);
  chart4 = new Chart(plotX13, plotY13, xSize, ySize, histogram4, "greenPixels" , #CAF792);
  chart4.buildChart();

  //Drawing plot 3 
  histogram5 = getHistogramRGB(webImg , 2);
  chart5 = new Chart(plotX14, plotY14, xSize, ySize, histogram5, "bluePixels" , #0457D9);
  chart5.buildChart();


}
void mouseClicked() {
 
  currentImage += 1;
  System.out.println(currentImage);
  initAllPlots();
}
void draw() {
  // background(#f5f5f5);
   
  fill(#f5f5f5);
  chart0.buildChart();
  chart0.comparePostions();

  // fill(#f5f5f5);
  chart1.buildChart();
  chart1.comparePostions();
  // fill(#f5f5f5);
  chart2.buildChart();
  chart2.comparePostions();

  chart3.buildChart();
  chart3.comparePostions();

  chart4.buildChart();
  chart4.comparePostions();

  chart5.buildChart();
  chart5.comparePostions();
  
}

void keyPressed() {
  println(key);
  println(r);
  println(g);
  println(b);
  if(key == 'r'){
    if(r + .01 + g + b < 1.0){
      r+=.01;
    } 
  }
  if(key == 't'){
    // println("r " + (r - 1));
    if(r - .01 > 0 ){
      println("r " +r);
      r-=.01;
    }
  }
  if(key == 'g'){
    if(r + .01 + g + b < 1.0){
      g+=.01;
    } 
  }
  if(key == 'h'){
    if(g - .01 > 0 ){
      g-=.01;
    }

  }
  if(key == 'b'){
    if(r + .01 + g + b < 1.0){
      b+=.01;
    } 
  }
  if(key == 'n'){
    if(b - .01 > 0 ){
      b-=.01;
    }
  }
    initAllPlots();
}

                      
int[] getHistogram(PImage image){
  final int w = image.width;
  final int h = image.height;
  int[] values = new int[256];
  Arrays.fill(values, 0);
  for(int i = 0 ; i <w*h; i++){
    int r = (int) (red(image.pixels[i]));
    int g = (int) (green(image.pixels[i]));
    int b = (int) (blue(image.pixels[i]));

    int c = color(r,g,b);
    int brgh = (int) brightness(c);

    values[brgh] += 1 ;
    // System.out.println("brigtness = "  + brightness(c));
    // System.out.println("average rgb = "  + (r + g + b) / 3);
  }
  
    // System.out.println("brigtarray = "  + values);
    int min = Arrays.stream(values).min().getAsInt();
    int max = Arrays.stream(values).max().getAsInt();
    // System.out.println("Min = " + min);
    // System.out.println("Max = " + max);

    return values;
}
int[] getHistogramRGB(PImage image, int flag){
  final int w = image.width;
  final int h = image.height;
  int[] rValues = new int[256];
  int[] gValues = new int[256];
  int[] bValues = new int[256];
  Arrays.fill(rValues, 0);
  Arrays.fill(gValues, 0);
  Arrays.fill(bValues, 0);
  for(int i = 0 ; i <w*h; i++){
    int r = (int) (red(image.pixels[i]));
    int g = (int) (green(image.pixels[i]));
    int b = (int) (blue(image.pixels[i]));
    rValues[r] += 1 ;
    gValues[g] += 1 ;
    bValues[b] += 1 ;
  }
    if(flag == 0){
      return rValues;
    }
    if(flag == 1){
      return gValues;
    }
    if(flag == 2){
      return bValues;
    }
    return bValues;
}
int[] getHistogramAverageRGB(PImage image){
  final int w = image.width;
  final int h = image.height;
  int[] values = new int[256];
  Arrays.fill(values, 0);
  for(int i = 0 ; i <w*h; i++){
    int r = (int) (red(image.pixels[i]));
    int g = (int) (green(image.pixels[i]));
    int b = (int) (blue(image.pixels[i]));

    int c = color(r,g,b);
    int brgh = (r + g + b)/3;

    values[brgh] += 1 ;
    // System.out.println("brigtness = "  + brightness(c));
    // System.out.println("average rgb = "  + (r + g + b) / 3);
  }
  
    // System.out.println("brigtarray = "  + values);
    int min = Arrays.stream(values).min().getAsInt();
    int max = Arrays.stream(values).max().getAsInt();
    // System.out.println("Min = " + min);
    // System.out.println("Max = " + max);

    return values;
}
int[] getHistogramWeights(PImage image, float wr, float wg, float wb){
  /*
    @param image an image loaded
    @param wr  weight of r
    @param wg  weight of g
    @param wb  weight of b
    
  */
  final int w = image.width;
  final int h = image.height;
  int[] values = new int[256];
  Arrays.fill(values, 0);
  for(int i = 0 ; i <w*h; i++){
    int r = (int) (red(image.pixels[i]));
    int g = (int) (green(image.pixels[i]));
    int b = (int) (blue(image.pixels[i]));

    int c = color(r,g,b);
    int brgh =  (int)(r*wr + g*wg + b*wb);

    values[brgh] += 1 ;
    // System.out.println("brigtness = "  + brightness(c));
    // System.out.println("average rgb = "  + (r + g + b) / 3);
  }
  
    // System.out.println("brigtarray = "  + values);
    int min = Arrays.stream(values).min().getAsInt();
    int max = Arrays.stream(values).max().getAsInt();
    // System.out.println("Min = " + min);
    // System.out.println("Max = " + max);

    return values;
}

//Class
class Chart{

  String title;
  //Initial positions
  float posX1; //left
  float posX2; //Right
  float posY1; //Top
  float posY2; //Bottom
  //Padings
  float paddingLeft  = 20.0;
  float paddingTop = 20.0;
  float paddingRight = 20.0 ;
  float paddingBottom = 20.0 ;
  //sizes
  float xSize;
  float ySize;
  //data
  int[] data;
  int max;
  
  //Relative position
  float[] relativeXPositions  = new float[256]; //pixels
  float[] relativeYPositions  = new float[256]; //pixels

  //Color
  color c;

  
  //constructor
  Chart(float posX1P, float posY1P, float xSizeP , float ySizeP, int[] dataP, String titleP, color colorP){
    /*
      @param posX1  initial position in the axis X
      @param posY1  initial position in the axis Y
      @param xSize  width  of chart
      @param ySize  height of chart
      @param data   data of chart
    */
    posX1 = posX1P;
    posY1 = posY1P;
    posX2 = posX1 + xSizeP;
    posY2 = posY1 + ySizeP;
    xSize = xSizeP;
    ySize = ySizeP;
    data  = dataP;
    max   = Arrays.stream(dataP).max().getAsInt();
    title = titleP;
    c = colorP;

  }
  void printInitPos(){
    System.out.println("xpos " + posX1);
    System.out.println("Ypos " + posY1);
  }
  void renderContainer(){
      rectMode(CORNERS);
      fill(#ffffff);
      rect(posX1 - paddingLeft, posY1 - paddingTop, posX2 + paddingRight, posY2 + paddingBottom);
  }
  void renderAreaChart(){
    stroke(#f5f5f5);
    fill(#f5f5f5);
    rect(posX1, posY1 , posX2 , posY2);
  }
  void renderXAxis(int segments){
    //render bottom line and labels
    strokeWeight(1);
    stroke(#000000);
    line(posX1, posY2 + 1, posX2 , posY2 + 1 );
    for(int i = 0; i < segments  + 1; i++){
      float x = posX1 + i* xSize/(segments + 1);
      stroke(#000000);
      line( x , posY2, x , posY2 + 5 );
      fill(#000000);
      textSize(10);
      text( i * 256/(segments + 1)  , x - 3 , posY2 + 15 );
    }
  }
  void renderTitle(){
    fill(#000000);
    textSize(10);
    text(title, posX1 + xSize/2.0 - 10 , posY1  ); 
  }
  void renderYAxis(int segments){
      //render y axis and stickLines with labels
      strokeWeight(1);
      stroke(#000000);
      line(posX1, posY2, posX1, posY1 );
      //stickyLine
      for(int i = 0; i < segments + 1 ; i++){
        float y = posY2 - i* ySize/(segments + 1);
        stroke(#ffffff);
        line( posX1 , y, posX2 , y);
        fill(#000000);
        textSize(10);
        text( i * max/(segments + 1)  , posX1  , y );
      }
  }
  void drawPoints(){
    final float sizeBin = xSize/256.0;
    for(int i = 0; i<  data.length; i++){
      float x = posX1 + i*sizeBin;
      float y = posY2  - ySize*data[i]/max;
      stroke(c);
      strokeWeight(1);
      line(x, posY2, x,  y);
      strokeWeight(2);
      point(x,y);
      relativeXPositions[i] = x;
      relativeYPositions[i] = y;
    }
    
  }

  void buildChart(){
    renderContainer();
    renderAreaChart();
    renderXAxis(15);
    renderYAxis(3);
    renderTitle();
    drawPoints();
  }
  float[] getXPositions(){
    return relativeXPositions;
  }
  float[] getYPositions(){
    return relativeYPositions;
  }
  void comparePostions(){
    for(int i = 0; i < relativeXPositions.length; i++){
      if(Math.abs(mouseX - relativeXPositions[i]) <  epsilon 
      //  && mouseY < paddingBottom + posY2 && mouseY > paddingTop + posY1 
      ){
        // System.out.println(mouseX);
        // System.out.println("pos" + xPositions[i]);
        // System.out.println("pos" + Math.abs(mouseX - xPositions[i]) );
        stroke(#A82811);
        strokeWeight(3);
        point(relativeXPositions[i], relativeYPositions[i]);
        text(data[i],  relativeXPositions[i] - 5, relativeYPositions[i] - 15 );
        textSize(9);
        text(i,  relativeXPositions[i] - 5,  posY2 + 2 );
      } 
    }
  }      

}
//
