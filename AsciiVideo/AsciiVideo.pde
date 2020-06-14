import processing.video.*;

Capture video;
boolean showScreen;

String letterOrder =
  " .`-_':,;^=+/\"|)\\<>)iv%xc" + 
  "lrs{*}I?!][1taeo7zjLunT#JCwf" +
  "y325Fp6mqSghVd4EgXPGZbYkOA&8" + 
  "U$@KHDBWNMR0Q";
char[] letters;

float[] bright;
char[] chars;

PFont font;
float fontSize = 2.5;

void setup() {
  size(640, 480);

  video = new Capture(this, 640, 480);
  
  video.start();  
  
  int count = video.width * video.height;

  font = loadFont("UniversLTStd-Light-48.vlw");

  letters = new char[256];
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letterOrder.length()));
    letters[i] = letterOrder.charAt(index);
  }

  chars = new char[count];

  bright = new float[count];
  for (int i = 0; i < count; i++) {
    bright[i] = 128;
  }
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  background(0);

  pushMatrix();

  float hgap = width / float(video.width);
  float vgap = height / float(video.height);

  scale(max(hgap, vgap) * fontSize);
  textFont(font, fontSize);

  int index = 0;
  video.loadPixels();
  for (int y = 1; y < video.height; y++) {
    translate(0,  1.0 / fontSize);

    pushMatrix();
    for (int x = 0; x < video.width; x++) {
      int pixelColor = video.pixels[index];

      int r = (pixelColor >> 16) & 0xff;
      int g = (pixelColor >> 8) & 0xff;
      int b = pixelColor & 0xff;

      int pixelBright = max(r, g, b);

      float diff = pixelBright - bright[index];
      bright[index] += diff * 0.1;

      fill(pixelColor);
      int num = int(bright[index]);
      text(letters[num], 0, 0);
      
      index++;

      translate(1.0 / fontSize, 0);
    }
    popMatrix();
  }
  popMatrix();

  if (showScreen) {
    set(0, height - video.height, video);
  }
}

/**
 * Funciones:
 * 's' guardar un frame
 * 'z' disminuir fuente un 5 %
 * 'x' aumentar fuente un 5 %
 * 'c' mostrar camara sin filtro ascii
 */
void keyPressed() {
  switch (key) {
    case 's': saveFrame(); break;
    case 'c': showScreen = !showScreen; break;
    case 'x': fontSize *= 1.05; break;
    case 'z': fontSize *= 0.95; break;
  }
}
